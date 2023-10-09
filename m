Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A667BEC28
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 22:57:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27CF310E2F0;
	Mon,  9 Oct 2023 20:57:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B12310E2E8
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 20:57:34 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-5042bfb4fe9so5987463e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 13:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696885052; x=1697489852; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7cxLmiRyrS5kt0J5ZzxaEvq9+FAU6cjTlCuQBf1xxyA=;
 b=fC0aOmEzGj+aHl/fg8erFrhMKP4a4n35mWJ9ICEcXwWKA7Xt0xHpQJ1ygg4c+RxIcO
 80nCyRK01mL/mJjvz1m+Nvf266tg23s6L47UDWxAWZtwsq7sf8Ga5sGzmNVVBLuBjqEK
 GPsmZoC3RsBPWvgm4PolnJAKhCjDkWGSa4NkW8N+CxeuZ/K7BO2K4ZTcQhJ5/DnbKe+F
 dJoF3lmsm6M9qgA4TYNk14fSuhJ1ki2BC7C3lwuUGpK9RcIb0AST+Kcmw5s2TS8s1ypk
 mjejzCiacjkFVqzToqwnUG9b7IaODxkzEwb+RGfDYony3obt3N70aBYbXuiLMmiObN9c
 Sdtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696885052; x=1697489852;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7cxLmiRyrS5kt0J5ZzxaEvq9+FAU6cjTlCuQBf1xxyA=;
 b=iv9QcIOhzKUPyGjVMGKDGx5pxacuALfqVhtfMUM49JpjPkdrcBNwBjtYlxKDRNYP0t
 5TDzlaZGW0j3Ztz0NffHpf6l6LuxNGpGrr+JfhZnL+bPF/hpJGkim6lieSjQrYMJPnlk
 maMVJbkrWEfwvfD6uE9PBIDwrZOF/osLMNpAhnT2nyXBH0wJVBtQb7VT3HMFkJQU0ibN
 PLWWufjU82VISaOp6l6xkMAKs+H0ytn2iOUwsiqyCq+E/kngMFKlC0dS+da0xTMLVRc4
 EJs2Vg6PzT8IhacbBOK6fvWfxpcfTrRdfhWpribheeu7kjci/wYMqZrsfP25iG1tovk8
 Bo8Q==
X-Gm-Message-State: AOJu0YymORDmQtg62b3jpJBsNYECA3udbUwtVlzeJ2cMVd8gPfKIpTl8
 4XH/VXXw/2JiZ2+l7z9gjE6XUg==
X-Google-Smtp-Source: AGHT+IFJ0l95lvmXQn6PFCYDow3HNy1sWNmEoh9lJjjaVhxV6tR3ePILoLD2bJjoLJgZj8uok8/bAA==
X-Received: by 2002:a05:6512:3095:b0:503:2a53:7480 with SMTP id
 z21-20020a056512309500b005032a537480mr16398675lfd.49.1696885052428; 
 Mon, 09 Oct 2023 13:57:32 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 f5-20020ac251a5000000b0050300e013f3sm1540844lfk.254.2023.10.09.13.57.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 13:57:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 4/5] drm/msm/dsi: remove msm_dsi::encoder
Date: Mon,  9 Oct 2023 23:57:26 +0300
Message-Id: <20231009205727.2781802-5-dmitry.baryshkov@linaro.org>
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

There is no need anymore to stop the drm_encoder instance in struct
msm_dsi. Remove corresponding field.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.c         | 4 +---
 drivers/gpu/drm/msm/dsi/dsi.h         | 6 ++----
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 8 +++-----
 3 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index c6d53cccb9ae..33c3437b09de 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -235,9 +235,7 @@ int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
 		return 0;
 	}
 
-	msm_dsi->encoder = encoder;
-
-	bridge = msm_dsi_manager_bridge_init(msm_dsi);
+	bridge = msm_dsi_manager_bridge_init(msm_dsi, encoder);
 	if (IS_ERR(bridge)) {
 		ret = PTR_ERR(bridge);
 		DRM_DEV_ERROR(dev->dev, "failed to create dsi bridge: %d\n", ret);
diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 525c7ba22227..d3380326d449 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -41,14 +41,12 @@ struct msm_dsi {
 	struct device *phy_dev;
 	bool phy_enabled;
 
-	/* the encoder we are hooked to (outside of dsi block) */
-	struct drm_encoder *encoder;
-
 	int id;
 };
 
 /* dsi manager */
-struct drm_bridge *msm_dsi_manager_bridge_init(struct msm_dsi *msm_dsi);
+struct drm_bridge *msm_dsi_manager_bridge_init(struct msm_dsi *msm_dsi,
+					       struct drm_encoder *encoder);
 int msm_dsi_manager_ext_bridge_init(u8 id, struct drm_bridge *int_bridge);
 int msm_dsi_manager_cmd_xfer(int id, const struct mipi_dsi_msg *msg);
 bool msm_dsi_manager_cmd_xfer_trigger(int id, u32 dma_base, u32 len);
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 8eb73287dffb..101e79a6e281 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -431,11 +431,11 @@ static const struct drm_bridge_funcs dsi_mgr_bridge_funcs = {
 };
 
 /* initialize bridge */
-struct drm_bridge *msm_dsi_manager_bridge_init(struct msm_dsi *msm_dsi)
+struct drm_bridge *msm_dsi_manager_bridge_init(struct msm_dsi *msm_dsi,
+					       struct drm_encoder *encoder)
 {
 	struct drm_bridge *bridge;
 	struct dsi_bridge *dsi_bridge;
-	struct drm_encoder *encoder;
 	int ret;
 
 	dsi_bridge = devm_kzalloc(msm_dsi->dev->dev,
@@ -445,8 +445,6 @@ struct drm_bridge *msm_dsi_manager_bridge_init(struct msm_dsi *msm_dsi)
 
 	dsi_bridge->id = msm_dsi->id;
 
-	encoder = msm_dsi->encoder;
-
 	bridge = &dsi_bridge->base;
 	bridge->funcs = &dsi_mgr_bridge_funcs;
 
@@ -474,7 +472,7 @@ int msm_dsi_manager_ext_bridge_init(u8 id, struct drm_bridge *int_bridge)
 	if (IS_ERR(ext_bridge))
 		return PTR_ERR(ext_bridge);
 
-	encoder = msm_dsi->encoder;
+	encoder = int_bridge->encoder;
 
 	/*
 	 * Try first to create the bridge without it creating its own
-- 
2.39.2

