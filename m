Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 295DD4C7442
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 18:43:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5708510E875;
	Mon, 28 Feb 2022 17:43:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CD3410E84A;
 Mon, 28 Feb 2022 17:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646070186; x=1677606186;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tjEtlx0Y06cBYRqhT2fn5Mygzd2rVxR9/rygM5Vcc7E=;
 b=kbdI84/YTAqtXXJrDFfpvkAfEuTrUW5yuAr1byy/0xuIPbgVzMc9xfOu
 HWYjwrtG0g15nSeoepwCDFu1W/A1dQ79OUOeaWndzs6d3WMLyKwtmCZy8
 Q8ZZNdLWuxHc3g0ZW/yYsqqz/3T4zGBMJvO6fjfBd+PdjFmC3XYHspOOe
 CvUFD6V8IxMjkCv35anZRjGKLkfAjeCkyb4Mz0XoPMr0tmT7nHsDnJib5
 LGnoW/kvG5ZvjzjGMooTBWxKUnoNPEv9mrX/gF5fPdOUpQtT+lddZapDU
 rjs8FlamxPhXH3hF0DFNwQrkWf9VuZN9IPjWksompzDmxkrZVYajGrzqt g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="232913189"
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="232913189"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 09:43:05 -0800
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="575392838"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 09:43:05 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 07/13] drm/i915/xehp: Define context scheduling attributes
 in lrc descriptor
Date: Mon, 28 Feb 2022 09:42:39 -0800
Message-Id: <20220228174245.1569581-8-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220228174245.1569581-1-matthew.d.roper@intel.com>
References: <20220228174245.1569581-1-matthew.d.roper@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, dri-devel@lists.freedesktop.org,
 Prasad Nallani <prasad.nallani@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In Dual Context mode the EUs are shared between render and compute
command streamers. The hardware provides a field in the lrc descriptor
to indicate the prioritization of the thread dispatch associated to the
corresponding context.

The context priority is set to 'low' at creation time and relies on the
existing context priority to set it to low/normal/high.

Bspec: 46145, 46260
Original-author: Michel Thierry
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Signed-off-by: Prasad Nallani <prasad.nallani@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c       |  4 +++-
 drivers/gpu/drm/i915/gt/intel_engine_types.h    |  1 +
 .../drm/i915/gt/intel_execlists_submission.c    |  6 +++++-
 drivers/gpu/drm/i915/gt/intel_lrc.h             | 17 +++++++++++++++++
 4 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index b0982a9e4476..2136c56d3abc 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -435,8 +435,10 @@ static int intel_engine_setup(struct intel_gt *gt, enum intel_engine_id id,
 		engine->props.preempt_timeout_ms = 0;
 
 	/* features common between engines sharing EUs */
-	if (engine->class == RENDER_CLASS || engine->class == COMPUTE_CLASS)
+	if (engine->class == RENDER_CLASS || engine->class == COMPUTE_CLASS) {
 		engine->flags |= I915_ENGINE_HAS_RCS_REG_STATE;
+		engine->flags |= I915_ENGINE_HAS_EU_PRIORITY;
+	}
 
 	engine->defaults = engine->props; /* never to change again */
 
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
index 5fa5f21bbf2d..19ff8758e34d 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
@@ -525,6 +525,7 @@ struct intel_engine_cs {
 #define I915_ENGINE_REQUIRES_CMD_PARSER BIT(7)
 #define I915_ENGINE_WANT_FORCED_PREEMPTION BIT(8)
 #define I915_ENGINE_HAS_RCS_REG_STATE  BIT(9)
+#define I915_ENGINE_HAS_EU_PRIORITY    BIT(10)
 	unsigned int flags;
 
 	/*
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 47fca5ebfa76..c8407cc96c42 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -665,9 +665,13 @@ static inline void execlists_schedule_out(struct i915_request *rq)
 static u64 execlists_update_context(struct i915_request *rq)
 {
 	struct intel_context *ce = rq->context;
-	u64 desc = ce->lrc.desc;
+	u64 desc;
 	u32 tail, prev;
 
+	desc = ce->lrc.desc;
+	if (rq->engine->flags & I915_ENGINE_HAS_EU_PRIORITY)
+		desc |= lrc_desc_priority(rq_prio(rq));
+
 	/*
 	 * WaIdleLiteRestore:bdw,skl
 	 *
diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.h b/drivers/gpu/drm/i915/gt/intel_lrc.h
index 820f8f41fc1f..4f2ac9c6ba1d 100644
--- a/drivers/gpu/drm/i915/gt/intel_lrc.h
+++ b/drivers/gpu/drm/i915/gt/intel_lrc.h
@@ -6,6 +6,9 @@
 #ifndef __INTEL_LRC_H__
 #define __INTEL_LRC_H__
 
+#include "i915_priolist_types.h"
+
+#include <linux/bitfield.h>
 #include <linux/types.h>
 
 struct drm_i915_gem_object;
@@ -90,6 +93,10 @@ enum {
 #define   GEN8_CTX_L3LLC_COHERENT		(1 << 5)
 #define   GEN8_CTX_PRIVILEGE			(1 << 8)
 #define   GEN8_CTX_ADDRESSING_MODE_SHIFT	3
+#define   GEN12_CTX_PRIORITY_MASK		GENMASK(10, 9)
+#define   GEN12_CTX_PRIORITY_HIGH		FIELD_PREP(GEN12_CTX_PRIORITY_MASK, 2)
+#define   GEN12_CTX_PRIORITY_NORMAL		FIELD_PREP(GEN12_CTX_PRIORITY_MASK, 1)
+#define   GEN12_CTX_PRIORITY_LOW		FIELD_PREP(GEN12_CTX_PRIORITY_MASK, 0)
 #define   GEN8_CTX_ID_SHIFT			32
 #define   GEN8_CTX_ID_WIDTH			21
 #define   GEN11_SW_CTX_ID_SHIFT			37
@@ -103,4 +110,14 @@ enum {
 #define   XEHP_SW_COUNTER_SHIFT			58
 #define   XEHP_SW_COUNTER_WIDTH			6
 
+static inline u32 lrc_desc_priority(int prio)
+{
+	if (prio > I915_PRIORITY_NORMAL)
+		return GEN12_CTX_PRIORITY_HIGH;
+	else if (prio < I915_PRIORITY_NORMAL)
+		return GEN12_CTX_PRIORITY_LOW;
+	else
+		return GEN12_CTX_PRIORITY_NORMAL;
+}
+
 #endif /* __INTEL_LRC_H__ */
-- 
2.34.1

