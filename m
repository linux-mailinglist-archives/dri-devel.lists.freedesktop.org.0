Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8947BEC22
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 22:57:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C859B10E1B0;
	Mon,  9 Oct 2023 20:57:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA3C210E1AA
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 20:57:31 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-503056c8195so6372234e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 13:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696885050; x=1697489850; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A76BFNPnJ+6jsYihExtv8TvgroW23+3EsO63qGtaSNI=;
 b=HFeXPDsSh7+OZdJyX1N/xhnmBsqp6K1tZvLxwVBGS0DIkjJf/2UgYImqxFcCQ4UgPK
 OI2dZkJ9OsDQ3BBM7cZNJy674y4gSMJ0vrSe8iX/UzNosh7MBlrjVztfujDLUyD0eXX3
 yLNX7SMuYa7iBBzoVxcDG6MifY41nPp1NM2qhwWv8fktfI1tAjVYcm9yRfzxoh8yrUxy
 Y8BWIGFaNZVdLZk7Sk8UCGSqWID2SB3uTQbMQF8gPLK6AefYlLSYb4sNdZVqGfnEGgcD
 VdUe2ILz0rupjWoMtIfhQN5NjTtzC9FySsNDpzlLXaJrcipSSWhB4HGaGseI6023todp
 kr4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696885050; x=1697489850;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A76BFNPnJ+6jsYihExtv8TvgroW23+3EsO63qGtaSNI=;
 b=lT0HbGx8XKo3PHb4oALml+y5tyOhdDaZ5erXmPnfxgNLVJu2j2WYM7We5qmsMctIHw
 DW5RG1Y6Ul9/B7Mb0HQD+MCFjD8nHBRNiHVl/kaur4quY106Aj1rwLTGYlSfyAMLB8Om
 dIhOMYn6PD2aGwUmIPc/vvx8RRgOuzP+77ohDdoEE5dEolL6X2plx/LM4yNVQm3EloVv
 NqnD70gui9FPUvpZ1hIhrjeJzTQ10AWuczxZ+pO1WoM4uBP01nIgeByIxxCSnDzsY7mb
 +6Ivt+tY3VSefDgP4IJ2osLy9W4qf60SrVwiyJ5Ct5D2IuRr27zJKEW/BfVxzNLmWslF
 zpDw==
X-Gm-Message-State: AOJu0YzLVjB6+la7enjJCyZoGqTAcRxV3iz7So4RLjeSsKCokKFD/QE1
 +5+nMsZHq7+JlguGRc5oXmo11A==
X-Google-Smtp-Source: AGHT+IF2F5SdPHGqRpF++yDaGef6VdS+zBqWRoYdzrdYV6qgV5UguFH7QQEEFEuwHRG+fVcJjNqhqw==
X-Received: by 2002:a05:6512:108e:b0:502:9fce:b6da with SMTP id
 j14-20020a056512108e00b005029fceb6damr17282192lfg.21.1696885050016; 
 Mon, 09 Oct 2023 13:57:30 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 f5-20020ac251a5000000b0050300e013f3sm1540844lfk.254.2023.10.09.13.57.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 13:57:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 1/5] drm/msm/dsi: do not store internal bridge pointer
Date: Mon,  9 Oct 2023 23:57:23 +0300
Message-Id: <20231009205727.2781802-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009205727.2781802-1-dmitry.baryshkov@linaro.org>
References: <20231009205727.2781802-1-dmitry.baryshkov@linaro.org>
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

Since the driver was switched to devm_drm_bridge_add(), there is no need
anymore to store the created bridge instance in struct msm_dsi. Drop
this field and pass data directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.c         |  8 +++++---
 drivers/gpu/drm/msm/dsi/dsi.h         |  7 ++-----
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 19 ++++++++-----------
 3 files changed, 15 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index 47f327e68471..c6d53cccb9ae 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -215,6 +215,7 @@ void __exit msm_dsi_unregister(void)
 int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
 			 struct drm_encoder *encoder)
 {
+	struct drm_bridge *bridge;
 	int ret;
 
 	msm_dsi->dev = dev;
@@ -236,13 +237,14 @@ int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
 
 	msm_dsi->encoder = encoder;
 
-	ret = msm_dsi_manager_bridge_init(msm_dsi);
-	if (ret) {
+	bridge = msm_dsi_manager_bridge_init(msm_dsi);
+	if (IS_ERR(bridge)) {
+		ret = PTR_ERR(bridge);
 		DRM_DEV_ERROR(dev->dev, "failed to create dsi bridge: %d\n", ret);
 		return ret;
 	}
 
-	ret = msm_dsi_manager_ext_bridge_init(msm_dsi->id);
+	ret = msm_dsi_manager_ext_bridge_init(msm_dsi->id, bridge);
 	if (ret) {
 		DRM_DEV_ERROR(dev->dev,
 			"failed to create dsi connector: %d\n", ret);
diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index a01c326774a6..269975002b95 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -35,9 +35,6 @@ struct msm_dsi {
 	struct drm_device *dev;
 	struct platform_device *pdev;
 
-	/* internal dsi bridge attached to MDP interface */
-	struct drm_bridge *bridge;
-
 	struct mipi_dsi_host *host;
 	struct msm_dsi_phy *phy;
 
@@ -56,8 +53,8 @@ struct msm_dsi {
 };
 
 /* dsi manager */
-int msm_dsi_manager_bridge_init(struct msm_dsi *msm_dsi);
-int msm_dsi_manager_ext_bridge_init(u8 id);
+struct drm_bridge *msm_dsi_manager_bridge_init(struct msm_dsi *msm_dsi);
+int msm_dsi_manager_ext_bridge_init(u8 id, struct drm_bridge *int_bridge);
 int msm_dsi_manager_cmd_xfer(int id, const struct mipi_dsi_msg *msg);
 bool msm_dsi_manager_cmd_xfer_trigger(int id, u32 dma_base, u32 len);
 int msm_dsi_manager_register(struct msm_dsi *msm_dsi);
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 17aa19bb6510..59f4728fc772 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -466,9 +466,9 @@ static const struct drm_bridge_funcs dsi_mgr_bridge_funcs = {
 };
 
 /* initialize bridge */
-int msm_dsi_manager_bridge_init(struct msm_dsi *msm_dsi)
+struct drm_bridge *msm_dsi_manager_bridge_init(struct msm_dsi *msm_dsi)
 {
-	struct drm_bridge *bridge = NULL;
+	struct drm_bridge *bridge;
 	struct dsi_bridge *dsi_bridge;
 	struct drm_encoder *encoder;
 	int ret;
@@ -476,7 +476,7 @@ int msm_dsi_manager_bridge_init(struct msm_dsi *msm_dsi)
 	dsi_bridge = devm_kzalloc(msm_dsi->dev->dev,
 				sizeof(*dsi_bridge), GFP_KERNEL);
 	if (!dsi_bridge)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
 	dsi_bridge->id = msm_dsi->id;
 
@@ -487,26 +487,23 @@ int msm_dsi_manager_bridge_init(struct msm_dsi *msm_dsi)
 
 	ret = devm_drm_bridge_add(&msm_dsi->pdev->dev, bridge);
 	if (ret)
-		return ret;
+		return ERR_PTR(ret);
 
 	ret = drm_bridge_attach(encoder, bridge, NULL, 0);
 	if (ret)
-		return ret;
+		return ERR_PTR(ret);
 
-	msm_dsi->bridge = bridge;
-
-	return 0;
+	return bridge;
 }
 
-int msm_dsi_manager_ext_bridge_init(u8 id)
+int msm_dsi_manager_ext_bridge_init(u8 id, struct drm_bridge *int_bridge)
 {
 	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
 	struct drm_device *dev = msm_dsi->dev;
 	struct drm_encoder *encoder;
-	struct drm_bridge *int_bridge, *ext_bridge;
+	struct drm_bridge *ext_bridge;
 	int ret;
 
-	int_bridge = msm_dsi->bridge;
 	ext_bridge = devm_drm_of_get_bridge(&msm_dsi->pdev->dev,
 					    msm_dsi->pdev->dev.of_node, 1, 0);
 	if (IS_ERR(ext_bridge))
-- 
2.39.2

