Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 261B8474452
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 15:03:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A563C10E52F;
	Tue, 14 Dec 2021 14:03:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40D6810E49B;
 Tue, 14 Dec 2021 14:03:13 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1639490590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lQPYrQsb+kWQxCJK6Rh2kL18SPqZQOQQFdnBjl5jMQ0=;
 b=GxeMkY4/POuhr1DFTWvzEuorE219WMXztGGerVcVdiY6eSnNa7h4RqNBOmLQNqmp2MPny0
 CA3MxgvMlSd4X3IjwAy0YfM32us30m+68KtAR7rVJKrbvdH7Ffc9INP8WP6CCCuaDe5P3H
 nXAX5Q1lleGd3HUuKPQsOUH77g/MZaV3ONaTdffqAp/x2ZdQHKk4QTYO9ZgK2vzyDyc6Sc
 L+p+bfaElADaVByWugoPLulrIB/jyQ8o6yCQ6uHihfUGUDvsBW0421GswWd0+e7xhBvALU
 i4ApUBelJOAu50fc7+f5OG2fLmZw2uDHtfd7YoNIKkqcK0PSr2NGtbDgC8l36g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1639490590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lQPYrQsb+kWQxCJK6Rh2kL18SPqZQOQQFdnBjl5jMQ0=;
 b=9tr53YYM38Ss7X/FUUPYx8kHmC6j8Z6uckZsNVeK3oQkpNRK9Fh2n/FgiFf6jXDNbUND03
 NnFHPoTX/ki5KLCQ==
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 5/8] drm/i915: Don't disable interrupts on PREEMPT_RT during
 atomic updates
Date: Tue, 14 Dec 2021 15:02:58 +0100
Message-Id: <20211214140301.520464-6-bigeasy@linutronix.de>
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
 Mike Galbraith <umgwanakikbuti@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Gleixner <tglx@linutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mike Galbraith <umgwanakikbuti@gmail.com>

Commit
   8d7849db3eab7 ("drm/i915: Make sprite updates atomic")

started disabling interrupts across atomic updates. This breaks on PREEMPT_=
RT
because within this section the code attempt to acquire spinlock_t locks wh=
ich
are sleeping locks on PREEMPT_RT.

According to the comment the interrupts are disabled to avoid random delays=
 and
not required for protection or synchronisation.
If this needs to happen with disabled interrupts on PREEMPT_RT, and the
whole section is restricted to register access then all sleeping locks
need to be acquired before interrupts are disabled and some function
maybe moved after enabling interrupts again.
This includes:
- prepare_to_wait() + finish_wait() due its wake queue.
- drm_crtc_vblank_put() -> vblank_disable_fn() drm_device::vbl_lock.
- skl_pfit_enable(), intel_update_plane(), vlv_atomic_update_fifo() and
  maybe others due to intel_uncore::lock
- drm_crtc_arm_vblank_event() due to drm_device::event_lock and
  drm_device::vblank_time_lock.

Don't disable interrupts on PREEMPT_RT during atomic updates.

[bigeasy: drop local locks, commit message]

Signed-off-by: Mike Galbraith <umgwanakikbuti@gmail.com>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/gpu/drm/i915/display/intel_crtc.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i9=
15/display/intel_crtc.c
index 254e67141a776..7a39029b083f4 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc.c
@@ -425,7 +425,8 @@ void intel_pipe_update_start(const struct intel_crtc_st=
ate *new_crtc_state)
 	 */
 	intel_psr_wait_for_idle(new_crtc_state);
=20
-	local_irq_disable();
+	if (!IS_ENABLED(CONFIG_PREEMPT_RT))
+		local_irq_disable();
=20
 	crtc->debug.min_vbl =3D min;
 	crtc->debug.max_vbl =3D max;
@@ -450,11 +451,13 @@ void intel_pipe_update_start(const struct intel_crtc_=
state *new_crtc_state)
 			break;
 		}
=20
-		local_irq_enable();
+		if (!IS_ENABLED(CONFIG_PREEMPT_RT))
+			local_irq_enable();
=20
 		timeout =3D schedule_timeout(timeout);
=20
-		local_irq_disable();
+		if (!IS_ENABLED(CONFIG_PREEMPT_RT))
+			local_irq_disable();
 	}
=20
 	finish_wait(wq, &wait);
@@ -487,7 +490,8 @@ void intel_pipe_update_start(const struct intel_crtc_st=
ate *new_crtc_state)
 	return;
=20
 irq_disable:
-	local_irq_disable();
+	if (!IS_ENABLED(CONFIG_PREEMPT_RT))
+		local_irq_disable();
 }
=20
 #if IS_ENABLED(CONFIG_DRM_I915_DEBUG_VBLANK_EVADE)
@@ -566,7 +570,8 @@ void intel_pipe_update_end(struct intel_crtc_state *new=
_crtc_state)
 		new_crtc_state->uapi.event =3D NULL;
 	}
=20
-	local_irq_enable();
+	if (!IS_ENABLED(CONFIG_PREEMPT_RT))
+		local_irq_enable();
=20
 	/* Send VRR Push to terminate Vblank */
 	intel_vrr_send_push(new_crtc_state);
--=20
2.34.1

