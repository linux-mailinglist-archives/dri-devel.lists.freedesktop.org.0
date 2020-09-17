Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D9B26CFD3
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 02:09:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F8AB6EB63;
	Thu, 17 Sep 2020 00:09:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72BD66EB55
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 00:08:56 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id bd2so138535plb.7
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 17:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8mXNSXYut9HcAcT3m1n94YKqL04blq1VBP+Feila5hE=;
 b=SKC/v0cLpAHWjYDB+P9fqNoi0F5jfcYsZzGpG53eviJgosdiNaBHgYjqa3wvlNf2Ga
 IhGMAUZO1WpSBaer2UFo/xd1VF69DfDWoEq+xYhWvFfzZfHRXE52DkcJPFrrNaRkKW+T
 uwlpZeZoMTFsO4Jtpnd06r+Nqqa7gjZKe4zbY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8mXNSXYut9HcAcT3m1n94YKqL04blq1VBP+Feila5hE=;
 b=Ep0kdpsVpjFMifqT5LJo6X36XYhYE3scY0PJP9ncyw/qWjCDcTDkWSHJ9eSypQuU1U
 98e36/uxIjf1WvgDPKjE8+DZPHeAdAKKNMGEgK3NbIbq0hGyaR3FiEQrSqdcZFEZc8tq
 zMMo7jxXUKzaHyMNuUn8uZ0mCCatzstHxjIVMMvyrJwY6kvmt4jAwb4uRlJU+eu0YgD7
 1shdCdnqQfoDvGESF12e+7AMZ0vRcqnTB2UtPk/mNAV+E3Gj7avon8MgXkSNX6S5FO7D
 G+podbSkrjg0BXJ0lRh1r2+qvjZp6wFEXf1R817S7ZA3fdh2xeji+2L4UNr6WyC+3m+3
 ylNw==
X-Gm-Message-State: AOAM531yz9ZySOHirNknwyTZF1faFAZk6LL00TKVOdqAnwOa58Ldn5yL
 WUZj76HkVWBsQ69cBK+FytDauv1AKelKjA==
X-Google-Smtp-Source: ABdhPJz/ScnSObOHOGjL4y+MC9ihNLsEFfEJmZhs+c1meP8WVVGmLgUTTNX8uSZaEW/xSd1jiXRyBA==
X-Received: by 2002:a17:90b:70e:: with SMTP id
 s14mr6471674pjz.206.1600301335762; 
 Wed, 16 Sep 2020 17:08:55 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id o19sm13737917pfp.64.2020.09.16.17.08.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 17:08:55 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 15/19] drm/virtio: implement blob resources: refactor UUID
 code somewhat
Date: Wed, 16 Sep 2020 17:08:34 -0700
Message-Id: <20200917000838.735-15-gurchetansingh@chromium.org>
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
