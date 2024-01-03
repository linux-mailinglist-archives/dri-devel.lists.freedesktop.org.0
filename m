Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B1B822B1A
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 11:13:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 744B610E307;
	Wed,  3 Jan 2024 10:12:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E5E010E307
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jan 2024 10:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704276778; x=1735812778;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9m8lKGADEH8vsf/N691EpA4S8PDnCN6vgFXpPamD+oE=;
 b=T30QzOPYYwQj5tak1eGn+p5DR3uN3CO6ddp5u9gM2Vfk1d1fwDqrYsLG
 MtKFnuPuEtN7jEg3aMt1B6evYSktE5MtUGFPtCefTie+xh8uN8q2SNayd
 /UO8xHy6S4oOaBj2NZd5U9/Y6RooSrlF5Moc4cMT4fVaaYuyQv6HWDEpZ
 f0ryEruwFPnzeu1te/nO4+IJyBQ0GbutHGMJTeCx/zRI+Rr7rVm8r2hU4
 HvGKMc/Doq45XBkqxT6otV9xGiTDfEVaIAmn6UY1QrjbaT1Kwb5yfq4AJ
 MdG/SqvFXRqAsPQUweYMRh52BVGlwbI4qEdBQTh0T1/5nYZlKTPtPYFnW A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="483174000"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="483174000"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:12:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="729746352"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="729746352"
Received: from lwenners-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.35.39])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:12:53 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 37/39] drm/bridge: tc358767: switch to ->edid_read callback
Date: Wed,  3 Jan 2024 12:08:51 +0200
Message-Id: <1b8ec9040552117e1f094ddadee32a5ff5d82c3d.1704276309.git.jani.nikula@intel.com>
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
 drivers/gpu/drm/bridge/tc358767.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index da2aec5110c2..975cec698452 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1646,19 +1646,19 @@ static void tc_bridge_mode_set(struct drm_bridge *bridge,
 	drm_mode_copy(&tc->mode, mode);
 }
 
-static struct edid *tc_get_edid(struct drm_bridge *bridge,
-				struct drm_connector *connector)
+static const struct drm_edid *tc_edid_read(struct drm_bridge *bridge,
+					   struct drm_connector *connector)
 {
 	struct tc_data *tc = bridge_to_tc(bridge);
 
-	return drm_get_edid(connector, &tc->aux.ddc);
+	return drm_edid_read_ddc(connector, &tc->aux.ddc);
 }
 
 static int tc_connector_get_modes(struct drm_connector *connector)
 {
 	struct tc_data *tc = connector_to_tc(connector);
 	int num_modes;
-	struct edid *edid;
+	const struct drm_edid *drm_edid;
 	int ret;
 
 	ret = tc_get_display_props(tc);
@@ -1673,10 +1673,10 @@ static int tc_connector_get_modes(struct drm_connector *connector)
 			return num_modes;
 	}
 
-	edid = tc_get_edid(&tc->bridge, connector);
-	drm_connector_update_edid_property(connector, edid);
-	num_modes = drm_add_edid_modes(connector, edid);
-	kfree(edid);
+	drm_edid = tc_edid_read(&tc->bridge, connector);
+	drm_edid_connector_update(connector, drm_edid);
+	num_modes = drm_edid_connector_add_modes(connector);
+	drm_edid_free(drm_edid);
 
 	return num_modes;
 }
@@ -1845,7 +1845,7 @@ static const struct drm_bridge_funcs tc_edp_bridge_funcs = {
 	.atomic_enable = tc_edp_bridge_atomic_enable,
 	.atomic_disable = tc_edp_bridge_atomic_disable,
 	.detect = tc_bridge_detect,
-	.get_edid = tc_get_edid,
+	.edid_read = tc_edid_read,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset = drm_atomic_helper_bridge_reset,
-- 
2.39.2

