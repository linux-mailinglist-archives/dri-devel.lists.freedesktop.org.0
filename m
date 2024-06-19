Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D64D90E380
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 08:34:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A85110E944;
	Wed, 19 Jun 2024 06:34:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="l8+SWnpY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3CD010E8FB
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 06:34:45 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1718778893; bh=uKE4mf3zyVGbJYXdTQbI3k5JMIKAYcCXynOPaZpJeDA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=l8+SWnpYMQPMNkDAdvIIZIBIpT6gnOAkc/qBiqsLA/kUeefSjP3AJXEKzK3C0aZVb
 G5zp3Av1LGzEgx2Gb6hzbTfEt2pAqNxUzy4wcrBtRvncDm3MIeTZCyrL/QJej3rBm1
 NV8srY1u+6N8UbMvHzNnQVxlvrqEGgKaKN65mUv7L+iIL259UaNvcw//K+7aR1OXiQ
 0OwEWkLqjkcgQK8y8emk1BfplQNvhq2/YghQJW3Thx1DuvfzlmuncLWTqxnVu6re7a
 ft4n84dHm3bzMSTGmACTuEL3z6srropAofwlb4XQPJ3HVTKmu4j5wIbFvM79T+qtnK
 eBKRxVaPVtBNA==
Received: from obitton-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by obitton-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 45J6YQB31377354; Wed, 19 Jun 2024 09:34:33 +0300
From: Ofir Bitton <obitton@habana.ai>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Ilia Levi <illevi@habana.ai>
Subject: [PATCH 3/9] accel/habanalabs: additional print in device-in-use info
Date: Wed, 19 Jun 2024 09:34:19 +0300
Message-Id: <20240619063425.1377327-3-obitton@habana.ai>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240619063425.1377327-1-obitton@habana.ai>
References: <20240619063425.1377327-1-obitton@habana.ai>
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

From: Ilia Levi <illevi@habana.ai>

When device release triggers a hard reset, there is a printout of
the cause. Currently listed causes (that increment context refcount)
are active command submissions and exported DMA buffer objects. In
any other case, the printout emits "unknown reason". We identify and
print another reason - allocated command buffers.

Signed-off-by: Ilia Levi <illevi@habana.ai>
Reviewed-by: Ofir Bitton <obitton@habana.ai>
---
 drivers/accel/habanalabs/common/device.c      | 19 +++++++---
 drivers/accel/habanalabs/common/habanalabs.h  | 14 ++++++-
 .../accel/habanalabs/common/habanalabs_drv.c  |  2 +-
 drivers/accel/habanalabs/common/memory_mgr.c  | 37 ++++++++++++++++++-
 4 files changed, 63 insertions(+), 9 deletions(-)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index 78e65c6b76a7..2fa6bf4c97af 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -549,7 +549,8 @@ int hl_hpriv_put(struct hl_fpriv *hpriv)
 	return kref_put(&hpriv->refcount, hpriv_release);
 }
 
-static void print_device_in_use_info(struct hl_device *hdev, const char *message)
+static void print_device_in_use_info(struct hl_device *hdev,
+		struct hl_mem_mgr_fini_stats *mm_fini_stats, const char *message)
 {
 	u32 active_cs_num, dmabuf_export_cnt;
 	bool unknown_reason = true;
@@ -573,6 +574,12 @@ static void print_device_in_use_info(struct hl_device *hdev, const char *message
 					dmabuf_export_cnt);
 	}
 
+	if (mm_fini_stats->n_busy_cb) {
+		unknown_reason = false;
+		offset += scnprintf(buf + offset, size - offset, " [%u live CB handles]",
+				mm_fini_stats->n_busy_cb);
+	}
+
 	if (unknown_reason)
 		scnprintf(buf + offset, size - offset, " [unknown reason]");
 
@@ -590,6 +597,7 @@ void hl_device_release(struct drm_device *ddev, struct drm_file *file_priv)
 {
 	struct hl_fpriv *hpriv = file_priv->driver_priv;
 	struct hl_device *hdev = to_hl_device(ddev);
+	struct hl_mem_mgr_fini_stats mm_fini_stats;
 
 	if (!hdev) {
 		pr_crit("Closing FD after device was removed. Memory leak will occur and it is advised to reboot.\n");
@@ -601,12 +609,13 @@ void hl_device_release(struct drm_device *ddev, struct drm_file *file_priv)
 	/* Memory buffers might be still in use at this point and thus the handles IDR destruction
 	 * is postponed to hpriv_release().
 	 */
-	hl_mem_mgr_fini(&hpriv->mem_mgr);
+	hl_mem_mgr_fini(&hpriv->mem_mgr, &mm_fini_stats);
 
 	hdev->compute_ctx_in_release = 1;
 
 	if (!hl_hpriv_put(hpriv)) {
-		print_device_in_use_info(hdev, "User process closed FD but device still in use");
+		print_device_in_use_info(hdev, &mm_fini_stats,
+				"User process closed FD but device still in use");
 		hl_device_reset(hdev, HL_DRV_RESET_HARD);
 	}
 
@@ -976,7 +985,7 @@ static int device_early_init(struct hl_device *hdev)
 	return 0;
 
 free_cb_mgr:
-	hl_mem_mgr_fini(&hdev->kernel_mem_mgr);
+	hl_mem_mgr_fini(&hdev->kernel_mem_mgr, NULL);
 	hl_mem_mgr_idr_destroy(&hdev->kernel_mem_mgr);
 free_chip_info:
 	kfree(hdev->hl_chip_info);
@@ -1020,7 +1029,7 @@ static void device_early_fini(struct hl_device *hdev)
 
 	mutex_destroy(&hdev->clk_throttling.lock);
 
-	hl_mem_mgr_fini(&hdev->kernel_mem_mgr);
+	hl_mem_mgr_fini(&hdev->kernel_mem_mgr, NULL);
 	hl_mem_mgr_idr_destroy(&hdev->kernel_mem_mgr);
 
 	kfree(hdev->hl_chip_info);
diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
index 3ea1b131cd42..f4ac5e9b1974 100644
--- a/drivers/accel/habanalabs/common/habanalabs.h
+++ b/drivers/accel/habanalabs/common/habanalabs.h
@@ -904,6 +904,18 @@ struct hl_mem_mgr {
 	struct idr handles;
 };
 
+/**
+ * struct hl_mem_mgr_fini_stats - describes statistics returned during memory manager teardown.
+ * @n_busy_cb: the amount of CB handles that could not be removed
+ * @n_busy_ts: the amount of TS handles that could not be removed
+ * @n_busy_other: the amount of any other type of handles that could not be removed
+ */
+struct hl_mem_mgr_fini_stats {
+	u32 n_busy_cb;
+	u32 n_busy_ts;
+	u32 n_busy_other;
+};
+
 /**
  * struct hl_mmap_mem_buf_behavior - describes unified memory manager buffer behavior
  * @topic: string identifier used for logging
@@ -4036,7 +4048,7 @@ char *hl_format_as_binary(char *buf, size_t buf_len, u32 n);
 const char *hl_sync_engine_to_string(enum hl_sync_engine_type engine_type);
 
 void hl_mem_mgr_init(struct device *dev, struct hl_mem_mgr *mmg);
-void hl_mem_mgr_fini(struct hl_mem_mgr *mmg);
+void hl_mem_mgr_fini(struct hl_mem_mgr *mmg, struct hl_mem_mgr_fini_stats *stats);
 void hl_mem_mgr_idr_destroy(struct hl_mem_mgr *mmg);
 int hl_mem_mgr_mmap(struct hl_mem_mgr *mmg, struct vm_area_struct *vma,
 		    void *args);
diff --git a/drivers/accel/habanalabs/common/habanalabs_drv.c b/drivers/accel/habanalabs/common/habanalabs_drv.c
index b1613a82c7f2..708dfd10f39c 100644
--- a/drivers/accel/habanalabs/common/habanalabs_drv.c
+++ b/drivers/accel/habanalabs/common/habanalabs_drv.c
@@ -263,7 +263,7 @@ int hl_device_open(struct drm_device *ddev, struct drm_file *file_priv)
 
 out_err:
 	mutex_unlock(&hdev->fpriv_list_lock);
-	hl_mem_mgr_fini(&hpriv->mem_mgr);
+	hl_mem_mgr_fini(&hpriv->mem_mgr, NULL);
 	hl_mem_mgr_idr_destroy(&hpriv->mem_mgr);
 	hl_ctx_mgr_fini(hpriv->hdev, &hpriv->ctx_mgr);
 	mutex_destroy(&hpriv->ctx_lock);
diff --git a/drivers/accel/habanalabs/common/memory_mgr.c b/drivers/accel/habanalabs/common/memory_mgr.c
index c4d84df355b0..99cd83139d46 100644
--- a/drivers/accel/habanalabs/common/memory_mgr.c
+++ b/drivers/accel/habanalabs/common/memory_mgr.c
@@ -318,28 +318,61 @@ void hl_mem_mgr_init(struct device *dev, struct hl_mem_mgr *mmg)
 	idr_init(&mmg->handles);
 }
 
+static void hl_mem_mgr_fini_stats_reset(struct hl_mem_mgr_fini_stats *stats)
+{
+	if (!stats)
+		return;
+
+	memset(stats, 0, sizeof(*stats));
+}
+
+static void hl_mem_mgr_fini_stats_inc(u64 mem_id, struct hl_mem_mgr_fini_stats *stats)
+{
+	if (!stats)
+		return;
+
+	switch (mem_id) {
+	case HL_MMAP_TYPE_CB:
+		++stats->n_busy_cb;
+		break;
+	case HL_MMAP_TYPE_TS_BUFF:
+		++stats->n_busy_ts;
+		break;
+	default:
+		/* we currently store only CB/TS so this shouldn't happen */
+		++stats->n_busy_other;
+	}
+}
+
 /**
  * hl_mem_mgr_fini - release unified memory manager
  *
  * @mmg: parent unified memory manager
+ * @stats: if non-NULL, will return some counters for handles that could not be removed.
  *
  * Release the unified memory manager. Shall be called from an interrupt context.
  */
-void hl_mem_mgr_fini(struct hl_mem_mgr *mmg)
+void hl_mem_mgr_fini(struct hl_mem_mgr *mmg, struct hl_mem_mgr_fini_stats *stats)
 {
 	struct hl_mmap_mem_buf *buf;
 	struct idr *idp;
 	const char *topic;
+	u64 mem_id;
 	u32 id;
 
+	hl_mem_mgr_fini_stats_reset(stats);
+
 	idp = &mmg->handles;
 
 	idr_for_each_entry(idp, buf, id) {
 		topic = buf->behavior->topic;
-		if (hl_mmap_mem_buf_put(buf) != 1)
+		mem_id = buf->behavior->mem_id;
+		if (hl_mmap_mem_buf_put(buf) != 1) {
 			dev_err(mmg->dev,
 				"%s: Buff handle %u for CTX is still alive\n",
 				topic, id);
+			hl_mem_mgr_fini_stats_inc(mem_id, stats);
+		}
 	}
 }
 
-- 
2.34.1

