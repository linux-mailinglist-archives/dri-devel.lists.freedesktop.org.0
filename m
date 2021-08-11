Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 142563E9B5C
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 01:51:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 825186E204;
	Wed, 11 Aug 2021 23:51:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C8F56E203;
 Wed, 11 Aug 2021 23:51:08 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 w13-20020a17090aea0db029017897a5f7bcso7726350pjy.5; 
 Wed, 11 Aug 2021 16:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ajYbf81Yqy3WxYtrc+qNAd59M/DxRn0eX+jpAiWAdzU=;
 b=HFa/GpEZhGjw8e5u9UpZtdUaZYDPO2CUPmZsSq+o19AivoJl2fWAXdhJLHqwoU2Vbj
 pf+blzLQRJqfn6OKrZ7rZ9hFlKndZI7QB+4VDlmybyxpp65HOEwjPmnfWVEctyGnfgVC
 /KgKffkOHKtTyfKuQ3G5nDdjP7xBJcQYYlEppSLRxGTdveSrsvfHyHzD7qq2U+2bGI9D
 EaoFeDOBDuGbqjGtnbkkLnvtAbz3DE8P4ae8+Y2VyvLIdP4Tpo0/VND24bgkW1Nv3f62
 Fj9Gb18fb6qwsNg3d6wn4HblHs4yo99aXnJEBr6hy5pbu8gh4Y9mUjnUaiJsikpIP8HS
 9aeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ajYbf81Yqy3WxYtrc+qNAd59M/DxRn0eX+jpAiWAdzU=;
 b=VHzr8c8DOilQMmGHoPKVZ5RO4NiIYaoLCrvdBFM1AYjRRUW8ZDhF03aSm3YeXZRC/2
 4jucC+Z9/t02zYiEPiCc527DDYJSvBqpIpy6BwN/Eb6ksccqk53Mx+fbJh5JIsV4ERat
 lbVP6FpHMn+dlCYOivjCia494OshuRgnu08IZmeENPAF/UFtKvs9lps1aTVF/ev5Ygxh
 wlSxDWQ3vhyyrhOP+QRvh5/L/2TsBpEPAu2iXbBnoXBiduM1+pK1oodRd/dfILWV8S4U
 42qFj8Yt1Ud2qcbeTUSBMsN3nZ0LOmGPb/jMxTb/DHyqufM1QqaCZQU7pO89mSnia4aB
 qJ8Q==
X-Gm-Message-State: AOAM532siLQ1aUFUvj21hKlhvBdyXj7vOXCU3fVIGdBEZgrSvHLi+h8y
 dbvi+X8+V4QbVgc9hgxqF9JPeKs0mOWwoQ==
X-Google-Smtp-Source: ABdhPJytzYhLMXUKv84A3eQfW76ypTSusumRwm/ejokVZS9tslD/F13P648Qt7+qeAfTTfxweVZ69w==
X-Received: by 2002:a17:902:7889:b029:12b:cf54:4bf1 with SMTP id
 q9-20020a1709027889b029012bcf544bf1mr1233174pll.85.1628725867120; 
 Wed, 11 Aug 2021 16:51:07 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 21sm714109pfh.103.2021.08.11.16.51.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 16:51:06 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Stephen Boyd <swboyd@chromium.org>,
 Douglas Anderson <dianders@chromium.org>,
 Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/4] drm/msm/dsi: Support NO_CONNECTOR bridges
Date: Wed, 11 Aug 2021 16:52:48 -0700
Message-Id: <20210811235253.924867-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210811235253.924867-1-robdclark@gmail.com>
References: <20210811235253.924867-1-robdclark@gmail.com>
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

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/Kconfig           |  2 ++
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 41 ++++++++++++++++++---------
 2 files changed, 30 insertions(+), 13 deletions(-)

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
index c41d39f5b7cf..1fd1cf93abbf 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -3,6 +3,8 @@
  * Copyright (c) 2015, The Linux Foundation. All rights reserved.
  */
 
+#include "drm/drm_bridge_connector.h"
+
 #include "msm_kms.h"
 #include "dsi.h"
 
@@ -690,8 +692,7 @@ struct drm_connector *msm_dsi_manager_ext_bridge_init(u8 id)
 	struct drm_device *dev = msm_dsi->dev;
 	struct drm_encoder *encoder;
 	struct drm_bridge *int_bridge, *ext_bridge;
-	struct drm_connector *connector;
-	struct list_head *connector_list;
+	int ret;
 
 	int_bridge = msm_dsi->bridge;
 	ext_bridge = msm_dsi->external_bridge =
@@ -699,22 +700,36 @@ struct drm_connector *msm_dsi_manager_ext_bridge_init(u8 id)
 
 	encoder = msm_dsi->encoder;
 
-	/* link the internal dsi bridge to the external bridge */
-	drm_bridge_attach(encoder, ext_bridge, int_bridge, 0);
-
 	/*
-	 * we need the drm_connector created by the external bridge
-	 * driver (or someone else) to feed it to our driver's
-	 * priv->connector[] list, mainly for msm_fbdev_init()
+	 * Try first to create the bridge without it creating it's own
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
+
+		list_for_each_entry(connector, connector_list, head) {
+			if (drm_connector_has_possible_encoder(connector, encoder))
+				return connector;
+		}
 
-	list_for_each_entry(connector, connector_list, head) {
-		if (drm_connector_has_possible_encoder(connector, encoder))
-			return connector;
+		return ERR_PTR(-ENODEV);
 	}
 
-	return ERR_PTR(-ENODEV);
+	return drm_bridge_connector_init(dev, encoder);
 }
 
 void msm_dsi_manager_bridge_destroy(struct drm_bridge *bridge)
-- 
2.31.1

