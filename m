Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A73728399C5
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 20:41:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED7BD10E8AE;
	Tue, 23 Jan 2024 19:41:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D034510E8A9
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 19:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706038880; x=1737574880;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K/T9ihIcxPG4kC62FbgdEUkT6ggzXTW1OA5sQ24O6SE=;
 b=As+U2OXN8LuLN+zDUCPtspMYYM1Ud10YIkvbtIp/7wJANriR4peAA6dV
 oBdZP7d/suAXhdO7P0Vdns3KgEnHTSmpra1Aa6b4ugulJOX/zwkqBbGdz
 AzWvLREXVrKXg/ka/Ymly5zxgdyrD1dL4pp4C5KNnwpg2tTSYq7QwKnhq
 XSzGckDCLsuncTL6aAVOcwLLPHXB49ncfJloKzJ+xvPs50Mt4QS2Dbg+f
 dL4/Yl3ZfHtGm0bZTVZzTiEBlyhziSZLlfk7MS2K4/WzWsCqym/J1vs02
 4cMr+gVBaB/IJuST+ccp7debzwPbj2A7n7dP3ImJJ/lKrlw/NVbNeNNAb w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="9022541"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="9022541"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 11:41:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="929435887"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="929435887"
Received: from pzsolt-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.40.183])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 11:41:16 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v3 34/39] drm: bridge: dw_hdmi: switch to ->edid_read callback
Date: Tue, 23 Jan 2024 21:37:40 +0200
Message-Id: <400bfdeca4fd25b7624286e5969c4b0b1331c2b4.1706038510.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1706038510.git.jani.nikula@intel.com>
References: <cover.1706038510.git.jani.nikula@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prefer using the struct drm_edid based callback and functions.

v2: Fix -Wuninitialized (kernel test robot)

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 43 ++++++++++++++---------
 1 file changed, 26 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index ca74a20015b3..4a2e3f9c1dfd 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2454,27 +2454,35 @@ static enum drm_connector_status dw_hdmi_detect(struct dw_hdmi *hdmi)
 	return result;
 }
 
-static struct edid *dw_hdmi_get_edid(struct dw_hdmi *hdmi,
-				     struct drm_connector *connector)
+static const struct drm_edid *dw_hdmi_edid_read(struct dw_hdmi *hdmi,
+						struct drm_connector *connector)
 {
-	struct edid *edid;
+	const struct drm_edid *drm_edid;
+	const struct edid *edid;
 
 	if (!hdmi->ddc)
 		return NULL;
 
-	edid = drm_get_edid(connector, hdmi->ddc);
-	if (!edid) {
+	drm_edid = drm_edid_read_ddc(connector, hdmi->ddc);
+	if (!drm_edid) {
 		dev_dbg(hdmi->dev, "failed to get edid\n");
 		return NULL;
 	}
 
+	/*
+	 * FIXME: This should use connector->display_info.is_hdmi and
+	 * connector->display_info.has_audio from a path that has read the EDID
+	 * and called drm_edid_connector_update().
+	 */
+	edid = drm_edid_raw(drm_edid);
+
 	dev_dbg(hdmi->dev, "got edid: width[%d] x height[%d]\n",
 		edid->width_cm, edid->height_cm);
 
 	hdmi->sink_is_hdmi = drm_detect_hdmi_monitor(edid);
 	hdmi->sink_has_audio = drm_detect_monitor_audio(edid);
 
-	return edid;
+	return drm_edid;
 }
 
 /* -----------------------------------------------------------------------------
@@ -2493,17 +2501,18 @@ static int dw_hdmi_connector_get_modes(struct drm_connector *connector)
 {
 	struct dw_hdmi *hdmi = container_of(connector, struct dw_hdmi,
 					     connector);
-	struct edid *edid;
+	const struct drm_edid *drm_edid;
 	int ret;
 
-	edid = dw_hdmi_get_edid(hdmi, connector);
-	if (!edid)
+	drm_edid = dw_hdmi_edid_read(hdmi, connector);
+	if (!drm_edid)
 		return 0;
 
-	drm_connector_update_edid_property(connector, edid);
-	cec_notifier_set_phys_addr_from_edid(hdmi->cec_notifier, edid);
-	ret = drm_add_edid_modes(connector, edid);
-	kfree(edid);
+	drm_edid_connector_update(connector, drm_edid);
+	cec_notifier_set_phys_addr(hdmi->cec_notifier,
+				   connector->display_info.source_physical_address);
+	ret = drm_edid_connector_add_modes(connector);
+	drm_edid_free(drm_edid);
 
 	return ret;
 }
@@ -2980,12 +2989,12 @@ static enum drm_connector_status dw_hdmi_bridge_detect(struct drm_bridge *bridge
 	return dw_hdmi_detect(hdmi);
 }
 
-static struct edid *dw_hdmi_bridge_get_edid(struct drm_bridge *bridge,
-					    struct drm_connector *connector)
+static const struct drm_edid *dw_hdmi_bridge_edid_read(struct drm_bridge *bridge,
+						       struct drm_connector *connector)
 {
 	struct dw_hdmi *hdmi = bridge->driver_private;
 
-	return dw_hdmi_get_edid(hdmi, connector);
+	return dw_hdmi_edid_read(hdmi, connector);
 }
 
 static const struct drm_bridge_funcs dw_hdmi_bridge_funcs = {
@@ -3002,7 +3011,7 @@ static const struct drm_bridge_funcs dw_hdmi_bridge_funcs = {
 	.mode_set = dw_hdmi_bridge_mode_set,
 	.mode_valid = dw_hdmi_bridge_mode_valid,
 	.detect = dw_hdmi_bridge_detect,
-	.get_edid = dw_hdmi_bridge_get_edid,
+	.edid_read = dw_hdmi_bridge_edid_read,
 };
 
 /* -----------------------------------------------------------------------------
-- 
2.39.2

