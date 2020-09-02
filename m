Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A45C925B5AD
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 23:09:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A60B76E95A;
	Wed,  2 Sep 2020 21:09:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D0146E95A
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 21:09:20 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id l191so333847pgd.5
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Sep 2020 14:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zIuwn+y+zW+phql/ZV2Gpurn27Z6uVmBN03BClfM+pQ=;
 b=S+OoXnL+TRizqJ8pJ+JwMU7gGI1EMHspDOulnU4EXAj1Yzdp+//ILXCMmph1kjnhvs
 K8axMtdWG94OkIc3BkRvpj1Lqeow3+UlmeNvxQFgUMnS18Ub1u6vH+4p551XvRPfM+Si
 g/9jz3AgyM65AEbTsi8oZb4ZpNtqIJ7FaLgLU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zIuwn+y+zW+phql/ZV2Gpurn27Z6uVmBN03BClfM+pQ=;
 b=ZZwglqgjNUuJ0ucY1dwLDUBQEos5oshra0ofHGTAGIGMYWZJuMyDfSP010w+Osm980
 5lxmL9ewRnvKP9Ttz+vg/HQ+IzikXlhpqAeYsy2U5g8g6gwIrXzwM8KkY7CQL2C59Dq1
 hkxZsbmOy6HGwvr/P60vT3+uYT/sXAKu6fHZmcwhmvrnz+8p7jIxZddacnGyuxWgI1OW
 RZGADJ/5unvp3OZzckUm05y4LD2cyjNfIxUOXGBEIjciiSvJP8fgWJE/cXJBA+R0vOWk
 X7/xuRp8NMFaOAKJ6FOmbuSoCMZP1Zm/ciOrUCiNdtwPdlJA7bdnS4mpsRjFtK9PlrAg
 cGYw==
X-Gm-Message-State: AOAM532PvpbMmGh3Ssuo8zyUtKZYimqGT7FHeB7Rsacaan70qBvlR6Xs
 YxGNUy3ezZ7c2/4b0wS0aKdffb/no/zGCw==
X-Google-Smtp-Source: ABdhPJzzv5j8Mdu5oV0AIbfrR3MY+wCvCflwpi0rdVviSsafMC0D9hv8Fs0//PglKtQ0+JpIC70bpQ==
X-Received: by 2002:a63:470b:: with SMTP id u11mr3407014pga.46.1599080959460; 
 Wed, 02 Sep 2020 14:09:19 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id m12sm301145pjd.35.2020.09.02.14.09.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2020 14:09:18 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Subject: [PATCH v2 19/23] drm/virtio: implement blob resources: refactor UUID
 code somewhat
Date: Wed,  2 Sep 2020 14:08:43 -0700
Message-Id: <20200902210847.2689-20-gurchetansingh@chromium.org>
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

For upcoming blob resources, userspace can specify that the
resource will be used for cross-device sharing. This is mainly
for exportable blobs that will only shared with the virtgpu
display but not across devices.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
Acked-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h   |  2 ++
 drivers/gpu/drm/virtio/virtgpu_prime.c | 42 ++++++++++++++++++--------
 2 files changed, 31 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 0ea1b3e48c5b5..689297e1fff87 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -432,6 +432,8 @@ bool virtio_gpu_is_shmem(struct virtio_gpu_object *bo);
 int virtio_gpu_resource_id_get(struct virtio_gpu_device *vgdev,
 			       uint32_t *resid);
 /* virtgpu_prime.c */
+int virtio_gpu_resource_assign_uuid(struct virtio_gpu_device *vgdev,
+				    struct virtio_gpu_object *bo);
 struct dma_buf *virtgpu_gem_prime_export(struct drm_gem_object *obj,
 					 int flags);
 struct drm_gem_object *virtgpu_gem_prime_import(struct drm_device *dev,
diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
index 3552db128ba3d..1ef1e2f226333 100644
--- a/drivers/gpu/drm/virtio/virtgpu_prime.c
+++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
@@ -59,6 +59,24 @@ const struct virtio_dma_buf_ops virtgpu_dmabuf_ops =  {
 	.get_uuid = virtgpu_virtio_get_uuid,
 };
 
+int virtio_gpu_resource_assign_uuid(struct virtio_gpu_device *vgdev,
+				    struct virtio_gpu_object *bo)
+{
+	int ret;
+	struct virtio_gpu_object_array *objs;
+
+	objs = virtio_gpu_array_alloc(1);
+	if (!objs)
+		return -ENOMEM;
+
+	virtio_gpu_array_add_obj(objs, &bo->base.base);
+	ret = virtio_gpu_cmd_resource_assign_uuid(vgdev, objs);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 struct dma_buf *virtgpu_gem_prime_export(struct drm_gem_object *obj,
 					 int flags)
 {
@@ -66,22 +84,20 @@ struct dma_buf *virtgpu_gem_prime_export(struct drm_gem_object *obj,
 	struct drm_device *dev = obj->dev;
 	struct virtio_gpu_device *vgdev = dev->dev_private;
 	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
-	struct virtio_gpu_object_array *objs;
 	int ret = 0;
+	bool blob = bo->host3d_blob || bo->guest_blob;
 	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
 
-	if (vgdev->has_resource_assign_uuid) {
-		objs = virtio_gpu_array_alloc(1);
-		if (!objs)
-			return ERR_PTR(-ENOMEM);
-		virtio_gpu_array_add_obj(objs, &bo->base.base);
-
-		ret = virtio_gpu_cmd_resource_assign_uuid(vgdev, objs);
-		if (ret)
-			return ERR_PTR(ret);
-		virtio_gpu_notify(vgdev);
-	} else {
-		bo->uuid_state = STATE_ERR;
+	if (!blob) {
+		if (vgdev->has_resource_assign_uuid) {
+			ret = virtio_gpu_resource_assign_uuid(vgdev, bo);
+			if (ret)
+				return ERR_PTR(ret);
+
+			virtio_gpu_notify(vgdev);
+		} else {
+			bo->uuid_state = STATE_ERR;
+		}
 	}
 
 	exp_info.ops = &virtgpu_dmabuf_ops.ops;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
