Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 204CB9559C4
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2024 23:01:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8726710E10E;
	Sat, 17 Aug 2024 21:01:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V4TEZEue";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 367F310E10E;
 Sat, 17 Aug 2024 21:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723928510; x=1755464510;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xuhkZb/tooZgvmrO8f7ADL7PtlhiHuuE4Vc74jlF8/Y=;
 b=V4TEZEue+vuS7047sgwexPLPL676nkCZopaYGqnuixbi4BlQ+BixG9cO
 BV/HbpJV9yT/G5zwNlVYoKhk6/3yb4EzYwNBtlDOPCGBMGnkOhxzCLhD9
 XKYrqN9ulLGMnk4EVn+0HBpmONOoBGZfE3LLkOXz1DjWyhFz5ZBJXcRJx
 RcCd/HxqHDxUMoqcdWuVtM7QTQau0+q3tPExUQvmfdCcwjbdSNFj7VjqM
 09qRzv0S/0ygnxYSgg9R22+fzDIOMTvyFtY9WH+j6wQuJgNtqVt+zhjoo
 xM5FuF5FMezCD1qcTtDiAUzuc3Hrl8A3C//5Rfetw8KxNz/Q1O13Dcz9W g==;
X-CSE-ConnectionGUID: +6f343q1T7qrAao5OyXJtQ==
X-CSE-MsgGUID: 1M/gBZ4RSze+e6Q7uRHx6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11167"; a="32775451"
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; d="scan'208";a="32775451"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2024 14:01:50 -0700
X-CSE-ConnectionGUID: U//LYYSvRo+pv+muXs7zcA==
X-CSE-MsgGUID: ELfCJzSRT/GNKAEV0D6O5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; d="scan'208";a="64382590"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.11])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2024 14:01:48 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [RFC PATCH v2 10/11] drm/i915/gt: Implement creation and removal
 routines for CCS engines
Date: Sat, 17 Aug 2024 23:00:25 +0200
Message-ID: <20240817210026.310645-11-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240817210026.310645-1-andi.shyti@linux.intel.com>
References: <20240817210026.310645-1-andi.shyti@linux.intel.com>
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

In preparation for upcoming patches, we need routines to
dynamically create and destroy CCS engines based on the CCS mode
that the user wants to set.

The process begins by calculating the engine mask for the engines
that need to be added or removed. We then update the UABI list of
exposed engines and create or destroy the corresponding sysfs
interfaces accordingly.

These functions are not yet in use, so no functional changes are
intended at this stage.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c | 80 +++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
index 01ce719cf475..b1c3c9d9bb4f 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
@@ -8,6 +8,7 @@
 #include "intel_gt_print.h"
 #include "intel_gt_regs.h"
 #include "intel_gt_sysfs.h"
+#include "sysfs_engines.h"
 
 static void update_ccs_mask(struct intel_gt *gt, u32 ccs_mode)
 {
@@ -113,6 +114,85 @@ void intel_gt_ccs_mode_init(struct intel_gt *gt)
 	update_ccs_mask(gt, 1);
 }
 
+static void add_uabi_ccs_engines(struct intel_gt *gt, u32 ccs_mode)
+{
+	struct drm_i915_private *i915 = gt->i915;
+	intel_engine_mask_t new_ccs_mask, tmp;
+	struct intel_engine_cs *engine;
+	struct rb_node **p, *prev;
+
+	/* Store the current ccs mask */
+	new_ccs_mask = gt->ccs.ccs_mask;
+	update_ccs_mask(gt, ccs_mode);
+
+	/*
+	 * Store only the mask of the CCS engines that need to be added by
+	 * removing from the new mask the engines that are already active
+	 */
+	new_ccs_mask = gt->ccs.ccs_mask & ~new_ccs_mask;
+	new_ccs_mask <<= CCS0;
+
+	/*
+	 * UABI are stored only on the right branch of the rb tree, making it
+	 * de facto a double linked list. Get to the bottom of the list and
+	 * insert there the new engines.
+	 */
+	prev = NULL;
+	p = &i915->uabi_engines.rb_node;
+	for_each_uabi_engine(engine, i915) {
+		prev = &engine->uabi_node;
+		p = &prev->rb_right;
+	}
+
+	for_each_engine_masked(engine, gt, new_ccs_mask, tmp) {
+		int err;
+
+		i915->engine_uabi_class_count[I915_ENGINE_CLASS_COMPUTE]++;
+
+		rb_link_node(&engine->uabi_node, prev, p);
+		rb_insert_color(&engine->uabi_node, &i915->uabi_engines);
+
+		rb_link_node(&engine->uabi_node, prev, p);
+		rb_insert_color(&engine->uabi_node, &i915->uabi_engines);
+
+		prev = &engine->uabi_node;
+		p = &prev->rb_right;
+
+		err = intel_engine_add_single_sysfs(engine);
+		if (err)
+			gt_warn(gt,
+				"Unable to create sysfs entries for %s engine",
+				engine->name);
+	}
+}
+
+static void remove_uabi_ccs_engines(struct intel_gt *gt, u8 ccs_mode)
+{
+	struct drm_i915_private *i915 = gt->i915;
+	intel_engine_mask_t new_ccs_mask, tmp;
+	struct intel_engine_cs *engine;
+
+	/* Store the current ccs mask */
+	new_ccs_mask = gt->ccs.ccs_mask;
+	update_ccs_mask(gt, ccs_mode);
+
+	/*
+	 * Store only the mask of the CCS engines that need to be removed by
+	 * unmasking them from the new mask the engines that are already active
+	 */
+	new_ccs_mask = new_ccs_mask & ~gt->ccs.ccs_mask;
+	new_ccs_mask <<= CCS0;
+
+	for_each_engine_masked(engine, gt, new_ccs_mask, tmp) {
+		i915->engine_uabi_class_count[I915_ENGINE_CLASS_COMPUTE]--;
+
+		rb_erase(&engine->uabi_node, &i915->uabi_engines);
+		/* Remove sysfs entries */
+		kobject_put(engine->kobj_defaults);
+		kobject_put(engine->kobj);
+	}
+}
+
 static ssize_t num_cslices_show(struct device *dev,
 				struct device_attribute *attr,
 				char *buff)
-- 
2.45.2

