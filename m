Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6B4AD16CB
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 04:25:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E73AA10E009;
	Mon,  9 Jun 2025 02:25:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="c0kBymWW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8EA310E009
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jun 2025 02:25:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A89BCA414DD;
 Mon,  9 Jun 2025 02:24:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DFA7C4CEEE;
 Mon,  9 Jun 2025 02:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749435895;
 bh=JikvJDoUGRQoKS5a6Vqsu5jIrpZBcJJsqsOrm0ocGrw=;
 h=From:To:Cc:Subject:Date:From;
 b=c0kBymWWTh7UD9q9569esGrA+9QcPEo29In+ln9201+NdDWT6lX1mktfh2pJBFmS9
 y8EBbtDr9jOhVPacbjXTFgCjEivQa0ql7p1MuoO8FnwXFtYZu00grXhB5qet1eLLgi
 pqD3gGD3rxW8qIXNoQd9IE+pYwvmYb1MVa5eTFTdWvlgV1Q2EitgfeihgCiXAppaTn
 KN/oPjorbi27qMhvoPzVztIAA5c/2fPnTVaflKAdpYwCeSwmXZcB1oPO8LzNSzFVhj
 eCDZ+IWP+wjrfLjq1W6jpX3iaXrSjbo8G1l2kKyD3xfNDO2tMWmDeHIn7VwgETQdmr
 l8QWsZNByCILw==
From: Mario Limonciello <superm1@kernel.org>
To: mario.limonciello@amd.com,
	bhelgaas@google.com
Cc: dri-devel@lists.freedesktop.org,
	linux-pci@vger.kernel.org
Subject: [RFC PATCH] PCI/VGA: Look at all PCI display devices in VGA arbiter
Date: Sun,  8 Jun 2025 21:24:21 -0500
Message-ID: <20250609022435.348589-1-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
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

From: Mario Limonciello <mario.limonciello@amd.com>

On an A+N mobile system the APU is not being selected by some desktop
environments for any rendering tasks. This is because the neither GPU
is being treated as "boot_vga" but that is what some environments use
to select a GPU [1].

The VGA arbiter driver only looks at devices that report as PCI display
VGA class devices. Neither GPU on the system is a display VGA class
device:

c5:00.0 3D controller: NVIDIA Corporation Device 2db9 (rev a1)
c6:00.0 Display controller: Advanced Micro Devices, Inc. [AMD/ATI] Device 150e (rev d1)

So neither device gets the boot_vga sysfs file. The vga_is_boot_device()
function already has some handling for integrated GPUs by looking at the
ACPI HID entries, so if all PCI display class devices are looked at it
actually can detect properly with this device ordering.  However if there
is a different ordering it could flag the wrong device.

Modify the VGA arbiter code and matching sysfs file entries to examine all
PCI display class devices. After every device is added to the arbiter list
make a pass on all devices and explicitly check whether one is integrated.

This will cause all GPUs to gain a `boot_vga` file, but the correct device
(APU in this case) will now show `1` and the incorrect device shows `0`.
Userspace then picks the right device as well.

Link: https://github.com/robherring/libpciaccess/commit/b2838fb61c3542f107014b285cbda097acae1e12 [1]
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/pci/pci-sysfs.c |  2 +-
 drivers/pci/vgaarb.c    | 53 ++++++++++++++++++++++++++---------------
 include/linux/pci.h     | 15 ++++++++++++
 3 files changed, 50 insertions(+), 20 deletions(-)

diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
index 268c69daa4d57..c314ee1b3f9ac 100644
--- a/drivers/pci/pci-sysfs.c
+++ b/drivers/pci/pci-sysfs.c
@@ -1707,7 +1707,7 @@ static umode_t pci_dev_attrs_are_visible(struct kobject *kobj,
 	struct device *dev = kobj_to_dev(kobj);
 	struct pci_dev *pdev = to_pci_dev(dev);
 
-	if (a == &dev_attr_boot_vga.attr && pci_is_vga(pdev))
+	if (a == &dev_attr_boot_vga.attr && pci_is_display(pdev))
 		return a->mode;
 
 	return 0;
diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
index 78748e8d2dbae..8281144747487 100644
--- a/drivers/pci/vgaarb.c
+++ b/drivers/pci/vgaarb.c
@@ -139,7 +139,7 @@ void vga_set_default_device(struct pci_dev *pdev)
 {
 	if (vga_default == pdev)
 		return;
-
+	vgaarb_info(&pdev->dev, "selecting as VGA boot device\n");
 	pci_dev_put(vga_default);
 	vga_default = pci_dev_get(pdev);
 }
@@ -676,9 +676,9 @@ static bool vga_is_boot_device(struct vga_device *vgadev)
 	}
 
 	/*
-	 * Vgadev has neither IO nor MEM enabled.  If we haven't found any
-	 * other VGA devices, it is the best candidate so far.
-	 */
+	* Vgadev has neither IO nor MEM enabled.  If we haven't found any
+	* other VGA devices, it is the best candidate so far.
+	*/
 	if (!boot_vga)
 		return true;
 
@@ -751,6 +751,31 @@ static void vga_arbiter_check_bridge_sharing(struct vga_device *vgadev)
 		vgaarb_info(&vgadev->pdev->dev, "no bridge control possible\n");
 }
 
+static
+void vga_arbiter_select_default_device(void)
+{
+	struct pci_dev *candidate = vga_default_device();
+	struct vga_device *vgadev;
+
+	list_for_each_entry(vgadev, &vga_list, list) {
+		if (vga_is_boot_device(vgadev)) {
+			/* check if one is an integrated GPU, use that if so */
+			if (candidate) {
+				if (vga_arb_integrated_gpu(&candidate->dev))
+					break;
+				if (vga_arb_integrated_gpu(&vgadev->pdev->dev)) {
+					candidate = vgadev->pdev;
+					break;
+				}
+			} else
+				candidate = vgadev->pdev;
+		}
+	}
+
+	if (candidate)
+		vga_set_default_device(candidate);
+}
+
 /*
  * Currently, we assume that the "initial" setup of the system is not sane,
  * that is, we come up with conflicting devices and let the arbiter's
@@ -816,13 +841,6 @@ static bool vga_arbiter_add_pci_device(struct pci_dev *pdev)
 		bus = bus->parent;
 	}
 
-	if (vga_is_boot_device(vgadev)) {
-		vgaarb_info(&pdev->dev, "setting as boot VGA device%s\n",
-			    vga_default_device() ?
-			    " (overriding previous)" : "");
-		vga_set_default_device(pdev);
-	}
-
 	vga_arbiter_check_bridge_sharing(vgadev);
 
 	/* Add to the list */
@@ -833,6 +851,7 @@ static bool vga_arbiter_add_pci_device(struct pci_dev *pdev)
 		vga_iostate_to_str(vgadev->owns),
 		vga_iostate_to_str(vgadev->locks));
 
+	vga_arbiter_select_default_device();
 	spin_unlock_irqrestore(&vga_lock, flags);
 	return true;
 fail:
@@ -1499,8 +1518,8 @@ static int pci_notify(struct notifier_block *nb, unsigned long action,
 
 	vgaarb_dbg(dev, "%s\n", __func__);
 
-	/* Only deal with VGA class devices */
-	if (!pci_is_vga(pdev))
+	/* Only deal with display devices */
+	if (!pci_is_display(pdev))
 		return 0;
 
 	/*
@@ -1548,12 +1567,8 @@ static int __init vga_arb_device_init(void)
 
 	/* Add all VGA class PCI devices by default */
 	pdev = NULL;
-	while ((pdev =
-		pci_get_subsys(PCI_ANY_ID, PCI_ANY_ID, PCI_ANY_ID,
-			       PCI_ANY_ID, pdev)) != NULL) {
-		if (pci_is_vga(pdev))
-			vga_arbiter_add_pci_device(pdev);
-	}
+	while ((pdev = pci_get_base_class(PCI_BASE_CLASS_DISPLAY, pdev)))
+		vga_arbiter_add_pci_device(pdev);
 
 	pr_info("loaded\n");
 	return rc;
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 05e68f35f3923..e77754e43c629 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -744,6 +744,21 @@ static inline bool pci_is_vga(struct pci_dev *pdev)
 	return false;
 }
 
+/**
+ * pci_is_display - Check if a PCI device is a display controller
+ * @pdev: Pointer to the PCI device structure
+ *
+ * This function determines whether the given PCI device corresponds
+ * to a display controller. Display controllers are typically used
+ * for graphical output and are identified based on their class code.
+ *
+ * Return: true if the PCI device is a display controller, false otherwise.
+ */
+static inline bool pci_is_display(struct pci_dev *pdev)
+{
+	return (pdev->class >> 16) == PCI_BASE_CLASS_DISPLAY;
+}
+
 #define for_each_pci_bridge(dev, bus)				\
 	list_for_each_entry(dev, &bus->devices, bus_list)	\
 		if (!pci_is_bridge(dev)) {} else
-- 
2.43.0

