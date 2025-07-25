Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B27C4B11792
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 07:04:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8916810E419;
	Fri, 25 Jul 2025 05:04:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O6CVMQHE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8E3910E419;
 Fri, 25 Jul 2025 05:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753419861; x=1784955861;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZL48KN6h92VH+lTQxKJhE2g8ShEaTolON/Td8lBYeOE=;
 b=O6CVMQHE/11ACXeRcS1C+W2AQ+bnBVafep9F4cyC94pRfeqjMn+k9ghE
 YlQNrPnVU4vZ8Dj/iqJ4sLaskpM+zy7lkAVwfkjMXodPKRvgKhPPsv/r6
 UzUXp/VASFQkh0DHoDbjG/G4eFTcdMANUTw+0mX86EGHktp6lskC41xR1
 CKQSymdLlpAGdpWlTomDMQkJhEbD4pAQtONWkRd417mWZHBXUIgSVBiN+
 RVS321qWXhi9sQeqQe8u/E1nYRkjftK3Asv7wSK0YBUuF4JtGLF3KKcZK
 TaX4TxDtOe735VZ7UqANsklioGcUt9ozgMckJ9t3AqnO4JdGsi7FIE7Ms A==;
X-CSE-ConnectionGUID: rZdWqB5XQdKI7Uq59C5krg==
X-CSE-MsgGUID: a2fKHibtTbyfVW3t3ek8JQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="78299514"
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="78299514"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 22:04:20 -0700
X-CSE-ConnectionGUID: NeE5sxzkREmwiTf9fKGu+g==
X-CSE-MsgGUID: ytyL7FaUR+2I8mK35fopBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="160956481"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa009.fm.intel.com with ESMTP; 24 Jul 2025 22:04:18 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com, uma.shankar@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 02/28] drm/writeback: Add a helper function to get writeback
 connector
Date: Fri, 25 Jul 2025 10:33:43 +0530
Message-Id: <20250725050409.2687242-3-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250725050409.2687242-1-suraj.kandpal@intel.com>
References: <20250725050409.2687242-1-suraj.kandpal@intel.com>
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that we can initialize a drm_writeback_connector without
having to initialize the drm_connector within it and leaving the
responsibility of initialising the drm_connector and maintaining
the association with drm_writeback_connector to it. This helper
hooks lets drivers return the drm_writeback_connector associated
with the give drm_connector.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/drm_writeback.c          | 14 ++++++
 include/drm/drm_modeset_helper_vtables.h | 59 ++++++++++++++++++++++++
 include/drm/drm_writeback.h              | 14 ++++--
 3 files changed, 82 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index fa58eb0dc7bf..e9f7123270d6 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -107,6 +107,19 @@ static const struct dma_fence_ops drm_writeback_fence_ops = {
 	.get_timeline_name = drm_writeback_fence_get_timeline_name,
 };
 
+struct drm_writeback_connector *
+drm_connector_to_writeback(struct drm_connector *connector)
+{
+	const struct drm_connector_helper_funcs *funcs =
+		connector->helper_private;
+
+	if (funcs->get_writeback_connector)
+		return funcs->get_writeback_connector(connector);
+
+	return container_of(connector, struct drm_writeback_connector, base);
+}
+EXPORT_SYMBOL(drm_connector_to_writeback);
+
 static int create_writeback_properties(struct drm_device *dev)
 {
 	struct drm_property *prop;
@@ -443,6 +456,7 @@ drm_writeback_connector_init_with_conn(struct drm_device *dev, struct drm_connec
 				       struct drm_writeback_connector *wb_connector,
 				       struct drm_encoder *enc,
 				       const struct drm_connector_funcs *con_funcs,
+				       const struct drm_writeback_connector_helper_funcs *wb_funcs,
 				       const u32 *formats, int n_formats)
 {
 	struct drm_property_blob *blob;
diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
index ce7c7aeac887..6b89b33d2304 100644
--- a/include/drm/drm_modeset_helper_vtables.h
+++ b/include/drm/drm_modeset_helper_vtables.h
@@ -31,6 +31,7 @@
 
 #include <drm/drm_crtc.h>
 #include <drm/drm_encoder.h>
+#include <drm/drm_writeback.h>
 
 /**
  * DOC: overview
@@ -1179,6 +1180,25 @@ struct drm_connector_helper_funcs {
 	 *
 	 */
 	void (*disable_hpd)(struct drm_connector *connector);
+
+	/**
+	 * @get_writeback_connector:
+	 *
+	 * This callback is used by drivers to get the writeback connector in
+	 * case the init is done via drm_writeback_init_with_conn. Which means
+	 * the drivers don't have drm_connector embedded in drm_writeback_connector
+	 * so they need to send the associated writeback connector with this
+	 * function.
+	 *
+	 * This operation is optional.
+	 *
+	 * This is mainly called from drm_writeback_set_gb.
+	 *
+	 * RETURNS:
+	 *
+	 * drm_writeback_connector assoiciated with the drm connector.
+	 */
+	struct drm_writeback_connector *(*get_writeback_connector)(struct drm_connector *connector);
 };
 
 /**
@@ -1192,6 +1212,45 @@ static inline void drm_connector_helper_add(struct drm_connector *connector,
 	connector->helper_private = funcs;
 }
 
+/**
+ * struct drm_writeback_connector_helper_funcs - helper operations for writeback
+ * connectors.
+ *
+ * These functions are used by the atomic and legacy modeset helpers and by the
+ * probe helpers.
+ */
+struct drm_writeback_connector_helper_funcs {
+	/**
+	 * @get_connector_from_writeback:
+	 *
+	 * This callback is used by drivers to get the drm_connector in
+	 * case the init is done via drm_writeback_init_with_conn. Which means
+	 * the drivers don't have drm_connector embedded in drm_writeback_connector
+	 * so they need to send the associated drm_connector with this
+	 * function.
+	 *
+	 * This operation is optional.
+	 *
+	 * RETURNS:
+	 *
+	 * drm_connector assoiciated with the drm_writeback_connector.
+	 */
+	struct drm_connector
+	*(*get_connector_from_writeback)(struct drm_writeback_connector *wbconnector);
+};
+
+/**
+ * drm_writeback_connector_helper_add - sets the helper vtable for a connector
+ * @wb_connector: DRM writeback connector
+ * @funcs: helper vtable to set for @wb_connector
+ */
+static inline void
+drm_writeback_connector_helper_add(struct drm_writeback_connector *wb_connector,
+				   const struct drm_writeback_connector_helper_funcs *funcs)
+{
+	wb_connector->helper_private = funcs;
+}
+
 /**
  * struct drm_plane_helper_funcs - helper operations for planes
  *
diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
index 149744dbeef0..77c3c64c132d 100644
--- a/include/drm/drm_writeback.h
+++ b/include/drm/drm_writeback.h
@@ -84,6 +84,13 @@ struct drm_writeback_connector {
 	 * The name of the connector's fence timeline.
 	 */
 	char timeline_name[32];
+
+	/**
+	 * @helper_private:
+	 *
+	 * helper private funcs for writeback_connector
+	 */
+	const struct drm_writeback_connector_helper_funcs *helper_private;
 };
 
 /**
@@ -142,11 +149,7 @@ struct drm_writeback_job {
 	void *priv;
 };
 
-static inline struct drm_writeback_connector *
-drm_connector_to_writeback(struct drm_connector *connector)
-{
-	return container_of(connector, struct drm_writeback_connector, base);
-}
+struct drm_writeback_connector *drm_connector_to_writeback(struct drm_connector *connector);
 
 int drm_writeback_connector_init(struct drm_device *dev,
 				 struct drm_writeback_connector *wb_connector,
@@ -172,6 +175,7 @@ drm_writeback_connector_init_with_conn(struct drm_device *dev, struct drm_connec
 				       struct drm_writeback_connector *wb_connector,
 				       struct drm_encoder *enc,
 				       const struct drm_connector_funcs *con_funcs,
+				       const struct drm_writeback_connector_helper_funcs *wb_funcs,
 				       const u32 *formats, int n_formats);
 
 int drm_writeback_set_fb(struct drm_connector_state *conn_state,
-- 
2.34.1

