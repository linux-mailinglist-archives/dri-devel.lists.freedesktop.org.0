Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE24B3FABD
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 11:36:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48A9410E63C;
	Tue,  2 Sep 2025 09:36:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hnbO/Q/g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34ED510E62B
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 09:36:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1C409417A5;
 Tue,  2 Sep 2025 09:36:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3523C4CEF7;
 Tue,  2 Sep 2025 09:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756805808;
 bh=vAlxTkdZ6kDhfMlf4rRyaNHiZNuuzog1iJiOoK5AHV8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=hnbO/Q/gAsXczgzDGAmoj8C1K4nb6nuGOIBId8yoHZpLK5X5VFBVqnY/li8/NfSq2
 Gk2MGN98/IMA9mJi3kqlplXIzCjVF9iNWtaCNbmXjk1NcparLgedwlA4d7HauLaBVW
 RtHYB0iwwPrX56r7CtfcytknR0g22v5OYjcEJzRldre/7IGsL7mw7rJPeNnZdm9gsL
 biCmfN28aJvtvRHXqGbiMd19C71ilxiDXwLamYSUSgtWEHLtMYqIlJMXCg0rbHUZ/l
 NwxRO0AENq+5M9nJRQOI936IexCjYM8Mnuhr6ePcuPifOgSGAhbXYWI/2aIXDk5CUI
 Jpe1eySVn1kow==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 02 Sep 2025 11:35:30 +0200
Subject: [PATCH v2 31/37] drm/vc4: Switch to
 drm_atomic_get_new_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250902-drm-no-more-existing-state-v2-31-de98fc5f6d66@kernel.org>
References: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
In-Reply-To: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2068; i=mripard@kernel.org;
 h=from:subject:message-id; bh=vAlxTkdZ6kDhfMlf4rRyaNHiZNuuzog1iJiOoK5AHV8=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnbdkWa7Nz/KvtxlL9SzByRa8djDK7Oa2yayXinLnC25
 Exj9zOSHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAiTVmMdYZbH+6ZMn/abcOl
 HBc74rj0XhXbzNeLkpS27/1vUbvlQVS3ueeM3t5HS1KUz/5R3zT7GGN9dC/P+3uam/edlF2kKq3
 CW9l9PMPm4uuDn5/zT5u8scPQfdFaZuYzpcwHWm0PvdS23P4dAA==
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

