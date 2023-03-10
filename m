Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0A66B335E
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 01:58:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 540B110E945;
	Fri, 10 Mar 2023 00:57:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6C7710E927
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 00:57:25 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id s20so4597224lfb.11
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 16:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678409845;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hkRDIK8ume27O2eNp/2vFx54xBZXr96ITOU7VC+DkN8=;
 b=C3OdzVqwMLwGZQldG8df9J+3PEEDSHEjYgvdKOudQMVTqtHS8ELmwJrSwZM+OhsASO
 F/un4sFyOMNt2Mgv7IXu/UFRXajh63SweJAZIghAVG/epBgiS+/LqD3GTsQZYGq5r0rj
 gHtiE+lYSiUxxMuYljj0LiB3sl8ufKH3aFCuS+QB4r8QUJvVTM+Z5X9XJFGs4eOrSKqL
 kKjsrTOReQyPkeGykjHhwsVxVX/KlEc3nOWP28UNv++c1e2sBKEkwr+07Ls3MGIc+jEC
 TAMm8u+kVIq2SzVVX2s5xtZjfKUo83wwYHuVwuad3BfLnlDdOZSUxps/Da8N9Prl3iRw
 HOYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678409845;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hkRDIK8ume27O2eNp/2vFx54xBZXr96ITOU7VC+DkN8=;
 b=JrXeuX9I0+ivT5HcIb/RM6P/Ra3C+bR/DAmA1eDHGf2U7bf+oIDzIbyUG2aXe7ihnP
 4N++58TNVnfT9ih9AaBZcZiSQYpZfmVmrmwhshKlte/nlbGWuFLCsOST9g3LWEQ9GxIw
 ybA3Z70kjiupXRjUmzKeI/NZCVZ5GRs2lO+spMh79J2Vn/P+BB71sTFB2SXIZLNjWfl9
 D0w+mOPlkG8etWM2axANwa5khsPZFGyKdw2YtwlQLQHhOM3vWvmjYxIMlClDXIFQxiq1
 FT4V+WWG7UcoT1exi1Bpc6AU7Z7N4Rzhkn+OUpmE5F9+vHOai3/WUKS+y7AXw5Kq9mTf
 w1Sw==
X-Gm-Message-State: AO0yUKXpQajl9uRs7+8DcZ7Zwu84pjFK6Wrht496AwO5WgcLTFo6LJLs
 4Ca6EIvJRwRUvJpH8GnEEow4jg==
X-Google-Smtp-Source: AK7set9O7IDe8FcaApcedfEGlJ63qT0R2UusEtH4nL7KZ+BlGslLl53NUUYZftrGN3BghgfsasH/PA==
X-Received: by 2002:ac2:5971:0:b0:4cc:96f8:f9c4 with SMTP id
 h17-20020ac25971000000b004cc96f8f9c4mr6780976lfp.45.1678409845218; 
 Thu, 09 Mar 2023 16:57:25 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 m13-20020ac2428d000000b004d8540b947asm75280lfh.56.2023.03.09.16.57.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 16:57:24 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v5 21/32] drm/msm/dpu: simplify dpu_plane_validate_src()
Date: Fri, 10 Mar 2023 02:56:53 +0200
Message-Id: <20230310005704.1332368-22-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310005704.1332368-1-dmitry.baryshkov@linaro.org>
References: <20230310005704.1332368-1-dmitry.baryshkov@linaro.org>
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
2.39.2

