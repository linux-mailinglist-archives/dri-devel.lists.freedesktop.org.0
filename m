Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A0E822AF5
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 11:10:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E92510E288;
	Wed,  3 Jan 2024 10:10:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1166910E288
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jan 2024 10:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704276602; x=1735812602;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CloSnaBDhKzl/Du5qNmjWpYuwwMD0jfpD3mDO25m9YA=;
 b=QS3lVzgHUwwA+gTUD06AncayZYi+shHIZxB72tvGIBYFHF71DZ5vPjLH
 3WMAGVS3NmsGuBP5ISDFFOM3KtLRCaztgNq5gZLSgAkjm0bA7WOG4fafY
 6SsYEI/5liXMEu6afo3nRWwvswWkbFCBhWxdUYBCjbsH0csJ5Nvr1iYYy
 31baPfeOp+zrkeBMAe4z/9q24ecZCisclIAdAjWuhMnCejrtiLiKyH3aX
 DcAMRV08NMn4fAEMElNQAggSrhuSdK1AXQfsdaGN3xfifDeJPDjSabaRK
 AQnUpjOPuYc87GUh64AXTEf+K/fAZY52ZCrCuxzFvj6S3o3GKfIPhzg4R Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="10384096"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="10384096"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:10:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="870531608"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="870531608"
Received: from lwenners-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.35.39])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:09:58 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 08/39] drm: bridge: simple-bridge: use
 drm_bridge_edid_read()
Date: Wed,  3 Jan 2024 12:08:22 +0200
Message-Id: <ae348a6efb55418bf98b7e6d290284765d59dac1.1704276309.git.jani.nikula@intel.com>
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

Prefer using the struct drm_edid based functions.

Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/bridge/simple-bridge.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
index cbe8e778d7c7..e0cf7721bb8c 100644
--- a/drivers/gpu/drm/bridge/simple-bridge.c
+++ b/drivers/gpu/drm/bridge/simple-bridge.c
@@ -51,18 +51,18 @@ drm_connector_to_simple_bridge(struct drm_connector *connector)
 static int simple_bridge_get_modes(struct drm_connector *connector)
 {
 	struct simple_bridge *sbridge = drm_connector_to_simple_bridge(connector);
-	struct edid *edid;
+	const struct drm_edid *drm_edid;
 	int ret;
 
 	if (sbridge->next_bridge->ops & DRM_BRIDGE_OP_EDID) {
-		edid = drm_bridge_get_edid(sbridge->next_bridge, connector);
-		if (!edid)
+		drm_edid = drm_bridge_edid_read(sbridge->next_bridge, connector);
+		if (!drm_edid)
 			DRM_INFO("EDID read failed. Fallback to standard modes\n");
 	} else {
-		edid = NULL;
+		drm_edid = NULL;
 	}
 
-	if (!edid) {
+	if (!drm_edid) {
 		/*
 		 * In case we cannot retrieve the EDIDs (missing or broken DDC
 		 * bus from the next bridge), fallback on the XGA standards and
@@ -73,9 +73,9 @@ static int simple_bridge_get_modes(struct drm_connector *connector)
 		return ret;
 	}
 
-	drm_connector_update_edid_property(connector, edid);
-	ret = drm_add_edid_modes(connector, edid);
-	kfree(edid);
+	drm_edid_connector_update(connector, drm_edid);
+	ret = drm_edid_connector_add_modes(connector);
+	drm_edid_free(drm_edid);
 
 	return ret;
 }
-- 
2.39.2

