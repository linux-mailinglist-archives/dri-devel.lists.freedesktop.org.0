Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A17A568F16F
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 15:57:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 286DB10E7AB;
	Wed,  8 Feb 2023 14:57:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1DAD10E7A7;
 Wed,  8 Feb 2023 14:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675868241; x=1707404241;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kEW+4ZCMPZv85JnRlMwAygJ7zE/yoIahsudEfBAJaM0=;
 b=jxke0MkTlYYlY/5jAOEPuWs2fhumMcvJIDeEYAyoVdw7PsQXVdLkdJC6
 df12DiHfWuO7k0fYfdig8T/vmAxjsorxlBl7dQ5KeyV8WtXNc2KEy1swV
 XM7kDi/Blx74CcfNDyt4lTbvtCq/MGJbRHohA3PnckM+R3XvNtivo1eTe
 uC96Lz357mRmWxl4cqA8jIdf9zb+9BwEbAaiOoucvcvIqyFLxZAkyIf5U
 dMeTdjvunpfaMv9IW37sxil6tcFrI0xsaiW1Mmo4jKU73dbOgEp0q/kmQ
 A+R3zAb+J+O+UX4dJnVjbsHPVZSS8fa8CILmbAP7868pWZt2X78uK3KNM A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="328469187"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; d="scan'208";a="328469187"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2023 06:57:21 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="617233445"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; d="scan'208";a="617233445"
Received: from hassanka-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.31.252])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2023 06:57:19 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/4] drm/gem-vram: handle NULL bo->resource in move callback
Date: Wed,  8 Feb 2023 14:53:16 +0000
Message-Id: <20230208145319.397235-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.1
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The ttm BO now initially has NULL bo->resource, and leaves the driver
the handle that. However it looks like we forgot to handle that for
ttm_bo_move_memcpy() users, like with vram-gem, since it just silently
returns zero. This seems to then trigger warnings like:

WARNING: CPU: 0 PID: 1 at drivers/gpu/drm/drm_gem_vram_helper.c:255 drm_gem_vram_offset (??:?)

Fix this by calling move_null() if the new resource is TTM_PL_SYSTEM,
otherwise do the multi-hop sequence to ensure can safely call into
ttm_bo_move_memcpy(), since it might also need to clear the memory.
This should give the same behaviour as before.

While we are here let's also treat calling ttm_bo_move_memcpy() with
NULL bo->resource as programmer error, where expectation is that upper
layers should now handle it.

Fixes: 180253782038 ("drm/ttm: stop allocating dummy resources during BO creation")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 11 +++++++++++
 drivers/gpu/drm/ttm/ttm_bo_util.c     |  4 ++--
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index d40b3edb52d0..0bea3df2a16d 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -916,6 +916,17 @@ static int bo_driver_move(struct ttm_buffer_object *bo,
 {
 	struct drm_gem_vram_object *gbo;
 
+	if (!bo->resource) {
+		if (new_mem->mem_type != TTM_PL_SYSTEM) {
+			hop->mem_type = TTM_PL_SYSTEM;
+			hop->flags = TTM_PL_FLAG_TEMPORARY;
+			return -EMULTIHOP;
+		}
+
+		ttm_bo_move_null(bo, new_mem);
+		return 0;
+	}
+
 	gbo = drm_gem_vram_of_bo(bo);
 
 	return drm_gem_vram_bo_driver_move(gbo, evict, ctx, new_mem);
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index d9d2b0903b22..fd9fd3d15101 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -157,8 +157,8 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
 	bool clear;
 	int ret = 0;
 
-	if (!src_mem)
-		return 0;
+	if (WARN_ON(!src_mem))
+		return -EINVAL;
 
 	src_man = ttm_manager_type(bdev, src_mem->mem_type);
 	if (ttm && ((ttm->page_flags & TTM_TT_FLAG_SWAPPED) ||
-- 
2.39.1

