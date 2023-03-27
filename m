Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 092396CA248
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 13:22:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D8F710E398;
	Mon, 27 Mar 2023 11:22:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 630EF10E393
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 11:22:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BB7C561199;
 Mon, 27 Mar 2023 11:22:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44692C433EF;
 Mon, 27 Mar 2023 11:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679916139;
 bh=MfaXqWso3QIBbKU04aOPIcZSCSFgqbkHFvgy8vyXGKM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dCGbFiMRrcsCF4d5BnhHDxofSpwYhSHwJCg9WuP5CW/i19USZzZdpBekCQ+KGiTu3
 C0U2Bbwj2Bd9BSM/zg4CNsy9+rIQdYixJX2hq/UGwlmKseDY2dtNI7SAkbdBt/7uxC
 uVAZ2SNJpI8D+LT6b04rbZvNSObGfBiYZeSeNSm6XFe8k072T2EXcHgRVhmQ/ixAha
 AFj5hkXjVgajroE4vIBGYwDB2H7l+x9h2/tnWMpbOdn4kku3HDE+uPrQOT326qISMS
 LsQ5ek88CJMvWMRWE89kV7OOaWP6sd/84id+pxC1llRyJGSlICsWEsOxSZR04uMHYd
 0Yi+TqG/QXQrA==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] accel/habanalabs: fix HBM MMU interrupt handling
Date: Mon, 27 Mar 2023 14:22:10 +0300
Message-Id: <20230327112210.1287876-3-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230327112210.1287876-1-ogabbay@kernel.org>
References: <20230327112210.1287876-1-ogabbay@kernel.org>
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

Current mapping between HMMU event and HMMU block is wrong.
In addition the captured address in case of a page fault or
an access error is scrambled, Hence we must call the descramble
function.

Signed-off-by: Ofir Bitton <obitton@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/gaudi2/gaudi2.c | 145 +++++++++++++++++------
 1 file changed, 108 insertions(+), 37 deletions(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index bace4ac998e0..ad491fb2c39d 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -2112,6 +2112,7 @@ static bool gaudi2_get_mme_idle_status(struct hl_device *hdev, u64 *mask_arr, u8
 static bool gaudi2_get_edma_idle_status(struct hl_device *hdev, u64 *mask_arr, u8 mask_len,
 		struct engines_data *e);
 static u64 gaudi2_mmu_scramble_addr(struct hl_device *hdev, u64 raw_addr);
+static u64 gaudi2_mmu_descramble_addr(struct hl_device *hdev, u64 scrambled_addr);
 
 static void gaudi2_init_scrambler_hbm(struct hl_device *hdev)
 {
@@ -8844,7 +8845,7 @@ static int gaudi2_handle_hif_fatal(struct hl_device *hdev, u16 event_type, u64 i
 static void gaudi2_handle_page_error(struct hl_device *hdev, u64 mmu_base, bool is_pmmu,
 					u64 *event_mask)
 {
-	u32 valid, val, axid_l, axid_h;
+	u32 valid, val;
 	u64 addr;
 
 	valid = RREG32(mmu_base + MMU_OFFSET(mmDCORE0_HMMU0_MMU_ACCESS_PAGE_ERROR_VALID));
@@ -8857,11 +8858,11 @@ static void gaudi2_handle_page_error(struct hl_device *hdev, u64 mmu_base, bool
 	addr <<= 32;
 	addr |= RREG32(mmu_base + MMU_OFFSET(mmDCORE0_HMMU0_MMU_PAGE_ERROR_CAPTURE_VA));
 
-	axid_l = RREG32(mmu_base + MMU_OFFSET(mmDCORE0_HMMU0_MMU_PAGE_FAULT_ID_LSB));
-	axid_h = RREG32(mmu_base + MMU_OFFSET(mmDCORE0_HMMU0_MMU_PAGE_FAULT_ID_MSB));
+	if (!is_pmmu)
+		addr = gaudi2_mmu_descramble_addr(hdev, addr);
 
-	dev_err_ratelimited(hdev->dev, "%s page fault on va 0x%llx, transaction id 0x%llX\n",
-				is_pmmu ? "PMMU" : "HMMU", addr, ((u64)axid_h << 32) + axid_l);
+	dev_err_ratelimited(hdev->dev, "%s page fault on va 0x%llx\n",
+				is_pmmu ? "PMMU" : "HMMU", addr);
 	hl_handle_page_fault(hdev, addr, 0, is_pmmu, event_mask);
 
 	WREG32(mmu_base + MMU_OFFSET(mmDCORE0_HMMU0_MMU_ACCESS_PAGE_ERROR_VALID), 0);
@@ -8882,6 +8883,9 @@ static void gaudi2_handle_access_error(struct hl_device *hdev, u64 mmu_base, boo
 	addr <<= 32;
 	addr |= RREG32(mmu_base + MMU_OFFSET(mmDCORE0_HMMU0_MMU_ACCESS_ERROR_CAPTURE_VA));
 
+	if (!is_pmmu)
+		addr = gaudi2_mmu_descramble_addr(hdev, addr);
+
 	dev_err_ratelimited(hdev->dev, "%s access error on va 0x%llx\n",
 				is_pmmu ? "PMMU" : "HMMU", addr);
 	WREG32(mmu_base + MMU_OFFSET(mmDCORE0_HMMU0_MMU_ACCESS_PAGE_ERROR_VALID), 0);
@@ -8976,46 +8980,110 @@ static int gaudi2_handle_sm_err(struct hl_device *hdev, u16 event_type, u8 sm_in
 	return error_count;
 }
 
+static u64 get_hmmu_base(u16 event_type)
+{
+	u8 dcore, index_in_dcore;
+
+	switch (event_type) {
+	case GAUDI2_EVENT_HMMU_0_AXI_ERR_RSP:
+	case GAUDI2_EVENT_HMMU0_SPI_BASE ... GAUDI2_EVENT_HMMU0_SECURITY_ERROR:
+		dcore = 0;
+		index_in_dcore = 0;
+	break;
+	case GAUDI2_EVENT_HMMU_1_AXI_ERR_RSP:
+	case GAUDI2_EVENT_HMMU1_SPI_BASE ... GAUDI2_EVENT_HMMU1_SECURITY_ERROR:
+		dcore = 1;
+		index_in_dcore = 0;
+	break;
+	case GAUDI2_EVENT_HMMU_2_AXI_ERR_RSP:
+	case GAUDI2_EVENT_HMMU2_SPI_BASE ... GAUDI2_EVENT_HMMU2_SECURITY_ERROR:
+		dcore = 0;
+		index_in_dcore = 1;
+	break;
+	case GAUDI2_EVENT_HMMU_3_AXI_ERR_RSP:
+	case GAUDI2_EVENT_HMMU3_SPI_BASE ... GAUDI2_EVENT_HMMU3_SECURITY_ERROR:
+		dcore = 1;
+		index_in_dcore = 1;
+	break;
+	case GAUDI2_EVENT_HMMU_4_AXI_ERR_RSP:
+	case GAUDI2_EVENT_HMMU4_SPI_BASE ... GAUDI2_EVENT_HMMU4_SECURITY_ERROR:
+		dcore = 3;
+		index_in_dcore = 2;
+	break;
+	case GAUDI2_EVENT_HMMU_5_AXI_ERR_RSP:
+	case GAUDI2_EVENT_HMMU5_SPI_BASE ... GAUDI2_EVENT_HMMU5_SECURITY_ERROR:
+		dcore = 2;
+		index_in_dcore = 2;
+	break;
+	case GAUDI2_EVENT_HMMU_6_AXI_ERR_RSP:
+	case GAUDI2_EVENT_HMMU6_SPI_BASE ... GAUDI2_EVENT_HMMU6_SECURITY_ERROR:
+		dcore = 3;
+		index_in_dcore = 3;
+	break;
+	case GAUDI2_EVENT_HMMU_7_AXI_ERR_RSP:
+	case GAUDI2_EVENT_HMMU7_SPI_BASE ... GAUDI2_EVENT_HMMU7_SECURITY_ERROR:
+		dcore = 2;
+		index_in_dcore = 3;
+	break;
+	case GAUDI2_EVENT_HMMU_8_AXI_ERR_RSP:
+	case GAUDI2_EVENT_HMMU8_SPI_BASE ... GAUDI2_EVENT_HMMU8_SECURITY_ERROR:
+		dcore = 0;
+		index_in_dcore = 2;
+	break;
+	case GAUDI2_EVENT_HMMU_9_AXI_ERR_RSP:
+	case GAUDI2_EVENT_HMMU9_SPI_BASE ... GAUDI2_EVENT_HMMU9_SECURITY_ERROR:
+		dcore = 1;
+		index_in_dcore = 2;
+	break;
+	case GAUDI2_EVENT_HMMU_10_AXI_ERR_RSP:
+	case GAUDI2_EVENT_HMMU10_SPI_BASE ... GAUDI2_EVENT_HMMU10_SECURITY_ERROR:
+		dcore = 0;
+		index_in_dcore = 3;
+	break;
+	case GAUDI2_EVENT_HMMU_11_AXI_ERR_RSP:
+	case GAUDI2_EVENT_HMMU11_SPI_BASE ... GAUDI2_EVENT_HMMU11_SECURITY_ERROR:
+		dcore = 1;
+		index_in_dcore = 3;
+	break;
+	case GAUDI2_EVENT_HMMU_12_AXI_ERR_RSP:
+	case GAUDI2_EVENT_HMMU12_SPI_BASE ... GAUDI2_EVENT_HMMU12_SECURITY_ERROR:
+		dcore = 3;
+		index_in_dcore = 0;
+	break;
+	case GAUDI2_EVENT_HMMU_13_AXI_ERR_RSP:
+	case GAUDI2_EVENT_HMMU13_SPI_BASE ... GAUDI2_EVENT_HMMU13_SECURITY_ERROR:
+		dcore = 2;
+		index_in_dcore = 0;
+	break;
+	case GAUDI2_EVENT_HMMU_14_AXI_ERR_RSP:
+	case GAUDI2_EVENT_HMMU14_SPI_BASE ... GAUDI2_EVENT_HMMU14_SECURITY_ERROR:
+		dcore = 3;
+		index_in_dcore = 1;
+	break;
+	case GAUDI2_EVENT_HMMU_15_AXI_ERR_RSP:
+	case GAUDI2_EVENT_HMMU15_SPI_BASE ... GAUDI2_EVENT_HMMU15_SECURITY_ERROR:
+		dcore = 2;
+		index_in_dcore = 1;
+	break;
+	default:
+		return ULONG_MAX;
+	}
+
+	return mmDCORE0_HMMU0_MMU_BASE + dcore * DCORE_OFFSET + index_in_dcore * DCORE_HMMU_OFFSET;
+}
+
 static int gaudi2_handle_mmu_spi_sei_err(struct hl_device *hdev, u16 event_type, u64 *event_mask)
 {
 	bool is_pmmu = false;
 	u32 error_count = 0;
 	u64 mmu_base;
-	u8 index;
 
 	switch (event_type) {
-	case GAUDI2_EVENT_HMMU0_PAGE_FAULT_OR_WR_PERM ... GAUDI2_EVENT_HMMU3_SECURITY_ERROR:
-		index = (event_type - GAUDI2_EVENT_HMMU0_PAGE_FAULT_OR_WR_PERM) / 3;
-		mmu_base = mmDCORE0_HMMU0_MMU_BASE + index * DCORE_HMMU_OFFSET;
-		break;
-	case GAUDI2_EVENT_HMMU_0_AXI_ERR_RSP ... GAUDI2_EVENT_HMMU_3_AXI_ERR_RSP:
-		index = (event_type - GAUDI2_EVENT_HMMU_0_AXI_ERR_RSP);
-		mmu_base = mmDCORE0_HMMU0_MMU_BASE + index * DCORE_HMMU_OFFSET;
-		break;
-	case GAUDI2_EVENT_HMMU8_PAGE_FAULT_WR_PERM ... GAUDI2_EVENT_HMMU11_SECURITY_ERROR:
-		index = (event_type - GAUDI2_EVENT_HMMU8_PAGE_FAULT_WR_PERM) / 3;
-		mmu_base = mmDCORE1_HMMU0_MMU_BASE + index * DCORE_HMMU_OFFSET;
-		break;
-	case GAUDI2_EVENT_HMMU_8_AXI_ERR_RSP ... GAUDI2_EVENT_HMMU_11_AXI_ERR_RSP:
-		index = (event_type - GAUDI2_EVENT_HMMU_8_AXI_ERR_RSP);
-		mmu_base = mmDCORE1_HMMU0_MMU_BASE + index * DCORE_HMMU_OFFSET;
-		break;
-	case GAUDI2_EVENT_HMMU7_PAGE_FAULT_WR_PERM ... GAUDI2_EVENT_HMMU4_SECURITY_ERROR:
-		index = (event_type - GAUDI2_EVENT_HMMU7_PAGE_FAULT_WR_PERM) / 3;
-		mmu_base = mmDCORE2_HMMU0_MMU_BASE + index * DCORE_HMMU_OFFSET;
-		break;
-	case GAUDI2_EVENT_HMMU_7_AXI_ERR_RSP ... GAUDI2_EVENT_HMMU_4_AXI_ERR_RSP:
-		index = (event_type - GAUDI2_EVENT_HMMU_7_AXI_ERR_RSP);
-		mmu_base = mmDCORE2_HMMU0_MMU_BASE + index * DCORE_HMMU_OFFSET;
-		break;
-	case GAUDI2_EVENT_HMMU15_PAGE_FAULT_WR_PERM ... GAUDI2_EVENT_HMMU12_SECURITY_ERROR:
-		index = (event_type - GAUDI2_EVENT_HMMU15_PAGE_FAULT_WR_PERM) / 3;
-		mmu_base = mmDCORE3_HMMU0_MMU_BASE + index * DCORE_HMMU_OFFSET;
-		break;
-	case GAUDI2_EVENT_HMMU_15_AXI_ERR_RSP ... GAUDI2_EVENT_HMMU_12_AXI_ERR_RSP:
-		index = (event_type - GAUDI2_EVENT_HMMU_15_AXI_ERR_RSP);
-		mmu_base = mmDCORE3_HMMU0_MMU_BASE + index * DCORE_HMMU_OFFSET;
+	case GAUDI2_EVENT_HMMU_0_AXI_ERR_RSP ... GAUDI2_EVENT_HMMU_12_AXI_ERR_RSP:
+	case GAUDI2_EVENT_HMMU0_SPI_BASE ... GAUDI2_EVENT_HMMU12_SECURITY_ERROR:
+		mmu_base = get_hmmu_base(event_type);
 		break;
+
 	case GAUDI2_EVENT_PMMU0_PAGE_FAULT_WR_PERM ... GAUDI2_EVENT_PMMU0_SECURITY_ERROR:
 	case GAUDI2_EVENT_PMMU_AXI_ERR_RSP_0:
 		is_pmmu = true;
@@ -9025,6 +9093,9 @@ static int gaudi2_handle_mmu_spi_sei_err(struct hl_device *hdev, u16 event_type,
 		return 0;
 	}
 
+	if (mmu_base == ULONG_MAX)
+		return 0;
+
 	error_count = gaudi2_handle_mmu_spi_sei_generic(hdev, event_type, mmu_base,
 							is_pmmu, event_mask);
 	hl_check_for_glbl_errors(hdev);
-- 
2.40.0

