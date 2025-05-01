Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E03AA6762
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 01:26:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F2D810E068;
	Thu,  1 May 2025 23:26:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fkwcc25m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D86710E068
 for <dri-devel@lists.freedesktop.org>; Thu,  1 May 2025 23:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746141966; x=1777677966;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XLkOKPvMAj01MprxOI90O1vnP+3GF3XtoTNnnEvynpk=;
 b=fkwcc25m/HTzZ6dbiDOJYKt51x2te4TNkhcutsWu4VUtzjcLJL9roncS
 h4XeYmuZt/a2EJNLirn/I192jDfo2bo7qkFiTIj4zl5v9tb5ygRrscEwg
 NhwijB4rL7hJzizfjI5G7UEtdKMUIT2NZo9j2UUGd3lP+5kXs8kchElKm
 KJ7UokaMUUANSsAUXcGmK0awDpaq20KGD2Dw0QV2a1aOjxRrgQdWKwQNG
 0DVbbXDpU7XkZPP997YfBLwQFLs3V+WtY2a7V6rj0sHeuqAdfZgZ4+d9P
 Rk1h+ikMUoOzew/3xkjOPF7mLDZl4zTAxBs2SU6Eqlc2fqReJY03JKURo g==;
X-CSE-ConnectionGUID: oXw30sEfQDasGIdd261/hw==
X-CSE-MsgGUID: lf72/excRr2pFEP4lpjvpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="47080018"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; d="scan'208";a="47080018"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2025 16:26:05 -0700
X-CSE-ConnectionGUID: fDgqwxa8QF6e+GifCzmbaA==
X-CSE-MsgGUID: 555HBcq9R2SeyB1VBhDXJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; d="scan'208";a="135463267"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2025 16:26:05 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/virtio: Fix NULL pointer deref in
 virtgpu_dma_buf_free_obj()
Date: Thu,  1 May 2025 16:24:19 -0700
Message-ID: <20250501232419.180337-1-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is a chance that obj->dma_buf would be NULL by the time
virtgpu_dma_buf_free_obj() is called. This can happen for imported
prime objects, when drm_gem_object_exported_dma_buf_free() gets
called on them before drm_gem_object_free(). This is because
drm_gem_object_exported_dma_buf_free() explicitly sets
obj->dma_buf to NULL.

Therefore, fix this issue by storing the dma_buf pointer in the
virtio_gpu_object instance and using it in virtgpu_dma_buf_free_obj.
This stored pointer is guaranteed to be valid until the object is
freed as we took a reference on it in virtgpu_gem_prime_import().

Fixes: 415cb45895f4 ("drm/virtio: Use dma_buf from GEM object instance")
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h   | 1 +
 drivers/gpu/drm/virtio/virtgpu_prime.c | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index f17660a71a3e..f7def8b42068 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -88,6 +88,7 @@ struct virtio_gpu_object_params {
 
 struct virtio_gpu_object {
 	struct drm_gem_shmem_object base;
+	struct dma_buf *dma_buf;
 	struct sg_table *sgt;
 	uint32_t hw_res_handle;
 	bool dumb;
diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
index 1118a0250279..722cde5e2d86 100644
--- a/drivers/gpu/drm/virtio/virtgpu_prime.c
+++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
@@ -206,7 +206,7 @@ static void virtgpu_dma_buf_free_obj(struct drm_gem_object *obj)
 	struct virtio_gpu_device *vgdev = obj->dev->dev_private;
 
 	if (drm_gem_is_imported(obj)) {
-		struct dma_buf *dmabuf = obj->dma_buf;
+		struct dma_buf *dmabuf = bo->dma_buf;
 
 		dma_resv_lock(dmabuf->resv, NULL);
 		virtgpu_dma_buf_unmap(bo);
@@ -332,6 +332,7 @@ struct drm_gem_object *virtgpu_gem_prime_import(struct drm_device *dev,
 
 	obj->import_attach = attach;
 	get_dma_buf(buf);
+	bo->dma_buf = buf;
 
 	ret = virtgpu_dma_buf_init_obj(dev, bo, attach);
 	if (ret < 0)
-- 
2.49.0

