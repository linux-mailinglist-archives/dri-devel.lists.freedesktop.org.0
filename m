Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D131D2D7EE3
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 19:56:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFDB76E1F8;
	Fri, 11 Dec 2020 18:56:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B4016EA0C
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 18:56:18 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (unknown [217.70.183.196])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id 7B0FF3B4AD3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 18:46:58 +0000 (UTC)
X-Originating-IP: 86.247.11.12
Received: from haruko.lan (lfbn-idf2-1-654-12.w86-247.abo.wanadoo.fr
 [86.247.11.12]) (Authenticated sender: schroder@emersion.fr)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 894E5E0003;
 Fri, 11 Dec 2020 18:46:35 +0000 (UTC)
From: Simon Ser <contact@emersion.fr>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 1/4] drm: rework description of primary and cursor planes
Date: Fri, 11 Dec 2020 19:46:31 +0100
Message-Id: <20201211184634.74534-1-contact@emersion.fr>
X-Mailer: git-send-email 2.29.2
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Pekka Paalanen <pekka.paalanen@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The previous wording could be understood by user-space evelopers as "a
primary/cursor plane is only compatible with a single CRTC" [1].

Reword the planes description to make it clear the DRM-internal
drm_crtc.primary and drm_crtc.cursor planes are for legacy uAPI.

[1]: https://github.com/swaywm/wlroots/pull/2333#discussion_r456788057

Signed-off-by: Simon Ser <contact@emersion.fr>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
---
 drivers/gpu/drm/drm_crtc.c  |  3 +++
 drivers/gpu/drm/drm_plane.c | 16 +++++++++-------
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index 8d19d258547f..a6336c7154d6 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -256,6 +256,9 @@ struct dma_fence *drm_crtc_create_fence(struct drm_crtc *crtc)
  * planes). For really simple hardware which has only 1 plane look at
  * drm_simple_display_pipe_init() instead.
  *
+ * The @primary and @cursor planes are only relevant for legacy uAPI, see
+ * &drm_crtc.primary and &drm_crtc.cursor.
+ *
  * Returns:
  * Zero on success, error code on failure.
  */
diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 385801dd21f9..5d33ca9f0032 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -49,14 +49,16 @@
  * &struct drm_plane (possibly as part of a larger structure) and registers it
  * with a call to drm_universal_plane_init().
  *
- * Cursor and overlay planes are optional. All drivers should provide one
- * primary plane per CRTC to avoid surprising userspace too much. See enum
- * drm_plane_type for a more in-depth discussion of these special uapi-relevant
- * plane types. Special planes are associated with their CRTC by calling
- * drm_crtc_init_with_planes().
- *
  * The type of a plane is exposed in the immutable "type" enumeration property,
- * which has one of the following values: "Overlay", "Primary", "Cursor".
+ * which has one of the following values: "Overlay", "Primary", "Cursor" (see
+ * enum drm_plane_type). A plane can be compatible with multiple CRTCs, see
+ * &drm_plane.possible_crtcs.
+ *
+ * Legacy uAPI doesn't expose the primary and cursor planes directly. DRM core
+ * relies on the driver to set the primary and optionally the cursor plane used
+ * for legacy IOCTLs. This is done by calling drm_crtc_init_with_planes(). All
+ * drivers should provide one primary plane per CRTC to avoid surprising legacy
+ * userspace too much.
  */
 
 static unsigned int drm_num_planes(struct drm_device *dev)
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
