Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8399A6939E7
	for <lists+dri-devel@lfdr.de>; Sun, 12 Feb 2023 21:45:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD7D810E46D;
	Sun, 12 Feb 2023 20:45:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7526C10E468
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Feb 2023 20:45:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CB0F1B80D3A
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Feb 2023 20:45:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9DFEC4339B
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Feb 2023 20:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676234710;
 bh=7wzNzPrV7lHWOQafp+nge6epxI5v0vRJaUjkq/oT9os=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=luRZUEYRdVz0qaQyXbWVg4ZWa2XPJi10DUig7bAqg9ohnEaeeYDQ//NHrqhkf4CO2
 P7CaWQzHtMRypVqRkl04PQRBwOexEZIyB4laD8isHBf8lrfaPoNb2Zrn55MwVB+6iS
 kP4i3tX8Cn+CjOzmoOyiH78KSR7x0ozMSH44Ib99Fr3DQy4ZSZ1ax/gfbdm9Sxv+Ra
 +SLu9L99nqU00jiicbMZRwkQW8bKJvz7FKBeGiwFMYw4Yh4kkyMNU5MamwX71o/i2U
 zcR9FHfRl+b+CWYa/EsvwxFL0EKBcHx5RZUOErkCOHbagtZ+quB9tAUB7WeOb9Y3Mv
 SvkD4OTqzBeIQ==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 04/27] habanalabs: save class in hdev
Date: Sun, 12 Feb 2023 22:44:31 +0200
Message-Id: <20230212204454.2938561-4-ogabbay@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230212204454.2938561-1-ogabbay@kernel.org>
References: <20230212204454.2938561-1-ogabbay@kernel.org>
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

It is more concise than to pass it to device init. Once we will add the
accel class, then we won't need to change the function signatures.

Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/device.c         | 16 ++++++++--------
 drivers/accel/habanalabs/common/habanalabs.h     |  4 +++-
 drivers/accel/habanalabs/common/habanalabs_drv.c |  3 ++-
 3 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index ed26b7d20d19..194c282d7e55 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -617,7 +617,7 @@ static void device_release_func(struct device *dev)
  * device_init_cdev - Initialize cdev and device for habanalabs device
  *
  * @hdev: pointer to habanalabs device structure
- * @hclass: pointer to the class object of the device
+ * @class: pointer to the class object of the device
  * @minor: minor number of the specific device
  * @fpos: file operations to install for this device
  * @name: name of the device as it will appear in the filesystem
@@ -626,7 +626,7 @@ static void device_release_func(struct device *dev)
  *
  * Initialize a cdev and a Linux device for habanalabs's device.
  */
-static int device_init_cdev(struct hl_device *hdev, struct class *hclass,
+static int device_init_cdev(struct hl_device *hdev, struct class *class,
 				int minor, const struct file_operations *fops,
 				char *name, struct cdev *cdev,
 				struct device **dev)
@@ -640,7 +640,7 @@ static int device_init_cdev(struct hl_device *hdev, struct class *hclass,
 
 	device_initialize(*dev);
 	(*dev)->devt = MKDEV(hdev->major, minor);
-	(*dev)->class = hclass;
+	(*dev)->class = class;
 	(*dev)->release = device_release_func;
 	dev_set_drvdata(*dev, hdev);
 	dev_set_name(*dev, "%s", name);
@@ -1939,7 +1939,7 @@ void hl_notifier_event_send_all(struct hl_device *hdev, u64 event_mask)
 	mutex_unlock(&hdev->fpriv_ctrl_list_lock);
 }
 
-static int create_cdev(struct hl_device *hdev, struct class *hclass)
+static int create_cdev(struct hl_device *hdev)
 {
 	char *name;
 	int rc;
@@ -1953,7 +1953,7 @@ static int create_cdev(struct hl_device *hdev, struct class *hclass)
 	}
 
 	/* Initialize cdev and device structures */
-	rc = device_init_cdev(hdev, hclass, hdev->id, &hl_ops, name,
+	rc = device_init_cdev(hdev, hdev->hclass, hdev->id, &hl_ops, name,
 				&hdev->cdev, &hdev->dev);
 
 	kfree(name);
@@ -1968,7 +1968,7 @@ static int create_cdev(struct hl_device *hdev, struct class *hclass)
 	}
 
 	/* Initialize cdev and device structures for control device */
-	rc = device_init_cdev(hdev, hclass, hdev->id_control, &hl_ctrl_ops,
+	rc = device_init_cdev(hdev, hdev->hclass, hdev->id_control, &hl_ctrl_ops,
 				name, &hdev->cdev_ctrl, &hdev->dev_ctrl);
 
 	kfree(name);
@@ -1993,12 +1993,12 @@ static int create_cdev(struct hl_device *hdev, struct class *hclass)
  * ASIC specific initialization functions. Finally, create the cdev and the
  * Linux device to expose it to the user
  */
-int hl_device_init(struct hl_device *hdev, struct class *hclass)
+int hl_device_init(struct hl_device *hdev)
 {
 	int i, rc, cq_cnt, user_interrupt_cnt, cq_ready_cnt;
 	bool add_cdev_sysfs_on_err = false;
 
-	rc = create_cdev(hdev, hclass);
+	rc = create_cdev(hdev);
 	if (rc)
 		goto out_disabled;
 
diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
index fa05e76d3d21..d98e6c0feb24 100644
--- a/drivers/accel/habanalabs/common/habanalabs.h
+++ b/drivers/accel/habanalabs/common/habanalabs.h
@@ -3090,6 +3090,7 @@ struct hl_reset_info {
  *		   (required only for PCI address match mode)
  * @pcie_bar: array of available PCIe bars virtual addresses.
  * @rmmio: configuration area address on SRAM.
+ * @hclass: pointer to the habanalabs class.
  * @cdev: related char device.
  * @cdev_ctrl: char device for control operations only (INFO IOCTL)
  * @dev: related kernel basic device structure.
@@ -3274,6 +3275,7 @@ struct hl_device {
 	u64				pcie_bar_phys[HL_PCI_NUM_BARS];
 	void __iomem			*pcie_bar[HL_PCI_NUM_BARS];
 	void __iomem			*rmmio;
+	struct class			*hclass;
 	struct cdev			cdev;
 	struct cdev			cdev_ctrl;
 	struct device			*dev;
@@ -3612,7 +3614,7 @@ int hl_ctx_get_fences(struct hl_ctx *ctx, u64 *seq_arr,
 void hl_ctx_mgr_init(struct hl_ctx_mgr *mgr);
 void hl_ctx_mgr_fini(struct hl_device *hdev, struct hl_ctx_mgr *mgr);
 
-int hl_device_init(struct hl_device *hdev, struct class *hclass);
+int hl_device_init(struct hl_device *hdev);
 void hl_device_fini(struct hl_device *hdev);
 int hl_device_suspend(struct hl_device *hdev);
 int hl_device_resume(struct hl_device *hdev);
diff --git a/drivers/accel/habanalabs/common/habanalabs_drv.c b/drivers/accel/habanalabs/common/habanalabs_drv.c
index 03dae57dc838..8ccc3d6519b5 100644
--- a/drivers/accel/habanalabs/common/habanalabs_drv.c
+++ b/drivers/accel/habanalabs/common/habanalabs_drv.c
@@ -324,6 +324,7 @@ static void copy_kernel_module_params_to_device(struct hl_device *hdev)
 	hdev->asic_prop.fw_security_enabled = is_asic_secured(hdev->asic_type);
 
 	hdev->major = hl_major;
+	hdev->hclass = hl_class;
 	hdev->memory_scrub = memory_scrub;
 	hdev->reset_on_lockup = reset_on_lockup;
 	hdev->boot_error_status_mask = boot_error_status_mask;
@@ -552,7 +553,7 @@ static int hl_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	pci_enable_pcie_error_reporting(pdev);
 
-	rc = hl_device_init(hdev, hl_class);
+	rc = hl_device_init(hdev);
 	if (rc) {
 		dev_err(&pdev->dev, "Fatal error during habanalabs device init\n");
 		rc = -ENODEV;
-- 
2.25.1

