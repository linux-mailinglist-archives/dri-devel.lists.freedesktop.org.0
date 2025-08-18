Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 515BDB29672
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 04:01:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A07F710E31D;
	Mon, 18 Aug 2025 02:01:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bstCRNe7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59C1010E325;
 Mon, 18 Aug 2025 02:01:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4000144932;
 Mon, 18 Aug 2025 02:01:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C65FC4CEF4;
 Mon, 18 Aug 2025 02:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755482485;
 bh=XxmDbp+Gl7Em9FTRsxGLU8Z8numECcu57RGTZraG8Xk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bstCRNe7sSTI7R/3ariorIaZW61r5x2O+TgwY/XoVwemLr4j/8bSYua+eGPYjSV6M
 MgRKtWOKhUGU4LjFBDoUx+IbJiIzLAbTrzj5ZScKGVIgqXW1rzcf4w6rKMQIC/6pf2
 f2XjqIuYiO5HQOqMQlzlFoL/gEiBKAzZJjnwGFg3dZQOBoJbmmAF0Y1f8oLzHOXh9g
 GbDyURl1nRowWbGD1N5zkKOOw+CizXv9ay+U8EvMp8Ran+ZfCgfUzJlNgC9wfYtqJI
 2xwMCrQE/UXvaL2pZoLSrj9QMlVwQQYuId5OczCvSmne4XaKDkrjYf9nm3RTBY3AVI
 GsQrV4wz0iFlw==
From: "Mario Limonciello (AMD)" <superm1@kernel.org>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>
Cc: Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>,
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
 "Mario Limonciello (AMD)" <superm1@kernel.org>
Subject: [PATCH v6 06/11] PCI: PM: Split out code from pci_pm_suspend_noirq()
 into helper
Date: Sun, 17 Aug 2025 21:00:56 -0500
Message-ID: <20250818020101.3619237-7-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250818020101.3619237-1-superm1@kernel.org>
References: <20250818020101.3619237-1-superm1@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to unify suspend and hibernate codepaths without code duplication
the common code should be in common helpers.  Move it from
pci_pm_suspend_noirq() into a helper.  No intended functional changes.

Tested-by: Eric Naim <dnaim@cachyos.org>
Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
---
v5:
 * Split from earlier patches
 * Add tags
v4:
 * https://lore.kernel.org/linux-pci/20250616175019.3471583-1-superm1@kernel.org/
---
 drivers/pci/pci-driver.c | 81 +++++++++++++++++++++++++---------------
 1 file changed, 51 insertions(+), 30 deletions(-)

diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
index f201d298d7173..571a3809f163a 100644
--- a/drivers/pci/pci-driver.c
+++ b/drivers/pci/pci-driver.c
@@ -762,6 +762,54 @@ static void pci_pm_complete(struct device *dev)
 
 #endif /* !CONFIG_PM_SLEEP */
 
+#if defined(CONFIG_SUSPEND)
+/**
+ * pci_pm_suspend_noirq_common
+ * @pci_dev: pci device
+ * @skip_bus_pm: pointer to a boolean indicating whether to skip bus PM
+ *
+ * Prepare the device to go into a low power state by saving state and
+ * deciding whether to skip bus PM.
+ *
+ */
+static void pci_pm_suspend_noirq_common(struct pci_dev *pci_dev, bool *skip_bus_pm)
+{
+	if (!pci_dev->state_saved) {
+		pci_save_state(pci_dev);
+
+		/*
+		 * If the device is a bridge with a child in D0 below it,
+		 * it needs to stay in D0, so check skip_bus_pm to avoid
+		 * putting it into a low-power state in that case.
+		 */
+		if (!pci_dev->skip_bus_pm && pci_power_manageable(pci_dev))
+			pci_prepare_to_sleep(pci_dev);
+	}
+
+	pci_dbg(pci_dev, "PCI PM: Sleep power state: %s\n",
+		pci_power_name(pci_dev->current_state));
+
+	if (pci_dev->current_state == PCI_D0) {
+		pci_dev->skip_bus_pm = true;
+		/*
+		 * Per PCI PM r1.2, table 6-1, a bridge must be in D0 if any
+		 * downstream device is in D0, so avoid changing the power state
+		 * of the parent bridge by setting the skip_bus_pm flag for it.
+		 */
+		if (pci_dev->bus->self)
+			pci_dev->bus->self->skip_bus_pm = true;
+	}
+
+	if (pci_dev->skip_bus_pm && pm_suspend_no_platform()) {
+		pci_dbg(pci_dev, "PCI PM: Skipped\n");
+		*skip_bus_pm = true;
+		return;
+	}
+
+	pci_pm_set_unknown_state(pci_dev);
+}
+#endif /* CONFIG_SUSPEND */
+
 #ifdef CONFIG_SUSPEND
 static void pcie_pme_root_status_cleanup(struct pci_dev *pci_dev)
 {
@@ -851,6 +899,7 @@ static int pci_pm_suspend_noirq(struct device *dev)
 {
 	struct pci_dev *pci_dev = to_pci_dev(dev);
 	const struct dev_pm_ops *pm = dev->driver ? dev->driver->pm : NULL;
+	bool skip_bus_pm = false;
 
 	if (dev_pm_skip_suspend(dev))
 		return 0;
@@ -881,38 +930,10 @@ static int pci_pm_suspend_noirq(struct device *dev)
 		}
 	}
 
-	if (!pci_dev->state_saved) {
-		pci_save_state(pci_dev);
-
-		/*
-		 * If the device is a bridge with a child in D0 below it,
-		 * it needs to stay in D0, so check skip_bus_pm to avoid
-		 * putting it into a low-power state in that case.
-		 */
-		if (!pci_dev->skip_bus_pm && pci_power_manageable(pci_dev))
-			pci_prepare_to_sleep(pci_dev);
-	}
-
-	pci_dbg(pci_dev, "PCI PM: Suspend power state: %s\n",
-		pci_power_name(pci_dev->current_state));
+	pci_pm_suspend_noirq_common(pci_dev, &skip_bus_pm);
 
-	if (pci_dev->current_state == PCI_D0) {
-		pci_dev->skip_bus_pm = true;
-		/*
-		 * Per PCI PM r1.2, table 6-1, a bridge must be in D0 if any
-		 * downstream device is in D0, so avoid changing the power state
-		 * of the parent bridge by setting the skip_bus_pm flag for it.
-		 */
-		if (pci_dev->bus->self)
-			pci_dev->bus->self->skip_bus_pm = true;
-	}
-
-	if (pci_dev->skip_bus_pm && pm_suspend_no_platform()) {
-		pci_dbg(pci_dev, "PCI PM: Skipped\n");
+	if (skip_bus_pm)
 		goto Fixup;
-	}
-
-	pci_pm_set_unknown_state(pci_dev);
 
 	/*
 	 * Some BIOSes from ASUS have a bug: If a USB EHCI host controller's
-- 
2.43.0

