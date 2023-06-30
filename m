Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 543E77443AE
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 22:56:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC23010E4F4;
	Fri, 30 Jun 2023 20:55:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3167010E504
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 20:55:37 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4f96d680399so3747113e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 13:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688158535; x=1690750535;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wt6huJ+EuWBL0aSnKMH030neuBzp1AaZT2Qutfz1m2E=;
 b=edDy7iejQT05eyP7VZDU+E5ct5JHw8io17dNHvgko5M/GloGZYjFvnxD0/tquZ46Ut
 X8UFy+0I0udnlFkiZNTsGQM6lsYq7TKdme/WHJolcSYH+MSDJRjm2Wt74ifNfDhnz3AP
 jRKSn7KapOt9IiBnHuJFzpU+yq2YZfKfuK+U6T+sYTJzJWeTsqkmFEeKleWNONcItaeJ
 m3GRTzwQTE1wdc5ZowIJF+jcEnPG0YO6GTDTKCz9ToI/z80J1kZOagChBOQhdj67pCg/
 QRiDri04v8LBDQHeSvrZVdnyFDWz2xwIXPaTr6+kL8fj1oZAWFGlkVeG0nfTrk0CYjLO
 Dgcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688158535; x=1690750535;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wt6huJ+EuWBL0aSnKMH030neuBzp1AaZT2Qutfz1m2E=;
 b=N9nlVkZgdRZIhFfTF8/pf8gS84mZs0E5AUlmUzloxecDtLfAZu60lKDFg5zX2BejVj
 CnlLVxlxV3+g0MfFFiUqstvuNFUQ+eCKqcIVQ+wr3ztCJ74AXB0bdP8QihYIe4sKe4Zx
 ELrVsbh+bsbwZsQX5kuslxj/PYwiyLH+jpAkBIciEvuxmEyTOv+TfHK0tv5q8wwGEh5R
 hPBeNMIRF5CtPJrEAzDNLhkvDVMZMOfRtPq4pqhG9rETOJL2xu+YAFOUMcrIr3u8sjCe
 LVT8yop+YXSxiGnV3Vfyo931rFZE60dSJpGfE/6KvanPlbrTXt1jtWjQprmtRGdej9Zo
 CwwQ==
X-Gm-Message-State: ABy/qLaZDY5066yi69AcLlFWD3jCEaRmmo29oxuxnNbtNkWV9TcmqPAF
 7WozMghEoXMH+mQ/NAUiIB+YSw==
X-Google-Smtp-Source: APBJJlESGq62jFOcvJfGD+ngpxA6olDUqDJI57PWUwbzW2bFNxqoWA5QrV6wWGNGlMKbAl/Kk951Mw==
X-Received: by 2002:ac2:5f6d:0:b0:4fb:8b2a:5e07 with SMTP id
 c13-20020ac25f6d000000b004fb8b2a5e07mr3158963lfc.36.1688158535552; 
 Fri, 30 Jun 2023 13:55:35 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z11-20020ac25deb000000b004fb75943aa0sm2252168lfq.196.2023.06.30.13.55.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jun 2023 13:55:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 15/15] drm/msm/hdmi: wire in hpd_enable/hpd_disable bridge ops
Date: Fri, 30 Jun 2023 23:55:23 +0300
Message-Id: <20230630205523.76823-16-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230630205523.76823-1-dmitry.baryshkov@linaro.org>
References: <20230630205523.76823-1-dmitry.baryshkov@linaro.org>
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

The HDMI driver already has msm_hdmi_hpd_enable() and
msm_hdmi_hpd_disable() functions. Wire them into the
msm_hdmi_bridge_funcs, so that HPD  can be enabled and disabled
dynamically rather than always having HPD events generation enabled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c        |  6 ------
 drivers/gpu/drm/msm/hdmi/hdmi.h        |  4 ++--
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c |  6 +++---
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c    | 11 +++++------
 4 files changed, 10 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index ec109255ee17..e1a16e20890c 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -208,12 +208,6 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
 		goto fail;
 	}
 
-	ret = msm_hdmi_hpd_enable(hdmi->bridge);
-	if (ret < 0) {
-		DRM_DEV_ERROR(&hdmi->pdev->dev, "failed to enable HPD: %d\n", ret);
-		goto fail;
-	}
-
 	priv->bridges[priv->num_bridges++]       = hdmi->bridge;
 
 	return 0;
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index e07450fbb521..165b85a0b0f3 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -220,8 +220,8 @@ void msm_hdmi_bridge_destroy(struct drm_bridge *bridge);
 void msm_hdmi_hpd_irq(struct drm_bridge *bridge);
 enum drm_connector_status msm_hdmi_bridge_detect(
 		struct drm_bridge *bridge);
-int msm_hdmi_hpd_enable(struct drm_bridge *bridge);
-void msm_hdmi_hpd_disable(struct hdmi_bridge *hdmi_bridge);
+void msm_hdmi_hpd_enable(struct drm_bridge *bridge);
+void msm_hdmi_hpd_disable(struct drm_bridge *bridge);
 
 /*
  * i2c adapter for ddc:
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 01630445a664..86196f090ac9 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -13,9 +13,6 @@
 
 void msm_hdmi_bridge_destroy(struct drm_bridge *bridge)
 {
-	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
-
-	msm_hdmi_hpd_disable(hdmi_bridge);
 	drm_bridge_remove(bridge);
 }
 
@@ -299,6 +296,9 @@ static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
 	.mode_valid = msm_hdmi_bridge_mode_valid,
 	.get_edid = msm_hdmi_bridge_get_edid,
 	.detect = msm_hdmi_bridge_detect,
+
+	.hpd_enable = msm_hdmi_hpd_enable,
+	.hpd_disable = msm_hdmi_hpd_disable,
 };
 
 static void
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
index 2080e7c6700c..04d00b6f36fd 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
@@ -60,7 +60,7 @@ static void msm_hdmi_phy_reset(struct hdmi *hdmi)
 	}
 }
 
-int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
+void msm_hdmi_hpd_enable(struct drm_bridge *bridge)
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
@@ -70,8 +70,8 @@ int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
 	unsigned long flags;
 
 	ret = pm_runtime_resume_and_get(dev);
-	if (ret)
-		return ret;
+	if (WARN_ON(ret))
+		return;
 
 	mutex_lock(&hdmi->state_mutex);
 	msm_hdmi_set_mode(hdmi, false);
@@ -99,12 +99,11 @@ int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
 	hdmi_write(hdmi, REG_HDMI_HPD_CTRL,
 			HDMI_HPD_CTRL_ENABLE | hpd_ctrl);
 	spin_unlock_irqrestore(&hdmi->reg_lock, flags);
-
-	return 0;
 }
 
-void msm_hdmi_hpd_disable(struct hdmi_bridge *hdmi_bridge)
+void msm_hdmi_hpd_disable(struct drm_bridge *bridge)
 {
+	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
 	struct device *dev = &hdmi->pdev->dev;
 
-- 
2.39.2

