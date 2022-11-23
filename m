Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1080D6358E4
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 11:05:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 030AF10E218;
	Wed, 23 Nov 2022 10:05:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 406BF10E20D
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 10:05:38 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 w15-20020a17090a380f00b0021873113cb4so1413758pjb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 02:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1l36+yjPBM6OIANeKy2/6rDvglh4GiKCjNdGiIn1fFk=;
 b=Vwmvmase7OlvtEU2AuizHJgkGE+T7RHQixihY6R2G9s135jY1iE6ZHtm83be9TGR/g
 Zs0MVFw+jRPryPao3x09vXfmu+eQwsd3WuHAz92o6aQFpiZK8123BE+B5xh9uI7fqvs6
 veTgYAd4qeEFAvGA5YX6pt0Cg6MZeRdp0VpX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1l36+yjPBM6OIANeKy2/6rDvglh4GiKCjNdGiIn1fFk=;
 b=8INnrzMMeARoj58nZTQuTYx+Gty3oPCMrmHBtOUvcuaq12Ms2HbUyAhsPyqDWA+yfM
 80dpM34HuCR80G2vWpSc14l+sm29TRNUXht0Bj9QOaV8/aXpF3o0qX25GGzGViCldjHC
 NuLiUpwkq/4mdVcmVdx7k0WZ7Vx4h4lDqEHnITI2S7Q7YTk6g4dpNEUD5QzCvdH2rJgM
 TqDs2VB2IS0b6YEPw2tuyAuCnw3XZBX08jdG5Js9MfqhaBG/nscocYGyO9F3AxSMdh+S
 wQ2kCSil0+7X+ciJRwpYMA8gFHi1phBKS0SFGhXUDN/bJ0uHTNqj6rS1qPbo9amD6wpJ
 BYkQ==
X-Gm-Message-State: ANoB5pn7pExFw6zULnDAjc4XxDSpcPX/T9BETS0hilgNfWOKY/lrBz5L
 n0rS0WLx9FLDq4LL9ZGoI+cvLAxQqeSe28vk
X-Google-Smtp-Source: AA0mqf4VZTREQASrrgTjUIM5NM4k1JFmGBXeO4ZH9IX6dRhBgbnKhYPngFJR6oFzEG6rxGcMeo/2xw==
X-Received: by 2002:a17:902:e3d5:b0:188:9542:515 with SMTP id
 r21-20020a170902e3d500b0018895420515mr8790139ple.102.1669197937678; 
 Wed, 23 Nov 2022 02:05:37 -0800 (PST)
Received: from hsinyi.c.googlers.com.com
 (46.165.189.35.bc.googleusercontent.com. [35.189.165.46])
 by smtp.gmail.com with ESMTPSA id
 y129-20020a626487000000b005745a586badsm1020138pfb.218.2022.11.23.02.05.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 02:05:37 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Sean Paul <seanpaul@chromium.org>,
 Douglas Anderson <dianders@chromium.org>,
 Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v7 1/3] drm_bridge: register content protect property
Date: Wed, 23 Nov 2022 10:05:27 +0000
Message-Id: <20221123100529.3943662-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
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
---
v6->v7: remove reported by bot tag
---
 drivers/gpu/drm/drm_bridge_connector.c | 9 +++++++++
 include/drm/drm_bridge.h               | 4 ++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
index 1c7d936523df..4147c6240110 100644
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
@@ -398,6 +403,10 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	if (panel_bridge)
 		drm_panel_bridge_set_orientation(connector, panel_bridge);
 
+	if (support_hdcp && IS_REACHABLE(CONFIG_DRM_DISPLAY_HELPER) &&
+	    IS_ENABLED(CONFIG_DRM_DISPLAY_HDCP_HELPER))
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
2.38.1.584.g0f3c55d4c2-goog

