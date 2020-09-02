Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4E525B5AB
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 23:09:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AF9D6E958;
	Wed,  2 Sep 2020 21:09:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E420D6E955
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 21:09:15 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id u20so403562pfn.0
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Sep 2020 14:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UGBNQb0GNFkXI1bXMdy3AT9MwgCVyDUj58E0cwgZ5QQ=;
 b=SpzOu0m3HXsg+ijFM97m9pQQy6Q74eXJ6XM1bSfb5RK9w6rwpziaGVFMFHUtrO445H
 rDmj911X7S0ASZikMUZgS3x+LL8Q4l7fd4toGVgUepe58Ols76DBuaqqCGSUgiosyhhQ
 k+VjTlHHzpm9GlZr5UNdnbBSnOLcTj50E9/xI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UGBNQb0GNFkXI1bXMdy3AT9MwgCVyDUj58E0cwgZ5QQ=;
 b=fqnjI6dok/MDRnHuVghkkCfTm1JWYUEbmOtb1T3rg6S720SN0CBNwgGz6kZIvE2iql
 vQlZlc38B1mzSU1OMhnQIQs9K1ctBa2xZMwTyo/Xdg5uJFA/9O3zv3ZMZPJGIY5r1E43
 3vJ+IV2ssZNDatL06fgS7pF2q3VJ3pWrFGoUKMdXGKuvzBcD+LL+WzJq7sFXbJqCtZDq
 TcZo6SesnqDVkbLMbjORfqZTYpGv6LoDNDjkTTczr7XPs+0YOYDpuAguh+7iIHGo9/Hf
 1GDLqVgxJoLFR+Txm1IvDSMJPccLqUytikVVPE1s3+AcrbBr6gpwOCRFJZDhMFnQtQRD
 UVkg==
X-Gm-Message-State: AOAM533L0ojVyuX4yQZgLezxV+k9HPFij9+Mf2xEvG+7t1foof/QrcYE
 OakZ/487Cb7/g0U48i7VuPiZI1JncNbQvA==
X-Google-Smtp-Source: ABdhPJyPSxnpyLtTNRF7uPmMxzQ28jwRpOkmifhpkAvOdUhGv4g506T+0Ury0ikTJZRa10boYuUZIw==
X-Received: by 2002:a63:1a23:: with SMTP id a35mr3267588pga.86.1599080955255; 
 Wed, 02 Sep 2020 14:09:15 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id m12sm301145pjd.35.2020.09.02.14.09.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2020 14:09:14 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Subject: [PATCH v2 17/23] drm/virtio: implement blob resources: hypercall
 interface
Date: Wed,  2 Sep 2020 14:08:41 -0700
Message-Id: <20200902210847.2689-18-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200902210847.2689-1-gurchetansingh@chromium.org>
References: <20200902210847.2689-1-gurchetansingh@chromium.org>
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
Cc: sebastien.boeuf@intel.com, kraxel@redhat.com, vgoyal@redhat.com,
 mst@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This implements the blob hypercall interface.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
Acked-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h | 15 +++++++
 drivers/gpu/drm/virtio/virtgpu_vq.c  | 65 ++++++++++++++++++++++++++++
 2 files changed, 80 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index c3094f54598f1..0ea1b3e48c5b5 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -35,6 +35,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_fb_helper.h>
+#include <drm/drm_fourcc.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_ioctl.h>
@@ -384,6 +385,20 @@ int virtio_gpu_cmd_map(struct virtio_gpu_device *vgdev,
 void virtio_gpu_cmd_unmap(struct virtio_gpu_device *vgdev,
 			  struct virtio_gpu_object *bo);
 
+void
+virtio_gpu_cmd_resource_create_blob(struct virtio_gpu_device *vgdev,
+				    struct virtio_gpu_object *bo,
+				    struct virtio_gpu_object_params *params,
+				    struct virtio_gpu_mem_entry *ents,
+				    uint32_t nents);
+void
+virtio_gpu_cmd_set_scanout_blob(struct virtio_gpu_device *vgdev,
+				uint32_t scanout_id,
+				struct virtio_gpu_object *bo,
+				struct drm_framebuffer *fb,
+				uint32_t width, uint32_t height,
+				uint32_t x, uint32_t y);
+
 /* virtgpu_display.c */
 void virtio_gpu_modeset_init(struct virtio_gpu_device *vgdev);
 void virtio_gpu_modeset_fini(struct virtio_gpu_device *vgdev);
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 15f9d0d9aa25c..b77d405e56b28 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -1232,3 +1232,68 @@ void virtio_gpu_cmd_unmap(struct virtio_gpu_device *vgdev,
 
 	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
 }
+
+void
+virtio_gpu_cmd_resource_create_blob(struct virtio_gpu_device *vgdev,
+				    struct virtio_gpu_object *bo,
+				    struct virtio_gpu_object_params *params,
+				    struct virtio_gpu_mem_entry *ents,
+				    uint32_t nents)
+{
+	struct virtio_gpu_resource_create_blob *cmd_p;
+	struct virtio_gpu_vbuffer *vbuf;
+
+	cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
+	memset(cmd_p, 0, sizeof(*cmd_p));
+
+	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_RESOURCE_CREATE_BLOB);
+	cmd_p->hdr.ctx_id = cpu_to_le32(params->ctx_id);
+	cmd_p->resource_id = cpu_to_le32(bo->hw_res_handle);
+	cmd_p->blob_mem = cpu_to_le32(params->blob_mem);
+	cmd_p->blob_flags = cpu_to_le32(params->blob_flags);
+	cmd_p->blob_id = cpu_to_le64(params->blob_id);
+	cmd_p->size = cpu_to_le64(params->size);
+	cmd_p->nr_entries = cpu_to_le32(nents);
+
+	vbuf->data_buf = ents;
+	vbuf->data_size = sizeof(*ents) * nents;
+
+	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
+	bo->created = true;
+}
+
+void virtio_gpu_cmd_set_scanout_blob(struct virtio_gpu_device *vgdev,
+				     uint32_t scanout_id,
+				     struct virtio_gpu_object *bo,
+				     struct drm_framebuffer *fb,
+				     uint32_t width, uint32_t height,
+				     uint32_t x, uint32_t y)
+{
+	uint32_t i;
+	struct virtio_gpu_set_scanout_blob *cmd_p;
+	struct virtio_gpu_vbuffer *vbuf;
+	uint32_t format = virtio_gpu_translate_format(fb->format->format);
+
+	cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
+	memset(cmd_p, 0, sizeof(*cmd_p));
+
+	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_SET_SCANOUT_BLOB);
+	cmd_p->resource_id = cpu_to_le32(bo->hw_res_handle);
+	cmd_p->scanout_id = cpu_to_le32(scanout_id);
+
+	cmd_p->format = cpu_to_le32(format);
+	cmd_p->width  = cpu_to_le32(fb->width);
+	cmd_p->height = cpu_to_le32(fb->height);
+
+	for (i = 0; i < 4; i++) {
+		cmd_p->strides[i] = cpu_to_le32(fb->pitches[i]);
+		cmd_p->offsets[i] = cpu_to_le32(fb->offsets[i]);
+	}
+
+	cmd_p->r.width = cpu_to_le32(width);
+	cmd_p->r.height = cpu_to_le32(height);
+	cmd_p->r.x = cpu_to_le32(x);
+	cmd_p->r.y = cpu_to_le32(y);
+
+	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
+}
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
