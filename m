Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 979476E37CC
	for <lists+dri-devel@lfdr.de>; Sun, 16 Apr 2023 13:53:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4024110E0BB;
	Sun, 16 Apr 2023 11:53:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57B8D10E0B7
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 11:53:23 +0000 (UTC)
Received: from workpc.. (unknown
 [IPv6:2a00:1370:817e:4eb4:c5e6:4b85:1e3f:55e4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 2D3BB6603234;
 Sun, 16 Apr 2023 12:53:21 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1681646002;
 bh=fwT8AKV/EdqplpLFzWlWVv7m8/aj98/oTicpTA0Rbz4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oMxpQFyz3KOewQkhNGyNtbZlH8KUH+MUBOIxKxD+TX3NCNKuGqTaGGpbY1V1SiVa+
 VFOLzIPfnQSzQWsYplt2PGzWPjkcsdgAYQ7JJCZrsUsvZf1irZ/HaWT1j0Q0GQv5/k
 6YOEO396U+X7FUgs1XOmqanti7Ip5mUNdaIHEx0RDHYu0MNJGfPCxkZx14yv2riJsp
 pDIT2llV8OzMarEibdu5YJ+WfLKkAwJ9vMfQdFpU6GgKprQmdwUt7Lrs4tWr6s65pH
 wZkkdJdoYSIbvb+wZqio4n20Unw6Iu4Rfy69XwJitXR+fhRPGm2hv63lPkHa3M05Rl
 7NLdXak1+ZKZQ==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>,
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <maraeo@gmail.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Emil Velikov <emil.velikov@collabora.com>
Subject: [PATCH v6 2/3] drm/virtio: Wait for each dma-fence of in-fence array
 individually
Date: Sun, 16 Apr 2023 14:52:36 +0300
Message-Id: <20230416115237.798604-3-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230416115237.798604-1-dmitry.osipenko@collabora.com>
References: <20230416115237.798604-1-dmitry.osipenko@collabora.com>
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
Reviewed-by; Emil Velikov <emil.velikov@collabora.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/virtio/virtgpu_submit.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_submit.c b/drivers/gpu/drm/virtio/virtgpu_submit.c
index 84e7c4d9d8c7..cf3c04b16a7a 100644
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
 	u32 context = submit->fence_ctx + submit->ring_idx;
 
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

