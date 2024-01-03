Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0E6822B00
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 11:11:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D0EC10E100;
	Wed,  3 Jan 2024 10:11:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF90D10E100
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jan 2024 10:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704276669; x=1735812669;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Xbd3TQlHS4ng7CmlJLp1E2H+gpvlqE1/YlrFEvLs/O0=;
 b=SNF8bCTKqjNs+U/vZX3EFYeTmGIcSYPwwIkf6TMSWPXSp41DCMOoqQcG
 0fuktxuCydzPHNeMYGymiuH/3CdBl7uIknGA5vg9vYHtKCCuC6hdn8M8P
 VcPGLQNUU9sA039kYADlMJ4ELb9RdWNvrlYsd3LbK5v9w/Kl+syxYeFu3
 mAvveOBtbU6BPcdX2CXzTNqipjuyaP4eicJHWLYpNL8lBuO/GKPIPVKbH
 fk+Tv3f6bQW393h2foI6U4xHvyWvTOKp6349bMEXqi841TwiI1E+pHLH8
 iL/9jBlBA7plF1JUJvil3kduIE85Ou4TlVUbXCW9kb1/cVlcJunbm8k1u w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="3760052"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; 
   d="scan'208";a="3760052"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:11:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="22053257"
Received: from lwenners-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.35.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:11:04 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 19/39] drm: bridge: it66121: switch to ->edid_read callback
Date: Wed,  3 Jan 2024 12:08:33 +0200
Message-Id: <e2ca6b98dbfc111c61d58bf4d4ea12b680c1cdd0.1704276309.git.jani.nikula@intel.com>
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
 drivers/gpu/drm/bridge/ite-it66121.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index 1cf3fb1f13dc..1c3433b5e366 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -874,33 +874,33 @@ static void it66121_bridge_hpd_disable(struct drm_bridge *bridge)
 		dev_err(ctx->dev, "failed to disable HPD IRQ\n");
 }
 
-static struct edid *it66121_bridge_get_edid(struct drm_bridge *bridge,
-					    struct drm_connector *connector)
+static const struct drm_edid *it66121_bridge_edid_read(struct drm_bridge *bridge,
+						       struct drm_connector *connector)
 {
 	struct it66121_ctx *ctx = container_of(bridge, struct it66121_ctx, bridge);
-	struct edid *edid;
+	const struct drm_edid *drm_edid;
 	int ret;
 
 	mutex_lock(&ctx->lock);
 	ret = it66121_preamble_ddc(ctx);
 	if (ret) {
-		edid = NULL;
+		drm_edid = NULL;
 		goto out_unlock;
 	}
 
 	ret = regmap_write(ctx->regmap, IT66121_DDC_HEADER_REG,
 			   IT66121_DDC_HEADER_EDID);
 	if (ret) {
-		edid = NULL;
+		drm_edid = NULL;
 		goto out_unlock;
 	}
 
-	edid = drm_do_get_edid(connector, it66121_get_edid_block, ctx);
+	drm_edid = drm_edid_read_custom(connector, it66121_get_edid_block, ctx);
 
 out_unlock:
 	mutex_unlock(&ctx->lock);
 
-	return edid;
+	return drm_edid;
 }
 
 static const struct drm_bridge_funcs it66121_bridge_funcs = {
@@ -916,7 +916,7 @@ static const struct drm_bridge_funcs it66121_bridge_funcs = {
 	.mode_set = it66121_bridge_mode_set,
 	.mode_valid = it66121_bridge_mode_valid,
 	.detect = it66121_bridge_detect,
-	.get_edid = it66121_bridge_get_edid,
+	.edid_read = it66121_bridge_edid_read,
 	.hpd_enable = it66121_bridge_hpd_enable,
 	.hpd_disable = it66121_bridge_hpd_disable,
 };
-- 
2.39.2

