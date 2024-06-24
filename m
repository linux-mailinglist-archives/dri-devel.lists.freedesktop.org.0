Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE4491434D
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 09:14:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA76410E372;
	Mon, 24 Jun 2024 07:13:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GmwBZgl8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17C8910E370
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 07:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719213232; x=1750749232;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xOcqtzKnLxDzXd0VnuV20J1+V3dX5xDKdQ5q0pRfoDQ=;
 b=GmwBZgl86Hms+SkOd0O33M7rn7WH+xX/jfR8zqGyqIqRtiCf8byJiiTG
 scDjBEmC/GoJBkAB/zTk3CEl+fgp8PABdVdVxOrUo7HlE9X/5j0vF1Sa4
 sjTrpCu0UDc93F5QOgVn1s4g0hqByhIUEKgpd8xpdLyeET0+RZfSIWIcC
 nQkKmcp1xg/dSdcneIfqqZ0wbLccSGzmAfqxIyAQD6blsQ/gWXIu2a+Z+
 KEke1h5fnrx2NPyqcP4p4o+oEEUteEeKMUuYFg4d8AoepaGhqhlkj7p+E
 BY6z0N9FiZZwu0GDOfEC7Fj7U2/+NlcrQSRFW6JrEaLKKMeNQMspGMVNC A==;
X-CSE-ConnectionGUID: gpc6XAZeT/Cobu/mPHZmew==
X-CSE-MsgGUID: sXxqpDeyQ3yM2jqBGIyu4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="16136022"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="16136022"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 00:13:51 -0700
X-CSE-ConnectionGUID: krO+2vQOQgqpCUn0pA2qRA==
X-CSE-MsgGUID: 9bnXeEIeRcOlNSjEmoqJmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="73960068"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 00:13:50 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v1 4/5] drm/virtio: Import prime buffers from other devices as
 guest blobs
Date: Sun, 23 Jun 2024 23:43:33 -0700
Message-ID: <20240624064841.1572452-5-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240624064841.1572452-1-vivek.kasireddy@intel.com>
References: <20240624064841.1572452-1-vivek.kasireddy@intel.com>
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
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/gpu/drm/virtio/virtgpu_prime.c | 58 +++++++++++++++++++++++++-
 1 file changed, 57 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
index e9b5b5a7f8dc..12084b5b12eb 100644
--- a/drivers/gpu/drm/virtio/virtgpu_prime.c
+++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
@@ -255,10 +255,40 @@ static int virtgpu_dma_buf_init_obj(struct drm_device *dev,
 	return ret;
 }
 
+static const struct drm_gem_object_funcs virtgpu_gem_dma_buf_funcs = {
+	.free = virtgpu_dma_buf_free_obj,
+};
+
+static void virtgpu_dma_buf_move_notify(struct dma_buf_attachment *attach)
+{
+	struct drm_gem_object *obj = attach->importer_priv;
+	struct virtio_gpu_device *vgdev = obj->dev->dev_private;
+	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
+
+	if (bo->created) {
+		virtio_gpu_cmd_resource_detach_backing(vgdev,
+						       bo->hw_res_handle);
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
@@ -272,7 +302,32 @@ struct drm_gem_object *virtgpu_gem_prime_import(struct drm_device *dev,
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
@@ -281,3 +336,4 @@ struct drm_gem_object *virtgpu_gem_prime_import_sg_table(
 {
 	return ERR_PTR(-ENODEV);
 }
+
-- 
2.45.1

