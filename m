Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0338CFFA2
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 14:13:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87EC710E095;
	Mon, 27 May 2024 12:13:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="vF1NwWg+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98D7810ED94
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 12:13:06 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1716811982; bh=U9MPkc2aHrKjb35j4wkT+YPsoCL4v2hDv0CLivsUJDc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vF1NwWg+FaHiAOT9UF/be/Exbyf0JagRctd5W1240nR69rSZyVqMc+3sajkv0p144
 9DI0qn8a7168/9Po2LX/b7xKvJKqc0xR4uZrUO1M+l19XiHyMk6vDNZAeVRxwekDe9
 xWO8blujS6AVMwx8h1q328h3SW6nha1bx24PlN1i3tGFrX2FvVHPcE8/oSYwiiM6wb
 y4knMVBLSJ5LyWOjDFBXUSTT00O/ycaFCUR+xv5/l84TGOdOM6mGTziv9ba6OoF1Gy
 mrWKgY/6o6WdC4GTNh4DzfSaxc2HptEkiTQxOE89jwsGVgIA/hODjBf+dguAO3i9JQ
 ghDkY2i84NZiw==
Received: from obitton-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by obitton-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 44RCCuax1921351; Mon, 27 May 2024 15:12:57 +0300
From: Ofir Bitton <obitton@habana.ai>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Tomer Tayar <ttayar@habana.ai>
Subject: [PATCH 7/8] accel/habanalabs: add an EQ size ASIC property
Date: Mon, 27 May 2024 15:12:53 +0300
Message-Id: <20240527121254.1921306-7-obitton@habana.ai>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240527121254.1921306-1-obitton@habana.ai>
References: <20240527121254.1921306-1-obitton@habana.ai>
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

From: Tomer Tayar <ttayar@habana.ai>

Future supported ASICs might use the dynamic EQ mechanism with the
firmware, and in that case the EQ size won't be equal to the default
HL_EQ_SIZE_IN_BYTES value.
Add an ASIC property to enable overriding this value.

Signed-off-by: Tomer Tayar <ttayar@habana.ai>
Reviewed-by: Ofir Bitton <obitton@habana.ai>
---
 drivers/accel/habanalabs/common/habanalabs.h | 5 +++++
 drivers/accel/habanalabs/common/irq.c        | 8 +++++---
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
index 5e9f54ca336a..8d0df685e627 100644
--- a/drivers/accel/habanalabs/common/habanalabs.h
+++ b/drivers/accel/habanalabs/common/habanalabs.h
@@ -651,6 +651,8 @@ struct hl_hints_range {
  * @hbw_flush_reg: register to read to generate HBW flush. value of 0 means HBW flush is
  *                 not supported.
  * @reserved_fw_mem_size: size of dram memory reserved for FW.
+ * @fw_event_queue_size: queue size for events from CPU-CP.
+ *                       A value of 0 means using the default HL_EQ_SIZE_IN_BYTES value.
  * @collective_first_sob: first sync object available for collective use
  * @collective_first_mon: first monitor available for collective use
  * @sync_stream_first_sob: first sync object available for sync stream use
@@ -782,6 +784,7 @@ struct asic_fixed_properties {
 	u32				glbl_err_max_cause_num;
 	u32				hbw_flush_reg;
 	u32				reserved_fw_mem_size;
+	u32				fw_event_queue_size;
 	u16				collective_first_sob;
 	u16				collective_first_mon;
 	u16				sync_stream_first_sob;
@@ -1229,6 +1232,7 @@ struct hl_user_pending_interrupt {
  * @hdev: pointer to the device structure
  * @kernel_address: holds the queue's kernel virtual address
  * @bus_address: holds the queue's DMA address
+ * @size: the event queue size
  * @ci: ci inside the queue
  * @prev_eqe_index: the index of the previous event queue entry. The index of
  *                  the current entry's index must be +1 of the previous one.
@@ -1240,6 +1244,7 @@ struct hl_eq {
 	struct hl_device	*hdev;
 	void			*kernel_address;
 	dma_addr_t		bus_address;
+	u32			size;
 	u32			ci;
 	u32			prev_eqe_index;
 	bool			check_eqe_index;
diff --git a/drivers/accel/habanalabs/common/irq.c b/drivers/accel/habanalabs/common/irq.c
index 978b7f4d5eeb..2caf2df4de08 100644
--- a/drivers/accel/habanalabs/common/irq.c
+++ b/drivers/accel/habanalabs/common/irq.c
@@ -652,14 +652,16 @@ void hl_cq_reset(struct hl_device *hdev, struct hl_cq *q)
  */
 int hl_eq_init(struct hl_device *hdev, struct hl_eq *q)
 {
+	u32 size = hdev->asic_prop.fw_event_queue_size ? : HL_EQ_SIZE_IN_BYTES;
 	void *p;
 
-	p = hl_cpu_accessible_dma_pool_alloc(hdev, HL_EQ_SIZE_IN_BYTES, &q->bus_address);
+	p = hl_cpu_accessible_dma_pool_alloc(hdev, size, &q->bus_address);
 	if (!p)
 		return -ENOMEM;
 
 	q->hdev = hdev;
 	q->kernel_address = p;
+	q->size = size;
 	q->ci = 0;
 	q->prev_eqe_index = 0;
 
@@ -678,7 +680,7 @@ void hl_eq_fini(struct hl_device *hdev, struct hl_eq *q)
 {
 	flush_workqueue(hdev->eq_wq);
 
-	hl_cpu_accessible_dma_pool_free(hdev, HL_EQ_SIZE_IN_BYTES, q->kernel_address);
+	hl_cpu_accessible_dma_pool_free(hdev, q->size, q->kernel_address);
 }
 
 void hl_eq_reset(struct hl_device *hdev, struct hl_eq *q)
@@ -693,5 +695,5 @@ void hl_eq_reset(struct hl_device *hdev, struct hl_eq *q)
 	 * when the device is operational again
 	 */
 
-	memset(q->kernel_address, 0, HL_EQ_SIZE_IN_BYTES);
+	memset(q->kernel_address, 0, q->size);
 }
-- 
2.34.1

