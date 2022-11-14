Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F27627708
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 09:04:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34F4510E26F;
	Mon, 14 Nov 2022 08:04:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7003410E26E
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 08:04:34 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id h14so9641994pjv.4
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 00:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xoG+PJ9Nv0PDD+u17FuY5+9Du9VLILbNauZXpkpEyQQ=;
 b=CIZEgZfUnCWJeURsVp/Xm+odE+LazMMPO6T0YWFu4rOJWHW0dOOIryWk6KVIImAAIj
 dnRQXgEEDyvvG10/lE+19pymhklk3X1ZIMT5Ml3unTgam0Atkjjo5k6BXk5KC5muXRdZ
 SKJnnogqqy0wD5olJGDVRJpf46SyYN6BB38L4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xoG+PJ9Nv0PDD+u17FuY5+9Du9VLILbNauZXpkpEyQQ=;
 b=Fk+z6y+BAw3mvIgglZuRYKJ4sQyRXOlLrpoOsKxmBrtkPNsNzQFEM/D1thrLCjP93x
 Mhwf9eSPxi3IBwuUpyieSiygJ+ik2jxM7jNwKEjH6QJ5gOtEXQS6HbCqCHurrPigFbZ2
 3lDffWbcNSZkVYwB12UjpolE/eKpixqxRPVcpnLVu2y0oVMcBEg0Gra3WO8IqW7869Tp
 0ahl3SAZsM+9ca313Tp32+o8F5Q3T5E+K/Z7wSDcgiC2sww9zdz8T6aMht0KoRQupXcE
 rCNJlyNQqG6W/AksGtU9E3ARY5Nav3FiVhrihFk0CVV9KL9pUWYMSxaPaYRrE/wK90Pi
 Wr0A==
X-Gm-Message-State: ANoB5pmkyZD3flyGnTfMCFukUzXCLdGE+wwnTBqC3EdZa7SxtuiFhjj0
 e9w9omtjTe2ZsHe2u898EIAdPA==
X-Google-Smtp-Source: AA0mqf5mkTTvERz38Hq6KQcT7IGye7ORIveDefH6gBS7UHEPLjTy8OplWLFFOhShRaVLBM82XyJhqA==
X-Received: by 2002:a17:90a:28e5:b0:213:566c:376e with SMTP id
 f92-20020a17090a28e500b00213566c376emr13043378pjd.96.1668413073771; 
 Mon, 14 Nov 2022 00:04:33 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:40f1:682:170b:f25a])
 by smtp.gmail.com with ESMTPSA id
 u16-20020a170902e5d000b00186fb8f931asm6696799plf.206.2022.11.14.00.04.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Nov 2022 00:04:33 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Sean Paul <seanpaul@chromium.org>,
 Douglas Anderson <dianders@chromium.org>,
 Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v4 1/3] drm_bridge: register content protect property
Date: Mon, 14 Nov 2022 16:04:05 +0800
Message-Id: <20221114080405.2426999-1-hsinyi@chromium.org>
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
---
v3->v4: no change.
---
 drivers/gpu/drm/drm_bridge_connector.c | 8 ++++++++
 include/drm/drm_bridge.h               | 4 ++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
index 1c7d936523df..b4fb5da0b963 100644
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
 
+	if (support_hdcp && IS_ENABLED(CONFIG_DRM_DISPLAY_HDCP_HELPER))
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

