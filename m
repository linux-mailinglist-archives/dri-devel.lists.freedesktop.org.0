Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2686B67804D
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 16:46:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4918210E4D8;
	Mon, 23 Jan 2023 15:46:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3C8110E4D7
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 15:46:12 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id r9so10667177oig.12
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 07:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KBkAptAOA4H9XjcrGc/btvseom9X4G+qLA3QL8g2pKI=;
 b=fDnhhB8cv1xJPLetzYQDulSv2MFqG/lR2wj7JKxeqrBsFEITJR3o0xa0KHD84CATy2
 j8NuZvIrzHb10BsPkLHa4NdPedviCKorItArzYHXr9BGQkO7jO1KHSbRwBpvKlk1aBsM
 kP4fUiJYmRCTzyhaouCXkXzThrp1FtHa8psEdP+p5oAMOJ/JfxQGL+paQYF3kf8qpUA2
 WnTj+UGgd3HVkejKYYITLuahyKgETGSCZFheegPxjgDqbrOI1EZD896qKpdMjVB25URO
 8rRBQqEUyTNjJLKWDeweWSawgKCNQMWLldhcbBEnv63amw0R9umPy5FNTwqbpJnB3dph
 Fh6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KBkAptAOA4H9XjcrGc/btvseom9X4G+qLA3QL8g2pKI=;
 b=AzQvMgarXs7xk2wHvmOIdfNMXH9VEDxtdDv71KSnGPdSYvUsn89F46Xp5MfHhkyF8I
 +ylGhcB8+PAwhO5RtIzouxRF6TIETgFbcraKNDRwJrR2Y3JPvD1ku0heWIQsHSkS1t4Q
 YT0QX6hGZ5vYuGCv0vKn01um6x6gPfXTi62t0FvXp61y+JA5Iljx2HraYMF263e8JD+2
 ApjggAo5iaaCEe6GCeOXj1iQsw40e0oijqYfjwq9BfD7c/UbPcyDUz+5153Nc3gZ3q2m
 SiLTzEMkRSN0SPIxiTi8GpzYLiyf54gEAoOFiOfOtStYRl5AAsEQJwXTghE2qvjjIfl3
 KEVA==
X-Gm-Message-State: AFqh2kpcOn1XU2RAwbeXgwthsm1+cYOhNiWE5m5cZkOJvnuMo2yYd9aJ
 SESm2OTqMgPCou2ozYPE2cuuGuEFMRo=
X-Google-Smtp-Source: AMrXdXsBC4Oy9Bs8jiGenaXCp7mThY6PZkscpvG6pBvVAfI/+JZkfZBPLz5nukoV20LWokL1OHMZ+g==
X-Received: by 2002:a05:6808:b37:b0:36e:b267:4d16 with SMTP id
 t23-20020a0568080b3700b0036eb2674d16mr6514849oij.6.1674488771883; 
 Mon, 23 Jan 2023 07:46:11 -0800 (PST)
Received: from localhost.localdomain ([76.244.6.13])
 by smtp.gmail.com with ESMTPSA id
 w13-20020a056808140d00b0035e7ed5daa1sm10040132oiv.26.2023.01.23.07.46.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 07:46:11 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V12 1/4] drm: of: Add drm_of_get_dsi_bus helper function
Date: Mon, 23 Jan 2023 09:46:00 -0600
Message-Id: <20230123154603.1315112-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123154603.1315112-1-macroalpha82@gmail.com>
References: <20230123154603.1315112-1-macroalpha82@gmail.com>
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

Co-developed-by: Maya Matuszczyk <maccraft123mc@gmail.com>
Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
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

