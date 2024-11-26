Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3FA9D9CD2
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 18:45:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82D3810E989;
	Tue, 26 Nov 2024 17:45:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jg+s9C6r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CF79899A3;
 Tue, 26 Nov 2024 17:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732643141; x=1764179141;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2UtGyq/lRvOedV6NogXlhOKXVU2SqJ38dULZ3utOG9I=;
 b=Jg+s9C6ruhf3VZdm22+OFnXuWCpHHXFJvyg6io7g6Fks66IcW9HNjIkK
 3AX4sRDaVDL2CNIqn1n1IMYp1CVi4K9T6EP1NtQR33gNFz90SqDVLFDnW
 MR+Hnf1UQ04ZwPWTUt4aJ7IvHN3tV9ksCETHrjU9+9Ge48+yJ1CdxHA3W
 I/gi28Brt8cNplfdnE3cnwBxXqF7Pax8XJwZFFDWOZ7+JBXcnEx6XXzXO
 INVSIliVe3F2GHxXEhxtqdksskqmt0UNqvnasWIyIqNFcJiTQXNLf/CEU
 5hzobk0oxWge9ceuj0+0mZfnzOhwPE0VqTK/SyDkXAjkPNubxSdbus562 g==;
X-CSE-ConnectionGUID: DPgLdBboSyePcITtD20ldg==
X-CSE-MsgGUID: lgNNJxPGRACkyjLXtcsXXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="32676917"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="32676917"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 09:45:40 -0800
X-CSE-ConnectionGUID: MXR9KQy8QiO/EZH43oZQsg==
X-CSE-MsgGUID: z32JHp2ATBujHbrZyXghhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="92152585"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 09:45:40 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: christian.koenig@amd.com,
	thomas.hellstrom@linux.intel.com
Subject: [PATCH v7 5/8] drm/xe/display: Update intel_bo_read_from_page to use
 ttm_bo_access
Date: Tue, 26 Nov 2024 09:46:12 -0800
Message-Id: <20241126174615.2665852-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241126174615.2665852-1-matthew.brost@intel.com>
References: <20241126174615.2665852-1-matthew.brost@intel.com>
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

Don't open code vmap of a BO, use ttm_bo_access helper which is safe for
non-contiguous BOs and non-visible BOs.

Suggested-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/display/intel_bo.c | 25 +------------------------
 1 file changed, 1 insertion(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/intel_bo.c b/drivers/gpu/drm/xe/display/intel_bo.c
index 9f54fad0f1c0..43141964f6f2 100644
--- a/drivers/gpu/drm/xe/display/intel_bo.c
+++ b/drivers/gpu/drm/xe/display/intel_bo.c
@@ -40,31 +40,8 @@ int intel_bo_fb_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
 int intel_bo_read_from_page(struct drm_gem_object *obj, u64 offset, void *dst, int size)
 {
 	struct xe_bo *bo = gem_to_xe_bo(obj);
-	struct ttm_bo_kmap_obj map;
-	void *src;
-	bool is_iomem;
-	int ret;
 
-	ret = xe_bo_lock(bo, true);
-	if (ret)
-		return ret;
-
-	ret = ttm_bo_kmap(&bo->ttm, offset >> PAGE_SHIFT, 1, &map);
-	if (ret)
-		goto out_unlock;
-
-	offset &= ~PAGE_MASK;
-	src = ttm_kmap_obj_virtual(&map, &is_iomem);
-	src += offset;
-	if (is_iomem)
-		memcpy_fromio(dst, (void __iomem *)src, size);
-	else
-		memcpy(dst, src, size);
-
-	ttm_bo_kunmap(&map);
-out_unlock:
-	xe_bo_unlock(bo);
-	return ret;
+	return ttm_bo_access(&bo->ttm, offset, dst, size, 0);
 }
 
 struct intel_frontbuffer *intel_bo_get_frontbuffer(struct drm_gem_object *obj)
-- 
2.34.1

