Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDC586D7DA
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 00:29:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E309A10E6F7;
	Thu, 29 Feb 2024 23:29:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g4BuR+jn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E2BD10E6BF;
 Thu, 29 Feb 2024 23:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709249373; x=1740785373;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gU3OHmO6IF/EGUQHAuPHNM5rzqqQB5fMs1yZsPWWH1M=;
 b=g4BuR+jnLnUa4Scl+fWkNdeW/6g2LZCW7l+TIgAuDIS7gj6LoOVUB8rU
 Rvv50erVBYLQyfrt2sOOiV1G/1MPKpwvCFuOQq9W2fQsA64ZnBRy/wD+7
 N7oY2m5ng3bv0JragKODQfFQusYNzKYgBc+dbaLuss95MpP0l1MDOrxAN
 5rCh2rHlKSc8TEIvSulYw/EmB1uMNu2a9yuMwz43z3qBLmwEGG8cw7lK5
 ehF/AY32PXCvHIgV/iuGowFp1V4l6Ut8ID1rnou1C8jbp39L+jLz+NzFP
 Zx4mDWABIY/AHcKrZ4hkLxBusMopEUNS8j+vgR3z6JfgX6lVlw94r7FED g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="29193514"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="29193514"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 15:29:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="38836138"
Received: from syhu-mobl2.ccr.corp.intel.com (HELO intel.com) ([10.94.248.193])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 15:29:26 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, stable@vger.kernel.org,
 Andi Shyti <andi.shyti@linux.intel.com>, Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v3 4/4] drm/i915/gt: Enable only one CCS for compute workload
Date: Fri,  1 Mar 2024 00:28:59 +0100
Message-ID: <20240229232859.70058-5-andi.shyti@linux.intel.com>
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

Enable only one CCS engine by default with all the compute sices
allocated to it.

While generating the list of UABI engines to be exposed to the
user, exclude any additional CCS engines beyond the first
instance.

This change can be tested with igt i915_query.

Fixes: d2eae8e98d59 ("drm/i915/dg2: Drop force_probe requirement")
Requires: 4e4f77d74878 ("drm/i915/gt: Refactor uabi engine class/instance list creation")
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: <stable@vger.kernel.org> # v6.2+
---
 drivers/gpu/drm/i915/gt/intel_engine_user.c | 11 +++++++++++
 drivers/gpu/drm/i915/gt/intel_gt.c          | 11 +++++++++++
 drivers/gpu/drm/i915/gt/intel_gt_regs.h     |  2 ++
 3 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/drm/i915/gt/intel_engine_user.c
index ec5bcd1c1ec4..6d6ef11f55e5 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
@@ -208,6 +208,7 @@ void intel_engines_driver_register(struct drm_i915_private *i915)
 	struct list_head *it, *next;
 	struct rb_node **p, *prev;
 	LIST_HEAD(engines);
+	u16 uabi_ccs = 0;
 
 	sort_engines(i915, &engines);
 
@@ -256,6 +257,16 @@ void intel_engines_driver_register(struct drm_i915_private *i915)
 		      BIT(_CCS(engine->uabi_instance))))
 			continue;
 
+		/*
+		 * The load is balanced among all the available compute
+		 * slices. Expose only the first instance of the compute
+		 * engine.
+		 */
+		if (IS_DG2(i915) &&
+		    uabi_class == I915_ENGINE_CLASS_COMPUTE &&
+		    uabi_ccs++)
+			continue;
+
 		GEM_BUG_ON(uabi_class >=
 			   ARRAY_SIZE(i915->engine_uabi_class_count));
 		i915->engine_uabi_class_count[uabi_class]++;
diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index a425db5ed3a2..e19df4ef47f6 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -168,6 +168,14 @@ static void init_unused_rings(struct intel_gt *gt)
 	}
 }
 
+static void intel_gt_apply_ccs_mode(struct intel_gt *gt)
+{
+	if (!IS_DG2(gt->i915))
+		return;
+
+	intel_uncore_write(gt->uncore, XEHP_CCS_MODE, 0);
+}
+
 int intel_gt_init_hw(struct intel_gt *gt)
 {
 	struct drm_i915_private *i915 = gt->i915;
@@ -195,6 +203,9 @@ int intel_gt_init_hw(struct intel_gt *gt)
 
 	intel_gt_init_swizzling(gt);
 
+	/* Configure CCS mode */
+	intel_gt_apply_ccs_mode(gt);
+
 	/*
 	 * At least 830 can leave some of the unused rings
 	 * "active" (ie. head != tail) after resume which
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index cf709f6c05ae..c148113770ea 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -1605,6 +1605,8 @@
 #define   GEN12_VOLTAGE_MASK			REG_GENMASK(10, 0)
 #define   GEN12_CAGF_MASK			REG_GENMASK(19, 11)
 
+#define XEHP_CCS_MODE                          _MMIO(0x14804)
+
 #define GEN11_GT_INTR_DW(x)			_MMIO(0x190018 + ((x) * 4))
 #define   GEN11_CSME				(31)
 #define   GEN12_HECI_2				(30)
-- 
2.43.0

