Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A04B03F0A02
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 19:13:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3B866E872;
	Wed, 18 Aug 2021 17:13:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85CCD6E871;
 Wed, 18 Aug 2021 17:13:00 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10080"; a="216413311"
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; d="scan'208";a="216413311"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2021 10:12:11 -0700
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; d="scan'208";a="521161874"
Received: from moloings-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.10.29])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2021 10:12:09 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH] drm/i915/ttm: ensure we release the intel_memory_region
Date: Wed, 18 Aug 2021 18:12:03 +0100
Message-Id: <20210818171203.237687-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the ttm_bo_init_reserved() call fails ensure we also release the
region, otherwise we leak the reference, or worse hit some uaf, when we
start using the objects.list. Also remove the make_unshrinkable call
here, which doesn't do anything.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 771eb2963123..2e8cdcd5e4f7 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -909,7 +909,6 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
 	drm_gem_private_object_init(&i915->drm, &obj->base, size);
 	i915_gem_object_init(obj, &i915_gem_ttm_obj_ops, &lock_class, flags);
 	i915_gem_object_init_memory_region(obj, mem);
-	i915_gem_object_make_unshrinkable(obj);
 	INIT_RADIX_TREE(&obj->ttm.get_io_page.radix, GFP_KERNEL | __GFP_NOWARN);
 	mutex_init(&obj->ttm.get_io_page.lock);
 	bo_type = (obj->flags & I915_BO_ALLOC_USER) ? ttm_bo_type_device :
@@ -932,7 +931,7 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
 				   page_size >> PAGE_SHIFT,
 				   &ctx, NULL, NULL, i915_ttm_bo_destroy);
 	if (ret)
-		return i915_ttm_err_to_gem(ret);
+		goto err_release_mr;
 
 	obj->ttm.created = true;
 	i915_ttm_adjust_domains_after_move(obj);
@@ -940,6 +939,10 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
 	i915_gem_object_unlock(obj);
 
 	return 0;
+
+err_release_mr:
+	i915_gem_object_release_memory_region(obj);
+	return i915_ttm_err_to_gem(ret);
 }
 
 static const struct intel_memory_region_ops ttm_system_region_ops = {
-- 
2.26.3

