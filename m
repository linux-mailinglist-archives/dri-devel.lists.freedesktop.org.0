Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EFE8D41CF
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 01:13:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D81F11A7E3;
	Wed, 29 May 2024 23:13:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ihgUV8o6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FA1011A97A
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 23:12:31 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2e724bc46bfso2801541fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 16:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717024349; x=1717629149; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=LSZZkKIdPjs/3pbTSieRssyY+6F3HyNGApLO69pzaQo=;
 b=ihgUV8o6Vh0Ny9GMlTT/dB5x4LSEzeExkLVywN6KCHXjs15USqXpemWc0c60dDgA1R
 yXvk2agw3ZiC04ryt+0FA/uAl9onfYw8VpmFIR+g4LiMexVjuV6vN469vd01g7xR18KJ
 f5PK2g5EyLQkDAhmJgtQeT9IOZ1vBZpMOAKfRqHNgUamp9YSjVQwu04ifpTShT0njHtQ
 W2NNQ9EkoMLogB3D2uNtktC5o1P7X/d3cIkWCkBU5uoBbEIsApt/r7HAGTXE9yLFBf2i
 vRdA2823pjmmARIBChbxaV+HOAa1m9eJVKeAWUPm0F6C9+YDreeeCovyvrqdzJ7m7Cnq
 OHsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717024349; x=1717629149;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LSZZkKIdPjs/3pbTSieRssyY+6F3HyNGApLO69pzaQo=;
 b=FVgt/6ZAnwthoSxdbFsMWRxTidxpvY3pVjTGdn30lYDbhwjvFA26nObCxFJw/vc6pd
 M0vMVpkS3UQD6DjhZE1TdRgScGoHi552rTAtTCC6ux0yZ08UJh7ffpcc6ICZ/hwruEWi
 jpp3fvMh7wMhy0ti2JlFpUMpiJ/kFIanLYCYmEOhehjOZ8W07uSGpkNoMXNXgWceo8Md
 dRGQS2/TJ4+Ln8HZ/w/fyHZ6TIZZqa6cAlouR6rhcD1W1gwnj5Crjrrj5ZX9e7deg0NV
 rGhcP0hlx60Lz7Z0dXVrkzF1gMTnHG3PYzkqCOy1Cq58aLcb/nD0GCgaqpyGTIHJTot1
 3yXw==
X-Gm-Message-State: AOJu0Yy/RADLTTeGP2BSfPjOXdnKKxroQgXqARqyCjbSqsqwyOVahMwy
 MreufkZogaButMaCrUpXIf19QOPA4TaI7XJx0NoSaEUXXKlGk/9bhWrTO26RqZI=
X-Google-Smtp-Source: AGHT+IHdUiG+DnvSt0qnuwMbT7cQeaKDEpajLmaXOv5WknZU0NyT9BVVqAh79+PYfLzQZdq2zxMdlQ==
X-Received: by 2002:ac2:523c:0:b0:51f:5d0a:d71a with SMTP id
 2adb3069b0e04-52b7d418dbemr278746e87.10.1717024349656; 
 Wed, 29 May 2024 16:12:29 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-529acea1ea8sm1015998e87.276.2024.05.29.16.12.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 16:12:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 30 May 2024 02:12:25 +0300
Subject: [PATCH v3 2/7] drm/bridge-connector: switch to using drmm allocations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240530-bridge-hdmi-connector-v3-2-a1d184d68fe3@linaro.org>
References: <20240530-bridge-hdmi-connector-v3-0-a1d184d68fe3@linaro.org>
In-Reply-To: <20240530-bridge-hdmi-connector-v3-0-a1d184d68fe3@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2740;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=tsP9tTDeCAxEsLOY742IzVP85XDz5wvrZItLRYft3O8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmV7ZasP81Hpao/5n4EYES8nIOWWg/gr7QS2AUm
 8cTtD+IRrCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZle2WgAKCRCLPIo+Aiko
 1R3MB/9S4LVRBbtll6+h9QWEz5yMUbV4NHe5Si+KYeQBc6Deeau8a0I5gE6NMyZhX8/JVnemsp0
 3oN+WuONb8GN7MXAuFmLKC7vABq5bhEmsVBevmbUbsN+HaeMcPL6myXLoHWINkvRsQNL6aDdHkO
 yKd9atzEHFBrKmdXLvavoHYA7un/xQFOqyUyPCA80UM+pj9ADO8jKTnlS6VFBHWpN3kP+mwio1y
 jqqbcH+GYZTvcJ0SAenLuEoVs4yOEN1+WIx3Qo/mjlLKOlyqWrdq4l/jrU6f9AhYbgTcw0PytT/
 yVToaD/CsmmfEmM4MXGQX+JA6AmidNVgELG8S4eg24GKEsOB
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

Turn drm_bridge_connector to using drmm_kzalloc() and
drmm_connector_init() and drop the custom destroy function. The
drm_connector_unregister() and fwnode_handle_put() are already handled
by the drm_connector_cleanup() and so are safe to be dropped.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_bridge_connector.c | 23 +++++------------------
 1 file changed, 5 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
index 982552c9f92c..e093fc8928dc 100644
--- a/drivers/gpu/drm/drm_bridge_connector.c
+++ b/drivers/gpu/drm/drm_bridge_connector.c
@@ -15,6 +15,7 @@
 #include <drm/drm_connector.h>
 #include <drm/drm_device.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_probe_helper.h>
 
@@ -193,19 +194,6 @@ drm_bridge_connector_detect(struct drm_connector *connector, bool force)
 	return status;
 }
 
-static void drm_bridge_connector_destroy(struct drm_connector *connector)
-{
-	struct drm_bridge_connector *bridge_connector =
-		to_drm_bridge_connector(connector);
-
-	drm_connector_unregister(connector);
-	drm_connector_cleanup(connector);
-
-	fwnode_handle_put(connector->fwnode);
-
-	kfree(bridge_connector);
-}
-
 static void drm_bridge_connector_debugfs_init(struct drm_connector *connector,
 					      struct dentry *root)
 {
@@ -224,7 +212,6 @@ static const struct drm_connector_funcs drm_bridge_connector_funcs = {
 	.reset = drm_atomic_helper_connector_reset,
 	.detect = drm_bridge_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_bridge_connector_destroy,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 	.debugfs_init = drm_bridge_connector_debugfs_init,
@@ -328,7 +315,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	int connector_type;
 	int ret;
 
-	bridge_connector = kzalloc(sizeof(*bridge_connector), GFP_KERNEL);
+	bridge_connector = drmm_kzalloc(drm, sizeof(*bridge_connector), GFP_KERNEL);
 	if (!bridge_connector)
 		return ERR_PTR(-ENOMEM);
 
@@ -383,9 +370,9 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 		return ERR_PTR(-EINVAL);
 	}
 
-	ret = drm_connector_init_with_ddc(drm, connector,
-					  &drm_bridge_connector_funcs,
-					  connector_type, ddc);
+	ret = drmm_connector_init(drm, connector,
+				  &drm_bridge_connector_funcs,
+				  connector_type, ddc);
 	if (ret) {
 		kfree(bridge_connector);
 		return ERR_PTR(ret);

-- 
2.39.2

