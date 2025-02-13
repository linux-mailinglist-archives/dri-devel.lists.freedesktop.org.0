Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5183FA34320
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 15:45:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEB6A10EAE8;
	Thu, 13 Feb 2025 14:45:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="D7zCaZ0G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 178AD10EAE8
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 14:45:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 021E7A4202C;
 Thu, 13 Feb 2025 14:43:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CCE2C4CED1;
 Thu, 13 Feb 2025 14:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739457901;
 bh=C1A9IEgT2YApuD/rIJh3Cq5kR2HpRAe1NB3F6wBv3uQ=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=D7zCaZ0GPOachMEglrnum1WgdjKGkeH/43gK7mcsL652O0YwyNJyDlp2SXJpHSGtw
 uQFEd3aDO5CzP4ezP6lGtyhDZcCszuclUvWb1qCYMUTOEVKSMGjROnYjcvkCgBPmqx
 fgT2jaPI7wOPWLh5IlEcWvD1tWvues4J/rLkBHXUQkGDiLgaan0HPd6SOHPH3fyBd+
 lB0tT8swrMhu9EL7iq9KHriDHI8KNClc5AaP9ui251BSGPbpF/Z715/tEhAi4bfesc
 xk8zsZzWhw5lilzNsNwoN/PHItrJ6S699E6+y5nOZdaN6hVmO/1zSmSNcc6btPfEI+
 kinfnudCMNMrg==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 13 Feb 2025 15:43:43 +0100
Subject: [PATCH v3 24/37] drm/atomic-helper: Change parameter name of
 drm_atomic_helper_cleanup_planes()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-bridge-connector-v3-24-e71598f49c8f@kernel.org>
References: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
In-Reply-To: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2219; i=mripard@kernel.org;
 h=from:subject:message-id; bh=C1A9IEgT2YApuD/rIJh3Cq5kR2HpRAe1NB3F6wBv3uQ=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOnrWBW+mnJf19p068jdSbM2Zy8Ramtry1l8w+COC/ecu
 08DGozudExlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJWP5ibLiY0b4/vfqlmXNM
 57M605l/Y+JvdTWln5QWllBc3LP4yNSoFa/VP/Se1zFluMe8V1d7KWOtkKtPq/eWC6r3l+z5K/u
 5sV+htimp+ueJaSGe5xYF71DdUcUh8M7Aczp30fP9yesPKxsDAA==
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

drm_atomic_helper_cleanup_planes() is one of the final part of a commit,
and will free up all plane resources used in the previous commit.  It
takes the drm_atomic_state being committed as a parameter.

However, that parameter name is called (and documented) as old_state,
which is pretty confusing. Let's rename that variable as state.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index d2bd7862e0158647d9638a6db25a8743f89ad7c6..c4de263f7c0dc5750bc99cf8f719707a7e384de9 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -2987,28 +2987,28 @@ drm_atomic_helper_disable_planes_on_crtc(struct drm_crtc_state *old_crtc_state,
 EXPORT_SYMBOL(drm_atomic_helper_disable_planes_on_crtc);
 
 /**
  * drm_atomic_helper_cleanup_planes - cleanup plane resources after commit
  * @dev: DRM device
- * @old_state: atomic state object with old state structures
+ * @state: atomic state object being committed
  *
  * This function cleans up plane state, specifically framebuffers, from the old
- * configuration. Hence the old configuration must be perserved in @old_state to
+ * configuration. Hence the old configuration must be perserved in @state to
  * be able to call this function.
  *
  * This function may not be called on the new state when the atomic update
  * fails at any point after calling drm_atomic_helper_prepare_planes(). Use
  * drm_atomic_helper_unprepare_planes() in this case.
  */
 void drm_atomic_helper_cleanup_planes(struct drm_device *dev,
-				      struct drm_atomic_state *old_state)
+				      struct drm_atomic_state *state)
 {
 	struct drm_plane *plane;
 	struct drm_plane_state *old_plane_state;
 	int i;
 
-	for_each_old_plane_in_state(old_state, plane, old_plane_state, i) {
+	for_each_old_plane_in_state(state, plane, old_plane_state, i) {
 		const struct drm_plane_helper_funcs *funcs = plane->helper_private;
 
 		if (funcs->cleanup_fb)
 			funcs->cleanup_fb(plane, old_plane_state);
 	}

-- 
2.48.0

