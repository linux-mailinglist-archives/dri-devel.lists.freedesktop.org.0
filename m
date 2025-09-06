Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5539EB47091
	for <lists+dri-devel@lfdr.de>; Sat,  6 Sep 2025 16:37:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4B8D10E3AF;
	Sat,  6 Sep 2025 14:37:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="T556EMN4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 690AA10E3AE;
 Sat,  6 Sep 2025 14:37:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4FF9A44EB3;
 Sat,  6 Sep 2025 14:37:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 376EBC4CEFA;
 Sat,  6 Sep 2025 14:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757169439;
 bh=xp1A/WiAs/39HI9qEtVLwjIBOQZbPgNqW6mMoXZvzw8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=T556EMN48YqsPEPLjHooxNv9hFqJGu4/XgeqgNXn+QRUrR0GJlC66uL/CSIl7krCO
 hQcc1DG5DpqggY9fRgK7yUdabSM7Muo9In+Fb7pSpKg78BDXaxEQ1GdN8VVZMB5a6m
 lipco592CGRQde3MtZ30YF6sifaaCEKC9sMwdGRpMVlV+j1wvaWmccCOZ877fgvxRG
 Zj60U+FlzKFuLEqt5PjROgna0dq6p0gP6XFI8x82ffoIislUqo4QS3Wtx6cTv4XB53
 MSW+FyCbR4KQ3oDCG/POfBbvjGznGaBVIXccJ7O0A3Q1tJpiNJh7iAISL7eooMTVjN
 rkmchMWzm1fbA==
From: "Mario Limonciello (AMD)" <superm1@kernel.org>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 linux-pm@vger.kernel.org (open list:HIBERNATION (aka Software Suspend,
 aka swsusp)), 
 amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-pci@vger.kernel.org (open list:PCI SUBSYSTEM),
 linux-scsi@vger.kernel.org (open list:SCSI SUBSYSTEM),
 linux-usb@vger.kernel.org (open list:USB SUBSYSTEM),
 linux-trace-kernel@vger.kernel.org (open list:TRACING),
 AceLan Kao <acelan.kao@canonical.com>, Kai-Heng Feng <kaihengf@nvidia.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 =?UTF-8?q?Merthan=20Karaka=C5=9F?= <m3rthn.k@gmail.com>,
 Eric Naim <dnaim@cachyos.org>,
 "Mario Limonciello (AMD)" <superm1@kernel.org>,
 Denis Benato <benato.denis96@gmail.com>
Subject: [PATCH v6 RESEND 09/11] PCI: Put PCIe bridges with downstream devices
 into D3 at hibernate
Date: Sat,  6 Sep 2025 09:36:40 -0500
Message-ID: <20250906143642.2590808-10-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250906143642.2590808-1-superm1@kernel.org>
References: <20250906143642.2590808-1-superm1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For the suspend flow PCIe bridges that have downstream devices are put into
the appropriate low power state (D3hot or D3cold depending upon specific
devices). For the hibernate flow, PCIe bridges with downstream devices
stay in D0 however. This can lead to PCIe bridges that are remained
powered on needlessly during hibernate.

Adjust the pci_pm_poweroff_noirq() to follow the same flow as
pci_pm_suspend_noirq() by using pci_pm_suspend_noirq_common().

This introduces a functional change that the hibernate flow will now
call pci_save_state() and unless bus PM is skipped will also set
the PCIe device into an unknown state.

Cc: AceLan Kao <acelan.kao@canonical.com>
Cc: Kai-Heng Feng <kaihengf@nvidia.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: Denis Benato <benato.denis96@gmail.com>
Cc: Merthan Karakaş <m3rthn.k@gmail.com>
Tested-by: Eric Naim <dnaim@cachyos.org>
Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
---
 drivers/pci/pci-driver.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
index c563fd6af979d..5eedfbb0be8a4 100644
--- a/drivers/pci/pci-driver.c
+++ b/drivers/pci/pci-driver.c
@@ -762,7 +762,7 @@ static void pci_pm_complete(struct device *dev)
 
 #endif /* !CONFIG_PM_SLEEP */
 
-#if defined(CONFIG_SUSPEND)
+#if defined(CONFIG_SUSPEND) || defined(CONFIG_HIBERNATE_CALLBACKS)
 /**
  * pci_pm_suspend_noirq_common
  * @pci_dev: pci device
@@ -808,7 +808,7 @@ static void pci_pm_suspend_noirq_common(struct pci_dev *pci_dev, bool *skip_bus_
 
 	pci_pm_set_unknown_state(pci_dev);
 }
-#endif /* CONFIG_SUSPEND */
+#endif /* CONFIG_SUSPEND || CONFIG_HIBERNATE_CALLBACKS */
 
 #ifdef CONFIG_SUSPEND
 static void pcie_pme_root_status_cleanup(struct pci_dev *pci_dev)
@@ -1164,6 +1164,8 @@ static int pci_pm_poweroff(struct device *dev)
 	    (system_state == SYSTEM_HALT || system_state == SYSTEM_POWER_OFF))
 		device_set_wakeup_enable(dev, false);
 
+	pci_dev->skip_bus_pm = false;
+
 	if (pci_has_legacy_pm_support(pci_dev))
 		return pci_legacy_suspend(dev, PMSG_HIBERNATE);
 
@@ -1206,6 +1208,7 @@ static int pci_pm_poweroff_noirq(struct device *dev)
 {
 	struct pci_dev *pci_dev = to_pci_dev(dev);
 	const struct dev_pm_ops *pm = dev->driver ? dev->driver->pm : NULL;
+	bool skip_bus_pm = false;
 
 	if (dev_pm_skip_suspend(dev))
 		return 0;
@@ -1227,8 +1230,9 @@ static int pci_pm_poweroff_noirq(struct device *dev)
 			return error;
 	}
 
-	if (!pci_dev->state_saved && pci_power_manageable(pci_dev))
-		pci_prepare_to_sleep(pci_dev);
+	pci_pm_suspend_noirq_common(pci_dev, &skip_bus_pm);
+	if (skip_bus_pm)
+		goto Fixup;
 
 	/*
 	 * The reason for doing this here is the same as for the analogous code
@@ -1237,6 +1241,7 @@ static int pci_pm_poweroff_noirq(struct device *dev)
 	if (pci_dev->class == PCI_CLASS_SERIAL_USB_EHCI)
 		pci_write_config_word(pci_dev, PCI_COMMAND, 0);
 
+Fixup:
 	pci_fixup_device(pci_fixup_suspend_late, pci_dev);
 
 	return 0;
-- 
2.43.0

