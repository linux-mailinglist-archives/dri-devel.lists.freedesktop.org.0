Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3620975F7DE
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 15:10:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E79AA10E2E4;
	Mon, 24 Jul 2023 13:10:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4528310E2E4
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 13:10:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5644561127;
 Mon, 24 Jul 2023 13:10:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D65FAC433C8;
 Mon, 24 Jul 2023 13:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690204205;
 bh=hZSKhVnakl638ueLHfTbYqWQAVqZC+AGJPMm4AVaOI4=;
 h=From:To:Cc:Subject:Date:From;
 b=Dn4bOJw+ASZHaFweTGRpTvt0rYdGGICrbbHB54Qo+oLlMHTQ5QuzYbkr/+nvP7muF
 MQ6Nb0NE3FNfS7zF16v27iKv6jpsZvskMw8rlttYhdrYxoglSg6AMmnEJ/YNiiWhF8
 aJfp1HiVbQF4uw8p2xO5Pz6SSwycZe3ehvNUWqAaRdT5xaiG6r8KAArRuNJ4Dkkydl
 1qL/5AH4uDTDZJZf34G87DIkkBDIF6r+ZhExt5q1PwT2h+vJj4QrR4zZjY5c5uRNP3
 YCK6276dHfhbcrUpMGy6InEHWwe4e4/R1XUg6M3aOFuSiMvStSVn7A0/1Ubv/WnVtc
 Vzce3gWKlJduQ==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] accel/habanalabs/gaudi2 : remove psoc_arc access
Date: Mon, 24 Jul 2023 16:09:59 +0300
Message-Id: <20230724131000.859507-1-ogabbay@kernel.org>
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
Cc: Benjamin Dotan <bdotan@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Benjamin Dotan <bdotan@habana.ai>

Because firmware is blocking PSOC_ARC_DBG, we need to disable access
to this block.

Signed-off-by: Benjamin Dotan <bdotan@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 .../habanalabs/gaudi2/gaudi2_coresight.c      | 24 +++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2_coresight.c b/drivers/accel/habanalabs/gaudi2/gaudi2_coresight.c
index 25b5368f37dd..3e90bc969264 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2_coresight.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2_coresight.c
@@ -151,8 +151,8 @@ static u64 debug_stm_regs[GAUDI2_STM_LAST + 1] = {
 	[GAUDI2_STM_DCORE3_VDEC1_CS] = mmDCORE3_VDEC1_CS_STM_BASE,
 	[GAUDI2_STM_PCIE] = mmPCIE_STM_BASE,
 	[GAUDI2_STM_PSOC] = mmPSOC_STM_BASE,
-	[GAUDI2_STM_PSOC_ARC0_CS] = mmPSOC_ARC0_CS_STM_BASE,
-	[GAUDI2_STM_PSOC_ARC1_CS] = mmPSOC_ARC1_CS_STM_BASE,
+	[GAUDI2_STM_PSOC_ARC0_CS] = 0,
+	[GAUDI2_STM_PSOC_ARC1_CS] = 0,
 	[GAUDI2_STM_PDMA0_CS] = mmPDMA0_CS_STM_BASE,
 	[GAUDI2_STM_PDMA1_CS] = mmPDMA1_CS_STM_BASE,
 	[GAUDI2_STM_CPU] = mmCPU_STM_BASE,
@@ -293,8 +293,8 @@ static u64 debug_etf_regs[GAUDI2_ETF_LAST + 1] = {
 	[GAUDI2_ETF_DCORE3_VDEC1_CS] = mmDCORE3_VDEC1_CS_ETF_BASE,
 	[GAUDI2_ETF_PCIE] = mmPCIE_ETF_BASE,
 	[GAUDI2_ETF_PSOC] = mmPSOC_ETF_BASE,
-	[GAUDI2_ETF_PSOC_ARC0_CS] = mmPSOC_ARC0_CS_ETF_BASE,
-	[GAUDI2_ETF_PSOC_ARC1_CS] = mmPSOC_ARC1_CS_ETF_BASE,
+	[GAUDI2_ETF_PSOC_ARC0_CS] = 0,
+	[GAUDI2_ETF_PSOC_ARC1_CS] = 0,
 	[GAUDI2_ETF_PDMA0_CS] = mmPDMA0_CS_ETF_BASE,
 	[GAUDI2_ETF_PDMA1_CS] = mmPDMA1_CS_ETF_BASE,
 	[GAUDI2_ETF_CPU_0] = mmCPU_ETF_0_BASE,
@@ -436,8 +436,8 @@ static u64 debug_funnel_regs[GAUDI2_FUNNEL_LAST + 1] = {
 	[GAUDI2_FUNNEL_DCORE3_RTR6] = mmDCORE3_RTR6_FUNNEL_BASE,
 	[GAUDI2_FUNNEL_DCORE3_RTR7] = mmDCORE3_RTR7_FUNNEL_BASE,
 	[GAUDI2_FUNNEL_PSOC] = mmPSOC_FUNNEL_BASE,
-	[GAUDI2_FUNNEL_PSOC_ARC0] = mmPSOC_ARC0_FUNNEL_BASE,
-	[GAUDI2_FUNNEL_PSOC_ARC1] = mmPSOC_ARC1_FUNNEL_BASE,
+	[GAUDI2_FUNNEL_PSOC_ARC0] = 0,
+	[GAUDI2_FUNNEL_PSOC_ARC1] = 0,
 	[GAUDI2_FUNNEL_XDMA] = mmXDMA_FUNNEL_BASE,
 	[GAUDI2_FUNNEL_CPU] = mmCPU_FUNNEL_BASE,
 	[GAUDI2_FUNNEL_PMMU] = mmPMMU_FUNNEL_BASE,
@@ -766,10 +766,10 @@ static u64 debug_bmon_regs[GAUDI2_BMON_LAST + 1] = {
 	[GAUDI2_BMON_PCIE_MSTR_RD] = mmPCIE_BMON_MSTR_RD_BASE,
 	[GAUDI2_BMON_PCIE_SLV_WR] = mmPCIE_BMON_SLV_WR_BASE,
 	[GAUDI2_BMON_PCIE_SLV_RD] = mmPCIE_BMON_SLV_RD_BASE,
-	[GAUDI2_BMON_PSOC_ARC0_0] = mmPSOC_ARC0_BMON_0_BASE,
-	[GAUDI2_BMON_PSOC_ARC0_1] = mmPSOC_ARC0_BMON_1_BASE,
-	[GAUDI2_BMON_PSOC_ARC1_0] = mmPSOC_ARC1_BMON_0_BASE,
-	[GAUDI2_BMON_PSOC_ARC1_1] = mmPSOC_ARC1_BMON_1_BASE,
+	[GAUDI2_BMON_PSOC_ARC0_0] = 0,
+	[GAUDI2_BMON_PSOC_ARC0_1] = 0,
+	[GAUDI2_BMON_PSOC_ARC1_0] = 0,
+	[GAUDI2_BMON_PSOC_ARC1_1] = 0,
 	[GAUDI2_BMON_PDMA0_0] = mmPDMA0_BMON_0_BASE,
 	[GAUDI2_BMON_PDMA0_1] = mmPDMA0_BMON_1_BASE,
 	[GAUDI2_BMON_PDMA1_0] = mmPDMA1_BMON_0_BASE,
@@ -968,8 +968,8 @@ static u64 debug_spmu_regs[GAUDI2_SPMU_LAST + 1] = {
 	[GAUDI2_SPMU_DCORE3_VDEC0_CS] = mmDCORE3_VDEC0_CS_SPMU_BASE,
 	[GAUDI2_SPMU_DCORE3_VDEC1_CS] = mmDCORE3_VDEC1_CS_SPMU_BASE,
 	[GAUDI2_SPMU_PCIE] = mmPCIE_SPMU_BASE,
-	[GAUDI2_SPMU_PSOC_ARC0_CS] = mmPSOC_ARC0_CS_SPMU_BASE,
-	[GAUDI2_SPMU_PSOC_ARC1_CS] = mmPSOC_ARC1_CS_SPMU_BASE,
+	[GAUDI2_SPMU_PSOC_ARC0_CS] = 0,
+	[GAUDI2_SPMU_PSOC_ARC1_CS] = 0,
 	[GAUDI2_SPMU_PDMA0_CS] = mmPDMA0_CS_SPMU_BASE,
 	[GAUDI2_SPMU_PDMA1_CS] = mmPDMA1_CS_SPMU_BASE,
 	[GAUDI2_SPMU_PMMU_CS] = mmPMMU_CS_SPMU_BASE,
-- 
2.34.1

