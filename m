Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9B56CFC96
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 09:22:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB82310E17D;
	Thu, 30 Mar 2023 07:22:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C129D10E17D
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 07:22:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 52C18B825DB;
 Thu, 30 Mar 2023 07:22:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B69AC433D2;
 Thu, 30 Mar 2023 07:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680160940;
 bh=DVxIn3liM6dYhI7nOgrenk2CQU1ESOj+SnRpV1vNFAU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Qq9pBOeD0lXUGLrObKzDYKRo4aRS8C0Qnt+JlBoYeSzIL5Qg4VknD9Ssq0Vjjgs//
 9eNMBMvDPG1GnhSacWX1bRfgOSYputm2Bn1I5bdDNwv4B/ACvQL5HsxegXHzye/zhx
 SK0hZSfSooR1eh7IsIw48HtfTh57hmtxmJfbjcTjmX7yHBltKZcf+eCCyKbKovv9aR
 Jnu/aqiToOz2i5JjPP+kHeAp0T4crlY3Uko4ULUyVKjpfwno+wY4x9DApr6yQW0KMA
 GZ+lq8c6rloUCWId/2MV6zxR+C3copwP2lU7uNvwXztucfxPDUmIAJIjT9JDq3WB/U
 CpdKMcAMtrsDw==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/7] accel/habanalabs: remove completion from abnormal
 interrupt work name
Date: Thu, 30 Mar 2023 10:22:08 +0300
Message-Id: <20230330072213.1596318-2-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230330072213.1596318-1-ogabbay@kernel.org>
References: <20230330072213.1596318-1-ogabbay@kernel.org>
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

Decoder abnormal interrupts are for errors and not for completion, so
rename the relevant work and work function to not include 'completion'.

Signed-off-by: Tomer Tayar <ttayar@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/decoder.c    | 22 +++++++-------------
 drivers/accel/habanalabs/common/habanalabs.h | 10 ++++-----
 drivers/accel/habanalabs/common/irq.c        |  2 +-
 3 files changed, 14 insertions(+), 20 deletions(-)

diff --git a/drivers/accel/habanalabs/common/decoder.c b/drivers/accel/habanalabs/common/decoder.c
index 69c78c1784b4..59a1ecb20c04 100644
--- a/drivers/accel/habanalabs/common/decoder.c
+++ b/drivers/accel/habanalabs/common/decoder.c
@@ -43,22 +43,24 @@ static void dec_print_abnrm_intr_source(struct hl_device *hdev, u32 irq_status)
 		intr_source[2], intr_source[3], intr_source[4], intr_source[5]);
 }
 
-static void dec_error_intr_work(struct hl_device *hdev, u32 base_addr, u32 core_id)
+static void dec_abnrm_intr_work(struct work_struct *work)
 {
+	struct hl_dec *dec = container_of(work, struct hl_dec, abnrm_intr_work);
+	struct hl_device *hdev = dec->hdev;
 	bool reset_required = false;
 	u32 irq_status, event_mask;
 
-	irq_status = RREG32(base_addr + VCMD_IRQ_STATUS_OFFSET);
+	irq_status = RREG32(dec->base_addr + VCMD_IRQ_STATUS_OFFSET);
 
-	dev_err(hdev->dev, "Decoder abnormal interrupt %#x, core %d\n", irq_status, core_id);
+	dev_err(hdev->dev, "Decoder abnormal interrupt %#x, core %d\n", irq_status, dec->core_id);
 
 	dec_print_abnrm_intr_source(hdev, irq_status);
 
 	/* Clear the interrupt */
-	WREG32(base_addr + VCMD_IRQ_STATUS_OFFSET, irq_status);
+	WREG32(dec->base_addr + VCMD_IRQ_STATUS_OFFSET, irq_status);
 
 	/* Flush the interrupt clear */
-	RREG32(base_addr + VCMD_IRQ_STATUS_OFFSET);
+	RREG32(dec->base_addr + VCMD_IRQ_STATUS_OFFSET);
 
 	if (irq_status & VCMD_IRQ_STATUS_TIMEOUT_MASK) {
 		reset_required = true;
@@ -77,14 +79,6 @@ static void dec_error_intr_work(struct hl_device *hdev, u32 base_addr, u32 core_
 	}
 }
 
-static void dec_completion_abnrm(struct work_struct *work)
-{
-	struct hl_dec *dec = container_of(work, struct hl_dec, completion_abnrm_work);
-	struct hl_device *hdev = dec->hdev;
-
-	dec_error_intr_work(hdev, dec->base_addr, dec->core_id);
-}
-
 void hl_dec_fini(struct hl_device *hdev)
 {
 	kfree(hdev->dec);
@@ -108,7 +102,7 @@ int hl_dec_init(struct hl_device *hdev)
 		dec = hdev->dec + j;
 
 		dec->hdev = hdev;
-		INIT_WORK(&dec->completion_abnrm_work, dec_completion_abnrm);
+		INIT_WORK(&dec->abnrm_intr_work, dec_abnrm_intr_work);
 		dec->core_id = j;
 		dec->base_addr = hdev->asic_funcs->get_dec_base_addr(hdev, j);
 		if (!dec->base_addr) {
diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
index a6f5c2152b0a..7b6ad3d7dbaa 100644
--- a/drivers/accel/habanalabs/common/habanalabs.h
+++ b/drivers/accel/habanalabs/common/habanalabs.h
@@ -1211,15 +1211,15 @@ struct hl_eq {
 /**
  * struct hl_dec - describes a decoder sw instance.
  * @hdev: pointer to the device structure.
- * @completion_abnrm_work: workqueue object to run when decoder generates an error interrupt
+ * @abnrm_intr_work: workqueue work item to run when decoder generates an error interrupt.
  * @core_id: ID of the decoder.
  * @base_addr: base address of the decoder.
  */
 struct hl_dec {
-	struct hl_device		*hdev;
-	struct work_struct		completion_abnrm_work;
-	u32				core_id;
-	u32				base_addr;
+	struct hl_device	*hdev;
+	struct work_struct	abnrm_intr_work;
+	u32			core_id;
+	u32			base_addr;
 };
 
 /**
diff --git a/drivers/accel/habanalabs/common/irq.c b/drivers/accel/habanalabs/common/irq.c
index 0d59bb7c9063..c67895b1cdeb 100644
--- a/drivers/accel/habanalabs/common/irq.c
+++ b/drivers/accel/habanalabs/common/irq.c
@@ -489,7 +489,7 @@ irqreturn_t hl_irq_handler_dec_abnrm(int irq, void *arg)
 {
 	struct hl_dec *dec = arg;
 
-	schedule_work(&dec->completion_abnrm_work);
+	schedule_work(&dec->abnrm_intr_work);
 
 	return IRQ_HANDLED;
 }
-- 
2.40.0

