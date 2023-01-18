Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE2C672C9E
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 00:31:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2B0C10E0AD;
	Wed, 18 Jan 2023 23:31:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0773010E050
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 23:31:45 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id r9so333027oig.12
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 15:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KGfMBl5GE9RGTrpmBtD/eMSnjaklBe1tQxMzM5Zv8cA=;
 b=HSk34DXM4HMlNtZ4cKEFnLONgd6o1tnbvpeWpngc+WKvXXHULcssTDyH4mBJ5wJ2yk
 BaunsCO5zhjmM/VXL4VtUcgFdsR7FeUI8e42HjzEiIzmaZN+oUfOs96KcrZCEUk+GI9Y
 7TMV9wZxLhsmba43NMR2pQxOeedC8fH6S+lO0LCIOV6VUyYks04UtwIscMY0wdtK87gG
 +WgWsx9Bjp6in5dWsHcj8T4niuhd4ciyHgpJ+pW2EBhWP2w+pE1yJriEa+wJFcv2d9E5
 FOCXM9o6wZ2l+8gZ9gvyDOCdrUTO99auXBd/tUkv7Ai5jj8ihtt8pRpd25GZZaLypRja
 ie+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KGfMBl5GE9RGTrpmBtD/eMSnjaklBe1tQxMzM5Zv8cA=;
 b=ykAMBut8ibY8SL4OegQTeoj+846qKtHfjvSMubg5Vzu+331OeNdPuOzFhoAtZeyE6r
 BSzm6qns7Oa4izUhOmgHVFhxGqrsbxBXFMAN98ect/lXYcs2B/ZEttPuyO8krvVul26s
 kCYOZWault3wz+jE2dmz55mLXAoYhowonJiMx0V8YkVShay5V/TWQSORtclh31iVzpvA
 TNPbGvNubw1J4g90ieUzNr4khNKMc8W5Uad5aKhtt8EiHN92mpZrXw1nBEjIHXeAPSf/
 c+1DkP/YeM0t7No/fCRdnfc6Y2Oe8ELjOh119CzuG5+B1K00VVPJ9UvPRRKdXFVJSe/v
 LnTg==
X-Gm-Message-State: AFqh2krix5vdPjGDrMA7BW16UDD47o/ZZNjTWLb9cWo0r8QaTWLORuIq
 MDndezTqDqMqCxh17gzFDZhiNTkiJYc=
X-Google-Smtp-Source: AMrXdXuf+ZKJEN7IqAh9Nyrm4t+Fq5/ButzdfVgQGQv3cQdSZmzUA9FC1v82rMQXw0Qtq6/mpmSspg==
X-Received: by 2002:a54:4789:0:b0:364:5ea0:c3f6 with SMTP id
 o9-20020a544789000000b003645ea0c3f6mr4123271oic.20.1674084705022; 
 Wed, 18 Jan 2023 15:31:45 -0800 (PST)
Received: from localhost.localdomain ([76.244.6.13])
 by smtp.gmail.com with ESMTPSA id
 q10-20020acad90a000000b00354932bae03sm16966933oig.10.2023.01.18.15.31.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 15:31:44 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V11 1/4] drm: of: Add drm_of_get_dsi_bus helper function
Date: Wed, 18 Jan 2023 17:31:32 -0600
Message-Id: <20230118233135.1174859-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230118233135.1174859-1-macroalpha82@gmail.com>
References: <20230118233135.1174859-1-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, Chris Morgan <macromorgan@hotmail.com>,
 krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 thierry.reding@gmail.com, tzimmermann@suse.de,
 Maya Matuszczyk <maccraft123mc@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add helper function to find DSI host for devices where DSI panel is not
a minor of a DSI bus (such as the Samsung AMS495QA01 panel or the
official Raspberry Pi touchscreen display).

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
---
 drivers/gpu/drm/drm_of.c | 51 ++++++++++++++++++++++++++++++++++++++++
 include/drm/drm_of.h     | 12 ++++++++++
 2 files changed, 63 insertions(+)

diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index 7bbcb999bb75..177b600895d3 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -10,6 +10,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
 #include <drm/drm_encoder.h>
+#include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 
@@ -493,3 +494,53 @@ int drm_of_get_data_lanes_count_ep(const struct device_node *port,
 	return ret;
 }
 EXPORT_SYMBOL_GPL(drm_of_get_data_lanes_count_ep);
+
+#if IS_ENABLED(CONFIG_DRM_MIPI_DSI)
+
+/**
+ * drm_of_get_dsi_bus - find the DSI bus for a given device
+ * @dev: parent device of display (SPI, I2C)
+ *
+ * Gets parent DSI bus for a DSI device controlled through a bus other
+ * than MIPI-DCS (SPI, I2C, etc.) using the Device Tree.
+ *
+ * Returns pointer to mipi_dsi_host if successful, -EINVAL if the
+ * request is unsupported, -EPROBE_DEFER if the DSI host is found but
+ * not available, or -ENODEV otherwise.
+ */
+struct mipi_dsi_host *drm_of_get_dsi_bus(struct device *dev)
+{
+	struct mipi_dsi_host *dsi_host;
+	struct device_node *endpoint, *dsi_host_node;
+
+	/*
+	 * Get first endpoint child from device.
+	 */
+	endpoint = of_graph_get_next_endpoint(dev->of_node, NULL);
+	if (!endpoint)
+		return ERR_PTR(-ENODEV);
+
+	/*
+	 * Follow the first endpoint to get the DSI host node and then
+	 * release the endpoint since we no longer need it.
+	 */
+	dsi_host_node = of_graph_get_remote_port_parent(endpoint);
+	of_node_put(endpoint);
+	if (!dsi_host_node)
+		return ERR_PTR(-ENODEV);
+
+	/*
+	 * Get the DSI host from the DSI host node. If we get an error
+	 * or the return is null assume we're not ready to probe just
+	 * yet. Release the DSI host node since we're done with it.
+	 */
+	dsi_host = of_find_mipi_dsi_host_by_node(dsi_host_node);
+	of_node_put(dsi_host_node);
+	if (IS_ERR_OR_NULL(dsi_host))
+		return ERR_PTR(-EPROBE_DEFER);
+
+	return dsi_host;
+}
+EXPORT_SYMBOL_GPL(drm_of_get_dsi_bus);
+
+#endif /* CONFIG_DRM_MIPI_DSI */
diff --git a/include/drm/drm_of.h b/include/drm/drm_of.h
index 10ab58c40746..082a6e980d01 100644
--- a/include/drm/drm_of.h
+++ b/include/drm/drm_of.h
@@ -15,6 +15,8 @@ struct drm_encoder;
 struct drm_panel;
 struct drm_bridge;
 struct device_node;
+struct mipi_dsi_device_info;
+struct mipi_dsi_host;
 
 /**
  * enum drm_lvds_dual_link_pixels - Pixel order of an LVDS dual-link connection
@@ -129,6 +131,16 @@ drm_of_get_data_lanes_count_ep(const struct device_node *port,
 }
 #endif
 
+#if IS_ENABLED(CONFIG_OF) && IS_ENABLED(CONFIG_DRM_MIPI_DSI)
+struct mipi_dsi_host *drm_of_get_dsi_bus(struct device *dev);
+#else
+static inline struct
+mipi_dsi_host *drm_of_get_dsi_bus(struct device *dev)
+{
+	return ERR_PTR(-EINVAL);
+}
+#endif /* CONFIG_OF && CONFIG_DRM_MIPI_DSI */
+
 /*
  * drm_of_panel_bridge_remove - remove panel bridge
  * @np: device tree node containing panel bridge output ports
-- 
2.34.1

