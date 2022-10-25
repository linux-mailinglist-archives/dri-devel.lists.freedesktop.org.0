Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E53460D5C3
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 22:40:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C15B710E32E;
	Tue, 25 Oct 2022 20:40:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80B1A10E41C
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Oct 2022 20:39:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EA5FAB81E88;
 Tue, 25 Oct 2022 20:39:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72DF9C433C1;
 Tue, 25 Oct 2022 20:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666730346;
 bh=vCVXdFd/vOJXZ5Ft1C9G2B9SS3OtMyZNZFuvq1nhZBU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=D8wzUcoDPeAJB096khZ8JyEU6r0mOW1CQ/O+2NeKYhPNYW7b8yQvH8TqGLqxkOtw2
 RHDkkr8PWqIYyp+5rOtSlyeMBPdMtdLTjJdqq4jb2r5FlQLwlWZivRKUuXcahjEV/P
 FTddle25VtNJDm2ponpgOVIBNE6OixgfF5MNdjk3qb3y7ZBCPjnVny8+ld0ZtRJX6y
 xhD9mzSCCrnm6qRU6jljCJNSAEn5jCEvEEqhyJnnjjiHwuqf+jdRAjCyG36UENQYZe
 9casbCa3wXXas87x9KSs6l8OCIp7aluPD4D5qnHfr9yu+CUoopyMF/bZ0gUVcmBH2h
 60NDA9fbqEXnQ==
From: Bjorn Helgaas <helgaas@kernel.org>
To: David Airlie <airlied@redhat.com>
Subject: [PATCH v2 4/8] agp/ati: Convert to generic power management
Date: Tue, 25 Oct 2022 15:38:48 -0500
Message-Id: <20221025203852.681822-5-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221025203852.681822-1-helgaas@kernel.org>
References: <20221025203852.681822-1-helgaas@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 linux-pm@vger.kernel.org, linux-pci@vger.kernel.org,
 Vaibhav Gupta <vaibhavgupta40@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Helgaas <bhelgaas@google.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Bjorn Helgaas <bhelgaas@google.com>

Convert agpgart-ati from legacy PCI power management to the generic power
management framework.

Previously agpgart-ati used legacy PCI power management, and
agp_ati_suspend() and agp_ati_resume() were responsible for both
device-specific things and generic PCI things like saving and restoring
config space and managing power state:

  agp_ati_suspend
    pci_save_state                         <-- generic PCI
    pci_set_power_state(PCI_D3hot)         <-- generic PCI

  agp_ati_resume
    pci_set_power_state(PCI_D0)            <-- generic PCI
    pci_restore_state                      <-- generic PCI
    ati_configure                          <-- device-specific

With generic power management, the PCI bus PM methods do the generic PCI
things, and the driver needs only the device-specific part, i.e.,

  suspend_devices_and_enter
    dpm_suspend_start(PMSG_SUSPEND)
      pci_pm_suspend                       # PCI bus .suspend() method
        agp_ati_suspend                    <-- not needed at all; removed
    suspend_enter
      dpm_suspend_noirq(PMSG_SUSPEND)
        pci_pm_suspend_noirq               # PCI bus .suspend_noirq() method
          pci_save_state                   <-- generic PCI
          pci_prepare_to_sleep             <-- generic PCI
            pci_set_power_state
    ...
    dpm_resume_end(PMSG_RESUME)
      pci_pm_resume                        # PCI bus .resume() method
        pci_restore_standard_config
          pci_set_power_state(PCI_D0)      <-- generic PCI
          pci_restore_state                <-- generic PCI
        agp_ati_resume                     # driver->pm->resume
          ati_configure                    <-- device-specific

Based on 0aeddbd0cb07 ("via-agp: convert to generic power management") by
Vaibhav Gupta <vaibhavgupta40@gmail.com>.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/char/agp/ati-agp.c | 22 ++++------------------
 1 file changed, 4 insertions(+), 18 deletions(-)

diff --git a/drivers/char/agp/ati-agp.c b/drivers/char/agp/ati-agp.c
index 6f5530482d83..3c1fce48aabe 100644
--- a/drivers/char/agp/ati-agp.c
+++ b/drivers/char/agp/ati-agp.c
@@ -238,23 +238,10 @@ static int ati_configure(void)
 }
 
 
-#ifdef CONFIG_PM
-static int agp_ati_suspend(struct pci_dev *dev, pm_message_t state)
+static int agp_ati_resume(struct device *dev)
 {
-	pci_save_state(dev);
-	pci_set_power_state(dev, PCI_D3hot);
-
-	return 0;
-}
-
-static int agp_ati_resume(struct pci_dev *dev)
-{
-	pci_set_power_state(dev, PCI_D0);
-	pci_restore_state(dev);
-
 	return ati_configure();
 }
-#endif
 
 /*
  *Since we don't need contiguous memory we just try
@@ -559,15 +546,14 @@ static const struct pci_device_id agp_ati_pci_table[] = {
 
 MODULE_DEVICE_TABLE(pci, agp_ati_pci_table);
 
+static DEFINE_SIMPLE_DEV_PM_OPS(agp_ati_pm_ops, NULL, agp_ati_resume);
+
 static struct pci_driver agp_ati_pci_driver = {
 	.name		= "agpgart-ati",
 	.id_table	= agp_ati_pci_table,
 	.probe		= agp_ati_probe,
 	.remove		= agp_ati_remove,
-#ifdef CONFIG_PM
-	.suspend	= agp_ati_suspend,
-	.resume		= agp_ati_resume,
-#endif
+	.driver.pm	= &agp_ati_pm_ops,
 };
 
 static int __init agp_ati_init(void)
-- 
2.25.1

