Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1673313308D
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 21:29:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02BC16E135;
	Tue,  7 Jan 2020 20:29:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 001136E136
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 20:28:58 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id i6so436137pfc.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2020 12:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=sjJ0uVz+2aygb69iiy5pJizL3B57FBYYiTtW4flheNU=;
 b=oSmeJOVJtz+EN6rqqOaJkUZ6gXxhmTzLCY2aUIKhBsSgNpwJVw3T17si3KBwsGUWso
 jduwUbPhlRdH93NKbsPt3m0n5uT9BgVgz0I9O7TA33v0XLrkjAoR5QBtuvXC9Z4hGFDb
 XIElsFMjIKYeRMLv21bbkDk6PWmurzzZhAe+C2y6v8ULniYclzNRCGr+s0RZbB69y3Ev
 9uFAHX6S0dYygPC2dKO4JjI7jFrdOA5D0P2lJxRD9lkD7S0i9dh5rkI6sL7iel/TkGN4
 /CpemFgsdssmvGCV+lGYsqrmVs9W5VRhC0IyWfniZztDESth4f02zvtRhsJqHNx0YhD2
 m+RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=sjJ0uVz+2aygb69iiy5pJizL3B57FBYYiTtW4flheNU=;
 b=dQ9LsyE1ZGReQWq5kef9zG6wPkVQuWb/xcf65yXfPuB6x1yYDmH2cipu8VGssTSBxb
 cb2Jq4VfzLFd6W1CkC1QN8VBwg45KbaINVOBySDXYD2HZjbkVm0FdhiLqBbBwAm9/EOs
 qXH/8DUFwcT6CfP8qU4pEQYIiKO+dxkGTiN34zD4ngTbGyoh6MvzJ7gVtGYo7x4wOdVI
 nBe0cNFE8bsskJb4kFir77ro37wcdhVL5CmqsFBEVvIJTTihICsF8Tqh5402ZYm/yI9v
 nLfCiCH7snouxY47QWf0vGgCdhDMaOxLoVAELBlsxH0nNrIaQwIZ9SLmyEk4R/q3xq5u
 WpGQ==
X-Gm-Message-State: APjAAAXX09yD5JAE1cAEPqW+RnqAah1FlCRh6PgnqVgzwMgNmp0FKpUt
 J800gNWnQ3uyQCmMsI0EqZpNEQ==
X-Google-Smtp-Source: APXvYqwEAN+GHayhfNfvNeQhmIvj2S/s9WBDSVe1DPPR2BH02UA4TWxlx+H1YxvcBlhuAl1xBjBL/g==
X-Received: by 2002:a62:b418:: with SMTP id h24mr1178771pfn.192.1578428938618; 
 Tue, 07 Jan 2020 12:28:58 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 x33sm578934pga.86.2020.01.07.12.28.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 12:28:57 -0800 (PST)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm: msm: Quiet down plane errors in atomic_check
Date: Tue,  7 Jan 2020 20:28:52 +0000
Message-Id: <20200107202852.55819-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
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
Cc: Alistair Delva <adelva@google.com>, Amit Pundir <amit.pundir@linaro.org>,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Todd Kjos <tkjos@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With the db845c running AOSP, I see the following error on every
frame on the home screen:
  [drm:dpu_plane_atomic_check:915] [dpu error]plane33 invalid src 2880x1620+0+470 line:2560

This is due to the error paths in atomic_check using
DPU_ERROR_PLANE(), and the drm_hwcomposer using atomic_check
to decide how to composite the frame (thus it expects to see
atomic_check to fail).

In order to avoid spamming the logs, this patch converts the
DPU_ERROR_PLANE() calls to DPU_DEBUG_PLANE() calls in
atomic_check.

Cc: Todd Kjos <tkjos@google.com>
Cc: Alistair Delva <adelva@google.com>
Cc: Amit Pundir <amit.pundir@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 58d5acbcfc5c..d19ae0b51d1c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -858,7 +858,7 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 					  pdpu->pipe_sblk->maxupscale << 16,
 					  true, true);
 	if (ret) {
-		DPU_ERROR_PLANE(pdpu, "Check plane state failed (%d)\n", ret);
+		DPU_DEBUG_PLANE(pdpu, "Check plane state failed (%d)\n", ret);
 		return ret;
 	}
 	if (!state->visible)
@@ -884,13 +884,13 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		(!(pdpu->features & DPU_SSPP_SCALER) ||
 		 !(pdpu->features & (BIT(DPU_SSPP_CSC)
 		 | BIT(DPU_SSPP_CSC_10BIT))))) {
-		DPU_ERROR_PLANE(pdpu,
+		DPU_DEBUG_PLANE(pdpu,
 				"plane doesn't have scaler/csc for yuv\n");
 		return -EINVAL;
 
 	/* check src bounds */
 	} else if (!dpu_plane_validate_src(&src, &fb_rect, min_src_size)) {
-		DPU_ERROR_PLANE(pdpu, "invalid source " DRM_RECT_FMT "\n",
+		DPU_DEBUG_PLANE(pdpu, "invalid source " DRM_RECT_FMT "\n",
 				DRM_RECT_ARG(&src));
 		return -E2BIG;
 
@@ -899,19 +899,19 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		   (src.x1 & 0x1 || src.y1 & 0x1 ||
 		    drm_rect_width(&src) & 0x1 ||
 		    drm_rect_height(&src) & 0x1)) {
-		DPU_ERROR_PLANE(pdpu, "invalid yuv source " DRM_RECT_FMT "\n",
+		DPU_DEBUG_PLANE(pdpu, "invalid yuv source " DRM_RECT_FMT "\n",
 				DRM_RECT_ARG(&src));
 		return -EINVAL;
 
 	/* min dst support */
 	} else if (drm_rect_width(&dst) < 0x1 || drm_rect_height(&dst) < 0x1) {
-		DPU_ERROR_PLANE(pdpu, "invalid dest rect " DRM_RECT_FMT "\n",
+		DPU_DEBUG_PLANE(pdpu, "invalid dest rect " DRM_RECT_FMT "\n",
 				DRM_RECT_ARG(&dst));
 		return -EINVAL;
 
 	/* check decimated source width */
 	} else if (drm_rect_width(&src) > max_linewidth) {
-		DPU_ERROR_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
+		DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
 				DRM_RECT_ARG(&src), max_linewidth);
 		return -E2BIG;
 	}
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
