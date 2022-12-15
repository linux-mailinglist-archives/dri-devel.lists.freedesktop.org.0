Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C58A64E15E
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 19:53:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7366010E54C;
	Thu, 15 Dec 2022 18:52:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F86310E513
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 18:52:23 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-1445ca00781so457341fac.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 10:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xn617BcZSTh+Tv1VQzD2cNnC0x1O8uRUTBT7WhFq7GY=;
 b=iaUGgI6zm2S4J6y8CeuTQyLrYTkN31CQSbVQcmcxcljy+iB53ew7QQ/lUzmrCIQAit
 EAXSYFopTo/eDtzSERRPBpFTUbpF8Bp4CWJ8QxVhcQl/xN76xgq8NY4YhweKqL+6X+sQ
 rAzrSxGP0SpDBLk2hSsQiG1O7yhGZzo/XkV1K+tzEUx492Vi/P6tfCfeW0sEgU/g60wl
 aJxxsINu8tg9pCV8uv20ZU9W901FYSd9Ta5u+p6ChDdXUha7RjIx5UEZEjpq3yxeRoGF
 1tPRY2msCs11fJUJjvEWBCMcGjZcyC3UmY0YJRMKuced16yxXmUqP4mXxm3PgCuzCII4
 +Z7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xn617BcZSTh+Tv1VQzD2cNnC0x1O8uRUTBT7WhFq7GY=;
 b=xKDUmJF7Fqkf4N1T8D7cJHw9koX3HHNFlLXMWKiNV0XZ8F8xWVxFY+icyW6V4A0RjM
 NzxJC7GXaaufUohjZn7AMesS47ccFxgNqD+vOVqu4JzWyY8dDzRiywtKhlbc18EEbJqg
 HBzlVQPmQFMxK6dLcPOa7rW5BKAjr7sxxLNw4Qgj0j0svshm5ND5fvmorOm0pAR2eH+z
 yzdCM7fT0J+akeMvBGn08BENvep6Md2OzSXeO6Z6z6tMEvwK+xhfk53P+ZDm1/CQqLse
 L/2Xi+PQHklVzmtiK5Tsr0yQd8FpZl1EnaH7MN2vCoinaJ7nKewv19qpZraJJh3Rypue
 z77A==
X-Gm-Message-State: ANoB5pmS3f+6jLv8bdViCiVR4sFXpVgkp3srbCZ8OS29/j8TcbZkRccF
 3G41ekD8ICcjtnOtEEoPJ6dBW6WY1XM=
X-Google-Smtp-Source: AA0mqf47rBfZYHu7hg3Y0A1cdftmNxiEogndSB8pVOzg2OPYN/8oB6JyAVaCwGgWFxQMYJC8UY+v5w==
X-Received: by 2002:a05:6870:8307:b0:13b:d3cd:3531 with SMTP id
 p7-20020a056870830700b0013bd3cd3531mr19662488oae.29.1671130338836; 
 Thu, 15 Dec 2022 10:52:18 -0800 (PST)
Received: from localhost.localdomain ([76.244.6.13])
 by smtp.gmail.com with ESMTPSA id
 g11-20020a4ad84b000000b004a09df5a1dbsm72264oov.8.2022.12.15.10.52.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Dec 2022 10:52:18 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V6 1/4] drm: of: Add drm_of_get_dsi_bus helper function
Date: Thu, 15 Dec 2022 12:52:08 -0600
Message-Id: <20221215185211.1560736-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221215185211.1560736-1-macroalpha82@gmail.com>
References: <20221215185211.1560736-1-macroalpha82@gmail.com>
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
index 10ab58c40746..a694ce71c3b2 100644
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
+			      struct mipi_dsi_device_info *info);
+{
+	return -EINVAL;
+}
 #endif
 
 /*
-- 
2.34.1

