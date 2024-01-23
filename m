Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1988399B0
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 20:39:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA94010E871;
	Tue, 23 Jan 2024 19:39:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B84D10E871
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 19:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706038754; x=1737574754;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Wh8mbMuiGBOiOxhEvvELig6TdHOJwkbahAqDCa+tIyg=;
 b=GuQTLfzEsdAKRy8hpb0ayhCXy1QuT63cxoSzp76x8K9FNkrvxQ0gu+0Z
 GUmb67iDObk0xSkLw/cEeQBFkMThD26OOil3m9oZlZWVVJsleyXZSWxcB
 sSLMt0q2vPFq00XKSPU8ub2b0Vc40H7z8A/JuptxZD4oelKNR91I4SoFB
 ejJfp9JjYFxGb6xKnLv6MBorp8Cl1EYxF2go2X8plDeBXWaohHi5Qs4Ir
 eRXyRh+yJrAedKHGo99PqMCnTsX2z92BcrfwJg9WXL0Pq7VKICw95N5Mi
 4Dz3yTlj8B9R7zoxl/ldenCb1LZFm1IrQ5sCwtP4pEgafLIZDP5W4sTUN A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="14980565"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="14980565"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 11:39:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="1117379708"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="1117379708"
Received: from pzsolt-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.40.183])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 11:39:10 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v3 14/39] drm/bridge: anx7625: switch to ->edid_read callback
Date: Tue, 23 Jan 2024 21:37:20 +0200
Message-Id: <62b905f4ec9fe3efa3785d34006b7e45e4c6c88b.1706038510.git.jani.nikula@intel.com>
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

Prefer using the struct drm_edid based callback.

v2: Fix build (goto out;)

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 30 ++++++++---------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 29d91493b101..9d96d28d6fe8 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1784,24 +1784,14 @@ static ssize_t anx7625_aux_transfer(struct drm_dp_aux *aux,
 	return ret;
 }
 
-static struct edid *anx7625_get_edid(struct anx7625_data *ctx)
+static const struct drm_edid *anx7625_edid_read(struct anx7625_data *ctx)
 {
 	struct device *dev = ctx->dev;
 	struct s_edid_data *p_edid = &ctx->slimport_edid_p;
 	int edid_num;
-	u8 *edid;
 
-	edid = kmalloc(FOUR_BLOCK_SIZE, GFP_KERNEL);
-	if (!edid) {
-		DRM_DEV_ERROR(dev, "Fail to allocate buffer\n");
-		return NULL;
-	}
-
-	if (ctx->slimport_edid_p.edid_block_num > 0) {
-		memcpy(edid, ctx->slimport_edid_p.edid_raw_data,
-		       FOUR_BLOCK_SIZE);
-		return (struct edid *)edid;
-	}
+	if (ctx->slimport_edid_p.edid_block_num > 0)
+		goto out;
 
 	pm_runtime_get_sync(dev);
 	_anx7625_hpd_polling(ctx, 5000 * 100);
@@ -1810,14 +1800,14 @@ static struct edid *anx7625_get_edid(struct anx7625_data *ctx)
 
 	if (edid_num < 1) {
 		DRM_DEV_ERROR(dev, "Fail to read EDID: %d\n", edid_num);
-		kfree(edid);
 		return NULL;
 	}
 
 	p_edid->edid_block_num = edid_num;
 
-	memcpy(edid, ctx->slimport_edid_p.edid_raw_data, FOUR_BLOCK_SIZE);
-	return (struct edid *)edid;
+out:
+	return drm_edid_alloc(ctx->slimport_edid_p.edid_raw_data,
+			      FOUR_BLOCK_SIZE);
 }
 
 static enum drm_connector_status anx7625_sink_detect(struct anx7625_data *ctx)
@@ -2492,15 +2482,15 @@ anx7625_bridge_detect(struct drm_bridge *bridge)
 	return anx7625_sink_detect(ctx);
 }
 
-static struct edid *anx7625_bridge_get_edid(struct drm_bridge *bridge,
-					    struct drm_connector *connector)
+static const struct drm_edid *anx7625_bridge_edid_read(struct drm_bridge *bridge,
+						       struct drm_connector *connector)
 {
 	struct anx7625_data *ctx = bridge_to_anx7625(bridge);
 	struct device *dev = ctx->dev;
 
 	DRM_DEV_DEBUG_DRIVER(dev, "drm bridge get edid\n");
 
-	return anx7625_get_edid(ctx);
+	return anx7625_edid_read(ctx);
 }
 
 static const struct drm_bridge_funcs anx7625_bridge_funcs = {
@@ -2515,7 +2505,7 @@ static const struct drm_bridge_funcs anx7625_bridge_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset = drm_atomic_helper_bridge_reset,
 	.detect = anx7625_bridge_detect,
-	.get_edid = anx7625_bridge_get_edid,
+	.edid_read = anx7625_bridge_edid_read,
 };
 
 static int anx7625_register_i2c_dummy_clients(struct anx7625_data *ctx,
-- 
2.39.2

