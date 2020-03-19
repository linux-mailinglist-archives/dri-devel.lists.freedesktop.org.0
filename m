Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B079018B0D7
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 11:04:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 357AA6E9D4;
	Thu, 19 Mar 2020 10:04:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE3896E9D4
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 10:04:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 391C8ACD6;
 Thu, 19 Mar 2020 10:04:22 +0000 (UTC)
From: Jiri Slaby <jslaby@suse.cz>
To: kraxel@redhat.com
Subject: [PATCH] drm/virtio: fix OOB in virtio_gpu_object_create
Date: Thu, 19 Mar 2020 11:04:21 +0100
Message-Id: <20200319100421.16267-1-jslaby@suse.cz>
X-Mailer: git-send-email 2.25.1
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Gurchetan Singh <gurchetansingh@chromium.org>, Jiri Slaby <jslaby@suse.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After commit f651c8b05542, virtio_gpu_create_object allocates too small
space to fit everything in. It is because it allocates struct
virtio_gpu_object, but should allocate a newly added struct
virtio_gpu_object_shmem which has 2 more members.

So fix that by using correct type in virtio_gpu_create_object.

Signed-off-by: Jiri Slaby <jslaby@suse.cz>
Fixes: f651c8b05542 ("drm/virtio: factor out the sg_table from virtio_gpu_object")
Cc: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_object.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index 2bfb13d1932e..d9039bb7c5e3 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -123,15 +123,17 @@ bool virtio_gpu_is_shmem(struct virtio_gpu_object *bo)
 struct drm_gem_object *virtio_gpu_create_object(struct drm_device *dev,
 						size_t size)
 {
-	struct virtio_gpu_object *bo;
+	struct virtio_gpu_object_shmem *shmem;
+	struct drm_gem_shmem_object *dshmem;
 
-	bo = kzalloc(sizeof(*bo), GFP_KERNEL);
-	if (!bo)
+	shmem = kzalloc(sizeof(*shmem), GFP_KERNEL);
+	if (!shmem)
 		return NULL;
 
-	bo->base.base.funcs = &virtio_gpu_shmem_funcs;
-	bo->base.map_cached = true;
-	return &bo->base.base;
+	dshmem = &shmem->base.base;
+	dshmem->base.funcs = &virtio_gpu_shmem_funcs;
+	dshmem->map_cached = true;
+	return &dshmem->base;
 }
 
 static int virtio_gpu_object_shmem_init(struct virtio_gpu_device *vgdev,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
