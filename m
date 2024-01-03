Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2AEA822AFF
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 11:11:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED57310E098;
	Wed,  3 Jan 2024 10:11:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5049A10E098
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jan 2024 10:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704276663; x=1735812663;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ozbhNyE+qi0IBfiJH1Qu1GdQkHtULUmyjPNjMv97yBI=;
 b=ERGs6gxkr1BTOsSZkuqsMCzLwcNCZQ8Ph/4tR2j77BtuGjg0YYXArhnM
 Ncuy+ClPm/oLq0SbtlXMxqExZU/0OOXcQm+U3FIa6CenyglDH5bf02RQw
 bdYaZJIDJY4AonoBdlJLxSEWim3A6efRFkUPt91RPA6WsrW+oJN/+0xaE
 /91GRUOpjn/YIFCBBZ+5peNyvHtvGvtXxMc81OxogyF5Zvbahm3GjeNHt
 N2NyGt1C3JSzxu8rnA3tHuXoSZXnD+MAMDxZJroFg4RP2MjQnKyL0G5/B
 /+JBVYWSi6klDnClC1AvpAYAowPxOnOjdSYTKpHolNKEaTUoWprqluvjS w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="3760036"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; 
   d="scan'208";a="3760036"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:11:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="22053245"
Received: from lwenners-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.35.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:10:59 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 18/39] drm/bridge: it6505: switch to ->edid_read callback
Date: Wed,  3 Jan 2024 12:08:32 +0200
Message-Id: <942484544b26d7c0d13429c1e91663c0d9052683.1704276309.git.jani.nikula@intel.com>
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
 drivers/gpu/drm/bridge/ite-it6505.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 2f300f5ca051..914b58ec130d 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -458,7 +458,7 @@ struct it6505 {
 	/* it6505 driver hold option */
 	bool enable_drv_hold;
 
-	struct edid *cached_edid;
+	const struct drm_edid *cached_edid;
 };
 
 struct it6505_step_train_para {
@@ -2261,7 +2261,7 @@ static void it6505_plugged_status_to_codec(struct it6505 *it6505)
 
 static void it6505_remove_edid(struct it6505 *it6505)
 {
-	kfree(it6505->cached_edid);
+	drm_edid_free(it6505->cached_edid);
 	it6505->cached_edid = NULL;
 }
 
@@ -3032,15 +3032,16 @@ it6505_bridge_detect(struct drm_bridge *bridge)
 	return it6505_detect(it6505);
 }
 
-static struct edid *it6505_bridge_get_edid(struct drm_bridge *bridge,
-					   struct drm_connector *connector)
+static const struct drm_edid *it6505_bridge_edid_read(struct drm_bridge *bridge,
+						      struct drm_connector *connector)
 {
 	struct it6505 *it6505 = bridge_to_it6505(bridge);
 	struct device *dev = it6505->dev;
 
 	if (!it6505->cached_edid) {
-		it6505->cached_edid = drm_do_get_edid(connector, it6505_get_edid_block,
-						      it6505);
+		it6505->cached_edid = drm_edid_read_custom(connector,
+							   it6505_get_edid_block,
+							   it6505);
 
 		if (!it6505->cached_edid) {
 			DRM_DEV_DEBUG_DRIVER(dev, "failed to get edid!");
@@ -3048,7 +3049,7 @@ static struct edid *it6505_bridge_get_edid(struct drm_bridge *bridge,
 		}
 	}
 
-	return drm_edid_duplicate(it6505->cached_edid);
+	return drm_edid_dup(it6505->cached_edid);
 }
 
 static const struct drm_bridge_funcs it6505_bridge_funcs = {
@@ -3063,7 +3064,7 @@ static const struct drm_bridge_funcs it6505_bridge_funcs = {
 	.atomic_pre_enable = it6505_bridge_atomic_pre_enable,
 	.atomic_post_disable = it6505_bridge_atomic_post_disable,
 	.detect = it6505_bridge_detect,
-	.get_edid = it6505_bridge_get_edid,
+	.edid_read = it6505_bridge_edid_read,
 };
 
 static __maybe_unused int it6505_bridge_resume(struct device *dev)
-- 
2.39.2

