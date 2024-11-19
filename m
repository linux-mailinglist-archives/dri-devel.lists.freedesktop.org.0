Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1529D2039
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 07:26:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42D5F10E5BE;
	Tue, 19 Nov 2024 06:26:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AzZ7qy/E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55BB710E5B9
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 06:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731997585; x=1763533585;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/QuMJ6gVfhmhO54+FsCcaBOXE8Qmk2Qhev4ninFsNhw=;
 b=AzZ7qy/EtsthvIteEJPCc0I5WdCuLpQ5ZmIOTrx3ThFgt+kKIEdoRaZ7
 en6y7Ej0GEXWL3xM2UYMWrseupY/TUbcNaIk0CHgyJ87QSH9R5A0SF+UP
 VH60KeCVRyeN9xWEOk/ySAjEp+fZQUs32bA3TNW1ZSVZMm0RNE4+QjYRB
 sC1SBwC0B2jR69rFR3uGJqEykn35lCGZFxWpSJ/LMevTnNVllJMCKLms6
 HJB3AuiPopXC8NG4vY+BH2YVgiMO6L0Mm5F1U2CdtZZPS7KazGY0+eRE1
 B04kubuR2AM3MR3Zeq66r09bGPbeox292mVgZV8K6l1+dAEOTgGlKVOwU A==;
X-CSE-ConnectionGUID: 24Nqtyk8Q9CtfodkVW4WVA==
X-CSE-MsgGUID: 0SDHCETzSNKYr+1AE+aRrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="32038779"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="32038779"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 22:26:24 -0800
X-CSE-ConnectionGUID: l7nhNWLaQC2i1yfh3Cs3XQ==
X-CSE-MsgGUID: 7bP29rvFQpq6THFE7/p5pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="94531821"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 22:26:24 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Rob Clark <robdclark@gmail.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>
Subject: [PATCH v3 4/5] drm/virtio: Import prime buffers from other devices as
 guest blobs
Date: Mon, 18 Nov 2024 21:59:39 -0800
Message-ID: <20241119060248.3312553-5-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241119060248.3312553-1-vivek.kasireddy@intel.com>
References: <20241119060248.3312553-1-vivek.kasireddy@intel.com>
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

By importing scanout buffers from other devices, we should be able
to use the virtio-gpu driver in KMS only mode. Note that we attach
dynamically and register a move_notify() callback so that we can
let the VMM know of any location changes associated with the backing
store of the imported object by sending detach_backing cmd.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: Chia-I Wu <olvaffe@gmail.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/gpu/drm/virtio/virtgpu_prime.c | 57 +++++++++++++++++++++++++-
 1 file changed, 56 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
index e9b5b5a7f8dc..2fcccfa75eab 100644
--- a/drivers/gpu/drm/virtio/virtgpu_prime.c
+++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
@@ -255,10 +255,39 @@ static int virtgpu_dma_buf_init_obj(struct drm_device *dev,
 	return ret;
 }
 
+static const struct drm_gem_object_funcs virtgpu_gem_dma_buf_funcs = {
+	.free = virtgpu_dma_buf_free_obj,
+};
+
+static void virtgpu_dma_buf_move_notify(struct dma_buf_attachment *attach)
+{
+	struct drm_gem_object *obj = attach->importer_priv;
+	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
+
+	if (bo->created) {
+		virtio_gpu_detach_object_fenced(bo);
+
+		if (bo->sgt)
+			dma_buf_unmap_attachment(attach, bo->sgt,
+						 DMA_BIDIRECTIONAL);
+
+		bo->sgt = NULL;
+	}
+}
+
+static const struct dma_buf_attach_ops virtgpu_dma_buf_attach_ops = {
+	.allow_peer2peer = true,
+	.move_notify = virtgpu_dma_buf_move_notify
+};
+
 struct drm_gem_object *virtgpu_gem_prime_import(struct drm_device *dev,
 						struct dma_buf *buf)
 {
+	struct virtio_gpu_device *vgdev = dev->dev_private;
+	struct dma_buf_attachment *attach;
+	struct virtio_gpu_object *bo;
 	struct drm_gem_object *obj;
+	int ret;
 
 	if (buf->ops == &virtgpu_dmabuf_ops.ops) {
 		obj = buf->priv;
@@ -272,7 +301,32 @@ struct drm_gem_object *virtgpu_gem_prime_import(struct drm_device *dev,
 		}
 	}
 
-	return drm_gem_prime_import(dev, buf);
+	if (!vgdev->has_resource_blob || vgdev->has_virgl_3d)
+		return drm_gem_prime_import(dev, buf);
+
+	bo = kzalloc(sizeof(*bo), GFP_KERNEL);
+	if (!bo)
+		return ERR_PTR(-ENOMEM);
+
+	obj = &bo->base.base;
+	obj->funcs = &virtgpu_gem_dma_buf_funcs;
+	drm_gem_private_object_init(dev, obj, buf->size);
+
+	attach = dma_buf_dynamic_attach(buf, dev->dev,
+					&virtgpu_dma_buf_attach_ops, obj);
+	if (IS_ERR(attach)) {
+		kfree(bo);
+		return ERR_CAST(attach);
+	}
+
+	obj->import_attach = attach;
+	get_dma_buf(buf);
+
+	ret = virtgpu_dma_buf_init_obj(dev, bo, attach);
+	if (ret < 0)
+		return ERR_PTR(ret);
+
+	return obj;
 }
 
 struct drm_gem_object *virtgpu_gem_prime_import_sg_table(
@@ -281,3 +335,4 @@ struct drm_gem_object *virtgpu_gem_prime_import_sg_table(
 {
 	return ERR_PTR(-ENODEV);
 }
+
-- 
2.45.1

