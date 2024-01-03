Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8B6822B07
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 11:11:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F9C310E2F0;
	Wed,  3 Jan 2024 10:11:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8B3510E2F0
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jan 2024 10:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704276710; x=1735812710;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wpcV5HmW8rhgR4Vll7M8sjJsEYPUTXFzQvUBJevHjFU=;
 b=LdqfC06YiMC8cu9VjPbnP2VV8ENeVcMDCbyx8mmjp1lPwd7RPR1MMNB3
 4JTUadDkz4vLxr5clMjqQ53nzC3R+ZmoHF8EsbmOf/Ch6orvzeRfo4Yn1
 ciOlxFyjS8FvrbmTO6MTY6XAv0WgxSXYW6JXsPHo7tqoRXSb64URJObe9
 sIyq4v0oR23tCN46SmOmOHocCuLkdTM6Cc2v6OmAYiH32F0rBMaipYxIC
 jTIbDDavRTN1h4XYWPs4MsDg+6f2kpaIZuxDQ47JJAf2euvtzPJYTRqaj
 FL224cW0EVMyjC/TbXA6rxaD92PjuJ8dD6aU/nuYKHsMIuS8pIyjRzKBT Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="4341889"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; 
   d="scan'208";a="4341889"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:11:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="953185020"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="953185020"
Received: from lwenners-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.35.39])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:11:46 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 26/39] drm/mediatek/dp: switch to ->edid_read callback
Date: Wed,  3 Jan 2024 12:08:40 +0200
Message-Id: <d7896bc53b2a97446777601f6acb83915db4783e.1704276309.git.jani.nikula@intel.com>
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
 drivers/gpu/drm/mediatek/mtk_dp.c | 31 ++++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 2136a596efa1..0ba72102636a 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -2042,12 +2042,12 @@ static enum drm_connector_status mtk_dp_bdg_detect(struct drm_bridge *bridge)
 	return ret;
 }
 
-static struct edid *mtk_dp_get_edid(struct drm_bridge *bridge,
-				    struct drm_connector *connector)
+static const struct drm_edid *mtk_dp_edid_read(struct drm_bridge *bridge,
+					       struct drm_connector *connector)
 {
 	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
 	bool enabled = mtk_dp->enabled;
-	struct edid *new_edid = NULL;
+	const struct drm_edid *drm_edid;
 	struct mtk_dp_audio_cfg *audio_caps = &mtk_dp->info.audio_cur_cfg;
 
 	if (!enabled) {
@@ -2055,7 +2055,7 @@ static struct edid *mtk_dp_get_edid(struct drm_bridge *bridge,
 		mtk_dp_aux_panel_poweron(mtk_dp, true);
 	}
 
-	new_edid = drm_get_edid(connector, &mtk_dp->aux.ddc);
+	drm_edid = drm_edid_read_ddc(connector, &mtk_dp->aux.ddc);
 
 	/*
 	 * Parse capability here to let atomic_get_input_bus_fmts and
@@ -2063,17 +2063,26 @@ static struct edid *mtk_dp_get_edid(struct drm_bridge *bridge,
 	 */
 	if (mtk_dp_parse_capabilities(mtk_dp)) {
 		drm_err(mtk_dp->drm_dev, "Can't parse capabilities\n");
-		kfree(new_edid);
-		new_edid = NULL;
+		drm_edid_free(drm_edid);
+		drm_edid = NULL;
 	}
 
-	if (new_edid) {
+	if (drm_edid) {
+		/*
+		 * FIXME: get rid of drm_edid_raw()
+		 */
+		const struct edid *edid = drm_edid_raw(drm_edid);
 		struct cea_sad *sads;
 
-		audio_caps->sad_count = drm_edid_to_sad(new_edid, &sads);
+		audio_caps->sad_count = drm_edid_to_sad(edid, &sads);
 		kfree(sads);
 
-		audio_caps->detect_monitor = drm_detect_monitor_audio(new_edid);
+		/*
+		 * FIXME: This should use connector->display_info.has_audio from
+		 * a path that has read the EDID and called
+		 * drm_edid_connector_update().
+		 */
+		audio_caps->detect_monitor = drm_detect_monitor_audio(edid);
 	}
 
 	if (!enabled) {
@@ -2081,7 +2090,7 @@ static struct edid *mtk_dp_get_edid(struct drm_bridge *bridge,
 		drm_atomic_bridge_chain_post_disable(bridge, connector->state->state);
 	}
 
-	return new_edid;
+	return drm_edid;
 }
 
 static ssize_t mtk_dp_aux_transfer(struct drm_dp_aux *mtk_aux,
@@ -2433,7 +2442,7 @@ static const struct drm_bridge_funcs mtk_dp_bridge_funcs = {
 	.atomic_enable = mtk_dp_bridge_atomic_enable,
 	.atomic_disable = mtk_dp_bridge_atomic_disable,
 	.mode_valid = mtk_dp_bridge_mode_valid,
-	.get_edid = mtk_dp_get_edid,
+	.edid_read = mtk_dp_edid_read,
 	.detect = mtk_dp_bdg_detect,
 };
 
-- 
2.39.2

