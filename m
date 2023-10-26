Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F8E7D7FBD
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 11:40:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8C3110E797;
	Thu, 26 Oct 2023 09:40:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3448010E797
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 09:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698313211; x=1729849211;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k/tkjm+aLdTKIDC9RP0qnvhblK7zhXlFXaH23ri+Ekw=;
 b=ETDzl7mfxO16V7xAi6ONjVcQ4nYtBtxBR5PTq1JD+HgnXtH2Jr2PkCNk
 NvSjIKDvoxYgW1qKA1qVtZE03Py5VDc8j5f9IdDO0q7q+h8nxuHOM7ohk
 U/Ix2ZYyGDRU/RZVPMcFTcTzvdQyTjCPfguliE6xo1+gbRn4NQq9u1Rbj
 NL650+UH5cw/bq7WAJ8rfzRP7GCeb4Tm3hwWayoT0UtOH/6iZgDov4N7e
 ygiitlG1hNH0ChspqSaZ0akCrbcUGbR2SkEHmlCk0U578Qd2K8MRU+pX1
 oE0ohpfVF0DTr3MN/E4MEhdLa8nVkvuKHdXbGg8FGHf9+25dHxH9uyPJl A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="384708299"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; d="scan'208";a="384708299"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2023 02:40:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="7203823"
Received: from tzirr-desk2.ger.corp.intel.com (HELO localhost) ([10.252.49.68])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2023 02:39:57 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 1/2] drm/bridge: add ->edid_read hook and
 drm_bridge_edid_read()
Date: Thu, 26 Oct 2023 12:39:55 +0300
Message-Id: <daa4703cc30ee05836fb477a1a8da4b89a391afd.1698312534.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1698312534.git.jani.nikula@intel.com>
References: <cover.1698312534.git.jani.nikula@intel.com>
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

Add new struct drm_edid based ->edid_read hook and
drm_bridge_edid_read() function to call the hook.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_bridge.c | 46 +++++++++++++++++++++++++++++++++++-
 include/drm/drm_bridge.h     | 33 ++++++++++++++++++++++++++
 2 files changed, 78 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 30d66bee0ec6..e1cfba2ff583 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -27,8 +27,9 @@
 #include <linux/mutex.h>
 
 #include <drm/drm_atomic_state_helper.h>
-#include <drm/drm_debugfs.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_debugfs.h>
+#include <drm/drm_edid.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_file.h>
 #include <drm/drm_of.h>
@@ -1206,6 +1207,47 @@ int drm_bridge_get_modes(struct drm_bridge *bridge,
 }
 EXPORT_SYMBOL_GPL(drm_bridge_get_modes);
 
+/**
+ * drm_bridge_edid_read - read the EDID data of the connected display
+ * @bridge: bridge control structure
+ * @connector: the connector to read EDID for
+ *
+ * If the bridge supports output EDID retrieval, as reported by the
+ * DRM_BRIDGE_OP_EDID bridge ops flag, call &drm_bridge_funcs.edid_read to get
+ * the EDID and return it. Otherwise return NULL.
+ *
+ * If &drm_bridge_funcs.edid_read is not set, fall back to using
+ * drm_bridge_get_edid() and wrapping it in struct drm_edid.
+ *
+ * RETURNS:
+ * The retrieved EDID on success, or NULL otherwise.
+ */
+const struct drm_edid *drm_bridge_edid_read(struct drm_bridge *bridge,
+					    struct drm_connector *connector)
+{
+	if (!(bridge->ops & DRM_BRIDGE_OP_EDID))
+		return NULL;
+
+	/* Transitional: Fall back to ->get_edid. */
+	if (!bridge->funcs->edid_read) {
+		const struct drm_edid *drm_edid;
+		struct edid *edid;
+
+		edid = drm_bridge_get_edid(bridge, connector);
+		if (!edid)
+			return NULL;
+
+		drm_edid = drm_edid_alloc(edid, (edid->extensions + 1) * EDID_LENGTH);
+
+		kfree(edid);
+
+		return drm_edid;
+	}
+
+	return bridge->funcs->edid_read(bridge, connector);
+}
+EXPORT_SYMBOL_GPL(drm_bridge_edid_read);
+
 /**
  * drm_bridge_get_edid - get the EDID data of the connected display
  * @bridge: bridge control structure
@@ -1215,6 +1257,8 @@ EXPORT_SYMBOL_GPL(drm_bridge_get_modes);
  * DRM_BRIDGE_OP_EDID bridge ops flag, call &drm_bridge_funcs.get_edid to
  * get the EDID and return it. Otherwise return NULL.
  *
+ * Deprecated. Prefer using drm_bridge_edid_read().
+ *
  * RETURNS:
  * The retrieved EDID on success, or NULL otherwise.
  */
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index cfb7dcdb66c4..1a8ba92c889c 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -557,6 +557,37 @@ struct drm_bridge_funcs {
 	int (*get_modes)(struct drm_bridge *bridge,
 			 struct drm_connector *connector);
 
+	/**
+	 * @edid_read:
+	 *
+	 * Read the EDID data of the connected display.
+	 *
+	 * The @edid_read callback is the preferred way of reporting mode
+	 * information for a display connected to the bridge output. Bridges
+	 * that support reading EDID shall implement this callback and leave
+	 * the @get_modes callback unimplemented.
+	 *
+	 * The caller of this operation shall first verify the output
+	 * connection status and refrain from reading EDID from a disconnected
+	 * output.
+	 *
+	 * This callback is optional. Bridges that implement it shall set the
+	 * DRM_BRIDGE_OP_EDID flag in their &drm_bridge->ops.
+	 *
+	 * The connector parameter shall be used for the sole purpose of EDID
+	 * retrieval, and shall not be stored internally by bridge drivers for
+	 * future usage.
+	 *
+	 * RETURNS:
+	 *
+	 * An edid structure newly allocated with drm_edid_alloc() or returned
+	 * from drm_edid_read() family of functions on success, or NULL
+	 * otherwise. The caller is responsible for freeing the returned edid
+	 * structure with drm_edid_free().
+	 */
+	const struct drm_edid *(*edid_read)(struct drm_bridge *bridge,
+					    struct drm_connector *connector);
+
 	/**
 	 * @get_edid:
 	 *
@@ -888,6 +919,8 @@ drm_atomic_helper_bridge_propagate_bus_fmt(struct drm_bridge *bridge,
 enum drm_connector_status drm_bridge_detect(struct drm_bridge *bridge);
 int drm_bridge_get_modes(struct drm_bridge *bridge,
 			 struct drm_connector *connector);
+const struct drm_edid *drm_bridge_edid_read(struct drm_bridge *bridge,
+					    struct drm_connector *connector);
 struct edid *drm_bridge_get_edid(struct drm_bridge *bridge,
 				 struct drm_connector *connector);
 void drm_bridge_hpd_enable(struct drm_bridge *bridge,
-- 
2.39.2

