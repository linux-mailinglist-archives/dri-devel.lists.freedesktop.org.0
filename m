Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E44AB2B064C
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 14:21:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 811E16E249;
	Thu, 12 Nov 2020 13:21:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27F5A6E102;
 Thu, 12 Nov 2020 13:21:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CD8ABAD57;
 Thu, 12 Nov 2020 13:21:28 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: [PATCH 4/7] drm/radeon: Pin buffers while they are vmap'ed
Date: Thu, 12 Nov 2020 14:21:14 +0100
Message-Id: <20201112132117.27228-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201112132117.27228-1-tzimmermann@suse.de>
References: <20201112132117.27228-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to avoid eviction of vmap'ed buffers, pin them in their GEM
object's vmap implementation. Unpin them in the vunmap implementation.
This is needed to make generic fbdev support work reliably. Without,
the buffer object could be evicted while fbdev flushed its shadow buffer.

In difference to the PRIME pin/unpin functions, the vmap code does not
modify the BOs prime_shared_count, so a vmap-pinned BO does not count as
shared.

The actual pin location is not important as the vmap call returns
information on how to access the buffer. Callers that require a
specific location should explicitly pin the BO before vmapping it.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/radeon/radeon_gem.c | 51 +++++++++++++++++++++++++++--
 1 file changed, 49 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
index d2876ce3bc9e..eaf7fc9a7b07 100644
--- a/drivers/gpu/drm/radeon/radeon_gem.c
+++ b/drivers/gpu/drm/radeon/radeon_gem.c
@@ -226,6 +226,53 @@ static int radeon_gem_handle_lockup(struct radeon_device *rdev, int r)
 	return r;
 }
 
+static int radeon_gem_object_vmap(struct drm_gem_object *obj, struct dma_buf_map *map)
+{
+	static const uint32_t any_domain = RADEON_GEM_DOMAIN_VRAM |
+					   RADEON_GEM_DOMAIN_GTT |
+					   RADEON_GEM_DOMAIN_CPU;
+
+	struct radeon_bo *bo = gem_to_radeon_bo(obj);
+	int ret;
+
+	ret = radeon_bo_reserve(bo, false);
+	if (ret)
+		return ret;
+
+	/* pin buffer at its current location */
+	ret = radeon_bo_pin(bo, any_domain, NULL);
+	if (ret)
+		goto err_radeon_bo_unreserve;
+
+	ret = drm_gem_ttm_vmap(obj, map);
+	if (ret)
+		goto err_radeon_bo_unpin;
+
+	radeon_bo_unreserve(bo);
+
+	return 0;
+
+err_radeon_bo_unpin:
+	radeon_bo_unpin(bo);
+err_radeon_bo_unreserve:
+	radeon_bo_unreserve(bo);
+	return ret;
+}
+
+static void radeon_gem_object_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map)
+{
+	struct radeon_bo *bo = gem_to_radeon_bo(obj);
+	int ret;
+
+	ret = radeon_bo_reserve(bo, false);
+	if (ret)
+		return;
+
+	drm_gem_ttm_vunmap(obj, map);
+	radeon_bo_unpin(bo);
+	radeon_bo_unreserve(bo);
+}
+
 static const struct drm_gem_object_funcs radeon_gem_object_funcs = {
 	.free = radeon_gem_object_free,
 	.open = radeon_gem_object_open,
@@ -234,8 +281,8 @@ static const struct drm_gem_object_funcs radeon_gem_object_funcs = {
 	.pin = radeon_gem_prime_pin,
 	.unpin = radeon_gem_prime_unpin,
 	.get_sg_table = radeon_gem_prime_get_sg_table,
-	.vmap = drm_gem_ttm_vmap,
-	.vunmap = drm_gem_ttm_vunmap,
+	.vmap = radeon_gem_object_vmap,
+	.vunmap = radeon_gem_object_vunmap,
 };
 
 /*
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
