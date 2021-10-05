Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 050FF422BAF
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 17:01:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AFE26E426;
	Tue,  5 Oct 2021 15:00:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57F926E41A;
 Tue,  5 Oct 2021 15:00:52 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1633446050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KGOHgEg6zOc+ktHgP1xCUtyqOQRBeXSFzpWKz5/h0P0=;
 b=PVfRincpG2pgJfTsNzOv9bS50RWZIM3Tf/B3AoKOgstGS8e5odJFMCXln58pReuP03iRt+
 8hK3rNd4tqp1MWrdGdYH7w+STFNkEqH6ltKCCsEjw3jBh9MPHypCeqiUAvb3+ZmbbyHict
 AsKhREdnhFWXfGdpYLBnjJH5u396N69+s16U55LXwOSad9tKAoBKMEIq1kE5vp6OFYKWvc
 Cc6icxdCZLq/ZkPUSn+mREZ0UFFh6rEyBke6e9CiuTzebhAWSEcSgUe08FYY25yqPOdman
 SqGS6tkRDUuVTcsvTrNrpW7sAzr9WpI3frFIHnEvzTGrYjUAOlaTDCS0O+MWWQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1633446050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KGOHgEg6zOc+ktHgP1xCUtyqOQRBeXSFzpWKz5/h0P0=;
 b=tdSW9qPSD4YuyfshaVt8t7PmyTgR4vOSGQMhEIhYuvTxBqaX6Do4SNteuap277CW7YBGP7
 udZQPaU9Jhc5vCDg==
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Gleixner <tglx@linutronix.de>,
 Mike Galbraith <umgwanakikbuti@gmail.com>,
 Mario Kleiner <mario.kleiner.de@gmail.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH 1/8] drm/i915: Use preempt_disable/enable_rt() where
 recommended
Date: Tue,  5 Oct 2021 17:00:39 +0200
Message-Id: <20211005150046.1000285-2-bigeasy@linutronix.de>
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

Mario Kleiner suggest in commit
  ad3543ede630f ("drm/intel: Push get_scanout_position() timestamping into =
kms driver.")

a spots where preemption should be disabled on PREEMPT_RT. The
difference is that on PREEMPT_RT the intel_uncore::lock disables neither
preemption nor interrupts and so region remains preemptible.

The area covers only register reads and writes. The part that worries me
is:
- __intel_get_crtc_scanline() the worst case is 100us if no match is
  found.

- intel_crtc_scanlines_since_frame_timestamp() not sure how long this
  may take in the worst case.

It was in the RT queue for a while and nobody complained.
Disable preemption on PREEPMPT_RT during timestamping.

[bigeasy: patch description.]

Cc: Mario Kleiner <mario.kleiner.de@gmail.com>
Signed-off-by: Mike Galbraith <umgwanakikbuti@gmail.com>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/gpu/drm/i915/i915_irq.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_ir=
q.c
index 9bc4f4a8e12ec..547347241a47c 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -886,7 +886,8 @@ static bool i915_get_crtc_scanoutpos(struct drm_crtc *_=
crtc,
 	 */
 	spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
=20
-	/* preempt_disable_rt() should go right here in PREEMPT_RT patchset. */
+	if (IS_ENABLED(CONFIG_PREEMPT_RT))
+		preempt_disable();
=20
 	/* Get optional system timestamp before query. */
 	if (stime)
@@ -950,7 +951,8 @@ static bool i915_get_crtc_scanoutpos(struct drm_crtc *_=
crtc,
 	if (etime)
 		*etime =3D ktime_get();
=20
-	/* preempt_enable_rt() should go right here in PREEMPT_RT patchset. */
+	if (IS_ENABLED(CONFIG_PREEMPT_RT))
+		preempt_enable();
=20
 	spin_unlock_irqrestore(&dev_priv->uncore.lock, irqflags);
=20
--=20
2.33.0

