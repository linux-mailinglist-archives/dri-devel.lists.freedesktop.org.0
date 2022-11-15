Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B74916291D3
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 07:28:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7439410E36F;
	Tue, 15 Nov 2022 06:28:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7893A10E36E
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 06:28:41 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id k15so13259473pfg.2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 22:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jYF/Js/yiLI83Zy9sWN0PENTbwz1/nvxpqAaN81AAww=;
 b=Po3X0rFRnkmXUSuWki6spsmGHe32wlGY0z2bgPRVq1Tc0tzYKF81Dga33krFcwc8yL
 OCWKk6lm+vccRWTPaB55QNVqzfiWma0lZ3lbY3jrh7cucnDby7HfBBf4RIdNWCnWIrX7
 TTh8Ka5JMep8/45EfFJJbpgNaNQlUgtO0eTOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jYF/Js/yiLI83Zy9sWN0PENTbwz1/nvxpqAaN81AAww=;
 b=N8aJrWWS4TMbhyDrYMc5tUtXWYvvBGo7zy2908qt9sK8gZ+JLJ5RvEe+ysGwyYYP2t
 q3dLBoAUpHTjHNmZm2kOGiuNIUcYLhQN2w/Z12TCbDru19VWz5/xB64CZuUQDz8bO0Le
 SYZenNiVLLkFd6QuXowVxARPb2UHNgvhujBwit9GU/9LivoXemYAcTeQATUGy5rmrW2N
 vcUpjbKCocDvFCYGnkW465S2WTc+krGuH0SaczUbGwID4remjQ3ZnxIe2PtcfNIdcIKL
 5rRQBywWi492BmBfF6yOLBggvitai4PWE0YFnzGhwDIoiLa2VOcZYxQe2kSFKlA/QwGR
 Kzhw==
X-Gm-Message-State: ANoB5plWAsu+BvoZd/Sy8B8RxMLsiwUDFheHS454FTLcELufntH4caim
 v2YpI37c41AAbbsQoy8iyqJDxA==
X-Google-Smtp-Source: AA0mqf4IzV4EzwB6ZQ4gSGDn464H2Neoh21HBw+xWWP6tLmPn0yV5GZ2OwSsUT5D0Vuc4ME2acH77w==
X-Received: by 2002:a63:eb4e:0:b0:45f:f8df:108e with SMTP id
 b14-20020a63eb4e000000b0045ff8df108emr14451107pgk.127.1668493720852; 
 Mon, 14 Nov 2022 22:28:40 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:17d2:e181:950d:967a])
 by smtp.gmail.com with ESMTPSA id
 b22-20020a630c16000000b004351358f056sm6956372pgl.85.2022.11.14.22.28.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Nov 2022 22:28:40 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Sean Paul <seanpaul@chromium.org>,
 Douglas Anderson <dianders@chromium.org>,
 Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v5 1/3] drm_bridge: register content protect property
Date: Tue, 15 Nov 2022 14:28:33 +0800
Message-Id: <20221115062835.3785083-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Allen Chen <allen.chen@ite.com.tw>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some bridges are able to update HDCP status from userspace request if
they support HDCP.

HDCP property is the same as other connector properties that needs to be
created after the connecter is initialized and before the connector is
registered.

If there exists a bridge that supports HDCP, add the property to the
bridge connector.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Sean Paul <seanpaul@chromium.org>
Reported-by: kernel test robot <lkp@intel.com>
---
v4->v5: fix compile warning when CONFIG_DRM_DISPLAY_HELPER=m
---
 drivers/gpu/drm/drm_bridge_connector.c | 8 ++++++++
 include/drm/drm_bridge.h               | 4 ++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
index 1c7d936523df..16d038c2982f 100644
--- a/drivers/gpu/drm/drm_bridge_connector.c
+++ b/drivers/gpu/drm/drm_bridge_connector.c
@@ -7,6 +7,7 @@
 #include <linux/module.h>
 #include <linux/slab.h>
 
+#include <drm/display/drm_hdcp_helper.h>
 #include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_bridge_connector.h>
@@ -333,6 +334,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	struct i2c_adapter *ddc = NULL;
 	struct drm_bridge *bridge, *panel_bridge = NULL;
 	int connector_type;
+	bool support_hdcp = false;
 
 	bridge_connector = kzalloc(sizeof(*bridge_connector), GFP_KERNEL);
 	if (!bridge_connector)
@@ -376,6 +378,9 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 
 		if (drm_bridge_is_panel(bridge))
 			panel_bridge = bridge;
+
+		if (bridge->support_hdcp)
+			support_hdcp = true;
 	}
 
 	if (connector_type == DRM_MODE_CONNECTOR_Unknown) {
@@ -398,6 +403,9 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	if (panel_bridge)
 		drm_panel_bridge_set_orientation(connector, panel_bridge);
 
+	if (support_hdcp && IS_REACHABLE(CONFIG_DRM_DISPLAY_HDCP_HELPER))
+		drm_connector_attach_content_protection_property(connector, true);
+
 	return connector;
 }
 EXPORT_SYMBOL_GPL(drm_bridge_connector_init);
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 6b65b0dfb4fb..1d2ab70f3436 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -768,6 +768,10 @@ struct drm_bridge {
 	 * modes.
 	 */
 	bool interlace_allowed;
+	/**
+	 * @support_hdcp: Indicate that the bridge supports HDCP.
+	 */
+	bool support_hdcp;
 	/**
 	 * @ddc: Associated I2C adapter for DDC access, if any.
 	 */
-- 
2.38.1.431.g37b22c650d-goog

