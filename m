Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9559A42433E
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 18:46:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DD666E52A;
	Wed,  6 Oct 2021 16:46:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1974D6E52A;
 Wed,  6 Oct 2021 16:46:32 +0000 (UTC)
Date: Wed, 6 Oct 2021 18:46:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1633538789;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ORoqEjyicogo7BwJyGqnCebtlkeSfFW/6IOxRJP0his=;
 b=BfaS23Im1JKgh5fTXWL9FvoByF7vhWh1eVbhnz4vGXUw4+v+1zg4/RE2uFkgUFp9TeoVh5
 fAVTZeY3rDBjudod0tUf+plf1XVgYNcZXHszQRh1/pbqWUkHdE57Wns+5vKtk1dUrU6unR
 yJndEjZUGb5AZM7anDaCMrT/dZ4ZjWiUAbuXYCf/kX977XH6scao/T9+bV5E09erStSsw/
 KnDEde32dVOk32CEUREbUwtsB7o9jPOoWDhAAaBOr2Z3k4jy9PYOHFeA1KUrUTOnxvou1b
 lf6CYIWciAdV2itFDkd0ROOTxeQYifAmmKV1D6ZHUnJyxbxFBSu/KT8bDg0uwA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1633538789;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ORoqEjyicogo7BwJyGqnCebtlkeSfFW/6IOxRJP0his=;
 b=EGtQS45TOZ9EB5V9OQ6WDtZW4eb5hP2qKWKYMPMYxc/zAnu9SsMaeAv2oLtl0jAci/fJR/
 Zbu8RtBz4Nc5jLBA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Gleixner <tglx@linutronix.de>, Luca Abeni <lucabe72@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 3/8] drm/i915: Disable tracing points on PREEMPT_RT
Message-ID: <20211006164628.s2mtsdd2jdbfyf7g@linutronix.de>
References: <20211005150046.1000285-1-bigeasy@linutronix.de>
 <20211005150046.1000285-4-bigeasy@linutronix.de>
 <YV1tm8bNEBbPeU6/@intel.com>
 <20211006101519.ffwg7u7epzl7dedl@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211006101519.ffwg7u7epzl7dedl@linutronix.de>
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

On 2021-10-06 12:15:21 [+0200], To Ville Syrj=C3=A4l=C3=A4 wrote:
> On 2021-10-06 12:34:19 [+0300], Ville Syrj=C3=A4l=C3=A4 wrote:
> > I think the correct answer is to make uncore.lock a raw_spinlock.
> > Without the tracepoints deubgging any of this is stuff pretty much
> > impossible. We also take that lock a lot.
>=20
> Let me check if that works.

Turned the uncore.lock into raw_spinlock_t, the debug.lock as well because =
it
nests inside the former. Also intel_uncore_forcewake_domain::timer fires
now in hardirq since it almost only acquires the uncore.lock.
What worries me a little is the fw_domain_wait_ack_clear() /
wait_ack_clear() which spin-waits up a whole ms.
__gen6_gt_wait_for_thread_c0() has a 5ms limit and wait_ack_clear() has
50ms as upper limit. I know that it does not usually take long and if it
takes that long than it is an error most likely but still...
The full patch at the end of the email.

Now. Before that patch:

| T: 0 ( 1179) P:90 I:250 C: 182450 Min:      2 Act:    6 Avg:    5 Max:   =
   21
| T: 1 ( 1180) P:90 I:250 C: 182437 Min:      2 Act:    6 Avg:    5 Max:   =
   22
| T: 2 ( 1181) P:90 I:250 C: 182423 Min:      2 Act:    6 Avg:    5 Max:   =
   23
| T: 3 ( 1182) P:90 I:250 C: 182401 Min:      2 Act:    6 Avg:    5 Max:   =
   21
| T: 4 ( 1183) P:90 I:250 C: 182394 Min:      2 Act:    7 Avg:    5 Max:   =
   27
| T: 5 ( 1184) P:90 I:250 C: 182381 Min:      2 Act:    6 Avg:    5 Max:   =
   22
| T: 6 ( 1185) P:90 I:250 C: 182368 Min:      3 Act:    6 Avg:    5 Max:   =
   23
| T: 7 ( 1186) P:90 I:250 C: 182356 Min:      2 Act:    8 Avg:    5 Max:   =
   22

after:

| T: 0 ( 1183) P:90 I:250 C:1022143 Min:      3 Act:    3 Avg:    4 Max:   =
   47
| T: 1 ( 1184) P:90 I:250 C:1022125 Min:      2 Act:    3 Avg:    4 Max:   =
   51
| T: 2 ( 1185) P:90 I:250 C:1022110 Min:      2 Act:    5 Avg:    4 Max:   =
   52
| T: 3 ( 1186) P:90 I:250 C:1022089 Min:      2 Act:    3 Avg:    4 Max:   =
   52
| T: 4 ( 1187) P:90 I:250 C:1022083 Min:      2 Act:    3 Avg:    4 Max:   =
   51
| T: 5 ( 1188) P:90 I:250 C:1022070 Min:      3 Act:    3 Avg:    4 Max:   =
   50
| T: 6 ( 1189) P:90 I:250 C:1022058 Min:      3 Act:    5 Avg:    4 Max:   =
   46
| T: 7 ( 1190) P:90 I:250 C:1022045 Min:      2 Act:    3 Avg:    4 Max:   =
   51

This is cyclictest output. A little explanation:
T: means thread number. There is one thread pinned to each CPU so I have
8 CPUs. This is an i7 SandyBridge so 4 cores + hyperthread with a
built-in i915 (INTEL_SNB_D_GT1_IDS).

Max: is the maximal observed latency in us. The program fires a timer
every 250us and measures the latency between the programmed time and
now. Since it is the thread with the highest priority in the system it
should be scheduled right away. Unless there is a
preempt-disable/IRQ-off section somewhere.

I did the same test in both cases: started a video hoping for some HW
acceleration and skipped forward / backwards in the clip a few times. As
soon as I start jumping in the video the latencies rise. I don't observe
it without the patch.
The system is idle otherwise. If you have other tests in mind which put
more / different load on the system, I'm all yours. I'm mostly curious
how bad can it get.=20

Sebastian

diff --git a/drivers/gpu/drm/i915/display/i9xx_plane.c b/drivers/gpu/drm/i9=
15/display/i9xx_plane.c
index b1439ba78f67b..6f2cab95d8646 100644
--- a/drivers/gpu/drm/i915/display/i9xx_plane.c
+++ b/drivers/gpu/drm/i915/display/i9xx_plane.c
@@ -444,7 +444,7 @@ static void i9xx_update_plane(struct intel_plane *plane,
 	else
 		dspaddr_offset =3D linear_offset;
=20
-	spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
+	raw_spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
=20
 	intel_de_write_fw(dev_priv, DSPSTRIDE(i9xx_plane),
 			  plane_state->view.color_plane[0].stride);
@@ -490,7 +490,7 @@ static void i9xx_update_plane(struct intel_plane *plane,
 		intel_de_write_fw(dev_priv, DSPADDR(i9xx_plane),
 				  intel_plane_ggtt_offset(plane_state) + dspaddr_offset);
=20
-	spin_unlock_irqrestore(&dev_priv->uncore.lock, irqflags);
+	raw_spin_unlock_irqrestore(&dev_priv->uncore.lock, irqflags);
 }
=20
 static void i9xx_disable_plane(struct intel_plane *plane,
@@ -513,7 +513,7 @@ static void i9xx_disable_plane(struct intel_plane *plan=
e,
 	 */
 	dspcntr =3D i9xx_plane_ctl_crtc(crtc_state);
=20
-	spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
+	raw_spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
=20
 	intel_de_write_fw(dev_priv, DSPCNTR(i9xx_plane), dspcntr);
 	if (DISPLAY_VER(dev_priv) >=3D 4)
@@ -521,7 +521,7 @@ static void i9xx_disable_plane(struct intel_plane *plan=
e,
 	else
 		intel_de_write_fw(dev_priv, DSPADDR(i9xx_plane), 0);
=20
-	spin_unlock_irqrestore(&dev_priv->uncore.lock, irqflags);
+	raw_spin_unlock_irqrestore(&dev_priv->uncore.lock, irqflags);
 }
=20
 static void
@@ -539,11 +539,11 @@ g4x_primary_async_flip(struct intel_plane *plane,
 	if (async_flip)
 		dspcntr |=3D DISPPLANE_ASYNC_FLIP;
=20
-	spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
+	raw_spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
 	intel_de_write_fw(dev_priv, DSPCNTR(i9xx_plane), dspcntr);
 	intel_de_write_fw(dev_priv, DSPSURF(i9xx_plane),
 			  intel_plane_ggtt_offset(plane_state) + dspaddr_offset);
-	spin_unlock_irqrestore(&dev_priv->uncore.lock, irqflags);
+	raw_spin_unlock_irqrestore(&dev_priv->uncore.lock, irqflags);
 }
=20
 static void
@@ -557,10 +557,10 @@ vlv_primary_async_flip(struct intel_plane *plane,
 	enum i9xx_plane_id i9xx_plane =3D plane->i9xx_plane;
 	unsigned long irqflags;
=20
-	spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
+	raw_spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
 	intel_de_write_fw(dev_priv, DSPADDR_VLV(i9xx_plane),
 			  intel_plane_ggtt_offset(plane_state) + dspaddr_offset);
-	spin_unlock_irqrestore(&dev_priv->uncore.lock, irqflags);
+	raw_spin_unlock_irqrestore(&dev_priv->uncore.lock, irqflags);
 }
=20
 static void
diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/=
i915/display/intel_cursor.c
index c7618fef01439..0ce998dbe1a27 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -274,7 +274,7 @@ static void i845_update_cursor(struct intel_plane *plan=
e,
 		pos =3D intel_cursor_position(plane_state);
 	}
=20
-	spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
+	raw_spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
=20
 	/* On these chipsets we can only modify the base/size/stride
 	 * whilst the cursor is disabled.
@@ -295,7 +295,7 @@ static void i845_update_cursor(struct intel_plane *plan=
e,
 		intel_de_write_fw(dev_priv, CURPOS(PIPE_A), pos);
 	}
=20
-	spin_unlock_irqrestore(&dev_priv->uncore.lock, irqflags);
+	raw_spin_unlock_irqrestore(&dev_priv->uncore.lock, irqflags);
 }
=20
 static void i845_disable_cursor(struct intel_plane *plane,
@@ -511,7 +511,7 @@ static void i9xx_update_cursor(struct intel_plane *plan=
e,
 		pos =3D intel_cursor_position(plane_state);
 	}
=20
-	spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
+	raw_spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
=20
 	/*
 	 * On some platforms writing CURCNTR first will also
@@ -557,7 +557,7 @@ static void i9xx_update_cursor(struct intel_plane *plan=
e,
 		intel_de_write_fw(dev_priv, CURBASE(pipe), base);
 	}
=20
-	spin_unlock_irqrestore(&dev_priv->uncore.lock, irqflags);
+	raw_spin_unlock_irqrestore(&dev_priv->uncore.lock, irqflags);
 }
=20
 static void i9xx_disable_cursor(struct intel_plane *plane,
diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i91=
5/display/intel_fbc.c
index ddfc17e21668a..682493f336451 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -212,10 +212,10 @@ static void i8xx_fbc_recompress(struct drm_i915_priva=
te *dev_priv)
 	struct intel_fbc_reg_params *params =3D &dev_priv->fbc.params;
 	enum i9xx_plane_id i9xx_plane =3D params->crtc.i9xx_plane;
=20
-	spin_lock_irq(&dev_priv->uncore.lock);
+	raw_spin_lock_irq(&dev_priv->uncore.lock);
 	intel_de_write_fw(dev_priv, DSPADDR(i9xx_plane),
 			  intel_de_read_fw(dev_priv, DSPADDR(i9xx_plane)));
-	spin_unlock_irq(&dev_priv->uncore.lock);
+	raw_spin_unlock_irq(&dev_priv->uncore.lock);
 }
=20
 static void i965_fbc_recompress(struct drm_i915_private *dev_priv)
@@ -223,10 +223,10 @@ static void i965_fbc_recompress(struct drm_i915_priva=
te *dev_priv)
 	struct intel_fbc_reg_params *params =3D &dev_priv->fbc.params;
 	enum i9xx_plane_id i9xx_plane =3D params->crtc.i9xx_plane;
=20
-	spin_lock_irq(&dev_priv->uncore.lock);
+	raw_spin_lock_irq(&dev_priv->uncore.lock);
 	intel_de_write_fw(dev_priv, DSPSURF(i9xx_plane),
 			  intel_de_read_fw(dev_priv, DSPSURF(i9xx_plane)));
-	spin_unlock_irq(&dev_priv->uncore.lock);
+	raw_spin_unlock_irq(&dev_priv->uncore.lock);
 }
=20
 /* This function forces a CFB recompression through the nuke operation. */
diff --git a/drivers/gpu/drm/i915/display/intel_sprite.c b/drivers/gpu/drm/=
i915/display/intel_sprite.c
index 08116f41da26a..ab98ce1b05e22 100644
--- a/drivers/gpu/drm/i915/display/intel_sprite.c
+++ b/drivers/gpu/drm/i915/display/intel_sprite.c
@@ -444,7 +444,7 @@ vlv_update_plane(struct intel_plane *plane,
=20
 	linear_offset =3D intel_fb_xy_to_linear(x, y, plane_state, 0);
=20
-	spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
+	raw_spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
=20
 	intel_de_write_fw(dev_priv, SPSTRIDE(pipe, plane_id),
 			  plane_state->view.color_plane[0].stride);
@@ -481,7 +481,7 @@ vlv_update_plane(struct intel_plane *plane,
 	vlv_update_clrc(plane_state);
 	vlv_update_gamma(plane_state);
=20
-	spin_unlock_irqrestore(&dev_priv->uncore.lock, irqflags);
+	raw_spin_unlock_irqrestore(&dev_priv->uncore.lock, irqflags);
 }
=20
 static void
@@ -493,12 +493,12 @@ vlv_disable_plane(struct intel_plane *plane,
 	enum plane_id plane_id =3D plane->id;
 	unsigned long irqflags;
=20
-	spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
+	raw_spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
=20
 	intel_de_write_fw(dev_priv, SPCNTR(pipe, plane_id), 0);
 	intel_de_write_fw(dev_priv, SPSURF(pipe, plane_id), 0);
=20
-	spin_unlock_irqrestore(&dev_priv->uncore.lock, irqflags);
+	raw_spin_unlock_irqrestore(&dev_priv->uncore.lock, irqflags);
 }
=20
 static bool
@@ -868,7 +868,7 @@ ivb_update_plane(struct intel_plane *plane,
=20
 	linear_offset =3D intel_fb_xy_to_linear(x, y, plane_state, 0);
=20
-	spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
+	raw_spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
=20
 	intel_de_write_fw(dev_priv, SPRSTRIDE(pipe),
 			  plane_state->view.color_plane[0].stride);
@@ -904,7 +904,7 @@ ivb_update_plane(struct intel_plane *plane,
=20
 	ivb_update_gamma(plane_state);
=20
-	spin_unlock_irqrestore(&dev_priv->uncore.lock, irqflags);
+	raw_spin_unlock_irqrestore(&dev_priv->uncore.lock, irqflags);
 }
=20
 static void
@@ -915,7 +915,7 @@ ivb_disable_plane(struct intel_plane *plane,
 	enum pipe pipe =3D plane->pipe;
 	unsigned long irqflags;
=20
-	spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
+	raw_spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
=20
 	intel_de_write_fw(dev_priv, SPRCTL(pipe), 0);
 	/* Disable the scaler */
@@ -923,7 +923,7 @@ ivb_disable_plane(struct intel_plane *plane,
 		intel_de_write_fw(dev_priv, SPRSCALE(pipe), 0);
 	intel_de_write_fw(dev_priv, SPRSURF(pipe), 0);
=20
-	spin_unlock_irqrestore(&dev_priv->uncore.lock, irqflags);
+	raw_spin_unlock_irqrestore(&dev_priv->uncore.lock, irqflags);
 }
=20
 static bool
@@ -1196,7 +1196,7 @@ g4x_update_plane(struct intel_plane *plane,
=20
 	linear_offset =3D intel_fb_xy_to_linear(x, y, plane_state, 0);
=20
-	spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
+	raw_spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
=20
 	intel_de_write_fw(dev_priv, DVSSTRIDE(pipe),
 			  plane_state->view.color_plane[0].stride);
@@ -1228,7 +1228,7 @@ g4x_update_plane(struct intel_plane *plane,
 	else
 		ilk_update_gamma(plane_state);
=20
-	spin_unlock_irqrestore(&dev_priv->uncore.lock, irqflags);
+	raw_spin_unlock_irqrestore(&dev_priv->uncore.lock, irqflags);
 }
=20
 static void
@@ -1239,14 +1239,14 @@ g4x_disable_plane(struct intel_plane *plane,
 	enum pipe pipe =3D plane->pipe;
 	unsigned long irqflags;
=20
-	spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
+	raw_spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
=20
 	intel_de_write_fw(dev_priv, DVSCNTR(pipe), 0);
 	/* Disable the scaler */
 	intel_de_write_fw(dev_priv, DVSSCALE(pipe), 0);
 	intel_de_write_fw(dev_priv, DVSSURF(pipe), 0);
=20
-	spin_unlock_irqrestore(&dev_priv->uncore.lock, irqflags);
+	raw_spin_unlock_irqrestore(&dev_priv->uncore.lock, irqflags);
 }
=20
 static bool
diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i9=
15/display/skl_scaler.c
index 37eabeff8197f..9c6923d19665d 100644
--- a/drivers/gpu/drm/i915/display/skl_scaler.c
+++ b/drivers/gpu/drm/i915/display/skl_scaler.c
@@ -433,7 +433,7 @@ void skl_pfit_enable(const struct intel_crtc_state *crt=
c_state)
 	ps_ctrl =3D skl_scaler_get_filter_select(crtc_state->hw.scaling_filter, 0=
);
 	ps_ctrl |=3D  PS_SCALER_EN | scaler_state->scalers[id].mode;
=20
-	spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
+	raw_spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
=20
 	skl_scaler_setup_filter(dev_priv, pipe, id, 0,
 				crtc_state->hw.scaling_filter);
@@ -449,7 +449,7 @@ void skl_pfit_enable(const struct intel_crtc_state *crt=
c_state)
 	intel_de_write_fw(dev_priv, SKL_PS_WIN_SZ(pipe, id),
 			  width << 16 | height);
=20
-	spin_unlock_irqrestore(&dev_priv->uncore.lock, irqflags);
+	raw_spin_unlock_irqrestore(&dev_priv->uncore.lock, irqflags);
 }
=20
 void
@@ -520,13 +520,13 @@ static void skl_detach_scaler(struct intel_crtc *crtc=
, int id)
 	struct drm_i915_private *dev_priv =3D to_i915(dev);
 	unsigned long irqflags;
=20
-	spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
+	raw_spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
=20
 	intel_de_write_fw(dev_priv, SKL_PS_CTRL(crtc->pipe, id), 0);
 	intel_de_write_fw(dev_priv, SKL_PS_WIN_POS(crtc->pipe, id), 0);
 	intel_de_write_fw(dev_priv, SKL_PS_WIN_SZ(crtc->pipe, id), 0);
=20
-	spin_unlock_irqrestore(&dev_priv->uncore.lock, irqflags);
+	raw_spin_unlock_irqrestore(&dev_priv->uncore.lock, irqflags);
 }
=20
 /*
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/g=
pu/drm/i915/display/skl_universal_plane.c
index 724e7b04f3b63..81243bca715e5 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -649,7 +649,7 @@ skl_disable_plane(struct intel_plane *plane,
 	enum pipe pipe =3D plane->pipe;
 	unsigned long irqflags;
=20
-	spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
+	raw_spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
=20
 	if (icl_is_hdr_plane(dev_priv, plane_id))
 		intel_de_write_fw(dev_priv, PLANE_CUS_CTL(pipe, plane_id), 0);
@@ -659,7 +659,7 @@ skl_disable_plane(struct intel_plane *plane,
 	intel_de_write_fw(dev_priv, PLANE_CTL(pipe, plane_id), 0);
 	intel_de_write_fw(dev_priv, PLANE_SURF(pipe, plane_id), 0);
=20
-	spin_unlock_irqrestore(&dev_priv->uncore.lock, irqflags);
+	raw_spin_unlock_irqrestore(&dev_priv->uncore.lock, irqflags);
 }
=20
 static bool
@@ -1056,7 +1056,7 @@ skl_program_plane(struct intel_plane *plane,
 			aux_dist |=3D skl_plane_stride(plane_state, aux_plane);
 	}
=20
-	spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
+	raw_spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
=20
 	intel_de_write_fw(dev_priv, PLANE_STRIDE(pipe, plane_id), stride);
 	intel_de_write_fw(dev_priv, PLANE_POS(pipe, plane_id),
@@ -1116,7 +1116,7 @@ skl_program_plane(struct intel_plane *plane,
 	intel_de_write_fw(dev_priv, PLANE_SURF(pipe, plane_id),
 			  intel_plane_ggtt_offset(plane_state) + surf_addr);
=20
-	spin_unlock_irqrestore(&dev_priv->uncore.lock, irqflags);
+	raw_spin_unlock_irqrestore(&dev_priv->uncore.lock, irqflags);
 }
=20
 static void
@@ -1137,13 +1137,13 @@ skl_plane_async_flip(struct intel_plane *plane,
 	if (async_flip)
 		plane_ctl |=3D PLANE_CTL_ASYNC_FLIP;
=20
-	spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
+	raw_spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
=20
 	intel_de_write_fw(dev_priv, PLANE_CTL(pipe, plane_id), plane_ctl);
 	intel_de_write_fw(dev_priv, PLANE_SURF(pipe, plane_id),
 			  intel_plane_ggtt_offset(plane_state) + surf_addr);
=20
-	spin_unlock_irqrestore(&dev_priv->uncore.lock, irqflags);
+	raw_spin_unlock_irqrestore(&dev_priv->uncore.lock, irqflags);
 }
=20
 static void
diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt=
/intel_ggtt.c
index de3ac58fceec3..7527937c9b131 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
@@ -152,10 +152,10 @@ void gen6_ggtt_invalidate(struct i915_ggtt *ggtt)
 {
 	struct intel_uncore *uncore =3D ggtt->vm.gt->uncore;
=20
-	spin_lock_irq(&uncore->lock);
+	raw_spin_lock_irq(&uncore->lock);
 	intel_uncore_write_fw(uncore, GFX_FLSH_CNTL_GEN6, GFX_FLSH_CNTL_EN);
 	intel_uncore_read_fw(uncore, GFX_FLSH_CNTL_GEN6);
-	spin_unlock_irq(&uncore->lock);
+	raw_spin_unlock_irq(&uncore->lock);
 }
=20
 static void gen8_ggtt_invalidate(struct i915_ggtt *ggtt)
diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/i=
ntel_gt.c
index 62d40c9866427..a4d93e7acbded 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -416,10 +416,10 @@ void intel_gt_flush_ggtt_writes(struct intel_gt *gt)
 	with_intel_runtime_pm_if_in_use(uncore->rpm, wakeref) {
 		unsigned long flags;
=20
-		spin_lock_irqsave(&uncore->lock, flags);
+		raw_spin_lock_irqsave(&uncore->lock, flags);
 		intel_uncore_posting_read_fw(uncore,
 					     RING_HEAD(RENDER_RING_BASE));
-		spin_unlock_irqrestore(&uncore->lock, flags);
+		raw_spin_unlock_irqrestore(&uncore->lock, flags);
 	}
 }
=20
diff --git a/drivers/gpu/drm/i915/gt/intel_rc6.c b/drivers/gpu/drm/i915/gt/=
intel_rc6.c
index 799d382eea799..f27b44ea56be1 100644
--- a/drivers/gpu/drm/i915/gt/intel_rc6.c
+++ b/drivers/gpu/drm/i915/gt/intel_rc6.c
@@ -751,7 +751,7 @@ u64 intel_rc6_residency_ns(struct intel_rc6 *rc6, const=
 i915_reg_t reg)
=20
 	fw_domains =3D intel_uncore_forcewake_for_reg(uncore, reg, FW_REG_READ);
=20
-	spin_lock_irqsave(&uncore->lock, flags);
+	raw_spin_lock_irqsave(&uncore->lock, flags);
 	intel_uncore_forcewake_get__locked(uncore, fw_domains);
=20
 	/* On VLV and CHV, residency time is in CZ units rather than 1.28us */
@@ -794,7 +794,7 @@ u64 intel_rc6_residency_ns(struct intel_rc6 *rc6, const=
 i915_reg_t reg)
 	rc6->cur_residency[i] =3D time_hw;
=20
 	intel_uncore_forcewake_put__locked(uncore, fw_domains);
-	spin_unlock_irqrestore(&uncore->lock, flags);
+	raw_spin_unlock_irqrestore(&uncore->lock, flags);
=20
 	return mul_u64_u32_div(time_hw, mul, div);
 }
diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/=
i915/gt/intel_workarounds.c
index aae609d7d85dd..ced21d60a6153 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -1255,7 +1255,7 @@ wa_list_apply(struct intel_gt *gt, const struct i915_=
wa_list *wal)
=20
 	fw =3D wal_get_fw_for_rmw(uncore, wal);
=20
-	spin_lock_irqsave(&uncore->lock, flags);
+	raw_spin_lock_irqsave(&uncore->lock, flags);
 	intel_uncore_forcewake_get__locked(uncore, fw);
=20
 	for (i =3D 0, wa =3D wal->list; i < wal->count; i++, wa++) {
@@ -1273,7 +1273,7 @@ wa_list_apply(struct intel_gt *gt, const struct i915_=
wa_list *wal)
 	}
=20
 	intel_uncore_forcewake_put__locked(uncore, fw);
-	spin_unlock_irqrestore(&uncore->lock, flags);
+	raw_spin_unlock_irqrestore(&uncore->lock, flags);
 }
=20
 void intel_gt_apply_workarounds(struct intel_gt *gt)
@@ -1294,7 +1294,7 @@ static bool wa_list_verify(struct intel_gt *gt,
=20
 	fw =3D wal_get_fw_for_rmw(uncore, wal);
=20
-	spin_lock_irqsave(&uncore->lock, flags);
+	raw_spin_lock_irqsave(&uncore->lock, flags);
 	intel_uncore_forcewake_get__locked(uncore, fw);
=20
 	for (i =3D 0, wa =3D wal->list; i < wal->count; i++, wa++)
@@ -1303,7 +1303,7 @@ static bool wa_list_verify(struct intel_gt *gt,
 				wal->name, from);
=20
 	intel_uncore_forcewake_put__locked(uncore, fw);
-	spin_unlock_irqrestore(&uncore->lock, flags);
+	raw_spin_unlock_irqrestore(&uncore->lock, flags);
=20
 	return ok;
 }
diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_ir=
q.c
index 547347241a47c..5833f42eef953 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -678,7 +678,7 @@ u32 i915_get_vblank_counter(struct drm_crtc *crtc)
 	high_frame =3D PIPEFRAME(pipe);
 	low_frame =3D PIPEFRAMEPIXEL(pipe);
=20
-	spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
+	raw_spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
=20
 	/*
 	 * High & low register fields aren't synchronized, so make sure
@@ -691,7 +691,7 @@ u32 i915_get_vblank_counter(struct drm_crtc *crtc)
 		high2 =3D intel_de_read_fw(dev_priv, high_frame) & PIPE_FRAME_HIGH_MASK;
 	} while (high1 !=3D high2);
=20
-	spin_unlock_irqrestore(&dev_priv->uncore.lock, irqflags);
+	raw_spin_unlock_irqrestore(&dev_priv->uncore.lock, irqflags);
=20
 	high1 >>=3D PIPE_FRAME_HIGH_SHIFT;
 	pixel =3D low & PIPE_PIXEL_MASK;
@@ -884,10 +884,7 @@ static bool i915_get_crtc_scanoutpos(struct drm_crtc *=
_crtc,
 	 * register reads, potentially with preemption disabled, so the
 	 * following code must not block on uncore.lock.
 	 */
-	spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
-
-	if (IS_ENABLED(CONFIG_PREEMPT_RT))
-		preempt_disable();
+	raw_spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
=20
 	/* Get optional system timestamp before query. */
 	if (stime)
@@ -951,10 +948,7 @@ static bool i915_get_crtc_scanoutpos(struct drm_crtc *=
_crtc,
 	if (etime)
 		*etime =3D ktime_get();
=20
-	if (IS_ENABLED(CONFIG_PREEMPT_RT))
-		preempt_enable();
-
-	spin_unlock_irqrestore(&dev_priv->uncore.lock, irqflags);
+	raw_spin_unlock_irqrestore(&dev_priv->uncore.lock, irqflags);
=20
 	/*
 	 * While in vblank, position will be negative
@@ -992,9 +986,9 @@ int intel_get_crtc_scanline(struct intel_crtc *crtc)
 	unsigned long irqflags;
 	int position;
=20
-	spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
+	raw_spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
 	position =3D __intel_get_crtc_scanline(crtc);
-	spin_unlock_irqrestore(&dev_priv->uncore.lock, irqflags);
+	raw_spin_unlock_irqrestore(&dev_priv->uncore.lock, irqflags);
=20
 	return position;
 }
diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pm=
u.c
index 0b488d49694ca..31c67eac2bcde 100644
--- a/drivers/gpu/drm/i915/i915_pmu.c
+++ b/drivers/gpu/drm/i915/i915_pmu.c
@@ -344,9 +344,9 @@ engines_sample(struct intel_gt *gt, unsigned int period=
_ns)
 			continue;
=20
 		if (exclusive_mmio_access(i915)) {
-			spin_lock_irqsave(&engine->uncore->lock, flags);
+			raw_spin_lock_irqsave(&engine->uncore->lock, flags);
 			engine_sample(engine, period_ns);
-			spin_unlock_irqrestore(&engine->uncore->lock, flags);
+			raw_spin_unlock_irqrestore(&engine->uncore->lock, flags);
 		} else {
 			engine_sample(engine, period_ns);
 		}
diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel_p=
m.c
index 65bc3709f54c5..c7e1892731110 100644
--- a/drivers/gpu/drm/i915/intel_pm.c
+++ b/drivers/gpu/drm/i915/intel_pm.c
@@ -2009,6 +2009,7 @@ static void vlv_atomic_update_fifo(struct intel_atomi=
c_state *state,
 		&crtc_state->wm.vlv.fifo_state;
 	int sprite0_start, sprite1_start, fifo_size;
 	u32 dsparb, dsparb2, dsparb3;
+	unsigned long flags;
=20
 	if (!crtc_state->fifo_changed)
 		return;
@@ -2031,7 +2032,7 @@ static void vlv_atomic_update_fifo(struct intel_atomi=
c_state *state,
 	 * intel_pipe_update_start() has already disabled interrupts
 	 * for us, so a plain spin_lock() is sufficient here.
 	 */
-	spin_lock(&uncore->lock);
+	raw_spin_lock_irqsave(&uncore->lock, flags);
=20
 	switch (crtc->pipe) {
 	case PIPE_A:
@@ -2091,7 +2092,7 @@ static void vlv_atomic_update_fifo(struct intel_atomi=
c_state *state,
=20
 	intel_uncore_posting_read_fw(uncore, DSPARB);
=20
-	spin_unlock(&uncore->lock);
+	raw_spin_unlock_irqrestore(&uncore->lock, flags);
 }
=20
 #undef VLV_FIFO
diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/int=
el_uncore.c
index 6b38bc2811c1b..97c750605ec02 100644
--- a/drivers/gpu/drm/i915/intel_uncore.c
+++ b/drivers/gpu/drm/i915/intel_uncore.c
@@ -39,7 +39,7 @@
 void
 intel_uncore_mmio_debug_init_early(struct intel_uncore_mmio_debug *mmio_de=
bug)
 {
-	spin_lock_init(&mmio_debug->lock);
+	raw_spin_lock_init(&mmio_debug->lock);
 	mmio_debug->unclaimed_mmio_check =3D 1;
 }
=20
@@ -118,7 +118,7 @@ fw_domain_arm_timer(struct intel_uncore_forcewake_domai=
n *d)
 	hrtimer_start_range_ns(&d->timer,
 			       NSEC_PER_MSEC,
 			       NSEC_PER_MSEC,
-			       HRTIMER_MODE_REL);
+			       HRTIMER_MODE_REL_HARD);
 }
=20
 static inline int
@@ -390,7 +390,7 @@ intel_uncore_fw_release_timer(struct hrtimer *timer)
 	if (xchg(&domain->active, false))
 		return HRTIMER_RESTART;
=20
-	spin_lock_irqsave(&uncore->lock, irqflags);
+	raw_spin_lock_irqsave(&uncore->lock, irqflags);
=20
 	uncore->fw_domains_timer &=3D ~domain->mask;
=20
@@ -398,7 +398,7 @@ intel_uncore_fw_release_timer(struct hrtimer *timer)
 	if (--domain->wake_count =3D=3D 0)
 		uncore->funcs.force_wake_put(uncore, domain->mask);
=20
-	spin_unlock_irqrestore(&uncore->lock, irqflags);
+	raw_spin_unlock_irqrestore(&uncore->lock, irqflags);
=20
 	return HRTIMER_NORESTART;
 }
@@ -431,7 +431,7 @@ intel_uncore_forcewake_reset(struct intel_uncore *uncor=
e)
 			intel_uncore_fw_release_timer(&domain->timer);
 		}
=20
-		spin_lock_irqsave(&uncore->lock, irqflags);
+		raw_spin_lock_irqsave(&uncore->lock, irqflags);
=20
 		for_each_fw_domain(domain, uncore, tmp) {
 			if (hrtimer_active(&domain->timer))
@@ -446,7 +446,7 @@ intel_uncore_forcewake_reset(struct intel_uncore *uncor=
e)
 			break;
 		}
=20
-		spin_unlock_irqrestore(&uncore->lock, irqflags);
+		raw_spin_unlock_irqrestore(&uncore->lock, irqflags);
 		cond_resched();
 	}
=20
@@ -459,7 +459,7 @@ intel_uncore_forcewake_reset(struct intel_uncore *uncor=
e)
 	fw_domains_reset(uncore, uncore->fw_domains);
 	assert_forcewakes_inactive(uncore);
=20
-	spin_unlock_irqrestore(&uncore->lock, irqflags);
+	raw_spin_unlock_irqrestore(&uncore->lock, irqflags);
=20
 	return fw; /* track the lost user forcewake domains */
 }
@@ -561,12 +561,12 @@ static void forcewake_early_sanitize(struct intel_unc=
ore *uncore,
 	iosf_mbi_punit_acquire();
 	intel_uncore_forcewake_reset(uncore);
 	if (restore_forcewake) {
-		spin_lock_irq(&uncore->lock);
+		raw_spin_lock_irq(&uncore->lock);
 		uncore->funcs.force_wake_get(uncore, restore_forcewake);
=20
 		if (intel_uncore_has_fifo(uncore))
 			uncore->fifo_count =3D fifo_free_entries(uncore);
-		spin_unlock_irq(&uncore->lock);
+		raw_spin_unlock_irq(&uncore->lock);
 	}
 	iosf_mbi_punit_release();
 }
@@ -649,9 +649,9 @@ void intel_uncore_forcewake_get(struct intel_uncore *un=
core,
=20
 	assert_rpm_wakelock_held(uncore->rpm);
=20
-	spin_lock_irqsave(&uncore->lock, irqflags);
+	raw_spin_lock_irqsave(&uncore->lock, irqflags);
 	__intel_uncore_forcewake_get(uncore, fw_domains);
-	spin_unlock_irqrestore(&uncore->lock, irqflags);
+	raw_spin_unlock_irqrestore(&uncore->lock, irqflags);
 }
=20
 /**
@@ -664,14 +664,14 @@ void intel_uncore_forcewake_get(struct intel_uncore *=
uncore,
  */
 void intel_uncore_forcewake_user_get(struct intel_uncore *uncore)
 {
-	spin_lock_irq(&uncore->lock);
+	raw_spin_lock_irq(&uncore->lock);
 	if (!uncore->user_forcewake_count++) {
 		intel_uncore_forcewake_get__locked(uncore, FORCEWAKE_ALL);
-		spin_lock(&uncore->debug->lock);
+		raw_spin_lock(&uncore->debug->lock);
 		mmio_debug_suspend(uncore->debug);
-		spin_unlock(&uncore->debug->lock);
+		raw_spin_unlock(&uncore->debug->lock);
 	}
-	spin_unlock_irq(&uncore->lock);
+	raw_spin_unlock_irq(&uncore->lock);
 }
=20
 /**
@@ -683,19 +683,19 @@ void intel_uncore_forcewake_user_get(struct intel_unc=
ore *uncore)
  */
 void intel_uncore_forcewake_user_put(struct intel_uncore *uncore)
 {
-	spin_lock_irq(&uncore->lock);
+	raw_spin_lock_irq(&uncore->lock);
 	if (!--uncore->user_forcewake_count) {
-		spin_lock(&uncore->debug->lock);
+		raw_spin_lock(&uncore->debug->lock);
 		mmio_debug_resume(uncore->debug);
=20
 		if (check_for_unclaimed_mmio(uncore))
 			drm_info(&uncore->i915->drm,
 				 "Invalid mmio detected during user access\n");
-		spin_unlock(&uncore->debug->lock);
+		raw_spin_unlock(&uncore->debug->lock);
=20
 		intel_uncore_forcewake_put__locked(uncore, FORCEWAKE_ALL);
 	}
-	spin_unlock_irq(&uncore->lock);
+	raw_spin_unlock_irq(&uncore->lock);
 }
=20
 /**
@@ -753,9 +753,9 @@ void intel_uncore_forcewake_put(struct intel_uncore *un=
core,
 	if (!uncore->funcs.force_wake_put)
 		return;
=20
-	spin_lock_irqsave(&uncore->lock, irqflags);
+	raw_spin_lock_irqsave(&uncore->lock, irqflags);
 	__intel_uncore_forcewake_put(uncore, fw_domains);
-	spin_unlock_irqrestore(&uncore->lock, irqflags);
+	raw_spin_unlock_irqrestore(&uncore->lock, irqflags);
 }
=20
 /**
@@ -821,7 +821,7 @@ void assert_forcewakes_active(struct intel_uncore *unco=
re,
 	if (!uncore->funcs.force_wake_get)
 		return;
=20
-	spin_lock_irq(&uncore->lock);
+	raw_spin_lock_irq(&uncore->lock);
=20
 	assert_rpm_wakelock_held(uncore->rpm);
=20
@@ -847,7 +847,7 @@ void assert_forcewakes_active(struct intel_uncore *unco=
re,
 			break;
 	}
=20
-	spin_unlock_irq(&uncore->lock);
+	raw_spin_unlock_irq(&uncore->lock);
 }
=20
 /* We give fast paths for the really cool registers */
@@ -1520,12 +1520,12 @@ unclaimed_reg_debug(struct intel_uncore *uncore,
 	lockdep_assert_held(&uncore->lock);
=20
 	if (before)
-		spin_lock(&uncore->debug->lock);
+		raw_spin_lock(&uncore->debug->lock);
=20
 	__unclaimed_reg_debug(uncore, reg, read, before);
=20
 	if (!before)
-		spin_unlock(&uncore->debug->lock);
+		raw_spin_unlock(&uncore->debug->lock);
 }
=20
 #define __vgpu_read(x) \
@@ -1585,12 +1585,12 @@ __gen2_read(64)
 	unsigned long irqflags; \
 	u##x val =3D 0; \
 	assert_rpm_wakelock_held(uncore->rpm); \
-	spin_lock_irqsave(&uncore->lock, irqflags); \
+	raw_spin_lock_irqsave(&uncore->lock, irqflags); \
 	unclaimed_reg_debug(uncore, reg, true, true)
=20
 #define GEN6_READ_FOOTER \
 	unclaimed_reg_debug(uncore, reg, true, false); \
-	spin_unlock_irqrestore(&uncore->lock, irqflags); \
+	raw_spin_unlock_irqrestore(&uncore->lock, irqflags); \
 	trace_i915_reg_rw(false, reg, val, sizeof(val), trace); \
 	return val
=20
@@ -1694,12 +1694,12 @@ __gen2_write(32)
 	unsigned long irqflags; \
 	trace_i915_reg_rw(true, reg, val, sizeof(val), trace); \
 	assert_rpm_wakelock_held(uncore->rpm); \
-	spin_lock_irqsave(&uncore->lock, irqflags); \
+	raw_spin_lock_irqsave(&uncore->lock, irqflags); \
 	unclaimed_reg_debug(uncore, reg, false, true)
=20
 #define GEN6_WRITE_FOOTER \
 	unclaimed_reg_debug(uncore, reg, false, false); \
-	spin_unlock_irqrestore(&uncore->lock, irqflags)
+	raw_spin_unlock_irqrestore(&uncore->lock, irqflags)
=20
 #define __gen6_write(x) \
 static void \
@@ -1828,7 +1828,7 @@ static int __fw_domain_init(struct intel_uncore *unco=
re,
=20
 	d->mask =3D BIT(domain_id);
=20
-	hrtimer_init(&d->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
+	hrtimer_init(&d->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL_HARD);
 	d->timer.function =3D intel_uncore_fw_release_timer;
=20
 	uncore->fw_domains |=3D BIT(domain_id);
@@ -1961,11 +1961,11 @@ static int intel_uncore_fw_domains_init(struct inte=
l_uncore *uncore)
 		if (ret)
 			goto out;
=20
-		spin_lock_irq(&uncore->lock);
+		raw_spin_lock_irq(&uncore->lock);
 		fw_domains_get_with_thread_status(uncore, FORCEWAKE_RENDER);
 		ecobus =3D __raw_uncore_read32(uncore, ECOBUS);
 		fw_domains_put(uncore, FORCEWAKE_RENDER);
-		spin_unlock_irq(&uncore->lock);
+		raw_spin_unlock_irq(&uncore->lock);
=20
 		if (!(ecobus & FORCEWAKE_MT_ENABLE)) {
 			drm_info(&i915->drm, "No MT forcewake available on Ivybridge, this can =
result in issues\n");
@@ -2077,7 +2077,7 @@ static void uncore_mmio_cleanup(struct intel_uncore *=
uncore)
 void intel_uncore_init_early(struct intel_uncore *uncore,
 			     struct drm_i915_private *i915)
 {
-	spin_lock_init(&uncore->lock);
+	raw_spin_lock_init(&uncore->lock);
 	uncore->i915 =3D i915;
 	uncore->rpm =3D &i915->runtime_pm;
 	uncore->debug =3D &i915->mmio_debug;
@@ -2438,7 +2438,7 @@ int __intel_wait_for_register(struct intel_uncore *un=
core,
=20
 	might_sleep_if(slow_timeout_ms);
=20
-	spin_lock_irq(&uncore->lock);
+	raw_spin_lock_irq(&uncore->lock);
 	intel_uncore_forcewake_get__locked(uncore, fw);
=20
 	ret =3D __intel_wait_for_register_fw(uncore,
@@ -2446,7 +2446,7 @@ int __intel_wait_for_register(struct intel_uncore *un=
core,
 					   fast_timeout_us, 0, &reg_value);
=20
 	intel_uncore_forcewake_put__locked(uncore, fw);
-	spin_unlock_irq(&uncore->lock);
+	raw_spin_unlock_irq(&uncore->lock);
=20
 	if (ret && slow_timeout_ms)
 		ret =3D __wait_for(reg_value =3D intel_uncore_read_notrace(uncore,
@@ -2467,9 +2467,9 @@ bool intel_uncore_unclaimed_mmio(struct intel_uncore =
*uncore)
 {
 	bool ret;
=20
-	spin_lock_irq(&uncore->debug->lock);
+	raw_spin_lock_irq(&uncore->debug->lock);
 	ret =3D check_for_unclaimed_mmio(uncore);
-	spin_unlock_irq(&uncore->debug->lock);
+	raw_spin_unlock_irq(&uncore->debug->lock);
=20
 	return ret;
 }
@@ -2479,7 +2479,7 @@ intel_uncore_arm_unclaimed_mmio_detection(struct inte=
l_uncore *uncore)
 {
 	bool ret =3D false;
=20
-	spin_lock_irq(&uncore->debug->lock);
+	raw_spin_lock_irq(&uncore->debug->lock);
=20
 	if (unlikely(uncore->debug->unclaimed_mmio_check <=3D 0))
 		goto out;
@@ -2497,7 +2497,7 @@ intel_uncore_arm_unclaimed_mmio_detection(struct inte=
l_uncore *uncore)
 	}
=20
 out:
-	spin_unlock_irq(&uncore->debug->lock);
+	raw_spin_unlock_irq(&uncore->debug->lock);
=20
 	return ret;
 }
@@ -2582,13 +2582,13 @@ u32 intel_uncore_read_with_mcr_steering(struct inte=
l_uncore *uncore,
 						     GEN8_MCR_SELECTOR,
 						     FW_REG_READ | FW_REG_WRITE);
=20
-	spin_lock_irq(&uncore->lock);
+	raw_spin_lock_irq(&uncore->lock);
 	intel_uncore_forcewake_get__locked(uncore, fw_domains);
=20
 	val =3D intel_uncore_read_with_mcr_steering_fw(uncore, reg, slice, subsli=
ce);
=20
 	intel_uncore_forcewake_put__locked(uncore, fw_domains);
-	spin_unlock_irq(&uncore->lock);
+	raw_spin_unlock_irq(&uncore->lock);
=20
 	return val;
 }
diff --git a/drivers/gpu/drm/i915/intel_uncore.h b/drivers/gpu/drm/i915/int=
el_uncore.h
index 3c0b0a8b5250d..83062ce85aee8 100644
--- a/drivers/gpu/drm/i915/intel_uncore.h
+++ b/drivers/gpu/drm/i915/intel_uncore.h
@@ -38,7 +38,7 @@ struct intel_uncore;
 struct intel_gt;
=20
 struct intel_uncore_mmio_debug {
-	spinlock_t lock; /** lock is also taken in irq contexts. */
+	raw_spinlock_t lock; /** lock is also taken in irq contexts. */
 	int unclaimed_mmio_check;
 	int saved_mmio_check;
 	u32 suspend_count;
@@ -125,7 +125,7 @@ struct intel_uncore {
 	struct drm_i915_private *i915;
 	struct intel_runtime_pm *rpm;
=20
-	spinlock_t lock; /** lock is also taken in irq contexts. */
+	raw_spinlock_t lock; /** lock is also taken in irq contexts. */
=20
 	unsigned int flags;
 #define UNCORE_HAS_FORCEWAKE		BIT(0)
--=20
2.33.0

