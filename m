Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A82A6DB8C
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 14:31:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4643C10E407;
	Mon, 24 Mar 2025 13:31:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EqelBRNy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A46310E401;
 Mon, 24 Mar 2025 13:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742823068; x=1774359068;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JQLpubuA/Xc4YFAb6kRQlIkOagPzvUMOtL3/QfRI6YU=;
 b=EqelBRNyXEXyL5KeUmITmsoM40O79PGtbIPkQ+4Z0Cw/Fd+FyUq0qYLD
 CNE4p2aCP/YuxEHzRXSN0keyycP12xECXpQ7IZOppNO3BfTnrgwPsP8oi
 mFHWszMhqbHFpFYA62w4HYTgbltun89AU0ZoJzJtFsoUtWA4KvXttPIdo
 Uw6JKyLkpSNDZ/lchQIFCD5dBNxeUriyidsgfLDASQNdPaAH46Zu1ZEL+
 +pHZFD3szYpEHpCvOVf4itnvqWFxKy3QV6KZl1fUJoOOxXz9RG79n6sPx
 lLGUYpS2Ysw3AMEimguw71Khshbo56uD6XrVvk8ifAtQWuhScxB6s5yPk A==;
X-CSE-ConnectionGUID: lqVj20yjTkaZqBLlZTM2yw==
X-CSE-MsgGUID: v27H2rkeQAuxeMxDLR8CwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="44134028"
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="44134028"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 06:31:08 -0700
X-CSE-ConnectionGUID: mUM/HjmjTQyXFsvBs7ksZA==
X-CSE-MsgGUID: +451tkBFTXyAKJ3KlTXLCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="124209282"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.252])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 06:31:03 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Arshad Mehmood <arshad.mehmood@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v4 07/15] drm/i915/gt: Manage CCS engine creation within UABI
 exposure
Date: Mon, 24 Mar 2025 14:29:43 +0100
Message-ID: <20250324132952.1075209-8-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250324132952.1075209-1-andi.shyti@linux.intel.com>
References: <20250324132952.1075209-1-andi.shyti@linux.intel.com>
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
 drivers/gpu/drm/i915/gt/intel_engine_user.c | 17 ++++++++++++---
 2 files changed, 14 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index b721bbd23356..d2e2461e09d1 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -875,29 +875,6 @@ static intel_engine_mask_t init_engine_mask(struct intel_gt *gt)
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
index cd7662b1ad59..8e5284af8335 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
@@ -246,6 +246,20 @@ void intel_engines_driver_register(struct drm_i915_private *i915)
 
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
+		if (IS_DG2(i915) &&
+		    uabi_class == I915_ENGINE_CLASS_COMPUTE &&
+		    engine->uabi_instance)
+			goto clear_node_continue;
+
 		i915->engine_uabi_class_count[uabi_class]++;
 
 		rb_link_node(&engine->uabi_node, prev, p);
@@ -255,9 +269,6 @@ void intel_engines_driver_register(struct drm_i915_private *i915)
 						    engine->uabi_class,
 						    engine->uabi_instance) != engine);
 
-		/* Fix up the mapping to match default execbuf::user_map[] */
-		add_legacy_ring(&ring, engine);
-
 		prev = &engine->uabi_node;
 		p = &prev->rb_right;
 
-- 
2.47.2

