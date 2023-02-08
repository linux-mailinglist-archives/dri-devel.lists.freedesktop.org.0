Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6148768F176
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 15:57:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64E4F10E7B6;
	Wed,  8 Feb 2023 14:57:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5416610E7A7;
 Wed,  8 Feb 2023 14:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675868244; x=1707404244;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1jBQnamuvrY/gPkX5IHbAcUeF1i/cYoDD6ngz7qXJt4=;
 b=HKSjjutGGve02ZEiu9agTBKCIrtfJr/+RUhJbDketiaPEOev9GqsRT/F
 wv3LHOVpzGTEfNK7+rRqyiFJKCbSzf7NNKmVgGCo+4AujQf68fc+A+enR
 272MUA6GhlPptkRGQS85wnB3qxCcdMoqk1rm4hibS7wUbi+J8jfh5l2Uk
 phlSG219KBUKWJhV2GThCFxENQjzBGj/GehUlKGSFmRpUW9CkFAbLvDtK
 dlO07jfPrtmPpaiI7/XknzWk9DffyaSuaYYDWgwd1CywS42j0/vdPR3o2
 KJtsgkoarrL25SaaUREd1aIFxmNA4m8d0UGJzNQfJ/m1WN7U0lWsld/bJ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="328469198"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; d="scan'208";a="328469198"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2023 06:57:24 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="617233449"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; d="scan'208";a="617233449"
Received: from hassanka-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.31.252])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2023 06:57:22 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/4] drm/vmwgfx: handle NULL bo->resource in move callback
Date: Wed,  8 Feb 2023 14:53:18 +0000
Message-Id: <20230208145319.397235-3-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230208145319.397235-1-matthew.auld@intel.com>
References: <20230208145319.397235-1-matthew.auld@intel.com>
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

The ttm bo now initially has NULL bo->resource, and leaves the driver
the handle that. However it looks like we forgot to handle that for
vmwgfx.  It looks like this will just null-ptr-deref in vmw_move(), if
bo->resource is NULL.

Fix this by calling move_null() if the new resource is TTM_PL_SYSTEM,
otherwise do the multi-hop sequence to ensure can safely call into
ttm_bo_move_memcpy(), since it might also need to clear the memory.
This should give the same behaviour as before.

Fixes: 180253782038 ("drm/ttm: stop allocating dummy resources during BO creation")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
index 856a352a72a6..c598c5a9fe2c 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -596,10 +596,23 @@ static int vmw_move(struct ttm_buffer_object *bo,
 		    struct ttm_resource *new_mem,
 		    struct ttm_place *hop)
 {
-	struct ttm_resource_manager *old_man = ttm_manager_type(bo->bdev, bo->resource->mem_type);
+	struct ttm_resource_manager *old_man;
 	struct ttm_resource_manager *new_man = ttm_manager_type(bo->bdev, new_mem->mem_type);
 	int ret;
 
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
+	old_man = ttm_manager_type(bo->bdev, bo->resource->mem_type);
+
 	if (new_man->use_tt && !vmw_memtype_is_system(new_mem->mem_type)) {
 		ret = vmw_ttm_bind(bo->bdev, bo->ttm, new_mem);
 		if (ret)
-- 
2.39.1

