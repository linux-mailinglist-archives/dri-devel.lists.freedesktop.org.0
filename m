Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF42160D5BF
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 22:40:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0B7910E274;
	Tue, 25 Oct 2022 20:39:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 424D310E16B
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Oct 2022 20:39:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A107961B89;
 Tue, 25 Oct 2022 20:39:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1D08C433D6;
 Tue, 25 Oct 2022 20:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666730343;
 bh=MvbJy3JxdO3ShsrhkWcJG0ADbJX6DM/ql5rIFpCUTAw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MRJFtTL3yE5rbOVqjRdQwIY+nvkQweZHqDhluMjuI+hY4L2YO6v1JrH0q5KB9Hvsj
 OEkJmdpI7YSMNZ5N04fesYTqbHp1N0JiCnRwSQjbAfo0y6ALvFaIG7sMGGsogYJRYY
 7cCP1sCMOWWX7VOza9Bj5hatOelFi5JFSati+L+6NUFOCKnLBabkkIDSx+ySFAZRn7
 zYZc46w71OSDkWRVTzypggKvowHjlOtXFeCsljVl7PvbKto4k43qCPVOjVpj+YSuvL
 KpsEDwspvDMxLIS1JjHAhqsBjlPy1XMkbycWf+iZwlmNUUztQ0towjJ+gmuoxtDCCW
 N6IRxVPDOskaw==
From: Bjorn Helgaas <helgaas@kernel.org>
To: David Airlie <airlied@redhat.com>
Subject: [PATCH v2 2/8] agp/intel: Convert to generic power management
Date: Tue, 25 Oct 2022 15:38:46 -0500
Message-Id: <20221025203852.681822-3-helgaas@kernel.org>
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

Convert agpgart-intel from legacy PCI power management to the generic power
management framework.

Previously agpgart-intel used legacy PCI power management, and
agp_intel_resume() was responsible for both device-specific things and
generic PCI things like saving and restoring config space and managing
power state.

In this case, agp_intel_suspend() was empty, and agp_intel_resume()
already did only device-specific things, so simply convert it to take a
struct device * instead of a struct pci_dev *.

Based on 0aeddbd0cb07 ("via-agp: convert to generic power management") by
Vaibhav Gupta <vaibhavgupta40@gmail.com>.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/char/agp/intel-agp.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/char/agp/intel-agp.c b/drivers/char/agp/intel-agp.c
index 9e4f27a6cb5a..c518b3a9db04 100644
--- a/drivers/char/agp/intel-agp.c
+++ b/drivers/char/agp/intel-agp.c
@@ -817,16 +817,15 @@ static void agp_intel_remove(struct pci_dev *pdev)
 	agp_put_bridge(bridge);
 }
 
-#ifdef CONFIG_PM
-static int agp_intel_resume(struct pci_dev *pdev)
+static int agp_intel_resume(struct device *dev)
 {
+	struct pci_dev *pdev = to_pci_dev(dev);
 	struct agp_bridge_data *bridge = pci_get_drvdata(pdev);
 
 	bridge->driver->configure();
 
 	return 0;
 }
-#endif
 
 static const struct pci_device_id agp_intel_pci_table[] = {
 #define ID(x)						\
@@ -895,14 +894,14 @@ static const struct pci_device_id agp_intel_pci_table[] = {
 
 MODULE_DEVICE_TABLE(pci, agp_intel_pci_table);
 
+static DEFINE_SIMPLE_DEV_PM_OPS(agp_intel_pm_ops, NULL, agp_intel_resume);
+
 static struct pci_driver agp_intel_pci_driver = {
 	.name		= "agpgart-intel",
 	.id_table	= agp_intel_pci_table,
 	.probe		= agp_intel_probe,
 	.remove		= agp_intel_remove,
-#ifdef CONFIG_PM
-	.resume		= agp_intel_resume,
-#endif
+	.driver.pm	= &agp_intel_pm_ops,
 };
 
 static int __init agp_intel_init(void)
-- 
2.25.1

