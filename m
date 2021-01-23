Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 406B8301B50
	for <lists+dri-devel@lfdr.de>; Sun, 24 Jan 2021 12:04:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B237289E05;
	Sun, 24 Jan 2021 11:04:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56DD289AB5;
 Sat, 23 Jan 2021 17:55:27 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id 6so12237743ejz.5;
 Sat, 23 Jan 2021 09:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ij8616FxgPL0g+EkHhBWQEtOFDxuaD1ectYgMChxWv8=;
 b=IYvk8JYfAiIZsz1p5pnAZJvCu20jExS7U36BT8xniNQS+M6g9nH5cvlrrDOFUxwjqQ
 TI2/Bzh1CoLRp6E2RWngCEkd93s+2uMFMBzm0pK33Yd2CtjTi2eH1dB2Lkw8nAn4t7jQ
 y9iXU0ajvp/gO8Wz0pPMEACKzmBsRHrutpZ589R2IYiQSb8N3uBA5FDoJq8xUT3fVqMR
 FBTUiXF4OsiXlleCRgq498rqH/di1Oe3/QhRY3x5p3G7HMqG6rqxDBU70LhbGPdS6NRm
 tuV8BUXpGlzcgAzGhI/T2fEfQEu7R0+CniZJThOr1ZKqFaef9/R0MuEkm2gRKt1YcUIj
 315g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=ij8616FxgPL0g+EkHhBWQEtOFDxuaD1ectYgMChxWv8=;
 b=VdnTyYZAFYZ9GnIWpXmJ+Pd3nQp58vD/Tux2r8BAjLe6OjTwwDjd3WAC4AUqWSGpS5
 UkibkklCrU+JiTVA8qGqmeC8NoT+HXF+70tIcZzqkIsvI7ncifNh7jlWsAPjstNI6MkV
 QqvoiLOihy2pR221lJzoz0UPjfcNnvs7/AF1Q5KDkQZX8mHzq1dVBqWro69HFgssEcKc
 cY3nm53OCe5nMs1yeSFx6ToHeJ7JIiJUfEe5qaDd92iA2xzrXxOYgYoIBmRZ+Mqvbn/A
 umdNXd0PFqccJWtbGuDJJ2I9+bZ1mgfdt1SDw9kUnkOL3THq+OfAA/rYQZB4FeG4wUY5
 +xig==
X-Gm-Message-State: AOAM533cxkb1G4giAnySCEsjUNrsuwApYJQhr8NqOtTNlh5p7YqtKd82
 y8jDoY/iDS8y99/FKbLsW31reI+b1HDgbQ==
X-Google-Smtp-Source: ABdhPJyiwn6KLj157j2Gw/tskSBHxP7SjC40GnblLEzrz9M/fouI0xJR6lE9P0c5FvZeaH4K8KUHzQ==
X-Received: by 2002:a17:906:589:: with SMTP id 9mr2152961ejn.229.1611424525856; 
 Sat, 23 Jan 2021 09:55:25 -0800 (PST)
Received: from stitch.. ([2a01:4262:1ab:c:de4:866f:76c3:151d])
 by smtp.gmail.com with ESMTPSA id j23sm7533690edv.45.2021.01.23.09.55.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jan 2021 09:55:25 -0800 (PST)
From: Emil Renner Berthing <esmil@mailme.dk>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/gt: use new tasklet API for execution list
Date: Sat, 23 Jan 2021 18:55:02 +0100
Message-Id: <20210123175502.6154-1-esmil@mailme.dk>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 24 Jan 2021 11:04:21 +0000
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
Cc: Emil Renner Berthing <kernel@esmil.dk>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, David Airlie <airlied@linux.ie>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>, linux-kernel@vger.kernel.org,
 Chris Wilson <chris@chris-wilson.co.uk>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Emil Renner Berthing <kernel@esmil.dk>

This converts the driver to use the new tasklet API introduced in
commit 12cc923f1ccc ("tasklet: Introduce new initialization API")

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>

---
Tested on my Dell XPS 13 9300.

 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  4 +--
 drivers/gpu/drm/i915/gt/intel_lrc.c           | 27 +++++++++----------
 drivers/gpu/drm/i915/gt/selftest_lrc.c        |  4 +--
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  6 ++---
 4 files changed, 19 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 0b31670343f5..a97a80ca0ba7 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -1193,7 +1193,7 @@ void intel_engine_flush_submission(struct intel_engine_cs *engine)
 {
 	struct tasklet_struct *t = &engine->execlists.tasklet;
 
-	if (!t->func)
+	if (!t->callback)
 		return;
 
 	/* Synchronise and wait for the tasklet on another CPU */
@@ -1204,7 +1204,7 @@ void intel_engine_flush_submission(struct intel_engine_cs *engine)
 	if (tasklet_trylock(t)) {
 		/* Must wait for any GPU reset in progress. */
 		if (__tasklet_is_enabled(t))
-			t->func(t->data);
+			t->callback(t);
 		tasklet_unlock(t);
 	}
 	local_bh_enable();
diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
index 26c7d0a50585..20aa0ec09507 100644
--- a/drivers/gpu/drm/i915/gt/intel_lrc.c
+++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
@@ -3194,9 +3194,9 @@ static bool preempt_timeout(const struct intel_engine_cs *const engine)
  * Check the unread Context Status Buffers and manage the submission of new
  * contexts to the ELSP accordingly.
  */
-static void execlists_submission_tasklet(unsigned long data)
+static void execlists_submission_tasklet(struct tasklet_struct *t)
 {
-	struct intel_engine_cs * const engine = (struct intel_engine_cs *)data;
+	struct intel_engine_cs * const engine = from_tasklet(engine, t, execlists.tasklet);
 	bool timeout = preempt_timeout(engine);
 
 	process_csb(engine);
@@ -4401,9 +4401,9 @@ static void execlists_reset_rewind(struct intel_engine_cs *engine, bool stalled)
 	spin_unlock_irqrestore(&engine->active.lock, flags);
 }
 
-static void nop_submission_tasklet(unsigned long data)
+static void nop_submission_tasklet(struct tasklet_struct *t)
 {
-	struct intel_engine_cs * const engine = (struct intel_engine_cs *)data;
+	struct intel_engine_cs * const engine = from_tasklet(engine, t, execlists.tasklet);
 
 	/* The driver is wedged; don't process any more events. */
 	WRITE_ONCE(engine->execlists.queue_priority_hint, INT_MIN);
@@ -4487,7 +4487,7 @@ static void execlists_reset_cancel(struct intel_engine_cs *engine)
 	execlists->queue = RB_ROOT_CACHED;
 
 	GEM_BUG_ON(__tasklet_is_enabled(&execlists->tasklet));
-	execlists->tasklet.func = nop_submission_tasklet;
+	execlists->tasklet.callback = nop_submission_tasklet;
 
 	spin_unlock_irqrestore(&engine->active.lock, flags);
 }
@@ -4503,7 +4503,7 @@ static void execlists_reset_finish(struct intel_engine_cs *engine)
 	 */
 	GEM_BUG_ON(!reset_in_progress(execlists));
 	if (!RB_EMPTY_ROOT(&execlists->queue.rb_root))
-		execlists->tasklet.func(execlists->tasklet.data);
+		execlists->tasklet.callback(&execlists->tasklet);
 
 	if (__tasklet_enable(&execlists->tasklet))
 		/* And kick in case we missed a new request submission. */
@@ -5093,7 +5093,7 @@ void intel_execlists_set_default_submission(struct intel_engine_cs *engine)
 {
 	engine->submit_request = execlists_submit_request;
 	engine->schedule = i915_schedule;
-	engine->execlists.tasklet.func = execlists_submission_tasklet;
+	engine->execlists.tasklet.callback = execlists_submission_tasklet;
 
 	engine->reset.prepare = execlists_reset_prepare;
 	engine->reset.rewind = execlists_reset_rewind;
@@ -5220,8 +5220,7 @@ int intel_execlists_submission_setup(struct intel_engine_cs *engine)
 	struct intel_uncore *uncore = engine->uncore;
 	u32 base = engine->mmio_base;
 
-	tasklet_init(&engine->execlists.tasklet,
-		     execlists_submission_tasklet, (unsigned long)engine);
+	tasklet_setup(&engine->execlists.tasklet, execlists_submission_tasklet);
 	timer_setup(&engine->execlists.timer, execlists_timeslice, 0);
 	timer_setup(&engine->execlists.preempt, execlists_preempt, 0);
 
@@ -5670,9 +5669,9 @@ static intel_engine_mask_t virtual_submission_mask(struct virtual_engine *ve)
 	return mask;
 }
 
-static void virtual_submission_tasklet(unsigned long data)
+static void virtual_submission_tasklet(struct tasklet_struct *t)
 {
-	struct virtual_engine * const ve = (struct virtual_engine *)data;
+	struct virtual_engine * const ve = from_tasklet(ve, t, base.execlists.tasklet);
 	const int prio = READ_ONCE(ve->base.execlists.queue_priority_hint);
 	intel_engine_mask_t mask;
 	unsigned int n;
@@ -5883,9 +5882,7 @@ intel_execlists_create_virtual(struct intel_engine_cs **siblings,
 
 	INIT_LIST_HEAD(virtual_queue(ve));
 	ve->base.execlists.queue_priority_hint = INT_MIN;
-	tasklet_init(&ve->base.execlists.tasklet,
-		     virtual_submission_tasklet,
-		     (unsigned long)ve);
+	tasklet_setup(&ve->base.execlists.tasklet, virtual_submission_tasklet);
 
 	intel_context_init(&ve->context, &ve->base);
 
@@ -5913,7 +5910,7 @@ intel_execlists_create_virtual(struct intel_engine_cs **siblings,
 		 * layering if we handle cloning of the requests and
 		 * submitting a copy into each backend.
 		 */
-		if (sibling->execlists.tasklet.func !=
+		if (sibling->execlists.tasklet.callback !=
 		    execlists_submission_tasklet) {
 			err = -ENODEV;
 			goto err_put;
diff --git a/drivers/gpu/drm/i915/gt/selftest_lrc.c b/drivers/gpu/drm/i915/gt/selftest_lrc.c
index 95d41c01d0e0..8594ff72456e 100644
--- a/drivers/gpu/drm/i915/gt/selftest_lrc.c
+++ b/drivers/gpu/drm/i915/gt/selftest_lrc.c
@@ -631,7 +631,7 @@ static int live_hold_reset(void *arg)
 		}
 		tasklet_disable(&engine->execlists.tasklet);
 
-		engine->execlists.tasklet.func(engine->execlists.tasklet.data);
+		engine->execlists.tasklet.callback(&engine->execlists.tasklet);
 		GEM_BUG_ON(execlists_active(&engine->execlists) != rq);
 
 		i915_request_get(rq);
@@ -4577,7 +4577,7 @@ static int reset_virtual_engine(struct intel_gt *gt,
 	}
 	tasklet_disable(&engine->execlists.tasklet);
 
-	engine->execlists.tasklet.func(engine->execlists.tasklet.data);
+	engine->execlists.tasklet.callback(&engine->execlists.tasklet);
 	GEM_BUG_ON(execlists_active(&engine->execlists) != rq);
 
 	/* Fake a preemption event; failed of course */
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index fdfeb4b9b0f5..a52ce82f23e2 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -344,9 +344,9 @@ static void __guc_dequeue(struct intel_engine_cs *engine)
 	execlists->active = execlists->inflight;
 }
 
-static void guc_submission_tasklet(unsigned long data)
+static void guc_submission_tasklet(struct tasklet_struct *t)
 {
-	struct intel_engine_cs * const engine = (struct intel_engine_cs *)data;
+	struct intel_engine_cs * const engine = from_tasklet(engine, t, execlists.tasklet);
 	struct intel_engine_execlists * const execlists = &engine->execlists;
 	struct i915_request **port, *rq;
 	unsigned long flags;
@@ -591,7 +591,7 @@ static void guc_set_default_submission(struct intel_engine_cs *engine)
 	 */
 	intel_execlists_set_default_submission(engine);
 
-	engine->execlists.tasklet.func = guc_submission_tasklet;
+	engine->execlists.tasklet.callback = guc_submission_tasklet;
 
 	/* do not use execlists park/unpark */
 	engine->park = engine->unpark = NULL;
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
