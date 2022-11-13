Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF94062738B
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 00:41:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13CCA10E00A;
	Sun, 13 Nov 2022 23:41:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C781210E00A
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Nov 2022 23:41:17 +0000 (UTC)
Received: from dimapc.. (109-252-117-140.nat.spd-mgts.ru [109.252.117.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 5E29B6601DEB;
 Sun, 13 Nov 2022 23:41:15 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1668382876;
 bh=gJizz7c+xyP2SpxmajSfdslozS7FNzwEJ2RHchPiu4I=;
 h=From:To:Cc:Subject:Date:From;
 b=b0cGLCM/etNSALXIWkniC99MFuBqjrhpw0/Ygks//v57zIgQO2PL5X9lHDEEqDXcf
 BtOII3ZZ2krf0YYC7rAKPHX+dHFLx4a0IWAAFujI84AKLplXsz3p+58kqwn7rU8bWR
 +kJV8K3jL2Aou8/55Tp5EY9YcgLAAda0GMpo3/uRAfvb7rGz2CJync8tNnWj38BcjO
 eyEaUTq7uR1UwreMHvSn3ALNOC1JsQf13dqmBjpnwCHQ8PugIVXYRsYbf9xCAfkr2m
 On8mKhjZIDo/l8IOiwuVVVR1RJOjO4NhrCNJURyYEywppctnkHPkIwFlg/5HQVUDyG
 /yikoMtDKK9vA==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Vyukov <dvyukov@google.com>
Subject: [PATCH v1] drm/gem-vram: Fix deadlock in drm_gem_vram_vmap()
Date: Mon, 14 Nov 2022 02:38:50 +0300
Message-Id: <20221113233850.427704-1-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.37.3
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Recently DRM framebuffer core and all drivers were moved to unlocked
vmapping functions that take the reservation lock. The drm_gem_vram_vmap()
was missed out by accident and now deadlocks drivers that use drm_gem_vram
helpers when framebuffer is updated, like Bochs driver. Remove the locking
from drm_gem_vram_v[un]map() functions to fix the deadlock.

Reported-by: Dmitry Vyukov <dvyukov@google.com>
Fixes: 79e2cf2e7a19 ("drm/gem: Take reservation lock for vmap/vunmap operations")
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 125160b534be..b6c7e3803bb3 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -433,25 +433,19 @@ int drm_gem_vram_vmap(struct drm_gem_vram_object *gbo, struct iosys_map *map)
 {
 	int ret;
 
-	ret = ttm_bo_reserve(&gbo->bo, true, false, NULL);
-	if (ret)
-		return ret;
+	dma_resv_assert_held(gbo->bo.base.resv);
 
 	ret = drm_gem_vram_pin_locked(gbo, 0);
 	if (ret)
-		goto err_ttm_bo_unreserve;
+		return ret;
 	ret = drm_gem_vram_kmap_locked(gbo, map);
 	if (ret)
 		goto err_drm_gem_vram_unpin_locked;
 
-	ttm_bo_unreserve(&gbo->bo);
-
 	return 0;
 
 err_drm_gem_vram_unpin_locked:
 	drm_gem_vram_unpin_locked(gbo);
-err_ttm_bo_unreserve:
-	ttm_bo_unreserve(&gbo->bo);
 	return ret;
 }
 EXPORT_SYMBOL(drm_gem_vram_vmap);
@@ -467,16 +461,10 @@ EXPORT_SYMBOL(drm_gem_vram_vmap);
 void drm_gem_vram_vunmap(struct drm_gem_vram_object *gbo,
 			 struct iosys_map *map)
 {
-	int ret;
-
-	ret = ttm_bo_reserve(&gbo->bo, false, false, NULL);
-	if (WARN_ONCE(ret, "ttm_bo_reserve_failed(): ret=%d\n", ret))
-		return;
+	dma_resv_assert_held(gbo->bo.base.resv);
 
 	drm_gem_vram_kunmap_locked(gbo, map);
 	drm_gem_vram_unpin_locked(gbo);
-
-	ttm_bo_unreserve(&gbo->bo);
 }
 EXPORT_SYMBOL(drm_gem_vram_vunmap);
 
-- 
2.37.3

