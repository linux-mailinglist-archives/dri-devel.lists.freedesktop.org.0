Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A86CE790E3B
	for <lists+dri-devel@lfdr.de>; Sun,  3 Sep 2023 23:29:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9C8D10E213;
	Sun,  3 Sep 2023 21:29:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC70D10E20D
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Sep 2023 21:29:42 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-5009d4a4897so1413923e87.0
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Sep 2023 14:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693776581; x=1694381381; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D5QQwEFqCct7BAxDxlOQzyh1UFNTPO5xvPloHLAel3c=;
 b=kguFFWQDS0DLs6x1XydFwtl41hreI3X2mAzqwT9pYoF4sTbSBaPW+4abGtU2UIbqYm
 55dWOcFydkdlCJuuOlL6BhYnLZIktZvv4nxwxx6ypQFDtCp6L3Ow1wHYRcnty5R2Vzma
 33pFV8nHnNoOksIVklnw6vwvBCTzdU2QJql6MCT692pjzUqWHQt4GRLIWSMXExKx2K3z
 YuJtVu8foMtk+/eLmxY9nDpGl7Uz5/kH0fqq+ni90EvE7tnYUL/CF52KCDpbRwtXJ1fm
 a450Cy4JH5RUgd4hBtaiF153ymDSnhEosMrXqlQ1OyyMK+48SMh6h+JBZD/0BUh0GePV
 ZH1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693776581; x=1694381381;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D5QQwEFqCct7BAxDxlOQzyh1UFNTPO5xvPloHLAel3c=;
 b=fJNIGGFsZJa/QXJMD3FaGMwd/nQ6PYgEAk4t+2Mf1Xvbq27oz+hmJkwZcLh/10wbcL
 ML0gjJFZ/Uh1hrNDmY/5V6DHQMiQ4L8SxuVCyKmfcZPlE6+A5Qr7O5QVCxeteX/IPIFo
 4H+NnygK1QWB6yh1inJ0o2ynFr+R2vcLaLKPdhtOkED3ds/kVnLXq6KON0sN4COTomY+
 hJaW+p5hHoaiy7s2FjQIimsCCZUYKl5iFqrBz7aYPosGTWoSE3VMQrWA3OYJI2QB2x4L
 M8LrAMuotLl1SUB5GJvGRGNrU02512L76U4F6Y5/cVswnCvI0FpB8oT8RmPHN73DsNLm
 S5Iw==
X-Gm-Message-State: AOJu0YyUrP9/3vXqEdmEmWMhADI7jRjoPXBD3xL2wHwSC3nbO52RQ6jP
 2Q+JOC2zUka3v/fk6acRlfXhkg==
X-Google-Smtp-Source: AGHT+IFzGUwTyKGwD7PSfbMHsP+QYUbDM5UQr/fxVIRAAFQABie93pcvAKUcK3M3a83cjojEciNiLg==
X-Received: by 2002:a05:6512:1316:b0:4fb:90c6:c31a with SMTP id
 x22-20020a056512131600b004fb90c6c31amr6277330lfu.14.1693776581063; 
 Sun, 03 Sep 2023 14:29:41 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 eq11-20020a056512488b00b004ff8d9ed368sm1412352lfb.258.2023.09.03.14.29.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Sep 2023 14:29:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v7 3/3] drm/bridge_connector: implement oob_hotplug_event
Date: Mon,  4 Sep 2023 00:29:37 +0300
Message-Id: <20230903212937.2876815-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230903212937.2876815-1-dmitry.baryshkov@linaro.org>
References: <20230903212937.2876815-1-dmitry.baryshkov@linaro.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, intel-gfx@lists.freedesktop.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-arm-msm@vger.kernel.org,
 Janne Grunau <j@jannau.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement the oob_hotplug_event() callback. Translate it to the HPD
notification sent to the HPD bridge in the chain.

Reviewed-by: Janne Grunau <j@jannau.net>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_bridge_connector.c | 31 +++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
index 10b52224db37..bf73960c2c2a 100644
--- a/drivers/gpu/drm/drm_bridge_connector.c
+++ b/drivers/gpu/drm/drm_bridge_connector.c
@@ -5,6 +5,8 @@
 
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/of.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 
 #include <drm/drm_atomic_state_helper.h>
@@ -107,10 +109,9 @@ static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
 	}
 }
 
-static void drm_bridge_connector_hpd_cb(void *cb_data,
-					enum drm_connector_status status)
+static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bridge_connector,
+					    enum drm_connector_status status)
 {
-	struct drm_bridge_connector *drm_bridge_connector = cb_data;
 	struct drm_connector *connector = &drm_bridge_connector->base;
 	struct drm_device *dev = connector->dev;
 
@@ -123,6 +124,21 @@ static void drm_bridge_connector_hpd_cb(void *cb_data,
 	drm_kms_helper_connector_hotplug_event(connector);
 }
 
+static void drm_bridge_connector_hpd_cb(void *cb_data,
+					enum drm_connector_status status)
+{
+	drm_bridge_connector_handle_hpd(cb_data, status);
+}
+
+static void drm_bridge_connector_oob_hotplug_event(struct drm_connector *connector,
+						   enum drm_connector_status status)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+
+	drm_bridge_connector_handle_hpd(bridge_connector, status);
+}
+
 static void drm_bridge_connector_enable_hpd(struct drm_connector *connector)
 {
 	struct drm_bridge_connector *bridge_connector =
@@ -191,6 +207,8 @@ static void drm_bridge_connector_destroy(struct drm_connector *connector)
 	drm_connector_unregister(connector);
 	drm_connector_cleanup(connector);
 
+	fwnode_handle_put(connector->fwnode);
+
 	kfree(bridge_connector);
 }
 
@@ -216,6 +234,7 @@ static const struct drm_connector_funcs drm_bridge_connector_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 	.debugfs_init = drm_bridge_connector_debugfs_init,
+	.oob_hotplug_event = drm_bridge_connector_oob_hotplug_event,
 };
 
 /* -----------------------------------------------------------------------------
@@ -352,6 +371,12 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 		if (!drm_bridge_get_next_bridge(bridge))
 			connector_type = bridge->type;
 
+#ifdef CONFIG_OF
+		if (!drm_bridge_get_next_bridge(bridge) &&
+		    bridge->of_node)
+			connector->fwnode = fwnode_handle_get(of_fwnode_handle(bridge->of_node));
+#endif
+
 		if (bridge->ddc)
 			ddc = bridge->ddc;
 
-- 
2.39.2

