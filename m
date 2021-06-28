Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 437B93B68FD
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 21:20:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 835966E524;
	Mon, 28 Jun 2021 19:20:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4808E6E524
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jun 2021 19:20:02 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id t17so34641187lfq.0
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jun 2021 12:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Z4PQd+vXqHbOkJOfTvhkdMDFsyjL9DZBFjLZj+37g1g=;
 b=G3gXlhGHpTfgbNbj474Gyg+uCm39rJXHb/qC+hYXB/57E0w+gi5VVp2+jUoVsr3m6h
 AQVRpgZIsEgAx5ODYge8e61QyKRtpiR8oq+0CR+ul+dQVjaBaHRS9/0x3uqm1yMv9oEq
 lPG58DNDN7A3/B+b28yYvZNiquRPSlZSN2ijIERhMZSkvVXgt+Z+XxKlT2h+/fVeAwQ4
 E2YgLiuf+adZwAJUeHuPPnh4YILkrbc5ZYYOn10P31r8ayDGZdU/BBhSiQ/PFn0aHqKE
 MCBFMA1061DGqRp1qzPE1gq01xxHtvbVxTpenn8th/+gP77vlPY4HcWFSRPXmY1mQSv7
 5TPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Z4PQd+vXqHbOkJOfTvhkdMDFsyjL9DZBFjLZj+37g1g=;
 b=LGbgQxO6mSCMZeH3u0r3RLH6nZrE1Cq0OMQhm4q7leBhaMSrCVEiY7oTOmSG9kurAR
 N9kY7TzofPxls1vO/X9dEjkneuxhV9AwaCrjMp9Np5e00A4NPPdj3lmXOntoA6FvcuTm
 60PlfEQOhDSXTr+vuLfYThUgBzbTHzFrXWLnNgqX7bd/hfSyMQyqav91c81UAAqfSq0w
 Fictw8mPWix4h1UQwtI1k235oKLZpGHDJY6OY1TZGO2+AwwluY7tSQ9Ig2c9xP6yrHKt
 RjdQwxrSwfAfQw95AEIhTQZbXLhe7759v+kZbDnxRHfGtgcfG5+6DwRmEUs+YlbWxert
 QGvw==
X-Gm-Message-State: AOAM531wWtwGMab6b0+7N5h8gjXYXKUIixEhv8HH67B6QZiQFp56SwOn
 Ib7/wtG860PhtCTnYtsrnmupqQ==
X-Google-Smtp-Source: ABdhPJxzv5a7i6tA7s53JhRK5iuieau3p2c4ao2+64vENRc5CWdfvEL/e1MMPpnWSbUxb39WKbStWA==
X-Received: by 2002:ac2:4e98:: with SMTP id o24mr19528579lfr.604.1624908000785; 
 Mon, 28 Jun 2021 12:20:00 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([188.162.64.209])
 by smtp.gmail.com with ESMTPSA id x3sm1099728ljm.43.2021.06.28.12.19.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 12:20:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH] drm/msm/dpu: add support for alpha blending properties
Date: Mon, 28 Jun 2021 22:19:58 +0300
Message-Id: <20210628191958.2754731-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for alpha blending properties. Setup the plane blend state
according to those properties.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 43 ++++++++++++++++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 10 ++++--
 2 files changed, 37 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 9a5c70c87cc8..768012243b44 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -30,12 +30,6 @@
 #include "dpu_core_perf.h"
 #include "dpu_trace.h"
 
-#define DPU_DRM_BLEND_OP_NOT_DEFINED    0
-#define DPU_DRM_BLEND_OP_OPAQUE         1
-#define DPU_DRM_BLEND_OP_PREMULTIPLIED  2
-#define DPU_DRM_BLEND_OP_COVERAGE       3
-#define DPU_DRM_BLEND_OP_MAX            4
-
 /* layer mixer index on dpu_crtc */
 #define LEFT_MIXER 0
 #define RIGHT_MIXER 1
@@ -146,20 +140,43 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
 {
 	struct dpu_hw_mixer *lm = mixer->hw_lm;
 	uint32_t blend_op;
+	uint32_t fg_alpha, bg_alpha;
 
-	/* default to opaque blending */
-	blend_op = DPU_BLEND_FG_ALPHA_FG_CONST |
-		DPU_BLEND_BG_ALPHA_BG_CONST;
+	fg_alpha = pstate->base.alpha >> 8;
+	bg_alpha = 0xff - fg_alpha;
 
-	if (format->alpha_enable) {
+	/* default to opaque blending */
+	if (pstate->base.pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE ||
+	    !format->alpha_enable) {
+		blend_op = DPU_BLEND_FG_ALPHA_FG_CONST |
+			DPU_BLEND_BG_ALPHA_BG_CONST;
+	} else if (pstate->base.pixel_blend_mode == DRM_MODE_BLEND_PREMULTI) {
+		blend_op = DPU_BLEND_FG_ALPHA_FG_CONST |
+			DPU_BLEND_BG_ALPHA_FG_PIXEL;
+		if (fg_alpha != 0xff) {
+			bg_alpha = fg_alpha;
+			blend_op |= DPU_BLEND_BG_MOD_ALPHA |
+				    DPU_BLEND_BG_INV_MOD_ALPHA;
+		} else {
+			blend_op |= DPU_BLEND_BG_INV_ALPHA;
+		}
+	} else {
 		/* coverage blending */
 		blend_op = DPU_BLEND_FG_ALPHA_FG_PIXEL |
-			DPU_BLEND_BG_ALPHA_FG_PIXEL |
-			DPU_BLEND_BG_INV_ALPHA;
+			DPU_BLEND_BG_ALPHA_FG_PIXEL;
+		if (fg_alpha != 0xff) {
+			bg_alpha = fg_alpha;
+			blend_op |= DPU_BLEND_FG_MOD_ALPHA |
+				    DPU_BLEND_FG_INV_MOD_ALPHA |
+				    DPU_BLEND_BG_MOD_ALPHA |
+				    DPU_BLEND_BG_INV_MOD_ALPHA;
+		} else {
+			blend_op |= DPU_BLEND_BG_INV_ALPHA;
+		}
 	}
 
 	lm->ops.setup_blend_config(lm, pstate->stage,
-				0xFF, 0, blend_op);
+				fg_alpha, bg_alpha, blend_op);
 
 	DRM_DEBUG_ATOMIC("format:%p4cc, alpha_en:%u blend_op:0x%x\n",
 		  &format->base.pixel_format, format->alpha_enable, blend_op);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index ec4a6f04394a..c989621209aa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1339,9 +1339,7 @@ static void dpu_plane_reset(struct drm_plane *plane)
 		return;
 	}
 
-	pstate->base.plane = plane;
-
-	plane->state = &pstate->base;
+	__drm_atomic_helper_plane_reset(plane, &pstate->base);
 }
 
 #ifdef CONFIG_DEBUG_FS
@@ -1647,6 +1645,12 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 	if (ret)
 		DPU_ERROR("failed to install zpos property, rc = %d\n", ret);
 
+	drm_plane_create_alpha_property(plane);
+	drm_plane_create_blend_mode_property(plane,
+			BIT(DRM_MODE_BLEND_PIXEL_NONE) |
+			BIT(DRM_MODE_BLEND_PREMULTI) |
+			BIT(DRM_MODE_BLEND_COVERAGE));
+
 	drm_plane_create_rotation_property(plane,
 			DRM_MODE_ROTATE_0,
 			DRM_MODE_ROTATE_0 |
-- 
2.30.2

