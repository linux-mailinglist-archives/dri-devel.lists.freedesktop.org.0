Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7245495CD42
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 15:09:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C655910E6F6;
	Fri, 23 Aug 2024 13:09:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NPSPWDcf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CB1010E750;
 Fri, 23 Aug 2024 13:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724418595; x=1755954595;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wlQYVvlGST7IWgVZYY2Zmmb9+8nJ7zBJOiW//Lhm2PU=;
 b=NPSPWDcfvej3b3L0nPgsaARy3TbqXHMzY9ZLYw0hyV2sl//WSllUAEQT
 K3nuXLdRrwdZeaig8eGQqezpSiDSAZyMk2H4Dqx8UfzHZA2sC1+IBPtab
 5np88YTVqrFpawhPlJQaGcg6dS9H0Vb7r3zpjsUkjDILt8F006dxNm1c5
 25gt85r9KNKrsWKlCyR/dCNjWzFrbptnJCKqUUaanwivujpDNHSR9RMaa
 4xHJXkQ/Dh6GVFUG/CdyOFcn4uz9PYyIDk4w1OAMPlHTZ7K6FarqLNJzp
 i7WqeapvqbCMMfFc6ymbkA5/GmJHJLFvJPfg3aCA9HQNiiPZUHGo9WsJQ w==;
X-CSE-ConnectionGUID: 5NxZlkuzSgmz5EdSDW9m7A==
X-CSE-MsgGUID: G7Y75oNORnG/4VfCu+0aKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22483312"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="22483312"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 06:09:55 -0700
X-CSE-ConnectionGUID: MKIYc14yTAa3rlIbZ5KyXA==
X-CSE-MsgGUID: p4YZhGaHQJCsyUZpP5L9fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="66614360"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.236])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 06:09:53 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH v3 07/15] drm/i915/gt: Manage CCS engine creation within UABI
 exposure
Date: Fri, 23 Aug 2024 15:08:47 +0200
Message-ID: <20240823130855.72436-8-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240823130855.72436-1-andi.shyti@linux.intel.com>
References: <20240823130855.72436-1-andi.shyti@linux.intel.com>
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
2.45.2

