Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FB96F2FF4
	for <lists+dri-devel@lfdr.de>; Mon,  1 May 2023 11:48:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43F3F10E315;
	Mon,  1 May 2023 09:48:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98F0510E223
 for <dri-devel@lists.freedesktop.org>; Mon,  1 May 2023 09:48:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F3FF260C12;
 Mon,  1 May 2023 09:48:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CFFEC433EF;
 Mon,  1 May 2023 09:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682934483;
 bh=ja+ZCwMRg9UzW7YI9W2BAIW77mgPcJJMcMcDfaGWTIQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TjkJG0FKB8XYZzS+cCJZXAWA/J/Fj+JhbB4fVVeY1NizBaCOMzBC12CGdqXOLou7b
 Uwjd3gntWfbpaLR8A9JUChk9gkL65g1iGvkfEDZpfyvROUuFMXrzmfz4yUumOGNses
 eiJzVOK2qj8WFxP2zovLc1X7SqvmWOrwZUEoUaIB+ICMEQIkMt3jJbn/4gf21Om7vP
 wbFJxckL0yQex0bkujMLiXMyxbdXWXF5P3PFH/zDeip/VAm/0r6MThAXKqASsqnsnO
 tXx9josyLQ+uCsQ9R8yTR8vp9DDZVlD5lo+1m65hAVCDXMCtISkJ3zM17BO6Jyd1aE
 gHS5On4B96ixA==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/6] accel/habanalabs: expose debugfs files later
Date: Mon,  1 May 2023 12:47:51 +0300
Message-Id: <20230501094754.100030-3-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230501094754.100030-1-ogabbay@kernel.org>
References: <20230501094754.100030-1-ogabbay@kernel.org>
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
Cc: Tomer Tayar <ttayar@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tomer Tayar <ttayar@habana.ai>

Currently the debugfs root folder and files for a device are created at
an early step, before the device initialization and before the char
device and sysfs files are exposed to user.
As there is no real reason not to do it together with the device
creation, postpone it to be done right afterwards.

The initialization of the debugfs entry structure is left in its
current position because it is used before creating the files.

Signed-off-by: Tomer Tayar <ttayar@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/debugfs.c    | 37 +++++++-----
 drivers/accel/habanalabs/common/device.c     | 62 +++++++++++---------
 drivers/accel/habanalabs/common/habanalabs.h |  6 +-
 3 files changed, 61 insertions(+), 44 deletions(-)

diff --git a/drivers/accel/habanalabs/common/debugfs.c b/drivers/accel/habanalabs/common/debugfs.c
index 22dd17c077c0..29b78c7cf5de 100644
--- a/drivers/accel/habanalabs/common/debugfs.c
+++ b/drivers/accel/habanalabs/common/debugfs.c
@@ -1756,17 +1756,15 @@ static void add_files_to_device(struct hl_device *hdev, struct hl_dbg_device_ent
 	}
 }
 
-void hl_debugfs_add_device(struct hl_device *hdev)
+int hl_debugfs_device_init(struct hl_device *hdev)
 {
 	struct hl_dbg_device_entry *dev_entry = &hdev->hl_debugfs;
 	int count = ARRAY_SIZE(hl_debugfs_list);
 
 	dev_entry->hdev = hdev;
-	dev_entry->entry_arr = kmalloc_array(count,
-					sizeof(struct hl_debugfs_entry),
-					GFP_KERNEL);
+	dev_entry->entry_arr = kmalloc_array(count, sizeof(struct hl_debugfs_entry), GFP_KERNEL);
 	if (!dev_entry->entry_arr)
-		return;
+		return -ENOMEM;
 
 	dev_entry->data_dma_blob_desc.size = 0;
 	dev_entry->data_dma_blob_desc.data = NULL;
@@ -1787,21 +1785,14 @@ void hl_debugfs_add_device(struct hl_device *hdev)
 	spin_lock_init(&dev_entry->userptr_spinlock);
 	mutex_init(&dev_entry->ctx_mem_hash_mutex);
 
-	dev_entry->root = debugfs_create_dir(dev_name(hdev->dev),
-						hl_debug_root);
-
-	add_files_to_device(hdev, dev_entry, dev_entry->root);
-	if (!hdev->asic_prop.fw_security_enabled)
-		add_secured_nodes(dev_entry, dev_entry->root);
+	return 0;
 }
 
-void hl_debugfs_remove_device(struct hl_device *hdev)
+void hl_debugfs_device_fini(struct hl_device *hdev)
 {
 	struct hl_dbg_device_entry *entry = &hdev->hl_debugfs;
 	int i;
 
-	debugfs_remove_recursive(entry->root);
-
 	mutex_destroy(&entry->ctx_mem_hash_mutex);
 	mutex_destroy(&entry->file_mutex);
 
@@ -1814,6 +1805,24 @@ void hl_debugfs_remove_device(struct hl_device *hdev)
 	kfree(entry->entry_arr);
 }
 
+void hl_debugfs_add_device(struct hl_device *hdev)
+{
+	struct hl_dbg_device_entry *dev_entry = &hdev->hl_debugfs;
+
+	dev_entry->root = debugfs_create_dir(dev_name(hdev->dev), hl_debug_root);
+
+	add_files_to_device(hdev, dev_entry, dev_entry->root);
+	if (!hdev->asic_prop.fw_security_enabled)
+		add_secured_nodes(dev_entry, dev_entry->root);
+}
+
+void hl_debugfs_remove_device(struct hl_device *hdev)
+{
+	struct hl_dbg_device_entry *entry = &hdev->hl_debugfs;
+
+	debugfs_remove_recursive(entry->root);
+}
+
 void hl_debugfs_add_file(struct hl_fpriv *hpriv)
 {
 	struct hl_dbg_device_entry *dev_entry = &hpriv->hdev->hl_debugfs;
diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index 98b46b2e1898..cab5a63db8c1 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -674,7 +674,7 @@ static int device_init_cdev(struct hl_device *hdev, struct class *class,
 	return 0;
 }
 
-static int device_cdev_sysfs_add(struct hl_device *hdev)
+static int cdev_sysfs_debugfs_add(struct hl_device *hdev)
 {
 	int rc;
 
@@ -699,7 +699,9 @@ static int device_cdev_sysfs_add(struct hl_device *hdev)
 		goto delete_ctrl_cdev_device;
 	}
 
-	hdev->cdev_sysfs_created = true;
+	hl_debugfs_add_device(hdev);
+
+	hdev->cdev_sysfs_debugfs_created = true;
 
 	return 0;
 
@@ -710,11 +712,12 @@ static int device_cdev_sysfs_add(struct hl_device *hdev)
 	return rc;
 }
 
-static void device_cdev_sysfs_del(struct hl_device *hdev)
+static void cdev_sysfs_debugfs_remove(struct hl_device *hdev)
 {
-	if (!hdev->cdev_sysfs_created)
+	if (!hdev->cdev_sysfs_debugfs_created)
 		goto put_devices;
 
+	hl_debugfs_remove_device(hdev);
 	hl_sysfs_fini(hdev);
 	cdev_device_del(&hdev->cdev_ctrl, hdev->dev_ctrl);
 	cdev_device_del(&hdev->cdev, hdev->dev);
@@ -2054,7 +2057,7 @@ static int create_cdev(struct hl_device *hdev)
 int hl_device_init(struct hl_device *hdev)
 {
 	int i, rc, cq_cnt, user_interrupt_cnt, cq_ready_cnt;
-	bool add_cdev_sysfs_on_err = false;
+	bool expose_interfaces_on_err = false;
 
 	rc = create_cdev(hdev);
 	if (rc)
@@ -2170,16 +2173,22 @@ int hl_device_init(struct hl_device *hdev)
 	hdev->device_release_watchdog_timeout_sec = HL_DEVICE_RELEASE_WATCHDOG_TIMEOUT_SEC;
 
 	hdev->memory_scrub_val = MEM_SCRUB_DEFAULT_VAL;
-	hl_debugfs_add_device(hdev);
 
-	/* debugfs nodes are created in hl_ctx_init so it must be called after
-	 * hl_debugfs_add_device.
+	rc = hl_debugfs_device_init(hdev);
+	if (rc) {
+		dev_err(hdev->dev, "failed to initialize debugfs entry structure\n");
+		kfree(hdev->kernel_ctx);
+		goto mmu_fini;
+	}
+
+	/* The debugfs entry structure is accessed in hl_ctx_init(), so it must be called after
+	 * hl_debugfs_device_init().
 	 */
 	rc = hl_ctx_init(hdev, hdev->kernel_ctx, true);
 	if (rc) {
 		dev_err(hdev->dev, "failed to initialize kernel context\n");
 		kfree(hdev->kernel_ctx);
-		goto remove_device_from_debugfs;
+		goto debugfs_device_fini;
 	}
 
 	rc = hl_cb_pool_init(hdev);
@@ -2195,11 +2204,10 @@ int hl_device_init(struct hl_device *hdev)
 	}
 
 	/*
-	 * From this point, override rc (=0) in case of an error to allow
-	 * debugging (by adding char devices and create sysfs nodes as part of
-	 * the error flow).
+	 * From this point, override rc (=0) in case of an error to allow debugging
+	 * (by adding char devices and creating sysfs/debugfs files as part of the error flow).
 	 */
-	add_cdev_sysfs_on_err = true;
+	expose_interfaces_on_err = true;
 
 	/* Device is now enabled as part of the initialization requires
 	 * communication with the device firmware to get information that
@@ -2241,15 +2249,13 @@ int hl_device_init(struct hl_device *hdev)
 	}
 
 	/*
-	 * Expose devices and sysfs nodes to user.
-	 * From here there is no need to add char devices and create sysfs nodes
-	 * in case of an error.
+	 * Expose devices and sysfs/debugfs files to user.
+	 * From here there is no need to expose them in case of an error.
 	 */
-	add_cdev_sysfs_on_err = false;
-	rc = device_cdev_sysfs_add(hdev);
+	expose_interfaces_on_err = false;
+	rc = cdev_sysfs_debugfs_add(hdev);
 	if (rc) {
-		dev_err(hdev->dev,
-			"Failed to add char devices and sysfs nodes\n");
+		dev_err(hdev->dev, "Failed to add char devices and sysfs/debugfs files\n");
 		rc = 0;
 		goto out_disabled;
 	}
@@ -2295,8 +2301,8 @@ int hl_device_init(struct hl_device *hdev)
 	if (hl_ctx_put(hdev->kernel_ctx) != 1)
 		dev_err(hdev->dev,
 			"kernel ctx is still alive on initialization failure\n");
-remove_device_from_debugfs:
-	hl_debugfs_remove_device(hdev);
+debugfs_device_fini:
+	hl_debugfs_device_fini(hdev);
 mmu_fini:
 	hl_mmu_fini(hdev);
 eq_fini:
@@ -2320,8 +2326,8 @@ int hl_device_init(struct hl_device *hdev)
 	put_device(hdev->dev);
 out_disabled:
 	hdev->disabled = true;
-	if (add_cdev_sysfs_on_err)
-		device_cdev_sysfs_add(hdev);
+	if (expose_interfaces_on_err)
+		cdev_sysfs_debugfs_add(hdev);
 	if (hdev->pdev)
 		dev_err(&hdev->pdev->dev,
 			"Failed to initialize hl%d. Device %s is NOT usable !\n",
@@ -2447,8 +2453,6 @@ void hl_device_fini(struct hl_device *hdev)
 	if ((hdev->kernel_ctx) && (hl_ctx_put(hdev->kernel_ctx) != 1))
 		dev_err(hdev->dev, "kernel ctx is still alive\n");
 
-	hl_debugfs_remove_device(hdev);
-
 	hl_dec_fini(hdev);
 
 	hl_vm_fini(hdev);
@@ -2473,8 +2477,10 @@ void hl_device_fini(struct hl_device *hdev)
 
 	device_early_fini(hdev);
 
-	/* Hide devices and sysfs nodes from user */
-	device_cdev_sysfs_del(hdev);
+	/* Hide devices and sysfs/debugfs files from user */
+	cdev_sysfs_debugfs_remove(hdev);
+
+	hl_debugfs_device_fini(hdev);
 
 	pr_info("removed device successfully\n");
 }
diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
index ad412cc01aba..ea0914d08bdc 100644
--- a/drivers/accel/habanalabs/common/habanalabs.h
+++ b/drivers/accel/habanalabs/common/habanalabs.h
@@ -3292,7 +3292,7 @@ struct hl_reset_info {
  * @in_debug: whether the device is in a state where the profiling/tracing infrastructure
  *            can be used. This indication is needed because in some ASICs we need to do
  *            specific operations to enable that infrastructure.
- * @cdev_sysfs_created: were char devices and sysfs nodes created.
+ * @cdev_sysfs_debugfs_created: were char devices and sysfs/debugfs files created.
  * @stop_on_err: true if engines should stop on error.
  * @supports_sync_stream: is sync stream supported.
  * @sync_stream_queue_idx: helper index for sync stream queues initialization.
@@ -3459,7 +3459,7 @@ struct hl_device {
 	u8				init_done;
 	u8				device_cpu_disabled;
 	u8				in_debug;
-	u8				cdev_sysfs_created;
+	u8				cdev_sysfs_debugfs_created;
 	u8				stop_on_err;
 	u8				supports_sync_stream;
 	u8				sync_stream_queue_idx;
@@ -3978,6 +3978,8 @@ void hl_handle_fw_err(struct hl_device *hdev, struct hl_info_fw_err_info *info);
 
 void hl_debugfs_init(void);
 void hl_debugfs_fini(void);
+int hl_debugfs_device_init(struct hl_device *hdev);
+void hl_debugfs_device_fini(struct hl_device *hdev);
 void hl_debugfs_add_device(struct hl_device *hdev);
 void hl_debugfs_remove_device(struct hl_device *hdev);
 void hl_debugfs_add_file(struct hl_fpriv *hpriv);
-- 
2.40.1

