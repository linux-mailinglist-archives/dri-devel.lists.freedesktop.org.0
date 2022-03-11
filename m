Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B644D6194
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 13:30:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5625C10E963;
	Fri, 11 Mar 2022 12:30:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FC2410E960;
 Fri, 11 Mar 2022 12:30:47 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1647001845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gkQTxifYO4nWAVBPlK2Awg3pOkGqaJVi+lQhRbTjqO8=;
 b=jC4HmJ+RMhekLXLhGcDtc84DkBCP6STQrMimm/Cn6m9EibhZr45GybSHxxsY4Okc5H1LHp
 WW9cr9bXmwEQf63J9jWVPTUlxAZrWBQ+W31ou+A0GqisapTj2utofyLAy9l2Qi8EOemIYX
 /qWTALo7glKUVxop9LT9kelcs99ItppC5cAOv0QbimdL95B+VzoRMlGh60Un+LI34H1m+3
 4t+w8H3/ItZ3Yval0uK3tcoKJS7zcHGXb7p4kF23tYd3UYLrwPlCeg+afZJRIKzqeAeqir
 dZjSjqXQRXDcorBNzr8FYXYPkajazj4TLOa5R1HC6zO2kcVM21X4iqBtIv6dqg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1647001845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gkQTxifYO4nWAVBPlK2Awg3pOkGqaJVi+lQhRbTjqO8=;
 b=GksLAj8S6yREdGoCwS2ApnRiNHZaySoE4aKHEqibOxvI+xj6ZtFfsq4YpraHEcyw7SYo5Z
 X0BNoPiPEucJIvBg==
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/i915: Drop the irqs_disabled() check
Date: Fri, 11 Mar 2022 13:30:32 +0100
Message-Id: <20220311123032.4078431-3-bigeasy@linutronix.de>
In-Reply-To: <20220311123032.4078431-1-bigeasy@linutronix.de>
References: <20220311123032.4078431-1-bigeasy@linutronix.de>
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Gleixner <tglx@linutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The !irqs_disabled() check triggers on PREEMPT_RT even with
i915_sched_engine::lock acquired. The reason is the lock is transformed
into a sleeping lock on PREEMPT_RT and does not disable interrupts.

There is no need to check for disabled interrupts. The lockdep
annotation below already check if the lock has been acquired by the
caller and will yell if the interrupts are not disabled.

Remove the !irqs_disabled() check.

Reported-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/gpu/drm/i915/i915_request.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i91=
5_request.c
index 76cf5ac91e946..41d7c1071ab52 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -583,7 +583,6 @@ bool __i915_request_submit(struct i915_request *request)
=20
 	RQ_TRACE(request, "\n");
=20
-	GEM_BUG_ON(!irqs_disabled());
 	lockdep_assert_held(&engine->sched_engine->lock);
=20
 	/*
@@ -692,7 +691,6 @@ void __i915_request_unsubmit(struct i915_request *reque=
st)
 	 */
 	RQ_TRACE(request, "\n");
=20
-	GEM_BUG_ON(!irqs_disabled());
 	lockdep_assert_held(&engine->sched_engine->lock);
=20
 	/*
--=20
2.35.1

