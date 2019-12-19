Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 491681258F9
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 01:58:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EEB46EAB3;
	Thu, 19 Dec 2019 00:57:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 277CF6EAAF
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 00:57:49 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id b9so2165298pgk.12
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 16:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B9jgYLaqrCq+kBnNkr8oYzBokJCX5jApnrzqCh4GHEs=;
 b=F9cxqFtXMZqMz4KGVPA0tJCTR/S83mp375m5hAlP1VxuWZyQUS8DtDwA4voEAsgTid
 KR7Qk8Rax3NuBIosIwnT9caXCtzggSIvufk9Fc5yDkJeAAxx1Dt8DOBV7vuUOE7nzTub
 a64TkSRhbeGV9MEni1I40YOkkNwDyI7ch8brk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B9jgYLaqrCq+kBnNkr8oYzBokJCX5jApnrzqCh4GHEs=;
 b=Cfl03HnGXzo7IJxEyDmB5Kh5jgWHl3Ayd1uCgCbIJ8e5x8VJe7p2ZlczVOvW8WAMwd
 CguaJR1fx6vS6z6DqxNojrNMr5M2WswcZ7mJzp4R+vAd/zVKQtvXgVher1pF2HMDbipM
 giQQppZe/U2iykRAZmaMwdu9er4a0sa6G3L5ts+ao3eynNEH5/+uWpbJHyXQuvjZxxGt
 /h1qGMNXoHcSIZafAVplfb8BAUb24E3VDqC9nC3ufkuaZlDu/qQPFL2ghHbFtAs9WJpt
 rJKlDMr1Ht9FszzVozt7g+uX5PoDyzT5E6p3aJI2xjKA6t9qWDd1Gm1rPcvwkdQqLmn2
 2dBg==
X-Gm-Message-State: APjAAAWAqpEzlgQPVqSSS191/OTYNNAmhIqAklCRRpl8aOo62NaJhYUH
 Vfu2p6KWBH9wsAlA8zRjgK45wBUc2fM=
X-Google-Smtp-Source: APXvYqwTdhicDu4Y0S4ejVbnHr5uuDh/QOX9tqTOs2s+XlKoetSJMNHYOzdFp/95DmacRZEvCBmv2Q==
X-Received: by 2002:a63:cf41:: with SMTP id b1mr6104020pgj.53.1576717068503;
 Wed, 18 Dec 2019 16:57:48 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id f23sm4651553pgj.76.2019.12.18.16.57.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 18 Dec 2019 16:57:47 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/6] drm/virtio: simplify getting fake offset
Date: Wed, 18 Dec 2019 16:57:31 -0800
Message-Id: <20191219005733.18960-4-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191219005733.18960-1-gurchetansingh@chromium.org>
References: <20191219005733.18960-1-gurchetansingh@chromium.org>
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
Cc: kraxel@redhat.com, Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a little simpler.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h | 8 +-------
 drivers/gpu/drm/virtio/virtgpu_gem.c | 4 +---
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 3e0580a8d818..578d5e42946e 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -365,18 +365,12 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 			     struct virtio_gpu_object_params *params,
 			     struct virtio_gpu_object **bo_ptr,
 			     struct virtio_gpu_fence *fence);
-
 /* virtgpu_prime.c */
 struct drm_gem_object *virtgpu_gem_prime_import_sg_table(
 	struct drm_device *dev, struct dma_buf_attachment *attach,
 	struct sg_table *sgt);
 
-static inline u64 virtio_gpu_object_mmap_offset(struct virtio_gpu_object *bo)
-{
-	return drm_vma_node_offset_addr(&bo->base.base.vma_node);
-}
-
-/* virgl debufs */
+/* virgl debugfs */
 int virtio_gpu_debugfs_init(struct drm_minor *minor);
 
 #endif
diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
index 4c1f579edfb3..0a2b62279647 100644
--- a/drivers/gpu/drm/virtio/virtgpu_gem.c
+++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
@@ -96,14 +96,12 @@ int virtio_gpu_mode_dumb_mmap(struct drm_file *file_priv,
 			      uint32_t handle, uint64_t *offset_p)
 {
 	struct drm_gem_object *gobj;
-	struct virtio_gpu_object *obj;
 
 	BUG_ON(!offset_p);
 	gobj = drm_gem_object_lookup(file_priv, handle);
 	if (gobj == NULL)
 		return -ENOENT;
-	obj = gem_to_virtio_gpu_obj(gobj);
-	*offset_p = virtio_gpu_object_mmap_offset(obj);
+	*offset_p = drm_vma_node_offset_addr(&gobj->vma_node);
 	drm_gem_object_put_unlocked(gobj);
 	return 0;
 }
-- 
2.24.1.735.g03f4e72817-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
