Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B79244327
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 04:40:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 239906EAD5;
	Fri, 14 Aug 2020 02:40:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FBC16EACE
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 02:40:28 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id mw10so3701575pjb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 19:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mdzXzHv9UtDuhN3xxaKbkaWa+/pShUPTXp/jIk0qUfU=;
 b=FGdxUUQSXSzMh/ymkl22onbdm9LzcRRicQGQ/zS3UkQ6/bIbcUTh9CEMdyyP5A5oFu
 6ogD2bTpNNDA4rG+LKLRvF/Cp/mhbg5L2ZgEXpMFneYnk1wDTXAsrpgE0DIHU0DXkeae
 UVVXUWZuM8PaW6x+pqL7Q1MmvsYyZ3b0KiZCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mdzXzHv9UtDuhN3xxaKbkaWa+/pShUPTXp/jIk0qUfU=;
 b=Yaan/sWeejLVWgRoP7l/3VGbq/l2BqDq3/kYRYH987Xm6f1yiEXof3G2o0+g+s6bJ7
 17WU4bUSHYjzMsHjdRB7OZiPPWgtRSQOGwLaO9h3mwPuLIvXY22Ykb8IXx4OLCzTNPA4
 KwP/YldPm1eEz242h/lr1l9IrTbOhFu1IdMVntn6u9b7LGiuvWiTCk+bx/XuO+DYegH2
 NncoKwEaqw2eAi7TgmtlExAKiARaFowKE8VvRVTQw0oTOoohDQ12CeJPkQZMy50edfsm
 L0mI1g9qCtFHIMsBnu0J89ppQbtCOYAso8hO+wPD8GGkklOrp9oglVkFUEnbCS65gHl0
 45sA==
X-Gm-Message-State: AOAM533CRt6QXl8NDiMj00BA6m2YuEA//NLjZvAJpriS0BXmtGPrXw4P
 3Vyg9Dkmu9tZN7Un/TcAZOUgVwjBbUA=
X-Google-Smtp-Source: ABdhPJzXJDlYm2oO/UxPkgmrJJySflBI7EElNhc2NMymDxpJcvxqJ9f6nFkC1qj51AEM+qRAVShGKA==
X-Received: by 2002:a17:90a:6d96:: with SMTP id
 a22mr481757pjk.165.1597372827845; 
 Thu, 13 Aug 2020 19:40:27 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id m26sm7103539pfe.184.2020.08.13.19.40.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 13 Aug 2020 19:40:27 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Subject: [PATCH 20/24] drm/virtio: implement blob resources: refactor UUID
 code somewhat
Date: Thu, 13 Aug 2020 19:39:56 -0700
Message-Id: <20200814024000.2485-21-gurchetansingh@chromium.org>
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
index fe9bb95a408b..71c2ea2e3c83 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -430,6 +430,8 @@ bool virtio_gpu_is_shmem(struct virtio_gpu_object *bo);
 int virtio_gpu_resource_id_get(struct virtio_gpu_device *vgdev,
 			       uint32_t *resid);
 /* virtgpu_prime.c */
+int virtio_gpu_resource_assign_uuid(struct virtio_gpu_device *vgdev,
+				    struct virtio_gpu_object *bo);
 struct dma_buf *virtgpu_gem_prime_export(struct drm_gem_object *obj,
 					 int flags);
 struct drm_gem_object *virtgpu_gem_prime_import(struct drm_device *dev,
diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
index 3552db128ba3..1ef1e2f22633 100644
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
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
