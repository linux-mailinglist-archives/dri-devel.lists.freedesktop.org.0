Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 156D5877EE7
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 12:21:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF9D1112870;
	Mon, 11 Mar 2024 11:21:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EI/xQzv1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B64F411277C
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 11:20:50 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2d269dc3575so38685941fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 04:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710156049; x=1710760849; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=gCXm2DvB3Yj7Xx92C5Kj2hDALuD84y0JzdGeVmZf4dE=;
 b=EI/xQzv1A3F6FAQ+/34uFJBeM5v/5uH6aWA1IvXH7xWU6rFbfX/yxx3JUhpwM3JL+c
 uZBQys+GQnra5ZFiv+jhx58embiuOBH0a8Z0bs5/gvzSj7Zt060lMgFKl8HyHm7NRppA
 YqaAJif/q9YosJDa+pNaD9doVy2g35WjF76oV/v3NBGXD6BnorrGA77sfZ9GmGsRq9jp
 sGEvPo5Z6mOLaMiuaGHo3jZAjwFguoS/twAM/TjDW8LSTLZNtF9dYNE7EI3/wX5MWU9R
 O1lc9L+z9SrGnVEkrSkTR1TdduXHY+BzoGMvYpxYhfAaIYMFcO/IZDV4CilZXre9JzNM
 dksA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710156049; x=1710760849;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gCXm2DvB3Yj7Xx92C5Kj2hDALuD84y0JzdGeVmZf4dE=;
 b=UqTF5cw5nvQC80B0tgBL19Nwk/mHG61N6oECEFb1/YrNuJlOc7hgSR+5mAhB95K9HP
 gbIIB5kaCXJlaE5jsLIYutUoHJ5PvZcoaSp5B41HyqiTSb+E1qECVofD7dXjsVViDdT/
 +ovXelbYmk5B1GRXuUha3hocB6KoLHnBtklIyeCD0tSJaBAt/X6/JH7trm03ZQSmz31K
 lY4QxEWAdmAj+Cc8LyDtw8aV2yyTxmGq3ECKcX4YkWv/nlINDfBwxISmu5BBUdn3FMwY
 J0z9R/1W+EOvNuAU9Os6NXME6LAEp6dKa1HzslESDGtFnpILOz9vP+6l08rrpr2YyDQ1
 mg9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMHjbv+I0LX2m6FOmvAh0Kn6jkx4IRchrFwQgE9t6uBiW8LPvuN8MIH0m+6CbzMA+3qykRMi+a1NEXBXZLCyIwEeqzSTOtwhKxVCoGyDyt
X-Gm-Message-State: AOJu0YxGFvO22RSJfHA50khQLiHRo3wLe4KWdQ4XHQna/jlZsFGOim9g
 QSSHpNwqdYLNaKHTIQ3j7zSR0awFo16fnUEC53AsLSrNrieaY6SkMJb2jRKoicA=
X-Google-Smtp-Source: AGHT+IHbf4XJ+DXoOulFtxU1Jg17WWBA5XWZO9E7K6YLNf9lvm+H8AQQETB3XuYvtUXahbYyBkzbxA==
X-Received: by 2002:a2e:9f4b:0:b0:2d3:17e6:3b4a with SMTP id
 v11-20020a2e9f4b000000b002d317e63b4amr2197192ljk.23.1710156048922; 
 Mon, 11 Mar 2024 04:20:48 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 by10-20020a05651c1a0a00b002d2aa0b0d01sm1075200ljb.82.2024.03.11.04.20.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Mar 2024 04:20:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 11 Mar 2024 13:20:20 +0200
Subject: [PATCH 12/12] drm/imx: move imx_drm_connector_destroy to imx-tve
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240311-drm-imx-cleanup-v1-12-e104f05caa51@linaro.org>
References: <20240311-drm-imx-cleanup-v1-0-e104f05caa51@linaro.org>
In-Reply-To: <20240311-drm-imx-cleanup-v1-0-e104f05caa51@linaro.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Chris Healy <cphealy@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2503;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=c/syM85k3g67errNBDbi0QpULM/5w93/bHQAwxlatC0=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+q7l6xarfPEZ82sD+9dILip7r2zS68yM5uenhHLU0vD3
 Y++6e/rZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEVuWy/1PSWLs97f7Ku+29
 nRGcwvmVcTnhe/8prGHJNv5QbWG3a63a5YoyB6aTqcwGJ9omF7EKP/3xzPnxlPMxwpzqxzzWLvu
 xsTNaa9MdDfcZJ3cdE8kJf6QSUbHOaj1zU53gGeEzhb5OB5e5SpcwdS+zfq7VN9X7XvDM4itHfq
 U4RK+2Z9nKZSuyu054SX9XUFvr48AEEcbt+5f3X+M2DGRcfqRs8rYtfSFfiipat0a9Wxaf9nuP9
 9GZXKfUPsex8KYxPeUrXp9z/cNWVdEVMlHZGcZOjRea7oTMWTU1f4ZOSZfc+esG1/I/bOfr+hn8
 U1lVe6dH9ITMqoQ5TTxtj3lFp14sOjahWDJIadmVnpcpAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The imx-tve driver is the only remaining user of
imx_drm_connector_destroy(). Move the function to imx-tve.c

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/imx/ipuv3/imx-drm-core.c | 7 -------
 drivers/gpu/drm/imx/ipuv3/imx-drm.h      | 2 --
 drivers/gpu/drm/imx/ipuv3/imx-tve.c      | 8 +++++++-
 3 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c b/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
index 4cfabcf7375a..189d395349b8 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
@@ -34,13 +34,6 @@ module_param(legacyfb_depth, int, 0444);
 
 DEFINE_DRM_GEM_DMA_FOPS(imx_drm_driver_fops);
 
-void imx_drm_connector_destroy(struct drm_connector *connector)
-{
-	drm_connector_unregister(connector);
-	drm_connector_cleanup(connector);
-}
-EXPORT_SYMBOL_GPL(imx_drm_connector_destroy);
-
 static int imx_drm_atomic_check(struct drm_device *dev,
 				struct drm_atomic_state *state)
 {
diff --git a/drivers/gpu/drm/imx/ipuv3/imx-drm.h b/drivers/gpu/drm/imx/ipuv3/imx-drm.h
index 57a95926c492..509f4c0a2cf0 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-drm.h
+++ b/drivers/gpu/drm/imx/ipuv3/imx-drm.h
@@ -26,8 +26,6 @@ extern struct platform_driver ipu_drm_driver;
 int imx_drm_encoder_parse_of(struct drm_device *drm,
 	struct drm_encoder *encoder, struct device_node *np);
 
-void imx_drm_connector_destroy(struct drm_connector *connector);
-
 int ipu_planes_assign_pre(struct drm_device *dev,
 			  struct drm_atomic_state *state);
 
diff --git a/drivers/gpu/drm/imx/ipuv3/imx-tve.c b/drivers/gpu/drm/imx/ipuv3/imx-tve.c
index b49bddb85535..a5118504b522 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-tve.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-tve.c
@@ -307,9 +307,15 @@ static int imx_tve_atomic_check(struct drm_encoder *encoder,
 	return 0;
 }
 
+static void imx_tve_connector_destroy(struct drm_connector *connector)
+{
+	drm_connector_unregister(connector);
+	drm_connector_cleanup(connector);
+}
+
 static const struct drm_connector_funcs imx_tve_connector_funcs = {
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = imx_drm_connector_destroy,
+	.destroy = imx_tve_connector_destroy,
 	.reset = drm_atomic_helper_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,

-- 
2.39.2

