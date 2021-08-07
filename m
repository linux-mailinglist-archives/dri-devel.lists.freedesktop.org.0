Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED613E36BB
	for <lists+dri-devel@lfdr.de>; Sat,  7 Aug 2021 20:34:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1979489D5E;
	Sat,  7 Aug 2021 18:34:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F32889D61;
 Sat,  7 Aug 2021 18:34:01 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 u5-20020a17090ae005b029017842fe8f82so13853265pjy.0; 
 Sat, 07 Aug 2021 11:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aoP+p68TDzQ/y913MRdpJPhaI7fxLtI+TCimpBmC6mc=;
 b=jxoaJLEPG/GijQHscHZ1UO+GmjWNhZDYhZJ6tBqPxEyAWLCkgQAPARNKxaiJfAIbFN
 G3aJmExrlZMaCs0I4eqtToTAjMMmUyg4f2R60722tib4vTNV9LSOcBVSHrqHX78A6qXA
 /JBAnotNOQ/2WOuzi+xPlqhuCwuXWRwPTNRS0A18QPLsXmqSw96wsl14iBuDl6reBH8l
 6jruuBhoGWkcShSOMB8PCy9lxGv0peIVQe15DwtR4nbyU5t0qbSg6JhlX8jIDwhi7mtQ
 kpa8q240f16/D5G+udjMcj1z2ElrZanF6ZK0u1psQzxtmagxfm75LoD8PUzFdAd8Bbxi
 XkyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aoP+p68TDzQ/y913MRdpJPhaI7fxLtI+TCimpBmC6mc=;
 b=DFzAbe+AyyNcbWLErXgwpMr7qcUGxO8nCongdsKy0eL1mwoEcCXAAR32BoJSwh0+bu
 83DhoW5pWhpjJtoEqMijro7pD7cXkhk82/aoo3DPPb8r7V6arpVinkZuHLJ9OHpl+tv9
 d6SWKFPUChvxWg7xaAR5iwFLiHYaZwIu33SSclJWyU+09UavEOjwVQlGGHXCZ9Vd/ikf
 hDtRG2wILUKUi1tqXBzx2UCNqA+OoORXrnQr2CAbzfjDNj8Nzixi9/4TtWKrSP6d5SWR
 4EcbsYNQ21o00x8IlrLxOQEYliu+ZiLNu9Qx3d48PG+m20Bk4Qx/P9c6TczzbUlqMoIJ
 YDFA==
X-Gm-Message-State: AOAM532d+8SxCzAKDVlyYMxXLYaKWc+3JZSBMaNOdNR6IUgE36sBp0px
 A0FXyQXsw/Hb5M+PEY2+3N5jlAQHNDJq/KFV
X-Google-Smtp-Source: ABdhPJy8umXGJYYa0wi8FlFkcBof1/15lSb7sFcNmVyHD1zyogTPX6X+34Tx4r2heDTK/LqUmCsAtQ==
X-Received: by 2002:a17:90a:d245:: with SMTP id
 o5mr27625669pjw.105.1628361240572; 
 Sat, 07 Aug 2021 11:34:00 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 p2sm15213588pfn.141.2021.08.07.11.33.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 11:33:59 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Rob Clark <robdclark@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 3/5] drm/atomic-helper: Set fence deadline for vblank
Date: Sat,  7 Aug 2021 11:37:57 -0700
Message-Id: <20210807183804.459850-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210807183804.459850-1-robdclark@gmail.com>
References: <20210807183804.459850-1-robdclark@gmail.com>
MIME-Version: 1.0
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

From: Rob Clark <robdclark@chromium.org>

For an atomic commit updating a single CRTC (ie. a pageflip) calculate
the next vblank time, and inform the fence(s) of that deadline.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 36 +++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index bc3487964fb5..7caa2c3cc304 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1406,6 +1406,40 @@ void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drm_atomic_helper_commit_modeset_enables);
 
+/*
+ * For atomic updates which touch just a single CRTC, calculate the time of the
+ * next vblank, and inform all the fences of the of the deadline.
+ */
+static void set_fence_deadline(struct drm_device *dev,
+			       struct drm_atomic_state *state)
+{
+	struct drm_crtc *crtc, *wait_crtc = NULL;
+	struct drm_crtc_state *new_crtc_state;
+	struct drm_plane *plane;
+	struct drm_plane_state *new_plane_state;
+	ktime_t vbltime;
+	int i;
+
+	for_each_new_crtc_in_state (state, crtc, new_crtc_state, i) {
+		if (wait_crtc)
+			return;
+		wait_crtc = crtc;
+	}
+
+	/* If no CRTCs updated, then nothing to do: */
+	if (!wait_crtc)
+		return;
+
+	if (drm_crtc_next_vblank_time(wait_crtc, &vbltime))
+		return;
+
+	for_each_new_plane_in_state (state, plane, new_plane_state, i) {
+		if (!new_plane_state->fence)
+			continue;
+		dma_fence_set_deadline(new_plane_state->fence, vbltime);
+	}
+}
+
 /**
  * drm_atomic_helper_wait_for_fences - wait for fences stashed in plane state
  * @dev: DRM device
@@ -1435,6 +1469,8 @@ int drm_atomic_helper_wait_for_fences(struct drm_device *dev,
 	struct drm_plane_state *new_plane_state;
 	int i, ret;
 
+	set_fence_deadline(dev, state);
+
 	for_each_new_plane_in_state(state, plane, new_plane_state, i) {
 		if (!new_plane_state->fence)
 			continue;
-- 
2.31.1

