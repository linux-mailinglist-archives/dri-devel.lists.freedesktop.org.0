Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 302AB276521
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 02:32:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D78C6EA2C;
	Thu, 24 Sep 2020 00:32:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ABD06EA1F
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 00:32:32 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id f1so642507plo.13
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 17:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8mXNSXYut9HcAcT3m1n94YKqL04blq1VBP+Feila5hE=;
 b=TwpdAJomkAt0oX9wene/nHkhXEI09INgd1lJ7Uo/QA8x+MrRP0gY61vHXG75nwnXWS
 DXh3GclpaqKNTsv4wJD5D9oGPaL/8mboQHTuQqzvceJ4MBL6hXYnttgnq95uUTaiDzLJ
 U2l+EHhW0/FCVS17TIlh9J933r6rCiPGeNeAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8mXNSXYut9HcAcT3m1n94YKqL04blq1VBP+Feila5hE=;
 b=ewwcuqcwceIOz9fryAZT9EkWAFr/h7cR0yVnywS889Opzfq6uL0WkyvHql45F2aHxs
 AnXtdLIpTL1jOW47ze7vE8fvCYjV3fbtka8Z7ME3X/Koz/ii8fOGvBV3+e7Sa/tCJXmP
 unS+iQ+a1PaXn8uDVxH64FjaZaG3tqyod8hyIx8iSfNUns/Z8Pbox772lTLq1zkm6spL
 7HbZf4IhCZLHFW7bf7iT9ZMsGhPCPK2e+TEoP4ZgDJ3q/4rbDDMHEm5Lte3FU8rknP6P
 /OttMfQSVOVL8K+zwE8iayrK+vDQ4shTIdJ5UbKtISdhqwPQEEcD4yYI0dG4uWvOjOmF
 OSaw==
X-Gm-Message-State: AOAM530pRdqb3T5v2igniViBoFTOwUA1aRahE+MleQ+t0iTRJlDkH6zG
 XhhV5jMTWYW+zwBRBCgDCxeXMAC8tzPGSQ==
X-Google-Smtp-Source: ABdhPJygiuj/SbiUV51+I+P7eCz8BOpxFq4/DVkBELvAaCoT78GJJ0M7bAHNCpj3WO2u5n4ooeum7w==
X-Received: by 2002:a17:90b:209:: with SMTP id
 fy9mr1599851pjb.189.1600907551608; 
 Wed, 23 Sep 2020 17:32:31 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id 64sm735312pfd.7.2020.09.23.17.32.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 17:32:30 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 15/19] drm/virtio: implement blob resources: refactor UUID
 code somewhat
Date: Wed, 23 Sep 2020 17:32:10 -0700
Message-Id: <20200924003214.662-15-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200924003214.662-1-gurchetansingh@chromium.org>
References: <20200924003214.662-1-gurchetansingh@chromium.org>
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
index e1143a00017c5..bbbe28f8b9436 100644
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
