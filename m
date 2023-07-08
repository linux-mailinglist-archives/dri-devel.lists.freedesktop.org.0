Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A771E74BAD5
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jul 2023 03:04:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B03010E641;
	Sat,  8 Jul 2023 01:04:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A50E10E1A0
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jul 2023 01:04:19 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2b701e1ca63so38791481fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 18:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688778257; x=1691370257;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+38nzESfvK4pAHEPkhscE79q4Wrbr+it00jhvW61XWI=;
 b=sdozM2tVW3hK0v7eXNQ7BGK8KprAd0AhB7gnwUkjTdZ3pTBbo1Cml7nBUMjDOPvFiL
 N6SMzCYOfJ5ITbKfZfQpOEwKUcnWINgq3ORCaxzXdCttCSLv/XVw+XexHE0dfdGFgKA7
 Rrehiext1h/4f5MRtS1MD3ed7lP/ZhRVZyYoYJpPMYX40pepmJkQ/W28W7r8BLHiIV/a
 myvF3bqZLPuKt0Nysf/lslB/BVSMo9vA/YkbPcRl/smsrX2mdHGxBdk+hh6wADynFwu8
 exHv4EeC1+45bMLYIRw9yHPJI9RDn/HPhn301z8UHUbo5IvQiOF2gB00DFWrXGF66qxf
 N39w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688778257; x=1691370257;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+38nzESfvK4pAHEPkhscE79q4Wrbr+it00jhvW61XWI=;
 b=hTvBeoH6/CAIEECeHyjXu4kBkOtvKz2siuuTBW2PZbCFbGcVV8s+f4fvL6KSoKWWyg
 jwEbSyNNtoHbKY2puE5utif4w1q7RbzoMNjHAGTsIFt2UWPld6Svcfa2zMPxb4rhLQFg
 1EFx6NDmCVlCFPLOg2HzbeCfLUVTjWSp5wuHSc1USZE+oY0lsJLEqtn3tl89BhVJ23IX
 XD8LcV8vMILieENGVGwZigOglnQiaXzFEizZRonK9IfsdIyXppUI7Iexiu+tIqsS4mbL
 GEBCWDQjROMpy7FivhgREys4CrFA1boHlUDrsnHQ6seCyVe+nCegggeVzHNrzVjC5baQ
 t8Kw==
X-Gm-Message-State: ABy/qLZDpGsp4nU1P4MQnrIKJGVwPCtKFbP9DojYPwaGpVtzy4M7pTIA
 69A/AfI5nH3IFMRTBivNGiz41w==
X-Google-Smtp-Source: APBJJlHbuJdo+mqG+TrLe0BOwo7bSXkWhe4D9znTTjr7ZZzdYW2HQcpr3aNIwJmBjk2wFDHl+KmLVA==
X-Received: by 2002:a2e:854c:0:b0:2b5:974f:385 with SMTP id
 u12-20020a2e854c000000b002b5974f0385mr5181028ljj.9.1688778257827; 
 Fri, 07 Jul 2023 18:04:17 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a2e8685000000b002b6ee99fff2sm1012807lji.34.2023.07.07.18.04.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 18:04:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 13/17] drm/msm/mdp4: use drmm-managed allocation for
 mdp4_dsi_encoder
Date: Sat,  8 Jul 2023 04:04:03 +0300
Message-Id: <20230708010407.3871346-14-dmitry.baryshkov@linaro.org>
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

Change struct mdp4_dsi_encoder allocation to use drmm_encoder_alloc().
This removes the need to perform any actions on this encoder
destruction.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c  | 32 +++----------------
 1 file changed, 5 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c
index 39b8fe53c29d..74dafe7106be 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c
@@ -26,18 +26,6 @@ static struct mdp4_kms *get_kms(struct drm_encoder *encoder)
 	return to_mdp4_kms(to_mdp_kms(priv->kms));
 }
 
-static void mdp4_dsi_encoder_destroy(struct drm_encoder *encoder)
-{
-	struct mdp4_dsi_encoder *mdp4_dsi_encoder = to_mdp4_dsi_encoder(encoder);
-
-	drm_encoder_cleanup(encoder);
-	kfree(mdp4_dsi_encoder);
-}
-
-static const struct drm_encoder_funcs mdp4_dsi_encoder_funcs = {
-	.destroy = mdp4_dsi_encoder_destroy,
-};
-
 static void mdp4_dsi_encoder_mode_set(struct drm_encoder *encoder,
 				      struct drm_display_mode *mode,
 				      struct drm_display_mode *adjusted_mode)
@@ -148,28 +136,18 @@ static const struct drm_encoder_helper_funcs mdp4_dsi_encoder_helper_funcs = {
 /* initialize encoder */
 struct drm_encoder *mdp4_dsi_encoder_init(struct drm_device *dev)
 {
-	struct drm_encoder *encoder = NULL;
+	struct drm_encoder *encoder;
 	struct mdp4_dsi_encoder *mdp4_dsi_encoder;
-	int ret;
 
-	mdp4_dsi_encoder = kzalloc(sizeof(*mdp4_dsi_encoder), GFP_KERNEL);
-	if (!mdp4_dsi_encoder) {
-		ret = -ENOMEM;
-		goto fail;
-	}
+	mdp4_dsi_encoder = drmm_encoder_alloc(dev, struct mdp4_dsi_encoder, base,
+					      NULL, DRM_MODE_ENCODER_DSI, NULL);
+	if (IS_ERR(mdp4_dsi_encoder))
+		return ERR_CAST(mdp4_dsi_encoder);
 
 	encoder = &mdp4_dsi_encoder->base;
 
-	drm_encoder_init(dev, encoder, &mdp4_dsi_encoder_funcs,
-			 DRM_MODE_ENCODER_DSI, NULL);
 	drm_encoder_helper_add(encoder, &mdp4_dsi_encoder_helper_funcs);
 
 	return encoder;
-
-fail:
-	if (encoder)
-		mdp4_dsi_encoder_destroy(encoder);
-
-	return ERR_PTR(ret);
 }
 #endif /* CONFIG_DRM_MSM_DSI */
-- 
2.39.2

