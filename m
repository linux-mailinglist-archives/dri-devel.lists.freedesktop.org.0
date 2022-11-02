Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEAE8616BA4
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 19:07:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C068510E530;
	Wed,  2 Nov 2022 18:07:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB95110E538
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Nov 2022 18:07:09 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id f37so29503674lfv.8
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Nov 2022 11:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=caH8bf8ljAti3Iqn2/ffUusX7mem9lzX4QuF6rv2l+k=;
 b=M4Miu7t/weJqZa+rd0xqd/pvcKbBCL+CCFLSP5Gjj8AhcAVtRTWLjFllOFGwdAFauW
 VOYUlzQNHwWOYbXn3BbKjqXiu9BUHPcHJ82nuCi1vrytWgsoB/iPcUeBeTRHh6DurOYv
 ay88f/dVrfXfDo1NQWpElH9L7eSqIfdZLZwcA2C00ABgDbqJr6vFiQVr66UpfemGOrc+
 aumehGsCwdJ+hadRYcvG3Bguw9C0uGigVJRtmW3Hi1nOTw6fQqWMUrUbk2QSdz0vUgOl
 q0nunDf0CWd8i9JP5HAXrwyiZ+O8iLx8svQNbjo60cv1xQIVOwDYbnzHSYdlI8aoRNVo
 EfGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=caH8bf8ljAti3Iqn2/ffUusX7mem9lzX4QuF6rv2l+k=;
 b=1DhDDT2TKTiivSANkju7ZhP9hy3f2PR/f6XRcs+ddupniLqcRUBvW8wJKW4du4FI80
 Ui/tpGmQdvXzHZ4UFGvfTYLFCQw2/W7eLhyoVviYDQFcyoffRY3KMYRixQU3lOGfs1Bl
 BZ62AjVfuHgvpvYHo2vENEaSox08R+aeQHwJ2WHex1Zv3ai0Ga6DyOAjHd9HqtXlSIOt
 3l0Hxq0OpUpFPix4kxx98UvHeyjnVQmon3ishq6hATLhCsKJvI4LLYfKBReGWDv3ftfN
 IiqjTbns2eMu58L0IrtbnzgCyDwFh35vRhxdacLkXpMN5VXDIWkINIeCCmkrh3DDJCU9
 TwtQ==
X-Gm-Message-State: ACrzQf1HApKcNOj+9E+Y0sYdbyzIQS+mzdYjWCJ+cHrvPGtem1sCupyI
 VIDjvBipg5pvblKBopOtm1lIUw==
X-Google-Smtp-Source: AMsMyM7lr3pt+hR6OTjw8GGDV87W40UMzCRnSnEMVhQ6Wvq7PxsdKmr0R33IAhL2J5nDdfBpBa493Q==
X-Received: by 2002:a05:6512:10c6:b0:4a2:abd1:868c with SMTP id
 k6-20020a05651210c600b004a2abd1868cmr10081673lfg.454.1667412429244; 
 Wed, 02 Nov 2022 11:07:09 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 r15-20020ac24d0f000000b00485caa0f5dfsm2085232lfi.44.2022.11.02.11.07.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 11:07:08 -0700 (PDT)
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
Subject: [PATCH v3 4/7] drm/imx/dcss: stop using
 drm_bridge_connector_en/disable_hpd()
Date: Wed,  2 Nov 2022 21:07:02 +0300
Message-Id: <20221102180705.459294-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221102180705.459294-1-dmitry.baryshkov@linaro.org>
References: <20221102180705.459294-1-dmitry.baryshkov@linaro.org>
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

