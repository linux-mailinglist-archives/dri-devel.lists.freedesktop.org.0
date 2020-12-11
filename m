Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB26B2D7635
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 14:06:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11D8A6EDDB;
	Fri, 11 Dec 2020 13:06:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29E8A6EDDB
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 13:06:16 +0000 (UTC)
Date: Fri, 11 Dec 2020 13:06:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1607691973;
 bh=dd1uKUE/I9vhhZdufmVMrR2Fh4xgpBw+W/jGQNNb3mo=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=fxG/d7wgvKBDLr+KBFsKFgHQ4zJaTMQ0b8iF90RAXN7bjF3MZ+OQtEJ+YUdFGVyw+
 /O+jvXuac0t6gKuBZDqUgS8RVeDNxbgB3Q20K6NgQ3NXWVLr6WZ6MXXgIJafWpOJ4Z
 6jhotoU0VFUSru1YtM/11aOVhv33Lc4W46tu6EKjKgxStE8+oNTg0I16hpzi5xSJVb
 sng0rmsYaFOJpuggsPqGkcbNjDAT4QLmADnDwtJHzB4k8c/jH61QrW33fffeTfyZjO
 Y5GHUFy6htxveS3BCb3QE/UUg76W9y7hLQ4TIfohuqcKhETZDiIRRKXoG5dNf8IrTe
 ARHBlNyKlrhCg==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH v3 1/4] drm: rework description of primary and cursor planes
Message-ID: <UhmKVQqbhh0wI7qwEAFiRxDcZqKRrmcoBTBF6rg@cp7-web-043.plabs.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Pekka Paalanen <ppaalanen@gmail.com>
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
