Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C67915D7C5
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 13:55:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D4856F91B;
	Fri, 14 Feb 2020 12:55:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FD3F6F916
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 12:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581684945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:in-reply-to:in-reply-to:references:references;
 bh=giEf11DZms2r+0/17f8qjLc7eTe41xG8fjSviW9UmAQ=;
 b=hn0CTHT/6qIC9fvTLWpvuyXQm+3xAn9tkExZPS2ZhCBUfs7cy18QoB5dYYvzd64aUmVMDi
 6FpXmiKWzcVDG6Pzpv01L1B3ij/cnhB4P/JTikJRBj4KYeGGFSZLIt9Nk7+03+wEplL76v
 fRcgn34vfknnrLCqfkgJPIGgE/XYgvg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-112-QKlsCEfKMnKJ7wrSZ2e7zQ-1; Fri, 14 Feb 2020 07:55:41 -0500
X-MC-Unique: QKlsCEfKMnKJ7wrSZ2e7zQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CAA9C107ACCC;
 Fri, 14 Feb 2020 12:55:39 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-39.ams2.redhat.com
 [10.36.117.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6F3AC1001B2D;
 Fri, 14 Feb 2020 12:55:36 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B839C5B48; Fri, 14 Feb 2020 13:55:35 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 3/6] drm/virtio: batch plane updates (pageflip)
Date: Fri, 14 Feb 2020 13:55:32 +0100
Message-Id: <20200214125535.26349-4-kraxel@redhat.com>
In-Reply-To: <20200214125535.26349-1-kraxel@redhat.com>
References: <20200214125535.26349-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Gerd Hoffmann <kraxel@redhat.com>, gurchetansingh@chromium.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move virtio_gpu_notify() to higher-level functions for
virtio_gpu_cmd_resource_flush(), virtio_gpu_cmd_set_scanout() and
virtio_gpu_cmd_transfer_to_host_{2d,3d}().

virtio_gpu_primary_plane_update() will notify only once for a series
of commands (restores plane update command batching).

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_display.c | 2 ++
 drivers/gpu/drm/virtio/virtgpu_ioctl.c   | 1 +
 drivers/gpu/drm/virtio/virtgpu_plane.c   | 3 +++
 drivers/gpu/drm/virtio/virtgpu_vq.c      | 4 ----
 4 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
index af953db4a0c9..2b7e6ae65546 100644
--- a/drivers/gpu/drm/virtio/virtgpu_display.c
+++ b/drivers/gpu/drm/virtio/virtgpu_display.c
@@ -90,6 +90,7 @@ static void virtio_gpu_crtc_mode_set_nofb(struct drm_crtc *crtc)
 	virtio_gpu_cmd_set_scanout(vgdev, output->index, 0,
 				   crtc->mode.hdisplay,
 				   crtc->mode.vdisplay, 0, 0);
+	virtio_gpu_notify(vgdev);
 }
 
 static void virtio_gpu_crtc_atomic_enable(struct drm_crtc *crtc,
@@ -108,6 +109,7 @@ static void virtio_gpu_crtc_atomic_disable(struct drm_crtc *crtc,
 	struct virtio_gpu_output *output = drm_crtc_to_virtio_gpu_output(crtc);
 
 	virtio_gpu_cmd_set_scanout(vgdev, output->index, 0, 0, 0, 0, 0);
+	virtio_gpu_notify(vgdev);
 	output->enabled = false;
 }
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 0477d1250f2d..467649733d24 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -359,6 +359,7 @@ static int virtio_gpu_transfer_to_host_ioctl(struct drm_device *dev, void *data,
 			 args->level, &args->box, objs, fence);
 		dma_fence_put(&fence->f);
 	}
+	virtio_gpu_notify(vgdev);
 	return 0;
 
 err_unlock:
diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index 08b2e4127eb3..52d24179bcec 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -148,6 +148,7 @@ static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
 					   plane->state->src_w >> 16,
 					   plane->state->src_h >> 16,
 					   0, 0);
+		virtio_gpu_notify(vgdev);
 		return;
 	}
 
@@ -184,6 +185,7 @@ static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
 				      rect.y1,
 				      rect.x2 - rect.x1,
 				      rect.y2 - rect.y1);
+	virtio_gpu_notify(vgdev);
 }
 
 static int virtio_gpu_cursor_prepare_fb(struct drm_plane *plane,
@@ -262,6 +264,7 @@ static void virtio_gpu_cursor_plane_update(struct drm_plane *plane,
 			 plane->state->crtc_w,
 			 plane->state->crtc_h,
 			 0, 0, objs, vgfb->fence);
+		virtio_gpu_notify(vgdev);
 		dma_fence_wait(&vgfb->fence->f, true);
 		dma_fence_put(&vgfb->fence->f);
 		vgfb->fence = NULL;
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 653efb26bcd9..0bd1c51bbabd 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -568,7 +568,6 @@ void virtio_gpu_cmd_set_scanout(struct virtio_gpu_device *vgdev,
 	cmd_p->r.y = cpu_to_le32(y);
 
 	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
-	virtio_gpu_notify(vgdev);
 }
 
 void virtio_gpu_cmd_resource_flush(struct virtio_gpu_device *vgdev,
@@ -590,7 +589,6 @@ void virtio_gpu_cmd_resource_flush(struct virtio_gpu_device *vgdev,
 	cmd_p->r.y = cpu_to_le32(y);
 
 	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
-	virtio_gpu_notify(vgdev);
 }
 
 void virtio_gpu_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
@@ -623,7 +621,6 @@ void virtio_gpu_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
 	cmd_p->r.y = cpu_to_le32(y);
 
 	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
-	virtio_gpu_notify(vgdev);
 }
 
 static void
@@ -1049,7 +1046,6 @@ void virtio_gpu_cmd_transfer_to_host_3d(struct virtio_gpu_device *vgdev,
 	cmd_p->level = cpu_to_le32(level);
 
 	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
-	virtio_gpu_notify(vgdev);
 }
 
 void virtio_gpu_cmd_transfer_from_host_3d(struct virtio_gpu_device *vgdev,
-- 
2.18.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
