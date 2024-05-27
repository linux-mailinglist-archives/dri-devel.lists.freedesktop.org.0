Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 765048D0520
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 17:02:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57F0210E774;
	Mon, 27 May 2024 15:02:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="Y6/M1a2h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 722DD10E3BD
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 15:02:35 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1716822162; bh=PZJIzad51lipFAHvPkTrc6zNNzNFwz6JZWAXDJXz+zs=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Y6/M1a2hlOV2P5yxkk35EU6rN/XFtO/V97JMUNWgiA/gJKKCcCNrU8ca+gPJwyy+V
 +1V1Y0jTNnq7HMgpGM5GtdNqU/UQOjCeEofq2EpSYRlAA/Ycge5icZ+b8J+X+x4ZOE
 P/zKT5ucAvX9q1cMP8ASyOYA7MuDkzSgrB6teOjOjPuShV4h1CNMQfW9BELTpRjxgF
 4WfLy0JO1TJJ/l/TbE+W2uZlMPM48NiYT6kS5GSXpiJlCVW5rGNNblZICjbAwcbc7c
 IVuYEiqLlzvTxXNyjFUF+/APB/n6dr+hmVtZk4UeUPjaXvLNIdJh6JRwUL7IKiLXJx
 3KnylbaNzhEQg==
Received: from obitton-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by obitton-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 44RF2PiW1954007; Mon, 27 May 2024 18:02:26 +0300
From: Ofir Bitton <obitton@habana.ai>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/8] accel/habanalabs: remove timestamp registration debug
 prints
Date: Mon, 27 May 2024 18:02:21 +0300
Message-Id: <20240527150224.1953969-5-obitton@habana.ai>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240527150224.1953969-1-obitton@habana.ai>
References: <20240527150224.1953969-1-obitton@habana.ai>
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

There are several timestamp registration debug prints which
spams the kernel log whenever dyn debug is enabled.
Remove those prints.

Signed-off-by: Ofir Bitton <obitton@habana.ai>
---
 .../accel/habanalabs/common/command_submission.c    | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/accel/habanalabs/common/command_submission.c b/drivers/accel/habanalabs/common/command_submission.c
index 39e23d625a3c..59823e3c3bf7 100644
--- a/drivers/accel/habanalabs/common/command_submission.c
+++ b/drivers/accel/habanalabs/common/command_submission.c
@@ -3284,12 +3284,6 @@ static int ts_get_and_handle_kernel_record(struct hl_device *hdev, struct hl_ctx
 
 	/* In case the node already registered, need to unregister first then re-use */
 	if (req_offset_record->ts_reg_info.in_use) {
-		dev_dbg(data->buf->mmg->dev,
-				"Requested record %p is in use on irq: %u ts addr: %p, unregister first then put on irq: %u\n",
-				req_offset_record,
-				req_offset_record->ts_reg_info.interrupt->interrupt_id,
-				req_offset_record->ts_reg_info.timestamp_kernel_addr,
-				data->interrupt->interrupt_id);
 		/*
 		 * Since interrupt here can be different than the one the node currently registered
 		 * on, and we don't want to lock two lists while we're doing unregister, so
@@ -3345,10 +3339,6 @@ static int _hl_interrupt_ts_reg_ioctl(struct hl_device *hdev, struct hl_ctx *ctx
 		goto put_cq_cb;
 	}
 
-	dev_dbg(hdev->dev, "Timestamp registration: interrupt id: %u, handle: 0x%llx, ts offset: %llu, cq_offset: %llu\n",
-					data->interrupt->interrupt_id, data->ts_handle,
-					data->ts_offset, data->cq_offset);
-
 	data->buf = hl_mmap_mem_buf_get(data->mmg, data->ts_handle);
 	if (!data->buf) {
 		rc = -EINVAL;
@@ -3370,9 +3360,6 @@ static int _hl_interrupt_ts_reg_ioctl(struct hl_device *hdev, struct hl_ctx *ctx
 	if (*pend->cq_kernel_addr >= data->target_value) {
 		spin_unlock_irqrestore(&data->interrupt->ts_list_lock, flags);
 
-		dev_dbg(hdev->dev, "Target value already reached release ts record: pend: %p, offset: %llu, interrupt: %u\n",
-				pend, data->ts_offset, data->interrupt->interrupt_id);
-
 		pend->ts_reg_info.in_use = 0;
 		*status = HL_WAIT_CS_STATUS_COMPLETED;
 		*pend->ts_reg_info.timestamp_kernel_addr = ktime_get_ns();
-- 
2.34.1

