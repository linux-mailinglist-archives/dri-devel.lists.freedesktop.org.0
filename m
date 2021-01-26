Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 190D63055CA
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jan 2021 09:30:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10D0C6E7DD;
	Wed, 27 Jan 2021 08:29:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E964189BB3;
 Tue, 26 Jan 2021 15:02:04 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id s11so20126234edd.5;
 Tue, 26 Jan 2021 07:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PmHpHVYbvaI2vdfD1yqNwoWG7t7iJr68+JLvkv+4zDI=;
 b=bdf7EeLCGKhNUHopjRxzUn3ScxngRMfoPzPtLzEPDyxGmt6500Qx6lnfS4qYxNXpHF
 K/3d1Qq/FsTlwo4Uq/5uIChwGvHeZp6Q3yXWWBkbuccfHs4WWNgqAmhzV7gzwptIoYYW
 ob1MMOm5NotozHO2n6o8vy+kig6mAx75HWfRvaJgmiDASxfwcizyN5YfmO3dhEDsyjK+
 CijbdNGvhHNQry/92MeZv7XksYqzQT578R4/QTxsqnoFGjOe1E+ejUJN7rj+dPrb2vnM
 8hFrI7yOBlPEt5DUTYym71rbyeNzOq2YfoGi3nB3KoOgONg8AAgVnnmjkKkaSsioBVRp
 dYJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=PmHpHVYbvaI2vdfD1yqNwoWG7t7iJr68+JLvkv+4zDI=;
 b=Bak6oJrJfMe7Bw5mNtWVJ3r1XAfl2ZZcX4m7wJJPT2XO6IlKeouIfWGDeKVUQ/zM1L
 1YryEgwo+3ZWtdqqmnDXGwALWy2Bo/wh8wUF1Z9qo3hgyl/Ip39wLbM/PY4I811OpvQo
 N9pHopOAkUEg5TthLxmEAq0GensJxyYfuzDf6k7Gv6TgsKYNwlZXUKdIY0PE423jYHTM
 MrL39FMPJpyGbfVgwRMqXOUQeaLTh3tr9tGPnG2xKrEA74kb0vwTqRsdziuvo67MCXTP
 PnE5th+3zcl7UuNLl/igXPQZaEH8O4Igq1WMpuxWR2VwHDGWwWg5XCGZSJnG57euQKur
 +hfw==
X-Gm-Message-State: AOAM532ypu6Aj7NaqatQCe/GOGGTdzsAwqJFHrR25wWYG7dYCMPw7T3U
 PUn9CvA8Q1VfkCiSLIFdBgQAT6DiVZx/Og==
X-Google-Smtp-Source: ABdhPJyAUYlT/ae42NrtlkM2In3O74/ddo57FZ4ysdt70bg+r4DlCrOIzh+r+YrXxsD4SocM1apXpQ==
X-Received: by 2002:a50:8387:: with SMTP id 7mr4683813edi.131.1611673323617;
 Tue, 26 Jan 2021 07:02:03 -0800 (PST)
Received: from stitch.. ([2a01:4262:1ab:c:4d1f:a80:1d37:b028])
 by smtp.gmail.com with ESMTPSA id ke7sm9899773ejc.7.2021.01.26.07.02.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 07:02:03 -0800 (PST)
From: Emil Renner Berthing <kernel@esmil.dk>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2] drm/i915/gt: use new tasklet API for execution list
Date: Tue, 26 Jan 2021 16:01:55 +0100
Message-Id: <20210126150155.1617-1-kernel@esmil.dk>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 27 Jan 2021 08:29:46 +0000
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

This converts the driver to use the new tasklet API introduced in
commit 12cc923f1ccc ("tasklet: Introduce new initialization API")

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>

---
v2: Rebased on drm-intel-next

Tested on my Dell XPS 13 9300.
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  4 +--
 .../drm/i915/gt/intel_execlists_submission.c  | 25 ++++++++-----------
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  9 +++----
 3 files changed, 17 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index fa76602f9852..48a8caa28f65 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -1234,14 +1234,14 @@ void __intel_engine_flush_submission(struct intel_engine_cs *engine, bool sync)
 {
 	struct tasklet_struct *t = &engine->execlists.tasklet;
 
-	if (!t->func)
+	if (!t->callback)
 		return;
 
 	local_bh_disable();
 	if (tasklet_trylock(t)) {
 		/* Must wait for any GPU reset in progress. */
 		if (__tasklet_is_enabled(t))
-			t->func(t->data);
+			t->callback(t);
 		tasklet_unlock(t);
 	}
 	local_bh_enable();
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index d7d5a58990bb..3dfae03c6d6a 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -2376,9 +2376,9 @@ static bool preempt_timeout(const struct intel_engine_cs *const engine)
  * Check the unread Context Status Buffers and manage the submission of new
  * contexts to the ELSP accordingly.
  */
-static void execlists_submission_tasklet(unsigned long data)
+static void execlists_submission_tasklet(struct tasklet_struct *t)
 {
-	struct intel_engine_cs * const engine = (struct intel_engine_cs *)data;
+	struct intel_engine_cs * const engine = from_tasklet(engine, t, execlists.tasklet);
 	struct i915_request *post[2 * EXECLIST_MAX_PORTS];
 	struct i915_request **inactive;
 
@@ -2956,9 +2956,9 @@ static void execlists_reset_rewind(struct intel_engine_cs *engine, bool stalled)
 	rcu_read_unlock();
 }
 
-static void nop_submission_tasklet(unsigned long data)
+static void nop_submission_tasklet(struct tasklet_struct *t)
 {
-	struct intel_engine_cs * const engine = (struct intel_engine_cs *)data;
+	struct intel_engine_cs * const engine = from_tasklet(engine, t, execlists.tasklet);
 
 	/* The driver is wedged; don't process any more events. */
 	WRITE_ONCE(engine->execlists.queue_priority_hint, INT_MIN);
@@ -3043,7 +3043,7 @@ static void execlists_reset_cancel(struct intel_engine_cs *engine)
 	execlists->queue = RB_ROOT_CACHED;
 
 	GEM_BUG_ON(__tasklet_is_enabled(&execlists->tasklet));
-	execlists->tasklet.func = nop_submission_tasklet;
+	execlists->tasklet.callback = nop_submission_tasklet;
 
 	spin_unlock_irqrestore(&engine->active.lock, flags);
 	rcu_read_unlock();
@@ -3104,7 +3104,7 @@ static void execlists_set_default_submission(struct intel_engine_cs *engine)
 {
 	engine->submit_request = execlists_submit_request;
 	engine->schedule = i915_schedule;
-	engine->execlists.tasklet.func = execlists_submission_tasklet;
+	engine->execlists.tasklet.callback = execlists_submission_tasklet;
 
 	engine->reset.prepare = execlists_reset_prepare;
 	engine->reset.rewind = execlists_reset_rewind;
@@ -3228,8 +3228,7 @@ int intel_execlists_submission_setup(struct intel_engine_cs *engine)
 	struct intel_uncore *uncore = engine->uncore;
 	u32 base = engine->mmio_base;
 
-	tasklet_init(&engine->execlists.tasklet,
-		     execlists_submission_tasklet, (unsigned long)engine);
+	tasklet_setup(&engine->execlists.tasklet, execlists_submission_tasklet);
 	timer_setup(&engine->execlists.timer, execlists_timeslice, 0);
 	timer_setup(&engine->execlists.preempt, execlists_preempt, 0);
 
@@ -3471,9 +3470,9 @@ static intel_engine_mask_t virtual_submission_mask(struct virtual_engine *ve)
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
@@ -3683,9 +3682,7 @@ intel_execlists_create_virtual(struct intel_engine_cs **siblings,
 
 	INIT_LIST_HEAD(virtual_queue(ve));
 	ve->base.execlists.queue_priority_hint = INT_MIN;
-	tasklet_init(&ve->base.execlists.tasklet,
-		     virtual_submission_tasklet,
-		     (unsigned long)ve);
+	tasklet_setup(&ve->base.execlists.tasklet, virtual_submission_tasklet);
 
 	intel_context_init(&ve->context, &ve->base);
 
@@ -3713,7 +3710,7 @@ intel_execlists_create_virtual(struct intel_engine_cs **siblings,
 		 * layering if we handle cloning of the requests and
 		 * submitting a copy into each backend.
 		 */
-		if (sibling->execlists.tasklet.func !=
+		if (sibling->execlists.tasklet.callback !=
 		    execlists_submission_tasklet) {
 			err = -ENODEV;
 			goto err_put;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 23dc0aeaa0ab..5dd41014e896 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -238,9 +238,9 @@ static void __guc_dequeue(struct intel_engine_cs *engine)
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
@@ -610,7 +610,7 @@ static void guc_set_default_submission(struct intel_engine_cs *engine)
 {
 	engine->submit_request = guc_submit_request;
 	engine->schedule = i915_schedule;
-	engine->execlists.tasklet.func = guc_submission_tasklet;
+	engine->execlists.tasklet.callback = guc_submission_tasklet;
 
 	engine->reset.prepare = guc_reset_prepare;
 	engine->reset.rewind = guc_reset_rewind;
@@ -702,8 +702,7 @@ int intel_guc_submission_setup(struct intel_engine_cs *engine)
 	 */
 	GEM_BUG_ON(INTEL_GEN(i915) < 11);
 
-	tasklet_init(&engine->execlists.tasklet,
-		     guc_submission_tasklet, (unsigned long)engine);
+	tasklet_setup(&engine->execlists.tasklet, guc_submission_tasklet);
 
 	guc_default_vfuncs(engine);
 	guc_default_irqs(engine);
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
