Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F70694FCA1
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 06:20:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E88710E253;
	Tue, 13 Aug 2024 04:19:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gR8wb+48";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD8FE10E237
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 04:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723522793; x=1755058793;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/QuMJ6gVfhmhO54+FsCcaBOXE8Qmk2Qhev4ninFsNhw=;
 b=gR8wb+48Wwnczso60Bx4bBafOGJmAPUuMkzmogg0a5ff54AQDotqVzRu
 QijFoAWNIUFJepOh9JSEOGDljOcTKfNyArurcfy6bQ3EIvy4czKTfqVSq
 Y4cL+A6TqSDwIo2DhRs4P3s5RQMcU/IEzL1jD8P81dGIZCEtuAp8I8XXR
 I0TIubjDv6hHg1F2eOnEUM25VNDVdlUxbs0zDKwwd1Q1saDT4gIOJItUK
 3t8yiHXZbs3/l3u8P54qLJLTEaz2UXVmPk2LxishTt+hi5wYG3FElJqBL
 gxDxL+bexfbCXu5f7vcgUR1o/WlOv7nQ+rSMNCDtLXUtvRKh1hAVudf2C w==;
X-CSE-ConnectionGUID: 7tF86dOKTECcgSR5SlUB8w==
X-CSE-MsgGUID: a64Q6d7gTlC5qvVJEdvtqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="44186509"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="44186509"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 21:19:52 -0700
X-CSE-ConnectionGUID: LZD33Aw8TGmNGqCaVU82OA==
X-CSE-MsgGUID: LiRmf7vBQVippRkCA5GF8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="63486668"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 21:19:52 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Rob Clark <robdclark@gmail.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>
Subject: [PATCH v2 4/5] drm/virtio: Import prime buffers from other devices as
 guest blobs
Date: Mon, 12 Aug 2024 20:49:12 -0700
Message-ID: <20240813035509.3360760-5-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240813035509.3360760-1-vivek.kasireddy@intel.com>
References: <20240813035509.3360760-1-vivek.kasireddy@intel.com>
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

