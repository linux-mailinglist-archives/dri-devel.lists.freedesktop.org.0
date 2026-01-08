Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C59DD01E8B
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 10:45:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFA8D10E6D5;
	Thu,  8 Jan 2026 09:45:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mzRITM+S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 685FC10E6D7;
 Thu,  8 Jan 2026 09:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767865535; x=1799401535;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=/kyaCAWKa77leGmMqlythLvuhYS+nKH5sMdLdKnCSyM=;
 b=mzRITM+S6UgoGMkOUc6583q5KR8EmVacgRDsm5sRrL8O5jM8MrWbuVzK
 wOQeWHP+Yz6pVquBJNdjR948UP6xNECauj/RHiqQjeEqgiJJ2TMt9ttrP
 Wc6DjDKW6ZliLjY5FGn0wicSSFoxTyuow6fzf6GNFF1OL6DoV55OujMS1
 8VhYT+IfSKj/77ZbrxUKGNI627BmZQT63h3sZalZGDi5xG5lZ8OZLDjY5
 2WVdC5bgFreujf7yy8vbHipNZqY41iIvYi3Zo/8Z29R2nd5qZNtGUySR6
 b/hVE/5yZ7mNLePfln2iLX3rRVH6EXdyFtbZvIW09JoHpjunQLAcTcuKf A==;
X-CSE-ConnectionGUID: TogfYQzzREKM/X6Cm7zWrg==
X-CSE-MsgGUID: gzl8pN2nTsqrRZ6RDsi5TA==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="72876663"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; d="scan'208";a="72876663"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 01:45:35 -0800
X-CSE-ConnectionGUID: YXNE4mq+QHmYyReAwEFt7w==
X-CSE-MsgGUID: dCePRZYyRtmvRcNja7G81A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; d="scan'208";a="208232249"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa005.jf.intel.com with ESMTP; 08 Jan 2026 01:45:29 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Thu, 08 Jan 2026 15:13:28 +0530
Subject: [PATCH [RFC] v3 7/7] drm/i915/irq: Enable flip_done for each plane
 on async flip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-async-v3-7-e7730c3fe9ff@intel.com>
References: <20260108-async-v3-0-e7730c3fe9ff@intel.com>
In-Reply-To: <20260108-async-v3-0-e7730c3fe9ff@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, xaver.hugl@kde.org, 
 andrealmeid@igalia.com, naveen1.kumar@intel.com, ville.syrjala@intel.com, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, Arun R Murthy <arun.r.murthy@intel.com>
X-Mailer: b4 0.15-dev
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

On asynchronous flip, enable flip done for all the planes on which the
async flip is given by the user. After the last flip_done by the plane
in the atomic_commit send the uevent to the user.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_irq.c   | 98 +++++++++++++++++++---
 drivers/gpu/drm/i915/display/skl_universal_plane.c |  2 +-
 2 files changed, 86 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_irq.c b/drivers/gpu/drm/i915/display/intel_display_irq.c
index 9adeebb376b189ef72a97e0206e0c24b0f4e7117..4d2e1de27d2003db90fe2408c67e3e56e1d9bfcd 100644
--- a/drivers/gpu/drm/i915/display/intel_display_irq.c
+++ b/drivers/gpu/drm/i915/display/intel_display_irq.c
@@ -142,6 +142,44 @@ static void intel_pipe_fault_irq_handler(struct intel_display *display,
 		  crtc->base.base.id, crtc->base.name, fault_errors);
 }
 
+struct plane_flip_done {
+	u32 flip_done;
+	enum plane_id plane_id;
+};
+static const struct plane_flip_done gen8_plane_flip_done[] = {
+	{ .flip_done = GEN9_PIPE_PLANE1_FLIP_DONE, .plane_id = PLANE_1 },
+	{ .flip_done = GEN9_PIPE_PLANE2_FLIP_DONE, .plane_id = PLANE_2 },
+	{ .flip_done = GEN9_PIPE_PLANE3_FLIP_DONE, .plane_id = PLANE_3 },
+	{ .flip_done = GEN9_PIPE_PLANE4_FLIP_DONE, .plane_id = PLANE_4 },
+	{ .flip_done = GEN11_PIPE_PLANE5_FLIP_DONE, .plane_id = PLANE_5 },
+	{ .flip_done = GEN11_PIPE_PLANE6_FLIP_DONE, .plane_id = PLANE_6 },
+	{ .flip_done = GEN11_PIPE_PLANE7_FLIP_DONE, .plane_id = PLANE_7 },
+	{}
+};
+
+static void intel_plane_flip_done_handler(struct intel_display *display,
+					  const struct plane_flip_done *fd,
+					  enum pipe pipe, u32 de_iir)
+{
+	struct intel_crtc *crtc = intel_crtc_for_pipe(display, pipe);
+	struct intel_crtc_state *crtc_state =
+		to_intel_crtc_state(crtc->base.state);
+	struct drm_plane *plane;
+	struct drm_plane_state *plane_state;
+	const struct plane_flip_done *flipdone;
+
+	if (!crtc->base.state->async_flip)
+		return;
+
+	drm_for_each_plane_mask(plane, display->drm,
+				crtc_state->uapi.plane_mask) {
+		plane_state = plane->state;
+		flipdone = &fd[to_intel_plane(plane)->id];
+		if (de_iir & flipdone->flip_done)
+			complete(&plane_state->flip_done);
+	}
+}
+
 static void
 intel_handle_vblank(struct intel_display *display, enum pipe pipe)
 {
@@ -460,12 +498,27 @@ display_pipe_crc_irq_handler(struct intel_display *display,
 #endif
 
 static void flip_done_handler(struct intel_display *display,
-			      enum pipe pipe)
+			      enum pipe pipe, u32 de_iir)
 {
 	struct intel_crtc *crtc = intel_crtc_for_pipe(display, pipe);
+	struct intel_crtc_state *crtc_state =
+		to_intel_crtc_state(crtc->base.state);
+	struct drm_plane *plane;
+	struct drm_plane_state *plane_state;
 
 	spin_lock(&display->drm->event_lock);
 
+	if (crtc->base.state->async_flip) {
+		drm_for_each_plane_mask(plane, display->drm,
+					crtc_state->uapi.plane_mask) {
+			plane_state = plane->state;
+
+			/* There are some pending flip done in this pipe */
+			if (!completion_done(&plane_state->flip_done))
+				return;
+		}
+	}
+
 	if (crtc->flip_done_event) {
 		trace_intel_crtc_flip_done(crtc);
 		drm_crtc_send_vblank_event(&crtc->base, crtc->flip_done_event);
@@ -657,7 +710,7 @@ void valleyview_pipestat_irq_handler(struct intel_display *display,
 			intel_handle_vblank(display, pipe);
 
 		if (pipe_stats[pipe] & PLANE_FLIP_DONE_INT_STATUS_VLV)
-			flip_done_handler(display, pipe);
+			flip_done_handler(display, pipe, pipe_stats[pipe]);
 
 		if (pipe_stats[pipe] & PIPE_CRC_DONE_INTERRUPT_STATUS)
 			i9xx_pipe_crc_irq_handler(display, pipe);
@@ -916,7 +969,7 @@ static void _ilk_display_irq_handler(struct intel_display *display, u32 de_iir)
 			intel_handle_vblank(display, pipe);
 
 		if (de_iir & DE_PLANE_FLIP_DONE(pipe))
-			flip_done_handler(display, pipe);
+			flip_done_handler(display, pipe, de_iir);
 
 		if (de_iir & DE_PIPE_FIFO_UNDERRUN(pipe))
 			intel_cpu_fifo_underrun_irq_handler(display, pipe);
@@ -977,7 +1030,7 @@ static void _ivb_display_irq_handler(struct intel_display *display, u32 de_iir)
 			intel_handle_vblank(display, pipe);
 
 		if (de_iir & DE_PLANE_FLIP_DONE_IVB(pipe))
-			flip_done_handler(display, pipe);
+			flip_done_handler(display, pipe, de_iir);
 	}
 
 	/* check event from PCH */
@@ -1368,12 +1421,26 @@ static void gen11_dsi_te_interrupt_handler(struct intel_display *display,
 	intel_de_rmw(display, DSI_INTR_IDENT_REG(port), 0, 0);
 }
 
-static u32 gen8_de_pipe_flip_done_mask(struct intel_display *display)
+static u32 gen8_de_pipe_flip_done_mask(struct intel_display *display,
+				       enum pipe pipe)
 {
-	if (DISPLAY_VER(display) >= 9)
-		return GEN9_PIPE_PLANE1_FLIP_DONE;
+	if (DISPLAY_VER(display) >= 11)
+		return (GEN9_PIPE_PLANE1_FLIP_DONE |
+			GEN9_PIPE_PLANE2_FLIP_DONE |
+			GEN9_PIPE_PLANE3_FLIP_DONE |
+			GEN9_PIPE_PLANE4_FLIP_DONE |
+			GEN11_PIPE_PLANE5_FLIP_DONE |
+			GEN11_PIPE_PLANE6_FLIP_DONE |
+			GEN11_PIPE_PLANE7_FLIP_DONE);
+	else if (DISPLAY_VER(display) >= 9)
+		return (GEN9_PIPE_PLANE1_FLIP_DONE |
+			GEN9_PIPE_PLANE2_FLIP_DONE |
+			GEN9_PIPE_PLANE3_FLIP_DONE |
+			GEN9_PIPE_PLANE4_FLIP_DONE);
 	else
 		return GEN8_PIPE_PRIMARY_FLIP_DONE;
+
+	return 0;
 }
 
 static void gen8_read_and_ack_pch_irqs(struct intel_display *display, u32 *pch_iir, u32 *pica_iir)
@@ -1504,8 +1571,12 @@ void gen8_de_irq_handler(struct intel_display *display, u32 master_ctl)
 		if (iir & GEN8_PIPE_VBLANK)
 			intel_handle_vblank(display, pipe);
 
-		if (iir & gen8_de_pipe_flip_done_mask(display))
-			flip_done_handler(display, pipe);
+		if (iir & gen8_de_pipe_flip_done_mask(display, pipe)) {
+			intel_plane_flip_done_handler(display,
+						      gen8_plane_flip_done,
+						      pipe, iir);
+			flip_done_handler(display, pipe, iir);
+		}
 
 		if (HAS_DSB(display)) {
 			if (iir & GEN12_DSB_INT(INTEL_DSB_0))
@@ -2167,8 +2238,7 @@ void gen11_display_irq_reset(struct intel_display *display)
 void gen8_irq_power_well_post_enable(struct intel_display *display,
 				     u8 pipe_mask)
 {
-	u32 extra_ier = GEN8_PIPE_VBLANK | GEN8_PIPE_FIFO_UNDERRUN |
-		gen8_de_pipe_flip_done_mask(display);
+	u32 extra_ier = GEN8_PIPE_VBLANK | GEN8_PIPE_FIFO_UNDERRUN;
 	enum pipe pipe;
 
 	spin_lock_irq(&display->irq.lock);
@@ -2178,10 +2248,12 @@ void gen8_irq_power_well_post_enable(struct intel_display *display,
 		return;
 	}
 
-	for_each_pipe_masked(display, pipe, pipe_mask)
+	for_each_pipe_masked(display, pipe, pipe_mask) {
+		extra_ier |= gen8_de_pipe_flip_done_mask(display, pipe);
 		irq_init(display, GEN8_DE_PIPE_IRQ_REGS(pipe),
 			 display->irq.de_pipe_imr_mask[pipe],
 			 ~display->irq.de_pipe_imr_mask[pipe] | extra_ier);
+	}
 
 	spin_unlock_irq(&display->irq.lock);
 }
@@ -2364,7 +2436,7 @@ void gen8_de_irq_postinstall(struct intel_display *display)
 
 	de_pipe_enables = de_pipe_masked |
 		GEN8_PIPE_VBLANK | GEN8_PIPE_FIFO_UNDERRUN |
-		gen8_de_pipe_flip_done_mask(display);
+		gen8_de_pipe_flip_done_mask(display, pipe);
 
 	de_port_enables = de_port_masked;
 	if (display->platform.geminilake || display->platform.broxton)
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index b3d41705448a28ae7abf7b31775d09db832cb9d6..ac35a7083f31da8f0b0a36dd13554fb24166b429 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -2927,7 +2927,7 @@ skl_universal_plane_create(struct intel_display *display,
 	plane->get_hw_state = skl_plane_get_hw_state;
 	plane->check_plane = skl_plane_check;
 
-	if (HAS_ASYNC_FLIPS(display) && plane_id == PLANE_1) {
+	if (HAS_ASYNC_FLIPS(display)) {
 		plane->need_async_flip_toggle_wa = IS_DISPLAY_VER(display, 9, 10);
 		plane->async_flip = skl_plane_async_flip;
 		plane->enable_flip_done = skl_plane_enable_flip_done;

-- 
2.25.1

