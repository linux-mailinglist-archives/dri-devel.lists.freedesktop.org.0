Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32950522845
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 02:10:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECFF610E443;
	Wed, 11 May 2022 00:10:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9377E10E443
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 00:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652227842; x=1683763842;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=32cZwzaupVbqe0RPXzW/p9zHEOnc0oUy4MpECS5PJis=;
 b=D51MlKqsNt/fZABq5R/wB8LOGq3iue4ukPR+YMbB+wjnFPZYSc4ZRFgg
 zHoB87S5l8I8Zx3ZyIxBwoauSCAcbLgmIC4H9Cj6vNQqT6pA7XRksi7Wk
 mFcuV8BOGIve78Z0hgLkSqRo9pOnmm2l+z6t36pDLtGCvUE9+7iEKDON3
 gIOj26TnOWwqcT7bYfxi3MZKM5RZpxJ51u8Cr+sFc5v76mVMiq8e+nLry
 wwYs+qyyNPf5Gr000jw5eMSsCkE66frQ0mV/jdT+cvAciW93vAIVBEg18
 zA0eZ0nTOAbwDCv5jqHAgCscqAnSH4cGZHrsO+oLR3kWrNlMI/kd+NkKH A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="269203213"
X-IronPort-AV: E=Sophos;i="5.91,215,1647327600"; d="scan'208";a="269203213"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 17:10:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,215,1647327600"; d="scan'208";a="623707915"
Received: from dongwonk-z390-aorus-ultra-intel-gfx.fm.intel.com
 ([10.105.129.122])
 by fmsmga008.fm.intel.com with ESMTP; 10 May 2022 17:10:41 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/virtio: .release ops for virtgpu fence release
Date: Tue, 10 May 2022 17:06:21 -0700
Message-Id: <20220511000623.12938-1-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.20.1
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
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Dongwon Kim <dongwon.kim@intel.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

virtio_gpu_fence_release is added to free virtio-gpu-fence
upon release of dma_fence.

Cc: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
---
 drivers/gpu/drm/virtio/virtgpu_fence.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_fence.c b/drivers/gpu/drm/virtio/virtgpu_fence.c
index f28357dbde35..ba659ac2a51d 100644
--- a/drivers/gpu/drm/virtio/virtgpu_fence.c
+++ b/drivers/gpu/drm/virtio/virtgpu_fence.c
@@ -63,12 +63,20 @@ static void virtio_gpu_timeline_value_str(struct dma_fence *f, char *str,
 		 (u64)atomic64_read(&fence->drv->last_fence_id));
 }
 
+static void virtio_gpu_fence_release(struct dma_fence *f)
+{
+	struct virtio_gpu_fence *fence = to_virtio_gpu_fence(f);
+
+	kfree(fence);
+}
+
 static const struct dma_fence_ops virtio_gpu_fence_ops = {
 	.get_driver_name     = virtio_gpu_get_driver_name,
 	.get_timeline_name   = virtio_gpu_get_timeline_name,
 	.signaled            = virtio_gpu_fence_signaled,
 	.fence_value_str     = virtio_gpu_fence_value_str,
 	.timeline_value_str  = virtio_gpu_timeline_value_str,
+	.release	     = virtio_gpu_fence_release,
 };
 
 struct virtio_gpu_fence *virtio_gpu_fence_alloc(struct virtio_gpu_device *vgdev,
-- 
2.20.1

