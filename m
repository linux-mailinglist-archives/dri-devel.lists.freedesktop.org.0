Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC027508A6
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 14:47:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42A7610E51F;
	Wed, 12 Jul 2023 12:47:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2675310E512
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 12:47:12 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-314417861b9so6999090f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 05:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689166030; x=1691758030;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3Xh5RMuLzB6AZnd1vsrppGQ5UNHATRX9hF95pP3+kNg=;
 b=k4x8P5cQn4pvpM6erMvBQpUTVTNi+yCigoFuT064t5a8Hgw67L/Etwvh9FrfKUYGtn
 Pi0qGA+/t4CID0SuoPV41x32dlC+j5rNnfW46fWZQPjLDoxDlQnVQTSozUG5pRK77k96
 4voJqBe3Ol69T0bc7YAqCdB1HEQTuzazEb9dm4BBypSTQx3bmTeMzyW5tRhGc/nA3cYo
 Qri7L0mCKtr7ktZu722tvkuVUG3tvIqYtJaSt02eMTJkRCkAnsDO/MPk6SIn59Moor3J
 ah0agXhL2OWLzq03MRtdBwkYJEnutH78oZICLz1frHIZYy3EWY5fyzXXO5vQ1YaOqA14
 GKpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689166030; x=1691758030;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3Xh5RMuLzB6AZnd1vsrppGQ5UNHATRX9hF95pP3+kNg=;
 b=XvPG5flLLBmFIwtjFeyoJH+OK3JPr+aEJTBhCG5yZVAEKqFRpcIeXsbi6pRnyhY4jq
 Hi6+an62I64ywRUp4p7d2JNQ6inCdYOjUxMviTU/1PtgAHDeWPfSTR+poLKbLiJd9715
 H6qLvrw4rXknftbWil2bgyx4RL3FeTXYwHsdxyHJK6r6vKbRj8KQap4leiBaM81SuWZm
 9rjGNww1CRPNGV2uvCVRPcOrI/aYZoZjFMMOSx7k3bJbQJDOhwYOBrn/sK4T+/sfPygV
 cTjaORcDEXUx96E0LI6s/gRQk+/SZXgs7GjrfESWhV6uz6cehkHlR4HJn4FIbOnhxraO
 Yr1A==
X-Gm-Message-State: ABy/qLZ79OddSke7Uu/WJTZSZI3Mm6MW5DSohsYbniAUTeZVCWmh2gNH
 BwD1qE9UaUMlf8neXGIrhVKlW4IV7ac=
X-Google-Smtp-Source: APBJJlGPxZP3AapSCcqrBo9XpTcLvDyjY/PBnCBR0Cv72nSZgVUCz5VzggU0jEc/10Vksn0+sILn4A==
X-Received: by 2002:a05:6000:1cc9:b0:314:2735:dc13 with SMTP id
 bf9-20020a0560001cc900b003142735dc13mr18659974wrb.47.1689166030228; 
 Wed, 12 Jul 2023 05:47:10 -0700 (PDT)
Received: from EliteBook.fritz.box ([2a00:e180:1557:4100:d4c4:2bb7:77d6:6d86])
 by smtp.gmail.com with ESMTPSA id
 j8-20020adfe508000000b0031424950a99sm4989225wrm.81.2023.07.12.05.47.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jul 2023 05:47:09 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/7] drm/virtgpu: switch to using drm_exec
Date: Wed, 12 Jul 2023 14:47:01 +0200
Message-Id: <20230712124704.333004-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230712124704.333004-1-christian.koenig@amd.com>
References: <20230712124704.333004-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@redhat.com>,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Just a straightforward conversion without any optimization.

Only compile tested for now.

Signed-off-by: Christian König <christian.koenig@amd.com>
Cc: David Airlie <airlied@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: Chia-I Wu <olvaffe@gmail.com>
Cc: virtualization@lists.linux-foundation.org
---
 drivers/gpu/drm/virtio/Kconfig       |  1 +
 drivers/gpu/drm/virtio/virtgpu_drv.h |  3 ++-
 drivers/gpu/drm/virtio/virtgpu_gem.c | 28 +++++-----------------------
 3 files changed, 8 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/virtio/Kconfig b/drivers/gpu/drm/virtio/Kconfig
index ea06ff2aa4b4..a24a1ce5e666 100644
--- a/drivers/gpu/drm/virtio/Kconfig
+++ b/drivers/gpu/drm/virtio/Kconfig
@@ -5,6 +5,7 @@ config DRM_VIRTIO_GPU
 	select VIRTIO
 	select DRM_KMS_HELPER
 	select DRM_GEM_SHMEM_HELPER
+	select DRM_EXEC
 	select VIRTIO_DMA_SHARED_BUFFER
 	help
 	   This is the virtual GPU driver for virtio.  It can be used with
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 4126c384286b..cb5d9218a3ab 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -35,6 +35,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_encoder.h>
+#include <drm/drm_exec.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem.h>
@@ -116,7 +117,7 @@ struct virtio_gpu_object_vram {
 	container_of((virtio_gpu_object), struct virtio_gpu_object_vram, base)
 
 struct virtio_gpu_object_array {
-	struct ww_acquire_ctx ticket;
+	struct drm_exec exec;
 	struct list_head next;
 	u32 nents, total;
 	struct drm_gem_object *objs[];
diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
index 7db48d17ee3a..bb7928e7b3b6 100644
--- a/drivers/gpu/drm/virtio/virtgpu_gem.c
+++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
@@ -171,6 +171,7 @@ struct virtio_gpu_object_array *virtio_gpu_array_alloc(u32 nents)
 
 	objs->nents = 0;
 	objs->total = nents;
+	drm_exec_init(&objs->exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
 	return objs;
 }
 
@@ -214,36 +215,17 @@ void virtio_gpu_array_add_obj(struct virtio_gpu_object_array *objs,
 
 int virtio_gpu_array_lock_resv(struct virtio_gpu_object_array *objs)
 {
-	unsigned int i;
 	int ret;
 
-	if (objs->nents == 1) {
-		ret = dma_resv_lock_interruptible(objs->objs[0]->resv, NULL);
-	} else {
-		ret = drm_gem_lock_reservations(objs->objs, objs->nents,
-						&objs->ticket);
-	}
-	if (ret)
-		return ret;
-
-	for (i = 0; i < objs->nents; ++i) {
-		ret = dma_resv_reserve_fences(objs->objs[i]->resv, 1);
-		if (ret) {
-			virtio_gpu_array_unlock_resv(objs);
-			return ret;
-		}
-	}
+	drm_exec_until_all_locked(&objs->exec)
+		ret = drm_exec_prepare_array(&objs->exec, objs->objs,
+					     objs->nents, 1);
 	return ret;
 }
 
 void virtio_gpu_array_unlock_resv(struct virtio_gpu_object_array *objs)
 {
-	if (objs->nents == 1) {
-		dma_resv_unlock(objs->objs[0]->resv);
-	} else {
-		drm_gem_unlock_reservations(objs->objs, objs->nents,
-					    &objs->ticket);
-	}
+	drm_exec_fini(&objs->exec);
 }
 
 void virtio_gpu_array_add_fence(struct virtio_gpu_object_array *objs,
-- 
2.34.1

