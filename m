Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8244C5EEB8E
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 04:17:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B27310E9B5;
	Thu, 29 Sep 2022 02:17:27 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B058E10E9B2;
 Thu, 29 Sep 2022 02:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664417840; x=1695953840;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5UTb/TnjHD7y+QjIhw1Y0Cm6p2dYRgBpUzguIeUiCJ4=;
 b=dbcImG1aEykWvcguzZrIJhJbv+n3fmLgtE2wfeB7leoJG3LFQuSOgCDO
 KwGiSpRyEetnBQcTcL5mvpMUUFXqhiQuT8ILtSvnK+F87lqWuj7DxlbgX
 FTFv4uPVJcIQddUgYumQ58CJZVdUxohhbcoSP0xgPWJKdcV93wCGWsCyZ
 H5O4gw1SGluad5zd9tkdfY5NxpvTGjb3zi527aSPBQgXWniNTrcDJK0n3
 23z3RxikxblJGtJW9T/RES0rTK2n4LoSOoARHBFjayhi7bryLLC1lq3Xw
 BNXMAaT8EN8NW7zU/ZzC3PqPJbVCgTHspkN+wq2i8NHGrlhUDS7ss9wT1 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="281484118"
X-IronPort-AV: E=Sophos;i="5.93,353,1654585200"; d="scan'208";a="281484118"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2022 19:17:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="573275943"
X-IronPort-AV: E=Sophos;i="5.93,353,1654585200"; d="scan'208";a="573275943"
Received: from relo-linux-5.jf.intel.com ([10.165.21.142])
 by orsmga003.jf.intel.com with ESMTP; 28 Sep 2022 19:17:19 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v4 2/4] drm/i915: Fix compute pre-emption w/a to apply to
 compute engines
Date: Wed, 28 Sep 2022 19:18:11 -0700
Message-Id: <20220929021813.2172701-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220929021813.2172701-1-John.C.Harrison@Intel.com>
References: <20220929021813.2172701-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI-Devel@Lists.FreeDesktop.Org,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Stuart Summers <stuart.summers@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>,
 Akeem G Abodunrin <akeem.g.abodunrin@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Ramalingam C <ramalingam.c@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

An earlier patch added support for compute engines. However, it missed
enabling the anti-pre-emption w/a for the new engine class. So move
the 'compute capable' flag earlier and use it for the pre-emption w/a
test.

Fixes: c674c5b9342e ("drm/i915/xehp: CCS should use RCS setup functions")
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Jason Ekstrand <jason@jlekstrand.net>
Cc: "Michał Winiarski" <michal.winiarski@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Ramalingam C <ramalingam.c@intel.com>
Cc: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c | 24 +++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 8f16955f0821e..fcbccd8d244e9 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -486,6 +486,17 @@ static int intel_engine_setup(struct intel_gt *gt, enum intel_engine_id id,
 	engine->logical_mask = BIT(logical_instance);
 	__sprint_engine_name(engine);
 
+	if ((engine->class == COMPUTE_CLASS && !RCS_MASK(engine->gt) &&
+	     __ffs(CCS_MASK(engine->gt)) == engine->instance) ||
+	     engine->class == RENDER_CLASS)
+		engine->flags |= I915_ENGINE_FIRST_RENDER_COMPUTE;
+
+	/* features common between engines sharing EUs */
+	if (engine->class == RENDER_CLASS || engine->class == COMPUTE_CLASS) {
+		engine->flags |= I915_ENGINE_HAS_RCS_REG_STATE;
+		engine->flags |= I915_ENGINE_HAS_EU_PRIORITY;
+	}
+
 	engine->props.heartbeat_interval_ms =
 		CONFIG_DRM_I915_HEARTBEAT_INTERVAL;
 	engine->props.max_busywait_duration_ns =
@@ -498,20 +509,9 @@ static int intel_engine_setup(struct intel_gt *gt, enum intel_engine_id id,
 		CONFIG_DRM_I915_TIMESLICE_DURATION;
 
 	/* Override to uninterruptible for OpenCL workloads. */
-	if (GRAPHICS_VER(i915) == 12 && engine->class == RENDER_CLASS)
+	if (GRAPHICS_VER(i915) == 12 && (engine->flags & I915_ENGINE_HAS_RCS_REG_STATE))
 		engine->props.preempt_timeout_ms = 0;
 
-	if ((engine->class == COMPUTE_CLASS && !RCS_MASK(engine->gt) &&
-	     __ffs(CCS_MASK(engine->gt)) == engine->instance) ||
-	     engine->class == RENDER_CLASS)
-		engine->flags |= I915_ENGINE_FIRST_RENDER_COMPUTE;
-
-	/* features common between engines sharing EUs */
-	if (engine->class == RENDER_CLASS || engine->class == COMPUTE_CLASS) {
-		engine->flags |= I915_ENGINE_HAS_RCS_REG_STATE;
-		engine->flags |= I915_ENGINE_HAS_EU_PRIORITY;
-	}
-
 	/* Cap properties according to any system limits */
 #define CLAMP_PROP(field) \
 	do { \
-- 
2.37.3

