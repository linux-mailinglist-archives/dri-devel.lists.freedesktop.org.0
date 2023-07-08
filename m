Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D2274BACF
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jul 2023 03:04:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21D6510E63F;
	Sat,  8 Jul 2023 01:04:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6BF710E1A2
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jul 2023 01:04:17 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2b69923a715so40111861fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 18:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688778256; x=1691370256;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=598BryRQCllm5ISOzEN9gochJO1I/MNw3Ujjm+xPuLs=;
 b=vj5PfahW28Im1lZ0vTFaFlu7Umhyqg3iCSlOaDS8k71IIhB1GZSrJg+c4K6+enjnfl
 dgBPf+NLFQxVuV7KrbmNnk9eq44WhovgAFRiCdS4fJC9Vq8yPrym8vvbxZcxvA/igfPA
 8zpNyW+ushWolMOSyiMGHnqPGmCzsRet2Pbmk3DV38NSarDX6F/kjBsQsLwmsRDWaRf5
 yzj4lbQsxaLaScfsQnBQoRK/O42wlwgq+0A9TqeqndlG5F46A5hTIBrct1SvLPc/4QN4
 ghSCrv3wkt6RKud+OzoQryZWymibgvPJZhRZhVy4Dwi1RJe7/qH3462XUkJbr74LFK0d
 acKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688778256; x=1691370256;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=598BryRQCllm5ISOzEN9gochJO1I/MNw3Ujjm+xPuLs=;
 b=h8z0DNZkcLfzDdipNa6M4E9+7cwn685BsgvvylQXneYoaqxt9LfLH1TNprgrYqw+o4
 F4OD6yWVKYl18OJguVm4/aTTpklykzzGXfST4dV2lgIbKFWUTZUJMgcOJiucGR7xv/dn
 tl7TiB92Xg/4vF5x89M9EUPsf65sjMvZaU+tjllyOUObcPpIqd4M8fuqed1CVd71f1P/
 uX7uBbwkK4yaKEkaHOeC1ACPOR8aE7gy66PLsrR7/mLtWtPXyKVrMI8uBl5Gxv6Ge702
 vi3W7YJiRsIkv67E9Ga34U3xeFGagItQiI5P7VqSe4Pc5bIfHUoNqKczl0BVO4ZaMlVR
 aIRg==
X-Gm-Message-State: ABy/qLZtRiYBRJTamdqqB/g3TMPr3uBvRExnxMV8UmzmR3at6rwNGH9D
 oHJ0E/peT1M7xe2q2sa1zfKg3g==
X-Google-Smtp-Source: APBJJlG0kajx57KenGJOCjZPD7CvtA81GcxS6VxCtq7C2DZCC5UbaybVopoQ7PdMjLL2U15AzqjOPA==
X-Received: by 2002:a2e:9b44:0:b0:2b7:a64:91bd with SMTP id
 o4-20020a2e9b44000000b002b70a6491bdmr4427171ljj.35.1688778255736; 
 Fri, 07 Jul 2023 18:04:15 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a2e8685000000b002b6ee99fff2sm1012807lji.34.2023.07.07.18.04.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 18:04:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 10/17] drm/msm/mdp5: use drmm-managed allocation for mdp5_plane
Date: Sat,  8 Jul 2023 04:04:00 +0300
Message-Id: <20230708010407.3871346-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230708010407.3871346-1-dmitry.baryshkov@linaro.org>
References: <20230708010407.3871346-1-dmitry.baryshkov@linaro.org>
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

Change struct mdp5_plane allocation to use drmm_plane_alloc(). This
removes the need to perform any actions on plane destruction.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 40 ++++------------------
 1 file changed, 6 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
index bd2c4ac45601..177fc1a56aad 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
@@ -17,9 +17,6 @@
 
 struct mdp5_plane {
 	struct drm_plane base;
-
-	uint32_t nformats;
-	uint32_t formats[32];
 };
 #define to_mdp5_plane(x) container_of(x, struct mdp5_plane, base)
 
@@ -38,15 +35,6 @@ static bool plane_enabled(struct drm_plane_state *state)
 	return state->visible;
 }
 
-static void mdp5_plane_destroy(struct drm_plane *plane)
-{
-	struct mdp5_plane *mdp5_plane = to_mdp5_plane(plane);
-
-	drm_plane_cleanup(plane);
-
-	kfree(mdp5_plane);
-}
-
 /* helper to install properties which are common to planes and crtcs */
 static void mdp5_plane_install_properties(struct drm_plane *plane,
 		struct drm_mode_object *obj)
@@ -139,7 +127,6 @@ static void mdp5_plane_destroy_state(struct drm_plane *plane,
 static const struct drm_plane_funcs mdp5_plane_funcs = {
 		.update_plane = drm_atomic_helper_update_plane,
 		.disable_plane = drm_atomic_helper_disable_plane,
-		.destroy = mdp5_plane_destroy,
 		.reset = mdp5_plane_reset,
 		.atomic_duplicate_state = mdp5_plane_duplicate_state,
 		.atomic_destroy_state = mdp5_plane_destroy_state,
@@ -1014,25 +1001,16 @@ struct drm_plane *mdp5_plane_init(struct drm_device *dev,
 {
 	struct drm_plane *plane = NULL;
 	struct mdp5_plane *mdp5_plane;
-	int ret;
 
-	mdp5_plane = kzalloc(sizeof(*mdp5_plane), GFP_KERNEL);
-	if (!mdp5_plane) {
-		ret = -ENOMEM;
-		goto fail;
-	}
+	mdp5_plane = drmm_universal_plane_alloc(dev, struct mdp5_plane, base,
+						0xff, &mdp5_plane_funcs,
+						mdp_rgb_yuv_formats, mdp_rgb_yuv_num_formats,
+						NULL, type, NULL);
+	if (IS_ERR(mdp5_plane))
+		return ERR_CAST(mdp5_plane);
 
 	plane = &mdp5_plane->base;
 
-	mdp5_plane->nformats = mdp_get_formats(mdp5_plane->formats,
-		ARRAY_SIZE(mdp5_plane->formats), false);
-
-	ret = drm_universal_plane_init(dev, plane, 0xff, &mdp5_plane_funcs,
-			mdp5_plane->formats, mdp5_plane->nformats,
-			NULL, type, NULL);
-	if (ret)
-		goto fail;
-
 	drm_plane_helper_add(plane, &mdp5_plane_helper_funcs);
 
 	mdp5_plane_install_properties(plane, &plane->base);
@@ -1040,10 +1018,4 @@ struct drm_plane *mdp5_plane_init(struct drm_device *dev,
 	drm_plane_enable_fb_damage_clips(plane);
 
 	return plane;
-
-fail:
-	if (plane)
-		mdp5_plane_destroy(plane);
-
-	return ERR_PTR(ret);
 }
-- 
2.39.2

