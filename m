Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9522F7FEA73
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 09:26:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F22110E116;
	Thu, 30 Nov 2023 08:26:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FE1B10E116
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 08:26:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id CED65CE20F8;
 Thu, 30 Nov 2023 08:26:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFA02C433C8;
 Thu, 30 Nov 2023 08:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701332763;
 bh=QgVPutbqyRUDhDO+g/5fzn+HvfLglkD5XuWkKhqIotE=;
 h=From:To:Cc:Subject:Date:From;
 b=DNdXQu4TbQK+FkfP0IcS07UXpMJNwMr1GKUWjCopK2SfSX1eMERjCBC7NcOlqi/N1
 WfEBA0V0+1S5Mcg98nFafVgGLiqTTWx//NdWikqSEvmG5FP8XD/QSAjUQhf22RJpAO
 N/hrtMfYs1l+8aIyBUWDFutLosqQIkFGvFZ/WEb79zf2fn2CpkY8JMrZGbqwjMj0gF
 hOsvSu1t1kPj40NJcc5A29ysGlcwmqkn1/vNTNqSzNnHlNuCVFbs4dsA1wMx+lEI7a
 Q+lnqsuXsb4xrwUdevtEFoNoEd+Yuxqrn+/XWm4sEcUoZfPZq4dJKzMX+OJum+uqMT
 cimG+Zm8Vdt2Q==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] accel/habanalabs/gaudi2: use correct registers to dump QM
 CQ info
Date: Thu, 30 Nov 2023 10:25:56 +0200
Message-Id: <20231130082557.1783532-1-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
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

The QM CQ PTR_LO/PTR_HI/TSIZE registers are for pushing a CQ entry, and
although they are updated by HW even when descriptors are fetched by PQ
and CB addresses are fed into CQ, the correct registers to use when
dumping the CQ info are the ones with the _STS suffix.

Signed-off-by: Tomer Tayar <ttayar@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/gaudi2/gaudi2.c             | 12 ++++++------
 .../habanalabs/include/gaudi2/asic_reg/gaudi2_regs.h | 12 ++++++------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index 77c480725a84..bf537c2082cd 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -7868,15 +7868,15 @@ static void handle_lower_qman_data_on_err(struct hl_device *hdev, u64 qman_base,
 	is_arc_cq = FIELD_GET(PDMA0_QM_CP_STS_CUR_CQ_MASK, cp_sts); /* 0 - legacy CQ, 1 - ARC_CQ */
 
 	if (is_arc_cq) {
-		lo = RREG32(qman_base + QM_ARC_CQ_PTR_LO_OFFSET);
-		hi = RREG32(qman_base + QM_ARC_CQ_PTR_HI_OFFSET);
+		lo = RREG32(qman_base + QM_ARC_CQ_PTR_LO_STS_OFFSET);
+		hi = RREG32(qman_base + QM_ARC_CQ_PTR_HI_STS_OFFSET);
 		cq_ptr = ((u64) hi) << 32 | lo;
-		cq_ptr_size = RREG32(qman_base + QM_ARC_CQ_TSIZE_OFFSET);
+		cq_ptr_size = RREG32(qman_base + QM_ARC_CQ_TSIZE_STS_OFFSET);
 	} else {
-		lo = RREG32(qman_base + QM_CQ_PTR_LO_4_OFFSET);
-		hi = RREG32(qman_base + QM_CQ_PTR_HI_4_OFFSET);
+		lo = RREG32(qman_base + QM_CQ_PTR_LO_STS_4_OFFSET);
+		hi = RREG32(qman_base + QM_CQ_PTR_HI_STS_4_OFFSET);
 		cq_ptr = ((u64) hi) << 32 | lo;
-		cq_ptr_size = RREG32(qman_base + QM_CQ_TSIZE_4_OFFSET);
+		cq_ptr_size = RREG32(qman_base + QM_CQ_TSIZE_STS_4_OFFSET);
 	}
 
 	lo = RREG32(qman_base + QM_CP_CURRENT_INST_LO_4_OFFSET);
diff --git a/drivers/accel/habanalabs/include/gaudi2/asic_reg/gaudi2_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/gaudi2_regs.h
index 8018214a7b59..d21fcd3880b4 100644
--- a/drivers/accel/habanalabs/include/gaudi2/asic_reg/gaudi2_regs.h
+++ b/drivers/accel/habanalabs/include/gaudi2/asic_reg/gaudi2_regs.h
@@ -242,13 +242,13 @@
 #define QM_FENCE2_OFFSET		(mmPDMA0_QM_CP_FENCE2_RDATA_0 - mmPDMA0_QM_BASE)
 #define QM_SEI_STATUS_OFFSET		(mmPDMA0_QM_SEI_STATUS - mmPDMA0_QM_BASE)
 
-#define QM_CQ_PTR_LO_4_OFFSET		(mmPDMA0_QM_CQ_PTR_LO_4 - mmPDMA0_QM_BASE)
-#define QM_CQ_PTR_HI_4_OFFSET		(mmPDMA0_QM_CQ_PTR_HI_4 - mmPDMA0_QM_BASE)
-#define QM_CQ_TSIZE_4_OFFSET		(mmPDMA0_QM_CQ_TSIZE_4 - mmPDMA0_QM_BASE)
+#define QM_CQ_TSIZE_STS_4_OFFSET	(mmPDMA0_QM_CQ_TSIZE_STS_4 - mmPDMA0_QM_BASE)
+#define QM_CQ_PTR_LO_STS_4_OFFSET	(mmPDMA0_QM_CQ_PTR_LO_STS_4 - mmPDMA0_QM_BASE)
+#define QM_CQ_PTR_HI_STS_4_OFFSET	(mmPDMA0_QM_CQ_PTR_HI_STS_4 - mmPDMA0_QM_BASE)
 
-#define QM_ARC_CQ_PTR_LO_OFFSET		(mmPDMA0_QM_ARC_CQ_PTR_LO - mmPDMA0_QM_BASE)
-#define QM_ARC_CQ_PTR_HI_OFFSET		(mmPDMA0_QM_ARC_CQ_PTR_HI - mmPDMA0_QM_BASE)
-#define QM_ARC_CQ_TSIZE_OFFSET		(mmPDMA0_QM_ARC_CQ_TSIZE - mmPDMA0_QM_BASE)
+#define QM_ARC_CQ_TSIZE_STS_OFFSET	(mmPDMA0_QM_ARC_CQ_TSIZE_STS - mmPDMA0_QM_BASE)
+#define QM_ARC_CQ_PTR_LO_STS_OFFSET	(mmPDMA0_QM_ARC_CQ_PTR_LO_STS - mmPDMA0_QM_BASE)
+#define QM_ARC_CQ_PTR_HI_STS_OFFSET	(mmPDMA0_QM_ARC_CQ_PTR_HI_STS - mmPDMA0_QM_BASE)
 
 #define QM_CP_STS_4_OFFSET		(mmPDMA0_QM_CP_STS_4 - mmPDMA0_QM_BASE)
 #define QM_CP_CURRENT_INST_LO_4_OFFSET	(mmPDMA0_QM_CP_CURRENT_INST_LO_4 - mmPDMA0_QM_BASE)
-- 
2.34.1

