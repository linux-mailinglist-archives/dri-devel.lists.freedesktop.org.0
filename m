Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B92B1BAC9CA
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 13:01:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A883610E586;
	Tue, 30 Sep 2025 11:01:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DIVDl4jH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5CA010E57E
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 11:01:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BD05240732;
 Tue, 30 Sep 2025 11:01:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FB3BC4CEF0;
 Tue, 30 Sep 2025 11:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759230097;
 bh=IEphRh/2Qwt2rsxWLzCjzed7WkDSqkgOR5Wy6IhGb2E=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=DIVDl4jHSm/CKiQBLCQzLfEGOa36xXzLG4wB6tfz+jm81b6Oq3pcmEtKFfIKm5gIc
 4SilrGCNOsnkL0u05vDCxcLpA8wEqEkiIiGpZBqBqpiadtT9gKzzc95rd7bAmHT0qE
 tkpAMdZlyN2buVDa1pKyiPeGqGKBVl0nEWUpBeuPIpwV/2hbqLislQCzznLhnHisMA
 ljCI638A9BB2jHrrFeH/Qa6rvpIJ/x9azYW7RgHMncm5ud+DH+piL31Cp6+F4u6HYb
 UcDbKYLRvaCvfVM98xhey5H8zhM3wF7vbn++2URV5yfR3o2/FQyB3YJS+iNABNZDwy
 Cr4YRzrgjox5w==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 30 Sep 2025 12:59:47 +0200
Subject: [PATCH v5 32/39] drm/vc4: Switch to
 drm_atomic_get_new_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250930-drm-no-more-existing-state-v5-32-eeb9e1287907@kernel.org>
References: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
In-Reply-To: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2128; i=mripard@kernel.org;
 h=from:subject:message-id; bh=IEphRh/2Qwt2rsxWLzCjzed7WkDSqkgOR5Wy6IhGb2E=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBm3d+ie05M+xJL99/lN5eDt9m25267sP/R5+aavL5PP9
 0doaAat75jKwiDMySArpsjyRCbs9PL2xVUO9it/wMxhZQIZwsDFKQATyS9mrC9MFvpvdWWZruHe
 w8WTy0U25r9p3j5jBZ/g0o2yzE9lVpUJCavmalkbNr6+3qUVbczgyFinqPYj/cMLyXwm9gXnK1/
 4n69JFJ2RHHvvU+tUrRNRL+6l8G1z2XS/tijjUYVyJTufdjEA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

The vc4 atomic_check implementation uses the deprecated
drm_atomic_get_existing_crtc_state() helper.

This hook is called as part of the global atomic_check, thus before the
states are swapped. The existing state thus points to the new state, and
we can use drm_atomic_get_new_crtc_state() instead.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
To: Maxime Ripard <mripard@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: "Maíra Canal" <mcanal@igalia.com>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_plane.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index 056d344c5411db0eae975b0fa52c0de7418306f1..b4a53f68865bc18f6cb1fa92b1057890d3fe0382 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -495,12 +495,11 @@ static int vc4_plane_setup_clipping_and_scaling(struct drm_plane_state *state)
 	struct drm_crtc_state *crtc_state;
 	u32 h_subsample = fb->format->hsub;
 	u32 v_subsample = fb->format->vsub;
 	int ret;
 
-	crtc_state = drm_atomic_get_existing_crtc_state(state->state,
-							state->crtc);
+	crtc_state = drm_atomic_get_new_crtc_state(state->state, state->crtc);
 	if (!crtc_state) {
 		DRM_DEBUG_KMS("Invalid crtc state\n");
 		return -EINVAL;
 	}
 
@@ -873,12 +872,11 @@ static void vc4_plane_calc_load(struct drm_plane_state *state)
 	struct vc4_plane_state *vc4_state;
 	struct drm_crtc_state *crtc_state;
 	unsigned int vscale_factor;
 
 	vc4_state = to_vc4_plane_state(state);
-	crtc_state = drm_atomic_get_existing_crtc_state(state->state,
-							state->crtc);
+	crtc_state = drm_atomic_get_new_crtc_state(state->state, state->crtc);
 	vrefresh = drm_mode_vrefresh(&crtc_state->adjusted_mode);
 
 	/* The HVS is able to process 2 pixels/cycle when scaling the source,
 	 * 4 pixels/cycle otherwise.
 	 * Alpha blending step seems to be pipelined and it's always operating

-- 
2.51.0

