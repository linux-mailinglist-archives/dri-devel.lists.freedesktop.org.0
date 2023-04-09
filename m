Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 927586DBFDF
	for <lists+dri-devel@lfdr.de>; Sun,  9 Apr 2023 14:41:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7983710E17D;
	Sun,  9 Apr 2023 12:40:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6589C10E168
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Apr 2023 12:40:46 +0000 (UTC)
Received: from workpc.. (109-252-119-170.nat.spd-mgts.ru [109.252.119.170])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 87BBD66031E9;
 Sun,  9 Apr 2023 13:40:41 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1681044042;
 bh=LXZqn9JZkk7iPwWsuND2XuT7vg+8om2rZKLRJkZQfxA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jLhPIeeTxCNtjwOlYXNAW+NlrRbdIW2XKGHybgjvUcA1SMM00q6WqNQd3DjAxBmHI
 Z7f1QcNcN2c6oAEbPK2uUElaXi0EexP70szW2eB/G9gIuQB2JPvOVNe8VnlcRN+Lrd
 aCFoUcndSp0ulUnPsPFR/8ABEbRLsUpIJNEhI0kBpf1KhF0ejRNwlLGS7BWOpXWXDx
 dsQamKSXuhy2RwWGB3P//OqgZmKYCQwm+imYSadkzdGqJYpzLMkIVQBlUIvx8p2Q72
 wVh/vRtgzCisKbWJAeaOSmRWWXiUoSI4/Dpc6x5CBOoREL7VWRTNMDp87qa8mFLYBA
 Vp+jeejqm+3Jw==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>,
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <maraeo@gmail.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Emil Velikov <emil.velikov@collabora.com>
Subject: [PATCH v5 2/3] drm/virtio: Wait for each dma-fence of in-fence array
 individually
Date: Sun,  9 Apr 2023 15:39:56 +0300
Message-Id: <20230409123957.29553-3-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230409123957.29553-1-dmitry.osipenko@collabora.com>
References: <20230409123957.29553-1-dmitry.osipenko@collabora.com>
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
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use dma-fence-unwrap API for waiting each dma-fence of the in-fence array
individually. Sync file's in-fence array always has a non-matching fence
context ID, which doesn't allow to skip waiting of fences with a matching
context ID in a case of a merged sync file fence.

Suggested-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/virtio/virtgpu_submit.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_submit.c b/drivers/gpu/drm/virtio/virtgpu_submit.c
index 902734778d1b..b60dea077240 100644
--- a/drivers/gpu/drm/virtio/virtgpu_submit.c
+++ b/drivers/gpu/drm/virtio/virtgpu_submit.c
@@ -32,8 +32,8 @@ struct virtio_gpu_submit {
 	void *buf;
 };
 
-static int virtio_gpu_dma_fence_wait(struct virtio_gpu_submit *submit,
-				     struct dma_fence *in_fence)
+static int virtio_gpu_do_fence_wait(struct virtio_gpu_submit *submit,
+				    struct dma_fence *in_fence)
 {
 	uint32_t context = submit->fence_ctx + submit->ring_idx;
 
@@ -43,6 +43,22 @@ static int virtio_gpu_dma_fence_wait(struct virtio_gpu_submit *submit,
 	return dma_fence_wait(in_fence, true);
 }
 
+static int virtio_gpu_dma_fence_wait(struct virtio_gpu_submit *submit,
+				     struct dma_fence *fence)
+{
+	struct dma_fence_unwrap itr;
+	struct dma_fence *f;
+	int err;
+
+	dma_fence_unwrap_for_each(f, &itr, fence) {
+		err = virtio_gpu_do_fence_wait(submit, f);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
 static int virtio_gpu_fence_event_create(struct drm_device *dev,
 					 struct drm_file *file,
 					 struct virtio_gpu_fence *fence,
-- 
2.39.2

