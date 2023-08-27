Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17ECE78A093
	for <lists+dri-devel@lfdr.de>; Sun, 27 Aug 2023 19:56:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD04210E1CC;
	Sun, 27 Aug 2023 17:56:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D28E210E1CA;
 Sun, 27 Aug 2023 17:56:01 +0000 (UTC)
Received: from workpc.. (109-252-153-31.dynamic.spd-mgts.ru [109.252.153.31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 111456603102;
 Sun, 27 Aug 2023 18:55:59 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693158960;
 bh=+AikQZciT7OSpx2D1soEKFZvpuAqTt4uGz0mu/TZmic=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bk4iMw4SDUP8D0NGbf/p5abJRarJ2TfiexyUhcJBk1M/tPRHHJi/p5X6xSzkG4jAb
 EI/+cbDKL9pZWMSAj1jdpwVp5xGjC4xeCBlbXimUCEkgl7BgiR3gUhUy/mRxnxyySp
 HCk268ylTeio87huL3l7YO7IgVtuDIPpx5cPi5V6UyhgeA1LoDLszqVDrbJgYL8Yo1
 PQMWDw88O78T7NjugKy/B5cZjR8UULrDBEE9rrw6kBY4IqOnbgJLjEPHccIeJd09Ia
 HZarHPeEoGWmgAK0rTuOeEs/DVNJ/R0HJ+jk62h+kr2MBO1FdP0mIkuVAyFLuVvp55
 UVs/cBLzx7nkw==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Emma Anholt <emma@anholt.net>, Melissa Wen <mwen@igalia.com>,
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Boqun Feng <boqun.feng@gmail.com>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v15 06/23] drm/virtio: Replace drm_gem_shmem_free() with
 drm_gem_object_put()
Date: Sun, 27 Aug 2023 20:54:32 +0300
Message-ID: <20230827175449.1766701-7-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230827175449.1766701-1-dmitry.osipenko@collabora.com>
References: <20230827175449.1766701-1-dmitry.osipenko@collabora.com>
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
Cc: intel-gfx@lists.freedesktop.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prepare virtio_gpu_object_create() to addition of memory shrinker support
by replacing open-coded drm_gem_shmem_free() with drm_gem_object_put() that
decrements GEM refcount to 0, which becomes important for drm-shmem because
it will start to use GEM's refcount during the shmem's BO freeing time in
order to prevent spurious lockdep warning about resv lock ordering vs
fs_reclaim code paths.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/virtio/virtgpu_object.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index c7e74cf13022..343b13428125 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -244,6 +244,6 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 err_put_id:
 	virtio_gpu_resource_id_put(vgdev, bo->hw_res_handle);
 err_free_gem:
-	drm_gem_shmem_free(shmem_obj);
+	drm_gem_object_put(&bo->base.base);
 	return ret;
 }
-- 
2.41.0

