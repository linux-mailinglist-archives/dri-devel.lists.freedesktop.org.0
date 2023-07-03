Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C088745342
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 02:38:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2465210E064;
	Mon,  3 Jul 2023 00:37:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8393310E053
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 00:37:49 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2b698371937so61697161fa.3
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Jul 2023 17:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688344667; x=1690936667;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kqfxgg5hIETM5btavOYqKU+bI42Bbyk1/nWlXNa+6Yc=;
 b=gmr2t5NIMF+dzwqN4av7ctwJ1EB4MUSVI2TvZMf672fqR9I43xSW5MYnVOuN8DhUcH
 ITwzo1ezfIVLIfD6ZmbhjNFFYd0hZDF/elR1NLk2XpFK+raBaH/WE4r5BCqSUuEAB70s
 w/mPRO+dARxxylCvV8kyKQmyX0AUMrEKgcGGIwvN8QtQes/UkcbByRTqdd5qAXWciy0j
 oeRP9lgBC2wObsvgfAfH3S39qIaY60VAnPOyoDGAV1gS/hYljwrAVSkfjByK3N3EkaSo
 DINx1mS0uOmLa9vJMrjhC/5EBLz0IOHm3UswnSSv82NVgP84WZFgPc61akVWYpPPQo8r
 j+Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688344667; x=1690936667;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Kqfxgg5hIETM5btavOYqKU+bI42Bbyk1/nWlXNa+6Yc=;
 b=A7BobDa/EuCCa09rijUEdDQEr/aSXeFMa9aMwOhmyBS7ZnQCSACsvfGDX8TTTSaE1z
 Xu5LTTseMux6+7OHFtDpzkiMf3gVFAcfm+0UghOj4aNP948zy0E9SMcoDtj14BATuMVO
 VotV6RJpkDWrunYthZr7ZLSoySDOU0bhwaCwRVeEJSy1T1rEwdTMSNH+wXYcW7Fbp4FA
 S0M6KSYTDPZdxzJp9Yx4qSjOB3O4O61MUcm8ZkkFilUko9RZgi57Ighp6446k15qwOsN
 Qnpqjh9qmxVb3gu6uc/vv1KPJao5KGjTIDyCH7+8iqdbV0s9z42LI7wVT/RKqX8B13fh
 P+RA==
X-Gm-Message-State: ABy/qLbHCkr4esE0Pl+4TVRVQ1qsp95si7PoJPXZ6GQFuEkSZG4oGFNV
 jjiDcHNVdC3UWpIemzBefRQJDA==
X-Google-Smtp-Source: APBJJlHPCAIxVunklc5TAimhROphRrcoRJsQSB81RSW5XM3zkmardY+glKtdf13VZ49YuzTPCiwNEw==
X-Received: by 2002:a2e:9159:0:b0:2b4:75f0:b9e9 with SMTP id
 q25-20020a2e9159000000b002b475f0b9e9mr6183104ljg.10.1688344667373; 
 Sun, 02 Jul 2023 17:37:47 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::ab2]) by smtp.gmail.com with ESMTPSA id
 s24-20020a2e98d8000000b002b6ebc61e85sm136704ljj.54.2023.07.02.17.37.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jul 2023 17:37:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 01/13] drm/msm/dsi: switch to devm_drm_bridge_add()
Date: Mon,  3 Jul 2023 03:37:33 +0300
Message-Id: <20230703003745.34239-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230703003745.34239-1-dmitry.baryshkov@linaro.org>
References: <20230703003745.34239-1-dmitry.baryshkov@linaro.org>
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

Make MSM DSI driver use devm_drm_bridge_add() instead of plain
drm_bridge_add(). As the driver doesn't require any additional cleanup,
stop adding created bridge to the priv->bridges array.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.c         | 28 +++++--------------------
 drivers/gpu/drm/msm/dsi/dsi.h         |  3 +--
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 30 +++++++++------------------
 3 files changed, 16 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index baab79ab6e74..61c369494719 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -212,20 +212,14 @@ void __exit msm_dsi_unregister(void)
 int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
 			 struct drm_encoder *encoder)
 {
-	struct msm_drm_private *priv = dev->dev_private;
 	int ret;
 
-	if (priv->num_bridges == ARRAY_SIZE(priv->bridges)) {
-		DRM_DEV_ERROR(dev->dev, "too many bridges\n");
-		return -ENOSPC;
-	}
-
 	msm_dsi->dev = dev;
 
 	ret = msm_dsi_host_modeset_init(msm_dsi->host, dev);
 	if (ret) {
 		DRM_DEV_ERROR(dev->dev, "failed to modeset init host: %d\n", ret);
-		goto fail;
+		return ret;
 	}
 
 	if (msm_dsi_is_bonded_dsi(msm_dsi) &&
@@ -239,32 +233,20 @@ int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
 
 	msm_dsi->encoder = encoder;
 
-	msm_dsi->bridge = msm_dsi_manager_bridge_init(msm_dsi->id);
-	if (IS_ERR(msm_dsi->bridge)) {
-		ret = PTR_ERR(msm_dsi->bridge);
+	ret = msm_dsi_manager_bridge_init(msm_dsi);
+	if (ret) {
 		DRM_DEV_ERROR(dev->dev, "failed to create dsi bridge: %d\n", ret);
-		msm_dsi->bridge = NULL;
-		goto fail;
+		return ret;
 	}
 
 	ret = msm_dsi_manager_ext_bridge_init(msm_dsi->id);
 	if (ret) {
 		DRM_DEV_ERROR(dev->dev,
 			"failed to create dsi connector: %d\n", ret);
-		goto fail;
+		return ret;
 	}
 
-	priv->bridges[priv->num_bridges++]       = msm_dsi->bridge;
-
 	return 0;
-fail:
-	/* bridge/connector are normally destroyed by drm: */
-	if (msm_dsi->bridge) {
-		msm_dsi_manager_bridge_destroy(msm_dsi->bridge);
-		msm_dsi->bridge = NULL;
-	}
-
-	return ret;
 }
 
 void msm_dsi_snapshot(struct msm_disp_state *disp_state, struct msm_dsi *msm_dsi)
diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index bd3763a5d723..df2bd774909b 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -56,8 +56,7 @@ struct msm_dsi {
 };
 
 /* dsi manager */
-struct drm_bridge *msm_dsi_manager_bridge_init(u8 id);
-void msm_dsi_manager_bridge_destroy(struct drm_bridge *bridge);
+int msm_dsi_manager_bridge_init(struct msm_dsi *msm_dsi);
 int msm_dsi_manager_ext_bridge_init(u8 id);
 int msm_dsi_manager_cmd_xfer(int id, const struct mipi_dsi_msg *msg);
 bool msm_dsi_manager_cmd_xfer_trigger(int id, u32 dma_base, u32 len);
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 28b8012a21f2..17aa19bb6510 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -466,9 +466,8 @@ static const struct drm_bridge_funcs dsi_mgr_bridge_funcs = {
 };
 
 /* initialize bridge */
-struct drm_bridge *msm_dsi_manager_bridge_init(u8 id)
+int msm_dsi_manager_bridge_init(struct msm_dsi *msm_dsi)
 {
-	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
 	struct drm_bridge *bridge = NULL;
 	struct dsi_bridge *dsi_bridge;
 	struct drm_encoder *encoder;
@@ -476,31 +475,27 @@ struct drm_bridge *msm_dsi_manager_bridge_init(u8 id)
 
 	dsi_bridge = devm_kzalloc(msm_dsi->dev->dev,
 				sizeof(*dsi_bridge), GFP_KERNEL);
-	if (!dsi_bridge) {
-		ret = -ENOMEM;
-		goto fail;
-	}
+	if (!dsi_bridge)
+		return -ENOMEM;
 
-	dsi_bridge->id = id;
+	dsi_bridge->id = msm_dsi->id;
 
 	encoder = msm_dsi->encoder;
 
 	bridge = &dsi_bridge->base;
 	bridge->funcs = &dsi_mgr_bridge_funcs;
 
-	drm_bridge_add(bridge);
+	ret = devm_drm_bridge_add(&msm_dsi->pdev->dev, bridge);
+	if (ret)
+		return ret;
 
 	ret = drm_bridge_attach(encoder, bridge, NULL, 0);
 	if (ret)
-		goto fail;
+		return ret;
 
-	return bridge;
+	msm_dsi->bridge = bridge;
 
-fail:
-	if (bridge)
-		msm_dsi_manager_bridge_destroy(bridge);
-
-	return ERR_PTR(ret);
+	return 0;
 }
 
 int msm_dsi_manager_ext_bridge_init(u8 id)
@@ -557,11 +552,6 @@ int msm_dsi_manager_ext_bridge_init(u8 id)
 	return 0;
 }
 
-void msm_dsi_manager_bridge_destroy(struct drm_bridge *bridge)
-{
-	drm_bridge_remove(bridge);
-}
-
 int msm_dsi_manager_cmd_xfer(int id, const struct mipi_dsi_msg *msg)
 {
 	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
-- 
2.39.2

