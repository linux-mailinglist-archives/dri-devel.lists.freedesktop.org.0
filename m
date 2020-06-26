Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B027C20AD97
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jun 2020 09:55:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C30DA6E431;
	Fri, 26 Jun 2020 07:55:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.protonmail.ch (mail-40136.protonmail.ch
 [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB2986E431
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 07:55:22 +0000 (UTC)
Date: Fri, 26 Jun 2020 07:55:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1593158120;
 bh=2Vir1ByENnlaiJZEI0JZIM7wvXFDMdbW5FCJpcQEwZQ=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=N+4NrxXpBqIhJdQPiR7gHN3YIDpUI/gUtQCJHksEHya7sgjaIvz3zLoiRdKeAfnkE
 IAh8hup71sDQRtU5A3ZevxlYxf2F2TG5zGtuQfEd70BuGzH6VC1J4miUBY/YNRZErS
 jBP47xfECmJQ4Tc99RcORMEM7x5pgzpm7C0gRQzg=
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [RFC] drm: expose connector status values in uapi
Message-ID: <-LYZxtmyBTf36wklyxa0PphDQ1FecAgEF7TMnSvyCm9Y_EFmz-4AUROX6qc4HKUjomE0HumDgVrSIbHsUMJnRSrBR2c3gPCVDNUmz7klPkE=@emersion.fr>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Pekka Paalanen <pekka.paalanen@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Right now user-space doesn't have access to connector status definitions.
This means user-space needs to maintain a separate enum for these, and
makes it difficult to document the uapi.

Introduce defines in drm_mode.h, and copy over the docs. Keep using the
drm_connector_status enum in drivers, because it allows for nice things
when using the enum as a type.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
---

- Would something like this be desirable?
- Docs are just copied over for now, not improved
- Same applies to e.g. the subpixel field

 include/drm/drm_connector.h | 30 ++++--------------------------
 include/uapi/drm/drm_mode.h | 27 ++++++++++++++++++++++++++-
 2 files changed, 30 insertions(+), 27 deletions(-)

diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index fd543d1db9b2..f48f8072aa89 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -53,34 +53,12 @@ enum drm_connector_force {
 /**
  * enum drm_connector_status - status for a &drm_connector
  *
- * This enum is used to track the connector status. There are no separate
- * #defines for the uapi!
+ * This enum is used to track the connector status. See the uapi docs.
  */
 enum drm_connector_status {
-	/**
-	 * @connector_status_connected: The connector is definitely connected to
-	 * a sink device, and can be enabled.
-	 */
-	connector_status_connected = 1,
-	/**
-	 * @connector_status_disconnected: The connector isn't connected to a
-	 * sink device which can be autodetect. For digital outputs like DP or
-	 * HDMI (which can be realiable probed) this means there's really
-	 * nothing there. It is driver-dependent whether a connector with this
-	 * status can be lit up or not.
-	 */
-	connector_status_disconnected = 2,
-	/**
-	 * @connector_status_unknown: The connector's status could not be
-	 * reliably detected. This happens when probing would either cause
-	 * flicker (like load-detection when the connector is in use), or when a
-	 * hardware resource isn't available (like when load-detection needs a
-	 * free CRTC). It should be possible to light up the connector with one
-	 * of the listed fallback modes. For default configuration userspace
-	 * should only try to light up connectors with unknown status when
-	 * there's not connector with @connector_status_connected.
-	 */
-	connector_status_unknown = 3,
+	connector_status_connected = DRM_MODE_STATUS_CONNECTED,
+	connector_status_disconnected = DRM_MODE_STATUS_DISCONNECTED,
+	connector_status_unknown = DRM_MODE_STATUS_UNKNOWN,
 };
 
 /**
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 735c8cfdaaa1..0deffda35487 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -363,6 +363,31 @@ enum drm_mode_subconnector {
 #define DRM_MODE_CONNECTOR_WRITEBACK	18
 #define DRM_MODE_CONNECTOR_SPI		19
 
+/**
+ * @DRM_MODE_STATUS_CONNECTED: The connector is definitely connected to
+ * a sink device, and can be enabled.
+ */
+#define DRM_MODE_STATUS_CONNECTED 1
+/**
+ * @DRM_MODE_STATUS_DISCONNECTED: The connector isn't connected to a
+ * sink device which can be autodetect. For digital outputs like DP or
+ * HDMI (which can be realiable probed) this means there's really
+ * nothing there. It is driver-dependent whether a connector with this
+ * status can be lit up or not.
+ */
+#define DRM_MODE_STATUS_DISCONNECTED 2
+/**
+ * @DRM_MODE_STATUS_UNKNOWN: The connector's status could not be
+ * reliably detected. This happens when probing would either cause
+ * flicker (like load-detection when the connector is in use), or when a
+ * hardware resource isn't available (like when load-detection needs a
+ * free CRTC). It should be possible to light up the connector with one
+ * of the listed fallback modes. For default configuration userspace
+ * should only try to light up connectors with unknown status when
+ * there's not connector with @connector_status_connected.
+ */
+#define DRM_MODE_STATUS_UNKNOWN 3
+
 struct drm_mode_get_connector {
 
 	__u64 encoders_ptr;
@@ -379,7 +404,7 @@ struct drm_mode_get_connector {
 	__u32 connector_type;
 	__u32 connector_type_id;
 
-	__u32 connection;
+	__u32 connection; /**< see DRM_MODE_STATUS_* */
 	__u32 mm_width;  /**< width in millimeters */
 	__u32 mm_height; /**< height in millimeters */
 	__u32 subpixel;
-- 
2.27.0


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
