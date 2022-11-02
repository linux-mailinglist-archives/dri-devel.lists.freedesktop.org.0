Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8C5616177
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 12:11:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72B3810E47A;
	Wed,  2 Nov 2022 11:11:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F71410E479
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Nov 2022 11:11:53 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id 128so15970378pga.1
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Nov 2022 04:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=m6/hZVhtIbefUcknBjEFg5/f3s1Nad05i+KmCMBOS8c=;
 b=hLqMyKDmts+cb/C7xAVLTNi71pVTv0NmTjToGpyRqd3vLx6TVav4fQClcyMCmXKQ+M
 V0QchhfeV47Z7tL2eUrc/PnSv1h5PRFm0jfFOGKDt7ZV307lBwFKobmmgCXtmyh7wdiY
 ZlH0wfU8MoQKyZG6ENvTSh9ZDEX09jvMX9ZbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m6/hZVhtIbefUcknBjEFg5/f3s1Nad05i+KmCMBOS8c=;
 b=ohoYt4GXszMQYqKn64cF0HN9neici5g+/NibR6cwzbXjbVLMGFkpjFTI3LiENMevCL
 HER/TcgBSqzIsTA2juDFWB0EqqiBVgK7Nr1xwQv+8xokC+ScNfSJugSy2nPXcQG4JhpO
 xZh6VfElB9f6vK0a1yvNiFXC4tfUZP0gJTuwCQZ1PoEiBs6PBEM8t0mY792YrXmCNXoL
 8ueogySOQggzZXS/62Yd8dVAo90SAP03tRyJQ+nf95epKRDvsaXOm0rHyfml/YT6Z7GR
 VbUbuazN9NBshWgzpt3cZOCO0eSRCDSgkpk0h12ptnzHeO76BJgsgsZlpz1MWBt3AZS5
 K3Jg==
X-Gm-Message-State: ACrzQf3SQDAoSKxgOPhIaEO7dOUJ5JZR81Oont5n7GrPFl/M0WmkpBff
 KZ2noEJC3FAs9RdypvkTCbcrNA==
X-Google-Smtp-Source: AMsMyM6Crxni0oCe3e5f5hJnN9Mt/qV0mM6bqwpX26il1/YGroybGY392gEGIreOiMD6whQbfwU8FQ==
X-Received: by 2002:a05:6a00:230f:b0:53e:2c2c:5c03 with SMTP id
 h15-20020a056a00230f00b0053e2c2c5c03mr24447199pfh.11.1667387512828; 
 Wed, 02 Nov 2022 04:11:52 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:c30f:38e9:6ba:158b])
 by smtp.gmail.com with ESMTPSA id
 z20-20020aa79f94000000b0056246403534sm8251048pfr.88.2022.11.02.04.11.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 04:11:52 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Douglas Anderson <dianders@chromium.org>, Sean Paul <seanpaul@chromium.org>
Subject: [PATCH v3 1/2] drm_bridge: register content protect property
Date: Wed,  2 Nov 2022 19:11:46 +0800
Message-Id: <20221102111148.1810314-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.38.0.135.g90850a2211-goog
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
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
---
v2->v3:
Only register the property when there exists any bridge that supports
hdcp.
---
 drivers/gpu/drm/drm_bridge_connector.c | 8 ++++++++
 include/drm/drm_bridge.h               | 4 ++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
index 1c7d936523df5..b4fb5da0b963f 100644
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
index 6b65b0dfb4fb4..1d2ab70f3436a 100644
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
2.38.0.135.g90850a2211-goog

