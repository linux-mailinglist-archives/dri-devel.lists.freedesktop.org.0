Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD0678A0A8
	for <lists+dri-devel@lfdr.de>; Sun, 27 Aug 2023 19:56:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 674D210E1EB;
	Sun, 27 Aug 2023 17:56:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE13110E1E1;
 Sun, 27 Aug 2023 17:56:17 +0000 (UTC)
Received: from workpc.. (109-252-153-31.dynamic.spd-mgts.ru [109.252.153.31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 32F9666072AB;
 Sun, 27 Aug 2023 18:56:15 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693158976;
 bh=0wj0JyeO44qWBcA4sg0nmCVr80ZlTFnAVv5Kf3lqoeI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UKfcQeB/4VjkWTVNNVWkxdMAN9nNFcM9+M593lK8WR97x6lAhl1QjWlgTtHlJCZEd
 9NMnv4Ej90qpq04M8ZxpTrMECAs3q3cbs8bSTDHNeTGROuI4a7kJky5OZ0K3JPU2Ft
 UcUw0JGYK0dLGDtteRp0dFb0DDpUxdoo6CzblS9zGw6/qFMTj3KTgUzjnT3WRm/fBQ
 6hAOD1RUtypVBZ7h1m6pO+NExLX2ZzZ3/plAM/qe5pgkJWS61gnDlZ489lwsVe1qDT
 u6ufDxFGUALt5WbxwSbkieEzILF/SAjod3Fa56gXyPB3G6XM3O/uuM1DN0ta//WINQ
 craGeF445CSZw==
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
Subject: [PATCH v15 15/23] drm/shmem-helper: Switch drm_gem_shmem_vmap/vunmap
 to use pin/unpin
Date: Sun, 27 Aug 2023 20:54:41 +0300
Message-ID: <20230827175449.1766701-16-dmitry.osipenko@collabora.com>
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

The vmapped pages shall be pinned in memory and previously get/put_pages()
were implicitly hard-pinning/unpinning the pages. This will no longer be
the case with addition of memory shrinker because pages_use_count > 0 won't
determine anymore whether pages are hard-pinned (they will be soft-pinned),
while the new pages_pin_count will do the hard-pinning. Switch the
vmap/vunmap() to use pin/unpin() functions in a preparation of addition
of the memory shrinker support to drm-shmem.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 13 ++++++++++---
 include/drm/drm_gem_shmem_helper.h     |  2 +-
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index f386289c24fc..17a0177acb5d 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -274,6 +274,13 @@ static void drm_gem_shmem_kref_unpin_pages(struct kref *kref)
 	drm_gem_shmem_put_pages_locked(shmem);
 }
 
+static void drm_gem_shmem_unpin_locked(struct drm_gem_shmem_object *shmem)
+{
+	dma_resv_assert_held(shmem->base.resv);
+
+	kref_put(&shmem->pages_pin_count, drm_gem_shmem_kref_unpin_pages);
+}
+
 /**
  * drm_gem_shmem_pin - Pin backing pages for a shmem GEM object
  * @shmem: shmem GEM object
@@ -357,7 +364,7 @@ int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem,
 			return 0;
 		}
 
-		ret = drm_gem_shmem_get_pages_locked(shmem);
+		ret = drm_gem_shmem_pin_locked(shmem);
 		if (ret)
 			goto err_zero_use;
 
@@ -380,7 +387,7 @@ int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem,
 
 err_put_pages:
 	if (!obj->import_attach)
-		drm_gem_shmem_put_pages_locked(shmem);
+		drm_gem_shmem_unpin_locked(shmem);
 err_zero_use:
 	shmem->vmap_use_count = 0;
 
@@ -417,7 +424,7 @@ void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object *shmem,
 			return;
 
 		vunmap(shmem->vaddr);
-		drm_gem_shmem_put_pages_locked(shmem);
+		drm_gem_shmem_unpin_locked(shmem);
 	}
 
 	shmem->vaddr = NULL;
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index a5a3c193cc8f..400ecd63f45f 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -137,7 +137,7 @@ int drm_gem_shmem_madvise_locked(struct drm_gem_shmem_object *shmem, int madv);
 static inline bool drm_gem_shmem_is_purgeable(struct drm_gem_shmem_object *shmem)
 {
 	return (shmem->madv > 0) &&
-		!shmem->vmap_use_count && shmem->sgt &&
+		!kref_read(&shmem->pages_pin_count) && shmem->sgt &&
 		!shmem->base.dma_buf && !shmem->base.import_attach;
 }
 
-- 
2.41.0

