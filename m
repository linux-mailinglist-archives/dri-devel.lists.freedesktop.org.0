Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4876E8B0C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 09:13:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9E5B10EBA5;
	Thu, 20 Apr 2023 07:12:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 096CE10E9D2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 14:42:00 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id r15so7684960wmo.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 07:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20221208.gappssmtp.com; s=20221208; t=1681915319; x=1684507319;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hkfWN99F4hBvx1XEfrJngIeLn15ofD5JlY1D197wDT8=;
 b=3Cxnjb3YswWA056HbGtIB6yadcSK4Yw3KDO0AMN47lIDDhRRgAWvheSzQq8kp0BwkS
 2Nyc/uYul5Iv+c4Vbn9nFXOMVfRBohbbkWocAG3ZKtrNETAr4kStKiew2dhHkoeXzs6n
 bzcnOQt5hzd8m4iwwFPB4/orgBLtAHK+7O5n7QbqgrwmHWC3l7rkPq1mY9mwqiS6HBxG
 e2fgrzmdzmEffoQJIBtRek/UGiI0KqVKa87HhQJNF7bqzvlUg1jg1fGwcmwQYAzmUiGE
 KIIJDqCPxUwSRyC0bwipOmSllHVYHwHwVEGrxinDD/uJVSl5iD1zA/Xz68bpvzAxAfbq
 S+YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681915319; x=1684507319;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hkfWN99F4hBvx1XEfrJngIeLn15ofD5JlY1D197wDT8=;
 b=MvcngDFt/6jKqLFxM9B1Syavt6wMWvDmIH/GQeIRROAsnBmNPCY0kXp7G9Qpg5FVjE
 U10Mbgtf9/OKj7D4awquC2JBEe/yAaCXcBJqud/iCI2QykMhF79Eh4qqiTEHpg421YNh
 mqI5TPkm3Qm0Z85n/1j2YsFdPKY7pd7Huw620HBEQHK+27QvIYuvrfXGMBIjpuuT8s1j
 QdelWodw5wjpbypMT/pq5v+LzicZHz5aFEn/t6/SUeQHq9Yp/AQfPIoMutA33xJXRmvV
 9G4yiWMIFV9C2EU2zEvVPEjHKE9NTW9Esu/DktDua+kE93AgFEbQEJcnHRQcJkqOgJDJ
 VDfw==
X-Gm-Message-State: AAQBX9fAaJ9okKees4OtT9rIyiPP7unOLnqBqpVzzqP8WhbMeZLHDHAV
 4WdXHYwpbHJuA1JqfPd0/ky2
X-Google-Smtp-Source: AKy350Z4XvreRKuse360cUN0YJiTS3FQn+PMeJOel2baif9x0ixM+kMjMz4P1+eNretMarvSA/00hQ==
X-Received: by 2002:a7b:ce89:0:b0:3f0:68ce:5465 with SMTP id
 q9-20020a7bce89000000b003f068ce5465mr17171216wmj.7.1681915319103; 
 Wed, 19 Apr 2023 07:41:59 -0700 (PDT)
Received: from [127.0.1.1] (freebox.vlq16.iliad.fr. [213.36.7.13])
 by smtp.gmail.com with ESMTPSA id
 m22-20020a7bcb96000000b003f17131952fsm2388519wmi.29.2023.04.19.07.41.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 07:41:58 -0700 (PDT)
From: Arnaud Vrac <avrac@freebox.fr>
Date: Wed, 19 Apr 2023 16:41:13 +0200
Subject: [PATCH 06/11] drm/msm/dpu: support cursor sspp hw blocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230419-dpu-tweaks-v1-6-d1bac46db075@freebox.fr>
References: <20230419-dpu-tweaks-v1-0-d1bac46db075@freebox.fr>
In-Reply-To: <20230419-dpu-tweaks-v1-0-d1bac46db075@freebox.fr>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4055; i=avrac@freebox.fr;
 h=from:subject:message-id; bh=JIN3wOAwRVDkVnPtsZfcQyHShaT43mZJjQaS4MuN1UU=;
 b=owEBbQKS/ZANAwAIAXED/9m7NDSrAcsmYgBkP/2izIHn4G021J6ANBFbFX+WtbijpqW9KvBFY
 pB2QJc9EzyJAjMEAAEIAB0WIQSUwb/ndwkXHdZ/QQZxA//ZuzQ0qwUCZD/9ogAKCRBxA//ZuzQ0
 qx3jD/wP2/AD6Il7RXMRRrIsrRVYu3W++Ep5Yc+PFxyTi5+BnuCvuv8VakNG1e9ubJ6WWyT6d3b
 xnctAKrsGKFOMyC/7mGJ9+5CwR0EJ9Hn1DZVfZ3S0RZng8TxD5CUAHlSJifKfvZEh8PHlNoABuP
 9LX2eXedY1HDcoYeLFKer1BD19/6V03G0E+HwgKWlUtHuI3sZlyWdB5lMBFdM6MbfApECvNXWBl
 vfYNv7JxAlf9KVBpc66UfCKuBwjakG19dvxDeodFnGVCHINs5yIW1+W/jUz85vadPUempbJWlwk
 bZHLkqbdtptrzTVYcGRJ8H+JRv4wCi4maG3l4Y407VPtYkTJJJyLhhZ6Ktgz1m5WHfOUI+wB1VT
 0+EX9Jm+qyFY3MxTDmd2GJi8rElsK87p+D+/jLszbWnJrA64jmazciEODemu0wVL+MPqX9bNbPs
 wn0XE7GOtU7oFE8pvtZFoR3iPkfiYSj6tRy57NAMeD7xDbGZ46nOOdNhiml0pHqtpB8MeNyf3iz
 B+Hor7gxz7abwgQfN+S6FoKrBLWdnwzoa7TQU33PxQhc6A1tQwf5cm+z3cxLKR+MiKjhlDRcftN
 PHyhv3TtV9vcPpnXk1LHLSXHHlrWG4ySJTmft2kGccJXG3UlJfkV7DBhVnjkv8WWcZYTBJLuBgE
 x9mqsOvYDGc2YTQ==
X-Developer-Key: i=avrac@freebox.fr; a=openpgp;
 fpr=6225092072BB58E3CEEC091E75392A176D952DB4
X-Mailman-Approved-At: Thu, 20 Apr 2023 07:12:56 +0000
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
Cc: Arnaud Vrac <avrac@freebox.fr>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cursor SSPP must be assigned to the last mixer stage, so we assign an
immutable zpos property with a value higher than primary/overlay planes,
to ensure it will always be on top.

Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c   | 19 ++++++++++++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 26 +++++++++++++++++++++++---
 2 files changed, 37 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 0e7a68714e9e1..6cce0f6cfcb01 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -738,13 +738,22 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 	for (i = 0; i < catalog->sspp_count; i++) {
 		enum drm_plane_type type;
 
-		if ((catalog->sspp[i].features & BIT(DPU_SSPP_CURSOR))
-			&& cursor_planes_idx < max_crtc_count)
-			type = DRM_PLANE_TYPE_CURSOR;
-		else if (primary_planes_idx < max_crtc_count)
+		if (catalog->sspp[i].features & BIT(DPU_SSPP_CURSOR)) {
+			if (cursor_planes_idx < max_crtc_count) {
+				type = DRM_PLANE_TYPE_CURSOR;
+			} else if (catalog->sspp[i].type == SSPP_TYPE_CURSOR) {
+				/* Cursor SSPP can only be used in the last
+				 * mixer stage, so it doesn't make sense to
+				 * assign two of those to the same CRTC */
+				continue;
+			} else {
+				type = DRM_PLANE_TYPE_OVERLAY;
+			}
+		} else if (primary_planes_idx < max_crtc_count) {
 			type = DRM_PLANE_TYPE_PRIMARY;
-		else
+		} else {
 			type = DRM_PLANE_TYPE_OVERLAY;
+		}
 
 		DPU_DEBUG("Create plane type %d with features %lx (cur %lx)\n",
 			  type, catalog->sspp[i].features,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 128ecdc145260..5a7bb8543866c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -881,7 +881,14 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
 	r_pipe->sspp = NULL;
 
-	pstate->stage = DPU_STAGE_BASE + pstate->base.normalized_zpos;
+	if (pipe_hw_caps->type == SSPP_TYPE_CURSOR) {
+		/* enforce cursor sspp to use the last mixer stage */
+		pstate->stage = DPU_STAGE_BASE +
+			pdpu->catalog->caps->max_mixer_blendstages;
+	} else {
+		pstate->stage = DPU_STAGE_BASE + pstate->base.normalized_zpos;
+	}
+
 	if (pstate->stage > DPU_STAGE_BASE + pdpu->catalog->caps->max_mixer_blendstages) {
 		DPU_ERROR("> %d plane mixer stages assigned\n",
 			  pdpu->catalog->caps->max_mixer_blendstages);
@@ -1463,6 +1470,7 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 	struct msm_drm_private *priv = dev->dev_private;
 	struct dpu_kms *kms = to_dpu_kms(priv->kms);
 	struct dpu_hw_sspp *pipe_hw;
+	const uint64_t *format_modifiers;
 	uint32_t num_formats;
 	uint32_t supported_rotations;
 	int ret = -EINVAL;
@@ -1489,15 +1497,27 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 	format_list = pipe_hw->cap->sblk->format_list;
 	num_formats = pipe_hw->cap->sblk->num_formats;
 
+	if (pipe_hw->cap->type == SSPP_TYPE_CURSOR)
+		format_modifiers = NULL;
+	else
+		format_modifiers = supported_format_modifiers;
+
 	ret = drm_universal_plane_init(dev, plane, 0xff, &dpu_plane_funcs,
 				format_list, num_formats,
-				supported_format_modifiers, type, NULL);
+				format_modifiers, type, NULL);
 	if (ret)
 		goto clean_plane;
 
 	pdpu->catalog = kms->catalog;
 
-	ret = drm_plane_create_zpos_property(plane, 0, 0, DPU_ZPOS_MAX);
+	if (pipe_hw->cap->type == SSPP_TYPE_CURSOR) {
+		/* cursor SSPP can only be used in the last mixer stage,
+		 * enforce it by maxing out the cursor plane zpos */
+		ret = drm_plane_create_zpos_immutable_property(plane, DPU_ZPOS_MAX);
+	} else {
+		ret = drm_plane_create_zpos_property(plane, 0, 0, DPU_ZPOS_MAX - 1);
+	}
+
 	if (ret)
 		DPU_ERROR("failed to install zpos property, rc = %d\n", ret);
 

-- 
2.40.0

