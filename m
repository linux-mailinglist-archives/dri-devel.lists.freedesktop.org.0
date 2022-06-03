Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 610EC53D32A
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 23:24:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D77310EC56;
	Fri,  3 Jun 2022 21:24:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1A6910E8C3
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jun 2022 21:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654291437; x=1685827437;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=32cZwzaupVbqe0RPXzW/p9zHEOnc0oUy4MpECS5PJis=;
 b=Z6Lgmu77pXszSWIgKkgoe/Es7mKZ1u1hqM8ajC2YP1Fw/2ApAcYaLTM+
 4rfxUw4VL4QXWEH6WmldhAZhtRjATaUIBY+fvOGOj3i6ygaEIU178i6va
 rG+xpbWbsNGiDuLqHuf5IRquuJREKGndzUcdjJyRBp6+NmB4pbWhXU78p
 pBgLl8FawcjYEQRQ2XlhybTZ0k1EMsSdHXyJv5XnJ2orGkPTwc0v7TKBh
 E1QiTohscFsy+6Q4xfxUuvr3C3/Tsh6C4ROQDP8yUkVBw96u1dGyuUp/u
 H2IxMMPinZDG0tyZJUnUw8KbLR7NHyNd84GKWUHuW7dol916zU9tBaKfX Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10367"; a="256209623"
X-IronPort-AV: E=Sophos;i="5.91,275,1647327600"; d="scan'208";a="256209623"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2022 14:23:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,275,1647327600"; d="scan'208";a="668629854"
Received: from dongwonk-z390-aorus-ultra-intel-gfx.fm.intel.com
 ([10.105.129.122])
 by FMSMGA003.fm.intel.com with ESMTP; 03 Jun 2022 14:23:57 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm/virtio: .release ops for virtgpu fence release
Date: Fri,  3 Jun 2022 14:18:48 -0700
Message-Id: <20220603211849.27703-2-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220603211849.27703-1-dongwon.kim@intel.com>
References: <20220603211849.27703-1-dongwon.kim@intel.com>
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

