Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C75D86D7D3
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 00:29:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD90010E6B9;
	Thu, 29 Feb 2024 23:29:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QemE0gVz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8819C10E6BF;
 Thu, 29 Feb 2024 23:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709249363; x=1740785363;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1/JxcshBh9SfSED7bBj6dJuMtZzfhEzcLUHv5yAdcGE=;
 b=QemE0gVzfvjancQ09LK7uU4EnljCp0ginYoXiIzb+1IvRRjgWdujePl4
 WKB0WRBVVOfnL8hOAgGHzV2fdAI2Thgk2buYvYcX+2/M9N3r8NBqphInc
 zHZgxjl++XGpLihDt5xhZjUH7KitHmKTP1DGmKQVO83Ow1Jcgbo+fVdt0
 uGyZq1sQ1PQw0K6jWO3p/Om2Uhdkkz99G2ewXMFyuCx8aCXqaYcemhTAk
 sjpVK/uq/CpG3yG/NYYfxzwzTTYEfY3qo0lfBiBSVZ9JAcykyA1+a5SnH
 yXs3AdVabTrNN1A0zMhh+EVlx8ulCWo+f2xjDs3ZYnJJc7pe6zaEPyCUs Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="29193488"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="29193488"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 15:29:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="38836097"
Received: from syhu-mobl2.ccr.corp.intel.com (HELO intel.com) ([10.94.248.193])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 15:29:19 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, stable@vger.kernel.org,
 Andi Shyti <andi.shyti@linux.intel.com>, Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v3 3/4] drm/i915/gt: Disable HW load balancing for CCS
Date: Fri,  1 Mar 2024 00:28:58 +0100
Message-ID: <20240229232859.70058-4-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240229232859.70058-1-andi.shyti@linux.intel.com>
References: <20240229232859.70058-1-andi.shyti@linux.intel.com>
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

The hardware should not dynamically balance the load between CCS
engines. Wa_14019159160 recommends disabling it across all
platforms.

Fixes: d2eae8e98d59 ("drm/i915/dg2: Drop force_probe requirement")
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: <stable@vger.kernel.org> # v6.2+
---
 drivers/gpu/drm/i915/gt/intel_gt_regs.h     | 1 +
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index 50962cfd1353..cf709f6c05ae 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -1478,6 +1478,7 @@
 
 #define GEN12_RCU_MODE				_MMIO(0x14800)
 #define   GEN12_RCU_MODE_CCS_ENABLE		REG_BIT(0)
+#define   XEHP_RCU_MODE_FIXED_SLICE_CCS_MODE	REG_BIT(1)
 
 #define CHV_FUSE_GT				_MMIO(VLV_GUNIT_BASE + 0x2168)
 #define   CHV_FGT_DISABLE_SS0			(1 << 10)
diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index d67d44611c28..57c1f3d2589e 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -2945,6 +2945,12 @@ general_render_compute_wa_init(struct intel_engine_cs *engine, struct i915_wa_li
 
 		/* Wa_18028616096 */
 		wa_mcr_write_or(wal, LSC_CHICKEN_BIT_0_UDW, UGM_FRAGMENT_THRESHOLD_TO_3);
+
+		/*
+		 * Wa_14019159160: disable the CCS load balancing
+		 * indiscriminately for all the platforms
+		 */
+		wa_masked_en(wal, GEN12_RCU_MODE, XEHP_RCU_MODE_FIXED_SLICE_CCS_MODE);
 	}
 
 	if (IS_DG2_G11(i915)) {
-- 
2.43.0

