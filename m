Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8EA822AFC
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 11:10:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DF5510E2AC;
	Wed,  3 Jan 2024 10:10:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A324510E2AC
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jan 2024 10:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704276644; x=1735812644;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DMjqPdGs/7IHipYTP1BzVivkdxYsdN4cjKVOtHqrQEQ=;
 b=Ez0JAqjtZaX7sveSnWAwR2K+BrdQDSaJT+IDAZVn8fUHoIBPrO9Z3c2X
 jnmGkSOhEJFk67Fs+XYYNvIU+QhPaP93B2SGzme52Q8X6gFnw1O3DwIqm
 YCtduiNLUg67FOuml8cJ+zosT15BBDv3ZE1LtCD5NH5Sk6EiZ0AXw9v7X
 uJXw+k+HYifPXQyen/ZgExUmkVZLMGYKiud2DFNbFD6TOI76UlZM6pd9d
 6Wuf+Q3SMuJei5fV5ni82sMpRnq8Jg822vzOsT5fRAxDH05pAUUKd0Row
 qNHqtZVH6h6UBExlPIvIRvD4K7HU+uU/UKoGLoI7g+Dv8KgJHo5Yc5VT2 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="396721106"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="396721106"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:10:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="903398494"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="903398494"
Received: from lwenners-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.35.39])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:10:39 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 15/39] drm/bridge: cdns-mhdp8546: switch to ->edid_read
 callback
Date: Wed,  3 Jan 2024 12:08:29 +0200
Message-Id: <0c355b1457e6e86fdc014c8159fbbcdb54cc2e00.1704276309.git.jani.nikula@intel.com>
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
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 26 +++++++++----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index 7d470527455b..e44cb89c33f0 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -1505,33 +1505,33 @@ static void cdns_mhdp_link_down(struct cdns_mhdp_device *mhdp)
 	mhdp->link_up = false;
 }
 
-static struct edid *cdns_mhdp_get_edid(struct cdns_mhdp_device *mhdp,
-				       struct drm_connector *connector)
+static const struct drm_edid *cdns_mhdp_edid_read(struct cdns_mhdp_device *mhdp,
+						  struct drm_connector *connector)
 {
 	if (!mhdp->plugged)
 		return NULL;
 
-	return drm_do_get_edid(connector, cdns_mhdp_get_edid_block, mhdp);
+	return drm_edid_read_custom(connector, cdns_mhdp_get_edid_block, mhdp);
 }
 
 static int cdns_mhdp_get_modes(struct drm_connector *connector)
 {
 	struct cdns_mhdp_device *mhdp = connector_to_mhdp(connector);
-	struct edid *edid;
+	const struct drm_edid *drm_edid;
 	int num_modes;
 
 	if (!mhdp->plugged)
 		return 0;
 
-	edid = cdns_mhdp_get_edid(mhdp, connector);
-	if (!edid) {
+	drm_edid = cdns_mhdp_edid_read(mhdp, connector);
+	if (!drm_edid) {
 		dev_err(mhdp->dev, "Failed to read EDID\n");
 		return 0;
 	}
 
-	drm_connector_update_edid_property(connector, edid);
-	num_modes = drm_add_edid_modes(connector, edid);
-	kfree(edid);
+	drm_edid_connector_update(connector, drm_edid);
+	num_modes = drm_edid_connector_add_modes(connector);
+	drm_edid_free(drm_edid);
 
 	/*
 	 * HACK: Warn about unsupported display formats until we deal
@@ -2220,12 +2220,12 @@ static enum drm_connector_status cdns_mhdp_bridge_detect(struct drm_bridge *brid
 	return cdns_mhdp_detect(mhdp);
 }
 
-static struct edid *cdns_mhdp_bridge_get_edid(struct drm_bridge *bridge,
-					      struct drm_connector *connector)
+static const struct drm_edid *cdns_mhdp_bridge_edid_read(struct drm_bridge *bridge,
+							 struct drm_connector *connector)
 {
 	struct cdns_mhdp_device *mhdp = bridge_to_mhdp(bridge);
 
-	return cdns_mhdp_get_edid(mhdp, connector);
+	return cdns_mhdp_edid_read(mhdp, connector);
 }
 
 static const struct drm_bridge_funcs cdns_mhdp_bridge_funcs = {
@@ -2239,7 +2239,7 @@ static const struct drm_bridge_funcs cdns_mhdp_bridge_funcs = {
 	.atomic_reset = cdns_mhdp_bridge_atomic_reset,
 	.atomic_get_input_bus_fmts = cdns_mhdp_get_input_bus_fmts,
 	.detect = cdns_mhdp_bridge_detect,
-	.get_edid = cdns_mhdp_bridge_get_edid,
+	.edid_read = cdns_mhdp_bridge_edid_read,
 	.hpd_enable = cdns_mhdp_bridge_hpd_enable,
 	.hpd_disable = cdns_mhdp_bridge_hpd_disable,
 };
-- 
2.39.2

