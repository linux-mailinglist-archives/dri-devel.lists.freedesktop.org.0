Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B56E1AAA419
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 01:24:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E03B10E600;
	Mon,  5 May 2025 23:24:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Fxf6jSbq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BA7610E600
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 23:24:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 75AC65C59F1;
 Mon,  5 May 2025 23:21:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 584EAC4CEE4;
 Mon,  5 May 2025 23:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746487448;
 bh=jFzjI0qQiIPko2HExKolk6Id54lKfQ1zZvtX8oXdN4U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Fxf6jSbqjLZlof+omE/gphn9mhz9Kd7VYoSuwBMk34/UdR9hoigBFMzikcSOvxfOf
 7Gxg1L78dDuNEbAJxTOLgeSPlu+NMybPDA6J8DHSFkmW1XFrJVHLO0R+MzwR9yvsd5
 H5vPgjYyorlTqJIVfD/M4Y++pWnqkYSqugyZs+zJimtCAbf97AzgwyfLZNSDuCIEUP
 7BuYEjt/MS+zOdoNHZP03S04xxR3gYPl/1c7PBt3k4j0sGY8wEUg6TH6Av9QNd060O
 hxV9c6LdqeeZw0LjmU5G6vxqvuiUF3N5bgtryQcKJbyMAcvMTPaOFOuInP1A4SvBeN
 0ZxvXBPQ5k5Rg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@gmail.com>,
 Simon Ser <contact@emersion.fr>, Manasi Navare <navaremanasi@google.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Simona Vetter <simona.vetter@intel.com>, Sasha Levin <sashal@kernel.org>,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 5.4 78/79] drm/atomic: clarify the rules around
 drm_atomic_state->allow_modeset
Date: Mon,  5 May 2025 19:21:50 -0400
Message-Id: <20250505232151.2698893-78-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505232151.2698893-1-sashal@kernel.org>
References: <20250505232151.2698893-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.293
Content-Transfer-Encoding: 8bit
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

From: Simona Vetter <simona.vetter@ffwll.ch>

[ Upstream commit c5e3306a424b52e38ad2c28c7f3399fcd03e383d ]

msm is automagically upgrading normal commits to full modesets, and
that's a big no-no:

- for one this results in full on->off->on transitions on all these
  crtc, at least if you're using the usual helpers. Which seems to be
  the case, and is breaking uapi

- further even if the ctm change itself would not result in flicker,
  this can hide modesets for other reasons. Which again breaks the
  uapi

v2: I forgot the case of adding unrelated crtc state. Add that case
and link to the existing kerneldoc explainers. This has come up in an
irc discussion with Manasi and Ville about intel's bigjoiner mode.
Also cc everyone involved in the msm irc discussion, more people
joined after I sent out v1.

v3: Wording polish from Pekka and Thomas

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: Manasi Navare <navaremanasi@google.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Simona Vetter <simona.vetter@intel.com>
Signed-off-by: Simona Vetter <simona.vetter@ffwll.ch>
Link: https://patchwork.freedesktop.org/patch/msgid/20250108172417.160831-1-simona.vetter@ffwll.ch
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 include/drm/drm_atomic.h | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 927e1205d7aa4..202975db784c6 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -323,8 +323,27 @@ struct drm_atomic_state {
 	 *
 	 * Allow full modeset. This is used by the ATOMIC IOCTL handler to
 	 * implement the DRM_MODE_ATOMIC_ALLOW_MODESET flag. Drivers should
-	 * never consult this flag, instead looking at the output of
-	 * drm_atomic_crtc_needs_modeset().
+	 * generally not consult this flag, but instead look at the output of
+	 * drm_atomic_crtc_needs_modeset(). The detailed rules are:
+	 *
+	 * - Drivers must not consult @allow_modeset in the atomic commit path.
+	 *   Use drm_atomic_crtc_needs_modeset() instead.
+	 *
+	 * - Drivers must consult @allow_modeset before adding unrelated struct
+	 *   drm_crtc_state to this commit by calling
+	 *   drm_atomic_get_crtc_state(). See also the warning in the
+	 *   documentation for that function.
+	 *
+	 * - Drivers must never change this flag, it is under the exclusive
+	 *   control of userspace.
+	 *
+	 * - Drivers may consult @allow_modeset in the atomic check path, if
+	 *   they have the choice between an optimal hardware configuration
+	 *   which requires a modeset, and a less optimal configuration which
+	 *   can be committed without a modeset. An example would be suboptimal
+	 *   scanout FIFO allocation resulting in increased idle power
+	 *   consumption. This allows userspace to avoid flickering and delays
+	 *   for the normal composition loop at reasonable cost.
 	 */
 	bool allow_modeset : 1;
 	bool legacy_cursor_update : 1;
-- 
2.39.5

