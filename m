Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB854EDC9D
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 17:20:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A008410E596;
	Thu, 31 Mar 2022 15:20:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40E8510EA69
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 15:20:29 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id j18so251753wrd.6
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 08:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yl6OLX34D6pVvgWmEp+9CGGMulYgptJ28i/1ysySt7Y=;
 b=DV+J2wC4xr57hA/7P732w8s7ztEs6o+4E/fE426BIU28RDUYGdh+bw+p5dIXL1H8je
 khzU9F3X8IuF8doFQltF4ghx7PMmKwpBuk7HsJ9ROVLJhxM1HXwEXnYhLaYpU/Rg1sEH
 MQWRNV0F+XKYi32eAsnYq4oO7YfTU6RyimiCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yl6OLX34D6pVvgWmEp+9CGGMulYgptJ28i/1ysySt7Y=;
 b=T7EKyu8xikN3Vn/4b87FUWTfNBDjbAaYgPhKlmOvSWeFiacOpQmJf+avhZ+lj0lUFH
 0SJuxoVNXIe3ZGnTIc9hXOMk9pBI8GygqF1hBTIqXCjyHMPSFjBaSI1O97z5EvaYb0n8
 L+Oz1ipq7XHzCYrOW90xRC3A4djm7j61d/TbXoKHy4q6YghKINg2xaHQvY4FMVNSHxb7
 2ErxP8xtBH4aHEGz8D5rtwD99nIj+NcXOglsCK+srIz8VffHV2dwS+sJ62Xxnqmbjmvh
 Ia+zIE3YxRWJNOq/o1bflDBUAiCXvnmSnOpoNAo838FMtgZaGt/6tSS099WxocYGzwfv
 nycw==
X-Gm-Message-State: AOAM532nW4Xp2Z8UQKla4sNNj9jO2ALHoBoAHOaI+AK7R6N+vVjvg6T7
 CAwHPWXivEkKYjK4uDaicdUfIrh3KtNZFeAb
X-Google-Smtp-Source: ABdhPJxeSC9lGpYWoiSwKqgW/c09oonbXh3K4eicBWBv1dodmz+76eAHXXZh4HR3Cpe0ZLlL0pmJTw==
X-Received: by 2002:a5d:40ca:0:b0:203:e037:cd0e with SMTP id
 b10-20020a5d40ca000000b00203e037cd0emr4558104wrq.534.1648740027713; 
 Thu, 31 Mar 2022 08:20:27 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a5d59a8000000b00204178688d3sm22392080wrr.100.2022.03.31.08.20.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 08:20:27 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/atomic-helpers: remove legacy_cursor_update hacks
Date: Thu, 31 Mar 2022 17:20:21 +0200
Message-Id: <20220331152021.2671937-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.34.1
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>, "Kazlauskas,
 Nicholas" <nicholas.kazlauskas@amd.com>, Maxime Ripard <maxime@cerno.tech>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Daniel Vetter <daniel.vetter@intel.com>, mikita.lipski@amd.com,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The stuff never really worked, and leads to lots of fun because it
out-of-order frees atomic states. Which upsets KASAN, among other
things.

For async updates we now have a more solid solution with the
->atomic_async_check and ->atomic_async_commit hooks. Support for that
for msm and vc4 landed. nouveau and i915 have their own commit
routines, doing something similar.

For everyone else it's probably better to remove the use-after-free
bug, and encourage folks to use the async support instead. The
affected drivers which register a legacy cursor plane and don't either
use the new async stuff or their own commit routine are: amdgpu,
atmel, mediatek, qxl, rockchip, sti, sun4i, tegra, virtio, and vmwgfx.

Inspired by an amdgpu bug report.

v2: Drop RFC, I think with amdgpu converted over to use
atomic_async_check/commit done in

commit 674e78acae0dfb4beb56132e41cbae5b60f7d662
Author: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Date:   Wed Dec 5 14:59:07 2018 -0500

    drm/amd/display: Add fast path for cursor plane updates

we don't have any driver anymore where we have userspace expecting
solid legacy cursor support _and_ they are using the atomic helpers in
their fully glory. So we can retire this.

v3: Paper over msm and i915 regression. The complete_all is the only
thing missing afaict.

v4: Fixup i915 fixup ...

References: https://bugzilla.kernel.org/show_bug.cgi?id=199425
References: https://lore.kernel.org/all/20220221134155.125447-9-maxime@cerno.tech/
References: https://bugzilla.kernel.org/show_bug.cgi?id=199425
Cc: Maxime Ripard <maxime@cerno.tech>
Tested-by: Maxime Ripard <maxime@cerno.tech>
Cc: mikita.lipski@amd.com
Cc: Michel Dänzer <michel@daenzer.net>
Cc: harry.wentland@amd.com
Cc: Rob Clark <robdclark@gmail.com>
Cc: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/drm_atomic_helper.c          | 13 -------------
 drivers/gpu/drm/i915/display/intel_display.c | 14 ++++++++++++++
 drivers/gpu/drm/msm/msm_atomic.c             |  2 ++
 3 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 9603193d2fa1..a2899af82b4a 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1498,13 +1498,6 @@ drm_atomic_helper_wait_for_vblanks(struct drm_device *dev,
 	int i, ret;
 	unsigned int crtc_mask = 0;
 
-	 /*
-	  * Legacy cursor ioctls are completely unsynced, and userspace
-	  * relies on that (by doing tons of cursor updates).
-	  */
-	if (old_state->legacy_cursor_update)
-		return;
-
 	for_each_oldnew_crtc_in_state(old_state, crtc, old_crtc_state, new_crtc_state, i) {
 		if (!new_crtc_state->active)
 			continue;
@@ -2135,12 +2128,6 @@ int drm_atomic_helper_setup_commit(struct drm_atomic_state *state,
 			continue;
 		}
 
-		/* Legacy cursor updates are fully unsynced. */
-		if (state->legacy_cursor_update) {
-			complete_all(&commit->flip_done);
-			continue;
-		}
-
 		if (!new_crtc_state->event) {
 			commit->event = kzalloc(sizeof(*commit->event),
 						GFP_KERNEL);
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index d2abe0e430bf..6ca5a6e7703b 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -8799,6 +8799,20 @@ static int intel_atomic_commit(struct drm_device *dev,
 		intel_runtime_pm_put(&dev_priv->runtime_pm, state->wakeref);
 		return ret;
 	}
+
+	/*
+	 * FIXME: Cut over to (async) commit helpers instead of hand-rolling
+	 * everything.
+	 */
+	if (state->base.legacy_cursor_update) {
+		struct intel_crtc_state *new_crtc_state;
+		struct intel_crtc *crtc;
+		int i;
+
+		for_each_new_intel_crtc_in_state(state, crtc, new_crtc_state, i)
+			complete_all(&new_crtc_state->uapi.commit->flip_done);
+	}
+
 	intel_shared_dpll_swap_state(state);
 	intel_atomic_track_fbs(state);
 
diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index 1686fbb611fd..b3cfabebe5d6 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -222,6 +222,8 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
 		/* async updates are limited to single-crtc updates: */
 		WARN_ON(crtc_mask != drm_crtc_mask(async_crtc));
 
+		complete_all(&async_crtc->state->commit->flip_done);
+
 		/*
 		 * Start timer if we don't already have an update pending
 		 * on this crtc:
-- 
2.34.1

