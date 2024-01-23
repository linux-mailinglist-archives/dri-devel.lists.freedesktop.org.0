Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A128399CA
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 20:41:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86CA310E0D9;
	Tue, 23 Jan 2024 19:41:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70EFC10E0D9
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 19:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706038908; x=1737574908;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VrPQ2AgnEuYEXfZI0myUYU84TFkFrm9pa/6weGgvnHM=;
 b=S1SU56FXAJf/IQ336FEfiArfnMyNSfBRYlMo4ktzRYRcsotRiL5qTion
 79LqNFD3BV1d3jsEofKcJ4WexEV7J6vUnlxO59nVYAttxQv6Jm3+Q/xkP
 YSPo8a0+V0cyLf/tLXPI3Huo+xyg7ITZnQgJDX3ZIgppgByoiatWx7e81
 qvummBKBHTVD3XCvgiMwoBLsKFhSIVxEa+MrCHeSe44YSD/8npZ+XBI8y
 X6A4INCMA+Z/BhWSxMAg61NqTPKMn+APZmR8rsgPSd1+e+Fy6CqdbQZfw
 u/5qqBiXkRIT4ov0wnRK4DpKpGS58dybIPev4VaC4CE/nxsHFpS/nTtkR g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="392050460"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="392050460"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 11:41:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="909409082"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="909409082"
Received: from pzsolt-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.40.183])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 11:41:45 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v3 39/39] drm/bridge: remove ->get_edid callback
Date: Tue, 23 Jan 2024 21:37:45 +0200
Message-Id: <34407a355ec6848fc44f8c30d245fcbc5687195e.1706038510.git.jani.nikula@intel.com>
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

There are no more users of the ->get_edid callback left. They've all
been converted to ->edid_read. Remove the callback, and the fallback in
drm_bridge_edid_read().

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_bridge.c | 19 -------------------
 include/drm/drm_bridge.h     | 30 ------------------------------
 2 files changed, 49 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index a3065d4aa3d6..521a71c61b16 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1216,9 +1216,6 @@ EXPORT_SYMBOL_GPL(drm_bridge_get_modes);
  * DRM_BRIDGE_OP_EDID bridge ops flag, call &drm_bridge_funcs.edid_read to get
  * the EDID and return it. Otherwise return NULL.
  *
- * If &drm_bridge_funcs.edid_read is not set, fall back to using
- * &drm_bridge_funcs.get_edid and wrapping it in struct drm_edid.
- *
  * RETURNS:
  * The retrieved EDID on success, or NULL otherwise.
  */
@@ -1228,22 +1225,6 @@ const struct drm_edid *drm_bridge_edid_read(struct drm_bridge *bridge,
 	if (!(bridge->ops & DRM_BRIDGE_OP_EDID))
 		return NULL;
 
-	/* Transitional: Fall back to ->get_edid. */
-	if (!bridge->funcs->edid_read) {
-		const struct drm_edid *drm_edid;
-		struct edid *edid;
-
-		edid = bridge->funcs->get_edid(bridge, connector);
-		if (!edid)
-			return NULL;
-
-		drm_edid = drm_edid_alloc(edid, (edid->extensions + 1) * EDID_LENGTH);
-
-		kfree(edid);
-
-		return drm_edid;
-	}
-
 	return bridge->funcs->edid_read(bridge, connector);
 }
 EXPORT_SYMBOL_GPL(drm_bridge_edid_read);
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index ee12f829aaf7..7293c02e17c5 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -588,36 +588,6 @@ struct drm_bridge_funcs {
 	const struct drm_edid *(*edid_read)(struct drm_bridge *bridge,
 					    struct drm_connector *connector);
 
-	/**
-	 * @get_edid:
-	 *
-	 * Read and parse the EDID data of the connected display.
-	 *
-	 * The @get_edid callback is the preferred way of reporting mode
-	 * information for a display connected to the bridge output. Bridges
-	 * that support reading EDID shall implement this callback and leave
-	 * the @get_modes callback unimplemented.
-	 *
-	 * The caller of this operation shall first verify the output
-	 * connection status and refrain from reading EDID from a disconnected
-	 * output.
-	 *
-	 * This callback is optional. Bridges that implement it shall set the
-	 * DRM_BRIDGE_OP_EDID flag in their &drm_bridge->ops.
-	 *
-	 * The connector parameter shall be used for the sole purpose of EDID
-	 * retrieval and parsing, and shall not be stored internally by bridge
-	 * drivers for future usage.
-	 *
-	 * RETURNS:
-	 *
-	 * An edid structure newly allocated with kmalloc() (or similar) on
-	 * success, or NULL otherwise. The caller is responsible for freeing
-	 * the returned edid structure with kfree().
-	 */
-	struct edid *(*get_edid)(struct drm_bridge *bridge,
-				 struct drm_connector *connector);
-
 	/**
 	 * @hpd_notify:
 	 *
-- 
2.39.2

