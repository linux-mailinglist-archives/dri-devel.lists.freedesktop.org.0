Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C696A4811
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 18:33:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B2EC10E1DD;
	Mon, 27 Feb 2023 17:33:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC24E10E1DD
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 17:33:05 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id v11so3957397plz.8
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 09:33:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OTJItNP0wwoi0zfE13wa5cJIG6qrtf4/sDgikbyAPqk=;
 b=l8z0K8RF6z/QR3oZloAbcBIWTOOUM4JeNKPYQttp0tWNGC+OCHNTrKRk2GUqV/6Pes
 uiuMTsStBk0f8ar7FL87W7OYDwuXgfOx7wIzE3s7AOaol2M+NOm5kwx2XJoTPjDIXAkt
 xz1SqM3gq3xaHzhzvpC+zZ0One/MRLdFp1Dgs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OTJItNP0wwoi0zfE13wa5cJIG6qrtf4/sDgikbyAPqk=;
 b=fP7BEqe9kMYah6PU6jysc+TD2FLchHIiHIa6dyvl8leU9c+hHKnbzUhrHC7ntVBg+z
 2ykT43DGI42RxTl5D1RSGlqk3PYJN+Fse37g9kbN+fv5Z5OS3ECxGZ6Lt5PbUKwksROK
 O4X7ionhw/rlIUGYf181x3RrjXTtmpNewxQmIyuZa1pAoSJEnZqlOWpcZOoppBQh3iRJ
 90FpD9qAZbxha3lMTuA8jmf8K70Lc8M9pXKp181EjRTZrR1JAVoFKD/3VQL76QyT2N5/
 O6JJqIG0PRE5CzYqYS3pelQh+L12+xJ7mDWRpMA+XkNevIymNKoEGmvKLUgvpYE/YvTn
 1/SQ==
X-Gm-Message-State: AO0yUKU6LgIuGjwqaJDTTzCSwt4Cg3RfDVR8woA+rL89RP89iYyTLQp7
 Lm0GoMXvh3E9Mbxe575fIu5igw==
X-Google-Smtp-Source: AK7set/U0qTPxQReQcNfQCS3IytuDxl3M0P1N3ZmUC87snABCHdGLOuebn4mK2XgGq660pwj6Z0SgA==
X-Received: by 2002:a05:6a20:b062:b0:cc:f047:afaf with SMTP id
 dx34-20020a056a20b06200b000ccf047afafmr240390pzb.11.1677519185500; 
 Mon, 27 Feb 2023 09:33:05 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a1ce:9be1:7461:c30:b70a])
 by smtp.gmail.com with ESMTPSA id
 a63-20020a639042000000b004fbb48e3e5csm4308881pge.77.2023.02.27.09.33.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 09:33:04 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Marek Vasut <marex@denx.de>
Subject: [PATCH v14 3/3] drm: bridge: panel: Add drmm_of_dsi_get_bridge helper
Date: Mon, 27 Feb 2023 23:02:31 +0530
Message-Id: <20230227173231.950107-3-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230227173231.950107-1-jagan@amarulasolutions.com>
References: <20230227173231.950107-1-jagan@amarulasolutions.com>
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
Cc: linux-amarula <linux-amarula@amarulasolutions.com>,
 Jagan Teki <jagan@amarulasolutions.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add devm OF helper to return the next DSI bridge in the chain.

Unlike general bridge return helper drmm_of_get_bridge, this
helper uses the dsi specific panel_or_bridge helper to find the
next DSI device in the pipeline.

Helper lookup a given child DSI node or a DT node's port and
endpoint number, find the connected node and return either
the associated struct drm_panel or drm_bridge device.

Cc: Maxime Ripard <mripard@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v14:
- add drmm_of_dsi_get_bridge
Changes for v13, v12, v11:
- none
Changes for v10:
- new patch

 drivers/gpu/drm/bridge/panel.c | 32 ++++++++++++++++++++++++++++++++
 include/drm/drm_bridge.h       |  8 ++++++++
 2 files changed, 40 insertions(+)

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index d235a3843fcb..92fc7143a249 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -531,4 +531,36 @@ struct drm_bridge *drmm_of_get_bridge(struct drm_device *drm,
 }
 EXPORT_SYMBOL(drmm_of_get_bridge);
 
+/**
+ * drmm_of_dsi_get_bridge - Return next DSI bridge in the chain
+ * @np: device tree node containing DSI output ports
+ * @port: port in the device tree node
+ * @endpoint: endpoint in the device tree node
+ *
+ * Given a DT node's port and endpoint number, finds the connected node
+ * and returns the associated DSI bridge if any, or creates and returns
+ * a DSI panel bridge instance if a panel is connected.
+ *
+ * Returns a drmm managed pointer to the DSI bridge if successful, or
+ * an error pointer otherwise.
+ */
+struct drm_bridge *drmm_of_dsi_get_bridge(struct device_node *np,
+					  u32 port, u32 endpoint)
+{
+	struct drm_bridge *bridge;
+	struct drm_panel *panel;
+	int ret;
+
+	ret = drm_of_dsi_find_panel_or_bridge(np, port, endpoint,
+					      &panel, &bridge);
+	if (ret)
+		return ERR_PTR(ret);
+
+	if (panel)
+		bridge = drmm_panel_bridge_add_nodrm(panel);
+
+	return bridge;
+}
+EXPORT_SYMBOL(drmm_of_dsi_get_bridge);
+
 #endif
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index acc118bab758..a88391cf64b8 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -932,6 +932,8 @@ struct drm_bridge *devm_drm_of_get_bridge(struct device *dev, struct device_node
 					  u32 port, u32 endpoint);
 struct drm_bridge *drmm_of_get_bridge(struct drm_device *drm, struct device_node *node,
 					  u32 port, u32 endpoint);
+struct drm_bridge *drmm_of_dsi_get_bridge(struct device_node *node,
+					  u32 port, u32 endpoint);
 #else
 static inline struct drm_bridge *devm_drm_of_get_bridge(struct device *dev,
 							struct device_node *node,
@@ -948,6 +950,12 @@ static inline struct drm_bridge *drmm_of_get_bridge(struct drm_device *drm,
 {
 	return ERR_PTR(-ENODEV);
 }
+
+static inline struct drm_bridge *
+drmm_of_dsi_get_bridge(struct device_node *node, u32 port, u32 endpoint)
+{
+	return ERR_PTR(-ENODEV);
+}
 #endif
 
 #endif
-- 
2.25.1

