Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D16F5356A2
	for <lists+dri-devel@lfdr.de>; Fri, 27 May 2022 01:55:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A8810FC57;
	Thu, 26 May 2022 23:55:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89D9410FA22;
 Thu, 26 May 2022 23:54:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id E84531F459ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653609290;
 bh=a6CciZvu/niFj4gUJ7nmx5idPKuwsFoNvS/I3tYS4zY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WGNfPLqGoNps/+DSLrepwv9EQg2HT/Vjb2fWG+klzDhKtzKgTkNc6akuOSiIZrnAL
 jSfAnstFuKBe9Oo4rLCuS+SbAQjn6fpsUy2CAs+d6q7twRJi2aobsl3R6YgbCD4oVP
 L72O5Rr4QHy4/A9Qf2yQhzq5nm6554SYVmTW+eT5s/HRqCTsb2n5JC8jTatnbmlLpS
 J3z8OWGv1bK4Kp/Ol3IXc69207qWAcJLtvsKLSQhouNY8Udugypc7bq1huPS35p1RJ
 S5W897eU44N8wVcjuTKs+Kvk6KhS/AeKz47+xSc663FPGf8B9hTP+41NIJMb+oO8XV
 ywGN87A7zBj6Q==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Clark <robdclark@gmail.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, Qiang Yu <yuq825@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Tomasz Figa <tfiga@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: [PATCH v6 12/22] drm/virtio: Simplify error handling of
 virtio_gpu_object_create()
Date: Fri, 27 May 2022 02:50:30 +0300
Message-Id: <20220526235040.678984-13-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220526235040.678984-1-dmitry.osipenko@collabora.com>
References: <20220526235040.678984-1-dmitry.osipenko@collabora.com>
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, amd-gfx@lists.freedesktop.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, linux-tegra@vger.kernel.org,
 Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Change the order of SHMEM initialization and reservation locking
to make code cleaner and to prepare for transitioning of the common
GEM SHMEM code to use the GEM's reservation lock instead of the
shmem.page_lock.

There is no need to lock reservation during allocation of the SHMEM pages
because the lock is needed only to avoid racing with the async host-side
allocation. Hence we can safely move the SHMEM initialization out of the
reservation lock.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/virtio/virtgpu_object.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index 21c19cdedce0..18f70ef6b4d0 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -236,6 +236,10 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 
 	bo->dumb = params->dumb;
 
+	ret = virtio_gpu_object_shmem_init(vgdev, bo, &ents, &nents);
+	if (ret != 0)
+		goto err_put_id;
+
 	if (fence) {
 		ret = -ENOMEM;
 		objs = virtio_gpu_array_alloc(1);
@@ -248,15 +252,6 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 			goto err_put_objs;
 	}
 
-	ret = virtio_gpu_object_shmem_init(vgdev, bo, &ents, &nents);
-	if (ret != 0) {
-		if (fence)
-			virtio_gpu_array_unlock_resv(objs);
-		virtio_gpu_array_put_free(objs);
-		virtio_gpu_free_object(&shmem_obj->base);
-		return ret;
-	}
-
 	if (params->blob) {
 		if (params->blob_mem == VIRTGPU_BLOB_MEM_GUEST)
 			bo->guest_blob = true;
-- 
2.35.3

