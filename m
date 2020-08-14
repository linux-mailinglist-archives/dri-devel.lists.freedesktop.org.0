Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC0E244322
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 04:40:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1694A6EAD0;
	Fri, 14 Aug 2020 02:40:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF1EC6EAD2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 02:40:25 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id g7so2389490plq.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 19:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a87L+NGMGvlobazdtHSS/YGB+bynScq3ceCMJ6Snf8c=;
 b=cmYbUW5gg+jc2l9ynvjf2IAk1mkz7Gv9sLPnpqk2s7/QJD/hlWtVSi9VP9cnldA5qG
 yplGhEUt7inoo9gtO/KOfWMAVtMn8sPhD7jLtxvUJSqv2vt4ZK9loJXjPT71toO//mKU
 JxbmG5b6//3IPDdgBppz9DB5dLuKHds2LGMU0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a87L+NGMGvlobazdtHSS/YGB+bynScq3ceCMJ6Snf8c=;
 b=jEQIxz6CDcTQMCUc/LiUHHpWnNoot5pT2iFSRwOdrS+S1L2uYAs+x3wTd87UY6F0YF
 flLa0ij+yCvNQrDc/e5EndB+1tIJpmtchadbJU3GPgqAeVOydYk2mg9G/OQRmnZLBLg1
 Fu6HKNyDfURUZjj2+267Mi3CKlc2P9UTL4Gh3dL6oQpuvr3E5vuCaRJMKyAKcsxTQvK8
 nVdAwPHZZA0obGZoMGComo/Fl6OqVc4ow5US+gT5RtdWh7/mvGvCIS6h1Nj4GyK4SFpA
 qO1ZI8FJndzb2+07RrC1/2Bgf3ot3D+qyrSO41gdS+vMpPsY6MIiM0uK0Yd64SOZzlWI
 2P8Q==
X-Gm-Message-State: AOAM533i8IXgiDdkU05Gbs8806/BpFT/UvIlC3/+5clrHVbRQnJ6/EWH
 mv/CZjbNZV2xdzKLQeJiJC1tCpTAwVawkg==
X-Google-Smtp-Source: ABdhPJx+f5yiqsiWnJmUzaQT3Fr4nxFHdTdSk40fsIOV/U7LWcjaGd45Z5eFedV9oDz9nMN04PK5lg==
X-Received: by 2002:a17:90a:dac5:: with SMTP id g5mr504438pjx.5.1597372825241; 
 Thu, 13 Aug 2020 19:40:25 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id m26sm7103539pfe.184.2020.08.13.19.40.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 13 Aug 2020 19:40:24 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Subject: [PATCH 18/24] drm/virtio: implement blob resources: hypercall
 interface
Date: Thu, 13 Aug 2020 19:39:54 -0700
Message-Id: <20200814024000.2485-19-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200814024000.2485-1-gurchetansingh@chromium.org>
References: <20200814024000.2485-1-gurchetansingh@chromium.org>
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
index 61f57b04525b..fe9bb95a408b 100644
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
@@ -382,6 +383,20 @@ int virtio_gpu_cmd_map(struct virtio_gpu_device *vgdev,
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
index 09db56c69424..de4356a183d2 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -1228,3 +1228,68 @@ void virtio_gpu_cmd_unmap(struct virtio_gpu_device *vgdev,
 
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
+		cmd_p->offsets[i] = cpu_to_le64(fb->offsets[i]);
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
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
