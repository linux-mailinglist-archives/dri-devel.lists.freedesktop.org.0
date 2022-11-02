Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A63AF616BA9
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 19:07:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8223510E54D;
	Wed,  2 Nov 2022 18:07:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D85D10E53F
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Nov 2022 18:07:13 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id p8so29457334lfu.11
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Nov 2022 11:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XIWyUY4t9cfdrarJHXAihf6iaXZwwU1KNPGYvwDevnI=;
 b=i3xbLMfpo4u/j3vNZgefupyMkFAAbJ96c/pOf24fBNy7HrB/ysVdgzBAXPVzzHlx9j
 P+5miB9oSd646vEYdznGFwq4V/Tp/sSlSu1Wce/hZOWOzyI+WMsLAPAIXEgjZyItq1sV
 4Dl2jrhU1whajHLdxFLsBIF9nJI21BLhUqh14i9PNDrYXT+/OCgE9OU6jj1jsiI8osXh
 b9oCInof8Ky9g0oy3MtJ1FWowD8Yh2yKyz72kFLkcOCO0vSmmElhraj3Pi9bN8f5obSk
 AEccIEkuCF0+WjoIqE26i7p8WsgF+w+Lhs4nGpM5RJ/atOlrW2yXtYlOwPfZSf0JA95N
 QirQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XIWyUY4t9cfdrarJHXAihf6iaXZwwU1KNPGYvwDevnI=;
 b=g95+XLP1SmquHkIQcE/clwzBvUltk31oBYWKu433stufjyVGaieAXJmUdR2z/1GiFP
 vWcqVlTthgbWGXmeF0/JL14lAOjFwAv7AlWqC3hin6x8lso/HZGeHMsI+80f6ACxNu+Q
 7TJeeFlzPLyGMR+DPBzFxtXK5/jFJH11LMX0Y+mqFalxM6SkDPjpiREjVwrTWyNy7WMR
 IR/aoZ2zEXhRLLZsE+dJdsV9d0GFUVXfKVZwceB9hyrtnF37zbFva8DkKuc1v96AJByJ
 6G9oI2nAqlbKkpRoCS9gi+Cm9TYAImVhAwAmafM8YXFhqPlNRH9UrQCtxgnVi8GD+h1M
 QcPw==
X-Gm-Message-State: ACrzQf3mdTeegQKLd9A7Jc/IXPVdDuLxO6SYoEHArDyMiL8BOkmHMCtj
 6fTyb4PtqMI8CZb3PaVvH1+73w==
X-Google-Smtp-Source: AMsMyM7/ORTdXneoE6DaN9PIj1JPI/RyzxtgQE2m3Ivv/Jm4Eq/tj5/cUKwkaFcOmUugbOJSqvxr9A==
X-Received: by 2002:a05:6512:1156:b0:4a2:7e73:1f28 with SMTP id
 m22-20020a056512115600b004a27e731f28mr10847502lfg.38.1667412431525; 
 Wed, 02 Nov 2022 11:07:11 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 r15-20020ac24d0f000000b00485caa0f5dfsm2085232lfi.44.2022.11.02.11.07.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 11:07:11 -0700 (PDT)
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
Subject: [PATCH v3 7/7] drm/bridge_connector: drop
 drm_bridge_connector_en/disable_hpd()
Date: Wed,  2 Nov 2022 21:07:05 +0300
Message-Id: <20221102180705.459294-8-dmitry.baryshkov@linaro.org>
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

Now as all drivers stopped calling drm_bridge_connector_enable_hpd() and
drm_bridge_connector_disable_hpd() it is safe to remove them complelely.
Rename our internal helpers to remove the underscore prefix.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_bridge_connector.c | 33 ++++----------------------
 include/drm/drm_bridge_connector.h     |  2 --
 2 files changed, 4 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
index 0e13bc87a6ac..19ae4a177ac3 100644
--- a/drivers/gpu/drm/drm_bridge_connector.c
+++ b/drivers/gpu/drm/drm_bridge_connector.c
@@ -128,19 +128,7 @@ static void drm_bridge_connector_hpd_cb(void *cb_data,
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
-static void _drm_bridge_connector_enable_hpd(struct drm_connector *connector)
+static void drm_bridge_connector_enable_hpd(struct drm_connector *connector)
 {
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
@@ -151,20 +139,7 @@ static void _drm_bridge_connector_enable_hpd(struct drm_connector *connector)
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
-static void _drm_bridge_connector_disable_hpd(struct drm_connector *connector)
+static void drm_bridge_connector_disable_hpd(struct drm_connector *connector)
 {
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
@@ -313,8 +288,8 @@ static int drm_bridge_connector_get_modes(struct drm_connector *connector)
 static const struct drm_connector_helper_funcs drm_bridge_connector_helper_funcs = {
 	.get_modes = drm_bridge_connector_get_modes,
 	/* No need for .mode_valid(), the bridges are checked by the core. */
-	.enable_hpd = _drm_bridge_connector_enable_hpd,
-	.disable_hpd = _drm_bridge_connector_disable_hpd,
+	.enable_hpd = drm_bridge_connector_enable_hpd,
+	.disable_hpd = drm_bridge_connector_disable_hpd,
 };
 
 /* -----------------------------------------------------------------------------
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

