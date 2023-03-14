Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 366B86B99A4
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 16:36:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72B4910EAAE;
	Tue, 14 Mar 2023 15:36:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D30F310E833
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 15:36:01 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id z5so16423448ljc.8
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 08:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678808161;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LL1jta76uEc1px4/1UNoICUDwq822jJ4GMfO6I/zxMQ=;
 b=m8yEKVzAjUtwECC0b+dhYbmFTCBcYwzD5dTLmfwBtw7YHnePh3yq5/RYp++5SGgdma
 ObXOVPSLicXkXyHiSUhCeOgRYl6BaYMnSs4RnwjWV/qIeWnyWBZGJ+AIWMTkzWwq1X+W
 LbQkBPvlMLSQYXrWWmUXpxakWjwpG7jkTpiPQctlCcUnP+ghgB0Q6wJvEKiX1A/Fv2Us
 MJGuyY5rjE21+UXXDGUjD2fvtpBDpF5p8mj5ju0AkZrtDw2ztOj/syUyegto02yoejHp
 Yun/exAKspSfLI+D29ydqMeLvTrqo7Q1ktcTybq+PwjhvfK91JU3IhuvMvjfRajbGb9u
 P0Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678808161;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LL1jta76uEc1px4/1UNoICUDwq822jJ4GMfO6I/zxMQ=;
 b=4ju3A5K39LWhP8zR0JhBoaHSc10tBK1KCHwoF4SjMY4GzELMUczBUnGmbmGAGlU/U5
 P34JYQW8Sy1Hed5wwD7NpDRixUMVFr1pdnxNdowVpXkezxlJ1I0J3qIg5TIYn9zm1+hc
 RanFK4eiPYwECXh+0EY5Qnd6cQsoSjG7vvx1kYDtQcZq1khNRB0S6AB7XrihH7T1x5RW
 KjkHqK5C5KhBf6dtIuFRAWPtBGXQ9qxMCr69E/w3DBDfgcS+2Fc+zIHCKKDkojdtNyY9
 TehdF5DbKDVqBRXExfV9dDp21PEmSvPQUeha5ZNgrdguu1OukSQ1MsX/ZumKrt9z/c9X
 BYEw==
X-Gm-Message-State: AO0yUKWXcfEEo8921S+/xI7fBgRx8AEaK0ngPy1q3nBNpNtJnQlcNuRS
 PKTSvFsxCRXTZpBDPcRrLU0Y4w==
X-Google-Smtp-Source: AK7set93W8RltGLLVvrFi5bIvd+LNi8IK0uKKDkDSdU3zYRhwZ58YgsvPtd61lUEcvKxQPIMM0AUPA==
X-Received: by 2002:a2e:9244:0:b0:295:b0cd:517 with SMTP id
 v4-20020a2e9244000000b00295b0cd0517mr11935253ljg.35.1678808161444; 
 Tue, 14 Mar 2023 08:36:01 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z8-20020a2eb528000000b0029573844d03sm470854ljm.109.2023.03.14.08.36.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 08:36:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v6 21/32] drm/msm/dpu: simplify dpu_plane_validate_src()
Date: Tue, 14 Mar 2023 18:35:34 +0300
Message-Id: <20230314153545.3442879-22-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230314153545.3442879-1-dmitry.baryshkov@linaro.org>
References: <20230314153545.3442879-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The plane's clipped coordinates has already been validated against FB
size in the drm_atomic_plane_check(). There is no need to check them
again. Remove corresponding checks and inline dpu_plane_validate_src().

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 30 ++++++++---------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index ba850e9feb9b..9c556ba9cb7b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -894,25 +894,6 @@ static void dpu_plane_cleanup_fb(struct drm_plane *plane,
 				old_pstate->needs_dirtyfb);
 }
 
-static bool dpu_plane_validate_src(struct drm_rect *src,
-				   struct drm_rect *fb_rect,
-				   uint32_t min_src_size)
-{
-	/* Ensure fb size is supported */
-	if (drm_rect_width(fb_rect) > MAX_IMG_WIDTH ||
-	    drm_rect_height(fb_rect) > MAX_IMG_HEIGHT)
-		return false;
-
-	/* Ensure src rect is above the minimum size */
-	if (drm_rect_width(src) < min_src_size ||
-	    drm_rect_height(src) < min_src_size)
-		return false;
-
-	/* Ensure src is fully encapsulated in fb */
-	return drm_rect_intersect(fb_rect, src) &&
-		drm_rect_equals(fb_rect, src);
-}
-
 static int dpu_plane_check_inline_rotation(struct dpu_plane *pdpu,
 						const struct dpu_sspp_sub_blks *sblk,
 						struct drm_rect src, const struct dpu_format *fmt)
@@ -998,6 +979,14 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	fb_rect.x2 = new_plane_state->fb->width;
 	fb_rect.y2 = new_plane_state->fb->height;
 
+	/* Ensure fb size is supported */
+	if (drm_rect_width(&fb_rect) > MAX_IMG_WIDTH ||
+	    drm_rect_height(&fb_rect) > MAX_IMG_HEIGHT) {
+		DPU_DEBUG_PLANE(pdpu, "invalid framebuffer " DRM_RECT_FMT "\n",
+				DRM_RECT_ARG(&fb_rect));
+		return -E2BIG;
+	}
+
 	max_linewidth = pdpu->catalog->caps->max_linewidth;
 
 	fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
@@ -1012,7 +1001,8 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		return -EINVAL;
 
 	/* check src bounds */
-	} else if (!dpu_plane_validate_src(&pipe_cfg->src_rect, &fb_rect, min_src_size)) {
+	} else if (drm_rect_width(&pipe_cfg->src_rect) < min_src_size ||
+		   drm_rect_height(&pipe_cfg->src_rect) < min_src_size) {
 		DPU_DEBUG_PLANE(pdpu, "invalid source " DRM_RECT_FMT "\n",
 				DRM_RECT_ARG(&pipe_cfg->src_rect));
 		return -E2BIG;
-- 
2.30.2

