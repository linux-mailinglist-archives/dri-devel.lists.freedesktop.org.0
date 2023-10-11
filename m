Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 425267C4E63
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 11:21:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4849510E5F7;
	Wed, 11 Oct 2023 09:20:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9453E10E5F5
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 09:20:56 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-32d89600755so22094f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 02:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1697016055; x=1697620855; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oAt8f6mcHhtjLLzOwyLl/yEuXy/pt+eQUDW9bFoHsT8=;
 b=dsdoooWOFOqY0E6VrfqBrUKp6CQua+Cuzuy0zWANqq1lrA7BhijQmBt9URHTGnr7by
 9pvvKBNCAUYNiQBeoxIz8sNRa3pJgVwBtleH7T4Zj4fWswLPsmGs/uTYiiJwMrPEBjvI
 hwfACHgp4YYhWS6FJ6ZKi970ERLhHB1hN2miw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697016055; x=1697620855;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oAt8f6mcHhtjLLzOwyLl/yEuXy/pt+eQUDW9bFoHsT8=;
 b=DrhurkGHAmd4imk86Go29zOXxdGTwueMxHoNJigbd//Pe4TY7XHfTVwwFNizEbWQgI
 WGsMzbGUE7JcrmIDMdQxH74dMbxxcKPV/HeNvkg4h4wqjUUx7bWC8TFefF5SQby9ypo6
 I8nfInFjreH52uzxOxC+fr70XMJjv368wFxZXnc0Rj7ZCx0gkwDhG+Q/xRnRbyr2h29d
 XeGmEvxRx//LgLdNNrjP0lCZjV3Mp5T3i7TzfHmki9jjdp7ZWvMJeoWCHfeL9Xz3s8XP
 hTeA6lxCHUV4ctd/3JiEcFiTCDggjp70bsNXXsPd9SFX0vqSCN/Ub8smCHsWNc+4Xinl
 H1sA==
X-Gm-Message-State: AOJu0Yz58CbEuRbN0/zd71UHYu2lx0iogrQiGgqFZ8y/7ynhHp2vyhJV
 4tDPBqzpn5j1TOvsRq98pXVhW3Pkv2T21XaRLTU=
X-Google-Smtp-Source: AGHT+IFvVK1rcrqBIGUZdCxHbt0idBWXg7XDXZpbwEVXh9fl2YDMkypGC7xWHOfl1yndKD0lOR6EJQ==
X-Received: by 2002:adf:f14e:0:b0:320:b1e:7e6c with SMTP id
 y14-20020adff14e000000b003200b1e7e6cmr17714071wro.3.1697016054876; 
 Wed, 11 Oct 2023 02:20:54 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 c4-20020a5d4cc4000000b003247d3e5d99sm14858212wrt.55.2023.10.11.02.20.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Oct 2023 02:20:54 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/atomic: clarify the rules around
 drm_atomic_state->allow_modeset
Date: Wed, 11 Oct 2023 11:20:51 +0200
Message-Id: <20231011092051.640422-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231010170746.617366-1-daniel.vetter@ffwll.ch>
References: <20231010170746.617366-1-daniel.vetter@ffwll.ch>
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Manasi Navare <navaremanasi@google.com>
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

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
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
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 include/drm/drm_atomic.h | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index cf8e1220a4ac..545c48545402 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -372,8 +372,27 @@ struct drm_atomic_state {
 	 *
 	 * Allow full modeset. This is used by the ATOMIC IOCTL handler to
 	 * implement the DRM_MODE_ATOMIC_ALLOW_MODESET flag. Drivers should
-	 * never consult this flag, instead looking at the output of
-	 * drm_atomic_crtc_needs_modeset().
+	 * not consult this flag, instead looking at the output of
+	 * drm_atomic_crtc_needs_modeset(). The detailed rules are:
+	 *
+	 * - Drivers must not consult @allow_modeset in the atomic commit path,
+	 *   and instead use drm_atomic_crtc_needs_modeset().
+	 *
+	 * - Drivers may consult @allow_modeset in the atomic check path, if
+	 *   they have the choice between an optimal hardware configuration
+	 *   which requires a modeset, and a less optimal configuration which
+	 *   can be committed without a modeset. An example would be suboptimal
+	 *   scanout FIFO allocation resulting in increased idle power
+	 *   consumption. This allows userspace to avoid flickering and delays
+	 *   for the normal composition loop at reasonable cost.
+	 *
+	 * - Drivers must consult @allow_modeset before adding unrelated struct
+	 *   drm_crtc_state to this commit by calling
+	 *   drm_atomic_get_crtc_state(). See also the warning in the
+	 *   documentation for that function.
+	 *
+	 * - Drivers must never change this flag, it is only under the control
+	 *   of userspace.
 	 */
 	bool allow_modeset : 1;
 	/**
-- 
2.40.1

