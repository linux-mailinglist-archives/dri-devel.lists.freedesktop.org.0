Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BEE822B06
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 11:11:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5688E10E2C5;
	Wed,  3 Jan 2024 10:11:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7410E10E2C5
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jan 2024 10:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704276704; x=1735812704;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pWM99FTRb5JFPMT+3lqiE2cNbgzWcLkZVG6zFUY5yHc=;
 b=HuUJVq0S8I5nxH2o/g52wgcT3Z1DaXN5q8LJpurpkAR63pBc1GYI5a/1
 k6nOX1Cotd7aiK74Eb0wD1/vhIkjK2n7dZ34hxmvGFy5AaULl4wh7trkV
 iljEXX33T55oOVUzOsix7rVhrsuvwBBcslflSbRmnzGyDQmx2NhQ1ozHF
 i/ISSg9jWKPIY/V3VfkpcPfwkgHk+Xxid69RnanB5LgCAje+0m8D6foW0
 FXTGLvmCIAhUyh5Ery+tfpEjtN2ZLT1yLVymmo4qPSFAltly9qwlDku2S
 dyeDNwF01QyyJbG5Qcg2bNlp//ujhBHv68alh7FRuknq8iOO7r1rJAcw/ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="396721237"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="396721237"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:11:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="756172556"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="756172556"
Received: from lwenners-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.35.39])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:11:40 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 25/39] drm/bridge: sii902x: switch to ->edid_read callback
Date: Wed,  3 Jan 2024 12:08:39 +0200
Message-Id: <7dabbcd98ed2bf22aeed08b0826dbdc258e78972.1704276309.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1704276309.git.jani.nikula@intel.com>
References: <cover.1704276309.git.jani.nikula@intel.com>
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
index 2f876b805b83..12346bacecaf 100644
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

