Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEF361DFAA
	for <lists+dri-devel@lfdr.de>; Sun,  6 Nov 2022 00:29:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F36610E17D;
	Sat,  5 Nov 2022 23:29:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E4DC10E17B
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Nov 2022 23:29:05 +0000 (UTC)
Received: from dimapc.. (109-252-117-140.nat.spd-mgts.ru [109.252.117.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id BF0136602395;
 Sat,  5 Nov 2022 23:29:01 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1667690943;
 bh=QpvuclmtyteddLw86CWzFOH3pWu373K8JLLPGJRCCFw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iSp1UqcMQRoHEVxLfu5rAo3frnpCjtmDKAR6GfPVB2+9cuMoZ3w5YgGly4zBKJZ9u
 9E4AyuEcbNf2wQ6gtdxazl3GczA7ivB4fqbrQIs0g4UkMMep9ZL8xOsqNUnD2c+jvZ
 HNctvKoX2X+PbjIqNQM4l8lV5k/QYFs3guwZLoD56lzJsc5ExicHkFIJ8pabd5z4Yz
 1PjQFvPXhjdv+lb58knEO2+RBB9wNecjUidWqjFgQHWHIsP8gJ0LwOEmGb5edzBFDu
 qK/ikXHtbPULw27Lr5R+cDLVcmDiZ99vLADhMJ/vMi7B0nSmo+3dqH9HWe20vGWsN8
 YKUyi29G/SWzA==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Clark <robdclark@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Herring <robh@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v8 1/7] drm/msm/gem: Prevent blocking within shrinker loop
Date: Sun,  6 Nov 2022 02:27:13 +0300
Message-Id: <20221105232719.302619-2-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221105232719.302619-1-dmitry.osipenko@collabora.com>
References: <20221105232719.302619-1-dmitry.osipenko@collabora.com>
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
Cc: Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Consider this scenario:

1. APP1 continuously creates lots of small GEMs
2. APP2 triggers `drop_caches`
3. Shrinker starts to evict APP1 GEMs, while APP1 produces new purgeable
   GEMs
4. msm_gem_shrinker_scan() returns non-zero number of freed pages
   and causes shrinker to try shrink more
5. msm_gem_shrinker_scan() returns non-zero number of freed pages again,
   goto 4
6. The APP2 is blocked in `drop_caches` until APP1 stops producing
   purgeable GEMs

To prevent this blocking scenario, check number of remaining pages
that GPU shrinker couldn't release due to a GEM locking contention. If
there are no remaining pages left to shrink, then there is no need to
free up more pages and shrinker may break out from the loop.

This problem was uncovered during shrinker/madvise IOCTL testing of
virtio-gpu driver. The MSM driver is affected in the same way.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem.c              | 9 +++++++--
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 8 ++++++--
 include/drm/drm_gem.h                  | 4 +++-
 3 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index b8db675e7fb5..299bca1390aa 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1375,10 +1375,13 @@ EXPORT_SYMBOL(drm_gem_lru_move_tail);
  *
  * @lru: The LRU to scan
  * @nr_to_scan: The number of pages to try to reclaim
+ * @remaining: The number of pages left to reclaim
  * @shrink: Callback to try to shrink/reclaim the object.
  */
 unsigned long
-drm_gem_lru_scan(struct drm_gem_lru *lru, unsigned nr_to_scan,
+drm_gem_lru_scan(struct drm_gem_lru *lru,
+		 unsigned int nr_to_scan,
+		 unsigned long *remaining,
 		 bool (*shrink)(struct drm_gem_object *obj))
 {
 	struct drm_gem_lru still_in_lru;
@@ -1417,8 +1420,10 @@ drm_gem_lru_scan(struct drm_gem_lru *lru, unsigned nr_to_scan,
 		 * hit shrinker in response to trying to get backing pages
 		 * for this obj (ie. while it's lock is already held)
 		 */
-		if (!dma_resv_trylock(obj->resv))
+		if (!dma_resv_trylock(obj->resv)) {
+			*remaining += obj->size >> PAGE_SHIFT;
 			goto tail;
+		}
 
 		if (shrink(obj)) {
 			freed += obj->size >> PAGE_SHIFT;
diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index 1de14e67f96b..4c8b0ab61ce4 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -116,12 +116,14 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 	};
 	long nr = sc->nr_to_scan;
 	unsigned long freed = 0;
+	unsigned long remaining = 0;
 
 	for (unsigned i = 0; (nr > 0) && (i < ARRAY_SIZE(stages)); i++) {
 		if (!stages[i].cond)
 			continue;
 		stages[i].freed =
-			drm_gem_lru_scan(stages[i].lru, nr, stages[i].shrink);
+			drm_gem_lru_scan(stages[i].lru, nr, &remaining,
+					 stages[i].shrink);
 		nr -= stages[i].freed;
 		freed += stages[i].freed;
 	}
@@ -132,7 +134,7 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 				     stages[3].freed);
 	}
 
-	return (freed > 0) ? freed : SHRINK_STOP;
+	return (freed > 0 && remaining > 0) ? freed : SHRINK_STOP;
 }
 
 #ifdef CONFIG_DEBUG_FS
@@ -182,10 +184,12 @@ msm_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr)
 		NULL,
 	};
 	unsigned idx, unmapped = 0;
+	unsigned long remaining = 0;
 
 	for (idx = 0; lrus[idx] && unmapped < vmap_shrink_limit; idx++) {
 		unmapped += drm_gem_lru_scan(lrus[idx],
 					     vmap_shrink_limit - unmapped,
+					     &remaining,
 					     vmap_shrink);
 	}
 
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index a17c2f903f81..b46ade812443 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -475,7 +475,9 @@ int drm_gem_dumb_map_offset(struct drm_file *file, struct drm_device *dev,
 void drm_gem_lru_init(struct drm_gem_lru *lru, struct mutex *lock);
 void drm_gem_lru_remove(struct drm_gem_object *obj);
 void drm_gem_lru_move_tail(struct drm_gem_lru *lru, struct drm_gem_object *obj);
-unsigned long drm_gem_lru_scan(struct drm_gem_lru *lru, unsigned nr_to_scan,
+unsigned long drm_gem_lru_scan(struct drm_gem_lru *lru,
+			       unsigned int nr_to_scan,
+			       unsigned long *remaining,
 			       bool (*shrink)(struct drm_gem_object *obj));
 
 #endif /* __DRM_GEM_H__ */
-- 
2.37.3

