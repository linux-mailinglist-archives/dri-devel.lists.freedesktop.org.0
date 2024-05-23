Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 587D88CD140
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 13:32:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1721510E1AA;
	Thu, 23 May 2024 11:32:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="x4Y8JkMF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B05B10E259
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 11:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1716463968;
 bh=B7CVT8mlKuRo1bPhSO+NfICxEbWVkkWyIjUuF91f8aw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=x4Y8JkMFb8i8j7iYu+YrCshcbgAKeN6kjXyvCslJLxr7n9wvamyT17habbScqtHsa
 ogWa6mvRtaoeWZ0u/A/Ng0oqoYlXgW0Z58o2Gc6aJ9WKaI1uhIE8cBCKVHgo1U0sEI
 D2uYK//XHzPp/q4i9ZjN6sxcvOdNyHMgQhgIuEzWK9FqRn5Z6x3/9ZLx4Sym0HQAsU
 0xc+BH5H9CBGrYiu7vYuhG7AFaG6MkOq0uxtHd8nZ5/MTJeQb7wUBUAGO/2Pyyxbn+
 TuLnCgG+P8/2CnB0SdOYr9ERwzImkfOH5uor1E8bNnv2Pmx6PJGm1nefOJy+9zc2bx
 IlbCi+GjQ5mFQ==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 00BB837821B9;
 Thu, 23 May 2024 11:32:47 +0000 (UTC)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Zack Rusin <zack.rusin@broadcom.com>
Cc: kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH v4 1/3] drm/panfrost: Fix dma_resv deadlock at drm object pin
 time
Date: Thu, 23 May 2024 12:32:17 +0100
Message-ID: <20240523113236.432585-2-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240523113236.432585-1-adrian.larumbe@collabora.com>
References: <20240523113236.432585-1-adrian.larumbe@collabora.com>
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

Fix it by replacing drm_gem_shmem_pin with its locked version, as the lock
had already been taken by drm_gem_pin().

Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>
Fixes: a78027847226 ("drm/gem: Acquire reservation lock in drm_gem_{pin/unpin}()")
Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
index d47b40b82b0b..8e0ff3efede7 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -192,7 +192,7 @@ static int panfrost_gem_pin(struct drm_gem_object *obj)
 	if (bo->is_heap)
 		return -EINVAL;
 
-	return drm_gem_shmem_pin(&bo->base);
+	return drm_gem_shmem_pin_locked(&bo->base);
 }
 
 static enum drm_gem_object_status panfrost_gem_status(struct drm_gem_object *obj)
-- 
2.45.1

