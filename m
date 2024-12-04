Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 211399E3BBD
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 14:53:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2941610ED32;
	Wed,  4 Dec 2024 13:53:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1E7C10ED2F
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 13:53:22 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Tejun Heo <tj@kernel.org>,
 Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Friedrich Vock <friedrich.vock@gmx.de>, Maxime Ripard <mripard@kernel.org>
Cc: cgroups@vger.kernel.org, linux-mm@kvack.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v2 7/7] drm/gem: Add cgroup memory accounting for VRAM helper.
Date: Wed,  4 Dec 2024 14:44:07 +0100
Message-ID: <20241204134410.1161769-8-dev@lankhorst.se>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241204134410.1161769-1-dev@lankhorst.se>
References: <20241204134410.1161769-1-dev@lankhorst.se>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maxime Ripard <mripard@kernel.org>

This allows any driver using the VRAM helper to set limits on VRAM using
cgroup.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 22b1fe9c03b81..70979523ee984 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -925,6 +925,7 @@ EXPORT_SYMBOL(drm_vram_mm_debugfs_init);
 static int drm_vram_mm_init(struct drm_vram_mm *vmm, struct drm_device *dev,
 			    uint64_t vram_base, size_t vram_size)
 {
+	struct ttm_resource_manager *man;
 	int ret;
 
 	vmm->vram_base = vram_base;
@@ -939,8 +940,20 @@ static int drm_vram_mm_init(struct drm_vram_mm *vmm, struct drm_device *dev,
 
 	ret = ttm_range_man_init(&vmm->bdev, TTM_PL_VRAM,
 				 false, vram_size >> PAGE_SHIFT);
-	if (ret)
+	if (ret) {
+		ttm_device_fini(&vmm->bdev);
 		return ret;
+	}
+
+	man = ttm_manager_type(&vmm->bdev, TTM_PL_VRAM);
+	man->cg = drmm_register_region(dev, "vram", size);
+	if (IS_ERR(man->cg)) {
+		ret = PTR_ERR(man->cg);
+
+		ttm_range_man_fini(&vmm->bdev, TTM_PL_VRAM);
+		ttm_device_fini(&vmm->bdev);
+		return ret;
+	}
 
 	return 0;
 }
-- 
2.43.0

