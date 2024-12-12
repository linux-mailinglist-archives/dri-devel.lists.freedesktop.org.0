Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C49F29EDF5D
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 07:23:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DA4F10ECC0;
	Thu, 12 Dec 2024 06:23:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q6VZ6Apx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2FDF10ECC0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 06:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733984592; x=1765520592;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sh//zoQbFV9/lRmKvGl4zCF4sFSBmQqSvSu3mteLgpQ=;
 b=Q6VZ6Apxq7yLKhOCzSsk1XpcqqBSqtQ5BLZ9QD/7k1CSCE+NYKCwh9tZ
 PjoablvyRcoHmhFvd0NCNeKGoGmVRuACIbiCltWzWdTyc2nDYCG9wT5D+
 csESwf7CAzcHlufm6Jdra/96OFx8hNm4ll5IdBywyqJwBI9Zyp2SoZ/VO
 3GOJQaXtaKNuKNJrEqKiaxno7e2hvQx9w+SHNLIsGcguq6rdUlRp6MFUZ
 TEKY7rQqAzqZEfavbZMRi6Ty6QbeCt5u8iX7oMGtNw6TyZiBB+FMkS16T
 NUEB40Kir+ZOQ+oKd59towBQwoXMfAbTrW36q7sxvbzPUchaGImL4+4ni g==;
X-CSE-ConnectionGUID: NvEi2geVTTGteNxbMlTUFg==
X-CSE-MsgGUID: myc3Rdc8SpuDWMSukMQFew==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="59783814"
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; d="scan'208";a="59783814"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 22:23:11 -0800
X-CSE-ConnectionGUID: nDAnG6NWTOWv2vXohHSYyA==
X-CSE-MsgGUID: g/gxWgS0RtCnkX84aW93hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; d="scan'208";a="126947955"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 22:23:10 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH] drm/virtio: Fix Smatch tool warnings in
 virtgpu_dma_buf_free_obj()
Date: Wed, 11 Dec 2024 21:54:21 -0800
Message-ID: <20241212055421.775759-1-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.47.1
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

Fix the following issues identified by Smatch static checker:
- The call to dma_buf_put(attach->dmabuf) after dma_buf_detach()
  leads to a UAF bug as dma_buf_detach() frees the attach object.
  Fix this by extracting the dmabuf object from attach and using
  that in the call to dma_buf_put().

- The resv object is extracted from attach before checking to see
  if attach is valid (that is !NULL) or not. Although, attach would
  very likely be valid, fix this by making sure that the resv object
  is used only after ensuring that attach is valid.

Fixes: 2885e575abc7 ("drm/virtio: Add helpers to initialize and free the imported object")
Fixes: ca77f27a2665 ("drm/virtio: Import prime buffers from other devices as guest blobs")
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: Chia-I Wu <olvaffe@gmail.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/gpu/drm/virtio/virtgpu_prime.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
index b3664c12843d..f92133a01195 100644
--- a/drivers/gpu/drm/virtio/virtgpu_prime.c
+++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
@@ -189,10 +189,11 @@ static void virtgpu_dma_buf_free_obj(struct drm_gem_object *obj)
 	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
 	struct virtio_gpu_device *vgdev = obj->dev->dev_private;
 	struct dma_buf_attachment *attach = obj->import_attach;
-	struct dma_resv *resv = attach->dmabuf->resv;
 
 	if (attach) {
-		dma_resv_lock(resv, NULL);
+		struct dma_buf *dmabuf = attach->dmabuf;
+
+		dma_resv_lock(dmabuf->resv, NULL);
 
 		virtio_gpu_detach_object_fenced(bo);
 
@@ -200,10 +201,10 @@ static void virtgpu_dma_buf_free_obj(struct drm_gem_object *obj)
 			dma_buf_unmap_attachment(attach, bo->sgt,
 						 DMA_BIDIRECTIONAL);
 
-		dma_resv_unlock(resv);
+		dma_resv_unlock(dmabuf->resv);
 
-		dma_buf_detach(attach->dmabuf, attach);
-		dma_buf_put(attach->dmabuf);
+		dma_buf_detach(dmabuf, attach);
+		dma_buf_put(dmabuf);
 	}
 
 	if (bo->created) {
-- 
2.47.1

