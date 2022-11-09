Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0166226C8
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 10:22:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20BD010E011;
	Wed,  9 Nov 2022 09:22:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D617910E011
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Nov 2022 09:22:21 +0000 (UTC)
Received: from dggpeml500023.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4N6fcd1GMTzRp7l;
 Wed,  9 Nov 2022 17:22:09 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.58) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 9 Nov 2022 17:22:18 +0800
From: Xiu Jianfeng <xiujianfeng@huawei.com>
To: <airlied@redhat.com>, <kraxel@redhat.com>, <gurchetansingh@chromium.org>, 
 <olvaffe@gmail.com>, <daniel@ffwll.ch>, <dmitry.osipenko@collabora.com>
Subject: [PATCH] drm/virtio: Fix memory leak in virtio_gpu_object_create()
Date: Wed, 9 Nov 2022 17:19:05 +0800
Message-ID: <20221109091905.55451-1-xiujianfeng@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.58]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500023.china.huawei.com (7.185.36.114)
X-CFilter-Loop: Reflected
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The virtio_gpu_object_shmem_init() will alloc memory and save it in
@ents, so when virtio_gpu_array_alloc() fails, this memory should be
freed, this patch fixes it.

Fixes: e7fef0923303 ("drm/virtio: Simplify error handling of virtio_gpu_object_create()")
Signed-off-by: Xiu Jianfeng <xiujianfeng@huawei.com>
---
 drivers/gpu/drm/virtio/virtgpu_object.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index 8d7728181de0..c7e74cf13022 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -184,7 +184,7 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 	struct virtio_gpu_object_array *objs = NULL;
 	struct drm_gem_shmem_object *shmem_obj;
 	struct virtio_gpu_object *bo;
-	struct virtio_gpu_mem_entry *ents;
+	struct virtio_gpu_mem_entry *ents = NULL;
 	unsigned int nents;
 	int ret;
 
@@ -210,7 +210,7 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 		ret = -ENOMEM;
 		objs = virtio_gpu_array_alloc(1);
 		if (!objs)
-			goto err_put_id;
+			goto err_free_entry;
 		virtio_gpu_array_add_obj(objs, &bo->base.base);
 
 		ret = virtio_gpu_array_lock_resv(objs);
@@ -239,6 +239,8 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 
 err_put_objs:
 	virtio_gpu_array_put_free(objs);
+err_free_entry:
+	kvfree(ents);
 err_put_id:
 	virtio_gpu_resource_id_put(vgdev, bo->hw_res_handle);
 err_free_gem:
-- 
2.17.1

