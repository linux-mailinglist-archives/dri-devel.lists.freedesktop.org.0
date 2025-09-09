Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4ACB4ABF3
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 13:29:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 015A810E6C1;
	Tue,  9 Sep 2025 11:29:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="en7oDo0w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D43510E6C1
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 11:29:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id ADBB560223;
 Tue,  9 Sep 2025 11:29:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 030B7C4CEF4;
 Tue,  9 Sep 2025 11:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757417359;
 bh=t8bozP1Byiq4PQZcXFHywP/ksKtxnuKAESRMRPjiWaA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=en7oDo0wddTIhstEk8W8pUMmvHltACSPF2g7bed0aNg+ZYaVpxsVScX6wmnUcWHCb
 DRR6Osoax72H5JwkH25W0vr5hE3grijjnvuoPyTS6FQOWwyTloth32qaOqWqfFHjbR
 rXPj7RegWU0inAdBF3ZTB6wfsHjybseVbjm+tW5uVHKavdcUNcYCZSrEoFA+9TRjsa
 A23AUaDqDEHHDUdZ1sgcRXNSaZ1gukppX2Io2LRjCLUO/7DL/F/SWpXz7iyjmiLG6c
 8x25UXFBsgtVYI0T35a5sZltTsV9mgF5ySxvMEz8Udlwol61PR7rl6AiOCWNClFX1F
 r1HN6d050A63g==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 09 Sep 2025 13:27:51 +0200
Subject: [PATCH v3 32/39] drm/vc4: Switch to
 drm_atomic_get_new_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250909-drm-no-more-existing-state-v3-32-1c7a7d960c33@kernel.org>
References: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
In-Reply-To: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
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
 h=from:subject:message-id; bh=t8bozP1Byiq4PQZcXFHywP/ksKtxnuKAESRMRPjiWaA=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBkH+A22/pi/9NcGRS6R8M1GGxc8KOK/cVnF6EidmMiSp
 cyH6m/N6JjKwiDMySArpsjyRCbs9PL2xVUO9it/wMxhZQIZwsDFKQAT2XiRsWFDecxxyWSBNc93
 S/4SZbWb92lJ78dXYg/8OLP31GQGhjx4a9rBEdEdwata1mv1REDtM2N9XZu4Ru6xb9xqK1cq8dg
 JGajpGtUwfUhwur9O4+7GDU1hPlz3I/WW/H++tdTpVlRNoy4A
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
2.50.1

