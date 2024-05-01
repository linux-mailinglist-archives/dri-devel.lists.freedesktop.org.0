Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 990D58B85C4
	for <lists+dri-devel@lfdr.de>; Wed,  1 May 2024 08:57:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B00E1121DA;
	Wed,  1 May 2024 06:57:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="L4J7fJjX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A06B01121D7;
 Wed,  1 May 2024 06:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1714546618;
 bh=iEC0/RKlUV3PA5EcZER+WAMWrbc6jCqUUJ6YQFg0IQ4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=L4J7fJjXtl6k75cLOq+bIqsFXeMGPNnZNIQJ3s+qZLzcCFimVLyxv6ueYXJ9GqnFn
 8IXzp5d56O/ECJoyof37PwfFiTZJI8Rb1d+hWl5nh2plBG0kmYeHY+8QVVHMHlKdoT
 KTZu3hbGFD3m+m1DumEWzKgjGVQa4PdUSDbH7oFlHTUsw/uLTQNQTwzcGpI5gX2rbl
 c7QZryTq7wgEaMMsM4cj5ZGIVNkQqLurX9iGx9RyyAO23DHPBQw52P0RsYmOdPeVgX
 aKOkEohfl6O56ANrpPwmHGdp+fmlS4+T8PnccI1lncp8QVBiCXscTeKnJTGerwb8Go
 0nmKcYvu7GqiQ==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5CF4937820E1;
 Wed,  1 May 2024 06:56:57 +0000 (UTC)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Qiang Yu <yuq825@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian Koenig= <christian.koenig@amd.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Zack Rusin <zack.rusin@broadcom.com>
Cc: kernel@collabora.com, Adrian Larumbe <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH v3 1/2] drm/panfrost: Fix dma_resv deadlock at drm object pin
 time
Date: Wed,  1 May 2024 07:55:59 +0100
Message-ID: <20240501065650.2809530-2-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240501065650.2809530-1-adrian.larumbe@collabora.com>
References: <20240501065650.2809530-1-adrian.larumbe@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When Panfrost must pin an object that is being prepared a dma-buf
attachment for on behalf of another driver, the core drm gem object pinning
code already takes a lock on the object's dma reservation.

However, Panfrost GEM object's pinning callback would eventually try taking
the lock on the same dma reservation when delegating pinning of the object
onto the shmem subsystem, which led to a deadlock.

This can be shown by enabling CONFIG_DEBUG_WW_MUTEX_SLOWPATH, which throws
the following recursive locking situation:

weston/3440 is trying to acquire lock:
ffff000000e235a0 (reservation_ww_class_mutex){+.+.}-{3:3}, at: drm_gem_shmem_pin+0x34/0xb8 [drm_shmem_helper]
but task is already holding lock:
ffff000000e235a0 (reservation_ww_class_mutex){+.+.}-{3:3}, at: drm_gem_pin+0x2c/0x80 [drm]

Fix it by assuming the object's reservation had already been locked by the
time we reach panfrost_gem_pin.

Do the same thing for the Lima driver, as it most likely suffers from the
same issue.

Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>
Fixes: a78027847226 ("drm/gem: Acquire reservation lock in drm_gem_{pin/unpin}()")
Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/lima/lima_gem.c         | 2 +-
 drivers/gpu/drm/panfrost/panfrost_gem.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_gem.c
index 7ea244d876ca..c4e0f9faaa47 100644
--- a/drivers/gpu/drm/lima/lima_gem.c
+++ b/drivers/gpu/drm/lima/lima_gem.c
@@ -185,7 +185,7 @@ static int lima_gem_pin(struct drm_gem_object *obj)
 	if (bo->heap_size)
 		return -EINVAL;
 
-	return drm_gem_shmem_pin(&bo->base);
+	return drm_gem_shmem_object_pin(obj);
 }
 
 static int lima_gem_vmap(struct drm_gem_object *obj, struct iosys_map *map)
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
index d47b40b82b0b..f268bd5c2884 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -192,7 +192,7 @@ static int panfrost_gem_pin(struct drm_gem_object *obj)
 	if (bo->is_heap)
 		return -EINVAL;
 
-	return drm_gem_shmem_pin(&bo->base);
+	return drm_gem_shmem_object_pin(obj);
 }
 
 static enum drm_gem_object_status panfrost_gem_status(struct drm_gem_object *obj)
-- 
2.44.0

