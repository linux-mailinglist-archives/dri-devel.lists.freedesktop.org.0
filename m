Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED267138D2
	for <lists+dri-devel@lfdr.de>; Sun, 28 May 2023 11:04:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CBEA10E03E;
	Sun, 28 May 2023 09:04:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 877B110E03C
 for <dri-devel@lists.freedesktop.org>; Sun, 28 May 2023 09:04:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EDAB160C8F;
 Sun, 28 May 2023 09:04:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79C99C4339B;
 Sun, 28 May 2023 09:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685264675;
 bh=NouFgewvZ/WLd2d0vp0qGKDd9bzE6ZxNbhLBh6hMzJw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EoDLS1INkVQjrCmiowGyD3mTK2pxOSwWDDiyPuzMSAT0zEyCTUUz/i3RVKIYIuEPd
 1tR5aGFSeuaYPe8o2z8UpFH5+dB0PyXkdic8M7BlrAkIm0+sDFtswU+CyOX6qytUxH
 G3vucySX/6ttUZ16CTnTG20ikknBWQo0lsjf2HwGGqc2hqHZG9JW0WA/y5NTZohFNg
 Ua3OqDV9gbVv0YwPVK9ShUpNL0U2WQ8i0y3DbtLbtFUzKQqsrDezxFE7XuLC1xadhO
 uSdFvWDvvem8tt81v35jcyWmYrARsX62lASiOzyRigcXQi0UXmwIpy5yq+o5UrAt1F
 UnQMwPPKQSLGg==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] accel/habanalabs: add event queue extra validation
Date: Sun, 28 May 2023 12:04:27 +0300
Message-Id: <20230528090428.1948778-2-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230528090428.1948778-1-ogabbay@kernel.org>
References: <20230528090428.1948778-1-ogabbay@kernel.org>
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
Cc: Ofir Bitton <obitton@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ofir Bitton <obitton@habana.ai>

In order to increase reliability of the event queue interface,
we apply to Gaudi2 the same mechanism we have in Gaudi1.
The extra validation is basically checking that the received
event index matches the expected index.

Signed-off-by: Ofir Bitton <obitton@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/irq.c    | 2 +-
 drivers/accel/habanalabs/gaudi2/gaudi2.c | 6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/habanalabs/common/irq.c b/drivers/accel/habanalabs/common/irq.c
index c67895b1cdeb..b1010d206c2e 100644
--- a/drivers/accel/habanalabs/common/irq.c
+++ b/drivers/accel/habanalabs/common/irq.c
@@ -430,7 +430,7 @@ irqreturn_t hl_irq_handler_eq(int irq, void *arg)
 		cur_eqe_index = FIELD_GET(EQ_CTL_INDEX_MASK, cur_eqe);
 		if ((hdev->event_queue.check_eqe_index) &&
 				(((eq->prev_eqe_index + 1) & EQ_CTL_INDEX_MASK) != cur_eqe_index)) {
-			dev_dbg(hdev->dev,
+			dev_err(hdev->dev,
 				"EQE %#x in queue is ready but index does not match %d!=%d",
 				cur_eqe,
 				((eq->prev_eqe_index + 1) & EQ_CTL_INDEX_MASK),
diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index 0d41adf4792c..20c4583f12b0 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -3619,6 +3619,12 @@ static int gaudi2_sw_init(struct hl_device *hdev)
 
 	prop->supports_compute_reset = true;
 
+	/* Event queue sanity check added in FW version 1.11 */
+	if (hl_is_fw_sw_ver_below(hdev, 1, 11))
+		hdev->event_queue.check_eqe_index = false;
+	else
+		hdev->event_queue.check_eqe_index = true;
+
 	hdev->asic_funcs->set_pci_memory_regions(hdev);
 
 	rc = gaudi2_special_blocks_iterator_config(hdev);
-- 
2.40.1

