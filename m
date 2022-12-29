Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57104659119
	for <lists+dri-devel@lfdr.de>; Thu, 29 Dec 2022 20:19:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3183E10E217;
	Thu, 29 Dec 2022 19:19:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9ECB10E22F
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 19:19:16 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id g13so28735335lfv.7
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 11:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l3z7cTtmMGquXrl4qC30QYnlf1FGLEKUraRX/smFo6E=;
 b=yby6BHnVWgMDpXylSvbYcgJIhLQluU0tPNg/btT84gCrXykdu71AMYlbEpK8c5Ui/z
 kq+pSip/WDZ0GHEWcZACf5b4V3g5fEcsJGLH6qH4sP9YuRKMjIIy4LzIXBgTb90HpfmW
 g+NwNiJ2CfKNPU145TdSyGDEOQ9R208NhGMBwsjwkCek/oy9LWVY/wGOJslcofs1ttDf
 F0X1442zizpHV7mUWemIaqeHD3IZomlT2WvoLrpxQxiK5vyF7sU9t9ihR3ECmzNvxTlw
 GvIEQw8jYJwc+SSra94UuMfXMpwQE78wiOgyD+q08R0EGrKtCFPtKY9pEBNHlvv6SpNL
 yFUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l3z7cTtmMGquXrl4qC30QYnlf1FGLEKUraRX/smFo6E=;
 b=VgaFn/5dz9B9MRI2Thoz5ZWrRw++85ZAObxPbE0iUdphfsJWm3gBOKjY7Bmb9RH+7I
 HTxjziBXyWpPNYYRbx0mlax5C3FIGTfyNug8Rw7efxl+OisK1wUJez5tSC/XM16vDsYB
 81AXPXCSq7up9awyH8snrAB4FGDmg9x7A+6sJLaNq5uzCgC2MlwOHND03kO9rIENruyA
 T+VpNHWPSXOp5k/gkxuYjUB2dZ1cav58vyNgWNnfB1H35QPbaMXHb+GX6RyfGdkpVeRv
 45nDvMVulzQIgzHYJw1+Xd7+lnS+ZaEL6zl+JJqfbtZvao1DlARsBcKfeDugWD43ulIE
 2yOg==
X-Gm-Message-State: AFqh2kok4MrKlO6zwzlFBsn1Cfd1t4gb/NDiBSpzMPBJ0CMUtcUyZuyI
 Mt38a9ZVFlPd5Ibu9FRyvlgypA==
X-Google-Smtp-Source: AMrXdXttRP03pQCPnGGb47vZceJ+4CSnSqmhhnNzg4yVXDQ4iZc8e3ss8nwUu1TAL8AuWxhM+ibIHQ==
X-Received: by 2002:a05:6512:16a8:b0:4b5:b7ba:cae with SMTP id
 bu40-20020a05651216a800b004b5b7ba0caemr8566894lfb.48.1672341556264; 
 Thu, 29 Dec 2022 11:19:16 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 t13-20020ac24c0d000000b004cb10c151fasm1162295lfq.88.2022.12.29.11.19.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 11:19:15 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 18/27] drm/msm/dpu: simplify dpu_plane_validate_src()
Date: Thu, 29 Dec 2022 21:18:47 +0200
Message-Id: <20221229191856.3508092-19-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221229191856.3508092-1-dmitry.baryshkov@linaro.org>
References: <20221229191856.3508092-1-dmitry.baryshkov@linaro.org>
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

Since the driver uses clipped src coordinates, there is no need to check
against the fb coordinates. Remove corresponding checks and inline
dpu_plane_validate_src().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 30 ++++++++---------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index ff32c28ee16a..a2c891034512 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -906,25 +906,6 @@ static void dpu_plane_cleanup_fb(struct drm_plane *plane,
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
@@ -1010,6 +991,14 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
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
@@ -1024,7 +1013,8 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		return -EINVAL;
 
 	/* check src bounds */
-	} else if (!dpu_plane_validate_src(&pipe_cfg->src_rect, &fb_rect, min_src_size)) {
+	} else if (drm_rect_width(&pipe_cfg->src_rect) < min_src_size ||
+		   drm_rect_height(&pipe_cfg->src_rect) < min_src_size) {
 		DPU_DEBUG_PLANE(pdpu, "invalid source " DRM_RECT_FMT "\n",
 				DRM_RECT_ARG(&pipe_cfg->src_rect));
 		return -E2BIG;
-- 
2.39.0

