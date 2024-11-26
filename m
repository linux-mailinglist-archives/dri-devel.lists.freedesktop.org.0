Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 533EA9D90C0
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 04:39:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2E6310E785;
	Tue, 26 Nov 2024 03:39:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kJaV+MRj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F18EA10E04B
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 03:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732592385; x=1764128385;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pxaMZdqESQBxCSnUxBqaFiRBNRqhFfGhEG4sWMJ97LY=;
 b=kJaV+MRjOO86SgOn/CkuZUam9/nJhAhv0C4F4jGqEw6svP+vGfyXblXS
 4JbGfKvN4/0B8kVgxDZXTtdTIs6ZpvhGD+g+9JmHC+X52V1Pp/+aCJdWR
 ZwZf1bl1w+36zA0T1hMfdSpeO+Qanw6aWocDUUjwEsMExUWV8FiGwvCT7
 EYQ/VRGnFLv+uNnCn8jd6aUka87HyfzRBhldXH+wMGUirkPwwbxy0yL1P
 TLUEu6usi6i9Inzgpi4WT8OIej1HDtIFadPAIMSjeN7MWi9OIZhxTsfjG
 o7Urp7PB+IpTtXACGyVICA5zVRZolSMbuq1tepGerbFSC09pR9RKxiVZg g==;
X-CSE-ConnectionGUID: LZAwUMStQl2tBHLO4U4xPw==
X-CSE-MsgGUID: GO9YG9RXQhWIPSqBji3amg==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="32106145"
X-IronPort-AV: E=Sophos;i="6.12,184,1728975600"; d="scan'208";a="32106145"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 19:39:43 -0800
X-CSE-ConnectionGUID: C3iPzKwjRMW/jvunDzAaqA==
X-CSE-MsgGUID: YZECcHFsRKW2HeFbhyJjgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,184,1728975600"; d="scan'208";a="95553454"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 19:39:44 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Rob Clark <robdclark@gmail.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>
Subject: [PATCH v5 4/5] drm/virtio: Import prime buffers from other devices as
 guest blobs
Date: Mon, 25 Nov 2024 19:13:45 -0800
Message-ID: <20241126031643.3490496-5-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241126031643.3490496-1-vivek.kasireddy@intel.com>
References: <20241126031643.3490496-1-vivek.kasireddy@intel.com>
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
 drivers/gpu/drm/virtio/virtgpu_prime.c | 56 +++++++++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
index 887b635dec6f..8644b87d473d 100644
--- a/drivers/gpu/drm/virtio/virtgpu_prime.c
+++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
@@ -259,10 +259,39 @@ static int virtgpu_dma_buf_init_obj(struct drm_device *dev,
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
@@ -276,7 +305,32 @@ struct drm_gem_object *virtgpu_gem_prime_import(struct drm_device *dev,
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
-- 
2.45.1

