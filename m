Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 052F39559B8
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2024 23:01:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7319110E0EF;
	Sat, 17 Aug 2024 21:01:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fvkf4Aa4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1BE510E0EE;
 Sat, 17 Aug 2024 21:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723928471; x=1755464471;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hRqcWxnm7QAY+HdTQwKERnrJLX4UP1nySHb1xf6tim4=;
 b=Fvkf4Aa4Sf6HFHVfEKw5qKDOCK4yIM90AfyE1CiqVUoYLwIHJqkDpF6n
 bvs27E0X7kdTiisG+6frC8UvjVdgYVy8dMjtPZMd9fCV5bmcE+h8GD1Vj
 ABYesZTfWFxr8JAoKO6PzWd0Ujlv0OnnaX9VbA9qyB0lcXl/QZ8Io8FIK
 /vFyj3Q0FlhG4RjiiQYtPiW1yvZmiS2STAxQf88vX2cQZE4D9u52rPSek
 k7FqQukP7fIe6bTflx/BJAVzT36YSwv9jbzMPCQS+T9SOZUr7u2AX26Mx
 Q/Z2MXka8KUb5o+XTh+ZDh0lHWNGyn4ICS2kESQldMS7KT0g4enNKgKqr g==;
X-CSE-ConnectionGUID: Wr6jVRlTSJiogQJ/efdHMQ==
X-CSE-MsgGUID: o4Qv23Z9SFWEH6JoBIFqcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11167"; a="44725434"
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; d="scan'208";a="44725434"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2024 14:01:11 -0700
X-CSE-ConnectionGUID: pnVWmYnRQX23g9DOlMyoZQ==
X-CSE-MsgGUID: 9OYMuBRaSxCkyGAYLaC1qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; d="scan'208";a="59635998"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.11])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2024 14:01:08 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [RFC PATCH v2 04/11] drm/i915/gt: Manage CCS engine creation within
 UABI exposure
Date: Sat, 17 Aug 2024 23:00:19 +0200
Message-ID: <20240817210026.310645-5-andi.shyti@linux.intel.com>
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

In commit ea315f98e5d6 ("drm/i915/gt: Do not generate the command
streamer for all the CCS"), we restricted the creation of
physical CCS engines to only one stream. This allowed the user to
submit a single compute workload, with all CCS slices sharing the
workload from that stream.

This patch removes that limitation but still exposes only one
stream to the user. The physical memory for each engine remains
allocated but unused, however the user will only see one engine
exposed.

Do this by adding only one engine to the UABI list, ensuring that
only one engine is visible to the user.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c   | 23 ---------------------
 drivers/gpu/drm/i915/gt/intel_engine_user.c | 20 +++++++++++++++---
 2 files changed, 17 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 4d30a86016f2..def255ee0b96 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -876,29 +876,6 @@ static intel_engine_mask_t init_engine_mask(struct intel_gt *gt)
 		info->engine_mask &= ~BIT(GSC0);
 	}
 
-	/*
-	 * Do not create the command streamer for CCS slices beyond the first.
-	 * All the workload submitted to the first engine will be shared among
-	 * all the slices.
-	 *
-	 * Once the user will be allowed to customize the CCS mode, then this
-	 * check needs to be removed.
-	 */
-	if (IS_DG2(gt->i915)) {
-		u8 first_ccs = __ffs(CCS_MASK(gt));
-
-		/*
-		 * Store the number of active cslices before
-		 * changing the CCS engine configuration
-		 */
-		gt->ccs.cslices = CCS_MASK(gt);
-
-		/* Mask off all the CCS engine */
-		info->engine_mask &= ~GENMASK(CCS3, CCS0);
-		/* Put back in the first CCS engine */
-		info->engine_mask |= BIT(_CCS(first_ccs));
-	}
-
 	return info->engine_mask;
 }
 
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/drm/i915/gt/intel_engine_user.c
index 11cc06c0c785..c5ccb677ed15 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
@@ -207,6 +207,7 @@ void intel_engines_driver_register(struct drm_i915_private *i915)
 	struct legacy_ring ring = {};
 	struct list_head *it, *next;
 	struct rb_node **p, *prev;
+	u8 uabi_ccs_instance = 0;
 	LIST_HEAD(engines);
 
 	sort_engines(i915, &engines);
@@ -246,6 +247,22 @@ void intel_engines_driver_register(struct drm_i915_private *i915)
 
 		GEM_BUG_ON(uabi_class >=
 			   ARRAY_SIZE(i915->engine_uabi_class_count));
+
+		/* Fix up the mapping to match default execbuf::user_map[] */
+		add_legacy_ring(&ring, engine);
+
+		/*
+		 * Do not create the command streamer for CCS slices beyond the
+		 * first. All the workload submitted to the first engine will be
+		 * shared among all the slices.
+		 */
+		if (IS_DG2(i915) && uabi_class == I915_ENGINE_CLASS_COMPUTE) {
+			uabi_ccs_instance++;
+
+			if (uabi_ccs_instance > 1)
+				continue;
+		}
+
 		i915->engine_uabi_class_count[uabi_class]++;
 
 		rb_link_node(&engine->uabi_node, prev, p);
@@ -255,9 +272,6 @@ void intel_engines_driver_register(struct drm_i915_private *i915)
 						    engine->uabi_class,
 						    engine->uabi_instance) != engine);
 
-		/* Fix up the mapping to match default execbuf::user_map[] */
-		add_legacy_ring(&ring, engine);
-
 		prev = &engine->uabi_node;
 		p = &prev->rb_right;
 	}
-- 
2.45.2

