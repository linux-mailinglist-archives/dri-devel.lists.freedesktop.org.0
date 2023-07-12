Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EC475141C
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 01:07:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BD0910E5E7;
	Wed, 12 Jul 2023 23:07:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 809E310E5E6
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 23:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689203224; x=1720739224;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+35PtxDF0Jpl3EfY+7X+bX/Psi7gLRc4M6ggNOYCSP4=;
 b=CXSN4YWWLbNo9lzy2Cv4XrrhG691sFxn4ZZBoDCGQUU3BTwv2psSCDOq
 8QIgoaFoErAbGZP9RN/H43ztdox4lt1OV/7CrglGhkzkuxrW+dqW0u6eA
 yxciGp3JHsMHxAMA5jnPPcMlXmXvEo2klfkVBQnVQxdpwCeOeE+WR0HTM
 v6AO4Es0Gkn+HWRNW7Mi7NaGGHZ/CKJjJ9TBvgCjDvx5NwPcVOuWTi7RI
 0F7CBAKF2F0VUrkrgNDSO0flDzzR1Ut7u1YjS83oreWUtYmHxL0w+C+Hg
 GvjLfF/T2TgmnKL7UMolOmJmbry+lNnoTVuHXzySZVYaESrVwEeka0AgB A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="367654213"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; d="scan'208";a="367654213"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2023 16:07:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="895772016"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; d="scan'208";a="895772016"
Received: from dongwonk-z390-aorus-ultra-intel-gfx.fm.intel.com
 ([10.105.129.122])
 by orsmga005.jf.intel.com with ESMTP; 12 Jul 2023 16:07:04 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 1/3] drm/virtio: .release ops for virtgpu fence release
Date: Wed, 12 Jul 2023 15:44:22 -0700
Message-Id: <20230712224424.30158-2-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230712224424.30158-1-dongwon.kim@intel.com>
References: <20230712224424.30158-1-dongwon.kim@intel.com>
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
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>, kraxel@redhat.com,
 Dongwon Kim <dongwon.kim@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

virtio_gpu_fence_release is added to free virtio-gpu-fence
upon release of dma_fence.

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

