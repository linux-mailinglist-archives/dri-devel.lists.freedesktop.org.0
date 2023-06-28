Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AB474093B
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jun 2023 07:21:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0CF110E351;
	Wed, 28 Jun 2023 05:21:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55EC810E0C4;
 Wed, 28 Jun 2023 05:21:47 +0000 (UTC)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net
 [173.49.113.140]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id EB8EA323D20;
 Wed, 28 Jun 2023 06:21:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1687929706; bh=ZGcUVYjIoiZW6JFtG3Kd8DosycRTXghYUs6U+JfUpo0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ce94b8s0iGl9NuE7ZUKwKdg+0LN7QIJVpnl9exuk6Ei3yVBE6SrcVN1gHiWsR3TDU
 j+JxRvKfT947KkYzmqkc93MDCW/A0yPgWPwX4+Jp7v5L1gxlRr0B3U8oXLjKaG0fu1
 qzEG7HMMLkF/TWie9iYyfxSHkt1iDMUD2G3rqZAHmWJyRF8/xyICXOyxCgu9iuKHsM
 brCBqIV1tjpiWEOZ1QK6dT4uPrmJPWUUF+PtGlzV+z+qhJfJ1lx/Uy3vR6/ncm8qGA
 vUntC7iiU4e7j0/fMn2buPFvtPgY57CzNzg89/34gb1zjziZQOPPv6F2Hq6cN4KPpV
 ITNzXmaVUL+Fw==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 1/8] drm: Disable the cursor plane on atomic contexts with
 virtualized drivers
Date: Wed, 28 Jun 2023 01:21:26 -0400
Message-Id: <20230628052133.553154-2-zack@kde.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230628052133.553154-1-zack@kde.org>
References: <20230628052133.553154-1-zack@kde.org>
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
Reply-To: Zack Rusin <zackr@vmware.com>
Cc: David Airlie <airlied@linux.ie>, banackm@vmware.com,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, mombasawalam@vmware.com, javierm@redhat.com,
 spice-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Maxime Ripard <mripard@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 ppaalanen@gmail.com, Dave Airlie <airlied@redhat.com>, iforbes@vmware.com,
 Pekka Paalanen <pekka.paalanen@collabora.com>, stable@vger.kernel.org,
 krastevm@vmware.com, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

Cursor planes on virtualized drivers have special meaning and require
that the clients handle them in specific ways, e.g. the cursor plane
should react to the mouse movement the way a mouse cursor would be
expected to and the client is required to set hotspot properties on it
in order for the mouse events to be routed correctly.

This breaks the contract as specified by the "universal planes". Fix it
by disabling the cursor planes on virtualized drivers while adding
a foundation on top of which it's possible to special case mouse cursor
planes for clients that want it.

Disabling the cursor planes makes some kms compositors which were broken,
e.g. Weston, fallback to software cursor which works fine or at least
better than currently while having no effect on others, e.g. gnome-shell
or kwin, which put virtualized drivers on a deny-list when running in
atomic context to make them fallback to legacy kms and avoid this issue.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Fixes: 681e7ec73044 ("drm: Allow userspace to ask for universal plane list (v2)")
Cc: <stable@vger.kernel.org> # v5.4+
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: Chia-I Wu <olvaffe@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: virtualization@lists.linux-foundation.org
Cc: spice-devel@lists.freedesktop.org
Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/drm_plane.c          | 13 +++++++++++++
 drivers/gpu/drm/qxl/qxl_drv.c        |  2 +-
 drivers/gpu/drm/vboxvideo/vbox_drv.c |  2 +-
 drivers/gpu/drm/virtio/virtgpu_drv.c |  3 ++-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c  |  2 +-
 include/drm/drm_drv.h                |  9 +++++++++
 include/drm/drm_file.h               | 12 ++++++++++++
 7 files changed, 39 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 24e7998d1731..c6bbb0c209f4 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -678,6 +678,19 @@ int drm_mode_getplane_res(struct drm_device *dev, void *data,
 		    !file_priv->universal_planes)
 			continue;
 
+		/*
+		 * If we're running on a virtualized driver then,
+		 * unless userspace advertizes support for the
+		 * virtualized cursor plane, disable cursor planes
+		 * because they'll be broken due to missing cursor
+		 * hotspot info.
+		 */
+		if (plane->type == DRM_PLANE_TYPE_CURSOR &&
+		    drm_core_check_feature(dev, DRIVER_CURSOR_HOTSPOT) &&
+		    file_priv->atomic &&
+		    !file_priv->supports_virtualized_cursor_plane)
+			continue;
+
 		if (drm_lease_held(file_priv, plane->base.id)) {
 			if (count < plane_resp->count_planes &&
 			    put_user(plane->base.id, plane_ptr + count))
diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
index b30ede1cf62d..91930e84a9cd 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.c
+++ b/drivers/gpu/drm/qxl/qxl_drv.c
@@ -283,7 +283,7 @@ static const struct drm_ioctl_desc qxl_ioctls[] = {
 };
 
 static struct drm_driver qxl_driver = {
-	.driver_features = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
+	.driver_features = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC | DRIVER_CURSOR_HOTSPOT,
 
 	.dumb_create = qxl_mode_dumb_create,
 	.dumb_map_offset = drm_gem_ttm_dumb_map_offset,
diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.c b/drivers/gpu/drm/vboxvideo/vbox_drv.c
index 4fee15c97c34..8ecd0863fad7 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_drv.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_drv.c
@@ -172,7 +172,7 @@ DEFINE_DRM_GEM_FOPS(vbox_fops);
 
 static const struct drm_driver driver = {
 	.driver_features =
-	    DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
+	    DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC | DRIVER_CURSOR_HOTSPOT,
 
 	.fops = &vbox_fops,
 	.name = DRIVER_NAME,
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index a7ec5a3770da..60b1fd23229c 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -176,7 +176,8 @@ static const struct drm_driver driver = {
 	 * If KMS is disabled DRIVER_MODESET and DRIVER_ATOMIC are masked
 	 * out via drm_device::driver_features:
 	 */
-	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_RENDER | DRIVER_ATOMIC,
+	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_RENDER | DRIVER_ATOMIC |
+			   DRIVER_CURSOR_HOTSPOT,
 	.open = virtio_gpu_driver_open,
 	.postclose = virtio_gpu_driver_postclose,
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 8b24ecf60e3e..d3e308fdfd5b 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -1611,7 +1611,7 @@ static const struct file_operations vmwgfx_driver_fops = {
 
 static const struct drm_driver driver = {
 	.driver_features =
-	DRIVER_MODESET | DRIVER_RENDER | DRIVER_ATOMIC | DRIVER_GEM,
+	DRIVER_MODESET | DRIVER_RENDER | DRIVER_ATOMIC | DRIVER_GEM | DRIVER_CURSOR_HOTSPOT,
 	.ioctls = vmw_ioctls,
 	.num_ioctls = ARRAY_SIZE(vmw_ioctls),
 	.master_set = vmw_master_set,
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index b77f2c7275b7..8303016665dd 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -104,6 +104,15 @@ enum drm_driver_feature {
 	 * acceleration should be handled by two drivers that are connected using auxiliary bus.
 	 */
 	DRIVER_COMPUTE_ACCEL            = BIT(7),
+	/**
+	 * @DRIVER_CURSOR_HOTSPOT:
+	 *
+	 * Driver supports and requires cursor hotspot information in the
+	 * cursor plane (e.g. cursor plane has to actually track the mouse
+	 * cursor and the clients are required to set hotspot in order for
+	 * the cursor planes to work correctly).
+	 */
+	DRIVER_CURSOR_HOTSPOT           = BIT(8),
 
 	/* IMPORTANT: Below are all the legacy flags, add new ones above. */
 
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index 966912053cb0..91cf7f452f86 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -228,6 +228,18 @@ struct drm_file {
 	 */
 	bool is_master;
 
+	/**
+	 * @supports_virtualized_cursor_plane:
+	 *
+	 * This client is capable of handling the cursor plane with the
+	 * restrictions imposed on it by the virtualized drivers.
+	 *
+	 * This implies that the cursor plane has to behave like a cursor
+	 * i.e. track cursor movement. It also requires setting of the
+	 * hotspot properties by the client on the cursor plane.
+	 */
+	bool supports_virtualized_cursor_plane;
+
 	/**
 	 * @master:
 	 *
-- 
2.39.2

