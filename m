Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 867646E5DA1
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 11:39:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C49610E72F;
	Tue, 18 Apr 2023 09:39:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B40BC10E723
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 09:39:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2F66662665;
 Tue, 18 Apr 2023 09:39:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70DE5C4339B;
 Tue, 18 Apr 2023 09:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681810771;
 bh=DyzilZi3AvtuWDxbseJKiNEnesYmAdHHC9BBE7yWUK8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uMig/i2wD/OTonTQUBWI67HS/whD1kLB3Wp86qjTdj32G5R9izW53ueUo9PVhp2DA
 KkLcIScSEgJjIAM5MoSUoPSCImlP/R94A56evXqRyzQDiEVj3X0f4S5nAlHe6p15Ka
 lkkx6eBA2AUD7Q8nqeRZYDu147a7bqS0JN9MkmfOxiE4lmwtSqTOkGgg3kYv9S5rEn
 9oow1mUIjzFlbKknZ7TgnNQ7FaRBp5bv9H+QhvsjM8BGIp+ZkixZo21jJ+DJn5Rl1V
 43wph4ade5UWERsKLk2dkSbaQCNwQNch0v65EdxV4eV0N/Ml9ULiVV8lw482MG79OY
 AGFeE5GAlOKeg==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 08/10] accel/habanalabs: add unregister timestamp uapi
Date: Tue, 18 Apr 2023 12:39:14 +0300
Message-Id: <20230418093916.2979728-8-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230418093916.2979728-1-ogabbay@kernel.org>
References: <20230418093916.2979728-1-ogabbay@kernel.org>
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
Cc: farah kassabri <fkassabri@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: farah kassabri <fkassabri@habana.ai>

Add uapi to allow user to unregister timestamp record.
This is needed when the user wishes to re-use the same record with
different interrupt id. For that, the user must first unregister it
from the current interrupt id and then register it with the new id.

Signed-off-by: farah kassabri <fkassabri@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 .../habanalabs/common/command_submission.c    | 123 ++++++++++++++----
 include/uapi/drm/habanalabs_accel.h           |   1 +
 2 files changed, 101 insertions(+), 23 deletions(-)

diff --git a/drivers/accel/habanalabs/common/command_submission.c b/drivers/accel/habanalabs/common/command_submission.c
index af9d2e22c6e7..977900866e8f 100644
--- a/drivers/accel/habanalabs/common/command_submission.c
+++ b/drivers/accel/habanalabs/common/command_submission.c
@@ -3196,34 +3196,57 @@ static int hl_cs_wait_ioctl(struct hl_fpriv *hpriv, void *data)
 	return 0;
 }
 
+static inline void set_record_cq_info(struct hl_user_pending_interrupt *record,
+					struct hl_cb *cq_cb, u32 cq_offset, u32 target_value)
+{
+	record->ts_reg_info.cq_cb = cq_cb;
+	record->cq_kernel_addr = (u64 *) cq_cb->kernel_address + cq_offset;
+	record->cq_target_value = target_value;
+}
+
+static int validate_and_get_ts_record(struct device *dev,
+					struct hl_ts_buff *ts_buff, u64 ts_offset,
+					struct hl_user_pending_interrupt **req_event_record)
+{
+	struct hl_user_pending_interrupt *ts_cb_last;
+
+	*req_event_record = (struct hl_user_pending_interrupt *)ts_buff->kernel_buff_address +
+						ts_offset;
+	ts_cb_last = (struct hl_user_pending_interrupt *)ts_buff->kernel_buff_address +
+			(ts_buff->kernel_buff_size / sizeof(struct hl_user_pending_interrupt));
+
+	/* Validate ts_offset not exceeding last max */
+	if (*req_event_record >= ts_cb_last) {
+		dev_err(dev, "Ts offset(%llx) exceeds max CB offset(0x%llx)\n",
+				ts_offset, (u64)(uintptr_t)ts_cb_last);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int ts_buff_get_kernel_ts_record(struct hl_mmap_mem_buf *buf,
 					struct hl_cb *cq_cb,
 					u64 ts_offset, u64 cq_offset, u64 target_value,
 					spinlock_t *wait_list_lock,
 					struct hl_user_pending_interrupt **pend)
 {
+	struct hl_user_pending_interrupt *requested_offset_record;
 	struct hl_ts_buff *ts_buff = buf->private;
-	struct hl_user_pending_interrupt *requested_offset_record =
-				(struct hl_user_pending_interrupt *)ts_buff->kernel_buff_address +
-				ts_offset;
-	struct hl_user_pending_interrupt *cb_last =
-			(struct hl_user_pending_interrupt *)ts_buff->kernel_buff_address +
-			(ts_buff->kernel_buff_size / sizeof(struct hl_user_pending_interrupt));
-	unsigned long iter_counter = 0;
+	unsigned long iter_counter = 0, flags;
 	u64 current_cq_counter;
 	ktime_t timestamp;
+	int rc;
 
-	/* Validate ts_offset not exceeding last max */
-	if (requested_offset_record >= cb_last) {
-		dev_err(buf->mmg->dev, "Ts offset exceeds max CB offset(0x%llx)\n",
-								(u64)(uintptr_t)cb_last);
-		return -EINVAL;
-	}
+	rc = validate_and_get_ts_record(buf->mmg->dev, ts_buff, ts_offset,
+							&requested_offset_record);
+	if (rc)
+		return rc;
 
 	timestamp = ktime_get();
 
 start_over:
-	spin_lock(wait_list_lock);
+	spin_lock_irqsave(wait_list_lock, flags);
 
 	/* Unregister only if we didn't reach the target value
 	 * since in this case there will be no handling in irq context
@@ -3234,7 +3257,9 @@ static int ts_buff_get_kernel_ts_record(struct hl_mmap_mem_buf *buf,
 		current_cq_counter = *requested_offset_record->cq_kernel_addr;
 		if (current_cq_counter < requested_offset_record->cq_target_value) {
 			list_del(&requested_offset_record->wait_list_node);
-			spin_unlock(wait_list_lock);
+			spin_unlock_irqrestore(wait_list_lock, flags);
+
+			set_record_cq_info(requested_offset_record, cq_cb, cq_offset, target_value);
 
 			hl_mmap_mem_buf_put(requested_offset_record->ts_reg_info.buf);
 			hl_cb_put(requested_offset_record->ts_reg_info.cq_cb);
@@ -3245,8 +3270,8 @@ static int ts_buff_get_kernel_ts_record(struct hl_mmap_mem_buf *buf,
 			dev_dbg(buf->mmg->dev,
 				"ts node in middle of irq handling\n");
 
-			/* irq thread handling in the middle give it time to finish */
-			spin_unlock(wait_list_lock);
+			/* irq handling in the middle give it time to finish */
+			spin_unlock_irqrestore(wait_list_lock, flags);
 			usleep_range(100, 1000);
 			if (++iter_counter == MAX_TS_ITER_NUM) {
 				dev_err(buf->mmg->dev,
@@ -3260,14 +3285,11 @@ static int ts_buff_get_kernel_ts_record(struct hl_mmap_mem_buf *buf,
 	} else {
 		/* Fill up the new registration node info */
 		requested_offset_record->ts_reg_info.buf = buf;
-		requested_offset_record->ts_reg_info.cq_cb = cq_cb;
 		requested_offset_record->ts_reg_info.timestamp_kernel_addr =
 				(u64 *) ts_buff->user_buff_address + ts_offset;
-		requested_offset_record->cq_kernel_addr =
-				(u64 *) cq_cb->kernel_address + cq_offset;
-		requested_offset_record->cq_target_value = target_value;
+		set_record_cq_info(requested_offset_record, cq_cb, cq_offset, target_value);
 
-		spin_unlock(wait_list_lock);
+		spin_unlock_irqrestore(wait_list_lock, flags);
 	}
 
 	*pend = requested_offset_record;
@@ -3277,6 +3299,58 @@ static int ts_buff_get_kernel_ts_record(struct hl_mmap_mem_buf *buf,
 	return 0;
 }
 
+static int unregister_timestamp_node_ioctl(struct hl_device *hdev, struct hl_mem_mgr *mmg,
+		u64 ts_handle, u64 ts_offset, struct hl_user_interrupt *interrupt)
+{
+	struct hl_user_pending_interrupt *req_event_record, *pend, *temp_pend;
+	struct hl_mmap_mem_buf *buff;
+	struct hl_ts_buff *ts_buff;
+	bool ts_rec_found = false;
+	int rc;
+
+	buff = hl_mmap_mem_buf_get(mmg, ts_handle);
+	if (!buff) {
+		dev_err(hdev->dev, "invalid TS buff handle!\n");
+		return -EINVAL;
+	}
+
+	ts_buff = buff->private;
+
+	rc = validate_and_get_ts_record(hdev->dev, ts_buff, ts_offset, &req_event_record);
+	if (rc)
+		goto out;
+
+	/*
+	 * Note: we don't use the ts in_use field here, but we rather scan the list
+	 * because we cannot rely on the user to keep the order of register/unregister calls
+	 * and since we might have races here all the time between the irq and register/unregister
+	 * calls so it safer to lock the list and scan it to find the node.
+	 * If the node found on the list we mark it as not in use and delete it from the list,
+	 * if it's not here then the node was handled already in the irq before we get into
+	 * this ioctl.
+	 */
+	spin_lock(&interrupt->wait_list_lock);
+	list_for_each_entry_safe(pend, temp_pend, &interrupt->wait_list_head, wait_list_node) {
+		if (pend == req_event_record) {
+			pend->ts_reg_info.in_use = 0;
+			list_del(&pend->wait_list_node);
+			ts_rec_found = true;
+			break;
+		}
+	}
+	spin_unlock(&interrupt->wait_list_lock);
+
+	/* Put refcounts that were taken when we registered the event */
+	if (ts_rec_found) {
+		hl_mmap_mem_buf_put(pend->ts_reg_info.buf);
+		hl_cb_put(pend->ts_reg_info.cq_cb);
+	}
+out:
+	hl_mmap_mem_buf_put(buff);
+
+	return rc;
+}
+
 static int _hl_interrupt_wait_ioctl(struct hl_device *hdev, struct hl_ctx *ctx,
 				struct hl_mem_mgr *cb_mmg, struct hl_mem_mgr *mmg,
 				u64 timeout_us, u64 cq_counters_handle,	u64 cq_counters_offset,
@@ -3610,7 +3684,10 @@ static int hl_interrupt_wait_ioctl(struct hl_fpriv *hpriv, void *data)
 		return -EINVAL;
 	}
 
-	if (args->in.flags & HL_WAIT_CS_FLAGS_INTERRUPT_KERNEL_CQ)
+	if (args->in.flags & HL_WAIT_CS_FLAGS_UNREGISTER_INTERRUPT)
+		rc = unregister_timestamp_node_ioctl(hdev, &hpriv->mem_mgr,
+				args->in.timestamp_handle, args->in.timestamp_offset, interrupt);
+	else if (args->in.flags & HL_WAIT_CS_FLAGS_INTERRUPT_KERNEL_CQ)
 		rc = _hl_interrupt_wait_ioctl(hdev, hpriv->ctx, &hpriv->mem_mgr, &hpriv->mem_mgr,
 				args->in.interrupt_timeout_us, args->in.cq_counters_handle,
 				args->in.cq_counters_offset,
diff --git a/include/uapi/drm/habanalabs_accel.h b/include/uapi/drm/habanalabs_accel.h
index d9ef1b151d04..d45454b9a62e 100644
--- a/include/uapi/drm/habanalabs_accel.h
+++ b/include/uapi/drm/habanalabs_accel.h
@@ -1704,6 +1704,7 @@ union hl_cs_args {
 #define HL_WAIT_CS_FLAGS_MULTI_CS		0x4
 #define HL_WAIT_CS_FLAGS_INTERRUPT_KERNEL_CQ	0x10
 #define HL_WAIT_CS_FLAGS_REGISTER_INTERRUPT	0x20
+#define HL_WAIT_CS_FLAGS_UNREGISTER_INTERRUPT	0x40
 
 #define HL_WAIT_MULTI_CS_LIST_MAX_LEN	32
 
-- 
2.40.0

