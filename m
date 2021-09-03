Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 158A0400516
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 20:44:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F00A6E8C9;
	Fri,  3 Sep 2021 18:44:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E975B6E8C9
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Sep 2021 18:44:07 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id x19so202916pfu.4
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Sep 2021 11:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cSCNJkR9V6raam7Le5SSEi0f1yOJhVw/gdH+2wLQ7eE=;
 b=DYJBiQVkX93WaSJ4W7BfYts1uK4po2qitkNdbPZBac1eMDeI9wgw34HGarDstiePLx
 XyrGkdeLiIr2IK7uSQNhq0+x/0RRUjHsGaNHMJk4wdMyAvmio28Vfoqhk2Tehao+WBRn
 mr9uVKZLlvKL3iIcGQ2bd5iI/On7d88mpI3KmPLHW2pvwIhWqYHEVkDujvHhStvvl8sF
 MpfXyLsy+1Xp6PS0Gnl5Ru89iwl+el0dhV+9iXkc5tD+I23iBuyqjWpH8Fc6t82qGhOT
 jKwC0ddXF6szUn2FOA/QpGgBwdhShbjY8IP++bvJg5eHMO4JWUV6OV7RIJF3tEvKEdJ7
 ooEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cSCNJkR9V6raam7Le5SSEi0f1yOJhVw/gdH+2wLQ7eE=;
 b=hyDgCIq1/jr5i+SNmaEC56d+OCIOoAP4MU7IhrXu6XUjmoQEzm45/4m2wqSoA7QLM8
 j2jidEmUckuGKJw1vX2x3eqvUcwnMeBTCbrrtoHm7WWSVnNJnLpLG9qZUVgit5dZ6REA
 26TaesSa0QNCCHdobiIvKCPdA35eU9rux833IRoTRliJZwqr6XLdgLkMZtgSiwSV+wwB
 x1haEEpTf67MFVVs9rojvF82WKr9DGngRvV84AkwQ2TVb6hpsRODTDSsIU8cNdPaUVg3
 wucRg1y3Jdowyl7dWq1WmtOGYWDfpAalGVjsbaOj8y3brsXRnbsPUgttmNr7f4luYesF
 6OZw==
X-Gm-Message-State: AOAM533YnD8Ofh40RKEco9P+ySZ9bZs+dXfpoUKaRxDIG4paW3dShbGU
 VwAq+kKQ25n4bZ+t2NL3T8k7ZJbOS8o=
X-Google-Smtp-Source: ABdhPJyigIiNAB8BtDmDh/qK7OSsffWeFcfu4PJL/ieFiTjF0teQrB8CoJp3e6ZiEM5k4dcyNEJqPw==
X-Received: by 2002:a63:4c0e:: with SMTP id z14mr357640pga.427.1630694646866; 
 Fri, 03 Sep 2021 11:44:06 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id j1sm21218pjz.36.2021.09.03.11.44.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 11:44:05 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Cc: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
 Pekka Paalanen <ppaalanen@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 3/9] drm/atomic-helper: Set fence deadline for vblank
Date: Fri,  3 Sep 2021 11:47:54 -0700
Message-Id: <20210903184806.1680887-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903184806.1680887-1-robdclark@gmail.com>
References: <20210903184806.1680887-1-robdclark@gmail.com>
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

v2: Comment typo fix (danvet)

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 36 +++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 2c0c6ec92820..3322dafd675f 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1407,6 +1407,40 @@ void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
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
@@ -1436,6 +1470,8 @@ int drm_atomic_helper_wait_for_fences(struct drm_device *dev,
 	struct drm_plane_state *new_plane_state;
 	int i, ret;
 
+	set_fence_deadline(dev, state);
+
 	for_each_new_plane_in_state(state, plane, new_plane_state, i) {
 		if (!new_plane_state->fence)
 			continue;
-- 
2.31.1

