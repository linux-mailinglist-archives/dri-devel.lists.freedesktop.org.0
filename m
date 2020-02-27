Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BABC5170D26
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 01:26:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A6586E483;
	Thu, 27 Feb 2020 00:26:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC9506E34B
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 00:26:10 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id x185so641300pfc.5
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 16:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uPpqiIYUB9QXMp0nIRjCbjN9IZRRIc5FIAP54ywmppU=;
 b=jVahWEEeRRbHcihYKmCg2RsIErsn+9rqX0+HTwsF7fROu/5mKL+I4mvbKBGcA93FFE
 YUGfU8Pq1IdGUKwrVNDdRIW98FdqtK4nkYs3P5FPzJLIMw6JR+x5M7KXh14W5roIL/Zp
 oYpoiH4B1r8uClTUPfW7AZxXaykMQsGBNRFjY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uPpqiIYUB9QXMp0nIRjCbjN9IZRRIc5FIAP54ywmppU=;
 b=FN4KReeDJ4yvp3cdT5yw4dRVIO5sEgY9hx9/2SfByxbhxTFwl5KgKm1DAQS6RjkQ6Z
 mKrCGzLWEFJ26EOuKpU2jGa8JlyHNQGOz1YYEDxRCW5vORYDIlM39cqAmhI/m3hdYRa5
 0GUsxtrMJuNrumJEQilyopGMDsJB9jYdc5TuPu3BPeEGkKXnG+M7bOBYxtrmWPDlGhOv
 02DPP13TKI6hs8ugA7LF4IUAOfpU8fGbd+YaNqSnHUjeYwSorZq6ucGraaDNcyBhzihl
 m6DuVAiqx5LhQqsO4cN2VBvBTK5Mb+UYF10+qlcEMP07GrT245soXm9UenptnYrOVLGR
 PabQ==
X-Gm-Message-State: APjAAAUjyWIhGKSOR3WRoOhIC+j0R8rZqn44hOCzOLLvqvcxaXJZeuta
 RMGQ24AjCx4QAu51eV122JRLZDal9f4=
X-Google-Smtp-Source: APXvYqy89BHJn0iihmUIaIK8mTrafyv7GgBTKyd5B+iY+f9jolgF2d03RZuBI+9ToOOcIc2WuGYsAw==
X-Received: by 2002:a63:e74f:: with SMTP id j15mr1383897pgk.20.1582763170016; 
 Wed, 26 Feb 2020 16:26:10 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id d14sm4522237pfq.117.2020.02.26.16.26.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 26 Feb 2020 16:26:09 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 2/8] drm/virtio: add virtio_gpu_is_shmem helper
Date: Wed, 26 Feb 2020 16:25:55 -0800
Message-Id: <20200227002601.745-3-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200227002601.745-1-gurchetansingh@chromium.org>
References: <20200227002601.745-1-gurchetansingh@chromium.org>
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
Cc: Gurchetan Singh <gurchetansingh@chromium.org>, kraxel@redhat.com,
 jbates@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The plan is use have both shmem and virtual "vram" running
side-by-side in virtio-gpu. It looks like we'll eventually use
struct drm_gem_object as a base class, and we'll need to convert
to shmem and vram objects on the fly. As a first step, add a
virtio_gpu_is_shmem helper. Thanks to kraxel for suggesting this
approach on Gitlab.

Suggested by: Gerd Hoffman <kraxel@redhat.com>
Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h    | 3 +++
 drivers/gpu/drm/virtio/virtgpu_object.c | 9 +++++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 95a7443baaba..ce73895cf74b 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -365,6 +365,9 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 			     struct virtio_gpu_object_params *params,
 			     struct virtio_gpu_object **bo_ptr,
 			     struct virtio_gpu_fence *fence);
+
+bool virtio_gpu_is_shmem(struct drm_gem_object *obj);
+
 /* virtgpu_prime.c */
 struct drm_gem_object *virtgpu_gem_prime_import_sg_table(
 	struct drm_device *dev, struct dma_buf_attachment *attach,
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index 07de3260118a..c5cad949eb8d 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -95,7 +95,7 @@ static void virtio_gpu_free_object(struct drm_gem_object *obj)
 	virtio_gpu_cleanup_object(bo);
 }
 
-static const struct drm_gem_object_funcs virtio_gpu_gem_funcs = {
+static const struct drm_gem_object_funcs virtio_gpu_shmem_funcs = {
 	.free = virtio_gpu_free_object,
 	.open = virtio_gpu_gem_object_open,
 	.close = virtio_gpu_gem_object_close,
@@ -109,6 +109,11 @@ static const struct drm_gem_object_funcs virtio_gpu_gem_funcs = {
 	.mmap = drm_gem_shmem_mmap,
 };
 
+bool virtio_gpu_is_shmem(struct drm_gem_object *obj)
+{
+	return obj->funcs == &virtio_gpu_shmem_funcs;
+}
+
 struct drm_gem_object *virtio_gpu_create_object(struct drm_device *dev,
 						size_t size)
 {
@@ -118,7 +123,7 @@ struct drm_gem_object *virtio_gpu_create_object(struct drm_device *dev,
 	if (!bo)
 		return NULL;
 
-	bo->base.base.funcs = &virtio_gpu_gem_funcs;
+	bo->base.base.funcs = &virtio_gpu_shmem_funcs;
 	return &bo->base.base;
 }
 
-- 
2.25.1.481.gfbce0eb801-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
