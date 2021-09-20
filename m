Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E96E412912
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 00:53:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 864D76E89B;
	Mon, 20 Sep 2021 22:53:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9D2D6E89A;
 Mon, 20 Sep 2021 22:53:30 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id v2so12049610plp.8;
 Mon, 20 Sep 2021 15:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JTJHXwZpnZB7C003w0Z02mZxvz3BkY2tNzedo2hgMcA=;
 b=dCEKqicU32YE7RfuJF0bXx+PXSbbxwAyes/qjsnwbZ0FeIXV0lejfRRvPD3X1MATsv
 HVk52g0fY06SUzNR0FTUft+FhCydgRBisfLDfqxBf9j+Y+N5uYMu/cGVbZcDc5SfkrHn
 x3ojWV4NXqCbCAmgR3OfpUK20Wo4chPVvIe4Qm/hucNgIkTFrH7WfsPKDO9At1NMdW4j
 /Zc8yjGFg0EWXPTqHMoH0v6dsbdrLSbPEYujRXZjv9KrmGWPAnNVEqjwfEUONiArLeqN
 LaMVfU2+GRPvTy8VnminuzZg/ea8DWPmYLdMSEUcrlbOkZ40ePicSSpF11HugaD5kU9I
 akVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JTJHXwZpnZB7C003w0Z02mZxvz3BkY2tNzedo2hgMcA=;
 b=OwJGtee0hiGP6o8EdHFwqg0dEj9zV8gjjQ7qj1dQdeYatuHMi2TDWB6d77Q4/0x70T
 4d7MdmL9lkgpnFQnypGdOiOEHlb14husnvH7P7AVKF0uDvgf9djLANC1+uctfyw7CcBl
 jDCkRkVDlYmzODE4Z+K/UOKVQLwg5eGVRJ56PEHn8qX+2Gs+7F6WW2/Fvv8mX4d+dWYS
 iIGwUibhNU3qK1yP+QlH6SpjA5mxFER71hRaWQUK/Bo2M0wP7fT/HBg05NTl6USMqecW
 3fJSWpVV0wWC2hu4Wke88DgL4bkPaSnPMXXbgUH2BJ+3VaqpapePGfZg5zohdtaAj2ir
 lkFg==
X-Gm-Message-State: AOAM531nfi4TSWB8WYKEcuv57ZjFiuGjI486ieryWs8sQa8lffe+kdhh
 1pkOlFYdvpoxgp7VRcNtA7inDrgz/lM=
X-Google-Smtp-Source: ABdhPJxwF8HwVOZqhx852Cgx5/wu5d11ebuDOmAr/cLic4srvr7jmY+lTlPWM8vG4XnIgC3yFWzlWw==
X-Received: by 2002:a17:90b:8ca:: with SMTP id
 ds10mr1570611pjb.68.1632178409717; 
 Mon, 20 Sep 2021 15:53:29 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 w9sm289028pjk.28.2021.09.20.15.53.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 15:53:28 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/3] drm/msm/dsi: Support NO_CONNECTOR bridges
Date: Mon, 20 Sep 2021 15:57:58 -0700
Message-Id: <20210920225801.227211-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210920225801.227211-1-robdclark@gmail.com>
References: <20210920225801.227211-1-robdclark@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

For now, since we have a mix of bridges which support this flag, which
which do *not* support this flag, or work both ways, try it once with
NO_CONNECTOR and then fall back to the old way if that doesn't work.
Eventually we can drop the fallback path.

v2: Add missing drm_connector_attach_encoder() so display actually comes
    up when the bridge properly handles the NO_CONNECTOR flag

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/msm/Kconfig           |  2 ++
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 50 ++++++++++++++++++++-------
 2 files changed, 39 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index e9c6af78b1d7..36e5ba3ccc28 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -14,6 +14,8 @@ config DRM_MSM
 	select REGULATOR
 	select DRM_KMS_HELPER
 	select DRM_PANEL
+	select DRM_BRIDGE
+	select DRM_PANEL_BRIDGE
 	select DRM_SCHED
 	select SHMEM
 	select TMPFS
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index c41d39f5b7cf..e25877073d31 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -3,6 +3,8 @@
  * Copyright (c) 2015, The Linux Foundation. All rights reserved.
  */
 
+#include "drm/drm_bridge_connector.h"
+
 #include "msm_kms.h"
 #include "dsi.h"
 
@@ -688,10 +690,10 @@ struct drm_connector *msm_dsi_manager_ext_bridge_init(u8 id)
 {
 	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
 	struct drm_device *dev = msm_dsi->dev;
+	struct drm_connector *connector;
 	struct drm_encoder *encoder;
 	struct drm_bridge *int_bridge, *ext_bridge;
-	struct drm_connector *connector;
-	struct list_head *connector_list;
+	int ret;
 
 	int_bridge = msm_dsi->bridge;
 	ext_bridge = msm_dsi->external_bridge =
@@ -699,22 +701,44 @@ struct drm_connector *msm_dsi_manager_ext_bridge_init(u8 id)
 
 	encoder = msm_dsi->encoder;
 
-	/* link the internal dsi bridge to the external bridge */
-	drm_bridge_attach(encoder, ext_bridge, int_bridge, 0);
-
 	/*
-	 * we need the drm_connector created by the external bridge
-	 * driver (or someone else) to feed it to our driver's
-	 * priv->connector[] list, mainly for msm_fbdev_init()
+	 * Try first to create the bridge without it creating its own
+	 * connector.. currently some bridges support this, and others
+	 * do not (and some support both modes)
 	 */
-	connector_list = &dev->mode_config.connector_list;
+	ret = drm_bridge_attach(encoder, ext_bridge, int_bridge,
+			DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	if (ret == -EINVAL) {
+		struct drm_connector *connector;
+		struct list_head *connector_list;
+
+		/* link the internal dsi bridge to the external bridge */
+		drm_bridge_attach(encoder, ext_bridge, int_bridge, 0);
+
+		/*
+		 * we need the drm_connector created by the external bridge
+		 * driver (or someone else) to feed it to our driver's
+		 * priv->connector[] list, mainly for msm_fbdev_init()
+		 */
+		connector_list = &dev->mode_config.connector_list;
 
-	list_for_each_entry(connector, connector_list, head) {
-		if (drm_connector_has_possible_encoder(connector, encoder))
-			return connector;
+		list_for_each_entry(connector, connector_list, head) {
+			if (drm_connector_has_possible_encoder(connector, encoder))
+				return connector;
+		}
+
+		return ERR_PTR(-ENODEV);
+	}
+
+	connector = drm_bridge_connector_init(dev, encoder);
+	if (IS_ERR(connector)) {
+		DRM_ERROR("Unable to create bridge connector\n");
+		return ERR_CAST(connector);
 	}
 
-	return ERR_PTR(-ENODEV);
+	drm_connector_attach_encoder(connector, encoder);
+
+	return connector;
 }
 
 void msm_dsi_manager_bridge_destroy(struct drm_bridge *bridge)
-- 
2.31.1

