Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C616360AF42
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 17:40:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E813810E89D;
	Mon, 24 Oct 2022 15:39:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CA3810E22A
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 15:39:34 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id bp15so17316551lfb.13
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 08:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lqeu0gWL+fbuCou+DZo8aED2KhTyfiRcmIANTVXwORA=;
 b=Bhop75vDua+I6VnKKtIzGDOgMa/TkLWdFRQLohMlW1HvwtaoIZ8b2oBnHstkVtY6up
 sJv/MkgH/m8TW4wysWYZltZ9eti515KpLLYjhQ0J8ZD2ex8gjXXiN8oGxCxa7+WGoWHj
 ZLmomSsLPw8wVfiW1doVj3OgD8cqRvqIY0gMc7BPIbEmrWALGneXEKTfkV0dPn9B0tOu
 KTmhg3Sck5dlZX+DZUW+tlACH3osvxzilo05OiffJ3BTj4985/p/Nnnt6bdPG28A9/SZ
 yTlCuiBqT+U5WIM+ar01IAjCoLIeC5hMl9VoLfe+Rfq46v9blTEx0DFCHZMVGiC8FNOK
 7AWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lqeu0gWL+fbuCou+DZo8aED2KhTyfiRcmIANTVXwORA=;
 b=KFpa85DwpaUYQbt9ItlWxOWHpgJIvyfeMqX8YQ3RdMllUu7tku3+mb0HOtWGdH80h9
 PjrYO2Bs93N7i5CrQcZ6xUI3UdknfE9ZN5L2XHKlev1hdTesGYrWM5aUqv/5q5aUGr5R
 PWIi4vbMAJ3UubtuI6KwzIWKuT6E5EgKy+xuRApqPbaASCI/fu+So1KODLWmq7vxLx8a
 27ouQIqMvBVuYhB1PqGQwINx4TODl5AsfmaZq0Q/bjj0L9DAwYTfD0NH+5iMUsXWLhrG
 mMHyOupO8piZl3rFmVE6gtcx4m78H4VfZIzxhlFrms4kjxU105KqpW9fTUqQ9JonelHV
 iwzA==
X-Gm-Message-State: ACrzQf2sM7fn0kfWIY4HYTXO7Si2yBp3V+tuuIpqfKh8z8M/a22JeIMA
 s2qSQdKEsnW8f6RrCcVuyO5Z6T4jNU4mRkrg
X-Google-Smtp-Source: AMsMyM4H3MypoErfub8/8Pg6YTAr0N0N1oputVQM9J4Dq5B073oP7x75ihH1LSiPR88OG4YJOAhABA==
X-Received: by 2002:ac2:5928:0:b0:4a2:2819:4fb2 with SMTP id
 v8-20020ac25928000000b004a228194fb2mr11388733lfi.183.1666625972493; 
 Mon, 24 Oct 2022 08:39:32 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 f23-20020a19ae17000000b00497b198987bsm452181lfc.26.2022.10.24.08.39.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 08:39:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
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
Subject: [PATCH v2 6/7] drm/omap: stop using
 drm_bridge_connector_en/disable_hpd()
Date: Mon, 24 Oct 2022 18:39:25 +0300
Message-Id: <20221024153926.3222225-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221024153926.3222225-1-dmitry.baryshkov@linaro.org>
References: <20221024153926.3222225-1-dmitry.baryshkov@linaro.org>
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

