Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2186D53BBBE
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 17:43:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68845112FF5;
	Thu,  2 Jun 2022 15:43:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF606112FEF
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 15:43:01 +0000 (UTC)
Received: from vertex.vmware.com (pool-108-36-85-85.phlapa.fios.verizon.net
 [108.36.85.85]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id DD0C0335F74;
 Thu,  2 Jun 2022 16:42:59 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1654184580; bh=aNgM1bG6gCYOguM+hclLWxnZEtUIWi3csatRAcJHk0o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mbIq/2kuW9Ub7uwGeC1bZvG9o/yLdeC46um51EhFApSbrtUV04GdA3TiJLl3Cs4g3
 ePIjHdRT0U3I3bsp9onL8taoe6N2wWjWSJUwaBZKcY2M1nBzvlztn3lFDt+a1arXN5
 ygXvtRfMjWlGpSmiFpgzli9xnJ622PKisRFpkbDQ9OyPNNUBGdFo0gL969nigTSWei
 Yeejz0aUN1sGKj38K1TMFhaJHnzaiq0h0iZUwhVbmifaJdMpFRhj2d3Ji5IlltKZPf
 7eR658sd/n3/GMF5o1ZtrrKzDYbRAiz3t+ulY9UcYO5h3pTP47Z8Ulh7Kon9qwXJf1
 OxzhbbWt5913Q==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/6] drm/virtio: Create mouse hotspot properties on cursor
 planes
Date: Thu,  2 Jun 2022 11:42:42 -0400
Message-Id: <20220602154243.1015688-6-zack@kde.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602154243.1015688-1-zack@kde.org>
References: <20220602154243.1015688-1-zack@kde.org>
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
Cc: David Airlie <airlied@linux.ie>,
 Gurchetan Singh <gurchetansingh@chromium.org>, krastevm@vmware.com,
 mombasawalam@vmware.com, virtualization@lists.linux-foundation.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

Atomic modesetting got support for mouse hotspots via the hotspot
properties. Drivers need to create those properties on cursor planes
which require the mouse hotspot coordinates.

Add the code creating hotspot properties and port away from old legacy
hotspot API. The legacy hotspot paths have an implementation that works
with new atomic properties so there's no reason to keep them and it
makes sense to unify both paths.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: Chia-I Wu <olvaffe@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: virtualization@lists.linux-foundation.org
---
 drivers/gpu/drm/virtio/virtgpu_display.c | 1 +
 drivers/gpu/drm/virtio/virtgpu_plane.c   | 8 ++++----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
index f73352e7b832..848ac2314399 100644
--- a/drivers/gpu/drm/virtio/virtgpu_display.c
+++ b/drivers/gpu/drm/virtio/virtgpu_display.c
@@ -288,6 +288,7 @@ static int vgdev_output_init(struct virtio_gpu_device *vgdev, int index)
 
 	drm_connector_attach_encoder(connector, encoder);
 	drm_connector_register(connector);
+	drm_plane_create_hotspot_properties(cursor);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index 6d3cc9e238a4..21c8adf51c6c 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -331,16 +331,16 @@ static void virtio_gpu_cursor_plane_update(struct drm_plane *plane,
 		DRM_DEBUG("update, handle %d, pos +%d+%d, hot %d,%d\n", handle,
 			  plane->state->crtc_x,
 			  plane->state->crtc_y,
-			  plane->state->fb ? plane->state->fb->hot_x : 0,
-			  plane->state->fb ? plane->state->fb->hot_y : 0);
+			  plane->state->hotspot_x,
+			  plane->state->hotspot_y);
 		output->cursor.hdr.type =
 			cpu_to_le32(VIRTIO_GPU_CMD_UPDATE_CURSOR);
 		output->cursor.resource_id = cpu_to_le32(handle);
 		if (plane->state->fb) {
 			output->cursor.hot_x =
-				cpu_to_le32(plane->state->fb->hot_x);
+				cpu_to_le32(plane->state->hotspot_x);
 			output->cursor.hot_y =
-				cpu_to_le32(plane->state->fb->hot_y);
+				cpu_to_le32(plane->state->hotspot_y);
 		} else {
 			output->cursor.hot_x = cpu_to_le32(0);
 			output->cursor.hot_y = cpu_to_le32(0);
-- 
2.34.1

