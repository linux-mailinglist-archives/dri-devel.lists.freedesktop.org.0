Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECB436EFF3
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 21:04:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE64B6F461;
	Thu, 29 Apr 2021 19:04:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6E6D6F464
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 19:04:00 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 m6-20020a17090a8586b02901507e1acf0fso410097pjn.3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 12:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2vOe889v9OGxzMsQrzaGZSocFwM+SCadiuRfxTmrEnA=;
 b=cFJ+NUqjlytMjVD2VjPGfzkLzbsPIgpgDM0hX39pwqsMmTswwC1N4BB+qok457ao+A
 HPryee7WVqyEkJHdZl/HJELN8VYOzGpR9OmQDWmtuyauYLsdOY4F0S6jKSOE6egNql0x
 mEHxtlcrRAOmIVUyY2xIFFZIfTwWvlvOTfijLwsL5asfeFSWt3YORoeM7zoCTa4bQmcP
 aSRjNzpiSQEwMpinBdZ1A2jKvmZXil1V8rS+CYzNyjuZf+R0qvpvVfoLKCL2CFuRc4+z
 YOKlDl9IcrdmIzaGxPcG5icaJ2F6LObzkxmW1cZY4tN0vp/+7WsLXqhSWNejZ86y5fra
 klDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2vOe889v9OGxzMsQrzaGZSocFwM+SCadiuRfxTmrEnA=;
 b=fo3p5UG3SeLDuuMRLyW7s2PcXsBtcrcZsHOfK2zrGzQ9AiCqzuX+K4JjIIiAxO+nFE
 EGhkBogX+hA8jjMIU6sFghysoPafFtwYes9y/39WvUwuL5afyNiA4GKhhCQHF4mymTna
 Pzpduep+0Cy2cWkkdPDY1JPyvTYcE/bCoF1nF/9r+cwdKtymITxxp1MqHalv31677Pbg
 r0I9ZZ8JtqHHreglcnNOsBitDYdD8nHguMhKDk/e4HVWmRSiUANEJOwN6mlDe02G0R99
 iDBtJEm1wIcmhztFzdhzJOnVgsZYL1UD+TOBDoPCJrSf7lL2afAZ1MKfMcZixVUvatzl
 muUQ==
X-Gm-Message-State: AOAM5306BTW4m02nnXlGpw8tmOTViy1PTQSYCZ6TC3g21svlU6tY5lHK
 Mb52VOe3puBTIz3y94BxImmYLQ==
X-Google-Smtp-Source: ABdhPJwrv/2rLrEUXvPMNeaT9F4UhZvH3ugvcj/3ppNXTvZSjZIRxFPl7LPzNZngtIv/EEFS2+XsBg==
X-Received: by 2002:a17:902:ed52:b029:ed:2f0e:eac with SMTP id
 y18-20020a170902ed52b02900ed2f0e0eacmr1325847plb.47.1619723040241; 
 Thu, 29 Apr 2021 12:04:00 -0700 (PDT)
Received: from omlet.lan ([134.134.139.83])
 by smtp.gmail.com with ESMTPSA id b21sm3114405pji.39.2021.04.29.12.03.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 12:03:59 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 09/25] drm/i915/gem: Disallow bonding of virtual engines (v3)
Date: Thu, 29 Apr 2021 14:03:24 -0500
Message-Id: <20210429190340.1555632-10-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210429190340.1555632-1-jason@jlekstrand.net>
References: <20210429190340.1555632-1-jason@jlekstrand.net>
MIME-Version: 1.0
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
Cc: Jason Ekstrand <jason@jlekstrand.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c   |  18 +-
 .../drm/i915/gt/intel_execlists_submission.c  |  69 ------
 .../drm/i915/gt/intel_execlists_submission.h  |   4 -
 drivers/gpu/drm/i915/gt/selftest_execlists.c  | 229 ------------------
 4 files changed, 6 insertions(+), 314 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 92e55441a7621..be42dc918ef6f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -1553,6 +1553,12 @@ set_engines__bond(struct i915_user_extension __user *base, void *data)
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
@@ -1593,18 +1599,6 @@ set_engines__bond(struct i915_user_extension __user *base, void *data)
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
index 0e8c320927d15..14378b28169b7 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -181,18 +181,6 @@ struct virtual_engine {
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
@@ -3307,7 +3295,6 @@ static void rcu_virtual_context_destroy(struct work_struct *wrk)
 	intel_breadcrumbs_free(ve->base.breadcrumbs);
 	intel_engine_free_request_pool(&ve->base);
 
-	kfree(ve->bonds);
 	kfree(ve);
 }
 
@@ -3560,33 +3547,13 @@ static void virtual_submit_request(struct i915_request *rq)
 	spin_unlock_irqrestore(&ve->base.active.lock, flags);
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
@@ -3736,42 +3703,6 @@ intel_execlists_create_virtual(struct intel_engine_cs **siblings,
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
index bab3d37cf3f98..ad4f3e1a0fded 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.h
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.h
@@ -36,10 +36,6 @@ struct intel_context *
 intel_execlists_create_virtual(struct intel_engine_cs **siblings,
 			       unsigned int count);
 
-int intel_virtual_engine_attach_bond(struct intel_engine_cs *engine,
-				     const struct intel_engine_cs *master,
-				     const struct intel_engine_cs *sibling);
-
 bool
 intel_engine_in_execlists_submission_mode(const struct intel_engine_cs *engine);
 
diff --git a/drivers/gpu/drm/i915/gt/selftest_execlists.c b/drivers/gpu/drm/i915/gt/selftest_execlists.c
index 01d9896dd4844..a0e75b71a3374 100644
--- a/drivers/gpu/drm/i915/gt/selftest_execlists.c
+++ b/drivers/gpu/drm/i915/gt/selftest_execlists.c
@@ -4311,234 +4311,6 @@ static int live_virtual_preserved(void *arg)
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
@@ -4712,7 +4484,6 @@ int intel_execlists_live_selftests(struct drm_i915_private *i915)
 		SUBTEST(live_virtual_mask),
 		SUBTEST(live_virtual_preserved),
 		SUBTEST(live_virtual_slice),
-		SUBTEST(live_virtual_bond),
 		SUBTEST(live_virtual_reset),
 	};
 
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
