Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 409A4422BA5
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 17:01:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B4856E41A;
	Tue,  5 Oct 2021 15:00:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BABA6E41B;
 Tue,  5 Oct 2021 15:00:52 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1633446050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YfV+dFFWxaAmjKgGZbxhOlXmxOzC0zReiVvOe/Up0ZY=;
 b=LhqNlRejgIsZ0umEZC5dzXBYp7foR7IDyEjWbDBSvSM4fpbSWAJQdBhMjN+tWYQT0Ptpz3
 AzN6tNOWK+eYni6Emxvi6/QU+ectgHwUdGZqb2Zpa3n1sf64oEaRWXLpjdutTNpvSXLVAX
 Ach6pfdu7rFm3LdbVAWf6rwj1ZBX9tUkSnr+j0dK+X3fkj5OHmx/6mlwfNmm9NJqBQceSR
 H+YvPOdTEAEH2p78qWz633OwtDVpXjyssPPJrClCTxAxYO0u4BdxFEFIkuC/E5e2a6DdVP
 RjLXqfhyCXX5VeZyvz8JoZc+gjOiIrPujT9jJU8HiRe0UtowhYpiDfdcxfRLVg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1633446050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YfV+dFFWxaAmjKgGZbxhOlXmxOzC0zReiVvOe/Up0ZY=;
 b=6xtLiZxyUVa+gFriBtoBzcc1aIwRCh7S1JLbgppgkSu91JpaDRM0sqXrv59XTVOAz3mnQ5
 t+owGr9L12L7VqDw==
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Gleixner <tglx@linutronix.de>,
 Mike Galbraith <umgwanakikbuti@gmail.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH 2/8] drm/i915: Don't disable interrupts on PREEMPT_RT during
 atomic updates
Date: Tue,  5 Oct 2021 17:00:40 +0200
Message-Id: <20211005150046.1000285-3-bigeasy@linutronix.de>
In-Reply-To: <20211005150046.1000285-1-bigeasy@linutronix.de>
References: <20211005150046.1000285-1-bigeasy@linutronix.de>
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
2.33.0

