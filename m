Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B88CA515418
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 20:52:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A55E310F8F5;
	Fri, 29 Apr 2022 18:52:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58EB410F115
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 18:52:08 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id h29so8336306lfj.2
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 11:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UcCYVcTme16+uWpUP90xtTFpl/uKSWYcTwwPaiNEnH4=;
 b=qM8Xa/+knMRPfLTwlN+fR5Ci35dl6BlRHNoNMYX0hVxDfbUjon+grBnYTYSLc3wpKT
 x4zV6cHCKHtbc51lv2Ah2HUBs9k2H86hvUof04MJ+L1RWBgmtKiX1u9XICgIb4T3AWaJ
 m4FUPRzbY7leMHH75zT6l4BjTs5XX2FRI5CUANIwhQ7zdCt+NFhKOGFTpqUu6dfyHv6E
 E4XiPnOg22O0wCoqh1noIhgC01FYKxIVgoGqmFMWCxjXFP/2gHCiaRjXcYzL5MMYMF4x
 ymA6+KoQHsW5hk1e2FGsMk1QRstd2BiHSgXf9rG9TiNHEwN6aK1f8PzkltynBJS2R4sG
 ms2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UcCYVcTme16+uWpUP90xtTFpl/uKSWYcTwwPaiNEnH4=;
 b=rbpS/BQSwUMtUgjdxuWrnwQNXT/hDnFQtUXpDu21K0FNm6P9hK/+wgo0sujlRMTKtV
 dazfS4N8Krid1JMUvnjeqIpcV02v6QoKFimGguFbpVosWbNhaRpAHLa0GX92BxcPj1gR
 aikZYFlhCMLFSLYkXniBSEWQ6zEuPdmGuG+IFEcwX+Y8zOcs0OS0vcFQEKIJ086StxQh
 DsV/Idmnj0k8sGxW6wszMHjjdVxvFs1KksJPF1Ge3VZnUK4+Ri7MLJzndz2hKLjE0yXI
 0o3qsj1ds4aJd2+WiJHMFGG9mujhAkcKdJxG2Wnb05EIzX1xVzLt5aSMNxZG/FLddXbh
 X+vw==
X-Gm-Message-State: AOAM5334ZdMtw4X1mi51LWqS1AuLZFPvT3vPbdDZiM7mRbq/X8l8bxVW
 EBy7fbLREv4kScBuKeQOSiiqNQ==
X-Google-Smtp-Source: ABdhPJxDM1J9ZFOYujHwlnlADYTDFV6bTMCQTzicA80l40xvHlgv3/pXMH1AjfPq7g134d5qn59tqw==
X-Received: by 2002:ac2:52b4:0:b0:445:ba75:7513 with SMTP id
 r20-20020ac252b4000000b00445ba757513mr442866lfm.248.1651258326717; 
 Fri, 29 Apr 2022 11:52:06 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 z25-20020a19e219000000b00472230888a5sm295313lfg.121.2022.04.29.11.52.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 11:52:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Tomi Valkeinen <tomba@kernel.org>
Subject: [PATCH v1 7/7] drm/bridge_connector: drop
 drm_bridge_connector_en/disable_hpd()
Date: Fri, 29 Apr 2022 21:51:57 +0300
Message-Id: <20220429185157.3673633-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429185157.3673633-1-dmitry.baryshkov@linaro.org>
References: <20220429185157.3673633-1-dmitry.baryshkov@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now as all drivers stopped calling drm_bridge_connector_enable_hpd() and
drm_bridge_connector_disable_hpd() it is safe to remove them complelely.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_bridge_connector.c | 25 -------------------------
 include/drm/drm_bridge_connector.h     |  2 --
 2 files changed, 27 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
index 1592da3b9403..d9c1f61b6fb6 100644
--- a/drivers/gpu/drm/drm_bridge_connector.c
+++ b/drivers/gpu/drm/drm_bridge_connector.c
@@ -128,18 +128,6 @@ static void drm_bridge_connector_hpd_cb(void *cb_data,
 	drm_kms_helper_hotplug_event(dev);
 }
 
-/**
- * drm_bridge_connector_enable_hpd - Enable hot-plug detection for the connector
- * @connector: The DRM bridge connector
- *
- * This function enables hot-plug detection for the given bridge connector.
- * This is typically used by display drivers in their resume handler.
- */
-void drm_bridge_connector_enable_hpd(struct drm_connector *connector)
-{
-}
-EXPORT_SYMBOL_GPL(drm_bridge_connector_enable_hpd);
-
 static void _drm_bridge_connector_enable_hpd(struct drm_connector *connector)
 {
 	struct drm_bridge_connector *bridge_connector =
@@ -151,19 +139,6 @@ static void _drm_bridge_connector_enable_hpd(struct drm_connector *connector)
 				      bridge_connector);
 }
 
-/**
- * drm_bridge_connector_disable_hpd - Disable hot-plug detection for the
- * connector
- * @connector: The DRM bridge connector
- *
- * This function disables hot-plug detection for the given bridge connector.
- * This is typically used by display drivers in their suspend handler.
- */
-void drm_bridge_connector_disable_hpd(struct drm_connector *connector)
-{
-}
-EXPORT_SYMBOL_GPL(drm_bridge_connector_disable_hpd);
-
 static void _drm_bridge_connector_disable_hpd(struct drm_connector *connector)
 {
 	struct drm_bridge_connector *bridge_connector =
diff --git a/include/drm/drm_bridge_connector.h b/include/drm/drm_bridge_connector.h
index 33f6c3bbdb4a..69630815fb09 100644
--- a/include/drm/drm_bridge_connector.h
+++ b/include/drm/drm_bridge_connector.h
@@ -10,8 +10,6 @@ struct drm_connector;
 struct drm_device;
 struct drm_encoder;
 
-void drm_bridge_connector_enable_hpd(struct drm_connector *connector);
-void drm_bridge_connector_disable_hpd(struct drm_connector *connector);
 struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 						struct drm_encoder *encoder);
 
-- 
2.35.1

