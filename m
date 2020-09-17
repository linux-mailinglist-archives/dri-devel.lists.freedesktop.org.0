Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCD326CFCD
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 02:09:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 287B36EB57;
	Thu, 17 Sep 2020 00:09:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C25CF6EB57
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 00:08:54 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id n14so71336pff.6
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 17:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bfig8TwqH9ydH1ryVe4vBcf/KpLkukv15QWltbsF2CU=;
 b=YMBYdBGaWSSNvrIU+ywRSdzaszH7GMkGPLmHbzdhYZ3uXXUr4/fZcyqAKJHhqicZJY
 dcse0rOo9pevmbO9/3nRDPyVmidymCEIJFQIz22c9rM99QuxUlx6oV/1UC3MrwcNoQxe
 h7Rk/UEuPBCamT14MTIVTzWc1V/7Q17ul9h+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bfig8TwqH9ydH1ryVe4vBcf/KpLkukv15QWltbsF2CU=;
 b=nF79330ys5HyLo1EwsErx4klFjy7+MvTlZwRHvSbTt4PUBU06MqBeV/FpSQOJ7g+AF
 zkEs2SxYAsLAUowus4LGvAieZt/9m1H6Pcov+Wh0zxFfQQx9/bfbT+jv9NvX4Vhb+P31
 1fVVr1V7kqCKP1wwI3F1sZDNwlbxhhD1g/gU4CSLB3ckBvfshIBaGwsSEluKXkoD71+z
 YpYOcfpf+dAhEsU01cliRlJlb0ZeJGw/s7qgQnjck8ksL8au4QgTkQtXen/QRIOXjp8r
 8SUDkVlZPHRcPy6NX8ZZh2ITlA/qYSqDp1xy1fwuZbdVe+WI4SlD1XxpFUpl4Eg9rGv1
 TBNg==
X-Gm-Message-State: AOAM531k0qlOcYtYnIQqRznUrD3QpgwDd1dUplp5d1s3Axm7pZLYA3YA
 vB6DDvULIA2U7ucfdSYCdmxM23BHaSAD7w==
X-Google-Smtp-Source: ABdhPJzkYG2wFAa0hvh2vSFnYi/OJ8xszG9xGKkiciXIDnYe4+/S6CPak9/yf7wIMd7yxP2WfYdZsg==
X-Received: by 2002:a62:26c1:0:b029:142:2501:35ef with SMTP id
 m184-20020a6226c10000b0290142250135efmr8317129pfm.79.1600301333826; 
 Wed, 16 Sep 2020 17:08:53 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id o19sm13737917pfp.64.2020.09.16.17.08.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 17:08:53 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 13/19] drm/virtio: implement blob resources: hypercall
 interface
Date: Wed, 16 Sep 2020 17:08:32 -0700
Message-Id: <20200917000838.735-13-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200917000838.735-1-gurchetansingh@chromium.org>
References: <20200917000838.735-1-gurchetansingh@chromium.org>
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
Cc: kraxel@redhat.com
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
index 7c9cf6960a92f..e1143a00017c5 100644
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
 int virtio_gpu_modeset_init(struct virtio_gpu_device *vgdev);
 void virtio_gpu_modeset_fini(struct virtio_gpu_device *vgdev);
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 41fd253d357ed..e71c8eec0b914 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -1237,3 +1237,68 @@ void virtio_gpu_cmd_unmap(struct virtio_gpu_device *vgdev,
 
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
