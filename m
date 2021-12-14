Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE9247444A
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 15:03:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8744210E4C6;
	Tue, 14 Dec 2021 14:03:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A627210E455;
 Tue, 14 Dec 2021 14:03:11 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1639490589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ojUQOHApDdOULcoyUp+VYtjZvFRJbzhx7Iz5Y5kJCcY=;
 b=NevLdg4+xQ8xysT7CQWBdF4L5YJ1/ZOeNm08mMS8DHmpakVm1zLJNqvSndg65UIH5dTJ7P
 W1d6E8sv+94reRTTX9U5moA5NLYW+C9WO4XYytTvoha7cpB+dyeFjS6ToobN5Mhzw22CWX
 S4n9rB+3uJEA/ZpSjnXXKFgKYqYXaIA8ee0cYRIjy5NMkNuDgFhmU803mQMpLOQIO2ZrMT
 M+7t3ox3WpwlcpeD2U8/ygMyQg1UxDgaVSNpH9whzBHq9Lv+glSE7RuvTvV2JQiDYL51td
 RGoFl2LmtvvoMvWfX3B22jegRX5YaYhLYJmHaCTvxGxd8MgITci8EFMd+nDoYA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1639490589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ojUQOHApDdOULcoyUp+VYtjZvFRJbzhx7Iz5Y5kJCcY=;
 b=qIoK8soBTdFdIXS2U93x/AssrK/xG0zvxwyP+bPmApVCK+LjWGJC+62QptRY0VL1Xlya9A
 g2KjS3ih2m/5PVAg==
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 4/8] drm/i915: Use preempt_disable/enable_rt() where
 recommended
Date: Tue, 14 Dec 2021 15:02:57 +0100
Message-Id: <20211214140301.520464-5-bigeasy@linutronix.de>
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
index 038a9ec563c10..8e9ff0bcbc7e4 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -916,7 +916,8 @@ static bool i915_get_crtc_scanoutpos(struct drm_crtc *_=
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
@@ -980,7 +981,8 @@ static bool i915_get_crtc_scanoutpos(struct drm_crtc *_=
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
2.34.1

