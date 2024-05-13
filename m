Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59EDD8C4062
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 14:04:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AC6010E70A;
	Mon, 13 May 2024 12:04:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c/D5yzqN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BD4110E704
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 12:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715601878; x=1747137878;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7JD6wRYkYyjdyabxbynbaIGDhtHyQ3NIFRdwyc92xDw=;
 b=c/D5yzqNZFN+3HXaQQmKc8amPPxRZCXhCGAB4Grg/DuWmXYN6giQOEM2
 9JqCb8VeJwMaNT8RNt0M3cZl/y5sYeCy8ViZMxYVvFVyEAhaDujPHuTmo
 3WJ/4PD6PkODICiNkTFP/loG8B9Hzn3YVmURE50tMiT5g3erEqZCCBH39
 yYqX9xn/IITJZKo/C7Sd2esOyuEj9cAhbkQHgvE5Usg6nafCBNqsMaehV
 isib/vh7DOQDfY1/wr6L0ufliEHFU/fGLGviJ9MfhwKNCn21z/7F5K/La
 IxNVf3Sw1PS1QYMPlPba6x524Oi75LfBu0zdC0g+tspzoF4DTk0bZPY22 g==;
X-CSE-ConnectionGUID: cak7K1ERRDKXSS0cpiZH3Q==
X-CSE-MsgGUID: LqXPJdVoQ26T5ipac5VJpw==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="22131724"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="22131724"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 05:04:38 -0700
X-CSE-ConnectionGUID: uzMQWPHSQjKPSRd5Dzr93g==
X-CSE-MsgGUID: R+0C2qO3TsubGTorOWMciw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="30341033"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 05:04:36 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 "Wachowski, Karol" <karol.wachowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH v2 02/12] accel/ivpu: Add sched_mode module param
Date: Mon, 13 May 2024 14:04:21 +0200
Message-ID: <20240513120431.3187212-3-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240513120431.3187212-1-jacek.lawrynowicz@linux.intel.com>
References: <20240513120431.3187212-1-jacek.lawrynowicz@linux.intel.com>
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
index 51d3f1a55d02..8d80052182f0 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -51,6 +51,10 @@ u8 ivpu_pll_max_ratio = U8_MAX;
 module_param_named(pll_max_ratio, ivpu_pll_max_ratio, byte, 0644);
 MODULE_PARM_DESC(pll_max_ratio, "Maximum PLL ratio used to set NPU frequency");
 
+int ivpu_sched_mode;
+module_param_named(sched_mode, ivpu_sched_mode, int, 0444);
+MODULE_PARM_DESC(sched_mode, "Scheduler mode: 0 - Default scheduler, 1 - Force HW scheduler");
+
 bool ivpu_disable_mmu_cont_pages;
 module_param_named(disable_mmu_cont_pages, ivpu_disable_mmu_cont_pages, bool, 0644);
 MODULE_PARM_DESC(disable_mmu_cont_pages, "Disable MMU contiguous pages optimization");
diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
index bb4374d0eaec..71b87455e22b 100644
--- a/drivers/accel/ivpu/ivpu_drv.h
+++ b/drivers/accel/ivpu/ivpu_drv.h
@@ -158,6 +158,7 @@ struct ivpu_file_priv {
 extern int ivpu_dbg_mask;
 extern u8 ivpu_pll_min_ratio;
 extern u8 ivpu_pll_max_ratio;
+extern int ivpu_sched_mode;
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

