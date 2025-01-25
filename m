Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E2CA1C538
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 22:08:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D87D10E0DE;
	Sat, 25 Jan 2025 21:08:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MsQyWJrJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19FE010E0DE
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jan 2025 21:08:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A877AA40A84;
 Sat, 25 Jan 2025 21:06:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 73DEBC4CED6;
 Sat, 25 Jan 2025 21:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737839301;
 bh=YkJyOTErAt2tRZlqHy8myxEMmo2cnaskYaKMplVFxaA=;
 h=From:Date:Subject:To:Cc:Reply-To:From;
 b=MsQyWJrJ9raaAtPtUbfjGRFFm1lholUMotclQ+t1ew9LzO/W1W5cMWTziYU6YV34Y
 LhoYzN5eTSPyWE5PgrFWePKcJrvNlTccpnR62xUHtm/1QnCJiq7kMgZF6b2Hhx5aHN
 VYH/LcqerNHk4aaBtnxVFoikcyWtE7ELZADoIHNIXPImD/JtAij7WdjvURv6U7zq+i
 acUUbSNe1kZMhRh8TjsuABF0YgCPMFkZRY7X9ROXPoLY6SIscWELLwCoRyOwULVVIw
 OsLw6+lZxxRvN6J4ojCA7qr4beFakvu5YsQwKIId23UcNzZEE+7sYJw7OvIEb44nFT
 XqD/BrxG6RiMw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 5CAB4C0218C;
 Sat, 25 Jan 2025 21:08:21 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Sat, 25 Jan 2025 22:08:14 +0100
Subject: [PATCH v2] drm/virtio: Align host mapping request to maximum
 platform page size
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250125-virtgpu-mixed-page-size-v2-1-c40c555cf276@gmail.com>
X-B4-Tracking: v=1; b=H4sIAL1SlWcC/4WNQQ7CIBBFr9LM2jGANqGuvIfpAulAJ5G2gUrUh
 rtLvYDL9/P/+xskikwJLs0GkTInnqcK6tCAHc3kCXmoDEqoVkjRYea4+uWJgV804GJqI/GHUGl
 11+5shHIW6nqJ5GplN9/6yiOndY7v31GWe/rfmSVKtNqRJKnbzp2uPhh+HO0coC+lfAGwCfYzv
 gAAAA==
X-Change-ID: 20250109-virtgpu-mixed-page-size-282b8f4a02fc
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Chia-I Wu <olvaffe@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737839300; l=4035;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=3zZcDtrmzU80dSYarHh3Szvvoc/9VAfbk8eEmWVbJzo=;
 b=PPOumAdOAWKk1KG70bsAN/MNWYF7huqyDMnowaOgSyhe3GoaSGFvCKE86DPb9z2bZyswFuWGp
 eDpxEj8Gh1QAn5irhJPGXzXU6BjymQjFyeXXWW5cJ0pqkJsCzR4PffE
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
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
Reply-To: fnkl.kernel@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sasha Finkelstein <fnkl.kernel@gmail.com>

This allows running different page sizes between host and guest on
platforms that support mixed page sizes.

Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
Changes in v2:
- Aligned all object sizes to MAX_PAGE_SIZE too.
- Link to v1: https://lore.kernel.org/r/20250109-virtgpu-mixed-page-size-v1-1-c8fe1e1859f3@gmail.com
---
 drivers/gpu/drm/virtio/virtgpu_drv.h    | 6 ++++++
 drivers/gpu/drm/virtio/virtgpu_gem.c    | 2 +-
 drivers/gpu/drm/virtio/virtgpu_ioctl.c  | 2 +-
 drivers/gpu/drm/virtio/virtgpu_object.c | 2 +-
 drivers/gpu/drm/virtio/virtgpu_vram.c   | 4 ++--
 5 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 64c236169db88acd6ba9afd20a1ab16c667490c4..b73844d6535e45402dc46898035eaa7492de935d 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -61,6 +61,12 @@
 /* See virtio_gpu_ctx_create. One additional character for NULL terminator. */
 #define DEBUG_NAME_MAX_LEN 65
 
+#if defined(__powerpc64__) || defined(__aarch64__) || defined(__mips__) || defined(__loongarch__)
+#define MAX_PAGE_SIZE SZ_64K
+#else
+#define MAX_PAGE_SIZE PAGE_SIZE
+#endif
+
 struct virtio_gpu_object_params {
 	unsigned long size;
 	bool dumb;
diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
index 7db48d17ee3a8a9c638a8c6f9e58f35bd004b453..8e625ccae308f46b11a390a0987fd5ea55ccbf8d 100644
--- a/drivers/gpu/drm/virtio/virtgpu_gem.c
+++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
@@ -73,7 +73,7 @@ int virtio_gpu_mode_dumb_create(struct drm_file *file_priv,
 
 	pitch = args->width * 4;
 	args->size = pitch * args->height;
-	args->size = ALIGN(args->size, PAGE_SIZE);
+	args->size = ALIGN(args->size, MAX_PAGE_SIZE);
 
 	params.format = virtio_gpu_translate_format(DRM_FORMAT_HOST_XRGB8888);
 	params.width = args->width;
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index e4f76f31555049369000a50c0cb1d5edab68536b..e39ae008ac5f734ec52e9703413958b4ea4be7d6 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -167,7 +167,7 @@ static int virtio_gpu_resource_create_ioctl(struct drm_device *dev, void *data,
 	params.size = rc->size;
 	/* allocate a single page size object */
 	if (params.size == 0)
-		params.size = PAGE_SIZE;
+		params.size = MAX_PAGE_SIZE;
 
 	fence = virtio_gpu_fence_alloc(vgdev, vgdev->fence_drv.context, 0);
 	if (!fence)
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index c7e74cf130221bbed3aa447e416065b03bf3e2b4..5aab82028293b7d73bcc4e686e7e2ecba6108b7b 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -190,7 +190,7 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 
 	*bo_ptr = NULL;
 
-	params->size = roundup(params->size, PAGE_SIZE);
+	params->size = roundup(params->size, MAX_PAGE_SIZE);
 	shmem_obj = drm_gem_shmem_create(vgdev->ddev, params->size);
 	if (IS_ERR(shmem_obj))
 		return PTR_ERR(shmem_obj);
diff --git a/drivers/gpu/drm/virtio/virtgpu_vram.c b/drivers/gpu/drm/virtio/virtgpu_vram.c
index 25df81c027837c248a746e41856b5aa7e216b8d5..18e773b036f7c8190d4e20ad3f2c85c36e7e295c 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vram.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vram.c
@@ -150,8 +150,8 @@ static int virtio_gpu_vram_map(struct virtio_gpu_object *bo)
 		return -EINVAL;
 
 	spin_lock(&vgdev->host_visible_lock);
-	ret = drm_mm_insert_node(&vgdev->host_visible_mm, &vram->vram_node,
-				 bo->base.base.size);
+	ret = drm_mm_insert_node_generic(&vgdev->host_visible_mm, &vram->vram_node,
+					 bo->base.base.size, MAX_PAGE_SIZE, 0, 0);
 	spin_unlock(&vgdev->host_visible_lock);
 
 	if (ret)

---
base-commit: 643e2e259c2b25a2af0ae4c23c6e16586d9fd19c
change-id: 20250109-virtgpu-mixed-page-size-282b8f4a02fc


