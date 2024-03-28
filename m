Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D64E488FA95
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 10:01:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0275111237D;
	Thu, 28 Mar 2024 09:01:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K0cJNGKK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D023511237A
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 09:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711616465; x=1743152465;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=igOa1YqCrusDmITVY46d0ciSsUPOrUNWa/VKP9eNVUg=;
 b=K0cJNGKKmYjA1jxVy9fxYcaWf3qI4lLQPWdrd4bBSi1TwBfnc1ILrgdC
 9ZEa1jPHkOHPQvpaRqdwlWkNYBsXehqQqSC6yGlEwLLS+E/31S3nlV5Vb
 FwCekWuN0oZy5m2IdraGllLGkxTZRpfbkDC4DqWdziu2KHDG6965weH7o
 SgEm76fsL1SwVudmQYY8XhAEejgnzXfIs8Jv4vzz32tnp0WnJXw5s7RKx
 UvLWGpWsow16g/JOSSSg2AZ8Q48293YgamgCtiYx0GF0JiNh8YkXE7vXO
 Z1wTr7expMFEqQbzL8A1L8h7M7jqs7yEJISwhYXb97ugYYCWx3M4XpMSZ Q==;
X-CSE-ConnectionGUID: W10Ur8loRb2VDb/PnBQGDw==
X-CSE-MsgGUID: Uw3/58UESsGZv5N9+qxpGA==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="7355698"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="7355698"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 02:01:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; d="scan'208";a="21078228"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 02:01:03 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [RFC 4/7] drm/virtio: Import prime buffers from other devices as
 guest blobs
Date: Thu, 28 Mar 2024 01:32:57 -0700
Message-ID: <20240328083615.2662516-5-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240328083615.2662516-1-vivek.kasireddy@intel.com>
References: <20240328083615.2662516-1-vivek.kasireddy@intel.com>
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
 drivers/gpu/drm/virtio/virtgpu_prime.c | 54 +++++++++++++++++++++++++-
 1 file changed, 53 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
index 1e87dbc9a897..c65dacc1b2b5 100644
--- a/drivers/gpu/drm/virtio/virtgpu_prime.c
+++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
@@ -255,10 +255,36 @@ static int virtgpu_dma_buf_init_obj(struct drm_device *dev,
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
+		bo->has_backing = false;
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
@@ -272,7 +298,32 @@ struct drm_gem_object *virtgpu_gem_prime_import(struct drm_device *dev,
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
@@ -281,3 +332,4 @@ struct drm_gem_object *virtgpu_gem_prime_import_sg_table(
 {
 	return ERR_PTR(-ENODEV);
 }
+
-- 
2.43.0

