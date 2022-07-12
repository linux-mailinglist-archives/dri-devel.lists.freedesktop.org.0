Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4CC5710E7
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 05:33:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0043810F78A;
	Tue, 12 Jul 2022 03:33:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FF5B10F59F
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 03:33:09 +0000 (UTC)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net
 [173.49.113.140]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id C681C321FEA;
 Tue, 12 Jul 2022 04:33:06 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1657596787; bh=nJ6Dv+WHZdyb+xgHM2HRIfq3XOCmobje5aEZQpRoYM4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JaFpvgSI4hWjCeHRSrDxUxPlDZuf3+mKOHSZeM9UrqA/+rzuaquZzmtlYZhhEwVc0
 BMIibRX/FfaOGHdUXhGA68oW9zuhQgw9Disy7cIzJXNqdwdbsbqv/pIlwKaRoZ/i5g
 RLYsuCRhpzq9EtHmJWkLC+pgYorcstYt6olWT/zOY1w6KvPt5KvGgrwtqUKNpdDcRW
 J+iOlZ2Bf7c86NahwtTqG09lHJyHDJfg/bbjWFJs3vgyWattqf+nj3IFvstLHRnmAj
 chfot9xyWq4qN9IcVky8vX/SQAjYdJVaQH2vZctXui2O6fyioUdhm91PEwulLZ6MWD
 1duy9ZaZTlU0A==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 6/8] drm/virtio: Use the hotspot properties from cursor
 planes
Date: Mon, 11 Jul 2022 23:32:44 -0400
Message-Id: <20220712033246.1148476-7-zack@kde.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220712033246.1148476-1-zack@kde.org>
References: <20220712033246.1148476-1-zack@kde.org>
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
 ppaalanen@gmail.com, mombasawalam@vmware.com,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

Atomic modesetting got support for mouse hotspots via the hotspot
properties. Port the legacy kms hotspot handling to the new properties
on cursor planes.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: Chia-I Wu <olvaffe@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: virtualization@lists.linux-foundation.org
---
 drivers/gpu/drm/virtio/virtgpu_plane.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

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

