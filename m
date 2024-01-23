Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CE48399AF
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 20:39:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D58A010E86F;
	Tue, 23 Jan 2024 19:39:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D74510E861
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 19:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706038748; x=1737574748;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0Q5yfJHvMZWQCnsiByOXKTr+qtbniF3CKdf+7QwVuuY=;
 b=QGqnKxw0UjRzmFOVbHhHlDwr81TDNsL4z8j5qk3NJxYTL3dOonRd/Ebj
 xSQCzCvV39DGKv35uwLaY/lsa5VKJgNK33w9SHHnMvPX9Z/5g2kc/hGRJ
 RsNJ0WuJ5OfOewIBb8DR6c5UTDD78rBAOKdIOCXOa8Z5cS/PLuJJ4buHS
 nWlYQDLM43iYiGy43amsYAMdkFf5hfXp4rmPh0RnLagFPwxeC3aKxrkSC
 GDXPi9+BqSfQKD/ms0Uo5pgYuIO1aitYHaIJDKOcrqRo1viqfuOLMftg/
 Qrf+5ukuezRtdFAffOJDJTSj9F5LU1ENf2mmBBOp33cDj1hcRx8ulWP3q w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="14980542"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="14980542"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 11:39:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="820212722"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="820212722"
Received: from pzsolt-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.40.183])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 11:39:05 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v3 13/39] drm/bridge: remove drm_bridge_get_edid() in favour
 of drm_bridge_edid_read()
Date: Tue, 23 Jan 2024 21:37:19 +0200
Message-Id: <c51d50edddbe8816eaa63e6ccafa9f2354b506ba.1706038510.git.jani.nikula@intel.com>
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

All users of drm_bridge_get_edid() have been converted to use
drm_bridge_edid_read(). Remove drm_bridge_get_edid().

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_bridge.c | 28 ++--------------------------
 include/drm/drm_bridge.h     |  2 --
 2 files changed, 2 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 4f6f8c662d3f..a3065d4aa3d6 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1217,7 +1217,7 @@ EXPORT_SYMBOL_GPL(drm_bridge_get_modes);
  * the EDID and return it. Otherwise return NULL.
  *
  * If &drm_bridge_funcs.edid_read is not set, fall back to using
- * drm_bridge_get_edid() and wrapping it in struct drm_edid.
+ * &drm_bridge_funcs.get_edid and wrapping it in struct drm_edid.
  *
  * RETURNS:
  * The retrieved EDID on success, or NULL otherwise.
@@ -1233,7 +1233,7 @@ const struct drm_edid *drm_bridge_edid_read(struct drm_bridge *bridge,
 		const struct drm_edid *drm_edid;
 		struct edid *edid;
 
-		edid = drm_bridge_get_edid(bridge, connector);
+		edid = bridge->funcs->get_edid(bridge, connector);
 		if (!edid)
 			return NULL;
 
@@ -1248,30 +1248,6 @@ const struct drm_edid *drm_bridge_edid_read(struct drm_bridge *bridge,
 }
 EXPORT_SYMBOL_GPL(drm_bridge_edid_read);
 
-/**
- * drm_bridge_get_edid - get the EDID data of the connected display
- * @bridge: bridge control structure
- * @connector: the connector to read EDID for
- *
- * If the bridge supports output EDID retrieval, as reported by the
- * DRM_BRIDGE_OP_EDID bridge ops flag, call &drm_bridge_funcs.get_edid to
- * get the EDID and return it. Otherwise return NULL.
- *
- * Deprecated. Prefer using drm_bridge_edid_read().
- *
- * RETURNS:
- * The retrieved EDID on success, or NULL otherwise.
- */
-struct edid *drm_bridge_get_edid(struct drm_bridge *bridge,
-				 struct drm_connector *connector)
-{
-	if (!(bridge->ops & DRM_BRIDGE_OP_EDID))
-		return NULL;
-
-	return bridge->funcs->get_edid(bridge, connector);
-}
-EXPORT_SYMBOL_GPL(drm_bridge_get_edid);
-
 /**
  * drm_bridge_hpd_enable - enable hot plug detection for the bridge
  * @bridge: bridge control structure
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index b7aed3ead705..ee12f829aaf7 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -921,8 +921,6 @@ int drm_bridge_get_modes(struct drm_bridge *bridge,
 			 struct drm_connector *connector);
 const struct drm_edid *drm_bridge_edid_read(struct drm_bridge *bridge,
 					    struct drm_connector *connector);
-struct edid *drm_bridge_get_edid(struct drm_bridge *bridge,
-				 struct drm_connector *connector);
 void drm_bridge_hpd_enable(struct drm_bridge *bridge,
 			   void (*cb)(void *data,
 				      enum drm_connector_status status),
-- 
2.39.2

