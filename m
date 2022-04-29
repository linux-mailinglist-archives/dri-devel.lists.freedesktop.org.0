Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A587515412
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 20:52:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8190410F128;
	Fri, 29 Apr 2022 18:52:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FDC410F115
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 18:52:07 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id w1so15596327lfa.4
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 11:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lqeu0gWL+fbuCou+DZo8aED2KhTyfiRcmIANTVXwORA=;
 b=F3fxtRfDEpSVXHZlP/WwK/IVfVqcq/oG9b9SN8h1W8LtnEJd3SM2+7KX3sB4vO1dUx
 fQEA2lTPMWME+JsnR0jbrqc/ctTE7cn8U71pSe7k9OyXsgA3OSD5Ae1vrfquhu6eBrES
 OqI6ACqg2WYTibjed7me1Cxpa+yWlA+E+7V+giepGgw/ynsOm1O3i2Y8ifWhwmukGNcz
 NYmNDlEmtQAoTJmZ2OqeP+H/EGgEPzkn+Ruum//XDh6H1PfwZsLtq2WJQYPf/XgoHdJ7
 9Ed83Eic/hdHtb+ThZ2xuF+jUFKtlSEfOXCJVE341ecOpcRjjDTt6eTzWryIjmSFNZAY
 jgWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lqeu0gWL+fbuCou+DZo8aED2KhTyfiRcmIANTVXwORA=;
 b=r/88nfrFLNM78Pyp2cO632ds6hEoCkR/BS4FI7TmOF1T1wDE8Mgh4E4c9YXi9XnlSR
 yjn65g4dGMFLU4LBG5+rm3LsBSLmttD9WgsEDM7aj+zME5NkJtH32GACGsUzo0yLzgyM
 Dqiyx50CMIyOaWknYsuDy8jk/FMfM5rPwVSmv3beeU8jQOoDFm90itmadO6VOBI1uQl4
 w1fvTZjMZ6AuErJ8+erKqXBpblhJLHM1cftaeTd5gbqlSskP45bb6dGtpUFR9NZPIrg+
 ZikoOgbSPLXsfcYHDB2qU66dhzkA14q1ikx+eGMg0Q0Woq0oOPj8+T/FhuCTGVD6DToY
 U2GA==
X-Gm-Message-State: AOAM532paGXWjesZkhDLIjWfgtz8kqb6MCoHqti0DhzY7hmtRhC/yRdn
 mHi+ZVxjajLb0E8dpSnyNcHcWw==
X-Google-Smtp-Source: ABdhPJypKbEZWtx1y5Anvfkf2zXysSjtu5YU/Qrc3Zglyg4silcqJGbTm6SvkihY4hifXkIzm6xk+g==
X-Received: by 2002:a05:6512:39c1:b0:471:b37e:fe5a with SMTP id
 k1-20020a05651239c100b00471b37efe5amr388736lfu.527.1651258325946; 
 Fri, 29 Apr 2022 11:52:05 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 z25-20020a19e219000000b00472230888a5sm295313lfg.121.2022.04.29.11.52.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 11:52:05 -0700 (PDT)
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
Subject: [PATCH v1 6/7] drm/omap: stop using
 drm_bridge_connector_en/disable_hpd()
Date: Fri, 29 Apr 2022 21:51:56 +0300
Message-Id: <20220429185157.3673633-7-dmitry.baryshkov@linaro.org>
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

The functionality of drm_bridge_connector_enable_hpd() and
drm_bridge_connector_disable_hpd() is provided automatically by the
drm_kms_poll helpers. Stop calling these functions manually.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/omapdrm/omap_drv.c | 41 ------------------------------
 1 file changed, 41 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index eaf67b9e5f12..699ed814e021 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -545,44 +545,6 @@ static void omap_modeset_fini(struct drm_device *ddev)
 	drm_mode_config_cleanup(ddev);
 }
 
-/*
- * Enable the HPD in external components if supported
- */
-static void omap_modeset_enable_external_hpd(struct drm_device *ddev)
-{
-	struct omap_drm_private *priv = ddev->dev_private;
-	unsigned int i;
-
-	for (i = 0; i < priv->num_pipes; i++) {
-		struct drm_connector *connector = priv->pipes[i].connector;
-
-		if (!connector)
-			continue;
-
-		if (priv->pipes[i].output->bridge)
-			drm_bridge_connector_enable_hpd(connector);
-	}
-}
-
-/*
- * Disable the HPD in external components if supported
- */
-static void omap_modeset_disable_external_hpd(struct drm_device *ddev)
-{
-	struct omap_drm_private *priv = ddev->dev_private;
-	unsigned int i;
-
-	for (i = 0; i < priv->num_pipes; i++) {
-		struct drm_connector *connector = priv->pipes[i].connector;
-
-		if (!connector)
-			continue;
-
-		if (priv->pipes[i].output->bridge)
-			drm_bridge_connector_disable_hpd(connector);
-	}
-}
-
 /*
  * drm ioctl funcs
  */
@@ -782,7 +744,6 @@ static int omapdrm_init(struct omap_drm_private *priv, struct device *dev)
 	omap_fbdev_init(ddev);
 
 	drm_kms_helper_poll_init(ddev);
-	omap_modeset_enable_external_hpd(ddev);
 
 	/*
 	 * Register the DRM device with the core and the connectors with
@@ -795,7 +756,6 @@ static int omapdrm_init(struct omap_drm_private *priv, struct device *dev)
 	return 0;
 
 err_cleanup_helpers:
-	omap_modeset_disable_external_hpd(ddev);
 	drm_kms_helper_poll_fini(ddev);
 
 	omap_fbdev_fini(ddev);
@@ -822,7 +782,6 @@ static void omapdrm_cleanup(struct omap_drm_private *priv)
 
 	drm_dev_unregister(ddev);
 
-	omap_modeset_disable_external_hpd(ddev);
 	drm_kms_helper_poll_fini(ddev);
 
 	omap_fbdev_fini(ddev);
-- 
2.35.1

