Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2478015376E
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 19:20:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D4A36F91E;
	Wed,  5 Feb 2020 18:20:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7664F6F91B
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2020 18:20:13 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id ep11so1326363pjb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Feb 2020 10:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qYN8uuCgeNU5326wK92cHEPLxRUKs1hPqvq5kfDZKdk=;
 b=Xd1d1mEx5qSxJj5YbXnXjzh+xCAdxUYK21QimdBk0IzeInKwqYMWo6CKTV3okYDHRz
 e3m4dcL96qb/S7WEgspc2b6cADL7JUTzMrF0E9eYSseRtRH2PaQI9CC124dpLkuSvKs0
 ReoGMVC3Asl+PmKG/Rcav1f+aY9YNhoqmUbMhG0l+lgWJESI47Xn7U3XkPYf+NlgcRdr
 dz/+PYCLFt8FwBywzVECL8gG6efCTFpoY+XGswRRKg10CDe24+5WuK3UbwsrhPxVZ0Q2
 3W/iEWsOWG9P+p13f6QOgdch1GvUg4en1aUZ2O4vUmRk4O/LLg1+QLmATs04RmegU21k
 6rpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qYN8uuCgeNU5326wK92cHEPLxRUKs1hPqvq5kfDZKdk=;
 b=CsXkp+SSZvs+CiHFq71B7iroRX5rOr3NIOJ7rJ3d34MCM7q0PIcMIkpbcMmHVOsxFB
 oUZeyuQXXbG7ManNqeRuoxEwQknVx0G2TNI2hMevSAXZkjoQlcqJRBGDz8O1fZ9SRVF0
 NSxeiszwqiweN3OkvzzHThDtXbi55ytLbiJ7aVqD09oeaDUI6Gk/gabVglIr0lDAnUiL
 2GGsmEearHp6zcO2aIkV/NkMN8TOEjuhoSfew78GMoMNeLIBmCe4XAcGNQQ+LVcSLZ7S
 Swq4dTzz5JZa80No+ivIlZe7crGarovdOHGRYfw1r8ZlBGbVshNLX5X1XOpjSODr5a5f
 KlYg==
X-Gm-Message-State: APjAAAW4UIkrf62Ok+o75/Cv3nz3jTytCluO9QBgy8ww5L7qE0y41/H8
 tLrp8DGbmLCuV4M36tcFDmSC/mQv
X-Google-Smtp-Source: APXvYqzRonbNCfuK99HlF4giR/WqqVVOfqLmA8TD4fKsRYUCJ+1rXAgrT34c0yOjHeVIy9IpSHRoeQ==
X-Received: by 2002:a17:90a:6545:: with SMTP id
 f5mr7265340pjs.42.1580926812661; 
 Wed, 05 Feb 2020 10:20:12 -0800 (PST)
Received: from olv0.mtv.corp.google.com
 ([2620:15c:202:201:9649:82d6:f889:b307])
 by smtp.gmail.com with ESMTPSA id h10sm158201pfo.181.2020.02.05.10.20.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 10:20:12 -0800 (PST)
From: Chia-I Wu <olvaffe@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 04/11] drm/virtio: no need to pass virtio_gpu_ctrl_hdr
Date: Wed,  5 Feb 2020 10:19:48 -0800
Message-Id: <20200205181955.202485-5-olvaffe@gmail.com>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200205181955.202485-1-olvaffe@gmail.com>
References: <20200205181955.202485-1-olvaffe@gmail.com>
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
Cc: kraxel@redhat.com, gurchetansingh@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We can get it from vbuf.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_vq.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 312fd8a039a1e..5815c7d50dc20 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -358,7 +358,6 @@ static bool virtio_gpu_queue_ctrl_buffer_locked(struct virtio_gpu_device *vgdev,
 
 static void virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
 						struct virtio_gpu_vbuffer *vbuf,
-						struct virtio_gpu_ctrl_hdr *hdr,
 						struct virtio_gpu_fence *fence)
 {
 	struct virtqueue *vq = vgdev->ctrlq.vq;
@@ -399,8 +398,9 @@ static void virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
 		goto again;
 	}
 
-	if (hdr && fence) {
-		virtio_gpu_fence_emit(vgdev, hdr, fence);
+	if (fence) {
+		virtio_gpu_fence_emit(vgdev, virtio_gpu_vbuf_ctrl_hdr(vbuf),
+				      fence);
 		if (vbuf->objs) {
 			virtio_gpu_array_add_fence(vbuf->objs, &fence->f);
 			virtio_gpu_array_unlock_resv(vbuf->objs);
@@ -439,7 +439,7 @@ void virtio_gpu_enable_notify(struct virtio_gpu_device *vgdev)
 static void virtio_gpu_queue_ctrl_buffer(struct virtio_gpu_device *vgdev,
 					 struct virtio_gpu_vbuffer *vbuf)
 {
-	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, NULL, NULL);
+	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, NULL);
 }
 
 static void virtio_gpu_queue_cursor(struct virtio_gpu_device *vgdev,
@@ -503,7 +503,7 @@ void virtio_gpu_cmd_create_resource(struct virtio_gpu_device *vgdev,
 	cmd_p->width = cpu_to_le32(params->width);
 	cmd_p->height = cpu_to_le32(params->height);
 
-	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, &cmd_p->hdr, fence);
+	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
 	bo->created = true;
 }
 
@@ -535,7 +535,7 @@ static void virtio_gpu_cmd_resource_inval_backing(struct virtio_gpu_device *vgde
 	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_RESOURCE_DETACH_BACKING);
 	cmd_p->resource_id = cpu_to_le32(resource_id);
 
-	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, &cmd_p->hdr, fence);
+	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
 }
 
 void virtio_gpu_cmd_set_scanout(struct virtio_gpu_device *vgdev,
@@ -610,7 +610,7 @@ void virtio_gpu_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
 	cmd_p->r.x = cpu_to_le32(x);
 	cmd_p->r.y = cpu_to_le32(y);
 
-	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, &cmd_p->hdr, fence);
+	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
 }
 
 static void
@@ -633,7 +633,7 @@ virtio_gpu_cmd_resource_attach_backing(struct virtio_gpu_device *vgdev,
 	vbuf->data_buf = ents;
 	vbuf->data_size = sizeof(*ents) * nents;
 
-	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, &cmd_p->hdr, fence);
+	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
 }
 
 static void virtio_gpu_cmd_get_display_info_cb(struct virtio_gpu_device *vgdev,
@@ -992,7 +992,7 @@ virtio_gpu_cmd_resource_create_3d(struct virtio_gpu_device *vgdev,
 	cmd_p->nr_samples = cpu_to_le32(params->nr_samples);
 	cmd_p->flags = cpu_to_le32(params->flags);
 
-	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, &cmd_p->hdr, fence);
+	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
 	bo->created = true;
 }
 
@@ -1025,7 +1025,7 @@ void virtio_gpu_cmd_transfer_to_host_3d(struct virtio_gpu_device *vgdev,
 	cmd_p->offset = cpu_to_le64(offset);
 	cmd_p->level = cpu_to_le32(level);
 
-	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, &cmd_p->hdr, fence);
+	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
 }
 
 void virtio_gpu_cmd_transfer_from_host_3d(struct virtio_gpu_device *vgdev,
@@ -1051,7 +1051,7 @@ void virtio_gpu_cmd_transfer_from_host_3d(struct virtio_gpu_device *vgdev,
 	cmd_p->offset = cpu_to_le64(offset);
 	cmd_p->level = cpu_to_le32(level);
 
-	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, &cmd_p->hdr, fence);
+	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
 }
 
 void virtio_gpu_cmd_submit(struct virtio_gpu_device *vgdev,
@@ -1074,7 +1074,7 @@ void virtio_gpu_cmd_submit(struct virtio_gpu_device *vgdev,
 	cmd_p->hdr.ctx_id = cpu_to_le32(ctx_id);
 	cmd_p->size = cpu_to_le32(data_size);
 
-	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, &cmd_p->hdr, fence);
+	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
 }
 
 int virtio_gpu_object_attach(struct virtio_gpu_device *vgdev,
-- 
2.25.0.341.g760bfbb309-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
