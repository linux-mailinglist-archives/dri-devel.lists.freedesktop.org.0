Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D008969D4BA
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 21:19:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04F0510E7A4;
	Mon, 20 Feb 2023 20:19:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7405E10E7A3;
 Mon, 20 Feb 2023 20:19:34 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id h31so1299653pgl.6;
 Mon, 20 Feb 2023 12:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9yF21jz9Wf1+ysDiZnumY8mp3PUToyh/n6nr/hm38/k=;
 b=lvipANIQsaWNUdRbi8p53cd5scp9HEL/FMz/zPxLfgMuJrmChNXU1njroAo0j8QUNN
 +hlen5sr+/XlUz7mobPetUYmDMzXSNLJrUPKnh29D1Oe1gt7UA/iMSbTqVMY8WPKXQnl
 iTP3MCe3Oqph3l6oWVrJgwsziBvVvw2yEPlsRrwp+2Edme83jB88NYVxOFJ/PSU1QtR4
 l01R8SxajC7MaZCCwKkDzkW1IdX/heJI4xKNG4ossix0v+4yU2OzbAp3wExHMxl+tb9N
 aQLW40Rb6GqF0QAcRrPdzGncMPL1PvgmzemEC4C2f/c2lIVyqUUlR9mRKjblXmakm623
 bcyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9yF21jz9Wf1+ysDiZnumY8mp3PUToyh/n6nr/hm38/k=;
 b=Swy03JED9jT8imgKJOMaQ/7OPLRa+RYil0TfxWF29ij5c8GUzqIZKPv3m3klGr4JDp
 K14u9EK8Jgs8kmxMksDrzdfvFzqfYOP9LpMg/wWZMQ6Ct3q7RBl5HOyQvG9VDq1dvAWF
 L8ibthVNu6ZwpFor15vGoR16LNmfjY4kVUVatmhker8Ji2cMfshg0NMT6a1rnCe+tdQc
 E1bkiFjjb/2KtJl5YhQcrTnKUG2ZFtU/etcALWKRKlEwESANXnOzXZa/l40a7gIkEK5w
 eJeqnADb5Y/fV3ObqDSk1Q4aWKmQjS92wnUSkJ8ZsbQDhM0/hPs4WgT/TN4DqNEHGZ0y
 F9Ag==
X-Gm-Message-State: AO0yUKV8e3BBylxnSBjywE4nP8MPzOJTTofQg5b1ghJjuFSgvNgVk/VA
 ynz/RtbQ/pBy8a43uSNMHM3i14jQfxU=
X-Google-Smtp-Source: AK7set+/m0Mqndnwo3/kdSSWJI3dteVdKvTtFzD7FJZbcVYsVjIK/CX8AqRRPuz2ghIlApBRtj94IQ==
X-Received: by 2002:a05:6a00:409a:b0:5ad:8c9:2c9a with SMTP id
 bw26-20020a056a00409a00b005ad08c92c9amr1811318pfb.11.1676924373807; 
 Mon, 20 Feb 2023 12:19:33 -0800 (PST)
Received: from localhost (c-73-67-135-195.hsd1.or.comcast.net. [73.67.135.195])
 by smtp.gmail.com with ESMTPSA id
 z8-20020aa791c8000000b005a8a4665d3bsm2070875pfa.116.2023.02.20.12.19.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 12:19:33 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 11/14] drm/atomic-helper: Set fence deadline for vblank
Date: Mon, 20 Feb 2023 12:18:58 -0800
Message-Id: <20230220201916.1822214-12-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230220201916.1822214-1-robdclark@gmail.com>
References: <20230220201916.1822214-1-robdclark@gmail.com>
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

