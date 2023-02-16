Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 487FD698935
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 01:23:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 867C610E00D;
	Thu, 16 Feb 2023 00:23:47 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FFB810E004;
 Thu, 16 Feb 2023 00:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676507026; x=1708043026;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hcqphykPgmz5B64oP0cvmOuWT6Hc5on6T8eg3FKcsro=;
 b=ZgJWgsEm8hcjCDKB1SBYbrm/s75FC9eTA5MsNDTJW+0GfreL308+tULt
 aJ+bWbrU/JzvF+2HWPZ3lyEMUhm6u7QQ0Hny7h4ABBhlTO+zoH7sHe74B
 7dUguzulGraY6F+UsGDN3Qg3gAhNeXP874gP7AGXf1oKMBc5qU2tnwd8R
 JosgIFfmfdTleG75W318pc8NNPVF7cWE/7M/yO4t7mGZKmVzVnRxYt+yx
 mtB0YZ2WCYmZBoreW5l5uvsLmFBpF2qijF7cqgdinc3JkA74LJeoZAp3s
 eQz1IYYjGxVsgMo7cm1rcEetXCXQn+SQbcBp148CvuXTBMuERv8/4U1h9 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="311945698"
X-IronPort-AV: E=Sophos;i="5.97,301,1669104000"; d="scan'208";a="311945698"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2023 16:23:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="843928659"
X-IronPort-AV: E=Sophos;i="5.97,301,1669104000"; d="scan'208";a="843928659"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga005.jf.intel.com with ESMTP; 15 Feb 2023 16:23:32 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v2 1/2] drm/i915: Don't use stolen memory for ring buffers
 with LLC
Date: Wed, 15 Feb 2023 16:22:47 -0800
Message-Id: <20230216002248.1851966-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230216002248.1851966-1-John.C.Harrison@Intel.com>
References: <20230216002248.1851966-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 DRI-Devel@Lists.FreeDesktop.Org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 stable@vger.kernel.org, John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Direction from hardware is that stolen memory should never be used for
ring buffer allocations on platforms with LLC. There are too many
caching pitfalls due to the way stolen memory accesses are routed. So
it is safest to just not use it.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Fixes: c58b735fc762 ("drm/i915: Allocate rings from stolen")
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v4.9+
---
 drivers/gpu/drm/i915/gt/intel_ring.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_ring.c b/drivers/gpu/drm/i915/gt/intel_ring.c
index 15ec64d881c44..fb1d2595392ed 100644
--- a/drivers/gpu/drm/i915/gt/intel_ring.c
+++ b/drivers/gpu/drm/i915/gt/intel_ring.c
@@ -116,7 +116,7 @@ static struct i915_vma *create_ring_vma(struct i915_ggtt *ggtt, int size)
 
 	obj = i915_gem_object_create_lmem(i915, size, I915_BO_ALLOC_VOLATILE |
 					  I915_BO_ALLOC_PM_VOLATILE);
-	if (IS_ERR(obj) && i915_ggtt_has_aperture(ggtt))
+	if (IS_ERR(obj) && i915_ggtt_has_aperture(ggtt) && !HAS_LLC(i915))
 		obj = i915_gem_object_create_stolen(i915, size);
 	if (IS_ERR(obj))
 		obj = i915_gem_object_create_internal(i915, size);
-- 
2.39.1

