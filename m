Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEBA6CD31A
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 09:25:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9C3310E4F5;
	Wed, 29 Mar 2023 07:25:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0616110EA34;
 Wed, 29 Mar 2023 07:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680074724; x=1711610724;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=LsmUDbnIlE4apXp83QZEhT9gpY1ZA5IO+nuheEoXvek=;
 b=EojJLeyWlOH5aQWo3xNt5llgFcWsaLSh+kNuXrhYnW35AscquY1VEwO+
 zGBwmRblkqarGZtN/vMyzNImw7YdvTyqu1F2jZCSiqj7ELpMy/ON6SA6t
 pvuapY7y7jPdziIe7/laGR4BsUVKOSdTh3sXulAkUQHzjolvGLb7yNkgd
 L+gMzUL4ablmWkypGQZlDkCVfxsoV5dgrbeOI9r/wUDpDQ5ZyJdYvrpd2
 TsadN2v5b3GdFL0oeNqH6+Tk500gsdNlzh6eD3lUPYtvDC9R1+rVwmas0
 S52zWGkei+murEZuPgi4tmD/teIMwwL/V/wtyCWHkf5Oqm999Audyl5sX w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="368569839"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; d="scan'208";a="368569839"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2023 00:25:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="827773197"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; d="scan'208";a="827773197"
Received: from lab-ah.igk.intel.com ([10.102.138.202])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2023 00:24:59 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Wed, 29 Mar 2023 09:24:19 +0200
Subject: [PATCH v6 8/8] drm/i915/gt: Hold a wakeref for the active VM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230224-track_gt-v6-8-0dc8601fd02f@intel.com>
References: <20230224-track_gt-v6-0-0dc8601fd02f@intel.com>
In-Reply-To: <20230224-track_gt-v6-0-0dc8601fd02f@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.11.1
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, netdev@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Eric Dumazet <edumazet@google.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Dmitry Vyukov <dvyukov@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris@chris-wilson.co.uk>

There may be a disconnect between the GT used by the engine and the GT
used for the VM, requiring us to hold a wakeref on both while the GPU is
active with this request.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_context.h       | 15 +++++++++++----
 drivers/gpu/drm/i915/gt/intel_context_types.h |  2 ++
 drivers/gpu/drm/i915/gt/intel_engine_pm.c     |  4 ++++
 3 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
index 0a8d553da3f439..582faa21181e58 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.h
+++ b/drivers/gpu/drm/i915/gt/intel_context.h
@@ -14,6 +14,7 @@
 #include "i915_drv.h"
 #include "intel_context_types.h"
 #include "intel_engine_types.h"
+#include "intel_gt_pm.h"
 #include "intel_ring_types.h"
 #include "intel_timeline_types.h"
 #include "i915_trace.h"
@@ -207,8 +208,11 @@ void intel_context_exit_engine(struct intel_context *ce);
 static inline void intel_context_enter(struct intel_context *ce)
 {
 	lockdep_assert_held(&ce->timeline->mutex);
-	if (!ce->active_count++)
-		ce->ops->enter(ce);
+	if (ce->active_count++)
+		return;
+
+	ce->ops->enter(ce);
+	ce->wakeref = intel_gt_pm_get(ce->vm->gt);
 }
 
 static inline void intel_context_mark_active(struct intel_context *ce)
@@ -222,8 +226,11 @@ static inline void intel_context_exit(struct intel_context *ce)
 {
 	lockdep_assert_held(&ce->timeline->mutex);
 	GEM_BUG_ON(!ce->active_count);
-	if (!--ce->active_count)
-		ce->ops->exit(ce);
+	if (--ce->active_count)
+		return;
+
+	intel_gt_pm_put_async(ce->vm->gt, ce->wakeref);
+	ce->ops->exit(ce);
 }
 
 static inline struct intel_context *intel_context_get(struct intel_context *ce)
diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
index e36670f2e6260b..5dc39a9d7a501c 100644
--- a/drivers/gpu/drm/i915/gt/intel_context_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
@@ -17,6 +17,7 @@
 #include "i915_utils.h"
 #include "intel_engine_types.h"
 #include "intel_sseu.h"
+#include "intel_wakeref.h"
 
 #include "uc/intel_guc_fwif.h"
 
@@ -110,6 +111,7 @@ struct intel_context {
 	u32 ring_size;
 	struct intel_ring *ring;
 	struct intel_timeline *timeline;
+	intel_wakeref_t wakeref;
 
 	unsigned long flags;
 #define CONTEXT_BARRIER_BIT		0
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.c b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
index 7063dea2112943..c2d17c97bfe989 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
@@ -114,6 +114,10 @@ __queue_and_release_pm(struct i915_request *rq,
 
 	ENGINE_TRACE(engine, "parking\n");
 
+	GEM_BUG_ON(rq->context->active_count != 1);
+	__intel_gt_pm_get(engine->gt);
+	rq->context->wakeref = intel_wakeref_track(&engine->gt->wakeref);
+
 	/*
 	 * We have to serialise all potential retirement paths with our
 	 * submission, as we don't want to underflow either the

-- 
2.34.1
