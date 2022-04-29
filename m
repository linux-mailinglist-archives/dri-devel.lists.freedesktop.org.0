Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F799515414
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 20:52:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 268B210F76D;
	Fri, 29 Apr 2022 18:52:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E94FF10E9C0
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 18:52:05 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id 16so11520027lju.13
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 11:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AyU7BonIGwyxpeC2bOo+UtiaB+LwIrj5CM8fTIllsQE=;
 b=P92cNaj0ZHc/r99hsBpAnOLZGkmzH1bBE9tBUT1eqad0V6Fma0kGCy/grop1zEbclq
 WYpxnm+PON4K2dLSohp8oXPqt4qJuAbccZrNj19cNjvyhzLHshfECAZjbCdzYNOCpZdL
 rz1ZktAIHbvYOtTHuR7Hp2VkGVWnEjzVQL7LJBL/NwDLFkHArFChkCWTFC01UlBpEKt0
 27Xfh0xECWPOU/TwlI7ghByATy3l5HvYvdl+45uNfFZUftr4xkXKUK3OC2Xwqq6tH1rf
 d/LbG6Q1ISIfO69URuzNhPM2PUAgekJLwr8+ZLzzgqVm2V5VJwA6cirRR4YCFs87d+c3
 0Lgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AyU7BonIGwyxpeC2bOo+UtiaB+LwIrj5CM8fTIllsQE=;
 b=WacW/vf5S4FQEIJIuoEXvMv/Pm+NHHsW27PnHxlIXEy7t7M01tGG4YGAaYRqq4kBfG
 lVjQfkexX7J1LiYtS/gq3Wuxxlaf/aGmpbwc29rdPrdL/KzqxcQkprinvbyETe3GYT/u
 DvrWwlg8Z+5DXhoMfR3kEU1Uc0EEKZaMz0nrlRBXBsifwYbXlCyCkNSU1xfvZbvfaxIB
 RdWqEiM2D/Ni4Ow6W4eXLnY2l97dot/fa+dbKV5MqXSqTxfBC2IBaowwoe9wYVX1ouYe
 72xFslA4+rZJyqUUFSFkqP8D27Yip7XiiNHweAcrqMmzvOAzaLaQUHLJLe1xMLv9xeN7
 RpRw==
X-Gm-Message-State: AOAM533EeTtosFdES5R2BRDy1QMwHhb78Lnif7GTGjmKhLBtWQherp7I
 ceXoiD5pAXwd85UId35OjMt/3KEQ7IWdYw==
X-Google-Smtp-Source: ABdhPJyZHl0WHe7eWa5m4Kb1bDgSwHmoXE/Zb1qZAcNGCEnxYagQPlTox6AC3dQdDtaeyeq6dSzjGQ==
X-Received: by 2002:a2e:8917:0:b0:24f:3bb6:b399 with SMTP id
 d23-20020a2e8917000000b0024f3bb6b399mr382679lji.246.1651258324208; 
 Fri, 29 Apr 2022 11:52:04 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 z25-20020a19e219000000b00472230888a5sm295313lfg.121.2022.04.29.11.52.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 11:52:03 -0700 (PDT)
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
Subject: [PATCH v1 4/7] drm/imx/dcss: stop using
 drm_bridge_connector_en/disable_hpd()
Date: Fri, 29 Apr 2022 21:51:54 +0300
Message-Id: <20220429185157.3673633-5-dmitry.baryshkov@linaro.org>
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
 drivers/gpu/drm/imx/dcss/dcss-dev.c | 4 ----
 drivers/gpu/drm/imx/dcss/dcss-kms.c | 4 ----
 2 files changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-dev.c b/drivers/gpu/drm/imx/dcss/dcss-dev.c
index c849533ca83e..62c5f7cd5906 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-dev.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-dev.c
@@ -254,8 +254,6 @@ int dcss_dev_suspend(struct device *dev)
 	struct dcss_kms_dev *kms = container_of(ddev, struct dcss_kms_dev, base);
 	int ret;
 
-	drm_bridge_connector_disable_hpd(kms->connector);
-
 	drm_mode_config_helper_suspend(ddev);
 
 	if (pm_runtime_suspended(dev))
@@ -289,8 +287,6 @@ int dcss_dev_resume(struct device *dev)
 
 	drm_mode_config_helper_resume(ddev);
 
-	drm_bridge_connector_enable_hpd(kms->connector);
-
 	return 0;
 }
 #endif /* CONFIG_PM_SLEEP */
diff --git a/drivers/gpu/drm/imx/dcss/dcss-kms.c b/drivers/gpu/drm/imx/dcss/dcss-kms.c
index 9b84df34a6a1..614073eb70b0 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-kms.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-kms.c
@@ -142,8 +142,6 @@ struct dcss_kms_dev *dcss_kms_attach(struct dcss_dev *dcss)
 
 	drm_kms_helper_poll_init(drm);
 
-	drm_bridge_connector_enable_hpd(kms->connector);
-
 	ret = drm_dev_register(drm, 0);
 	if (ret)
 		goto cleanup_crtc;
@@ -153,7 +151,6 @@ struct dcss_kms_dev *dcss_kms_attach(struct dcss_dev *dcss)
 	return kms;
 
 cleanup_crtc:
-	drm_bridge_connector_disable_hpd(kms->connector);
 	drm_kms_helper_poll_fini(drm);
 	dcss_crtc_deinit(crtc, drm);
 
@@ -169,7 +166,6 @@ void dcss_kms_detach(struct dcss_kms_dev *kms)
 	struct drm_device *drm = &kms->base;
 
 	drm_dev_unregister(drm);
-	drm_bridge_connector_disable_hpd(kms->connector);
 	drm_kms_helper_poll_fini(drm);
 	drm_atomic_helper_shutdown(drm);
 	drm_crtc_vblank_off(&kms->crtc.base);
-- 
2.35.1

