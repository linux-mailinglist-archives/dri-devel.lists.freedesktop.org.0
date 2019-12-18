Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDE7123C23
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 01:59:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86E436E203;
	Wed, 18 Dec 2019 00:59:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 777F86E200
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 00:59:50 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id b22so165891pls.12
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 16:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4bkB1dS3y6X/PqTypxd+ylxBnBVQ5JlWTazVWKmloP0=;
 b=Q9JT07+sN1NZaoGL/IAYw/004ugR1a1oICjY2mg53c+AFT4bNs1QouWCz8zRrwsBAB
 XNcLG65vqbW2F3ukiBi6upBRGfg3CAQiLEd5cC0kyW1OkFgYhe0rUR5i7FiBBXezl8z+
 SstUtX/FNxUkF24MPEF7DZCQ7JHC2yRw3FGiU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4bkB1dS3y6X/PqTypxd+ylxBnBVQ5JlWTazVWKmloP0=;
 b=XD7wtf4Sa4kACwujCJnVq0uVRkf6c2Skt7OtQnB2FALasAfTJcMjF0xwyEJcpEkzrx
 E+GZkubTekK4xV24wSDTNFM4MSka0Fd9YbcyOuLUprJoJeMwdK1O4Yyr5/t/8Lwd/aVM
 fCmZOd++hN+mDdrBlFcbVsfxQ/urUKg3AP1TiB3uvUBs72OZBY0ZIefciRCynKZk+glX
 SSGoxzpBDp++qQWmGgRTccrnGMwCGtDW4qcYj5criT0ya6fCgvT9scENtV89ht7XGhA0
 XkNfsA+5WVTxQD4j3shb12w0/UkDM2Ukgs6bTJHNfpLOxGzLQHa2L4j2YzPeafne/SKE
 oC7Q==
X-Gm-Message-State: APjAAAUrENyFXE+o9JTPWzcxJCxa7cArAsadR8sgBdMyRz+2jotFYUvg
 iq5lN5ufsOoe94JvSfpOEIdCOxs/hCY=
X-Google-Smtp-Source: APXvYqzxHF42Q5meNE3oM1uvJib7eBm4sVcY7IponkYEJBA8LrstOYUdOfXjvpysvhYWvs5VIvzVKQ==
X-Received: by 2002:a17:90a:33ad:: with SMTP id
 n42mr238161pjb.23.1576630789877; 
 Tue, 17 Dec 2019 16:59:49 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id r1sm240802pgp.15.2019.12.17.16.59.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 17 Dec 2019 16:59:49 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/9] drm/virtio: simplify getting fake offset
Date: Tue, 17 Dec 2019 16:59:24 -0800
Message-Id: <20191218005929.6709-5-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191218005929.6709-1-gurchetansingh@chromium.org>
References: <20191218005929.6709-1-gurchetansingh@chromium.org>
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
Cc: Gurchetan Singh <gurchetansingh@chromium.org>, kraxel@redhat.com
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
index 45b4c3324b2c..8dfb39f98552 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -359,18 +359,12 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
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
