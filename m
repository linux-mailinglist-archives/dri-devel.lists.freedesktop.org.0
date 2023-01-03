Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1EB65C6F3
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 20:07:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D974510E4BF;
	Tue,  3 Jan 2023 19:07:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C549110E4BA
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jan 2023 19:07:13 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-1433ef3b61fso37836520fac.10
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Jan 2023 11:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e9FxC5u9raEA62gzOJDTTKSpPWLmB1RuNw13AoTsjYs=;
 b=BaX2cjvuLHWA357xx30duyZwG+ju4OdXVQ3+B7csHL8Dx4Kb1lkU3hVgOUUMa9n88n
 dBfTkp0mPgRJMqvKp3FcIns11EbjFafZFvrp9cmqVHUYGJBe/mkGQVb7W0gytdEm9G7M
 LPrQP9mHDRvSJ6vciFkHHSUgssNV9I3C0pR9ygEiCCG7ODzHKLgZIq22JnpJNzfbUiiy
 RZrgPoO6AUQ5JB8V+CfjVlHWKyC59X/YOXuTe4moyGld64EP5lORjXdHAzU2B5Iyd96S
 uxwZC4S+aaJt93gwi0Bq8ZUqg1sioX62p0fDb4tlHKlzIuOZttY7UoJPdBomm56sV/KX
 uFCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e9FxC5u9raEA62gzOJDTTKSpPWLmB1RuNw13AoTsjYs=;
 b=NfFZVimWX5Isp37CU7eLpnDJtd98xXnN6DGqPznFlH8ZXaRltUiTY7FOYk3N3ruBVB
 xvYG+NHOjnC0oQFW0TE2o9KMZVJUI1GtI+hs6ghsNrFUcKruHoOtCzRt+Fqcxox53FJF
 EnXuQHNhi3XvFBHoveaqWHDjvJqqIyixMBnalvnpZbOS/W0Yg0twp37Eg2oTjX+X2p43
 BwzTNNoh/+i2Y6XPkFjh0Peyhoo9LIw3vJEZE0Jhit0yqg2SHrTsyYeCmKdE28+huPZL
 myVSPNDGapX24TSuGS/3GGBFQ8JwTPfmUHpfQdzON4On6dfa/SOPg2UoUK34yQJw1aro
 yZPQ==
X-Gm-Message-State: AFqh2kqYY5qLypRaocTFutm1hLfocukeRTQn7P+XOucxu80Rpv1u7Xee
 JxhEpCV8x3B8oAt28VGtyKhHQiWIuGE=
X-Google-Smtp-Source: AMrXdXvOHS4LTp18Y1bsii95tobv24huefOurEgedYORrVi88OlhQoRYHmz7podkKPmWnG7yFUIkHA==
X-Received: by 2002:a05:6870:c989:b0:150:8834:f644 with SMTP id
 hi9-20020a056870c98900b001508834f644mr6744260oab.57.1672772832791; 
 Tue, 03 Jan 2023 11:07:12 -0800 (PST)
Received: from localhost.localdomain ([76.244.6.13])
 by smtp.gmail.com with ESMTPSA id
 s24-20020a056870ea9800b0014c7958c55bsm14752207oap.42.2023.01.03.11.07.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 11:07:12 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V7 1/4] drm: of: Add drm_of_get_dsi_bus helper function
Date: Tue,  3 Jan 2023 13:07:04 -0600
Message-Id: <20230103190707.104595-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103190707.104595-1-macroalpha82@gmail.com>
References: <20230103190707.104595-1-macroalpha82@gmail.com>
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
 thierry.reding@gmail.com, tzimmermann@suse.de, maccraft123mc@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add helper function to find DSI host for devices where DSI panel is not
a minor of a DSI bus (such as the Samsung AMS495QA01 panel or the
official Raspberry Pi touchscreen display).

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/drm_of.c | 62 ++++++++++++++++++++++++++++++++++++++++
 include/drm/drm_of.h     | 11 +++++++
 2 files changed, 73 insertions(+)

diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index 7bbcb999bb75..7d89ac164069 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -10,6 +10,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
 #include <drm/drm_encoder.h>
+#include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 
@@ -493,3 +494,64 @@ int drm_of_get_data_lanes_count_ep(const struct device_node *port,
 	return ret;
 }
 EXPORT_SYMBOL_GPL(drm_of_get_data_lanes_count_ep);
+
+/**
+ * drm_of_get_dsi_bus - find the DSI bus for a given device
+ * @dev: parent device of display (SPI, I2C)
+ * @dsi_host: DSI host to be populated
+ * @info: DSI device info to be updated with correct DSI node
+ *
+ * Given a panel device parented to a non-DSI device, follow the
+ * devicetree to find the correct DSI host node and populate the
+ * dsi_host with the correct host and info with the correct node.
+ * Returns zero if successful, -EPROBE_DEFER if the DSI host is
+ * found but not available, or -ENODEV otherwise.
+ */
+int drm_of_get_dsi_bus(struct device *dev,
+			      struct mipi_dsi_host **dsi_host,
+			      struct mipi_dsi_device_info *info)
+{
+	struct device_node *endpoint, *dsi_host_node;
+
+	/*
+	 * Get first endpoint child from device.
+	 */
+	endpoint = of_graph_get_next_endpoint(dev->of_node, NULL);
+	if (!endpoint)
+		return -ENODEV;
+
+	/*
+	 * Follow the first endpoint to get the DSI host node.
+	 */
+	dsi_host_node = of_graph_get_remote_port_parent(endpoint);
+	if (!dsi_host_node)
+		goto error;
+
+	/*
+	 * Get the DSI host from the DSI host node. If we get an error
+	 * or the return is null assume we're not ready to probe just
+	 * yet. Release the DSI host node since we're done with it.
+	 */
+	*dsi_host = of_find_mipi_dsi_host_by_node(dsi_host_node);
+	of_node_put(dsi_host_node);
+	if (IS_ERR_OR_NULL(*dsi_host)) {
+		of_node_put(endpoint);
+		return -EPROBE_DEFER;
+	}
+
+	/*
+	 * Set the node of the mipi_dsi_device_info to the correct node
+	 * and then release the endpoint node since we're done with it.
+	 */
+	info->node = of_graph_get_remote_port(endpoint);
+	if (IS_ERR_OR_NULL(info->node))
+		goto error;
+
+	of_node_put(endpoint);
+	return 0;
+
+error:
+	of_node_put(endpoint);
+	return -ENODEV;
+}
+EXPORT_SYMBOL_GPL(drm_of_get_dsi_bus);
diff --git a/include/drm/drm_of.h b/include/drm/drm_of.h
index 10ab58c40746..e27061b02315 100644
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
@@ -56,6 +58,9 @@ int drm_of_get_data_lanes_count_ep(const struct device_node *port,
 				   int port_reg, int reg,
 				   const unsigned int min,
 				   const unsigned int max);
+int drm_of_get_dsi_bus(struct device *dev,
+		       struct mipi_dsi_host **dsi_host,
+		       struct mipi_dsi_device_info *info);
 #else
 static inline uint32_t drm_of_crtc_port_mask(struct drm_device *dev,
 					  struct device_node *port)
@@ -127,6 +132,12 @@ drm_of_get_data_lanes_count_ep(const struct device_node *port,
 {
 	return -EINVAL;
 }
+static int drm_of_get_dsi_bus(struct device *dev,
+			      struct mipi_dsi_host **dsi_host,
+			      struct mipi_dsi_device_info *info)
+{
+	return -EINVAL;
+}
 #endif
 
 /*
-- 
2.34.1

