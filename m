Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 368CD78A08F
	for <lists+dri-devel@lfdr.de>; Sun, 27 Aug 2023 19:56:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6137A10E1C8;
	Sun, 27 Aug 2023 17:56:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9F3D10E1C2;
 Sun, 27 Aug 2023 17:55:54 +0000 (UTC)
Received: from workpc.. (109-252-153-31.dynamic.spd-mgts.ru [109.252.153.31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 2FD7F6607084;
 Sun, 27 Aug 2023 18:55:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693158953;
 bh=noUNGit24aWm5+1m4sEixfN2bl0LkhYbrAV9hISCEws=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aDF95ldYyMt40X6CslVv4iO57vF5BcfnlMLrxtC1csAcnwI0swf40spqY80l6rTBk
 GNyDMUusYNqdG7YIFUYICt+xCkvpqRBA6m59EdXlIdBsnFSJK83YuRzxaRekCDORa+
 niCZZFUTvgXyT/D0zhbgJo31XRk3+IHtcsYpJJJNtl1MddTXzGTFFLLEz8+btYdhlV
 7ofS86NiyONtcCHCOQJKulBQzgC+4PY8ljY1YR3xAU3T2S66YWnw+XRnOyqI42DWl9
 UNnzPzvCLFPi4LtB3/R4M5D3jxmX+EObN2ias6YMK0okJQGc39R45cNJ2euxVYVc0N
 h0zcDdDwUXauQ==
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
Subject: [PATCH v15 02/23] drm/shmem-helper: Use flag for tracking page count
 bumped by get_pages_sgt()
Date: Sun, 27 Aug 2023 20:54:28 +0300
Message-ID: <20230827175449.1766701-3-dmitry.osipenko@collabora.com>
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

Use separate flag for tracking page count bumped by shmem->sgt to avoid
imbalanced page counter during of drm_gem_shmem_free() time. It's fragile
to assume that populated shmem->pages at a freeing time means that the
count was bumped by drm_gem_shmem_get_pages_sgt(), using a flag removes
the ambiguity.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 3 ++-
 drivers/gpu/drm/lima/lima_gem.c        | 1 +
 include/drm/drm_gem_shmem_helper.h     | 7 +++++++
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 78d9cf2355a5..db20b9123891 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -152,7 +152,7 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
 			sg_free_table(shmem->sgt);
 			kfree(shmem->sgt);
 		}
-		if (shmem->pages)
+		if (shmem->got_sgt)
 			drm_gem_shmem_put_pages(shmem);
 
 		drm_WARN_ON(obj->dev, shmem->pages_use_count);
@@ -687,6 +687,7 @@ static struct sg_table *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_
 	if (ret)
 		goto err_free_sgt;
 
+	shmem->got_sgt = true;
 	shmem->sgt = sgt;
 
 	return sgt;
diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_gem.c
index 4f9736e5f929..28602302c281 100644
--- a/drivers/gpu/drm/lima/lima_gem.c
+++ b/drivers/gpu/drm/lima/lima_gem.c
@@ -89,6 +89,7 @@ int lima_heap_alloc(struct lima_bo *bo, struct lima_vm *vm)
 	}
 
 	*bo->base.sgt = sgt;
+	bo->base.got_sgt = true;
 
 	if (vm) {
 		ret = lima_vm_map_bo(vm, bo, old_size >> PAGE_SHIFT);
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index ec70a98a8fe1..f87124629bb5 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -73,6 +73,13 @@ struct drm_gem_shmem_object {
 	 */
 	unsigned int vmap_use_count;
 
+	/**
+	 * @got_sgt:
+	 *
+	 * True if SG table was retrieved using drm_gem_shmem_get_pages_sgt()
+	 */
+	bool got_sgt : 1;
+
 	/**
 	 * @imported_sgt:
 	 *
-- 
2.41.0

