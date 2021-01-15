Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7152F7726
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 12:06:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9876189E3B;
	Fri, 15 Jan 2021 11:06:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 684BA89E3B
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 11:06:36 +0000 (UTC)
X-Originating-IP: 86.247.11.12
Received: from haruko.lan (lfbn-idf2-1-654-12.w86-247.abo.wanadoo.fr
 [86.247.11.12]) (Authenticated sender: schroder@emersion.fr)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 13A3060009;
 Fri, 15 Jan 2021 11:06:33 +0000 (UTC)
From: Simon Ser <contact@emersion.fr>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 1/2] drm/doc: fix drm_plane_type docs
Date: Fri, 15 Jan 2021 12:06:25 +0100
Message-Id: <20210115110626.12233-1-contact@emersion.fr>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The docs for enum drm_plane_type mention legacy IOCTLs, however the
plane type is not tied to legacy IOCTLs, the drm_cursor.primary and
cursor fields are. Add a small paragraph to reference these.

Instead, document expectations for primary and cursor planes for
non-legacy userspace. Note that these docs are for driver developers,
not userspace developers, so internal kernel APIs are mentionned.

Signed-off-by: Simon Ser <contact@emersion.fr>
Reviewed-by: Daniel Vetter <daniel@ffwll.ch>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
---
 include/drm/drm_plane.h | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 8ef06ee1c8eb..95ab14a4336a 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -538,10 +538,14 @@ struct drm_plane_funcs {
  *
  * For compatibility with legacy userspace, only overlay planes are made
  * available to userspace by default. Userspace clients may set the
- * DRM_CLIENT_CAP_UNIVERSAL_PLANES client capability bit to indicate that they
+ * &DRM_CLIENT_CAP_UNIVERSAL_PLANES client capability bit to indicate that they
  * wish to receive a universal plane list containing all plane types. See also
  * drm_for_each_legacy_plane().
  *
+ * In addition to setting each plane's type, drivers need to setup the
+ * &drm_crtc.primary and optionally &drm_crtc.cursor pointers for legacy
+ * IOCTLs. See drm_crtc_init_with_planes().
+ *
  * WARNING: The values of this enum is UABI since they're exposed in the "type"
  * property.
  */
@@ -557,19 +561,20 @@ enum drm_plane_type {
 	/**
 	 * @DRM_PLANE_TYPE_PRIMARY:
 	 *
-	 * Primary planes represent a "main" plane for a CRTC.  Primary planes
-	 * are the planes operated upon by CRTC modesetting and flipping
-	 * operations described in the &drm_crtc_funcs.page_flip and
-	 * &drm_crtc_funcs.set_config hooks.
+	 * A primary plane attached to a CRTC is the most likely to be able to
+	 * light up the CRTC when no scaling/cropping is used and the plane
+	 * covers the whole CRTC.
 	 */
 	DRM_PLANE_TYPE_PRIMARY,
 
 	/**
 	 * @DRM_PLANE_TYPE_CURSOR:
 	 *
-	 * Cursor planes represent a "cursor" plane for a CRTC.  Cursor planes
-	 * are the planes operated upon by the DRM_IOCTL_MODE_CURSOR and
-	 * DRM_IOCTL_MODE_CURSOR2 IOCTLs.
+	 * A cursor plane attached to a CRTC is more likely to be able to be
+	 * enabled when no scaling/cropping is used and the framebuffer has the
+	 * size indicated by &drm_mode_config.cursor_width and
+	 * &drm_mode_config.cursor_height. Additionally, if the driver doesn't
+	 * support modifiers, the framebuffer should have a linear layout.
 	 */
 	DRM_PLANE_TYPE_CURSOR,
 };
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
