Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 412C76C4616
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 10:19:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B99110E8D7;
	Wed, 22 Mar 2023 09:19:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C3DE10E8D6
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 09:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679476774; x=1711012774;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y+Jj1CVr1WzptGfbOtkzjK2sq60uSJO1fdOXKEq8jMw=;
 b=m3L6yRA0a5fV0KFD7tESGQwJMoNIZYwM0Dn34Hxm2pnvQwn8VxyVfD2R
 7Ww3+diioc1kohTbz72OhV2n5AYe0fA06Ck3x+NV1tWHyE3TDIPQN/hRv
 R5TmIbF6h8CH1bDPJUzAr2T3OjjyeHSN7Tb/KAo3oTdG3JtnWb06Hk0LB
 USseeNcVqrjZ/wPsJ5L1NCzgdl2laY57SSDgqbtCZRjgx7LRzKmFIYEz0
 /DkW2x85QTBpbD1BxJrZE4Opmo73vZxkrsJTLARVgj0mz8jr45iDtwhot
 q43JkkHhtaHeiUuhnnJBtxySn7Mghy28LRHL6ZzmsmSXfnoCFQQY65LpT g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="366904347"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; d="scan'208";a="366904347"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 02:19:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="746229855"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; d="scan'208";a="746229855"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 02:19:32 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 6/7] accel/ivpu: Remove support for 1 tile SKUs
Date: Wed, 22 Mar 2023 10:18:59 +0100
Message-Id: <20230322091900.1982453-7-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230322091900.1982453-1-stanislaw.gruszka@linux.intel.com>
References: <20230322091900.1982453-1-stanislaw.gruszka@linux.intel.com>
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
Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The support for single tile SKUs was dropped from MTL.
Note that we can still boot the VPU with 1-tile work point
config - this is independent from number of tiles present
in the VPU.

Co-developed-by: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
Signed-off-by: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_hw_mtl.c | 59 ++++++++++----------------------
 1 file changed, 18 insertions(+), 41 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_hw_mtl.c b/drivers/accel/ivpu/ivpu_hw_mtl.c
index 133ba33d2866..98c8a4aa25f0 100644
--- a/drivers/accel/ivpu/ivpu_hw_mtl.c
+++ b/drivers/accel/ivpu/ivpu_hw_mtl.c
@@ -12,20 +12,20 @@
 #include "ivpu_mmu.h"
 #include "ivpu_pm.h"
 
-#define TILE_FUSE_ENABLE_BOTH	     0x0
-#define TILE_FUSE_ENABLE_UPPER	     0x1
-#define TILE_FUSE_ENABLE_LOWER	     0x2
-
-#define TILE_SKU_BOTH_MTL	     0x3630
-#define TILE_SKU_LOWER_MTL	     0x3631
-#define TILE_SKU_UPPER_MTL	     0x3632
+#define TILE_FUSE_ENABLE_BOTH        0x0
+#define TILE_SKU_BOTH_MTL            0x3630
 
 /* Work point configuration values */
-#define WP_CONFIG_1_TILE_5_3_RATIO   0x0101
-#define WP_CONFIG_1_TILE_4_3_RATIO   0x0102
-#define WP_CONFIG_2_TILE_5_3_RATIO   0x0201
-#define WP_CONFIG_2_TILE_4_3_RATIO   0x0202
-#define WP_CONFIG_0_TILE_PLL_OFF     0x0000
+#define CONFIG_1_TILE                0x01
+#define CONFIG_2_TILE                0x02
+#define PLL_RATIO_5_3                0x01
+#define PLL_RATIO_4_3                0x02
+#define WP_CONFIG(tile, ratio)       (((tile) << 8) | (ratio))
+#define WP_CONFIG_1_TILE_5_3_RATIO   WP_CONFIG(CONFIG_1_TILE, PLL_RATIO_5_3)
+#define WP_CONFIG_1_TILE_4_3_RATIO   WP_CONFIG(CONFIG_1_TILE, PLL_RATIO_4_3)
+#define WP_CONFIG_2_TILE_5_3_RATIO   WP_CONFIG(CONFIG_2_TILE, PLL_RATIO_5_3)
+#define WP_CONFIG_2_TILE_4_3_RATIO   WP_CONFIG(CONFIG_2_TILE, PLL_RATIO_4_3)
+#define WP_CONFIG_0_TILE_PLL_OFF     WP_CONFIG(0, 0)
 
 #define PLL_REF_CLK_FREQ	     (50 * 1000000)
 #define PLL_SIMULATION_FREQ	     (10 * 1000000)
@@ -219,7 +219,8 @@ static int ivpu_pll_drive(struct ivpu_device *vdev, bool enable)
 		config = 0;
 	}
 
-	ivpu_dbg(vdev, PM, "PLL workpoint request: %d Hz\n", PLL_RATIO_TO_FREQ(target_ratio));
+	ivpu_dbg(vdev, PM, "PLL workpoint request: config 0x%04x pll ratio 0x%x\n",
+		 config, target_ratio);
 
 	ret = ivpu_pll_cmd_send(vdev, hw->pll.min_ratio, hw->pll.max_ratio, target_ratio, config);
 	if (ret) {
@@ -610,34 +611,10 @@ static int ivpu_boot_d0i3_drive(struct ivpu_device *vdev, bool enable)
 static int ivpu_hw_mtl_info_init(struct ivpu_device *vdev)
 {
 	struct ivpu_hw_info *hw = vdev->hw;
-	u32 tile_fuse;
-
-	tile_fuse = REGB_RD32(MTL_BUTTRESS_TILE_FUSE);
-	if (!REG_TEST_FLD(MTL_BUTTRESS_TILE_FUSE, VALID, tile_fuse))
-		ivpu_warn(vdev, "Tile Fuse: Invalid (0x%x)\n", tile_fuse);
-
-	hw->tile_fuse = REG_GET_FLD(MTL_BUTTRESS_TILE_FUSE, SKU, tile_fuse);
-	switch (hw->tile_fuse) {
-	case TILE_FUSE_ENABLE_LOWER:
-		hw->sku = TILE_SKU_LOWER_MTL;
-		hw->config = WP_CONFIG_1_TILE_5_3_RATIO;
-		ivpu_dbg(vdev, MISC, "Tile Fuse: Enable Lower\n");
-		break;
-	case TILE_FUSE_ENABLE_UPPER:
-		hw->sku = TILE_SKU_UPPER_MTL;
-		hw->config = WP_CONFIG_1_TILE_4_3_RATIO;
-		ivpu_dbg(vdev, MISC, "Tile Fuse: Enable Upper\n");
-		break;
-	case TILE_FUSE_ENABLE_BOTH:
-		hw->sku = TILE_SKU_BOTH_MTL;
-		hw->config = WP_CONFIG_2_TILE_5_3_RATIO;
-		ivpu_dbg(vdev, MISC, "Tile Fuse: Enable Both\n");
-		break;
-	default:
-		hw->config = WP_CONFIG_0_TILE_PLL_OFF;
-		ivpu_dbg(vdev, MISC, "Tile Fuse: Disable\n");
-		break;
-	}
+
+	hw->tile_fuse = TILE_FUSE_ENABLE_BOTH;
+	hw->sku = TILE_SKU_BOTH_MTL;
+	hw->config = WP_CONFIG_2_TILE_4_3_RATIO;
 
 	ivpu_pll_init_frequency_ratios(vdev);
 
-- 
2.25.1

