Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8224F745349
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 02:38:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22A3A10E161;
	Mon,  3 Jul 2023 00:37:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A7F110E058
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 00:37:50 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2b6e7d7952eso6632531fa.3
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Jul 2023 17:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688344668; x=1690936668;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8Dse1m0G6m1qASsdCM4uiEj+LGG7/GtCG3G9yRY+V70=;
 b=rgN5LtpMcynWbivkJfmuRMBWRQxhyaiEraTUiV9rBrZH/mYHP35gwv1z0WkEP54YQ0
 BSBzIn74O8T6cyN1DgSoZCgkxOVQSNmXTNe0xm3BvJTF6uR7gfObF3jT/OvDjlPPqZE8
 1hNWodzmZD6xWldYA2KewlDug33Jqd9wXweoCils8K6/YGa1k8NlV/Z1uRMkggrIk0bb
 yXvAE0QoFZckmynQ8r57Y5LcfpgHUdMsFBgGip6Jtbpz7j8v1EIhW7uS80O+OKCEF2E4
 EAvxIKhKPHzW1/SjSzDFjnc8LTxpdx+aAm1DGWrZcTI2Ue119VpfkaxymOnJZiqKh3qq
 vZUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688344668; x=1690936668;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8Dse1m0G6m1qASsdCM4uiEj+LGG7/GtCG3G9yRY+V70=;
 b=a7vn8PlI9kc9zNu1Gez0dDu5RTvkf2S1Hmxqm0inFa7SuIbIA5dRLqQx9R8CDACUrJ
 pPaXtdgtyMy0F/ayFN3vVT/1eP9BwvRuVD1/iHTKSLKHquG8OlT03eaVkMML8bBYc6Ek
 lP+RpLpIeMgOvdAa12SsgO6ya4zycnHUWfoxvA0BvE/7WVk5XjNOTfTCjd0CogXfocVt
 T2crNEpPbFRH7Fq/xduwBLeei6CLACXhyWvxiRboUl+3TW37apSGNcQgzC4ErK6jr7nX
 5HuCYI/vxd599+YgTqoOAsenMBWwZ30OtEFSKgGNMN7YpxqmA4CXp5tUJo8uZfybUiIJ
 BB3Q==
X-Gm-Message-State: ABy/qLaUrr0g+nfC9OmlKAgg54rRfYNgjBSHq0A8ckmRjtRiv1tI/yG9
 oFtFnoMFvkjPCuvYgquLxtJmCA==
X-Google-Smtp-Source: APBJJlHi3v8VjEObPhV7IPLFGJAl5ZS3wLaqgtqQ2wH2F6pdj0og7uKtkuYkMO8m6b1dyG1zLx4uyw==
X-Received: by 2002:a2e:83cd:0:b0:2b4:7f66:8c92 with SMTP id
 s13-20020a2e83cd000000b002b47f668c92mr5920737ljh.31.1688344668207; 
 Sun, 02 Jul 2023 17:37:48 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::ab2]) by smtp.gmail.com with ESMTPSA id
 s24-20020a2e98d8000000b002b6ebc61e85sm136704ljj.54.2023.07.02.17.37.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jul 2023 17:37:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 02/13] drm/msm/hdmi: switch to devm_drm_bridge_add()
Date: Mon,  3 Jul 2023 03:37:34 +0300
Message-Id: <20230703003745.34239-3-dmitry.baryshkov@linaro.org>
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

Make MSM HDMI driver use devm_drm_bridge_add() instead of plain
drm_bridge_add(). As the driver doesn't require any additional cleanup,
stop adding created bridge to the priv->bridges array.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c        | 22 +++++--------------
 drivers/gpu/drm/msm/hdmi/hdmi.h        |  5 ++---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 30 ++++++++------------------
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c    |  3 +--
 4 files changed, 17 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 3132105a2a43..1967d88d93a1 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -158,24 +158,16 @@ static int msm_hdmi_init(struct hdmi *hdmi)
 int msm_hdmi_modeset_init(struct hdmi *hdmi,
 		struct drm_device *dev, struct drm_encoder *encoder)
 {
-	struct msm_drm_private *priv = dev->dev_private;
 	int ret;
 
-	if (priv->num_bridges == ARRAY_SIZE(priv->bridges)) {
-		DRM_DEV_ERROR(dev->dev, "too many bridges\n");
-		return -ENOSPC;
-	}
-
 	hdmi->dev = dev;
 	hdmi->encoder = encoder;
 
 	hdmi_audio_infoframe_init(&hdmi->audio.infoframe);
 
-	hdmi->bridge = msm_hdmi_bridge_init(hdmi);
-	if (IS_ERR(hdmi->bridge)) {
-		ret = PTR_ERR(hdmi->bridge);
+	ret = msm_hdmi_bridge_init(hdmi);
+	if (ret) {
 		DRM_DEV_ERROR(dev->dev, "failed to create HDMI bridge: %d\n", ret);
-		hdmi->bridge = NULL;
 		goto fail;
 	}
 
@@ -213,16 +205,9 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
 		goto fail;
 	}
 
-	priv->bridges[priv->num_bridges++]       = hdmi->bridge;
-
 	return 0;
 
 fail:
-	/* bridge is normally destroyed by drm: */
-	if (hdmi->bridge) {
-		msm_hdmi_bridge_destroy(hdmi->bridge);
-		hdmi->bridge = NULL;
-	}
 	if (hdmi->connector) {
 		hdmi->connector->funcs->destroy(hdmi->connector);
 		hdmi->connector = NULL;
@@ -393,6 +378,9 @@ static void msm_hdmi_unbind(struct device *dev, struct device *master,
 		if (priv->hdmi->audio_pdev)
 			platform_device_unregister(priv->hdmi->audio_pdev);
 
+		if (priv->hdmi->bridge)
+			msm_hdmi_hpd_disable(priv->hdmi);
+
 		msm_hdmi_destroy(priv->hdmi);
 		priv->hdmi = NULL;
 	}
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index e8dbee50637f..ec5786440391 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -224,14 +224,13 @@ void msm_hdmi_audio_set_sample_rate(struct hdmi *hdmi, int rate);
  * hdmi bridge:
  */
 
-struct drm_bridge *msm_hdmi_bridge_init(struct hdmi *hdmi);
-void msm_hdmi_bridge_destroy(struct drm_bridge *bridge);
+int msm_hdmi_bridge_init(struct hdmi *hdmi);
 
 void msm_hdmi_hpd_irq(struct drm_bridge *bridge);
 enum drm_connector_status msm_hdmi_bridge_detect(
 		struct drm_bridge *bridge);
 int msm_hdmi_hpd_enable(struct drm_bridge *bridge);
-void msm_hdmi_hpd_disable(struct hdmi_bridge *hdmi_bridge);
+void msm_hdmi_hpd_disable(struct hdmi *hdmi);
 
 /*
  * i2c adapter for ddc:
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 9b1391d27ed3..0b7a6a56677e 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -11,14 +11,6 @@
 #include "msm_kms.h"
 #include "hdmi.h"
 
-void msm_hdmi_bridge_destroy(struct drm_bridge *bridge)
-{
-	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
-
-	msm_hdmi_hpd_disable(hdmi_bridge);
-	drm_bridge_remove(bridge);
-}
-
 static void msm_hdmi_power_on(struct drm_bridge *bridge)
 {
 	struct drm_device *dev = bridge->dev;
@@ -317,7 +309,7 @@ msm_hdmi_hotplug_work(struct work_struct *work)
 }
 
 /* initialize bridge */
-struct drm_bridge *msm_hdmi_bridge_init(struct hdmi *hdmi)
+int msm_hdmi_bridge_init(struct hdmi *hdmi)
 {
 	struct drm_bridge *bridge = NULL;
 	struct hdmi_bridge *hdmi_bridge;
@@ -325,10 +317,8 @@ struct drm_bridge *msm_hdmi_bridge_init(struct hdmi *hdmi)
 
 	hdmi_bridge = devm_kzalloc(hdmi->dev->dev,
 			sizeof(*hdmi_bridge), GFP_KERNEL);
-	if (!hdmi_bridge) {
-		ret = -ENOMEM;
-		goto fail;
-	}
+	if (!hdmi_bridge)
+		return -ENOMEM;
 
 	hdmi_bridge->hdmi = hdmi;
 	INIT_WORK(&hdmi_bridge->hpd_work, msm_hdmi_hotplug_work);
@@ -341,17 +331,15 @@ struct drm_bridge *msm_hdmi_bridge_init(struct hdmi *hdmi)
 		DRM_BRIDGE_OP_DETECT |
 		DRM_BRIDGE_OP_EDID;
 
-	drm_bridge_add(bridge);
+	ret = devm_drm_bridge_add(&hdmi->pdev->dev, bridge);
+	if (ret)
+		return ret;
 
 	ret = drm_bridge_attach(hdmi->encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret)
-		goto fail;
+		return ret;
 
-	return bridge;
+	hdmi->bridge = bridge;
 
-fail:
-	if (bridge)
-		msm_hdmi_bridge_destroy(bridge);
-
-	return ERR_PTR(ret);
+	return 0;
 }
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
index bfa827b47989..9ce0ffa35417 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
@@ -147,9 +147,8 @@ int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
 	return ret;
 }
 
-void msm_hdmi_hpd_disable(struct hdmi_bridge *hdmi_bridge)
+void msm_hdmi_hpd_disable(struct hdmi *hdmi)
 {
-	struct hdmi *hdmi = hdmi_bridge->hdmi;
 	const struct hdmi_platform_config *config = hdmi->config;
 	struct device *dev = &hdmi->pdev->dev;
 	int ret;
-- 
2.39.2

