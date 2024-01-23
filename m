Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EA08399C1
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 20:41:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AAD010E88D;
	Tue, 23 Jan 2024 19:40:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEC0D10E88D
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 19:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706038827; x=1737574827;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WkVzyTymb/d9Ln3WC4Ho8l2cKUfgL5zNoKAomZjqQKs=;
 b=cqppm1MbDhgpm5tR2XI6lekABbCUD3wG/u24IjIxwqt7U4LkdUY2ttpv
 zBbfRqCyY3ZsY66FfqR9Xd7pZce4A1stIfdsG/8vVSBObtphSp8+tUDJ4
 u4621CtZUQewnqhbnQf4LFnFeoW7oXQOFUSN8ZvEQZ0shymCMvlL0NKa9
 Z2YJjz5GGQI8LipDyfLVQXQJONlWxRTnrt4apA0TSYYKzAxtX6flHI3RR
 52WZTy3OhN2pPoHILd7RSryCr1e1EUPCaG8YmGNkB4IENxl4yeGDSU4Pr
 jFF2YNZXA7MJvFszOkJscdqCaWWqCap7CLsmh6uGz8MLmfHHBiJbxklHL Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="8997255"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="8997255"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 11:40:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="34520429"
Received: from pzsolt-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.40.183])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 11:40:24 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v3 25/39] drm/bridge: sii902x: switch to ->edid_read callback
Date: Tue, 23 Jan 2024 21:37:31 +0200
Message-Id: <684ccb5445bfc448dfaff00ad61a16a76f6aa723.1706038510.git.jani.nikula@intel.com>
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

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/bridge/sii902x.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index d59e668498c3..8f84e98249c7 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -278,31 +278,31 @@ static const struct drm_connector_funcs sii902x_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
-static struct edid *sii902x_get_edid(struct sii902x *sii902x,
-				     struct drm_connector *connector)
+static const struct drm_edid *sii902x_edid_read(struct sii902x *sii902x,
+						struct drm_connector *connector)
 {
-	struct edid *edid;
+	const struct drm_edid *drm_edid;
 
 	mutex_lock(&sii902x->mutex);
 
-	edid = drm_get_edid(connector, sii902x->i2cmux->adapter[0]);
+	drm_edid = drm_edid_read_ddc(connector, sii902x->i2cmux->adapter[0]);
 
 	mutex_unlock(&sii902x->mutex);
 
-	return edid;
+	return drm_edid;
 }
 
 static int sii902x_get_modes(struct drm_connector *connector)
 {
 	struct sii902x *sii902x = connector_to_sii902x(connector);
-	struct edid *edid;
+	const struct drm_edid *drm_edid;
 	int num = 0;
 
-	edid = sii902x_get_edid(sii902x, connector);
-	drm_connector_update_edid_property(connector, edid);
-	if (edid) {
-		num = drm_add_edid_modes(connector, edid);
-		kfree(edid);
+	drm_edid = sii902x_edid_read(sii902x, connector);
+	drm_edid_connector_update(connector, drm_edid);
+	if (drm_edid) {
+		num = drm_edid_connector_add_modes(connector);
+		drm_edid_free(drm_edid);
 	}
 
 	sii902x->sink_is_hdmi = connector->display_info.is_hdmi;
@@ -461,12 +461,12 @@ static enum drm_connector_status sii902x_bridge_detect(struct drm_bridge *bridge
 	return sii902x_detect(sii902x);
 }
 
-static struct edid *sii902x_bridge_get_edid(struct drm_bridge *bridge,
-					    struct drm_connector *connector)
+static const struct drm_edid *sii902x_bridge_edid_read(struct drm_bridge *bridge,
+						       struct drm_connector *connector)
 {
 	struct sii902x *sii902x = bridge_to_sii902x(bridge);
 
-	return sii902x_get_edid(sii902x, connector);
+	return sii902x_edid_read(sii902x, connector);
 }
 
 static u32 *sii902x_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
@@ -510,7 +510,7 @@ static const struct drm_bridge_funcs sii902x_bridge_funcs = {
 	.disable = sii902x_bridge_disable,
 	.enable = sii902x_bridge_enable,
 	.detect = sii902x_bridge_detect,
-	.get_edid = sii902x_bridge_get_edid,
+	.edid_read = sii902x_bridge_edid_read,
 	.atomic_reset = drm_atomic_helper_bridge_reset,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
-- 
2.39.2

