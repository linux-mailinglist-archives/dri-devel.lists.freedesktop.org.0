Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9806AC0A3
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 14:19:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D94A10E24E;
	Mon,  6 Mar 2023 13:19:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5890810E0AC
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 13:19:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DC25760C25;
 Mon,  6 Mar 2023 13:19:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AE8CC4339C;
 Mon,  6 Mar 2023 13:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678108762;
 bh=vlWp5Lb6e8HRwgt1lUAHm5RzJ8f3sJwSLS8mMAjOGmg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OduYiiP2BzKaFu8Yy2ebgHR082JGrXS9v9PJgW9xNqMHwsThWjC3EBtbd0RGG5Jjo
 wnbSSX64WgkN2CeT0MmF4YjQcv75Y42Rhp9Buiz940X7yNg0FdC7KS/yF/ZRwUdwkL
 HXUINIGIcCrh5PJYGXqKoLp2EgPlcBg5lXnLgikA0PnPTKsxpxQ2yy5+xITJGBuWex
 7VKJdqQvSbDSDnbkP+EUVtkiDWBymSgruprtD1mweX0q3u+CjS5eIQzmcTjsCPF4dd
 O6fhNm4mQ7r9v3csFqf2XXjkBcBtjTT16vRyOzGku46HCEMiM8gPIldKbOwZ0mDQNU
 lX0pwGjZdxMkQ==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] habanalabs: postpone mem_mgr IDR destruction to
 hpriv_release()
Date: Mon,  6 Mar 2023 15:19:13 +0200
Message-Id: <20230306131913.346343-3-ogabbay@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306131913.346343-1-ogabbay@kernel.org>
References: <20230306131913.346343-1-ogabbay@kernel.org>
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

The memory manager IDR is currently destroyed when user releases the
file descriptor.
However, at this point the user context might be still held, and memory
buffers might be still in use.
Later on, calls to release those buffers will fail due to not finding
their handles in the IDR, leading to a memory leak.
To avoid this leak, split the IDR destruction from the memory manager
fini, and postpone it to hpriv_release() when there is no user context
and no buffers are used.

Signed-off-by: Tomer Tayar <ttayar@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/device.c         |  9 +++++++++
 drivers/accel/habanalabs/common/habanalabs.h     |  1 +
 drivers/accel/habanalabs/common/habanalabs_drv.c |  1 +
 drivers/accel/habanalabs/common/memory_mgr.c     | 13 ++++++++++++-
 4 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index 8db00cb3b71d..713005998cbc 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -413,6 +413,9 @@ static void hpriv_release(struct kref *ref)
 	mutex_destroy(&hpriv->ctx_lock);
 	mutex_destroy(&hpriv->restore_phase_mutex);
 
+	/* There should be no memory buffers at this point and handles IDR can be destroyed */
+	hl_mem_mgr_idr_destroy(&hpriv->mem_mgr);
+
 	/* Device should be reset if reset-upon-device-release is enabled, or if there is a pending
 	 * reset that waits for device release.
 	 */
@@ -534,6 +537,10 @@ static int hl_device_release(struct inode *inode, struct file *filp)
 	}
 
 	hl_ctx_mgr_fini(hdev, &hpriv->ctx_mgr);
+
+	/* Memory buffers might be still in use at this point and thus the handles IDR destruction
+	 * is postponed to hpriv_release().
+	 */
 	hl_mem_mgr_fini(&hpriv->mem_mgr);
 
 	hdev->compute_ctx_in_release = 1;
@@ -910,6 +917,7 @@ static int device_early_init(struct hl_device *hdev)
 
 free_cb_mgr:
 	hl_mem_mgr_fini(&hdev->kernel_mem_mgr);
+	hl_mem_mgr_idr_destroy(&hdev->kernel_mem_mgr);
 free_chip_info:
 	kfree(hdev->hl_chip_info);
 free_prefetch_wq:
@@ -953,6 +961,7 @@ static void device_early_fini(struct hl_device *hdev)
 	mutex_destroy(&hdev->clk_throttling.lock);
 
 	hl_mem_mgr_fini(&hdev->kernel_mem_mgr);
+	hl_mem_mgr_idr_destroy(&hdev->kernel_mem_mgr);
 
 	kfree(hdev->hl_chip_info);
 
diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
index af5a51f8c173..98e6d98cf868 100644
--- a/drivers/accel/habanalabs/common/habanalabs.h
+++ b/drivers/accel/habanalabs/common/habanalabs.h
@@ -3927,6 +3927,7 @@ const char *hl_sync_engine_to_string(enum hl_sync_engine_type engine_type);
 
 void hl_mem_mgr_init(struct device *dev, struct hl_mem_mgr *mmg);
 void hl_mem_mgr_fini(struct hl_mem_mgr *mmg);
+void hl_mem_mgr_idr_destroy(struct hl_mem_mgr *mmg);
 int hl_mem_mgr_mmap(struct hl_mem_mgr *mmg, struct vm_area_struct *vma,
 		    void *args);
 struct hl_mmap_mem_buf *hl_mmap_mem_buf_get(struct hl_mem_mgr *mmg,
diff --git a/drivers/accel/habanalabs/common/habanalabs_drv.c b/drivers/accel/habanalabs/common/habanalabs_drv.c
index 0cb6e52a1192..8c65607c83b0 100644
--- a/drivers/accel/habanalabs/common/habanalabs_drv.c
+++ b/drivers/accel/habanalabs/common/habanalabs_drv.c
@@ -234,6 +234,7 @@ int hl_device_open(struct inode *inode, struct file *filp)
 out_err:
 	mutex_unlock(&hdev->fpriv_list_lock);
 	hl_mem_mgr_fini(&hpriv->mem_mgr);
+	hl_mem_mgr_idr_destroy(&hpriv->mem_mgr);
 	hl_ctx_mgr_fini(hpriv->hdev, &hpriv->ctx_mgr);
 	filp->private_data = NULL;
 	mutex_destroy(&hpriv->ctx_lock);
diff --git a/drivers/accel/habanalabs/common/memory_mgr.c b/drivers/accel/habanalabs/common/memory_mgr.c
index 9f57bcef3be3..30f8059f28c2 100644
--- a/drivers/accel/habanalabs/common/memory_mgr.c
+++ b/drivers/accel/habanalabs/common/memory_mgr.c
@@ -341,8 +341,19 @@ void hl_mem_mgr_fini(struct hl_mem_mgr *mmg)
 				"%s: Buff handle %u for CTX is still alive\n",
 				topic, id);
 	}
+}
 
-	/* TODO: can it happen that some buffer is still in use at this point? */
+/**
+ * hl_mem_mgr_idr_destroy() - destroy memory manager IDR.
+ * @mmg: parent unified memory manager
+ *
+ * Destroy the memory manager IDR.
+ * Shall be called when IDR is empty and no memory buffers are in use.
+ */
+void hl_mem_mgr_idr_destroy(struct hl_mem_mgr *mmg)
+{
+	if (!idr_is_empty(&mmg->handles))
+		dev_crit(mmg->dev, "memory manager IDR is destroyed while it is not empty!\n");
 
 	idr_destroy(&mmg->handles);
 }
-- 
2.39.2

