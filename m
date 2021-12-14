Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B58D0474442
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 15:03:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B70CD10E119;
	Tue, 14 Dec 2021 14:03:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C655D10E49A;
 Tue, 14 Dec 2021 14:03:11 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1639490589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XUhjsjkeqt3Hi70fsQDwKtWhY4WF7j3t9Y20sLP8Lq8=;
 b=ICC+XQpdL6gujOtbE9N6xgDpDcSCKnhlIumytUg7Yvl9TgvLT13vEDqLVQZi3xoWg+pG80
 qDFvZLZCc87PhjqFq1AMPCbRSbSNhX4Tn8qxM0+fIEtIxSfQCc+cprkdm8pD2nSLmYsdlv
 V263ojBO3FAnXWLfZkpovG4yuoX7uPevZgCed7njjaZ62mpPGxgIzwEEEkHdjptIrO/Ykk
 Y3cW/3Q7CUr7vkBiztmJLm2+RIqkxwPegP95MRpGkdFSVvsdYQHivXWcKK4woYtKg3m8n+
 0d6UZ4+yZvXvqI3n16FSfTc+hb/IwqE1y9/NB1LfRTLO308RorP0h5Aa8+TUvg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1639490589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XUhjsjkeqt3Hi70fsQDwKtWhY4WF7j3t9Y20sLP8Lq8=;
 b=zB+N1nRYoCCCMlmsvMYLIFh3cq4kp7sRK0fNvMX6dI09ph0we/OJj8DiehziLjxbYAN9Fh
 Rkm6q1DE/UUiBgCg==
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/8] drm/i915/gt: Use spin_lock_irq() instead of
 local_irq_disable() + spin_lock()
Date: Tue, 14 Dec 2021 15:02:56 +0100
Message-Id: <20211214140301.520464-4-bigeasy@linutronix.de>
In-Reply-To: <20211214140301.520464-1-bigeasy@linutronix.de>
References: <20211214140301.520464-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
 David Airlie <airlied@linux.ie>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Clark Williams <williams@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

execlists_dequeue() is invoked from a function which uses
local_irq_disable() to disable interrupts so the spin_lock() behaves
like spin_lock_irq().
This breaks PREEMPT_RT because local_irq_disable() + spin_lock() is not
the same as spin_lock_irq().

execlists_dequeue_irq() and execlists_dequeue() has each one caller
only. If intel_engine_cs::active::lock is acquired and released with the
_irq suffix then it behaves almost as if execlists_dequeue() would be
invoked with disabled interrupts. The difference is the last part of the
function which is then invoked with enabled interrupts.
I can't tell if this makes a difference. From looking at it, it might
work to move the last unlock at the end of the function as I didn't find
anything that would acquire the lock again.

Reported-by: Clark Williams <williams@redhat.com>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 .../drm/i915/gt/intel_execlists_submission.c    | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers=
/gpu/drm/i915/gt/intel_execlists_submission.c
index a69df5e9e77af..2d5f0c226ad66 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -1284,7 +1284,7 @@ static void execlists_dequeue(struct intel_engine_cs =
*engine)
 	 * and context switches) submission.
 	 */
=20
-	spin_lock(&sched_engine->lock);
+	spin_lock_irq(&sched_engine->lock);
=20
 	/*
 	 * If the queue is higher priority than the last
@@ -1384,7 +1384,7 @@ static void execlists_dequeue(struct intel_engine_cs =
*engine)
 				 * Even if ELSP[1] is occupied and not worthy
 				 * of timeslices, our queue might be.
 				 */
-				spin_unlock(&sched_engine->lock);
+				spin_unlock_irq(&sched_engine->lock);
 				return;
 			}
 		}
@@ -1410,7 +1410,7 @@ static void execlists_dequeue(struct intel_engine_cs =
*engine)
=20
 		if (last && !can_merge_rq(last, rq)) {
 			spin_unlock(&ve->base.sched_engine->lock);
-			spin_unlock(&engine->sched_engine->lock);
+			spin_unlock_irq(&engine->sched_engine->lock);
 			return; /* leave this for another sibling */
 		}
=20
@@ -1572,7 +1572,7 @@ static void execlists_dequeue(struct intel_engine_cs =
*engine)
 	 */
 	sched_engine->queue_priority_hint =3D queue_prio(sched_engine);
 	i915_sched_engine_reset_on_empty(sched_engine);
-	spin_unlock(&sched_engine->lock);
+	spin_unlock_irq(&sched_engine->lock);
=20
 	/*
 	 * We can skip poking the HW if we ended up with exactly the same set
@@ -1598,13 +1598,6 @@ static void execlists_dequeue(struct intel_engine_cs=
 *engine)
 	}
 }
=20
-static void execlists_dequeue_irq(struct intel_engine_cs *engine)
-{
-	local_irq_disable(); /* Suspend interrupts across request submission */
-	execlists_dequeue(engine);
-	local_irq_enable(); /* flush irq_work (e.g. breadcrumb enabling) */
-}
-
 static void clear_ports(struct i915_request **ports, int count)
 {
 	memset_p((void **)ports, NULL, count);
@@ -2425,7 +2418,7 @@ static void execlists_submission_tasklet(struct taskl=
et_struct *t)
 	}
=20
 	if (!engine->execlists.pending[0]) {
-		execlists_dequeue_irq(engine);
+		execlists_dequeue(engine);
 		start_timeslice(engine);
 	}
=20
--=20
2.34.1

