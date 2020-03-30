Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77216198D15
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 09:38:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 906D26E581;
	Tue, 31 Mar 2020 07:38:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B30FF6E436;
 Mon, 30 Mar 2020 16:11:21 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id l36so7817003pjb.3;
 Mon, 30 Mar 2020 09:11:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:resent-from:resent-date:resent-message-id
 :resent-to:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AXapnbCniL8erkZ4wDrAlLNF82gBP6zmOZWurvP/doY=;
 b=ld0JUAiCBIYdj0KX6oQXChKV0twBN7XWDIA4GXTvfp5Zf0ZMwbrBS2z48YKhe9/7Oz
 XA7TNu44Jw9WZ+7ok2oSauTkMoPfA5Vqbic0wWAGAHDW6bgah3vcXkOflChqBHDcWh+U
 CTDM4cVDhYSq1ne7/Pq0iuxjHbb5rdxULGVgEUsvZH8emScFD0FDtgaB/f5vr50Ut0zv
 yKkz32Jft/K3MMVCa8KBFTAn4MyF7xWBm+maDVZNu8sQfU/LtFHLcezIJ2XNh+99xwkE
 PXehmMZwvfZiogXTfsoCLK4CH2Jloab5eH3iETtO1Stz9Dlr7hxkV/gp7vunClWIyytN
 i5BQ==
X-Gm-Message-State: AGi0PuZq3NEfvcK7i78YZZ2PRcttBkn7t3EhSpWnGYRPpuTxkigCSaaF
 JJWhOod99jOPVDWHQSQ6oe8=
X-Google-Smtp-Source: APiQypK22m+W9m5mumyurOa56mRhgUALX6U0OUhb1V+UggfyIAZ6+kmFJ4q8z8LCJad9VG04C8RF8w==
X-Received: by 2002:a17:90a:fa86:: with SMTP id cu6mr40569pjb.93.1585584681145; 
 Mon, 30 Mar 2020 09:11:21 -0700 (PDT)
Received: from sultan-box.localdomain (static-198-54-129-52.cust.tzulo.com.
 [198.54.129.52])
 by smtp.gmail.com with ESMTPSA id e7sm3184352pfm.3.2020.03.30.09.11.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Mar 2020 09:11:20 -0700 (PDT)
Resent-From: Sultan Alsawaf <sultan@kerneltoast.com>
Resent-Date: Mon, 30 Mar 2020 09:11:18 -0700
Resent-Message-ID: <20200330161118.GB3400@sultan-box.localdomain>
Resent-To: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Received: from sultan-box.localdomain (static-198-54-129-52.cust.tzulo.com.
 [198.54.129.52])
 by smtp.gmail.com with ESMTPSA id y193sm8512447pgd.87.2020.03.29.20.31.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Mar 2020 20:31:09 -0700 (PDT)
From: Sultan Alsawaf <sultan@kerneltoast.com>
X-Google-Original-From: Sultan Alsawaf
To: stable@vger.kernel.org
Subject: [PATCH 2/2] drm/i915/gt: Schedule request retirement when timeline
 idles
Date: Sun, 29 Mar 2020 20:30:57 -0700
Message-Id: <20200330033057.2629052-3-sultan@kerneltoast.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200330033057.2629052-1-sultan@kerneltoast.com>
References: <20200330033057.2629052-1-sultan@kerneltoast.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 31 Mar 2020 07:37:59 +0000
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
Cc: Sultan Alsawaf <sultan@kerneltoast.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris@chris-wilson.co.uk>

commit 311770173fac27845a3a83e2c16100a54d308f72 upstream.

The major drawback of commit 7e34f4e4aad3 ("drm/i915/gen8+: Add RC6 CTX
corruption WA") is that it disables RC6 while Skylake (and friends) is
active, and we do not consider the GPU idle until all outstanding
requests have been retired and the engine switched over to the kernel
context. If userspace is idle, this task falls onto our background idle
worker, which only runs roughly once a second, meaning that userspace has
to have been idle for a couple of seconds before we enable RC6 again.
Naturally, this causes us to consume considerably more energy than
before as powersaving is effectively disabled while a display server
(here's looking at you Xorg) is running.

As execlists will get a completion event as each context is completed,
we can use this interrupt to queue a retire worker bound to this engine
to cleanup idle timelines. We will then immediately notice the idle
engine (without userspace intervention or the aid of the background
retire worker) and start parking the GPU. Thus during light workloads,
we will do much more work to idle the GPU faster...  Hopefully with
commensurate power saving!

v2: Watch context completions and only look at those local to the engine
when retiring to reduce the amount of excess work we perform.

Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=112315
References: 7e34f4e4aad3 ("drm/i915/gen8+: Add RC6 CTX corruption WA")
References: 2248a28384fe ("drm/i915/gen8+: Add RC6 CTX corruption WA")
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20191125105858.1718307-3-chris@chris-wilson.co.uk
(cherry picked from commit 4f88f8747fa43c97c3b3712d8d87295ea757cc51)
Signed-off-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: <stable@vger.kernel.org> # 5.4.x
Signed-off-by: Sultan Alsawaf <sultan@kerneltoast.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  2 +
 drivers/gpu/drm/i915/gt/intel_engine_types.h  |  8 ++
 drivers/gpu/drm/i915/gt/intel_lrc.c           |  8 ++
 drivers/gpu/drm/i915/gt/intel_timeline.c      |  1 +
 .../gpu/drm/i915/gt/intel_timeline_types.h    |  3 +
 drivers/gpu/drm/i915/i915_request.c           | 73 +++++++++++++++++++
 drivers/gpu/drm/i915/i915_request.h           |  4 +
 7 files changed, 99 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 4ce8626b140e..f732a2177cd0 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -600,6 +600,7 @@ static int intel_engine_setup_common(struct intel_engine_cs *engine)
 	intel_engine_init_hangcheck(engine);
 	intel_engine_init_cmd_parser(engine);
 	intel_engine_init__pm(engine);
+	intel_engine_init_retire(engine);
 
 	intel_engine_pool_init(&engine->pool);
 
@@ -807,6 +808,7 @@ void intel_engine_cleanup_common(struct intel_engine_cs *engine)
 
 	cleanup_status_page(engine);
 
+	intel_engine_fini_retire(engine);
 	intel_engine_pool_fini(&engine->pool);
 	intel_engine_fini_breadcrumbs(engine);
 	intel_engine_cleanup_cmd_parser(engine);
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
index c77c9518c58b..1eb7189f88e1 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
@@ -471,6 +471,14 @@ struct intel_engine_cs {
 
 	struct intel_engine_execlists execlists;
 
+	/*
+	 * Keep track of completed timelines on this engine for early
+	 * retirement with the goal of quickly enabling powersaving as
+	 * soon as the engine is idle.
+	 */
+	struct intel_timeline *retire;
+	struct work_struct retire_work;
+
 	/* status_notifier: list of callbacks for context-switch changes */
 	struct atomic_notifier_head context_status_notifier;
 
diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
index 66f6d1a897f2..a1538c8f7922 100644
--- a/drivers/gpu/drm/i915/gt/intel_lrc.c
+++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
@@ -606,6 +606,14 @@ __execlists_schedule_out(struct i915_request *rq,
 {
 	struct intel_context * const ce = rq->hw_context;
 
+	/*
+	 * If we have just completed this context, the engine may now be
+	 * idle and we want to re-enter powersaving.
+	 */
+	if (list_is_last(&rq->link, &ce->timeline->requests) &&
+	    i915_request_completed(rq))
+		intel_engine_add_retire(engine, ce->timeline);
+
 	intel_engine_context_out(engine);
 	execlists_context_status_change(rq, INTEL_CONTEXT_SCHEDULE_OUT);
 	intel_gt_pm_put(engine->gt);
diff --git a/drivers/gpu/drm/i915/gt/intel_timeline.c b/drivers/gpu/drm/i915/gt/intel_timeline.c
index 9cb01d9828f1..63515e3caaf2 100644
--- a/drivers/gpu/drm/i915/gt/intel_timeline.c
+++ b/drivers/gpu/drm/i915/gt/intel_timeline.c
@@ -282,6 +282,7 @@ void intel_timeline_fini(struct intel_timeline *timeline)
 {
 	GEM_BUG_ON(atomic_read(&timeline->pin_count));
 	GEM_BUG_ON(!list_empty(&timeline->requests));
+	GEM_BUG_ON(timeline->retire);
 
 	if (timeline->hwsp_cacheline)
 		cacheline_free(timeline->hwsp_cacheline);
diff --git a/drivers/gpu/drm/i915/gt/intel_timeline_types.h b/drivers/gpu/drm/i915/gt/intel_timeline_types.h
index 2b1baf2fcc8e..adf2d14ef647 100644
--- a/drivers/gpu/drm/i915/gt/intel_timeline_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_timeline_types.h
@@ -65,6 +65,9 @@ struct intel_timeline {
 	 */
 	struct i915_active_request last_request;
 
+	/** A chain of completed timelines ready for early retirement. */
+	struct intel_timeline *retire;
+
 	/**
 	 * We track the most recent seqno that we wait on in every context so
 	 * that we only have to emit a new await and dependency on a more
diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index 0d39038898d4..4d59cfca9eae 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -600,6 +600,79 @@ static void retire_requests(struct intel_timeline *tl)
 			break;
 }
 
+static void engine_retire(struct work_struct *work)
+{
+	struct intel_engine_cs *engine =
+		container_of(work, typeof(*engine), retire_work);
+	struct intel_timeline *tl = xchg(&engine->retire, NULL);
+
+	do {
+		struct intel_timeline *next = xchg(&tl->retire, NULL);
+
+		/*
+		 * Our goal here is to retire _idle_ timelines as soon as
+		 * possible (as they are idle, we do not expect userspace
+		 * to be cleaning up anytime soon).
+		 *
+		 * If the timeline is currently locked, either it is being
+		 * retired elsewhere or about to be!
+		 */
+		if (mutex_trylock(&tl->mutex)) {
+			retire_requests(tl);
+			mutex_unlock(&tl->mutex);
+		}
+		intel_timeline_put(tl);
+
+		GEM_BUG_ON(!next);
+		tl = ptr_mask_bits(next, 1);
+	} while (tl);
+}
+
+static bool add_retire(struct intel_engine_cs *engine,
+		       struct intel_timeline *tl)
+{
+	struct intel_timeline *first;
+
+	/*
+	 * We open-code a llist here to include the additional tag [BIT(0)]
+	 * so that we know when the timeline is already on a
+	 * retirement queue: either this engine or another.
+	 *
+	 * However, we rely on that a timeline can only be active on a single
+	 * engine at any one time and that add_retire() is called before the
+	 * engine releases the timeline and transferred to another to retire.
+	 */
+
+	if (READ_ONCE(tl->retire)) /* already queued */
+		return false;
+
+	intel_timeline_get(tl);
+	first = READ_ONCE(engine->retire);
+	do
+		tl->retire = ptr_pack_bits(first, 1, 1);
+	while (!try_cmpxchg(&engine->retire, &first, tl));
+
+	return !first;
+}
+
+void intel_engine_add_retire(struct intel_engine_cs *engine,
+			     struct intel_timeline *tl)
+{
+	if (add_retire(engine, tl))
+		schedule_work(&engine->retire_work);
+}
+
+void intel_engine_init_retire(struct intel_engine_cs *engine)
+{
+	INIT_WORK(&engine->retire_work, engine_retire);
+}
+
+void intel_engine_fini_retire(struct intel_engine_cs *engine)
+{
+	flush_work(&engine->retire_work);
+	GEM_BUG_ON(engine->retire);
+}
+
 static noinline struct i915_request *
 request_alloc_slow(struct intel_timeline *tl, gfp_t gfp)
 {
diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i915_request.h
index 3a3e7bbf19ff..40caa2f3f4a4 100644
--- a/drivers/gpu/drm/i915/i915_request.h
+++ b/drivers/gpu/drm/i915/i915_request.h
@@ -445,5 +445,9 @@ static inline bool i915_request_has_nopreempt(const struct i915_request *rq)
 }
 
 bool i915_retire_requests(struct drm_i915_private *i915);
+void intel_engine_init_retire(struct intel_engine_cs *engine);
+void intel_engine_add_retire(struct intel_engine_cs *engine,
+			     struct intel_timeline *tl);
+void intel_engine_fini_retire(struct intel_engine_cs *engine);
 
 #endif /* I915_REQUEST_H */
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
