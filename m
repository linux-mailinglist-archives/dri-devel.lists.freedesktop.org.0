Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA976A6C6B
	for <lists+dri-devel@lfdr.de>; Wed,  1 Mar 2023 13:35:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E878310E246;
	Wed,  1 Mar 2023 12:35:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5AE510E22F
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Mar 2023 12:35:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 453C9B81029;
 Wed,  1 Mar 2023 12:35:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECE2AC433EF;
 Wed,  1 Mar 2023 12:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677674102;
 bh=6i+1igp7cFHE8aoVgjrjD98A+9h7+Q0uJtk69zXk5T0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DCgIu5gfvf9MLHaxjQEa/TjZNSflcQzOpjZKSBebHPIgY2QR0ltol9NJJSfW/A1tP
 oBGyfEDGykpmvlTSzQ6SmL2smDrXkmhczKteEvl/a8yopQl0/MfjWRQwxdoy50fjxc
 kb7sYlacTt/7pmgxhFMZ5S4i0wQjMzc2ZtI1yNTOA3BVx88FaA8FhCoUSSBy24j/gO
 wc24iuIPnK/JvSRulBjult8uPPlLpo2XPFU6bXa2bFKNszdYfkbLvG2eV48SbkCQD6
 1F1BpLR0Xwb1gRTcwl7H+AqS3gEk/p3jWNj1J2I79I8FraUpG11Lgo7kOM4/u/7B4E
 Yb4+VVw/sXb8Q==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/5] habanalabs: use a mutex rather than a spinlock
Date: Wed,  1 Mar 2023 14:34:50 +0200
Message-Id: <20230301123450.4127848-5-ogabbay@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230301123450.4127848-1-ogabbay@kernel.org>
References: <20230301123450.4127848-1-ogabbay@kernel.org>
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
Cc: Koby Elbaz <kelbaz@habana.ai>, Dan Carpenter <error27@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Koby Elbaz <kelbaz@habana.ai>

There are two reasons why mutex is better here:
1. There's a critical section relatively long, where in
certain scenarios (e.g., multiple VM allocations) taking a spinlock
might cause noticeable performance degradation.
2. It will remove the incorrect usage of mutex under
spin_lock (where preemption is disabled).

Reported-by: Dan Carpenter <error27@gmail.com>
Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/debugfs.c    | 15 ++++++++-------
 drivers/accel/habanalabs/common/habanalabs.h |  4 ++--
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/accel/habanalabs/common/debugfs.c b/drivers/accel/habanalabs/common/debugfs.c
index 86901ff4aa02..22dd17c077c0 100644
--- a/drivers/accel/habanalabs/common/debugfs.c
+++ b/drivers/accel/habanalabs/common/debugfs.c
@@ -258,7 +258,7 @@ static int vm_show(struct seq_file *s, void *data)
 	if (!dev_entry->hdev->mmu_enable)
 		return 0;
 
-	spin_lock(&dev_entry->ctx_mem_hash_spinlock);
+	mutex_lock(&dev_entry->ctx_mem_hash_mutex);
 
 	list_for_each_entry(ctx, &dev_entry->ctx_mem_hash_list, debugfs_list) {
 		once = false;
@@ -329,7 +329,7 @@ static int vm_show(struct seq_file *s, void *data)
 
 	}
 
-	spin_unlock(&dev_entry->ctx_mem_hash_spinlock);
+	mutex_unlock(&dev_entry->ctx_mem_hash_mutex);
 
 	ctx = hl_get_compute_ctx(dev_entry->hdev);
 	if (ctx) {
@@ -1785,7 +1785,7 @@ void hl_debugfs_add_device(struct hl_device *hdev)
 	spin_lock_init(&dev_entry->cs_spinlock);
 	spin_lock_init(&dev_entry->cs_job_spinlock);
 	spin_lock_init(&dev_entry->userptr_spinlock);
-	spin_lock_init(&dev_entry->ctx_mem_hash_spinlock);
+	mutex_init(&dev_entry->ctx_mem_hash_mutex);
 
 	dev_entry->root = debugfs_create_dir(dev_name(hdev->dev),
 						hl_debug_root);
@@ -1802,6 +1802,7 @@ void hl_debugfs_remove_device(struct hl_device *hdev)
 
 	debugfs_remove_recursive(entry->root);
 
+	mutex_destroy(&entry->ctx_mem_hash_mutex);
 	mutex_destroy(&entry->file_mutex);
 
 	vfree(entry->data_dma_blob_desc.data);
@@ -1908,18 +1909,18 @@ void hl_debugfs_add_ctx_mem_hash(struct hl_device *hdev, struct hl_ctx *ctx)
 {
 	struct hl_dbg_device_entry *dev_entry = &hdev->hl_debugfs;
 
-	spin_lock(&dev_entry->ctx_mem_hash_spinlock);
+	mutex_lock(&dev_entry->ctx_mem_hash_mutex);
 	list_add(&ctx->debugfs_list, &dev_entry->ctx_mem_hash_list);
-	spin_unlock(&dev_entry->ctx_mem_hash_spinlock);
+	mutex_unlock(&dev_entry->ctx_mem_hash_mutex);
 }
 
 void hl_debugfs_remove_ctx_mem_hash(struct hl_device *hdev, struct hl_ctx *ctx)
 {
 	struct hl_dbg_device_entry *dev_entry = &hdev->hl_debugfs;
 
-	spin_lock(&dev_entry->ctx_mem_hash_spinlock);
+	mutex_lock(&dev_entry->ctx_mem_hash_mutex);
 	list_del(&ctx->debugfs_list);
-	spin_unlock(&dev_entry->ctx_mem_hash_spinlock);
+	mutex_unlock(&dev_entry->ctx_mem_hash_mutex);
 }
 
 /**
diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
index 954e071d7961..e03f9c125e30 100644
--- a/drivers/accel/habanalabs/common/habanalabs.h
+++ b/drivers/accel/habanalabs/common/habanalabs.h
@@ -2320,7 +2320,7 @@ struct hl_debugfs_entry {
  * @userptr_list: list of available userptrs (virtual memory chunk descriptor).
  * @userptr_spinlock: protects userptr_list.
  * @ctx_mem_hash_list: list of available contexts with MMU mappings.
- * @ctx_mem_hash_spinlock: protects cb_list.
+ * @ctx_mem_hash_mutex: protects list of available contexts with MMU mappings.
  * @data_dma_blob_desc: data DMA descriptor of blob.
  * @mon_dump_blob_desc: monitor dump descriptor of blob.
  * @state_dump: data of the system states in case of a bad cs.
@@ -2351,7 +2351,7 @@ struct hl_dbg_device_entry {
 	struct list_head		userptr_list;
 	spinlock_t			userptr_spinlock;
 	struct list_head		ctx_mem_hash_list;
-	spinlock_t			ctx_mem_hash_spinlock;
+	struct mutex			ctx_mem_hash_mutex;
 	struct debugfs_blob_wrapper	data_dma_blob_desc;
 	struct debugfs_blob_wrapper	mon_dump_blob_desc;
 	char				*state_dump[HL_STATE_DUMP_HIST_LEN];
-- 
2.39.2

