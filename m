Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C4C8399B6
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 20:40:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 821D010E88B;
	Tue, 23 Jan 2024 19:39:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 404A910E88B
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 19:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706038785; x=1737574785;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nPP8bLU0uozaM4546A4NB9xBZPyTtBzeT84fqvQNEtY=;
 b=GDrmeEV8gG/DbK+/jjIhNMzvh5YQDbMBgZvRa4cfJ+4NXR50vHadwRPQ
 yYtuIDuIrRey97AnQUDP/lSTeH1J78B/V7ijyFvb6cW3ibJS7Pwzn9YhZ
 XQdWtZVd6332Ny+J8xqUFqPNSkfjRhPfKeyjV1p8lurOs0MuTImFmy1fV
 0ghhGMMSUMlpGo4PyaGNwqD8mws9QpMQ64tnFckCKQ5pLW66DECybX1rB
 ZzzDxpYIrcc0JUHXvf1TUdASO5Dg9QTw9v7+OvhD2cMdTGzJqbVfYi1qK
 vmHIytgA7CCsen6VduFXnjdPXa8TnOhE0XtFkvzHvtJYYwobKnWNSxFvB w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="15150296"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="15150296"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 11:39:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="959259965"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="959259965"
Received: from pzsolt-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.40.183])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 11:39:40 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v3 18/39] drm/bridge: it6505: switch to ->edid_read callback
Date: Tue, 23 Jan 2024 21:37:24 +0200
Message-Id: <5d2579802e277cc562bde6c4e26a5b63ff0e02ae.1706038510.git.jani.nikula@intel.com>
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
 drivers/gpu/drm/bridge/ite-it6505.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index b589136ca6da..27334173e911 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -458,7 +458,7 @@ struct it6505 {
 	/* it6505 driver hold option */
 	bool enable_drv_hold;
 
-	struct edid *cached_edid;
+	const struct drm_edid *cached_edid;
 };
 
 struct it6505_step_train_para {
@@ -2263,7 +2263,7 @@ static void it6505_plugged_status_to_codec(struct it6505 *it6505)
 
 static void it6505_remove_edid(struct it6505 *it6505)
 {
-	kfree(it6505->cached_edid);
+	drm_edid_free(it6505->cached_edid);
 	it6505->cached_edid = NULL;
 }
 
@@ -3034,15 +3034,16 @@ it6505_bridge_detect(struct drm_bridge *bridge)
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
@@ -3050,7 +3051,7 @@ static struct edid *it6505_bridge_get_edid(struct drm_bridge *bridge,
 		}
 	}
 
-	return drm_edid_duplicate(it6505->cached_edid);
+	return drm_edid_dup(it6505->cached_edid);
 }
 
 static const struct drm_bridge_funcs it6505_bridge_funcs = {
@@ -3065,7 +3066,7 @@ static const struct drm_bridge_funcs it6505_bridge_funcs = {
 	.atomic_pre_enable = it6505_bridge_atomic_pre_enable,
 	.atomic_post_disable = it6505_bridge_atomic_post_disable,
 	.detect = it6505_bridge_detect,
-	.get_edid = it6505_bridge_get_edid,
+	.edid_read = it6505_bridge_edid_read,
 };
 
 static __maybe_unused int it6505_bridge_resume(struct device *dev)
-- 
2.39.2

