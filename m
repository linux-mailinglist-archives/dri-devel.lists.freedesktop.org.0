Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A885FBFDD
	for <lists+dri-devel@lfdr.de>; Wed, 12 Oct 2022 06:21:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAEB110E30E;
	Wed, 12 Oct 2022 04:21:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 171C810E30E
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Oct 2022 04:20:59 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 t10-20020a17090a4e4a00b0020af4bcae10so901446pjl.3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Oct 2022 21:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=99TdLCDiLCw1CKOLf2kqVlfCC+0M09AdfWZjON605rQ=;
 b=eztaR/oo+aVk7T4AjXlFgAUpkTdV8XUnPmBWH+GoE8TXoFcNI+OmgXPSMCm2ybcDXR
 nGpi0qlIsI+mSCfo7KdWfC0YB87LaAUaEIF/LTYpnZ7E7gxvcxFTynmlbSRzFPuepaUD
 kCJk0ovkpadyJkkW3u3JO/EfzpKXYDaRGr9sY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=99TdLCDiLCw1CKOLf2kqVlfCC+0M09AdfWZjON605rQ=;
 b=nBOt+1Lz7i2vxzcTyirIWO8IH0b+40phJCGr0a/uwlmj7Mld8N4l2LeSoCRgPy/Qw3
 ioJDvFKrxoJ3OsN35ApmKT3RQBOdUqcc/nhrh9DJZMex0+ISs+mCTJJJ7hCfSPeYCG7C
 rNmwaDgHGwX+OsWen0t+atLM6vaDeotgKL/0cub1GSKDJFgfClBHPay5/YKeiJArS6+5
 9g13rGbc7Ks129BK9DRknFUJqoh+keC262OghVbs4vimx3baFzXngwzNvrnIuCZdeVrP
 iK0EizPUYNS7B4tWs7YjsZbHyV5Q6FXcS9vXeRc28V0BQ2EZlOF2XXvwbfB13U6C/H8r
 0KMg==
X-Gm-Message-State: ACrzQf2xaUFYZ6mMQDyD+sKdyqlLuzhi5dXEEjJWNG04pMPPYea97WGP
 yVJ5r+BRrJGHhrwyXpRPJ3eJYA==
X-Google-Smtp-Source: AMsMyM47l4acst/sR04DCSeFadKyk5MwSU4caq5gnpulOX6YhUk2+D/6OnMS067g5lBoK+dyJezIeg==
X-Received: by 2002:a17:90a:db54:b0:209:e4e4:9344 with SMTP id
 u20-20020a17090adb5400b00209e4e49344mr2859123pjx.62.1665548458546; 
 Tue, 11 Oct 2022 21:20:58 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:31e6:a0c9:ff22:7e86])
 by smtp.gmail.com with ESMTPSA id
 131-20020a621989000000b00561969ea721sm10121806pfz.147.2022.10.11.21.20.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 21:20:58 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Douglas Anderson <dianders@chromium.org>, Sean Paul <seanpaul@chromium.org>
Subject: [PATCH v2] drm_bridge: register content protect property
Date: Wed, 12 Oct 2022 12:20:31 +0800
Message-Id: <20221012042030.573466-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
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

HDCP property is the same as other connector properties that need to be
created after the connecter is initialized and before the connector is
registered.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reported-by: kernel test robot <lkp@intel.com>
---
v2: Fix compile error when config is not set.
---
 drivers/gpu/drm/drm_bridge_connector.c | 3 +++
 include/drm/display/drm_hdcp_helper.h  | 8 ++++++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
index 1c7d936523df5..a3b9ef8dc3f0b 100644
--- a/drivers/gpu/drm/drm_bridge_connector.c
+++ b/drivers/gpu/drm/drm_bridge_connector.c
@@ -7,6 +7,7 @@
 #include <linux/module.h>
 #include <linux/slab.h>
 
+#include <drm/display/drm_hdcp_helper.h>
 #include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_bridge_connector.h>
@@ -398,6 +399,8 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	if (panel_bridge)
 		drm_panel_bridge_set_orientation(connector, panel_bridge);
 
+	drm_connector_attach_content_protection_property(connector, true);
+
 	return connector;
 }
 EXPORT_SYMBOL_GPL(drm_bridge_connector_init);
diff --git a/include/drm/display/drm_hdcp_helper.h b/include/drm/display/drm_hdcp_helper.h
index 8aaf87bf27351..c65d9f06a2532 100644
--- a/include/drm/display/drm_hdcp_helper.h
+++ b/include/drm/display/drm_hdcp_helper.h
@@ -15,8 +15,16 @@ struct drm_device;
 struct drm_connector;
 
 int drm_hdcp_check_ksvs_revoked(struct drm_device *dev, u8 *ksvs, u32 ksv_count);
+#if defined(CONFIG_DRM_DISPLAY_HDCP_HELPER)
 int drm_connector_attach_content_protection_property(struct drm_connector *connector,
 						     bool hdcp_content_type);
+#else
+static inline int drm_connector_attach_content_protection_property(struct drm_connector *connector,
+								   bool hdcp_content_type)
+{
+	return 0;
+}
+#endif
 void drm_hdcp_update_content_protection(struct drm_connector *connector, u64 val);
 
 #endif
-- 
2.38.0.rc1.362.ged0d419d3c-goog

