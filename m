Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 745B36939E6
	for <lists+dri-devel@lfdr.de>; Sun, 12 Feb 2023 21:45:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E33A10E46C;
	Sun, 12 Feb 2023 20:45:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E05A10E468
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Feb 2023 20:45:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 61F8CB80B1A;
 Sun, 12 Feb 2023 20:45:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A106C433D2;
 Sun, 12 Feb 2023 20:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676234715;
 bh=CgyHbDJQN9M8sTIM9Te7c4gqzOyvniav4Ytt2Ib3DVM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=THeCRF2ngBdFSByB9d0dCCjsvwh6g7k09Oj3qyYkb7QgaH/4uerZ4AI+QCcNaSjcW
 2o0tgUWW/ItKRqLHLnD+saE8IwZwuucoJet5ePsUKEAQmjx6eY6BTCxIAwQNgFyccP
 TIMFAE3pANKWSCikIifTKpbtttutWrk/qv3vatwKPrdIYZv+QYPgEe8+7HXqwRDkyf
 XtoUtTZ1354UeGEvC8u85CHrflvkjkbNW9oRS6slS0ah7uxyicoztmDyeICbh2ZtAV
 jB+90pDJo+Aux4YHOZLN2v5RrnLWhpP6wnwEG2R0aJpuw60pQzk0thEW2xex6COhXd
 7E/QuFjVa4poQ==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 07/27] habanalabs/gaudi2: fix address decode RAZWI handling
Date: Sun, 12 Feb 2023 22:44:34 +0200
Message-Id: <20230212204454.2938561-7-ogabbay@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230212204454.2938561-1-ogabbay@kernel.org>
References: <20230212204454.2938561-1-ogabbay@kernel.org>
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
Cc: Dani Liberman <dliberman@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dani Liberman <dliberman@habana.ai>

PSOC RAZWI handling code did not took into account single router that
supports several initiators with different XY coordinates. Also, it
ignored XY_HI coordinate. This caused 2 problems:
1. RAZWI handle ignored some initiators.
2. When getting PSOC RAZWI from some routers, there was a lot of
   possible engines which could have caused the RAZWI.

Fixed the above issue by handling PSOC RAZWI with both low and high
XY coordinates. This way driver supports all initiators and in
the worst case there are not more than 2 possible engines for RAZWI.

Signed-off-by: Dani Liberman <dliberman@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/gaudi2/gaudi2.c | 724 ++++++++++++-----------
 1 file changed, 371 insertions(+), 353 deletions(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index f1f2a58ee68c..af8fe3575aa9 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -132,6 +132,282 @@
 
 #define ENGINE_ID_DCORE_OFFSET (GAUDI2_DCORE1_ENGINE_ID_EDMA_0 - GAUDI2_DCORE0_ENGINE_ID_EDMA_0)
 
+/* RAZWI initiator coordinates */
+#define RAZWI_GET_AXUSER_XY(x) \
+	((x & 0xF8001FF0) >> 4)
+
+#define RAZWI_GET_AXUSER_LOW_XY(x) \
+	((x & 0x00001FF0) >> 4)
+
+#define RAZWI_INITIATOR_AXUER_L_X_SHIFT		0
+#define RAZWI_INITIATOR_AXUER_L_X_MASK		0x1F
+#define RAZWI_INITIATOR_AXUER_L_Y_SHIFT		5
+#define RAZWI_INITIATOR_AXUER_L_Y_MASK		0xF
+
+#define RAZWI_INITIATOR_AXUER_H_X_SHIFT		23
+#define RAZWI_INITIATOR_AXUER_H_X_MASK		0x1F
+
+#define RAZWI_INITIATOR_ID_X_Y_LOW(x, y) \
+	((((y) & RAZWI_INITIATOR_AXUER_L_Y_MASK) << RAZWI_INITIATOR_AXUER_L_Y_SHIFT) | \
+		(((x) & RAZWI_INITIATOR_AXUER_L_X_MASK) << RAZWI_INITIATOR_AXUER_L_X_SHIFT))
+
+#define RAZWI_INITIATOR_ID_X_HIGH(x) \
+		(((x) & RAZWI_INITIATOR_AXUER_H_X_MASK) << RAZWI_INITIATOR_AXUER_H_X_SHIFT)
+
+#define RAZWI_INITIATOR_ID_X_Y(xl, yl, xh) \
+	(RAZWI_INITIATOR_ID_X_Y_LOW(xl, yl) | RAZWI_INITIATOR_ID_X_HIGH(xh))
+
+#define PSOC_RAZWI_ENG_STR_SIZE 128
+#define PSOC_RAZWI_MAX_ENG_PER_RTR 5
+
+struct gaudi2_razwi_info {
+	u32 axuser_xy;
+	u32 rtr_ctrl;
+	u16 eng_id;
+	char *eng_name;
+};
+
+static struct gaudi2_razwi_info common_razwi_info[] = {
+		{RAZWI_INITIATOR_ID_X_Y(2, 4, 0), mmDCORE0_RTR0_CTRL_BASE,
+				GAUDI2_DCORE0_ENGINE_ID_DEC_0, "DEC0"},
+		{RAZWI_INITIATOR_ID_X_Y(2, 4, 4), mmDCORE0_RTR0_CTRL_BASE,
+				GAUDI2_DCORE0_ENGINE_ID_DEC_1, "DEC1"},
+		{RAZWI_INITIATOR_ID_X_Y(17, 4, 18), mmDCORE1_RTR7_CTRL_BASE,
+				GAUDI2_DCORE1_ENGINE_ID_DEC_0, "DEC2"},
+		{RAZWI_INITIATOR_ID_X_Y(17, 4, 14), mmDCORE1_RTR7_CTRL_BASE,
+				GAUDI2_DCORE1_ENGINE_ID_DEC_1, "DEC3"},
+		{RAZWI_INITIATOR_ID_X_Y(2, 11, 0), mmDCORE2_RTR0_CTRL_BASE,
+				GAUDI2_DCORE2_ENGINE_ID_DEC_0, "DEC4"},
+		{RAZWI_INITIATOR_ID_X_Y(2, 11, 4), mmDCORE2_RTR0_CTRL_BASE,
+				GAUDI2_DCORE2_ENGINE_ID_DEC_1, "DEC5"},
+		{RAZWI_INITIATOR_ID_X_Y(17, 11, 18), mmDCORE3_RTR7_CTRL_BASE,
+				GAUDI2_DCORE3_ENGINE_ID_DEC_0, "DEC6"},
+		{RAZWI_INITIATOR_ID_X_Y(17, 11, 14), mmDCORE3_RTR7_CTRL_BASE,
+				GAUDI2_DCORE3_ENGINE_ID_DEC_1, "DEC7"},
+		{RAZWI_INITIATOR_ID_X_Y(2, 4, 6), mmDCORE0_RTR0_CTRL_BASE,
+				GAUDI2_PCIE_ENGINE_ID_DEC_0, "DEC8"},
+		{RAZWI_INITIATOR_ID_X_Y(2, 4, 7), mmDCORE0_RTR0_CTRL_BASE,
+				GAUDI2_PCIE_ENGINE_ID_DEC_0, "DEC9"},
+		{RAZWI_INITIATOR_ID_X_Y(3, 4, 2), mmDCORE0_RTR1_CTRL_BASE,
+				GAUDI2_DCORE0_ENGINE_ID_TPC_0, "TPC0"},
+		{RAZWI_INITIATOR_ID_X_Y(3, 4, 4), mmDCORE0_RTR1_CTRL_BASE,
+				GAUDI2_DCORE0_ENGINE_ID_TPC_1, "TPC1"},
+		{RAZWI_INITIATOR_ID_X_Y(4, 4, 2), mmDCORE0_RTR2_CTRL_BASE,
+				GAUDI2_DCORE0_ENGINE_ID_TPC_2, "TPC2"},
+		{RAZWI_INITIATOR_ID_X_Y(4, 4, 4), mmDCORE0_RTR2_CTRL_BASE,
+				GAUDI2_DCORE0_ENGINE_ID_TPC_3, "TPC3"},
+		{RAZWI_INITIATOR_ID_X_Y(5, 4, 2), mmDCORE0_RTR3_CTRL_BASE,
+				GAUDI2_DCORE0_ENGINE_ID_TPC_4, "TPC4"},
+		{RAZWI_INITIATOR_ID_X_Y(5, 4, 4), mmDCORE0_RTR3_CTRL_BASE,
+				GAUDI2_DCORE0_ENGINE_ID_TPC_5, "TPC5"},
+		{RAZWI_INITIATOR_ID_X_Y(16, 4, 14), mmDCORE1_RTR6_CTRL_BASE,
+				GAUDI2_DCORE1_ENGINE_ID_TPC_0, "TPC6"},
+		{RAZWI_INITIATOR_ID_X_Y(16, 4, 16), mmDCORE1_RTR6_CTRL_BASE,
+				GAUDI2_DCORE1_ENGINE_ID_TPC_1, "TPC7"},
+		{RAZWI_INITIATOR_ID_X_Y(15, 4, 14), mmDCORE1_RTR5_CTRL_BASE,
+				GAUDI2_DCORE1_ENGINE_ID_TPC_2, "TPC8"},
+		{RAZWI_INITIATOR_ID_X_Y(15, 4, 16), mmDCORE1_RTR5_CTRL_BASE,
+				GAUDI2_DCORE1_ENGINE_ID_TPC_3, "TPC9"},
+		{RAZWI_INITIATOR_ID_X_Y(14, 4, 14), mmDCORE1_RTR4_CTRL_BASE,
+				GAUDI2_DCORE1_ENGINE_ID_TPC_4, "TPC10"},
+		{RAZWI_INITIATOR_ID_X_Y(14, 4, 16), mmDCORE1_RTR4_CTRL_BASE,
+				GAUDI2_DCORE1_ENGINE_ID_TPC_5, "TPC11"},
+		{RAZWI_INITIATOR_ID_X_Y(5, 11, 2), mmDCORE2_RTR3_CTRL_BASE,
+				GAUDI2_DCORE2_ENGINE_ID_TPC_0, "TPC12"},
+		{RAZWI_INITIATOR_ID_X_Y(5, 11, 4), mmDCORE2_RTR3_CTRL_BASE,
+				GAUDI2_DCORE2_ENGINE_ID_TPC_1, "TPC13"},
+		{RAZWI_INITIATOR_ID_X_Y(4, 11, 2), mmDCORE2_RTR2_CTRL_BASE,
+				GAUDI2_DCORE2_ENGINE_ID_TPC_2, "TPC14"},
+		{RAZWI_INITIATOR_ID_X_Y(4, 11, 4), mmDCORE2_RTR2_CTRL_BASE,
+				GAUDI2_DCORE2_ENGINE_ID_TPC_3, "TPC15"},
+		{RAZWI_INITIATOR_ID_X_Y(3, 11, 2), mmDCORE2_RTR1_CTRL_BASE,
+				GAUDI2_DCORE2_ENGINE_ID_TPC_4, "TPC16"},
+		{RAZWI_INITIATOR_ID_X_Y(3, 11, 4), mmDCORE2_RTR1_CTRL_BASE,
+				GAUDI2_DCORE2_ENGINE_ID_TPC_5, "TPC17"},
+		{RAZWI_INITIATOR_ID_X_Y(14, 11, 14), mmDCORE3_RTR4_CTRL_BASE,
+				GAUDI2_DCORE3_ENGINE_ID_TPC_0, "TPC18"},
+		{RAZWI_INITIATOR_ID_X_Y(14, 11, 16), mmDCORE3_RTR4_CTRL_BASE,
+				GAUDI2_DCORE3_ENGINE_ID_TPC_1, "TPC19"},
+		{RAZWI_INITIATOR_ID_X_Y(15, 11, 14), mmDCORE3_RTR5_CTRL_BASE,
+				GAUDI2_DCORE3_ENGINE_ID_TPC_2, "TPC20"},
+		{RAZWI_INITIATOR_ID_X_Y(15, 11, 16), mmDCORE3_RTR5_CTRL_BASE,
+				GAUDI2_DCORE3_ENGINE_ID_TPC_3, "TPC21"},
+		{RAZWI_INITIATOR_ID_X_Y(16, 11, 14), mmDCORE3_RTR6_CTRL_BASE,
+				GAUDI2_DCORE3_ENGINE_ID_TPC_4, "TPC22"},
+		{RAZWI_INITIATOR_ID_X_Y(16, 11, 16), mmDCORE3_RTR6_CTRL_BASE,
+				GAUDI2_DCORE3_ENGINE_ID_TPC_5, "TPC23"},
+		{RAZWI_INITIATOR_ID_X_Y(2, 4, 2), mmDCORE0_RTR0_CTRL_BASE,
+				GAUDI2_DCORE3_ENGINE_ID_TPC_5, "TPC24"},
+		{RAZWI_INITIATOR_ID_X_Y(17, 4, 8), mmDCORE1_RTR7_CTRL_BASE,
+				GAUDI2_ENGINE_ID_NIC0_0, "NIC0"},
+		{RAZWI_INITIATOR_ID_X_Y(17, 4, 10), mmDCORE1_RTR7_CTRL_BASE,
+				GAUDI2_ENGINE_ID_NIC0_1, "NIC1"},
+		{RAZWI_INITIATOR_ID_X_Y(17, 4, 12), mmDCORE1_RTR7_CTRL_BASE,
+				GAUDI2_ENGINE_ID_NIC1_0, "NIC2"},
+		{RAZWI_INITIATOR_ID_X_Y(17, 4, 14), mmDCORE1_RTR7_CTRL_BASE,
+				GAUDI2_ENGINE_ID_NIC1_1, "NIC3"},
+		{RAZWI_INITIATOR_ID_X_Y(17, 4, 15), mmDCORE1_RTR7_CTRL_BASE,
+				GAUDI2_ENGINE_ID_NIC2_0, "NIC4"},
+		{RAZWI_INITIATOR_ID_X_Y(2, 11, 2), mmDCORE2_RTR0_CTRL_BASE,
+				GAUDI2_ENGINE_ID_NIC2_1, "NIC5"},
+		{RAZWI_INITIATOR_ID_X_Y(2, 11, 4), mmDCORE2_RTR0_CTRL_BASE,
+				GAUDI2_ENGINE_ID_NIC3_0, "NIC6"},
+		{RAZWI_INITIATOR_ID_X_Y(2, 11, 6), mmDCORE2_RTR0_CTRL_BASE,
+				GAUDI2_ENGINE_ID_NIC3_1, "NIC7"},
+		{RAZWI_INITIATOR_ID_X_Y(2, 11, 8), mmDCORE2_RTR0_CTRL_BASE,
+				GAUDI2_ENGINE_ID_NIC4_0, "NIC8"},
+		{RAZWI_INITIATOR_ID_X_Y(17, 11, 12), mmDCORE3_RTR7_CTRL_BASE,
+				GAUDI2_ENGINE_ID_NIC4_1, "NIC9"},
+		{RAZWI_INITIATOR_ID_X_Y(17, 11, 14), mmDCORE3_RTR7_CTRL_BASE,
+				GAUDI2_ENGINE_ID_NIC5_0, "NIC10"},
+		{RAZWI_INITIATOR_ID_X_Y(17, 11, 16), mmDCORE3_RTR7_CTRL_BASE,
+				GAUDI2_ENGINE_ID_NIC5_1, "NIC11"},
+		{RAZWI_INITIATOR_ID_X_Y(2, 4, 2), mmDCORE0_RTR0_CTRL_BASE,
+				GAUDI2_ENGINE_ID_PDMA_0, "PDMA0"},
+		{RAZWI_INITIATOR_ID_X_Y(2, 4, 3), mmDCORE0_RTR0_CTRL_BASE,
+				GAUDI2_ENGINE_ID_PDMA_1, "PDMA1"},
+		{RAZWI_INITIATOR_ID_X_Y(2, 4, 4), mmDCORE0_RTR0_CTRL_BASE,
+				GAUDI2_ENGINE_ID_SIZE, "PMMU"},
+		{RAZWI_INITIATOR_ID_X_Y(2, 4, 5), mmDCORE0_RTR0_CTRL_BASE,
+				GAUDI2_ENGINE_ID_SIZE, "PCIE"},
+		{RAZWI_INITIATOR_ID_X_Y(17, 4, 16), mmDCORE1_RTR7_CTRL_BASE,
+				GAUDI2_ENGINE_ID_ARC_FARM, "ARC_FARM"},
+		{RAZWI_INITIATOR_ID_X_Y(17, 4, 17), mmDCORE1_RTR7_CTRL_BASE,
+				GAUDI2_ENGINE_ID_KDMA, "KDMA"},
+		{RAZWI_INITIATOR_ID_X_Y(1, 5, 1), mmSFT0_HBW_RTR_IF1_RTR_CTRL_BASE,
+				GAUDI2_DCORE0_ENGINE_ID_EDMA_0, "EDMA0"},
+		{RAZWI_INITIATOR_ID_X_Y(1, 5, 1), mmSFT0_HBW_RTR_IF0_RTR_CTRL_BASE,
+				GAUDI2_DCORE0_ENGINE_ID_EDMA_1, "EDMA1"},
+		{RAZWI_INITIATOR_ID_X_Y(18, 5, 18), mmSFT1_HBW_RTR_IF1_RTR_CTRL_BASE,
+				GAUDI2_DCORE1_ENGINE_ID_EDMA_0, "EDMA2"},
+		{RAZWI_INITIATOR_ID_X_Y(18, 5, 18), mmSFT1_HBW_RTR_IF0_RTR_CTRL_BASE,
+				GAUDI2_DCORE1_ENGINE_ID_EDMA_1, "EDMA3"},
+		{RAZWI_INITIATOR_ID_X_Y(1, 10, 1), mmSFT2_HBW_RTR_IF0_RTR_CTRL_BASE,
+				GAUDI2_DCORE2_ENGINE_ID_EDMA_0, "EDMA4"},
+		{RAZWI_INITIATOR_ID_X_Y(1, 10, 1), mmSFT2_HBW_RTR_IF1_RTR_CTRL_BASE,
+				GAUDI2_DCORE2_ENGINE_ID_EDMA_1, "EDMA5"},
+		{RAZWI_INITIATOR_ID_X_Y(18, 10, 18), mmSFT2_HBW_RTR_IF0_RTR_CTRL_BASE,
+				GAUDI2_DCORE3_ENGINE_ID_EDMA_0, "EDMA6"},
+		{RAZWI_INITIATOR_ID_X_Y(18, 10, 18), mmSFT2_HBW_RTR_IF1_RTR_CTRL_BASE,
+				GAUDI2_DCORE3_ENGINE_ID_EDMA_1, "EDMA7"},
+		{RAZWI_INITIATOR_ID_X_Y(1, 5, 0), mmDCORE0_RTR0_CTRL_BASE,
+				GAUDI2_ENGINE_ID_SIZE, "HMMU0"},
+		{RAZWI_INITIATOR_ID_X_Y(18, 5, 19), mmDCORE1_RTR7_CTRL_BASE,
+				GAUDI2_ENGINE_ID_SIZE, "HMMU1"},
+		{RAZWI_INITIATOR_ID_X_Y(1, 5, 0), mmDCORE0_RTR0_CTRL_BASE,
+				GAUDI2_ENGINE_ID_SIZE, "HMMU2"},
+		{RAZWI_INITIATOR_ID_X_Y(18, 5, 19), mmDCORE1_RTR7_CTRL_BASE,
+				GAUDI2_ENGINE_ID_SIZE, "HMMU3"},
+		{RAZWI_INITIATOR_ID_X_Y(1, 5, 0), mmDCORE0_RTR0_CTRL_BASE,
+				GAUDI2_ENGINE_ID_SIZE, "HMMU4"},
+		{RAZWI_INITIATOR_ID_X_Y(18, 5, 19), mmDCORE1_RTR7_CTRL_BASE,
+				GAUDI2_ENGINE_ID_SIZE, "HMMU5"},
+		{RAZWI_INITIATOR_ID_X_Y(1, 5, 0), mmDCORE0_RTR0_CTRL_BASE,
+				GAUDI2_ENGINE_ID_SIZE, "HMMU6"},
+		{RAZWI_INITIATOR_ID_X_Y(18, 5, 19), mmDCORE1_RTR7_CTRL_BASE,
+				GAUDI2_ENGINE_ID_SIZE, "HMMU7"},
+		{RAZWI_INITIATOR_ID_X_Y(1, 10, 0), mmDCORE2_RTR0_CTRL_BASE,
+				GAUDI2_ENGINE_ID_SIZE, "HMMU8"},
+		{RAZWI_INITIATOR_ID_X_Y(18, 10, 19), mmDCORE3_RTR7_CTRL_BASE,
+				GAUDI2_ENGINE_ID_SIZE, "HMMU9"},
+		{RAZWI_INITIATOR_ID_X_Y(1, 10, 0), mmDCORE2_RTR0_CTRL_BASE,
+				GAUDI2_ENGINE_ID_SIZE, "HMMU10"},
+		{RAZWI_INITIATOR_ID_X_Y(18, 10, 19), mmDCORE3_RTR7_CTRL_BASE,
+				GAUDI2_ENGINE_ID_SIZE, "HMMU11"},
+		{RAZWI_INITIATOR_ID_X_Y(1, 10, 0), mmDCORE2_RTR0_CTRL_BASE,
+				GAUDI2_ENGINE_ID_SIZE, "HMMU12"},
+		{RAZWI_INITIATOR_ID_X_Y(18, 10, 19), mmDCORE3_RTR7_CTRL_BASE,
+				GAUDI2_ENGINE_ID_SIZE, "HMMU13"},
+		{RAZWI_INITIATOR_ID_X_Y(1, 10, 0), mmDCORE2_RTR0_CTRL_BASE,
+				GAUDI2_ENGINE_ID_SIZE, "HMMU14"},
+		{RAZWI_INITIATOR_ID_X_Y(18, 10, 19), mmDCORE3_RTR7_CTRL_BASE,
+				GAUDI2_ENGINE_ID_SIZE, "HMMU15"},
+		{RAZWI_INITIATOR_ID_X_Y(2, 11, 2), mmDCORE2_RTR0_CTRL_BASE,
+				GAUDI2_ENGINE_ID_ROT_0, "ROT0"},
+		{RAZWI_INITIATOR_ID_X_Y(17, 11, 16), mmDCORE3_RTR7_CTRL_BASE,
+				GAUDI2_ENGINE_ID_ROT_1, "ROT1"},
+		{RAZWI_INITIATOR_ID_X_Y(2, 11, 2), mmDCORE2_RTR0_CTRL_BASE,
+				GAUDI2_ENGINE_ID_PSOC, "CPU"},
+		{RAZWI_INITIATOR_ID_X_Y(17, 11, 11), mmDCORE3_RTR7_CTRL_BASE,
+				GAUDI2_ENGINE_ID_PSOC, "PSOC"}
+};
+
+static struct gaudi2_razwi_info mme_razwi_info[] = {
+		/* MME X high coordinate is N/A, hence using only low coordinates */
+		{RAZWI_INITIATOR_ID_X_Y_LOW(7, 4), mmDCORE0_RTR5_CTRL_BASE,
+				GAUDI2_DCORE0_ENGINE_ID_MME, "MME0_WAP0"},
+		{RAZWI_INITIATOR_ID_X_Y_LOW(9, 4), mmDCORE0_RTR7_CTRL_BASE,
+				GAUDI2_DCORE0_ENGINE_ID_MME, "MME0_WAP1"},
+		{RAZWI_INITIATOR_ID_X_Y_LOW(8, 4), mmDCORE0_RTR6_CTRL_BASE,
+				GAUDI2_DCORE0_ENGINE_ID_MME, "MME0_CTRL_WR"},
+		{RAZWI_INITIATOR_ID_X_Y_LOW(9, 4), mmDCORE0_RTR7_CTRL_BASE,
+				GAUDI2_DCORE0_ENGINE_ID_MME, "MME0_CTRL_RD"},
+		{RAZWI_INITIATOR_ID_X_Y_LOW(6, 4), mmDCORE0_RTR4_CTRL_BASE,
+				GAUDI2_DCORE0_ENGINE_ID_MME, "MME0_SBTE0"},
+		{RAZWI_INITIATOR_ID_X_Y_LOW(6, 4), mmDCORE0_RTR4_CTRL_BASE,
+				GAUDI2_DCORE0_ENGINE_ID_MME, "MME0_SBTE1"},
+		{RAZWI_INITIATOR_ID_X_Y_LOW(7, 4), mmDCORE0_RTR5_CTRL_BASE,
+				GAUDI2_DCORE0_ENGINE_ID_MME, "MME0_SBTE2"},
+		{RAZWI_INITIATOR_ID_X_Y_LOW(8, 4), mmDCORE0_RTR6_CTRL_BASE,
+				GAUDI2_DCORE0_ENGINE_ID_MME, "MME0_SBTE3"},
+		{RAZWI_INITIATOR_ID_X_Y_LOW(9, 4), mmDCORE0_RTR7_CTRL_BASE,
+				GAUDI2_DCORE0_ENGINE_ID_MME, "MME0_SBTE4"},
+		{RAZWI_INITIATOR_ID_X_Y_LOW(12, 4), mmDCORE1_RTR2_CTRL_BASE,
+				GAUDI2_DCORE1_ENGINE_ID_MME, "MME1_WAP0"},
+		{RAZWI_INITIATOR_ID_X_Y_LOW(10, 4), mmDCORE1_RTR0_CTRL_BASE,
+				GAUDI2_DCORE1_ENGINE_ID_MME, "MME1_WAP1"},
+		{RAZWI_INITIATOR_ID_X_Y_LOW(11, 4), mmDCORE1_RTR1_CTRL_BASE,
+				GAUDI2_DCORE1_ENGINE_ID_MME, "MME1_CTRL_WR"},
+		{RAZWI_INITIATOR_ID_X_Y_LOW(10, 4), mmDCORE1_RTR0_CTRL_BASE,
+				GAUDI2_DCORE1_ENGINE_ID_MME, "MME1_CTRL_RD"},
+		{RAZWI_INITIATOR_ID_X_Y_LOW(13, 4), mmDCORE1_RTR3_CTRL_BASE,
+				GAUDI2_DCORE1_ENGINE_ID_MME, "MME1_SBTE0"},
+		{RAZWI_INITIATOR_ID_X_Y_LOW(13, 4), mmDCORE1_RTR3_CTRL_BASE,
+				GAUDI2_DCORE1_ENGINE_ID_MME, "MME1_SBTE1"},
+		{RAZWI_INITIATOR_ID_X_Y_LOW(12, 4), mmDCORE1_RTR2_CTRL_BASE,
+				GAUDI2_DCORE1_ENGINE_ID_MME, "MME1_SBTE2"},
+		{RAZWI_INITIATOR_ID_X_Y_LOW(11, 4), mmDCORE1_RTR1_CTRL_BASE,
+				GAUDI2_DCORE1_ENGINE_ID_MME, "MME1_SBTE3"},
+		{RAZWI_INITIATOR_ID_X_Y_LOW(10, 4), mmDCORE1_RTR0_CTRL_BASE,
+				GAUDI2_DCORE1_ENGINE_ID_MME, "MME1_SBTE4"},
+		{RAZWI_INITIATOR_ID_X_Y_LOW(7, 11), mmDCORE2_RTR5_CTRL_BASE,
+				GAUDI2_DCORE2_ENGINE_ID_MME, "MME2_WAP0"},
+		{RAZWI_INITIATOR_ID_X_Y_LOW(9, 11), mmDCORE2_RTR7_CTRL_BASE,
+				GAUDI2_DCORE2_ENGINE_ID_MME, "MME2_WAP1"},
+		{RAZWI_INITIATOR_ID_X_Y_LOW(8, 11), mmDCORE2_RTR6_CTRL_BASE,
+				GAUDI2_DCORE2_ENGINE_ID_MME, "MME2_CTRL_WR"},
+		{RAZWI_INITIATOR_ID_X_Y_LOW(9, 11), mmDCORE2_RTR7_CTRL_BASE,
+				GAUDI2_DCORE2_ENGINE_ID_MME, "MME2_CTRL_RD"},
+		{RAZWI_INITIATOR_ID_X_Y_LOW(6, 11), mmDCORE2_RTR4_CTRL_BASE,
+				GAUDI2_DCORE2_ENGINE_ID_MME, "MME2_SBTE0"},
+		{RAZWI_INITIATOR_ID_X_Y_LOW(6, 11), mmDCORE2_RTR4_CTRL_BASE,
+				GAUDI2_DCORE2_ENGINE_ID_MME, "MME2_SBTE1"},
+		{RAZWI_INITIATOR_ID_X_Y_LOW(7, 11), mmDCORE2_RTR5_CTRL_BASE,
+				GAUDI2_DCORE2_ENGINE_ID_MME, "MME2_SBTE2"},
+		{RAZWI_INITIATOR_ID_X_Y_LOW(8, 11), mmDCORE2_RTR6_CTRL_BASE,
+				GAUDI2_DCORE2_ENGINE_ID_MME, "MME2_SBTE3"},
+		{RAZWI_INITIATOR_ID_X_Y_LOW(9, 11), mmDCORE2_RTR7_CTRL_BASE,
+				GAUDI2_DCORE2_ENGINE_ID_MME, "MME2_SBTE4"},
+		{RAZWI_INITIATOR_ID_X_Y_LOW(12, 11), mmDCORE3_RTR2_CTRL_BASE,
+				GAUDI2_DCORE3_ENGINE_ID_MME, "MME3_WAP0"},
+		{RAZWI_INITIATOR_ID_X_Y_LOW(10, 11), mmDCORE3_RTR0_CTRL_BASE,
+				GAUDI2_DCORE3_ENGINE_ID_MME, "MME3_WAP1"},
+		{RAZWI_INITIATOR_ID_X_Y_LOW(11, 11), mmDCORE3_RTR1_CTRL_BASE,
+				GAUDI2_DCORE3_ENGINE_ID_MME, "MME3_CTRL_WR"},
+		{RAZWI_INITIATOR_ID_X_Y_LOW(10, 11), mmDCORE3_RTR0_CTRL_BASE,
+				GAUDI2_DCORE3_ENGINE_ID_MME, "MME3_CTRL_RD"},
+		{RAZWI_INITIATOR_ID_X_Y_LOW(13, 11), mmDCORE3_RTR3_CTRL_BASE,
+				GAUDI2_DCORE3_ENGINE_ID_MME, "MME3_SBTE0"},
+		{RAZWI_INITIATOR_ID_X_Y_LOW(13, 11), mmDCORE3_RTR3_CTRL_BASE,
+				GAUDI2_DCORE3_ENGINE_ID_MME, "MME3_SBTE1"},
+		{RAZWI_INITIATOR_ID_X_Y_LOW(12, 11), mmDCORE3_RTR2_CTRL_BASE,
+				GAUDI2_DCORE3_ENGINE_ID_MME, "MME3_SBTE2"},
+		{RAZWI_INITIATOR_ID_X_Y_LOW(11, 11), mmDCORE3_RTR1_CTRL_BASE,
+				GAUDI2_DCORE3_ENGINE_ID_MME, "MME3_SBTE3"},
+		{RAZWI_INITIATOR_ID_X_Y_LOW(10, 11), mmDCORE3_RTR0_CTRL_BASE,
+				GAUDI2_DCORE3_ENGINE_ID_MME, "MME3_SBTE4"}
+};
+
 enum hl_pmmu_fatal_cause {
 	LATENCY_RD_OUT_FIFO_OVERRUN,
 	LATENCY_WR_OUT_FIFO_OVERRUN,
@@ -1499,41 +1775,6 @@ static const char gaudi2_vdec_irq_name[GAUDI2_VDEC_MSIX_ENTRIES][GAUDI2_MAX_STRI
 	"gaudi2 vdec s_1", "gaudi2 vdec s_1 abnormal"
 };
 
-static const u32 rtr_coordinates_to_rtr_id[NUM_OF_RTR_PER_DCORE * NUM_OF_DCORES] = {
-	RTR_ID_X_Y(2, 4),
-	RTR_ID_X_Y(3, 4),
-	RTR_ID_X_Y(4, 4),
-	RTR_ID_X_Y(5, 4),
-	RTR_ID_X_Y(6, 4),
-	RTR_ID_X_Y(7, 4),
-	RTR_ID_X_Y(8, 4),
-	RTR_ID_X_Y(9, 4),
-	RTR_ID_X_Y(10, 4),
-	RTR_ID_X_Y(11, 4),
-	RTR_ID_X_Y(12, 4),
-	RTR_ID_X_Y(13, 4),
-	RTR_ID_X_Y(14, 4),
-	RTR_ID_X_Y(15, 4),
-	RTR_ID_X_Y(16, 4),
-	RTR_ID_X_Y(17, 4),
-	RTR_ID_X_Y(2, 11),
-	RTR_ID_X_Y(3, 11),
-	RTR_ID_X_Y(4, 11),
-	RTR_ID_X_Y(5, 11),
-	RTR_ID_X_Y(6, 11),
-	RTR_ID_X_Y(7, 11),
-	RTR_ID_X_Y(8, 11),
-	RTR_ID_X_Y(9, 11),
-	RTR_ID_X_Y(0, 0),/* 24 no id */
-	RTR_ID_X_Y(0, 0),/* 25 no id */
-	RTR_ID_X_Y(0, 0),/* 26 no id */
-	RTR_ID_X_Y(0, 0),/* 27 no id */
-	RTR_ID_X_Y(14, 11),
-	RTR_ID_X_Y(15, 11),
-	RTR_ID_X_Y(16, 11),
-	RTR_ID_X_Y(17, 11)
-};
-
 enum rtr_id {
 	DCORE0_RTR0,
 	DCORE0_RTR1,
@@ -7526,297 +7767,115 @@ static void gaudi2_check_if_razwi_happened(struct hl_device *hdev)
 		gaudi2_ack_module_razwi_event_handler(hdev, RAZWI_ROT, mod_idx, 0, NULL);
 }
 
-static const char *gaudi2_get_initiators_name(u32 rtr_id)
-{
-	switch (rtr_id) {
-	case DCORE0_RTR0:
-		return "DEC0/1/8/9, TPC24, PDMA0/1, PMMU, PCIE_IF, EDMA0/2, HMMU0/2/4/6, CPU";
-	case DCORE0_RTR1:
-		return "TPC0/1";
-	case DCORE0_RTR2:
-		return "TPC2/3";
-	case DCORE0_RTR3:
-		return "TPC4/5";
-	case DCORE0_RTR4:
-		return "MME0_SBTE0/1";
-	case DCORE0_RTR5:
-		return "MME0_WAP0/SBTE2";
-	case DCORE0_RTR6:
-		return "MME0_CTRL_WR/SBTE3";
-	case DCORE0_RTR7:
-		return "MME0_WAP1/CTRL_RD/SBTE4";
-	case DCORE1_RTR0:
-		return "MME1_WAP1/CTRL_RD/SBTE4";
-	case DCORE1_RTR1:
-		return "MME1_CTRL_WR/SBTE3";
-	case DCORE1_RTR2:
-		return "MME1_WAP0/SBTE2";
-	case DCORE1_RTR3:
-		return "MME1_SBTE0/1";
-	case DCORE1_RTR4:
-		return "TPC10/11";
-	case DCORE1_RTR5:
-		return "TPC8/9";
-	case DCORE1_RTR6:
-		return "TPC6/7";
-	case DCORE1_RTR7:
-		return "DEC2/3, NIC0/1/2/3/4, ARC_FARM, KDMA, EDMA1/3, HMMU1/3/5/7";
-	case DCORE2_RTR0:
-		return "DEC4/5, NIC5/6/7/8, EDMA4/6, HMMU8/10/12/14, ROT0";
-	case DCORE2_RTR1:
-		return "TPC16/17";
-	case DCORE2_RTR2:
-		return "TPC14/15";
-	case DCORE2_RTR3:
-		return "TPC12/13";
-	case DCORE2_RTR4:
-		return "MME2_SBTE0/1";
-	case DCORE2_RTR5:
-		return "MME2_WAP0/SBTE2";
-	case DCORE2_RTR6:
-		return "MME2_CTRL_WR/SBTE3";
-	case DCORE2_RTR7:
-		return "MME2_WAP1/CTRL_RD/SBTE4";
-	case DCORE3_RTR0:
-		return "MME3_WAP1/CTRL_RD/SBTE4";
-	case DCORE3_RTR1:
-		return "MME3_CTRL_WR/SBTE3";
-	case DCORE3_RTR2:
-		return "MME3_WAP0/SBTE2";
-	case DCORE3_RTR3:
-		return "MME3_SBTE0/1";
-	case DCORE3_RTR4:
-		return "TPC18/19";
-	case DCORE3_RTR5:
-		return "TPC20/21";
-	case DCORE3_RTR6:
-		return "TPC22/23";
-	case DCORE3_RTR7:
-		return "DEC6/7, NIC9/10/11, EDMA5/7, HMMU9/11/13/15, ROT1, PSOC";
-	default:
-	return "N/A";
-	}
-}
-
-static u16 gaudi2_get_razwi_initiators(u32 rtr_id, u16 *engines)
-{
-	switch (rtr_id) {
-	case DCORE0_RTR0:
-		engines[0] = GAUDI2_DCORE0_ENGINE_ID_DEC_0;
-		engines[1] = GAUDI2_DCORE0_ENGINE_ID_DEC_1;
-		engines[2] = GAUDI2_PCIE_ENGINE_ID_DEC_0;
-		engines[3] = GAUDI2_PCIE_ENGINE_ID_DEC_1;
-		engines[4] = GAUDI2_DCORE0_ENGINE_ID_TPC_6;
-		engines[5] = GAUDI2_ENGINE_ID_PDMA_0;
-		engines[6] = GAUDI2_ENGINE_ID_PDMA_1;
-		engines[7] = GAUDI2_ENGINE_ID_PCIE;
-		engines[8] = GAUDI2_DCORE0_ENGINE_ID_EDMA_0;
-		engines[9] = GAUDI2_DCORE1_ENGINE_ID_EDMA_0;
-		engines[10] = GAUDI2_ENGINE_ID_PSOC;
-		return 11;
-
-	case DCORE0_RTR1:
-		engines[0] = GAUDI2_DCORE0_ENGINE_ID_TPC_0;
-		engines[1] = GAUDI2_DCORE0_ENGINE_ID_TPC_1;
-		return 2;
-
-	case DCORE0_RTR2:
-		engines[0] = GAUDI2_DCORE0_ENGINE_ID_TPC_2;
-		engines[1] = GAUDI2_DCORE0_ENGINE_ID_TPC_3;
-		return 2;
-
-	case DCORE0_RTR3:
-		engines[0] = GAUDI2_DCORE0_ENGINE_ID_TPC_4;
-		engines[1] = GAUDI2_DCORE0_ENGINE_ID_TPC_5;
-		return 2;
-
-	case DCORE0_RTR4:
-	case DCORE0_RTR5:
-	case DCORE0_RTR6:
-	case DCORE0_RTR7:
-		engines[0] = GAUDI2_DCORE0_ENGINE_ID_MME;
-		return 1;
-
-	case DCORE1_RTR0:
-	case DCORE1_RTR1:
-	case DCORE1_RTR2:
-	case DCORE1_RTR3:
-		engines[0] = GAUDI2_DCORE1_ENGINE_ID_MME;
-		return 1;
-
-	case DCORE1_RTR4:
-		engines[0] = GAUDI2_DCORE1_ENGINE_ID_TPC_4;
-		engines[1] = GAUDI2_DCORE1_ENGINE_ID_TPC_5;
-		return 2;
-
-	case DCORE1_RTR5:
-		engines[0] = GAUDI2_DCORE1_ENGINE_ID_TPC_2;
-		engines[1] = GAUDI2_DCORE1_ENGINE_ID_TPC_3;
-		return 2;
-
-	case DCORE1_RTR6:
-		engines[0] = GAUDI2_DCORE1_ENGINE_ID_TPC_0;
-		engines[1] = GAUDI2_DCORE1_ENGINE_ID_TPC_1;
-		return 2;
-
-	case DCORE1_RTR7:
-		engines[0] = GAUDI2_DCORE1_ENGINE_ID_DEC_0;
-		engines[1] = GAUDI2_DCORE1_ENGINE_ID_DEC_1;
-		engines[2] = GAUDI2_ENGINE_ID_NIC0_0;
-		engines[3] = GAUDI2_ENGINE_ID_NIC1_0;
-		engines[4] = GAUDI2_ENGINE_ID_NIC2_0;
-		engines[5] = GAUDI2_ENGINE_ID_NIC3_0;
-		engines[6] = GAUDI2_ENGINE_ID_NIC4_0;
-		engines[7] = GAUDI2_ENGINE_ID_ARC_FARM;
-		engines[8] = GAUDI2_ENGINE_ID_KDMA;
-		engines[9] = GAUDI2_DCORE0_ENGINE_ID_EDMA_1;
-		engines[10] = GAUDI2_DCORE1_ENGINE_ID_EDMA_1;
-		return 11;
-
-	case DCORE2_RTR0:
-		engines[0] = GAUDI2_DCORE2_ENGINE_ID_DEC_0;
-		engines[1] = GAUDI2_DCORE2_ENGINE_ID_DEC_1;
-		engines[2] = GAUDI2_ENGINE_ID_NIC5_0;
-		engines[3] = GAUDI2_ENGINE_ID_NIC6_0;
-		engines[4] = GAUDI2_ENGINE_ID_NIC7_0;
-		engines[5] = GAUDI2_ENGINE_ID_NIC8_0;
-		engines[6] = GAUDI2_DCORE2_ENGINE_ID_EDMA_0;
-		engines[7] = GAUDI2_DCORE3_ENGINE_ID_EDMA_0;
-		engines[8] = GAUDI2_ENGINE_ID_ROT_0;
-		return 9;
-
-	case DCORE2_RTR1:
-		engines[0] = GAUDI2_DCORE2_ENGINE_ID_TPC_4;
-		engines[1] = GAUDI2_DCORE2_ENGINE_ID_TPC_5;
-		return 2;
-
-	case DCORE2_RTR2:
-		engines[0] = GAUDI2_DCORE2_ENGINE_ID_TPC_2;
-		engines[1] = GAUDI2_DCORE2_ENGINE_ID_TPC_3;
-		return 2;
-
-	case DCORE2_RTR3:
-		engines[0] = GAUDI2_DCORE2_ENGINE_ID_TPC_0;
-		engines[1] = GAUDI2_DCORE2_ENGINE_ID_TPC_1;
-		return 2;
-
-	case DCORE2_RTR4:
-	case DCORE2_RTR5:
-	case DCORE2_RTR6:
-	case DCORE2_RTR7:
-		engines[0] = GAUDI2_DCORE2_ENGINE_ID_MME;
-		return 1;
-	case DCORE3_RTR0:
-	case DCORE3_RTR1:
-	case DCORE3_RTR2:
-	case DCORE3_RTR3:
-		engines[0] = GAUDI2_DCORE3_ENGINE_ID_MME;
-		return 1;
-	case DCORE3_RTR4:
-		engines[0] = GAUDI2_DCORE3_ENGINE_ID_TPC_0;
-		engines[1] = GAUDI2_DCORE3_ENGINE_ID_TPC_1;
-		return 2;
-	case DCORE3_RTR5:
-		engines[0] = GAUDI2_DCORE3_ENGINE_ID_TPC_2;
-		engines[1] = GAUDI2_DCORE3_ENGINE_ID_TPC_3;
-		return 2;
-	case DCORE3_RTR6:
-		engines[0] = GAUDI2_DCORE3_ENGINE_ID_TPC_4;
-		engines[1] = GAUDI2_DCORE3_ENGINE_ID_TPC_5;
-		return 2;
-	case DCORE3_RTR7:
-		engines[0] = GAUDI2_DCORE3_ENGINE_ID_DEC_0;
-		engines[1] = GAUDI2_DCORE3_ENGINE_ID_DEC_1;
-		engines[2] = GAUDI2_ENGINE_ID_NIC9_0;
-		engines[3] = GAUDI2_ENGINE_ID_NIC10_0;
-		engines[4] = GAUDI2_ENGINE_ID_NIC11_0;
-		engines[5] = GAUDI2_DCORE2_ENGINE_ID_EDMA_1;
-		engines[6] = GAUDI2_DCORE3_ENGINE_ID_EDMA_1;
-		engines[7] = GAUDI2_ENGINE_ID_ROT_1;
-		engines[8] = GAUDI2_ENGINE_ID_ROT_0;
-		return 9;
-	default:
-		return 0;
-	}
-}
-
-static void gaudi2_razwi_unmapped_addr_hbw_printf_info(struct hl_device *hdev, u32 rtr_id,
-							u64 rtr_ctrl_base_addr, bool is_write,
-							u64 *event_mask)
+static int gaudi2_psoc_razwi_get_engines(struct gaudi2_razwi_info *razwi_info, u32 array_size,
+						u32 axuser_xy, u32 *base, u16 *eng_id,
+						char *eng_name)
 {
-	u16 engines[HL_RAZWI_MAX_NUM_OF_ENGINES_PER_RTR], num_of_eng;
-	u32 razwi_hi, razwi_lo;
-	u8 rd_wr_flag;
-
-	num_of_eng = gaudi2_get_razwi_initiators(rtr_id, &engines[0]);
 
-	if (is_write) {
-		razwi_hi = RREG32(rtr_ctrl_base_addr + DEC_RAZWI_HBW_AW_ADDR_HI);
-		razwi_lo = RREG32(rtr_ctrl_base_addr + DEC_RAZWI_HBW_AW_ADDR_LO);
-		rd_wr_flag = HL_RAZWI_WRITE;
+	int i, num_of_eng = 0;
+	u16 str_size = 0;
 
-		/* Clear set indication */
-		WREG32(rtr_ctrl_base_addr + DEC_RAZWI_HBW_AW_SET, 0x1);
-	} else {
-		razwi_hi = RREG32(rtr_ctrl_base_addr + DEC_RAZWI_HBW_AR_ADDR_HI);
-		razwi_lo = RREG32(rtr_ctrl_base_addr + DEC_RAZWI_HBW_AR_ADDR_LO);
-		rd_wr_flag = HL_RAZWI_READ;
+	for (i = 0 ; i < array_size ; i++) {
+		if (axuser_xy != razwi_info[i].axuser_xy)
+			continue;
 
-		/* Clear set indication */
-		WREG32(rtr_ctrl_base_addr + DEC_RAZWI_HBW_AR_SET, 0x1);
+		eng_id[num_of_eng] = razwi_info[i].eng_id;
+		base[num_of_eng] = razwi_info[i].rtr_ctrl;
+		if (!num_of_eng)
+			str_size += snprintf(eng_name + str_size,
+						PSOC_RAZWI_ENG_STR_SIZE - str_size, "%s",
+						razwi_info[i].eng_name);
+		else
+			str_size += snprintf(eng_name + str_size,
+						PSOC_RAZWI_ENG_STR_SIZE - str_size, " or %s",
+						razwi_info[i].eng_name);
+		num_of_eng++;
 	}
 
-	hl_handle_razwi(hdev, (u64)razwi_hi << 32 | razwi_lo, &engines[0], num_of_eng,
-				rd_wr_flag | HL_RAZWI_HBW, event_mask);
-	dev_err_ratelimited(hdev->dev,
-		"RAZWI PSOC unmapped HBW %s error, rtr id %u, address %#llx\n",
-		is_write ? "WR" : "RD", rtr_id, (u64)razwi_hi << 32 | razwi_lo);
-
-	dev_err_ratelimited(hdev->dev,
-		"Initiators: %s\n", gaudi2_get_initiators_name(rtr_id));
+	return num_of_eng;
 }
 
-static void gaudi2_razwi_unmapped_addr_lbw_printf_info(struct hl_device *hdev, u32 rtr_id,
-							u64 rtr_ctrl_base_addr, bool is_write,
-							u64 *event_mask)
+static bool gaudi2_handle_psoc_razwi_happened(struct hl_device *hdev, u32 razwi_reg,
+						u64 *event_mask)
 {
-	u16 engines[HL_RAZWI_MAX_NUM_OF_ENGINES_PER_RTR], num_of_eng;
-	u64 razwi_addr = CFG_BASE;
-	u8 rd_wr_flag;
+	u32 axuser_xy = RAZWI_GET_AXUSER_XY(razwi_reg), addr_hi = 0, addr_lo = 0;
+	u32 base[PSOC_RAZWI_MAX_ENG_PER_RTR];
+	u16 num_of_eng, eng_id[PSOC_RAZWI_MAX_ENG_PER_RTR];
+	char eng_name_str[PSOC_RAZWI_ENG_STR_SIZE];
+	bool razwi_happened = false;
+	int i;
 
-	num_of_eng = gaudi2_get_razwi_initiators(rtr_id, &engines[0]);
+	num_of_eng = gaudi2_psoc_razwi_get_engines(common_razwi_info, ARRAY_SIZE(common_razwi_info),
+							axuser_xy, base, eng_id, eng_name_str);
 
-	if (is_write) {
-		razwi_addr += RREG32(rtr_ctrl_base_addr + DEC_RAZWI_LBW_AW_ADDR);
-		rd_wr_flag = HL_RAZWI_WRITE;
+	/* If no match for XY coordinates, try to find it in MME razwi table */
+	if (!num_of_eng) {
+		axuser_xy = RAZWI_GET_AXUSER_LOW_XY(razwi_reg);
+		num_of_eng = gaudi2_psoc_razwi_get_engines(mme_razwi_info,
+								ARRAY_SIZE(mme_razwi_info),
+								axuser_xy, base, eng_id,
+								eng_name_str);
+	}
 
-		/* Clear set indication */
-		WREG32(rtr_ctrl_base_addr + DEC_RAZWI_LBW_AW_SET, 0x1);
-	} else {
-		razwi_addr += RREG32(rtr_ctrl_base_addr + DEC_RAZWI_LBW_AR_ADDR);
-		rd_wr_flag = HL_RAZWI_READ;
+	for  (i = 0 ; i < num_of_eng ; i++) {
+		if (RREG32(base[i] + DEC_RAZWI_HBW_AW_SET)) {
+			addr_hi = RREG32(base[i] + DEC_RAZWI_HBW_AW_ADDR_HI);
+			addr_lo = RREG32(base[i] + DEC_RAZWI_HBW_AW_ADDR_LO);
+			dev_err(hdev->dev,
+					"PSOC HBW AW RAZWI: %s, address (aligned to 128 byte): 0x%llX\n",
+					eng_name_str, ((u64)addr_hi << 32) + addr_lo);
+			hl_handle_razwi(hdev, ((u64)addr_hi << 32) + addr_lo, &eng_id[0],
+					num_of_eng, HL_RAZWI_HBW | HL_RAZWI_WRITE, event_mask);
+			razwi_happened = true;
+		}
 
-		/* Clear set indication */
-		WREG32(rtr_ctrl_base_addr + DEC_RAZWI_LBW_AR_SET, 0x1);
-	}
+		if (RREG32(base[i] + DEC_RAZWI_HBW_AR_SET)) {
+			addr_hi = RREG32(base[i] + DEC_RAZWI_HBW_AR_ADDR_HI);
+			addr_lo = RREG32(base[i] + DEC_RAZWI_HBW_AR_ADDR_LO);
+			dev_err(hdev->dev,
+					"PSOC HBW AR RAZWI: %s, address (aligned to 128 byte): 0x%llX\n",
+					eng_name_str, ((u64)addr_hi << 32) + addr_lo);
+			hl_handle_razwi(hdev, ((u64)addr_hi << 32) + addr_lo, &eng_id[0],
+					num_of_eng, HL_RAZWI_HBW | HL_RAZWI_READ, event_mask);
+			razwi_happened = true;
+		}
 
-	hl_handle_razwi(hdev, razwi_addr, &engines[0], num_of_eng, rd_wr_flag | HL_RAZWI_LBW,
-			event_mask);
-	dev_err_ratelimited(hdev->dev,
-		"RAZWI PSOC unmapped LBW %s error, rtr id %u, address 0x%llX\n",
-		is_write ? "WR" : "RD", rtr_id, razwi_addr);
+		if (RREG32(base[i] + DEC_RAZWI_LBW_AW_SET)) {
+			addr_lo = RREG32(base[i] + DEC_RAZWI_LBW_AW_ADDR);
+			dev_err(hdev->dev,
+					"PSOC LBW AW RAZWI: %s, address (aligned to 128 byte): 0x%X\n",
+					eng_name_str, addr_lo);
+			hl_handle_razwi(hdev, addr_lo, &eng_id[0],
+					num_of_eng, HL_RAZWI_LBW | HL_RAZWI_WRITE, event_mask);
+			razwi_happened = true;
+		}
 
-	dev_err_ratelimited(hdev->dev,
-		"Initiators: %s\n", gaudi2_get_initiators_name(rtr_id));
+		if (RREG32(base[i] + DEC_RAZWI_LBW_AR_SET)) {
+			addr_lo = RREG32(base[i] + DEC_RAZWI_LBW_AR_ADDR);
+			dev_err(hdev->dev,
+					"PSOC LBW AR RAZWI: %s, address (aligned to 128 byte): 0x%X\n",
+					eng_name_str, addr_lo);
+			hl_handle_razwi(hdev, addr_lo, &eng_id[0],
+					num_of_eng, HL_RAZWI_LBW | HL_RAZWI_READ, event_mask);
+			razwi_happened = true;
+		}
+		/* In common case the loop will break, when there is only one engine id, or
+		 * several engines with the same router. The exceptional case is with psoc razwi
+		 * from EDMA, where it's possible to get axuser id which fits 2 routers (2
+		 * interfaces of sft router). In this case, maybe the first router won't hold info
+		 * and we will need to iterate on the other router.
+		 */
+		if (razwi_happened)
+			break;
+	}
+
+	return razwi_happened;
 }
 
 /* PSOC RAZWI interrupt occurs only when trying to access a bad address */
 static int gaudi2_ack_psoc_razwi_event_handler(struct hl_device *hdev, u64 *event_mask)
 {
-	u32 hbw_aw_set, hbw_ar_set, lbw_aw_set, lbw_ar_set, rtr_id, dcore_id, dcore_rtr_id, xy,
-						razwi_mask_info, razwi_intr = 0, error_count = 0;
-	int rtr_map_arr_len = NUM_OF_RTR_PER_DCORE * NUM_OF_DCORES;
-	u64 rtr_ctrl_base_addr;
+	u32 razwi_mask_info, razwi_intr = 0, error_count = 0;
 
 	if (hdev->pldm || !(hdev->fw_components & FW_TYPE_LINUX)) {
 		razwi_intr = RREG32(mmPSOC_GLOBAL_CONF_RAZWI_INTERRUPT);
@@ -7825,63 +7884,22 @@ static int gaudi2_ack_psoc_razwi_event_handler(struct hl_device *hdev, u64 *even
 	}
 
 	razwi_mask_info = RREG32(mmPSOC_GLOBAL_CONF_RAZWI_MASK_INFO);
-	xy = FIELD_GET(PSOC_GLOBAL_CONF_RAZWI_MASK_INFO_AXUSER_L_MASK, razwi_mask_info);
 
 	dev_err_ratelimited(hdev->dev,
 		"PSOC RAZWI interrupt: Mask %d, AR %d, AW %d, AXUSER_L 0x%x AXUSER_H 0x%x\n",
 		FIELD_GET(PSOC_GLOBAL_CONF_RAZWI_MASK_INFO_MASK_MASK, razwi_mask_info),
 		FIELD_GET(PSOC_GLOBAL_CONF_RAZWI_MASK_INFO_WAS_AR_MASK, razwi_mask_info),
 		FIELD_GET(PSOC_GLOBAL_CONF_RAZWI_MASK_INFO_WAS_AW_MASK, razwi_mask_info),
-		xy,
+		FIELD_GET(PSOC_GLOBAL_CONF_RAZWI_MASK_INFO_AXUSER_L_MASK, razwi_mask_info),
 		FIELD_GET(PSOC_GLOBAL_CONF_RAZWI_MASK_INFO_AXUSER_H_MASK, razwi_mask_info));
 
-	if (xy == 0) {
-		dev_err_ratelimited(hdev->dev,
-				"PSOC RAZWI interrupt: received event from 0 rtr coordinates\n");
-		goto clear;
-	}
-
-	/* Find router id by router coordinates */
-	for (rtr_id = 0 ; rtr_id < rtr_map_arr_len ; rtr_id++)
-		if (rtr_coordinates_to_rtr_id[rtr_id] == xy)
-			break;
-
-	if (rtr_id == rtr_map_arr_len) {
+	if (gaudi2_handle_psoc_razwi_happened(hdev, razwi_mask_info, event_mask))
+		error_count++;
+	else
 		dev_err_ratelimited(hdev->dev,
-				"PSOC RAZWI interrupt: invalid rtr coordinates (0x%x)\n", xy);
-		goto clear;
-	}
-
-	/* Find router mstr_if register base */
-	dcore_id = rtr_id / NUM_OF_RTR_PER_DCORE;
-	dcore_rtr_id = rtr_id % NUM_OF_RTR_PER_DCORE;
-	rtr_ctrl_base_addr = mmDCORE0_RTR0_CTRL_BASE + dcore_id * DCORE_OFFSET +
-				dcore_rtr_id * DCORE_RTR_OFFSET;
-
-	hbw_aw_set = RREG32(rtr_ctrl_base_addr + DEC_RAZWI_HBW_AW_SET);
-	hbw_ar_set = RREG32(rtr_ctrl_base_addr + DEC_RAZWI_HBW_AR_SET);
-	lbw_aw_set = RREG32(rtr_ctrl_base_addr + DEC_RAZWI_LBW_AW_SET);
-	lbw_ar_set = RREG32(rtr_ctrl_base_addr + DEC_RAZWI_LBW_AR_SET);
-
-	if (hbw_aw_set)
-		gaudi2_razwi_unmapped_addr_hbw_printf_info(hdev, rtr_id,
-						rtr_ctrl_base_addr, true, event_mask);
-
-	if (hbw_ar_set)
-		gaudi2_razwi_unmapped_addr_hbw_printf_info(hdev, rtr_id,
-						rtr_ctrl_base_addr, false, event_mask);
-
-	if (lbw_aw_set)
-		gaudi2_razwi_unmapped_addr_lbw_printf_info(hdev, rtr_id,
-						rtr_ctrl_base_addr, true, event_mask);
-
-	if (lbw_ar_set)
-		gaudi2_razwi_unmapped_addr_lbw_printf_info(hdev, rtr_id,
-						rtr_ctrl_base_addr, false, event_mask);
-
-	error_count++;
+				"PSOC RAZWI interrupt: invalid razwi info (0x%x)\n",
+				razwi_mask_info);
 
-clear:
 	/* Clear Interrupts only on pldm or if f/w doesn't handle interrupts */
 	if (hdev->pldm || !(hdev->fw_components & FW_TYPE_LINUX))
 		WREG32(mmPSOC_GLOBAL_CONF_RAZWI_INTERRUPT, razwi_intr);
-- 
2.25.1

