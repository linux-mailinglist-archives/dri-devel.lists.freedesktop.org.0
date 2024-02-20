Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6B485C088
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 17:02:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EB3010E4D6;
	Tue, 20 Feb 2024 16:02:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XqZcC6S8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FF5810E4CC
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 16:01:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A5F68611D4;
 Tue, 20 Feb 2024 16:01:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D2C5C43394;
 Tue, 20 Feb 2024 16:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708444901;
 bh=WOl+4ZdV247IWqqdatc7AVxaKDXgabrgBnrNgu874og=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XqZcC6S8mHwIjBn0d+GK63Kxv4K+vTVWZoiJmt0vdjnRo91G15mFS4vhA7rWpdTqF
 APSaXbAY+BNbmIHokTNVcE/s5Czar5u9GfSozvBHOh3MAa2IyOrhntXYpfVFSBbkCS
 dPDA64BNeQNxgxEB/wMwcG2fBoiU6O150T/jQVqxZ7a5YzDb2m7g4qZWPh1fas8ke2
 WxUGS7kG5JPndRSSPCUJVeLOqs6bdHIHOVBeMOqfg2SFihrTX9mN1h6HSRrGTtohDA
 DVJGG2CFERqSR/GnbZT8G88zlyLFRbBcVtFZg2MBAinLbUYMbks2xU+tqrBjI7kjTL
 Lo/xQ3kwOFctQ==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Tomer Tayar <ttayar@habana.ai>
Subject: [PATCH 05/13] accel/habanalabs: fix glbl error cause handling
Date: Tue, 20 Feb 2024 18:01:21 +0200
Message-Id: <20240220160129.909714-5-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240220160129.909714-1-ogabbay@kernel.org>
References: <20240220160129.909714-1-ogabbay@kernel.org>
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

The glbl error cause handling has a wrong assumption that all error
bits are consecutive.
Fix the handling to check all relevant error bits per ASIC.

Signed-off-by: Tomer Tayar <ttayar@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/habanalabs.h |  4 +--
 drivers/accel/habanalabs/common/security.c   | 33 +++++++++++++++-----
 drivers/accel/habanalabs/common/security.h   |  3 +-
 drivers/accel/habanalabs/gaudi2/gaudi2.c     | 10 +++---
 drivers/accel/habanalabs/gaudi2/gaudi2P.h    |  3 +-
 5 files changed, 35 insertions(+), 18 deletions(-)

diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
index c85849aefba6..40107a4eba93 100644
--- a/drivers/accel/habanalabs/common/habanalabs.h
+++ b/drivers/accel/habanalabs/common/habanalabs.h
@@ -647,7 +647,7 @@ struct hl_hints_range {
  * @num_engine_cores: number of engine cpu cores.
  * @max_num_of_engines: maximum number of all engines in the ASIC.
  * @num_of_special_blocks: special_blocks array size.
- * @glbl_err_cause_num: global err cause number.
+ * @glbl_err_max_cause_num: global err max cause number.
  * @hbw_flush_reg: register to read to generate HBW flush. value of 0 means HBW flush is
  *                 not supported.
  * @reserved_fw_mem_size: size in MB of dram memory reserved for FW.
@@ -779,7 +779,7 @@ struct asic_fixed_properties {
 	u32				num_engine_cores;
 	u32				max_num_of_engines;
 	u32				num_of_special_blocks;
-	u32				glbl_err_cause_num;
+	u32				glbl_err_max_cause_num;
 	u32				hbw_flush_reg;
 	u32				reserved_fw_mem_size;
 	u16				collective_first_sob;
diff --git a/drivers/accel/habanalabs/common/security.c b/drivers/accel/habanalabs/common/security.c
index fe913965dbad..5402a3cd0491 100644
--- a/drivers/accel/habanalabs/common/security.c
+++ b/drivers/accel/habanalabs/common/security.c
@@ -7,15 +7,31 @@
 
 #include "habanalabs.h"
 
-static const char * const hl_glbl_error_cause[HL_MAX_NUM_OF_GLBL_ERR_CAUSE] = {
+static const char * const hl_glbl_error_cause[] = {
 	"Error due to un-priv read",
 	"Error due to un-secure read",
 	"Error due to read from unmapped reg",
 	"Error due to un-priv write",
 	"Error due to un-secure write",
 	"Error due to write to unmapped reg",
+	"N/A",
+	"N/A",
+	"N/A",
+	"N/A",
+	"N/A",
+	"N/A",
+	"N/A",
+	"N/A",
+	"N/A",
+	"N/A",
 	"External I/F write sec violation",
 	"External I/F write to un-mapped reg",
+	"N/A",
+	"N/A",
+	"N/A",
+	"N/A",
+	"N/A",
+	"N/A",
 	"Read to write only",
 	"Write to read only"
 };
@@ -671,10 +687,11 @@ static bool hl_check_block_range_exclusion(struct hl_device *hdev,
 static int hl_read_glbl_errors(struct hl_device *hdev,
 		u32 blk_idx, u32 major, u32 minor, u32 sub_minor, void *data)
 {
-	struct hl_special_block_info *special_blocks = hdev->asic_prop.special_blocks;
+	struct asic_fixed_properties *prop = &hdev->asic_prop;
+	struct hl_special_block_info *special_blocks = prop->special_blocks;
 	struct hl_special_block_info *current_block = &special_blocks[blk_idx];
 	u32 glbl_err_addr, glbl_err_cause, addr_val, cause_val, block_base,
-		base = current_block->base_addr - lower_32_bits(hdev->asic_prop.cfg_base_address);
+		base = current_block->base_addr - lower_32_bits(prop->cfg_base_address);
 	int i;
 
 	block_base = base + major * current_block->major_offset +
@@ -689,13 +706,13 @@ static int hl_read_glbl_errors(struct hl_device *hdev,
 	glbl_err_addr = block_base + HL_GLBL_ERR_ADDR_OFFSET;
 	addr_val = RREG32(glbl_err_addr);
 
-	for (i = 0 ; i < hdev->asic_prop.glbl_err_cause_num ; i++) {
+	for (i = 0 ; i <= prop->glbl_err_max_cause_num ; i++) {
 		if (cause_val & BIT(i))
 			dev_err_ratelimited(hdev->dev,
-				"%s, addr %#llx\n",
-				hl_glbl_error_cause[i],
-				hdev->asic_prop.cfg_base_address + block_base +
-				FIELD_GET(HL_GLBL_ERR_ADDRESS_MASK, addr_val));
+					"%s, addr %#llx\n",
+					hl_glbl_error_cause[i],
+					prop->cfg_base_address + block_base +
+						FIELD_GET(HL_GLBL_ERR_ADDRESS_MASK, addr_val));
 	}
 
 	WREG32(glbl_err_cause, cause_val);
diff --git a/drivers/accel/habanalabs/common/security.h b/drivers/accel/habanalabs/common/security.h
index d7a3b3e82ea4..476f70687c09 100644
--- a/drivers/accel/habanalabs/common/security.h
+++ b/drivers/accel/habanalabs/common/security.h
@@ -13,8 +13,7 @@
 struct hl_device;
 
 /* special blocks */
-#define HL_MAX_NUM_OF_GLBL_ERR_CAUSE		10
-#define HL_GLBL_ERR_ADDRESS_MASK		GENMASK(11, 0)
+#define HL_GLBL_ERR_ADDRESS_MASK	GENMASK(11, 0)
 /* GLBL_ERR_ADDR register offset from the start of the block */
 #define HL_GLBL_ERR_ADDR_OFFSET		0xF44
 /* GLBL_ERR_CAUSE register offset from the start of the block */
diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index 671241735a6e..189d8da6a624 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -158,11 +158,13 @@
 #define RAZWI_INITIATOR_ID_X_Y(xl, yl, xh) \
 	(RAZWI_INITIATOR_ID_X_Y_LOW(xl, yl) | RAZWI_INITIATOR_ID_X_HIGH(xh))
 
-#define PSOC_RAZWI_ENG_STR_SIZE 128
-#define PSOC_RAZWI_MAX_ENG_PER_RTR 5
+#define PSOC_RAZWI_ENG_STR_SIZE			128
+#define PSOC_RAZWI_MAX_ENG_PER_RTR		5
 
 /* HW scrambles only bits 0-25 */
-#define HW_UNSCRAMBLED_BITS_MASK GENMASK_ULL(63, 26)
+#define HW_UNSCRAMBLED_BITS_MASK		GENMASK_ULL(63, 26)
+
+#define GAUDI2_GLBL_ERR_MAX_CAUSE_NUM		17
 
 struct gaudi2_razwi_info {
 	u32 axuser_xy;
@@ -3587,7 +3589,7 @@ static int gaudi2_special_blocks_config(struct hl_device *hdev)
 	int i, rc;
 
 	/* Configure Special blocks */
-	prop->glbl_err_cause_num = GAUDI2_NUM_OF_GLBL_ERR_CAUSE;
+	prop->glbl_err_max_cause_num = GAUDI2_GLBL_ERR_MAX_CAUSE_NUM;
 	prop->num_of_special_blocks = ARRAY_SIZE(gaudi2_special_blocks);
 	prop->special_blocks = kmalloc_array(prop->num_of_special_blocks,
 			sizeof(*prop->special_blocks), GFP_KERNEL);
diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2P.h b/drivers/accel/habanalabs/gaudi2/gaudi2P.h
index bc508c9cee5c..eee41387b269 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2P.h
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2P.h
@@ -237,9 +237,8 @@
 #define GAUDI2_SOB_INCREMENT_BY_ONE	(FIELD_PREP(DCORE0_SYNC_MNGR_OBJS_SOB_OBJ_VAL_MASK, 1) | \
 					FIELD_PREP(DCORE0_SYNC_MNGR_OBJS_SOB_OBJ_INC_MASK, 1))
 
-#define GAUDI2_NUM_TESTED_QS (GAUDI2_QUEUE_ID_CPU_PQ - GAUDI2_QUEUE_ID_PDMA_0_0)
+#define GAUDI2_NUM_TESTED_QS		(GAUDI2_QUEUE_ID_CPU_PQ - GAUDI2_QUEUE_ID_PDMA_0_0)
 
-#define GAUDI2_NUM_OF_GLBL_ERR_CAUSE		8
 
 enum gaudi2_reserved_sob_id {
 	GAUDI2_RESERVED_SOB_CS_COMPLETION_FIRST,
-- 
2.34.1

