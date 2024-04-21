Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B7F8AC023
	for <lists+dri-devel@lfdr.de>; Sun, 21 Apr 2024 18:40:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF5AF112510;
	Sun, 21 Apr 2024 16:40:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="FHMf4LCm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BFA1112510
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Apr 2024 16:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1713717625;
 bh=ukg6qw8U5Z46p/Fn0ryD5cc6wFsTS2m4KBCjmzl/FDw=;
 h=From:To:Cc:Subject:Date:From;
 b=FHMf4LCmyFf5sixIFOITfaBalimO45l0A7Outx06Sts1yx4+4MvBT2JPMxy1t/BJ0
 oc2+KwLuAjRJWikNO8C9f5/H5GrNs3nz8ExTEKMj+MJ2B8usgSmIW/GhGrNn/110fc
 znsUyXRpHE83zjhERdl2mpfr/NmwLvN7Lbzzw5SYjedXUbvVO+TKlLOI3Dt28TjssR
 s4qQkOTsrZahKRFRkDryXUSLj441cAqF3Dt8EtDhfHoJ3Ce/jbofap91a576mZdDy8
 5dJ1o1Swd4+4fXwECbqbkmV95oeksFSu2HulSgd2s9fScDNmKHW0a+1/hry2ByKTN8
 Y41a+E3i2DgwQ==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4523F37804B2;
 Sun, 21 Apr 2024 16:40:24 +0000 (UTC)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Zack Rusin <zack.rusin@broadcom.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH] drm/panfrost: Fix dma_resv deadlock at drm object pin time
Date: Sun, 21 Apr 2024 17:39:47 +0100
Message-ID: <20240421163951.3398622-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.44.0
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

Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>
Fixes: a78027847226 ("drm/gem: Acquire reservation lock in drm_gem_{pin/unpin}()")
Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_gem.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
index d47b40b82b0b..6c26652d425d 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -192,7 +192,12 @@ static int panfrost_gem_pin(struct drm_gem_object *obj)
 	if (bo->is_heap)
 		return -EINVAL;
 
-	return drm_gem_shmem_pin(&bo->base);
+	/*
+	 * Pinning can only happen in response to a prime attachment request from
+	 * another driver, but that's already being handled by drm_gem_pin
+	 */
+	drm_WARN_ON(obj->dev, obj->import_attach);
+	return drm_gem_shmem_pin_locked(&bo->base);
 }
 
 static enum drm_gem_object_status panfrost_gem_status(struct drm_gem_object *obj)

base-commit: 04687bff66b8a4b22748aa7215d3baef0b318e5b
-- 
2.44.0

