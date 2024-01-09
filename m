Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E60738283BE
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 11:13:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11C8710E3EF;
	Tue,  9 Jan 2024 10:13:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F41AA10E3EF
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 10:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704795203; x=1736331203;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=04Zjgail/x0d/lsD0XV6IPGc9rQCXox/4X63KdOaJ/E=;
 b=THloSsf/4uCdilI0peovlU8seUIw5hX6Wv4o7AX8N4quTj2pp09UtRWK
 MUxuH/oWupQ8d1S9mkwo5HBzYHEVOwAOYr1QM1Z+Ra8fp9IyRul8F2qBv
 QdwkUxNIw0PcIg7owfWxU8pb6ufVgqWY18c4X0dJP6HIDxZ8OyqLn5NXd
 WrNhTatxC4SqoHgzxF24tkEDlAMPVhZI/KdEMGv517AouhBkpKsv9WFQc
 mx9EhNmX5YQhMFp65iE86aD1nT/MzRqYsyPAEcordL8Phi16+6OZqF9uP
 hxmwfb/IVhZf9z4bnSHNuMb/PKKyez2AVAXUlyuEdlGARxZ8GV3pqKMX3 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="5235578"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; 
   d="scan'208";a="5235578"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 02:13:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; d="scan'208";a="30130799"
Received: from aakinrin-mobl2.amr.corp.intel.com (HELO localhost)
 ([10.252.36.188])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 02:13:20 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2] drm: bridge: dw_hdmi: switch to ->edid_read callback
Date: Tue,  9 Jan 2024 12:13:13 +0200
Message-Id: <20240109101313.2427048-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <a8f71940221fb085b8767f8123f496c9b36b22cc.1704276309.git.jani.nikula@intel.com>
References: <a8f71940221fb085b8767f8123f496c9b36b22cc.1704276309.git.jani.nikula@intel.com>
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

Prefer using the struct drm_edid based callback and functions.

v2: Fix -Wuninitialized (kernel test robot)

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 43 ++++++++++++++---------
 1 file changed, 26 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 52d91a0df85e..8eea3f59f585 100644
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

