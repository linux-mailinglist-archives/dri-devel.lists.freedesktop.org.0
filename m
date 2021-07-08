Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AC53C1667
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 17:49:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3082F6E904;
	Thu,  8 Jul 2021 15:48:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9D9C6E8FB
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 15:48:50 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id u66so2487439oif.13
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jul 2021 08:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o3iC5A5zOFioZj/A/XaNAoeZVjkOQfwMM2nso2UF0tM=;
 b=g0p5GOAp+j2giZitEIE1sKG+g+8fT/9OopyITITg0DEvaHLoeT0AmJPFwwLw53Zvje
 pr2HDj9kI2SQ8Q5b4Od7OATf+JrO2Dew1NVn9Rsz2ZWvkCVGS7eHsRJtYPKHC75txSrV
 iLAdtxsm1lzgeCdmL+duIXtZIGZabDvHBk9FDhC21mFOqiNM7UIAXPDBTgS0hkX4XIoO
 Sa+URwYM1b3GbV67/JiQ9fOlgL8Gc8Ww57zSIEOxnIfSE+PsUlLXwByCt3H0MJBNcwIB
 1JN+l39ixUDkqIv6EP2aCbPV/RPlj7T1azq1kM3CFsdlKjLqeLV2KLTe3WkxtIZQ84m8
 1A0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o3iC5A5zOFioZj/A/XaNAoeZVjkOQfwMM2nso2UF0tM=;
 b=movt5xFqHH/VRC5p+1zC/SzwPvzPDkyD/1EQrpzTDEZwj7V3RmTfYExzMNE/2sGIhe
 pdzrzIVxvslAwK+dVa0+Uunm0hThr5t7zNaAsdplK0lF7p9CFfFnsDdtBxEaUsa7GLkc
 RRSh8MVL3jt+abmlEx/iOsidWCBkHF8p5ggbfobb+j9u2QZwAUWS3rzpS2LS3vP62Icd
 ACi2v0sXsulozY12S9mjfM0Z74K1NyCB1rvRSnDiJVX7mdm1CiI9ECPJkaRC8VyE/ZsK
 DxdhpvfS07wlWLmrWUztAgO3V/yptB+UdUvG8QCGB5sfkwiHeIZk9QHAqFKXGBJeyEsM
 pvdg==
X-Gm-Message-State: AOAM530nA1OqxUo0m0omjUueirnxiEP3VQwRkVFOut5dukhNtqPxLt9Z
 piSdbtTCkF7cyUUKdcjqdgEojQ==
X-Google-Smtp-Source: ABdhPJw/vWB0qXj/kG2S239hwD9lMhVXkxth/kpDTazOxNsgua296VccckFJRJJyPI4qfXuOo40R6w==
X-Received: by 2002:aca:ac4a:: with SMTP id v71mr18430042oie.88.1625759329964; 
 Thu, 08 Jul 2021 08:48:49 -0700 (PDT)
Received: from omlet.lan ([68.203.99.148])
 by smtp.gmail.com with ESMTPSA id d20sm548356otq.62.2021.07.08.08.48.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 08:48:49 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 09/30] drm/i915/gem: Disallow bonding of virtual engines (v3)
Date: Thu,  8 Jul 2021 10:48:14 -0500
Message-Id: <20210708154835.528166-10-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708154835.528166-1-jason@jlekstrand.net>
References: <20210708154835.528166-1-jason@jlekstrand.net>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This adds a bunch of complexity which the media driver has never
actually used.  The media driver does technically bond a balanced engine
to another engine but the balanced engine only has one engine in the
sibling set.  This doesn't actually result in a virtual engine.

This functionality was originally added to handle cases where we may
have more than two video engines and media might want to load-balance
their bonded submits by, for instance, submitting to a balanced vcs0-1
as the primary and then vcs2-3 as the secondary.  However, no such
hardware has shipped thus far and, if we ever want to enable such
use-cases in the future, we'll use the up-and-coming parallel submit API
which targets GuC submission.

This makes I915_CONTEXT_ENGINES_EXT_BOND a total no-op.  We leave the
validation code in place in case we ever decide we want to do something
interesting with the bonding information.

v2 (Jason Ekstrand):
 - Don't delete quite as much code.

v3 (Tvrtko Ursulin):
 - Add some history to the commit message

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c   |  18 +-
 .../drm/i915/gt/intel_execlists_submission.c  |  69 ------
 .../drm/i915/gt/intel_execlists_submission.h  |   5 +-
 drivers/gpu/drm/i915/gt/selftest_execlists.c  | 229 ------------------
 4 files changed, 8 insertions(+), 313 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index e36e3b1ae14e4..5eca91ded3423 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -1552,6 +1552,12 @@ set_engines__bond(struct i915_user_extension __user *base, void *data)
 	}
 	virtual = set->engines->engines[idx]->engine;
 
+	if (intel_engine_is_virtual(virtual)) {
+		drm_dbg(&i915->drm,
+			"Bonding with virtual engines not allowed\n");
+		return -EINVAL;
+	}
+
 	err = check_user_mbz(&ext->flags);
 	if (err)
 		return err;
@@ -1592,18 +1598,6 @@ set_engines__bond(struct i915_user_extension __user *base, void *data)
 				n, ci.engine_class, ci.engine_instance);
 			return -EINVAL;
 		}
-
-		/*
-		 * A non-virtual engine has no siblings to choose between; and
-		 * a submit fence will always be directed to the one engine.
-		 */
-		if (intel_engine_is_virtual(virtual)) {
-			err = intel_virtual_engine_attach_bond(virtual,
-							       master,
-							       bond);
-			if (err)
-				return err;
-		}
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 7dd7afccb3adc..98b256352c23d 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -182,18 +182,6 @@ struct virtual_engine {
 		int prio;
 	} nodes[I915_NUM_ENGINES];
 
-	/*
-	 * Keep track of bonded pairs -- restrictions upon on our selection
-	 * of physical engines any particular request may be submitted to.
-	 * If we receive a submit-fence from a master engine, we will only
-	 * use one of sibling_mask physical engines.
-	 */
-	struct ve_bond {
-		const struct intel_engine_cs *master;
-		intel_engine_mask_t sibling_mask;
-	} *bonds;
-	unsigned int num_bonds;
-
 	/* And finally, which physical engines this virtual engine maps onto. */
 	unsigned int num_siblings;
 	struct intel_engine_cs *siblings[];
@@ -3413,7 +3401,6 @@ static void rcu_virtual_context_destroy(struct work_struct *wrk)
 		i915_sched_engine_put(ve->base.sched_engine);
 	intel_engine_free_request_pool(&ve->base);
 
-	kfree(ve->bonds);
 	kfree(ve);
 }
 
@@ -3668,33 +3655,13 @@ static void virtual_submit_request(struct i915_request *rq)
 	spin_unlock_irqrestore(&ve->base.sched_engine->lock, flags);
 }
 
-static struct ve_bond *
-virtual_find_bond(struct virtual_engine *ve,
-		  const struct intel_engine_cs *master)
-{
-	int i;
-
-	for (i = 0; i < ve->num_bonds; i++) {
-		if (ve->bonds[i].master == master)
-			return &ve->bonds[i];
-	}
-
-	return NULL;
-}
-
 static void
 virtual_bond_execute(struct i915_request *rq, struct dma_fence *signal)
 {
-	struct virtual_engine *ve = to_virtual_engine(rq->engine);
 	intel_engine_mask_t allowed, exec;
-	struct ve_bond *bond;
 
 	allowed = ~to_request(signal)->engine->mask;
 
-	bond = virtual_find_bond(ve, to_request(signal)->engine);
-	if (bond)
-		allowed &= bond->sibling_mask;
-
 	/* Restrict the bonded request to run on only the available engines */
 	exec = READ_ONCE(rq->execution_mask);
 	while (!try_cmpxchg(&rq->execution_mask, &exec, exec & allowed))
@@ -3850,42 +3817,6 @@ intel_execlists_create_virtual(struct intel_engine_cs **siblings,
 	return ERR_PTR(err);
 }
 
-int intel_virtual_engine_attach_bond(struct intel_engine_cs *engine,
-				     const struct intel_engine_cs *master,
-				     const struct intel_engine_cs *sibling)
-{
-	struct virtual_engine *ve = to_virtual_engine(engine);
-	struct ve_bond *bond;
-	int n;
-
-	/* Sanity check the sibling is part of the virtual engine */
-	for (n = 0; n < ve->num_siblings; n++)
-		if (sibling == ve->siblings[n])
-			break;
-	if (n == ve->num_siblings)
-		return -EINVAL;
-
-	bond = virtual_find_bond(ve, master);
-	if (bond) {
-		bond->sibling_mask |= sibling->mask;
-		return 0;
-	}
-
-	bond = krealloc(ve->bonds,
-			sizeof(*bond) * (ve->num_bonds + 1),
-			GFP_KERNEL);
-	if (!bond)
-		return -ENOMEM;
-
-	bond[ve->num_bonds].master = master;
-	bond[ve->num_bonds].sibling_mask = sibling->mask;
-
-	ve->bonds = bond;
-	ve->num_bonds++;
-
-	return 0;
-}
-
 void intel_execlists_show_requests(struct intel_engine_cs *engine,
 				   struct drm_printer *m,
 				   void (*show_request)(struct drm_printer *m,
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.h b/drivers/gpu/drm/i915/gt/intel_execlists_submission.h
index c0b23f69535ed..ad4f3e1a0fded 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.h
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.h
@@ -36,8 +36,7 @@ struct intel_context *
 intel_execlists_create_virtual(struct intel_engine_cs **siblings,
 			       unsigned int count);
 
-int intel_virtual_engine_attach_bond(struct intel_engine_cs *engine,
-				     const struct intel_engine_cs *master,
-				     const struct intel_engine_cs *sibling);
+bool
+intel_engine_in_execlists_submission_mode(const struct intel_engine_cs *engine);
 
 #endif /* __INTEL_EXECLISTS_SUBMISSION_H__ */
diff --git a/drivers/gpu/drm/i915/gt/selftest_execlists.c b/drivers/gpu/drm/i915/gt/selftest_execlists.c
index d790b8b946ed9..6abce18d0ef32 100644
--- a/drivers/gpu/drm/i915/gt/selftest_execlists.c
+++ b/drivers/gpu/drm/i915/gt/selftest_execlists.c
@@ -4328,234 +4328,6 @@ static int live_virtual_preserved(void *arg)
 	return 0;
 }
 
-static int bond_virtual_engine(struct intel_gt *gt,
-			       unsigned int class,
-			       struct intel_engine_cs **siblings,
-			       unsigned int nsibling,
-			       unsigned int flags)
-#define BOND_SCHEDULE BIT(0)
-{
-	struct intel_engine_cs *master;
-	struct i915_request *rq[16];
-	enum intel_engine_id id;
-	struct igt_spinner spin;
-	unsigned long n;
-	int err;
-
-	/*
-	 * A set of bonded requests is intended to be run concurrently
-	 * across a number of engines. We use one request per-engine
-	 * and a magic fence to schedule each of the bonded requests
-	 * at the same time. A consequence of our current scheduler is that
-	 * we only move requests to the HW ready queue when the request
-	 * becomes ready, that is when all of its prerequisite fences have
-	 * been signaled. As one of those fences is the master submit fence,
-	 * there is a delay on all secondary fences as the HW may be
-	 * currently busy. Equally, as all the requests are independent,
-	 * they may have other fences that delay individual request
-	 * submission to HW. Ergo, we do not guarantee that all requests are
-	 * immediately submitted to HW at the same time, just that if the
-	 * rules are abided by, they are ready at the same time as the
-	 * first is submitted. Userspace can embed semaphores in its batch
-	 * to ensure parallel execution of its phases as it requires.
-	 * Though naturally it gets requested that perhaps the scheduler should
-	 * take care of parallel execution, even across preemption events on
-	 * different HW. (The proper answer is of course "lalalala".)
-	 *
-	 * With the submit-fence, we have identified three possible phases
-	 * of synchronisation depending on the master fence: queued (not
-	 * ready), executing, and signaled. The first two are quite simple
-	 * and checked below. However, the signaled master fence handling is
-	 * contentious. Currently we do not distinguish between a signaled
-	 * fence and an expired fence, as once signaled it does not convey
-	 * any information about the previous execution. It may even be freed
-	 * and hence checking later it may not exist at all. Ergo we currently
-	 * do not apply the bonding constraint for an already signaled fence,
-	 * as our expectation is that it should not constrain the secondaries
-	 * and is outside of the scope of the bonded request API (i.e. all
-	 * userspace requests are meant to be running in parallel). As
-	 * it imposes no constraint, and is effectively a no-op, we do not
-	 * check below as normal execution flows are checked extensively above.
-	 *
-	 * XXX Is the degenerate handling of signaled submit fences the
-	 * expected behaviour for userpace?
-	 */
-
-	GEM_BUG_ON(nsibling >= ARRAY_SIZE(rq) - 1);
-
-	if (igt_spinner_init(&spin, gt))
-		return -ENOMEM;
-
-	err = 0;
-	rq[0] = ERR_PTR(-ENOMEM);
-	for_each_engine(master, gt, id) {
-		struct i915_sw_fence fence = {};
-		struct intel_context *ce;
-
-		if (master->class == class)
-			continue;
-
-		ce = intel_context_create(master);
-		if (IS_ERR(ce)) {
-			err = PTR_ERR(ce);
-			goto out;
-		}
-
-		memset_p((void *)rq, ERR_PTR(-EINVAL), ARRAY_SIZE(rq));
-
-		rq[0] = igt_spinner_create_request(&spin, ce, MI_NOOP);
-		intel_context_put(ce);
-		if (IS_ERR(rq[0])) {
-			err = PTR_ERR(rq[0]);
-			goto out;
-		}
-		i915_request_get(rq[0]);
-
-		if (flags & BOND_SCHEDULE) {
-			onstack_fence_init(&fence);
-			err = i915_sw_fence_await_sw_fence_gfp(&rq[0]->submit,
-							       &fence,
-							       GFP_KERNEL);
-		}
-
-		i915_request_add(rq[0]);
-		if (err < 0)
-			goto out;
-
-		if (!(flags & BOND_SCHEDULE) &&
-		    !igt_wait_for_spinner(&spin, rq[0])) {
-			err = -EIO;
-			goto out;
-		}
-
-		for (n = 0; n < nsibling; n++) {
-			struct intel_context *ve;
-
-			ve = intel_execlists_create_virtual(siblings, nsibling);
-			if (IS_ERR(ve)) {
-				err = PTR_ERR(ve);
-				onstack_fence_fini(&fence);
-				goto out;
-			}
-
-			err = intel_virtual_engine_attach_bond(ve->engine,
-							       master,
-							       siblings[n]);
-			if (err) {
-				intel_context_put(ve);
-				onstack_fence_fini(&fence);
-				goto out;
-			}
-
-			err = intel_context_pin(ve);
-			intel_context_put(ve);
-			if (err) {
-				onstack_fence_fini(&fence);
-				goto out;
-			}
-
-			rq[n + 1] = i915_request_create(ve);
-			intel_context_unpin(ve);
-			if (IS_ERR(rq[n + 1])) {
-				err = PTR_ERR(rq[n + 1]);
-				onstack_fence_fini(&fence);
-				goto out;
-			}
-			i915_request_get(rq[n + 1]);
-
-			err = i915_request_await_execution(rq[n + 1],
-							   &rq[0]->fence,
-							   ve->engine->bond_execute);
-			i915_request_add(rq[n + 1]);
-			if (err < 0) {
-				onstack_fence_fini(&fence);
-				goto out;
-			}
-		}
-		onstack_fence_fini(&fence);
-		intel_engine_flush_submission(master);
-		igt_spinner_end(&spin);
-
-		if (i915_request_wait(rq[0], 0, HZ / 10) < 0) {
-			pr_err("Master request did not execute (on %s)!\n",
-			       rq[0]->engine->name);
-			err = -EIO;
-			goto out;
-		}
-
-		for (n = 0; n < nsibling; n++) {
-			if (i915_request_wait(rq[n + 1], 0,
-					      MAX_SCHEDULE_TIMEOUT) < 0) {
-				err = -EIO;
-				goto out;
-			}
-
-			if (rq[n + 1]->engine != siblings[n]) {
-				pr_err("Bonded request did not execute on target engine: expected %s, used %s; master was %s\n",
-				       siblings[n]->name,
-				       rq[n + 1]->engine->name,
-				       rq[0]->engine->name);
-				err = -EINVAL;
-				goto out;
-			}
-		}
-
-		for (n = 0; !IS_ERR(rq[n]); n++)
-			i915_request_put(rq[n]);
-		rq[0] = ERR_PTR(-ENOMEM);
-	}
-
-out:
-	for (n = 0; !IS_ERR(rq[n]); n++)
-		i915_request_put(rq[n]);
-	if (igt_flush_test(gt->i915))
-		err = -EIO;
-
-	igt_spinner_fini(&spin);
-	return err;
-}
-
-static int live_virtual_bond(void *arg)
-{
-	static const struct phase {
-		const char *name;
-		unsigned int flags;
-	} phases[] = {
-		{ "", 0 },
-		{ "schedule", BOND_SCHEDULE },
-		{ },
-	};
-	struct intel_gt *gt = arg;
-	struct intel_engine_cs *siblings[MAX_ENGINE_INSTANCE + 1];
-	unsigned int class;
-	int err;
-
-	if (intel_uc_uses_guc_submission(&gt->uc))
-		return 0;
-
-	for (class = 0; class <= MAX_ENGINE_CLASS; class++) {
-		const struct phase *p;
-		int nsibling;
-
-		nsibling = select_siblings(gt, class, siblings);
-		if (nsibling < 2)
-			continue;
-
-		for (p = phases; p->name; p++) {
-			err = bond_virtual_engine(gt,
-						  class, siblings, nsibling,
-						  p->flags);
-			if (err) {
-				pr_err("%s(%s): failed class=%d, nsibling=%d, err=%d\n",
-				       __func__, p->name, class, nsibling, err);
-				return err;
-			}
-		}
-	}
-
-	return 0;
-}
-
 static int reset_virtual_engine(struct intel_gt *gt,
 				struct intel_engine_cs **siblings,
 				unsigned int nsibling)
@@ -4721,7 +4493,6 @@ int intel_execlists_live_selftests(struct drm_i915_private *i915)
 		SUBTEST(live_virtual_mask),
 		SUBTEST(live_virtual_preserved),
 		SUBTEST(live_virtual_slice),
-		SUBTEST(live_virtual_bond),
 		SUBTEST(live_virtual_reset),
 	};
 
-- 
2.31.1

