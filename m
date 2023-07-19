Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5582758AF6
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 03:42:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D47210E3EE;
	Wed, 19 Jul 2023 01:42:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5140D10E0BF
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 01:42:36 +0000 (UTC)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net
 [173.49.113.140]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id DACA93262AE;
 Wed, 19 Jul 2023 02:42:33 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1689730955; bh=iQvjrZKG7Gf6CZI7WMDAMRzlaxfPXmiZ6Xef3UBB+ig=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XDlbLpbJl9DuvYiwfo3BDy8jDbqH23mvdH448erkpHYx71KVnSIiHAutP6woyQ/Sk
 /GAcBke8eeoGtEZT51ilpzCF1NJH0zJhooO84pf32uJYLIZN0vkogVhRo0wHLYtuRI
 wyUG3WpGUTAaJaAVj7ab9pfcVFCXDPctq1SZIsasZpOUbpybc+3sDP5V7sjx/jju4E
 qxsl/EcuyLokwASmq533G7t4MztGwZ7IEl42IEdWvc+5FfMigFXyvRh50k0PU77R/m
 zYdamXDIGGdbjGd8Yrvhl2Nl9teORaJx1Aczcz885jAqQCSvJxFIrSt8mDoOizUonX
 SpxGfdIcp+hug==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 6/9] drm/virtio: Use the hotspot properties from cursor
 planes
Date: Tue, 18 Jul 2023 21:42:15 -0400
Message-Id: <20230719014218.1700057-7-zack@kde.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230719014218.1700057-1-zack@kde.org>
References: <20230719014218.1700057-1-zack@kde.org>
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
Cc: David Airlie <airlied@linux.ie>, javierm@redhat.com, banackm@vmware.com,
 Gurchetan Singh <gurchetansingh@chromium.org>, krastevm@vmware.com,
 ppaalanen@gmail.com, iforbes@vmware.com,
 virtualization@lists.linux-foundation.org, mombasawalam@vmware.com,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

Atomic modesetting got support for mouse hotspots via the hotspot
properties. Port the legacy kms hotspot handling to the new properties
on cursor planes.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: Chia-I Wu <olvaffe@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: virtualization@lists.linux-foundation.org
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_plane.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index a2e045f3a000..20de599658c1 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -323,16 +323,16 @@ static void virtio_gpu_cursor_plane_update(struct drm_plane *plane,
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
2.39.2

