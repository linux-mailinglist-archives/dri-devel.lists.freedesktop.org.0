Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBCE60AF3F
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 17:40:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 294C110E88C;
	Mon, 24 Oct 2022 15:39:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEBDD10E22A
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 15:39:32 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id j4so17488880lfk.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 08:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=caH8bf8ljAti3Iqn2/ffUusX7mem9lzX4QuF6rv2l+k=;
 b=dMVJY+Cb9VtzdDCHUZjAn06H2dioFUyatrkC09DThcAQPNqEao0kik25KnSwI0r5Zw
 sL5lP2FMRmL31OYyaL2EwlUwxzeV3/ip5iY8YDPg6hCHBF4EbUXPc/RizEzF28yaYbJZ
 D2jPxebV1Fn4EUKyqXUjll4Tzu00VEeuv3GzA+bzGJFoOAEt9AZGUBgt43Dl8XLl/gLd
 L8xfWcPaJlxGMMFg+22lgX14kmNgVXPvuIKpndwV2vpvtHSuqTSBMB9KdKzTFTcRmmqA
 cGYmDnpR59N8oJ1Q/UFUJrJoD4UQFb8RjuBFGEC78P4Rui27buRmR5psw0d6ccVvWzmv
 0MgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=caH8bf8ljAti3Iqn2/ffUusX7mem9lzX4QuF6rv2l+k=;
 b=O6r1P2BRiSbOuSVF340qnGSD8fU7uEtKuWgvLihChco0j81nsyXBYIYfxheoZ7w9rc
 QjnyXmreFXqoA4WgjvXPJTldYPNoSYULQNvwQCrEbQFrk31LgsZzZGAMN4RmFm5TI/xA
 ci8xs/GHunPV4hNX+HsVcCOwU/SUS4idkxg9Vh7Fv7WzebGQKoQ6Bg+x4sejUfb7ym9h
 SldobEF+09/S9wJBgaH1JmCvKVGsbAwlrBhkCZ166f/GbtaVg/0ARLqmCMDo7iLqzTHe
 b/8ziBErrU+rDdwjH4tFc+EHcpfrvkHNwnJmCRqPznP3KOUTCq/B6S9p5bb30nujSpfU
 bBrA==
X-Gm-Message-State: ACrzQf12yeNCc/ZIbkOcb+2lqtDzXy6LULfoS2EpuxEjwuV8YmSwyaUV
 tW2GR0vuXd9xNuzxMIJKEvEl2Q==
X-Google-Smtp-Source: AMsMyM61cHuSLQ+hwsVCuXuJ2Y6XafRYO+12KFxhVgnlTItSV3fCxBMAdIvZvQVJJ1VyRDqwO1xk4g==
X-Received: by 2002:ac2:429a:0:b0:49f:9c71:50b6 with SMTP id
 m26-20020ac2429a000000b0049f9c7150b6mr11744947lfh.349.1666625970972; 
 Mon, 24 Oct 2022 08:39:30 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 f23-20020a19ae17000000b00497b198987bsm452181lfc.26.2022.10.24.08.39.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 08:39:30 -0700 (PDT)
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
Subject: [PATCH v2 4/7] drm/imx/dcss: stop using
 drm_bridge_connector_en/disable_hpd()
Date: Mon, 24 Oct 2022 18:39:23 +0300
Message-Id: <20221024153926.3222225-5-dmitry.baryshkov@linaro.org>
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
 drivers/gpu/drm/imx/dcss/dcss-dev.c | 4 ----
 drivers/gpu/drm/imx/dcss/dcss-kms.c | 2 --
 2 files changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-dev.c b/drivers/gpu/drm/imx/dcss/dcss-dev.c
index 3f5750cc2673..0d8e44f20ec4 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-dev.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-dev.c
@@ -257,8 +257,6 @@ int dcss_dev_suspend(struct device *dev)
 	struct dcss_kms_dev *kms = container_of(ddev, struct dcss_kms_dev, base);
 	int ret;
 
-	drm_bridge_connector_disable_hpd(kms->connector);
-
 	drm_mode_config_helper_suspend(ddev);
 
 	if (pm_runtime_suspended(dev))
@@ -292,8 +290,6 @@ int dcss_dev_resume(struct device *dev)
 
 	drm_mode_config_helper_resume(ddev);
 
-	drm_bridge_connector_enable_hpd(kms->connector);
-
 	return 0;
 }
 #endif /* CONFIG_PM_SLEEP */
diff --git a/drivers/gpu/drm/imx/dcss/dcss-kms.c b/drivers/gpu/drm/imx/dcss/dcss-kms.c
index b4f82ebca532..16ef8aa6da37 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-kms.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-kms.c
@@ -151,7 +151,6 @@ struct dcss_kms_dev *dcss_kms_attach(struct dcss_dev *dcss)
 	return kms;
 
 cleanup_crtc:
-	drm_bridge_connector_disable_hpd(kms->connector);
 	drm_kms_helper_poll_fini(drm);
 	dcss_crtc_deinit(crtc, drm);
 
@@ -167,7 +166,6 @@ void dcss_kms_detach(struct dcss_kms_dev *kms)
 	struct drm_device *drm = &kms->base;
 
 	drm_dev_unregister(drm);
-	drm_bridge_connector_disable_hpd(kms->connector);
 	drm_kms_helper_poll_fini(drm);
 	drm_atomic_helper_shutdown(drm);
 	drm_crtc_vblank_off(&kms->crtc.base);
-- 
2.35.1

