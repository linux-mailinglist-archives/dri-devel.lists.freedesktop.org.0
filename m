Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A49752D167
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 13:27:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D140911A291;
	Thu, 19 May 2022 11:27:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EE8E11A283
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 11:27:08 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id D71AE83C01;
 Thu, 19 May 2022 13:27:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1652959626;
 bh=3Bg9b8ZoSbkKtq9P3SC7QvBO7phzcdHyJf2WdSpmqCE=;
 h=From:To:Cc:Subject:Date:From;
 b=QzJdFq41Oo0TzOuZH/6finJn1TojWaEqujpjkk8ciFPFlhlSp0V1j2z3EtVXk9e/O
 U6NGLIWja5CRfJelvYTlXRCXt064OhA8nVyoIHcgp7zq1z4LyFqIXV3ycWe/6c48ZN
 tScx/dvMcQ05OWWfC23JwvOnVf9yCwdRVzRKZlVWW/27U1Iaho73jbXmFFMad8mJaj
 ZR+1cg4uozTETR2OdIa/krBLwPE66U7b+H5UvPvn+f72soq/iRgLiGfHI72SKRlvtY
 5GTeEuye4fwZwJcif7JdBsCFXYObmkrcgJzf9VblwFlQ1SOOBL9dmGHIP9OyyICMaK
 EP1j5YPpC+t1w==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 01/11] drm: of: Add drm_of_get_data_lanes and
 drm_of_get_data_lanes_ep
Date: Thu, 19 May 2022 13:26:47 +0200
Message-Id: <20220519112657.62283-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, robert.foss@linaro.org,
 Maxime Ripard <maxime@cerno.tech>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add helper function to count and sanitize DT "data-lanes" property
and return either error or the data-lanes count. This is useful for
both DSI and (e)DP "data-lanes" property. The later version of the
function is an extra wrapper which handles the endpoint look up by
regs, that's what majority of the drivers duplicate too, but not all
of them.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/drm_of.c | 61 ++++++++++++++++++++++++++++++++++++++++
 include/drm/drm_of.h     | 20 +++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index 9a2cfab3a177f..2186f966d2820 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -430,3 +430,64 @@ int drm_of_lvds_get_data_mapping(const struct device_node *port)
 	return -EINVAL;
 }
 EXPORT_SYMBOL_GPL(drm_of_lvds_get_data_mapping);
+
+/**
+ * drm_of_get_data_lanes - Get DSI/(e)DP data lane count
+ * @endpoint: DT endpoint node of the DSI/(e)DP source or sink
+ * @min: minimum supported number of data lanes
+ * @max: maximum supported number of data lanes
+ *
+ * Count DT "data-lanes" property elements and check for validity.
+ *
+ * Return:
+ * * min..max - positive integer count of "data-lanes" elements
+ * * -ve - the "data-lanes" property is missing or invalid
+ * * -EINVAL - the "data-lanes" property is unsupported
+ */
+int drm_of_get_data_lanes(const struct device_node *endpoint,
+			  const unsigned int min, const unsigned int max)
+{
+	int ret;
+
+	ret = of_property_count_u32_elems(endpoint, "data-lanes");
+	if (ret < 0)
+		return ret;
+
+	if (ret < min || ret > max)
+		return -EINVAL;
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(drm_of_get_data_lanes);
+
+/**
+ * drm_of_get_data_lanes_ep - Get DSI/(e)DP data lane count by endpoint
+ * @port: DT port node of the DSI/(e)DP source or sink
+ * @port_reg: identifier (value of reg property) of the parent port node
+ * @reg: identifier (value of reg property) of the endpoint node
+ * @min: minimum supported number of data lanes
+ * @max: maximum supported number of data lanes
+ *
+ * Count DT "data-lanes" property elements and check for validity.
+ * This variant uses endpoint specifier.
+ *
+ * Return:
+ * * min..max - positive integer count of "data-lanes" elements
+ * * -EINVAL - the "data-mapping" property is unsupported
+ * * -ENODEV - the "data-mapping" property is missing
+ */
+int drm_of_get_data_lanes_ep(const struct device_node *port,
+			     int port_reg, int reg,
+			     const unsigned int min,
+			     const unsigned int max)
+{
+	struct device_node *endpoint;
+	int ret;
+
+	endpoint = of_graph_get_endpoint_by_regs(port, port_reg, reg);
+	ret = drm_of_get_data_lanes(endpoint, min, max);
+	of_node_put(endpoint);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(drm_of_get_data_lanes_ep);
diff --git a/include/drm/drm_of.h b/include/drm/drm_of.h
index 99f79ac8b4cd7..b559c53756196 100644
--- a/include/drm/drm_of.h
+++ b/include/drm/drm_of.h
@@ -50,6 +50,12 @@ int drm_of_find_panel_or_bridge(const struct device_node *np,
 int drm_of_lvds_get_dual_link_pixel_order(const struct device_node *port1,
 					  const struct device_node *port2);
 int drm_of_lvds_get_data_mapping(const struct device_node *port);
+int drm_of_get_data_lanes(const struct device_node *endpoint,
+			  const unsigned int min, const unsigned int max);
+int drm_of_get_data_lanes_ep(const struct device_node *port,
+			     int port_reg, int reg,
+			     const unsigned int min,
+			     const unsigned int max);
 #else
 static inline uint32_t drm_of_crtc_port_mask(struct drm_device *dev,
 					  struct device_node *port)
@@ -105,6 +111,20 @@ drm_of_lvds_get_data_mapping(const struct device_node *port)
 {
 	return -EINVAL;
 }
+
+int drm_of_get_data_lanes(const struct device_node *endpoint,
+			  const unsigned int min, const unsigned int max)
+{
+	return -EINVAL;
+}
+
+int drm_of_get_data_lanes_ep(const struct device_node *port,
+			     int port_reg, int reg
+			     const unsigned int min,
+			     const unsigned int max)
+{
+	return -EINVAL;
+}
 #endif
 
 /*
-- 
2.35.1

