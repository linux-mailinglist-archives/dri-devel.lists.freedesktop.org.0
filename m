Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEB265D3AF
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 14:03:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44F8F10E1C9;
	Wed,  4 Jan 2023 13:03:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E4FA10E0B0
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jan 2023 13:03:17 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id A5F826602D14;
 Wed,  4 Jan 2023 13:03:15 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1672837396;
 bh=KRwLsGyLFh5+OOQ/19JO6n21nMZ0lU8npKkIdiqDkdY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oun/Petp17+ABOjph8vOhoQVYc70rihh+XYZM4AWhsPPWpdrWZpoPUz9RlYe8JL7h
 NzKvvr3QJl1o4Q4NS/m7lssR2AAechLe7bUIawOWLUlDtN7tbi770XghkpVZMdME1q
 tC8bsN/qqYtX3BXxowOYAtQsDVChhtpUJAt6qhkoRcgAgT5DPAovOfm8ZornkAb9on
 E/k7LW99Pl2pLZtlWB5CFs+cB3y1UGwisRRe4Qm6zDYZy96aE8wuG+hW+iQglnGg1p
 LY9ETwcTCcLTxHRUPuDNEnkAtagBxK4HJeKjZw1jobKvVgJZua2O/KbJukzxcjlhss
 VYzLFQnrnAk0A==
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rob Herring <robh+dt@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>, Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH RFC 2/4] drm/panfrost: Track BO resident size
Date: Wed,  4 Jan 2023 14:03:06 +0100
Message-Id: <20230104130308.3467806-3-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230104130308.3467806-1-boris.brezillon@collabora.com>
References: <20230104130308.3467806-1-boris.brezillon@collabora.com>
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Christopher Healy <healych@amazon.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Heap BOs use an on-demand allocation scheme, meaning that the resident
size is different from the BO side. Track resident size so we can more
accurately per-FD expose memory usage.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_gem.h          | 7 +++++++
 drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c | 1 +
 drivers/gpu/drm/panfrost/panfrost_mmu.c          | 2 ++
 3 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.h b/drivers/gpu/drm/panfrost/panfrost_gem.h
index 8088d5fd8480..58f5d091c983 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.h
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.h
@@ -36,6 +36,13 @@ struct panfrost_gem_object {
 	 */
 	atomic_t gpu_usecount;
 
+	/* Actual memory used by the BO. Should be zero before pages are
+	 * pinned, then the size of the BO, unless it's a heap BO. In
+	 * this case the resident size is updated when the fault handler
+	 * allocates memory.
+	 */
+	size_t resident_size;
+
 	bool noexec		:1;
 	bool is_heap		:1;
 };
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c b/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
index bf0170782f25..efbc8dec4a9f 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
@@ -54,6 +54,7 @@ static bool panfrost_gem_purge(struct drm_gem_object *obj)
 	panfrost_gem_teardown_mappings_locked(bo);
 	drm_gem_shmem_purge_locked(&bo->base);
 	ret = true;
+	bo->resident_size = 0;
 
 	mutex_unlock(&shmem->pages_lock);
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index 4e83a1891f3e..454799d5a0ef 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -340,6 +340,7 @@ int panfrost_mmu_map(struct panfrost_gem_mapping *mapping)
 	mmu_map_sg(pfdev, mapping->mmu, mapping->mmnode.start << PAGE_SHIFT,
 		   prot, sgt);
 	mapping->active = true;
+	bo->resident_size = bo->base.base.size;
 
 	return 0;
 }
@@ -508,6 +509,7 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 		}
 	}
 
+	bo->resident_size += SZ_2M;
 	mutex_unlock(&bo->base.pages_lock);
 
 	sgt = &bo->sgts[page_offset / (SZ_2M / PAGE_SIZE)];
-- 
2.38.1

