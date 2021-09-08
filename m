Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CD9403F5D
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 21:05:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEA936E296;
	Wed,  8 Sep 2021 19:04:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 459 seconds by postgrey-1.36 at gabe;
 Wed, 08 Sep 2021 19:04:51 UTC
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EDA76E283;
 Wed,  8 Sep 2021 19:04:51 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1631127427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6pw/RdHrc/CzkC23is54QzO2uIf7Wy7vdaWPzx8kuIk=;
 b=Dr5cIEnN4ZlXZuQQSARgL8tqun+7XF/7mNoC+c7ICPQnKRkE9pBwX86T90/ZPCg1zL6AlK
 YJsjSeFZjXJor8MN02Y4+8aE5OfMKobLG+a9jSdBx6N1GoEFgVs5av8obROCEoIvhqSg/v
 tvrH7LL/Hx5G9m0v/ZwUUaSz4oHTfgCpv64sSm9FXvYtef4UwfaGMTgjx+XT5EBKnfZgmQ
 nN+1v9QER5hEF03a4NgNigXPt1YDGktaNZx3tXAQlnC90vSiDwHUoVZ583ZjQv0dVa1S38
 /YfGnOOxZz7gXnz47Vlwyhj8YZ9ItwTOwiWchknT33Eq6nrrTW1Pw24QTgVcCw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1631127427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6pw/RdHrc/CzkC23is54QzO2uIf7Wy7vdaWPzx8kuIk=;
 b=twWw5P+IrUvvgm2INwYv5u3UywepNToT+zB7iSdYKp4Bmc+wHtaAP1/1YI2ZfT75ovtBUc
 TMjE/Qc2PU9aRgCQ==
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Clark Williams <williams@redhat.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [RFC PATCH 2/2] drm/i915/gt: Use spin_lock_irq() instead of
 local_irq_disable() + spin_lock()
Date: Wed,  8 Sep 2021 20:57:03 +0200
Message-Id: <20210908185703.2989414-3-bigeasy@linutronix.de>
In-Reply-To: <20210908185703.2989414-1-bigeasy@linutronix.de>
References: <20210908185703.2989414-1-bigeasy@linutronix.de>
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
---
 .../drm/i915/gt/intel_execlists_submission.c    | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers=
/gpu/drm/i915/gt/intel_execlists_submission.c
index fc77592d88a96..2ec1dd352960b 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -1265,7 +1265,7 @@ static void execlists_dequeue(struct intel_engine_cs =
*engine)
 	 * and context switches) submission.
 	 */
=20
-	spin_lock(&engine->active.lock);
+	spin_lock_irq(&engine->active.lock);
=20
 	/*
 	 * If the queue is higher priority than the last
@@ -1365,7 +1365,7 @@ static void execlists_dequeue(struct intel_engine_cs =
*engine)
 				 * Even if ELSP[1] is occupied and not worthy
 				 * of timeslices, our queue might be.
 				 */
-				spin_unlock(&engine->active.lock);
+				spin_unlock_irq(&engine->active.lock);
 				return;
 			}
 		}
@@ -1391,7 +1391,7 @@ static void execlists_dequeue(struct intel_engine_cs =
*engine)
=20
 		if (last && !can_merge_rq(last, rq)) {
 			spin_unlock(&ve->base.active.lock);
-			spin_unlock(&engine->active.lock);
+			spin_unlock_irq(&engine->active.lock);
 			return; /* leave this for another sibling */
 		}
=20
@@ -1552,7 +1552,7 @@ static void execlists_dequeue(struct intel_engine_cs =
*engine)
 	 * interrupt for secondary ports).
 	 */
 	execlists->queue_priority_hint =3D queue_prio(execlists);
-	spin_unlock(&engine->active.lock);
+	spin_unlock_irq(&engine->active.lock);
=20
 	/*
 	 * We can skip poking the HW if we ended up with exactly the same set
@@ -1578,13 +1578,6 @@ static void execlists_dequeue(struct intel_engine_cs=
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
@@ -2377,7 +2370,7 @@ static void execlists_submission_tasklet(struct taskl=
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
2.33.0

