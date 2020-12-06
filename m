Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FBE2D05FE
	for <lists+dri-devel@lfdr.de>; Sun,  6 Dec 2020 17:34:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38E1F89F85;
	Sun,  6 Dec 2020 16:34:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 120EC89F85
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Dec 2020 16:34:25 +0000 (UTC)
Date: Sun, 06 Dec 2020 16:34:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1607272463;
 bh=MH2ePDo+LNCnXCg9Q0J2xnOS7uY2VV3+MF8bj9dKQpk=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=h76cpuancoPghjZgmPJIDq/8+NLWR9D/TwyYwQn2xismhG9rN+9erRqYwsz+E0BRE
 m+RbwyaUEdeYq/JC8nNYM15/2l1lnZeEIsQpOr4I9bNGb8l1K8ikmNuuiIi4yAApWt
 UVVF4bPM0vPC6N2S1QMd2dcm6PSMUkdz5+3vT0kugHc7fN6Pu60b6Esihg20sXWykZ
 ZFzkcZbTi9dCrh5vyk5Scm+YCd9hql8iNGAseTh9TZoQGI6pq1cEgHBSTK65K54Yyo
 9Qqbwwtto7VEuKI+VigC9RZfI1YXyf0bjHOnqakiM2Mhz6JvLy7bNrasCVxrkSTAnE
 i3Gzo8jvxh1sg==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH] drm: rework description of primary and cursor planes
Message-ID: <wrDqxEGdxtotWKrfQH8W8tl2Z8JgdHzUs3wuTth4@cp4-web-027.plabs.ch>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
---
 drivers/gpu/drm/drm_crtc.c  |  3 +++
 drivers/gpu/drm/drm_plane.c | 16 +++++++++-------
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index 74090fc3aa55..c71b134d663a 100644
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
index e6231947f987..7a5697bc9e04 100644
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
