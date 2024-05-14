Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C908C5664
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2024 14:56:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2080810E8CE;
	Tue, 14 May 2024 12:56:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JFOpTx1k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DC8810E901
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2024 12:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715691402; x=1747227402;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F9SFvvSld3mxRCFNrEt/Vz5BBJ02a8jJaj9L4IM0rfY=;
 b=JFOpTx1kU6LPs+8OkLFX55B8QnTv8DHs/rg6yncA05Tb95IkP6DbeffU
 00jkXmGpoF+AKDfv8/SBcA3AnRcrnVOEDzS7tjdKPn+aJM9Od0OtaYhNZ
 mnu4V3by21QJYJIv0cYHonZRl3LqVAQuwWh1H/8E/4dGqFx9FbRZzo6+x
 fVqDJyHGRvCRmxVu3u3C6CXY9Rg9Hl2xts1UyfPf6kvIy54f0QtwjUcXz
 y2wYxz1UjNjDtt0igKkrJPmaJIUb7JMLboQVKv1YJ7t2CsU6M9ivGsjCg
 esBKM+dx4dKOoDU3mauwGDHqYrXTwaSBTl/T7SKJUJFszm8S+x4dy1DZP A==;
X-CSE-ConnectionGUID: c1+sk96SRkKASDq1xbuJDA==
X-CSE-MsgGUID: W/TWGW+JTUe9Dd2de0tZUA==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="11613910"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="11613910"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 05:56:40 -0700
X-CSE-ConnectionGUID: AOLUXNa0RqmSdoaS4ELN6g==
X-CSE-MsgGUID: eAlX2rlWSwiWZjNrhNobrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="31232444"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.91])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 05:56:36 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH 11/11] drm/imx/ldb: convert to struct drm_edid
Date: Tue, 14 May 2024 15:55:17 +0300
Message-Id: <c1f1143b5aea14aea968cda6508b275b2f7246ea.1715691257.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1715691257.git.jani.nikula@intel.com>
References: <cover.1715691257.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prefer the struct drm_edid based functions for reading the EDID and
updating the connector.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/imx/ipuv3/imx-ldb.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/imx-ldb.c b/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
index 71d70194fcbd..793dfb1a3ed0 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
@@ -72,7 +72,7 @@ struct imx_ldb_channel {
 	struct device_node *child;
 	struct i2c_adapter *ddc;
 	int chno;
-	void *edid;
+	const struct drm_edid *drm_edid;
 	struct drm_display_mode mode;
 	int mode_valid;
 	u32 bus_format;
@@ -142,15 +142,15 @@ static int imx_ldb_connector_get_modes(struct drm_connector *connector)
 	if (num_modes > 0)
 		return num_modes;
 
-	if (!imx_ldb_ch->edid && imx_ldb_ch->ddc)
-		imx_ldb_ch->edid = drm_get_edid(connector, imx_ldb_ch->ddc);
-
-	if (imx_ldb_ch->edid) {
-		drm_connector_update_edid_property(connector,
-							imx_ldb_ch->edid);
-		num_modes = drm_add_edid_modes(connector, imx_ldb_ch->edid);
+	if (!imx_ldb_ch->drm_edid && imx_ldb_ch->ddc) {
+		imx_ldb_ch->drm_edid = drm_edid_read_ddc(connector,
+							 imx_ldb_ch->ddc);
+		drm_edid_connector_update(connector, imx_ldb_ch->drm_edid);
 	}
 
+	if (imx_ldb_ch->drm_edid)
+		num_modes = drm_edid_connector_add_modes(connector);
+
 	if (imx_ldb_ch->mode_valid) {
 		struct drm_display_mode *mode;
 
@@ -553,7 +553,6 @@ static int imx_ldb_panel_ddc(struct device *dev,
 		struct imx_ldb_channel *channel, struct device_node *child)
 {
 	struct device_node *ddc_node;
-	const u8 *edidp;
 	int ret;
 
 	ddc_node = of_parse_phandle(child, "ddc-i2c-bus", 0);
@@ -567,6 +566,7 @@ static int imx_ldb_panel_ddc(struct device *dev,
 	}
 
 	if (!channel->ddc) {
+		const void *edidp;
 		int edid_len;
 
 		/* if no DDC available, fallback to hardcoded EDID */
@@ -574,8 +574,8 @@ static int imx_ldb_panel_ddc(struct device *dev,
 
 		edidp = of_get_property(child, "edid", &edid_len);
 		if (edidp) {
-			channel->edid = kmemdup(edidp, edid_len, GFP_KERNEL);
-			if (!channel->edid)
+			channel->drm_edid = drm_edid_alloc(edidp, edid_len);
+			if (!channel->drm_edid)
 				return -ENOMEM;
 		} else if (!channel->panel) {
 			/* fallback to display-timings node */
@@ -744,7 +744,7 @@ static void imx_ldb_remove(struct platform_device *pdev)
 	for (i = 0; i < 2; i++) {
 		struct imx_ldb_channel *channel = &imx_ldb->channel[i];
 
-		kfree(channel->edid);
+		drm_edid_free(channel->drm_edid);
 		i2c_put_adapter(channel->ddc);
 	}
 
-- 
2.39.2

