Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FD4790D09
	for <lists+dri-devel@lfdr.de>; Sun,  3 Sep 2023 19:09:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2F8F10E0F5;
	Sun,  3 Sep 2023 17:08:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F34710E0F4
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Sep 2023 17:08:46 +0000 (UTC)
Received: from workpc.. (109-252-153-31.dynamic.spd-mgts.ru [109.252.153.31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 1F26C660729F;
 Sun,  3 Sep 2023 18:08:44 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693760925;
 bh=+AikQZciT7OSpx2D1soEKFZvpuAqTt4uGz0mu/TZmic=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lKhnpdYjng/k1JWea/NPG2sjHP2rZ9h8RlXm09C/98a0X5pY3Qvj2UOyFCWhM2qWd
 60Ui5Dzzn/0jfTQaSxPms97xG9KZ0yE7IhEW6uor+W8DfG9C0bI1bcYEW7W2ecq8qA
 nXLE++xOzvKZc5iH1S6vwCn2lfSVE0ciMjqXjxhpteN9nIeaA0NifvFlzH1P9h27/G
 EaTVOdfqFHyrn0+KKJbv/nNg+8Ayn9S0cR5VffGgAb2Go7L8x7e/9NFVoZUkPLmUv2
 YRJB3BFQloXWOaD/py0NIHZ5fJsMMtRCKtkReDI3CIqEvZFHgu6SRzv8LZWImW+DWw
 6TDDhBhV4xcGw==
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
 Emma Anholt <emma@anholt.net>, Melissa Wen <mwen@igalia.com>
Subject: [PATCH v16 06/20] drm/virtio: Replace drm_gem_shmem_free() with
 drm_gem_object_put()
Date: Sun,  3 Sep 2023 20:07:22 +0300
Message-ID: <20230903170736.513347-7-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230903170736.513347-1-dmitry.osipenko@collabora.com>
References: <20230903170736.513347-1-dmitry.osipenko@collabora.com>
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

