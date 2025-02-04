Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9D3A26D86
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 09:46:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B7B10E5BB;
	Tue,  4 Feb 2025 08:46:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iVVch9Cg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1786F10E5B7
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 08:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738658794; x=1770194794;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WMxspI4rC39Vtgm4y9aXFNGtRNdKwxtI5Tbt/Kk4sGo=;
 b=iVVch9CgIwRCGQDOK02Xq2IlPjxARah+H6MvN57FwCXoqZOz7zmTSlGM
 W/KDhNIRz1p4jaSDLtuVups13WV5KjSd/k0JQ9BR+I9YzpD+LZxamK30e
 EE1iiZxgq8v7dfKed/eAw2PlJy0fzPGEcXjU/15ExG/kEa2B/T+CpxUJk
 cy3twFD0zjBbFAmSVElKcbqZSz4VUfVWWY06qdtCT6iGbpw0VvMh0LTsN
 E0tHhqZdZE3iz1Wj5DGKNtkUNqSsskJbmiAhHgu124Qdjzj3q1VbeJSR6
 BQEJ3nVvhpKt32/L7UpJDBC4ghI6yib0qAz8P4ArQxT6Sf2HEYV0FIgVZ w==;
X-CSE-ConnectionGUID: ml68Igz+Rf+71HxOVvcaZw==
X-CSE-MsgGUID: Iy6LIBHGRu21oqOnIPHmJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="39434735"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="39434735"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 00:46:34 -0800
X-CSE-ConnectionGUID: AwLU+dajRdan2+aBfBb5pg==
X-CSE-MsgGUID: LhWmLi9KQqeWjZIjPMtuLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="115531599"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 00:46:32 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 maciej.falkowski@linux.intel.com,
 Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 4/6] accel/ivpu: Allow to import single buffer into multiple
 contexts
Date: Tue,  4 Feb 2025 09:46:20 +0100
Message-ID: <20250204084622.2422544-5-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20250204084622.2422544-1-jacek.lawrynowicz@linux.intel.com>
References: <20250204084622.2422544-1-jacek.lawrynowicz@linux.intel.com>
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

From: Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>

Use ivpu_gem_prime_import() based on drm_gem_prime_import_dev()
for importing buffers, removing optimization for same device
imports. This optimization reused the same ivpu_bo object in multiple
contexts but a single buffer can be MMU-mapped only to a single context.
Each import now creates a new instance of ivpu_bo object that shares
the same sg_table but have separate MMU mappings.

Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Signed-off-by: Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.c |  2 +-
 drivers/accel/ivpu/ivpu_gem.c | 43 +++++++++++++++++++++++++++++++++++
 drivers/accel/ivpu/ivpu_gem.h |  1 +
 3 files changed, 45 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index 6a80d626d6098..f23e3e8ea9d80 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -452,7 +452,7 @@ static const struct drm_driver driver = {
 	.postclose = ivpu_postclose,
 
 	.gem_create_object = ivpu_gem_create_object,
-	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table,
+	.gem_prime_import = ivpu_gem_prime_import,
 
 	.ioctls = ivpu_drm_ioctls,
 	.num_ioctls = ARRAY_SIZE(ivpu_drm_ioctls),
diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
index d8e97a760fbc0..3467fc0fffe90 100644
--- a/drivers/accel/ivpu/ivpu_gem.c
+++ b/drivers/accel/ivpu/ivpu_gem.c
@@ -20,6 +20,8 @@
 #include "ivpu_mmu.h"
 #include "ivpu_mmu_context.h"
 
+MODULE_IMPORT_NS("DMA_BUF");
+
 static const struct drm_gem_object_funcs ivpu_gem_funcs;
 
 static inline void ivpu_dbg_bo(struct ivpu_device *vdev, struct ivpu_bo *bo, const char *action)
@@ -172,6 +174,47 @@ struct drm_gem_object *ivpu_gem_create_object(struct drm_device *dev, size_t siz
 	return &bo->base.base;
 }
 
+struct drm_gem_object *ivpu_gem_prime_import(struct drm_device *dev,
+					     struct dma_buf *dma_buf)
+{
+	struct device *attach_dev = dev->dev;
+	struct dma_buf_attachment *attach;
+	struct sg_table *sgt;
+	struct drm_gem_object *obj;
+	int ret;
+
+	attach = dma_buf_attach(dma_buf, attach_dev);
+	if (IS_ERR(attach))
+		return ERR_CAST(attach);
+
+	get_dma_buf(dma_buf);
+
+	sgt = dma_buf_map_attachment_unlocked(attach, DMA_BIDIRECTIONAL);
+	if (IS_ERR(sgt)) {
+		ret = PTR_ERR(sgt);
+		goto fail_detach;
+	}
+
+	obj = drm_gem_shmem_prime_import_sg_table(dev, attach, sgt);
+	if (IS_ERR(obj)) {
+		ret = PTR_ERR(obj);
+		goto fail_unmap;
+	}
+
+	obj->import_attach = attach;
+	obj->resv = dma_buf->resv;
+
+	return obj;
+
+fail_unmap:
+	dma_buf_unmap_attachment_unlocked(attach, sgt, DMA_BIDIRECTIONAL);
+fail_detach:
+	dma_buf_detach(dma_buf, attach);
+	dma_buf_put(dma_buf);
+
+	return ERR_PTR(ret);
+}
+
 static struct ivpu_bo *ivpu_bo_alloc(struct ivpu_device *vdev, u64 size, u32 flags)
 {
 	struct drm_gem_shmem_object *shmem;
diff --git a/drivers/accel/ivpu/ivpu_gem.h b/drivers/accel/ivpu/ivpu_gem.h
index d975000abd785..a222a9ec9d611 100644
--- a/drivers/accel/ivpu/ivpu_gem.h
+++ b/drivers/accel/ivpu/ivpu_gem.h
@@ -28,6 +28,7 @@ int ivpu_bo_pin(struct ivpu_bo *bo);
 void ivpu_bo_unbind_all_bos_from_context(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx);
 
 struct drm_gem_object *ivpu_gem_create_object(struct drm_device *dev, size_t size);
+struct drm_gem_object *ivpu_gem_prime_import(struct drm_device *dev, struct dma_buf *dma_buf);
 struct ivpu_bo *ivpu_bo_create(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
 			       struct ivpu_addr_range *range, u64 size, u32 flags);
 struct ivpu_bo *ivpu_bo_create_global(struct ivpu_device *vdev, u64 size, u32 flags);
-- 
2.45.1

