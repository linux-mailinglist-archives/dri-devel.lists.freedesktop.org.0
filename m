Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E00718BFE94
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 15:21:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E12511294C;
	Wed,  8 May 2024 13:21:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WE72vd3S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BA89112932
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 13:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715174475; x=1746710475;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jREinNicE4p4+MHjF9lzFfJ3OJU53LtgzjavYaFgtzw=;
 b=WE72vd3ShSxVpZkciue0ls2KlRSpTp8EnOIJerxEyIBYdKiMKExRKESR
 2LTs/SwZt61Nd8OFkokJ+I41++K04EbHNTKm7WOTi9qr9T+R4AN7D+2fA
 qJt5OzM/Ucj/P201ML3wg3sJFGMQDOnPgg69lIggV7k/mlSYVw8YHEX+o
 fPEog7YBkwdNkT1QhoOHudZJ8xbZDHX7xVpiZUPKcRkf23X8vdgvJe/Ly
 NV8nINY1OEiJVzrvU2ZSzImp2eW8vsEHMayGKeITw7lKQ2SoGxTMpK1O1
 GPGjrvEkEI+otb5YPXkjN4Eo9m/so+ZN9uduoN0qEiWkoTiB1pl30EyeP Q==;
X-CSE-ConnectionGUID: 8AMzs9BBTLOwxtSAIHug2Q==
X-CSE-MsgGUID: 4wk9d0lPTEKqgzHRJXkTqg==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="33540029"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="33540029"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 06:21:14 -0700
X-CSE-ConnectionGUID: ge+3XJJnRJ+8ChpVgarHig==
X-CSE-MsgGUID: Vnh9tGkKTvSVuC4hUQihxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="29289347"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 06:21:12 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 "Wachowski, Karol" <karol.wachowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 02/12] accel/ivpu: Add sched_mode module param
Date: Wed,  8 May 2024 15:20:59 +0200
Message-ID: <20240508132106.2387464-3-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240508132106.2387464-1-jacek.lawrynowicz@linux.intel.com>
References: <20240508132106.2387464-1-jacek.lawrynowicz@linux.intel.com>
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

From: "Wachowski, Karol" <karol.wachowski@intel.com>

This param will be used to enable/disable HWS (hardware scheduler).
The HWS is a FW side feature and may not be available on all
HW generations and FW versions.

Signed-off-by: Wachowski, Karol <karol.wachowski@intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.c     | 4 ++++
 drivers/accel/ivpu/ivpu_drv.h     | 1 +
 drivers/accel/ivpu/ivpu_hw.h      | 3 ++-
 drivers/accel/ivpu/ivpu_hw_37xx.c | 1 +
 drivers/accel/ivpu/ivpu_hw_40xx.c | 3 ++-
 5 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index 51d3f1a55d02..db47e7ef6322 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -51,6 +51,10 @@ u8 ivpu_pll_max_ratio = U8_MAX;
 module_param_named(pll_max_ratio, ivpu_pll_max_ratio, byte, 0644);
 MODULE_PARM_DESC(pll_max_ratio, "Maximum PLL ratio used to set NPU frequency");
 
+bool ivpu_sched_mode;
+module_param_named(sched_mode, ivpu_sched_mode, bool, 0644);
+MODULE_PARM_DESC(sched_mode, "Scheduler mode: 0 - OS scheduler, 1 - HW scheduler");
+
 bool ivpu_disable_mmu_cont_pages;
 module_param_named(disable_mmu_cont_pages, ivpu_disable_mmu_cont_pages, bool, 0644);
 MODULE_PARM_DESC(disable_mmu_cont_pages, "Disable MMU contiguous pages optimization");
diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
index bb4374d0eaec..a3993c93403a 100644
--- a/drivers/accel/ivpu/ivpu_drv.h
+++ b/drivers/accel/ivpu/ivpu_drv.h
@@ -158,6 +158,7 @@ struct ivpu_file_priv {
 extern int ivpu_dbg_mask;
 extern u8 ivpu_pll_min_ratio;
 extern u8 ivpu_pll_max_ratio;
+extern bool ivpu_sched_mode;
 extern bool ivpu_disable_mmu_cont_pages;
 
 #define IVPU_TEST_MODE_FW_TEST            BIT(0)
diff --git a/drivers/accel/ivpu/ivpu_hw.h b/drivers/accel/ivpu/ivpu_hw.h
index 094c659d2800..d247a2e99496 100644
--- a/drivers/accel/ivpu/ivpu_hw.h
+++ b/drivers/accel/ivpu/ivpu_hw.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright (C) 2020-2023 Intel Corporation
+ * Copyright (C) 2020-2024 Intel Corporation
  */
 
 #ifndef __IVPU_HW_H__
@@ -59,6 +59,7 @@ struct ivpu_hw_info {
 		u32 profiling_freq;
 	} pll;
 	u32 tile_fuse;
+	u32 sched_mode;
 	u32 sku;
 	u16 config;
 	int dma_bits;
diff --git a/drivers/accel/ivpu/ivpu_hw_37xx.c b/drivers/accel/ivpu/ivpu_hw_37xx.c
index bd25e2d9fb0f..ce664b6515aa 100644
--- a/drivers/accel/ivpu/ivpu_hw_37xx.c
+++ b/drivers/accel/ivpu/ivpu_hw_37xx.c
@@ -589,6 +589,7 @@ static int ivpu_hw_37xx_info_init(struct ivpu_device *vdev)
 	hw->tile_fuse = TILE_FUSE_ENABLE_BOTH;
 	hw->sku = TILE_SKU_BOTH;
 	hw->config = WP_CONFIG_2_TILE_4_3_RATIO;
+	hw->sched_mode = ivpu_sched_mode;
 
 	ivpu_pll_init_frequency_ratios(vdev);
 
diff --git a/drivers/accel/ivpu/ivpu_hw_40xx.c b/drivers/accel/ivpu/ivpu_hw_40xx.c
index b0b88d4c8926..186cd87079c2 100644
--- a/drivers/accel/ivpu/ivpu_hw_40xx.c
+++ b/drivers/accel/ivpu/ivpu_hw_40xx.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2020-2023 Intel Corporation
+ * Copyright (C) 2020-2024 Intel Corporation
  */
 
 #include "ivpu_drv.h"
@@ -724,6 +724,7 @@ static int ivpu_hw_40xx_info_init(struct ivpu_device *vdev)
 	else
 		ivpu_dbg(vdev, MISC, "Fuse: All %d tiles enabled\n", TILE_MAX_NUM);
 
+	hw->sched_mode = ivpu_sched_mode;
 	hw->tile_fuse = tile_disable;
 	hw->pll.profiling_freq = PLL_PROFILING_FREQ_DEFAULT;
 
-- 
2.43.2

