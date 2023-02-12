Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AD26939E4
	for <lists+dri-devel@lfdr.de>; Sun, 12 Feb 2023 21:45:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3232510E05F;
	Sun, 12 Feb 2023 20:45:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5FFE10E468
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Feb 2023 20:45:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6189AB80D4D
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Feb 2023 20:45:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E03FC433D2
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Feb 2023 20:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676234712;
 bh=xqSeGc4aQQD8RzCLD+cYr9xcazpov2LaqIsn2u+hpd8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=aMX6vmzqKpvv2GCpS/wwk45Hk8mq8Ogd7u4KxjNPEeY/bhLhLcQzeeIPs+Fy1LlZ3
 m2Z0VVTVLZhNQmzodZMU/5JS04TmF/1l5NjyFIAM36PV/EiwzunW50eu8N/SN/B8LZ
 2XYIoXj2U/Ntq85Af6kL0tGmFbOKCothx5mnAuthzCoBUZa5mNYmyzAntc5jX3xk+J
 Aa+5Z/QPxMI/RJocc64rOkeRUI4WMPUgp9+8uCIlMjv1rsGGSNdEnCNTgO+UMVVtB5
 Zlqnw1/5BXRTBFtJ22P6pAg/nEFFE6fjZZsLC59ye3I9QQvRCO6fCFy78qs6lwd+O0
 6pC0+ojY9r+3Q==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 05/27] habanalabs: refactor debugfs init
Date: Sun, 12 Feb 2023 22:44:32 +0200
Message-Id: <20230212204454.2938561-5-ogabbay@kernel.org>
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

Make it easier to later add support for accel device.

Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/debugfs.c | 129 ++++++++++++----------
 1 file changed, 68 insertions(+), 61 deletions(-)

diff --git a/drivers/accel/habanalabs/common/debugfs.c b/drivers/accel/habanalabs/common/debugfs.c
index 945c0e6758ca..86901ff4aa02 100644
--- a/drivers/accel/habanalabs/common/debugfs.c
+++ b/drivers/accel/habanalabs/common/debugfs.c
@@ -1583,209 +1583,216 @@ static const struct file_operations hl_debugfs_fops = {
 	.release = single_release,
 };
 
-static void add_secured_nodes(struct hl_dbg_device_entry *dev_entry)
+static void add_secured_nodes(struct hl_dbg_device_entry *dev_entry, struct dentry *root)
 {
 	debugfs_create_u8("i2c_bus",
 				0644,
-				dev_entry->root,
+				root,
 				&dev_entry->i2c_bus);
 
 	debugfs_create_u8("i2c_addr",
 				0644,
-				dev_entry->root,
+				root,
 				&dev_entry->i2c_addr);
 
 	debugfs_create_u8("i2c_reg",
 				0644,
-				dev_entry->root,
+				root,
 				&dev_entry->i2c_reg);
 
 	debugfs_create_u8("i2c_len",
 				0644,
-				dev_entry->root,
+				root,
 				&dev_entry->i2c_len);
 
 	debugfs_create_file("i2c_data",
 				0644,
-				dev_entry->root,
+				root,
 				dev_entry,
 				&hl_i2c_data_fops);
 
 	debugfs_create_file("led0",
 				0200,
-				dev_entry->root,
+				root,
 				dev_entry,
 				&hl_led0_fops);
 
 	debugfs_create_file("led1",
 				0200,
-				dev_entry->root,
+				root,
 				dev_entry,
 				&hl_led1_fops);
 
 	debugfs_create_file("led2",
 				0200,
-				dev_entry->root,
+				root,
 				dev_entry,
 				&hl_led2_fops);
 }
 
-void hl_debugfs_add_device(struct hl_device *hdev)
+static void add_files_to_device(struct hl_device *hdev, struct hl_dbg_device_entry *dev_entry,
+				struct dentry *root)
 {
-	struct hl_dbg_device_entry *dev_entry = &hdev->hl_debugfs;
 	int count = ARRAY_SIZE(hl_debugfs_list);
 	struct hl_debugfs_entry *entry;
 	int i;
 
-	dev_entry->hdev = hdev;
-	dev_entry->entry_arr = kmalloc_array(count,
-					sizeof(struct hl_debugfs_entry),
-					GFP_KERNEL);
-	if (!dev_entry->entry_arr)
-		return;
-
-	dev_entry->data_dma_blob_desc.size = 0;
-	dev_entry->data_dma_blob_desc.data = NULL;
-	dev_entry->mon_dump_blob_desc.size = 0;
-	dev_entry->mon_dump_blob_desc.data = NULL;
-
-	INIT_LIST_HEAD(&dev_entry->file_list);
-	INIT_LIST_HEAD(&dev_entry->cb_list);
-	INIT_LIST_HEAD(&dev_entry->cs_list);
-	INIT_LIST_HEAD(&dev_entry->cs_job_list);
-	INIT_LIST_HEAD(&dev_entry->userptr_list);
-	INIT_LIST_HEAD(&dev_entry->ctx_mem_hash_list);
-	mutex_init(&dev_entry->file_mutex);
-	init_rwsem(&dev_entry->state_dump_sem);
-	spin_lock_init(&dev_entry->cb_spinlock);
-	spin_lock_init(&dev_entry->cs_spinlock);
-	spin_lock_init(&dev_entry->cs_job_spinlock);
-	spin_lock_init(&dev_entry->userptr_spinlock);
-	spin_lock_init(&dev_entry->ctx_mem_hash_spinlock);
-
-	dev_entry->root = debugfs_create_dir(dev_name(hdev->dev),
-						hl_debug_root);
-
 	debugfs_create_x64("memory_scrub_val",
 				0644,
-				dev_entry->root,
+				root,
 				&hdev->memory_scrub_val);
 
 	debugfs_create_file("memory_scrub",
 				0200,
-				dev_entry->root,
+				root,
 				dev_entry,
 				&hl_mem_scrub_fops);
 
 	debugfs_create_x64("addr",
 				0644,
-				dev_entry->root,
+				root,
 				&dev_entry->addr);
 
 	debugfs_create_file("data32",
 				0644,
-				dev_entry->root,
+				root,
 				dev_entry,
 				&hl_data32b_fops);
 
 	debugfs_create_file("data64",
 				0644,
-				dev_entry->root,
+				root,
 				dev_entry,
 				&hl_data64b_fops);
 
 	debugfs_create_file("set_power_state",
 				0200,
-				dev_entry->root,
+				root,
 				dev_entry,
 				&hl_power_fops);
 
 	debugfs_create_file("device",
 				0200,
-				dev_entry->root,
+				root,
 				dev_entry,
 				&hl_device_fops);
 
 	debugfs_create_file("clk_gate",
 				0200,
-				dev_entry->root,
+				root,
 				dev_entry,
 				&hl_clk_gate_fops);
 
 	debugfs_create_file("stop_on_err",
 				0644,
-				dev_entry->root,
+				root,
 				dev_entry,
 				&hl_stop_on_err_fops);
 
 	debugfs_create_file("dump_security_violations",
 				0644,
-				dev_entry->root,
+				root,
 				dev_entry,
 				&hl_security_violations_fops);
 
 	debugfs_create_file("dump_razwi_events",
 				0644,
-				dev_entry->root,
+				root,
 				dev_entry,
 				&hl_razwi_check_fops);
 
 	debugfs_create_file("dma_size",
 				0200,
-				dev_entry->root,
+				root,
 				dev_entry,
 				&hl_dma_size_fops);
 
 	debugfs_create_blob("data_dma",
 				0400,
-				dev_entry->root,
+				root,
 				&dev_entry->data_dma_blob_desc);
 
 	debugfs_create_file("monitor_dump_trig",
 				0200,
-				dev_entry->root,
+				root,
 				dev_entry,
 				&hl_monitor_dump_fops);
 
 	debugfs_create_blob("monitor_dump",
 				0400,
-				dev_entry->root,
+				root,
 				&dev_entry->mon_dump_blob_desc);
 
 	debugfs_create_x8("skip_reset_on_timeout",
 				0644,
-				dev_entry->root,
+				root,
 				&hdev->reset_info.skip_reset_on_timeout);
 
 	debugfs_create_file("state_dump",
 				0600,
-				dev_entry->root,
+				root,
 				dev_entry,
 				&hl_state_dump_fops);
 
 	debugfs_create_file("timeout_locked",
 				0644,
-				dev_entry->root,
+				root,
 				dev_entry,
 				&hl_timeout_locked_fops);
 
 	debugfs_create_u32("device_release_watchdog_timeout",
 				0644,
-				dev_entry->root,
+				root,
 				&hdev->device_release_watchdog_timeout_sec);
 
 	for (i = 0, entry = dev_entry->entry_arr ; i < count ; i++, entry++) {
 		debugfs_create_file(hl_debugfs_list[i].name,
 					0444,
-					dev_entry->root,
+					root,
 					entry,
 					&hl_debugfs_fops);
 		entry->info_ent = &hl_debugfs_list[i];
 		entry->dev_entry = dev_entry;
 	}
+}
+
+void hl_debugfs_add_device(struct hl_device *hdev)
+{
+	struct hl_dbg_device_entry *dev_entry = &hdev->hl_debugfs;
+	int count = ARRAY_SIZE(hl_debugfs_list);
+
+	dev_entry->hdev = hdev;
+	dev_entry->entry_arr = kmalloc_array(count,
+					sizeof(struct hl_debugfs_entry),
+					GFP_KERNEL);
+	if (!dev_entry->entry_arr)
+		return;
+
+	dev_entry->data_dma_blob_desc.size = 0;
+	dev_entry->data_dma_blob_desc.data = NULL;
+	dev_entry->mon_dump_blob_desc.size = 0;
+	dev_entry->mon_dump_blob_desc.data = NULL;
+
+	INIT_LIST_HEAD(&dev_entry->file_list);
+	INIT_LIST_HEAD(&dev_entry->cb_list);
+	INIT_LIST_HEAD(&dev_entry->cs_list);
+	INIT_LIST_HEAD(&dev_entry->cs_job_list);
+	INIT_LIST_HEAD(&dev_entry->userptr_list);
+	INIT_LIST_HEAD(&dev_entry->ctx_mem_hash_list);
+	mutex_init(&dev_entry->file_mutex);
+	init_rwsem(&dev_entry->state_dump_sem);
+	spin_lock_init(&dev_entry->cb_spinlock);
+	spin_lock_init(&dev_entry->cs_spinlock);
+	spin_lock_init(&dev_entry->cs_job_spinlock);
+	spin_lock_init(&dev_entry->userptr_spinlock);
+	spin_lock_init(&dev_entry->ctx_mem_hash_spinlock);
+
+	dev_entry->root = debugfs_create_dir(dev_name(hdev->dev),
+						hl_debug_root);
 
+	add_files_to_device(hdev, dev_entry, dev_entry->root);
 	if (!hdev->asic_prop.fw_security_enabled)
-		add_secured_nodes(dev_entry);
+		add_secured_nodes(dev_entry, dev_entry->root);
 }
 
 void hl_debugfs_remove_device(struct hl_device *hdev)
-- 
2.25.1

