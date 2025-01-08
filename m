Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 886ECA063B3
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 18:50:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CF9E10EC42;
	Wed,  8 Jan 2025 17:50:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="iuAkyqzX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 361F610EC40
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 17:50:01 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-30034ad2ca3so154553591fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2025 09:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1736358539; x=1736963339; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3f5YCGnLwXcWm/w2w7vkcHLaWrU+paJS9N0WpwpCztc=;
 b=iuAkyqzX3nlooeWRhjuhn4J2lBQUICjTywGKj8mdC+TW3Y0D14FnTOoZrNafPwygAl
 sAtpJ9KzZtCKPfVixFv3SAyrR+8F2l8FJE+xddyVG/qZFPiA+bTKOcjKnKamzusbT3By
 eXBeXl/UG0dIAznIb+4mItTwBbkEvg1bs52hQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736358539; x=1736963339;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3f5YCGnLwXcWm/w2w7vkcHLaWrU+paJS9N0WpwpCztc=;
 b=TuAu6c59ZBlg+yERyTOUYz8xsGoerIpWop/Uhy/qFq7LrtHD417Ww7OK4KUWyIVckl
 aliMb/39rsetXt/vG3CEuMKEMRZyDpvx3xfM2XppNuhGOSyRFvISrX/DhnWaO0WiX5s2
 zcCCa9+Pa5kozDXIV6LXFa+vgfuhqHeRCWS2XhFwjMPqcrHOjAmW3BddFSS9AsWU9w6A
 mTL1zumUolaw7aTMkAedejoPyFS45UJW1uFUKBW8lR9cj4H+YisH/KwdaFe1eZZQ29Nt
 szVSyr9NNC3AE2ahJH47Ry/BYRHAjDtEIYGDciRCKrXBE89dzmIka77XKOL4BaSvePob
 wt0w==
X-Gm-Message-State: AOJu0YxizXu+2LAKxPByMscOCb5GS7QZRnlUIzOBhii5FPRR6wnUtREI
 aN+69NnqIS8pQUMvyuuFHlr/5L25NHnlHlz39t47fvK0zMgDyTueOmfnEugqKhnx/XG/+Ru7EsS
 f
X-Gm-Gg: ASbGnctCVj4AimMi5nb1S6yjJ1m1oMgSw6G5xgdiapddKf8fY3Owbyk4/2scsC8U9wT
 tOaVtpt0DVmzjRik6PoP+uEp5nQUVSwbjVykRv0wHCilf2DGE78MN75DZHu/DSzdDrNSXMh8Kmy
 lIYonPjroyUSnSHP+zHiZeqY39Y5rHEL3xDvNIY5lW6TIznJpX5JHaK0LfEqGJ8AHcVigxPGcwP
 S0eypfxaOygqHYQbUarLRL6M4JdYaFJ5bzdKdl+hI3Rz7h0zsEZy3ps1LgWxsvo0yF6
X-Google-Smtp-Source: AGHT+IGsMPYRDHK6Ko879w9qzLtoWK6X9vhbq9HNV+J0t4+/LNmHj8Caiw0Uw/UVFRbgB7n75ocAQQ==
X-Received: by 2002:a5d:47c9:0:b0:388:c75d:be97 with SMTP id
 ffacd0b85a97d-38a872fb90cmr3354843f8f.11.1736357065730; 
 Wed, 08 Jan 2025 09:24:25 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c829235sm52559713f8f.15.2025.01.08.09.24.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 09:24:25 -0800 (PST)
From: Simona Vetter <simona.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@gmail.com>,
 Simon Ser <contact@emersion.fr>, Manasi Navare <navaremanasi@google.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Simona Vetter <simona.vetter@intel.com>
Subject: [PATCH] drm/atomic: clarify the rules around
 drm_atomic_state->allow_modeset
Date: Wed,  8 Jan 2025 18:24:16 +0100
Message-ID: <20250108172417.160831-1-simona.vetter@ffwll.ch>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
---
 include/drm/drm_atomic.h | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 31ca88deb10d..1ded9a8d4e84 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -376,8 +376,27 @@ struct drm_atomic_state {
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
 	/**
-- 
2.45.2

