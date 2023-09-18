Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F997A4B0F
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 16:32:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81E1B10E18C;
	Mon, 18 Sep 2023 14:32:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6D9210E04D
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 14:32:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 35B68B80E9F;
 Mon, 18 Sep 2023 14:32:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83A16C3278A;
 Mon, 18 Sep 2023 14:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695047525;
 bh=0S4QcskDYEILA7KkaPHsta8Hjw18p8gI5+R+R6/O6/0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WaAGEHsVGmlJpGKlK2ZtrnOqC4tjuvBlaavjfkgkld+iYoxbty5AYFDLUq78QzxFY
 7vA8ijJsYQoVSmZyPPhFhUw5WUpk1jQdRjwt6wr0hDT8SGrJRmuY2s821gqUiHodWJ
 iPGv/SjLyv5s6MhMkVzlISU7OlKRiVArxmxfXlozqBare8YX43fIj5NuTE86/V1q3+
 cF2sWlvPn8+Zg5S9k2e+Tfni8RU8rWmB2sz6M4OxUrFQeimCd0Q3OZ/sH5olVGta4l
 cG4faBIjfukYMbU0O6V04nifo8Z8l2uhf31xcC8qJ2/B7BpqDWhq8Ud5ET4LzvK83T
 tsqhNKkS9L5pw==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 02/10] accel/habanalabs: optimize timestamp registration
 handler
Date: Mon, 18 Sep 2023 17:31:50 +0300
Message-Id: <20230918143158.903207-2-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230918143158.903207-1-ogabbay@kernel.org>
References: <20230918143158.903207-1-ogabbay@kernel.org>
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
Cc: Tomer Tayar <ttayar@habana.ai>, farah kassabri <fkassabri@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: farah kassabri <fkassabri@habana.ai>

Currently we use dynamic allocation inside the irq handler
in order to allocate free node to be used for the free jobs.

This operation is expensive, especially when we deal with large
burst of events records that get released at the same time.

The alternative is to have pre allocated pool of free nodes
and just fetch nodes from this pool at irq handling time instead
of allocating them.

In case the pool becomes full, then the driver will fallback to
dynamic allocations.

As part of the optimization also update the unregister flow
upon re-using a timestamp record, by making the operation much
simpler and quicker. We already have the record in the registration
flow and now we just seek to re-use with different interrupt.
Therefore, no need to look for buffer according to the user handle.

Signed-off-by: farah kassabri <fkassabri@habana.ai>
Reviewed-by: Tomer Tayar <ttayar@habana.ai>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 .../habanalabs/common/command_submission.c    | 83 +++++++------------
 drivers/accel/habanalabs/common/device.c      | 59 ++++++++++++-
 drivers/accel/habanalabs/common/habanalabs.h  | 27 ++++++
 drivers/accel/habanalabs/common/irq.c         | 77 ++++++++++++++---
 4 files changed, 179 insertions(+), 67 deletions(-)

diff --git a/drivers/accel/habanalabs/common/command_submission.c b/drivers/accel/habanalabs/common/command_submission.c
index daaa3cbe0b12..02049bd26356 100644
--- a/drivers/accel/habanalabs/common/command_submission.c
+++ b/drivers/accel/habanalabs/common/command_submission.c
@@ -3246,60 +3246,29 @@ static int validate_and_get_ts_record(struct device *dev,
 	return 0;
 }
 
-static int unregister_timestamp_node(struct hl_device *hdev, struct hl_ctx *ctx,
-			struct hl_mem_mgr *mmg, u64 ts_handle, u64 ts_offset,
-			struct hl_user_interrupt *interrupt)
+static void unregister_timestamp_node(struct hl_device *hdev,
+			struct hl_user_pending_interrupt *record, bool need_lock)
 {
-	struct hl_user_pending_interrupt *req_event_record, *pend, *temp_pend;
-	struct hl_mmap_mem_buf *buff;
-	struct hl_ts_buff *ts_buff;
+	struct hl_user_interrupt *interrupt = record->ts_reg_info.interrupt;
 	bool ts_rec_found = false;
-	int rc;
-
-	buff = hl_mmap_mem_buf_get(mmg, ts_handle);
-	if (!buff) {
-		dev_err(hdev->dev, "invalid TS buff handle!\n");
-		return -EINVAL;
-	}
-
-	ts_buff = buff->private;
-
-	rc = validate_and_get_ts_record(hdev->dev, ts_buff, ts_offset, &req_event_record);
-	if (rc)
-		goto put_buf;
 
-	/*
-	 * Note: we don't use the ts in_use field here, but we rather scan the list
-	 * because we cannot rely on the user to keep the order of register/unregister calls
-	 * and since we might have races here all the time between the irq and register/unregister
-	 * calls so it safer to lock the list and scan it to find the node.
-	 * If the node found on the list we mark it as not in use and delete it from the list,
-	 * if it's not here then the node was handled already in the irq before we get into
-	 * this ioctl.
-	 */
-	spin_lock(&interrupt->wait_list_lock);
+	if (need_lock)
+		spin_lock(&interrupt->wait_list_lock);
 
-	list_for_each_entry_safe(pend, temp_pend, &interrupt->wait_list_head, wait_list_node) {
-		if (pend == req_event_record) {
-			pend->ts_reg_info.in_use = false;
-			list_del(&pend->wait_list_node);
-			ts_rec_found = true;
-			break;
-		}
+	if (record->ts_reg_info.in_use) {
+		record->ts_reg_info.in_use = false;
+		list_del(&record->wait_list_node);
+		ts_rec_found = true;
 	}
 
-	spin_unlock(&interrupt->wait_list_lock);
+	if (need_lock)
+		spin_unlock(&interrupt->wait_list_lock);
 
 	/* Put refcounts that were taken when we registered the event */
 	if (ts_rec_found) {
-		hl_mmap_mem_buf_put(pend->ts_reg_info.buf);
-		hl_cb_put(pend->ts_reg_info.cq_cb);
+		hl_mmap_mem_buf_put(record->ts_reg_info.buf);
+		hl_cb_put(record->ts_reg_info.cq_cb);
 	}
-
-put_buf:
-	hl_mmap_mem_buf_put(buff);
-
-	return rc;
 }
 
 static int ts_get_and_handle_kernel_record(struct hl_device *hdev, struct hl_ctx *ctx,
@@ -3308,6 +3277,7 @@ static int ts_get_and_handle_kernel_record(struct hl_device *hdev, struct hl_ctx
 {
 	struct hl_user_pending_interrupt *req_offset_record;
 	struct hl_ts_buff *ts_buff = data->buf->private;
+	bool need_lock = false;
 	int rc;
 
 	rc = validate_and_get_ts_record(data->buf->mmg->dev, ts_buff, data->ts_offset,
@@ -3315,21 +3285,30 @@ static int ts_get_and_handle_kernel_record(struct hl_device *hdev, struct hl_ctx
 	if (rc)
 		return rc;
 
-	/* In case the node already registered, need to unregister first then re-use*/
+	/* In case the node already registered, need to unregister first then re-use */
 	if (req_offset_record->ts_reg_info.in_use) {
 		dev_dbg(data->buf->mmg->dev,
-				"Requested ts offset(%llx) is in use, unregister first\n",
-							data->ts_offset);
+				"Requested record %p is in use on irq: %u ts addr: %p, unregister first then put on irq: %u\n",
+				req_offset_record,
+				req_offset_record->ts_reg_info.interrupt->interrupt_id,
+				req_offset_record->ts_reg_info.timestamp_kernel_addr,
+				data->interrupt->interrupt_id);
 		/*
 		 * Since interrupt here can be different than the one the node currently registered
-		 * on, and we don't wan't to lock two lists while we're doing unregister, so
+		 * on, and we don't want to lock two lists while we're doing unregister, so
 		 * unlock the new interrupt wait list here and acquire the lock again after you done
 		 */
-		spin_unlock_irqrestore(&data->interrupt->wait_list_lock, data->flags);
+		if (data->interrupt->interrupt_id !=
+				req_offset_record->ts_reg_info.interrupt->interrupt_id) {
 
-		unregister_timestamp_node(hdev, ctx, data->mmg, data->ts_handle,
-				data->ts_offset, req_offset_record->ts_reg_info.interrupt);
-		spin_lock_irqsave(&data->interrupt->wait_list_lock, data->flags);
+			need_lock = true;
+			spin_unlock(&data->interrupt->wait_list_lock);
+		}
+
+		unregister_timestamp_node(hdev, req_offset_record, need_lock);
+
+		if (need_lock)
+			spin_lock(&data->interrupt->wait_list_lock);
 	}
 
 	/* Fill up the new registration node info and add it to the list */
diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index 13f14b80a7d4..d31f228533c0 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -2033,7 +2033,9 @@ void hl_notifier_event_send_all(struct hl_device *hdev, u64 event_mask)
 int hl_device_init(struct hl_device *hdev)
 {
 	int i, rc, cq_cnt, user_interrupt_cnt, cq_ready_cnt;
+	struct hl_ts_free_jobs *free_jobs_data;
 	bool expose_interfaces_on_err = false;
+	void *p;
 
 	/* Initialize ASIC function pointers and perform early init */
 	rc = device_early_init(hdev);
@@ -2050,15 +2052,43 @@ int hl_device_init(struct hl_device *hdev)
 			rc = -ENOMEM;
 			goto early_fini;
 		}
+
+		/* Timestamp records supported only if CQ supported in device */
+		if (hdev->asic_prop.first_available_cq[0] != USHRT_MAX) {
+			for (i = 0 ; i < user_interrupt_cnt ; i++) {
+				p = vzalloc(TIMESTAMP_FREE_NODES_NUM *
+						sizeof(struct timestamp_reg_free_node));
+				if (!p) {
+					rc = -ENOMEM;
+					goto free_usr_intr_mem;
+				}
+				free_jobs_data = &hdev->user_interrupt[i].ts_free_jobs_data;
+				free_jobs_data->free_nodes_pool = p;
+				free_jobs_data->free_nodes_length = TIMESTAMP_FREE_NODES_NUM;
+				free_jobs_data->next_avail_free_node_idx = 0;
+			}
+		}
+	}
+
+	free_jobs_data = &hdev->common_user_cq_interrupt.ts_free_jobs_data;
+	p = vzalloc(TIMESTAMP_FREE_NODES_NUM *
+				sizeof(struct timestamp_reg_free_node));
+	if (!p) {
+		rc = -ENOMEM;
+		goto free_usr_intr_mem;
 	}
 
+	free_jobs_data->free_nodes_pool = p;
+	free_jobs_data->free_nodes_length = TIMESTAMP_FREE_NODES_NUM;
+	free_jobs_data->next_avail_free_node_idx = 0;
+
 	/*
 	 * Start calling ASIC initialization. First S/W then H/W and finally
 	 * late init
 	 */
 	rc = hdev->asic_funcs->sw_init(hdev);
 	if (rc)
-		goto free_usr_intr_mem;
+		goto free_common_usr_intr_mem;
 
 
 	/* initialize completion structure for multi CS wait */
@@ -2297,8 +2327,17 @@ int hl_device_init(struct hl_device *hdev)
 	hl_hw_queues_destroy(hdev);
 sw_fini:
 	hdev->asic_funcs->sw_fini(hdev);
+free_common_usr_intr_mem:
+	vfree(hdev->common_user_cq_interrupt.ts_free_jobs_data.free_nodes_pool);
 free_usr_intr_mem:
-	kfree(hdev->user_interrupt);
+	if (user_interrupt_cnt) {
+		for (i = 0 ; i < user_interrupt_cnt ; i++) {
+			if (!hdev->user_interrupt[i].ts_free_jobs_data.free_nodes_pool)
+				break;
+			vfree(hdev->user_interrupt[i].ts_free_jobs_data.free_nodes_pool);
+		}
+		kfree(hdev->user_interrupt);
+	}
 early_fini:
 	device_early_fini(hdev);
 out_disabled:
@@ -2323,6 +2362,7 @@ int hl_device_init(struct hl_device *hdev)
  */
 void hl_device_fini(struct hl_device *hdev)
 {
+	u32 user_interrupt_cnt;
 	bool device_in_reset;
 	ktime_t timeout;
 	u64 reset_sec;
@@ -2449,7 +2489,20 @@ void hl_device_fini(struct hl_device *hdev)
 	for (i = 0 ; i < hdev->asic_prop.completion_queues_count ; i++)
 		hl_cq_fini(hdev, &hdev->completion_queue[i]);
 	kfree(hdev->completion_queue);
-	kfree(hdev->user_interrupt);
+
+	user_interrupt_cnt = hdev->asic_prop.user_dec_intr_count +
+					hdev->asic_prop.user_interrupt_count;
+
+	if (user_interrupt_cnt) {
+		if (hdev->asic_prop.first_available_cq[0] != USHRT_MAX) {
+			for (i = 0 ; i < user_interrupt_cnt ; i++)
+				vfree(hdev->user_interrupt[i].ts_free_jobs_data.free_nodes_pool);
+		}
+
+		kfree(hdev->user_interrupt);
+	}
+
+	vfree(hdev->common_user_cq_interrupt.ts_free_jobs_data.free_nodes_pool);
 
 	hl_hw_queues_destroy(hdev);
 
diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
index 4c5d55c9109d..1342686d0ce5 100644
--- a/drivers/accel/habanalabs/common/habanalabs.h
+++ b/drivers/accel/habanalabs/common/habanalabs.h
@@ -106,6 +106,8 @@ struct hl_fpriv;
 /* MMU */
 #define MMU_HASH_TABLE_BITS		7 /* 1 << 7 buckets */
 
+#define TIMESTAMP_FREE_NODES_NUM	512
+
 /**
  * enum hl_mmu_page_table_location - mmu page table location
  * @MMU_DR_PGT: page-table is located on device DRAM.
@@ -1104,9 +1106,26 @@ enum hl_user_interrupt_type {
 	HL_USR_INTERRUPT_UNEXPECTED
 };
 
+/**
+ * struct hl_ts_free_jobs - holds user interrupt ts free nodes related data
+ * @free_nodes_pool: pool of nodes to be used for free timestamp jobs
+ * @free_nodes_length: number of nodes in free_nodes_pool
+ * @next_avail_free_node_idx: index of the next free node in the pool
+ *
+ * the free nodes pool must be protected by the user interrupt lock
+ * to avoid race between different interrupts which are using the same
+ * ts buffer with different offsets.
+ */
+struct hl_ts_free_jobs {
+	struct timestamp_reg_free_node *free_nodes_pool;
+	u32				free_nodes_length;
+	u32				next_avail_free_node_idx;
+};
+
 /**
  * struct hl_user_interrupt - holds user interrupt information
  * @hdev: pointer to the device structure
+ * @ts_free_jobs_data: timestamp free jobs related data
  * @type: user interrupt type
  * @wait_list_head: head to the list of user threads pending on this interrupt
  * @wait_list_lock: protects wait_list_head
@@ -1115,6 +1134,7 @@ enum hl_user_interrupt_type {
  */
 struct hl_user_interrupt {
 	struct hl_device		*hdev;
+	struct hl_ts_free_jobs		ts_free_jobs_data;
 	enum hl_user_interrupt_type	type;
 	struct list_head		wait_list_head;
 	spinlock_t			wait_list_lock;
@@ -1127,11 +1147,15 @@ struct hl_user_interrupt {
  * @free_objects_node: node in the list free_obj_jobs
  * @cq_cb: pointer to cq command buffer to be freed
  * @buf: pointer to timestamp buffer to be freed
+ * @in_use: indicates whether the node still in use in workqueue thread.
+ * @dynamic_alloc: indicates whether the node was allocated dynamically in the interrupt handler
  */
 struct timestamp_reg_free_node {
 	struct list_head	free_objects_node;
 	struct hl_cb		*cq_cb;
 	struct hl_mmap_mem_buf	*buf;
+	atomic_t		in_use;
+	u8			dynamic_alloc;
 };
 
 /* struct timestamp_reg_work_obj - holds the timestamp registration free objects job
@@ -1140,11 +1164,14 @@ struct timestamp_reg_free_node {
  * @free_obj: workqueue object to free timestamp registration node objects
  * @hdev: pointer to the device structure
  * @free_obj_head: list of free jobs nodes (node type timestamp_reg_free_node)
+ * @dynamic_alloc_free_obj_head: list of free jobs nodes which were dynamically allocated in the
+ *                               interrupt handler.
  */
 struct timestamp_reg_work_obj {
 	struct work_struct	free_obj;
 	struct hl_device	*hdev;
 	struct list_head	*free_obj_head;
+	struct list_head	*dynamic_alloc_free_obj_head;
 };
 
 /* struct timestamp_reg_info - holds the timestamp registration related data.
diff --git a/drivers/accel/habanalabs/common/irq.c b/drivers/accel/habanalabs/common/irq.c
index 058f27040805..0947d286a5ab 100644
--- a/drivers/accel/habanalabs/common/irq.c
+++ b/drivers/accel/habanalabs/common/irq.c
@@ -204,8 +204,10 @@ static void hl_ts_free_objects(struct work_struct *work)
 {
 	struct timestamp_reg_work_obj *job =
 			container_of(work, struct timestamp_reg_work_obj, free_obj);
+	struct list_head *dynamic_alloc_free_list_head = job->dynamic_alloc_free_obj_head;
 	struct timestamp_reg_free_node *free_obj, *temp_free_obj;
 	struct list_head *free_list_head = job->free_obj_head;
+
 	struct hl_device *hdev = job->hdev;
 
 	list_for_each_entry_safe(free_obj, temp_free_obj, free_list_head, free_objects_node) {
@@ -215,10 +217,28 @@ static void hl_ts_free_objects(struct work_struct *work)
 
 		hl_mmap_mem_buf_put(free_obj->buf);
 		hl_cb_put(free_obj->cq_cb);
-		kfree(free_obj);
+		atomic_set(&free_obj->in_use, 0);
 	}
 
 	kfree(free_list_head);
+
+	if (dynamic_alloc_free_list_head) {
+		list_for_each_entry_safe(free_obj, temp_free_obj, dynamic_alloc_free_list_head,
+								free_objects_node) {
+			dev_dbg(hdev->dev,
+				"Dynamic_Alloc list: About to put refcount to buf (%p) cq_cb(%p)\n",
+						free_obj->buf,
+						free_obj->cq_cb);
+
+			hl_mmap_mem_buf_put(free_obj->buf);
+			hl_cb_put(free_obj->cq_cb);
+			list_del(&free_obj->free_objects_node);
+			kfree(free_obj);
+		}
+
+		kfree(dynamic_alloc_free_list_head);
+	}
+
 	kfree(job);
 }
 
@@ -233,12 +253,18 @@ static void hl_ts_free_objects(struct work_struct *work)
  * list to a dedicated workqueue to do the actual put.
  */
 static int handle_registration_node(struct hl_device *hdev, struct hl_user_pending_interrupt *pend,
-						struct list_head **free_list, ktime_t now,
-						u32 interrupt_id)
+						struct list_head **free_list,
+						struct list_head **dynamic_alloc_list,
+						struct hl_user_interrupt *intr)
 {
+	struct hl_ts_free_jobs *ts_free_jobs_data;
 	struct timestamp_reg_free_node *free_node;
+	u32 free_node_index;
 	u64 timestamp;
 
+	ts_free_jobs_data = &intr->ts_free_jobs_data;
+	free_node_index = ts_free_jobs_data->next_avail_free_node_idx;
+
 	if (!(*free_list)) {
 		/* Alloc/Init the timestamp registration free objects list */
 		*free_list = kmalloc(sizeof(struct list_head), GFP_ATOMIC);
@@ -248,16 +274,35 @@ static int handle_registration_node(struct hl_device *hdev, struct hl_user_pendi
 		INIT_LIST_HEAD(*free_list);
 	}
 
-	free_node = kmalloc(sizeof(*free_node), GFP_ATOMIC);
-	if (!free_node)
-		return -ENOMEM;
+	free_node = &ts_free_jobs_data->free_nodes_pool[free_node_index];
+	if (atomic_cmpxchg(&free_node->in_use, 0, 1)) {
+		dev_dbg(hdev->dev,
+			"Timestamp free node pool is full, buff: %p, record: %p, irq: %u\n",
+				pend->ts_reg_info.buf,
+				pend,
+				intr->interrupt_id);
 
-	timestamp = ktime_to_ns(now);
+		if (!(*dynamic_alloc_list)) {
+			*dynamic_alloc_list = kmalloc(sizeof(struct list_head), GFP_ATOMIC);
+			if (!(*dynamic_alloc_list))
+				return -ENOMEM;
+
+			INIT_LIST_HEAD(*dynamic_alloc_list);
+		}
+
+		free_node = kmalloc(sizeof(struct timestamp_reg_free_node), GFP_ATOMIC);
+		if (!free_node)
+			return -ENOMEM;
+
+		free_node->dynamic_alloc = 1;
+	}
+
+	timestamp = ktime_to_ns(intr->timestamp);
 
 	*pend->ts_reg_info.timestamp_kernel_addr = timestamp;
 
 	dev_dbg(hdev->dev, "Irq handle: Timestamp record (%p) ts cb address (%p), interrupt_id: %u\n",
-			pend, pend->ts_reg_info.timestamp_kernel_addr, interrupt_id);
+			pend, pend->ts_reg_info.timestamp_kernel_addr, intr->interrupt_id);
 
 	list_del(&pend->wait_list_node);
 
@@ -266,7 +311,14 @@ static int handle_registration_node(struct hl_device *hdev, struct hl_user_pendi
 	 */
 	free_node->buf = pend->ts_reg_info.buf;
 	free_node->cq_cb = pend->ts_reg_info.cq_cb;
-	list_add(&free_node->free_objects_node, *free_list);
+
+	if (free_node->dynamic_alloc) {
+		list_add(&free_node->free_objects_node, *dynamic_alloc_list);
+	} else {
+		ts_free_jobs_data->next_avail_free_node_idx =
+				(++free_node_index) % ts_free_jobs_data->free_nodes_length;
+		list_add(&free_node->free_objects_node, *free_list);
+	}
 
 	/* Mark TS record as free */
 	pend->ts_reg_info.in_use = false;
@@ -276,8 +328,8 @@ static int handle_registration_node(struct hl_device *hdev, struct hl_user_pendi
 
 static void handle_user_interrupt(struct hl_device *hdev, struct hl_user_interrupt *intr)
 {
+	struct list_head *ts_reg_free_list_head = NULL, *dynamic_alloc_list_head = NULL;
 	struct hl_user_pending_interrupt *pend, *temp_pend;
-	struct list_head *ts_reg_free_list_head = NULL;
 	struct timestamp_reg_work_obj *job;
 	bool reg_node_handle_fail = false;
 	int rc;
@@ -303,8 +355,8 @@ static void handle_user_interrupt(struct hl_device *hdev, struct hl_user_interru
 			if (pend->ts_reg_info.buf) {
 				if (!reg_node_handle_fail) {
 					rc = handle_registration_node(hdev, pend,
-							&ts_reg_free_list_head, intr->timestamp,
-							intr->interrupt_id);
+							&ts_reg_free_list_head,
+							&dynamic_alloc_list_head, intr);
 					if (rc)
 						reg_node_handle_fail = true;
 				}
@@ -320,6 +372,7 @@ static void handle_user_interrupt(struct hl_device *hdev, struct hl_user_interru
 	if (ts_reg_free_list_head) {
 		INIT_WORK(&job->free_obj, hl_ts_free_objects);
 		job->free_obj_head = ts_reg_free_list_head;
+		job->dynamic_alloc_free_obj_head = dynamic_alloc_list_head;
 		job->hdev = hdev;
 		queue_work(hdev->ts_free_obj_wq, &job->free_obj);
 	} else {
-- 
2.34.1

