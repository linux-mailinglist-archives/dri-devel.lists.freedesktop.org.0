Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D1269BC3D
	for <lists+dri-devel@lfdr.de>; Sat, 18 Feb 2023 22:16:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7948A10E579;
	Sat, 18 Feb 2023 21:16:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 379BC10E56E;
 Sat, 18 Feb 2023 21:16:04 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 nb7-20020a17090b35c700b0023058bbd7b2so1389164pjb.0; 
 Sat, 18 Feb 2023 13:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9yF21jz9Wf1+ysDiZnumY8mp3PUToyh/n6nr/hm38/k=;
 b=o3KZu6xCZhOx8yKLO3mCPTkTO6tIsRYmbOCGeJBqVniPc0jFqnNjoHWeefirhtUCQD
 TMs4eZTOs8KhFyvy1g7Y9zc5kpRNWaU+YjrhCI0IjZKJHAefvOW94v4Dvkm0LEbtvHuu
 vzxcd1WXm9wrdxUdbR7dY2ZQ2XClD6c5Gn77V1jB543GNPc7fQn2yq5/fobhwsvghKil
 2LcGEX1LDJhLA9cS8/Eq6f+d05FvrxWhwhn9n4RxA6yLI8lNL9gy4vMuECMYp3adFLxY
 jFsUaLS6DZPqaOrW6zXMPOxhyfe3J7t7Zryk/soeD4VzpBWEKQhlxetBTVeAudYUDL07
 N2HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9yF21jz9Wf1+ysDiZnumY8mp3PUToyh/n6nr/hm38/k=;
 b=EqCfoeLgCcpvOROepszYjVmt18KPlwjyQ9N3n31vkFbjvVpR7jOapfinGZ55j7bD63
 CkFsYF5+BcE0dwaoEJEfxRPcba5XmMksYam8R0PzzapgjrrY7dlJLQFOiD+8qFg/POAx
 h5ebbulY28VYLu4v0Q8BqOqgHm/LL+1TviqJSeVwB8zPOHNKueWUDCHgVNC4o5uvu7Wq
 mYzJopmV+MTgFx6S++RFnWrM2g36/89hAc8vVG13/k/mYBMYsMaSIdRhS9HebcPNFGlG
 55HRjgC1B3FN4bu8+pWjzmGTPl7C4Pa62G1W2is+IcPfQLy4naEMIxxTLeanxatlIf0L
 /y6Q==
X-Gm-Message-State: AO0yUKVwZNOTy353wHfkaAd8f1L/HtGkxBdLdhxLDbgscArbQbw973NW
 nUSSNEcfFX1wVzHH97LuwBzOb/S0Rnc=
X-Google-Smtp-Source: AK7set/CikEflsQKGjABB3qCsM3+X57SWJofwv3VcrtlhsrKcTwjJR9A6EG4N9La9GuATGYrx2hX2w==
X-Received: by 2002:a17:902:cf52:b0:19a:7c7d:7180 with SMTP id
 e18-20020a170902cf5200b0019a7c7d7180mr3479908plg.34.1676754963579; 
 Sat, 18 Feb 2023 13:16:03 -0800 (PST)
Received: from localhost (c-73-67-135-195.hsd1.or.comcast.net. [73.67.135.195])
 by smtp.gmail.com with ESMTPSA id
 i3-20020a170902c28300b0019251e959b1sm5033341pld.262.2023.02.18.13.16.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Feb 2023 13:16:03 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 11/14] drm/atomic-helper: Set fence deadline for vblank
Date: Sat, 18 Feb 2023 13:15:54 -0800
Message-Id: <20230218211608.1630586-12-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230218211608.1630586-1-robdclark@gmail.com>
References: <20230218211608.1630586-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
 open list <linux-kernel@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Pekka Paalanen <ppaalanen@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

For an atomic commit updating a single CRTC (ie. a pageflip) calculate
the next vblank time, and inform the fence(s) of that deadline.

v2: Comment typo fix (danvet)

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 36 +++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index d579fd8f7cb8..35a4dc714920 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1511,6 +1511,40 @@ void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drm_atomic_helper_commit_modeset_enables);
 
+/*
+ * For atomic updates which touch just a single CRTC, calculate the time of the
+ * next vblank, and inform all the fences of the deadline.
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
@@ -1540,6 +1574,8 @@ int drm_atomic_helper_wait_for_fences(struct drm_device *dev,
 	struct drm_plane_state *new_plane_state;
 	int i, ret;
 
+	set_fence_deadline(dev, state);
+
 	for_each_new_plane_in_state(state, plane, new_plane_state, i) {
 		if (!new_plane_state->fence)
 			continue;
-- 
2.39.1

