Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB029822AED
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 11:09:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AD4110E26A;
	Wed,  3 Jan 2024 10:09:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0142010E26A
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jan 2024 10:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704276560; x=1735812560;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hTLB4Hy75h3+j9ehHxtfjVDM1WJFncnuE8+RDgMQu+Q=;
 b=PUP/l9HIFgW6g9FfJd3B8ZMaS86Z3xBsY6FoJnHFz2yc6H8oBYkNqzaN
 dgNtL6MBeI7/qF2Nn35a+nq2qnYlGUdECr7j1f17y8nk8gl08TqWc+ljE
 p4dogtzx4lyDyZrZFcFhuVtXVIP+QJSJFNY3ELKMO48anOqrewnGK4r6d
 atuq05JcqXrLo2lJ8xJ9jDRRMBZt2uxYYpr1xdMeHZuFiZIOrdqoVTcd1
 aX3/9NkADmA+Xwlc7RkzjBHaVPIcxut+6x4JA95YOtvAu9q9zV1J5X+py
 z5oatGIoRIvgjPBZQWpO4qE7R0pq05TLs3rWwYYVIyQM9DpIPGEMKmZud A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="3759809"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; 
   d="scan'208";a="3759809"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:09:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="22052978"
Received: from lwenners-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.35.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:09:16 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 01/39] drm/bridge: add ->edid_read hook and
 drm_bridge_edid_read()
Date: Wed,  3 Jan 2024 12:08:15 +0200
Message-Id: <40d4453cde805f78ae86e1b208b802850641fe13.1704276309.git.jani.nikula@intel.com>
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

Add new struct drm_edid based ->edid_read hook and
drm_bridge_edid_read() function to call the hook.

v2: Include drm/drm_edid.h

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_bridge.c | 46 +++++++++++++++++++++++++++++++++++-
 include/drm/drm_bridge.h     | 33 ++++++++++++++++++++++++++
 2 files changed, 78 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index cee3188adf3d..4f6f8c662d3f 100644
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
index e39da5807ba7..b7aed3ead705 100644
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

