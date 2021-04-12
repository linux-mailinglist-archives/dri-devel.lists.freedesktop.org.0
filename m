Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 931A635BF8A
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 11:09:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2FF96E2D5;
	Mon, 12 Apr 2021 09:09:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81C3A6E15D;
 Mon, 12 Apr 2021 09:09:27 +0000 (UTC)
IronPort-SDR: aysdOmSjHrO7a+g9pnx9HE2cdjSflpHr7CnyRM2FsH66ld8lJazjlg/LpZzgP0uG8TlLspaA63
 Ai/5DBvYqw/w==
X-IronPort-AV: E=McAfee;i="6000,8403,9951"; a="193709710"
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; d="scan'208";a="193709710"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2021 02:09:27 -0700
IronPort-SDR: 4NC2i1NKZZmRlLGWYeT0uzWe0cwtHh30fRHtt2nZEivaK9IEAFDZlz0MGUHRYnvbAsjZjDacUP
 zIdn6yqgF6yA==
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; d="scan'208";a="423712636"
Received: from tarynrox-mobl1.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.252.5.30])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2021 02:09:25 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 06/19] drm/i915/stolen: pass the allocation flags
Date: Mon, 12 Apr 2021 10:05:13 +0100
Message-Id: <20210412090526.30547-7-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210412090526.30547-1-matthew.auld@intel.com>
References: <20210412090526.30547-1-matthew.auld@intel.com>
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
Cc: CQ Tang <cq.tang@intel.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: CQ Tang <cq.tang@intel.com>

Stolen memory is always allocated as physically contiguous pages, mark
the object flags as such.

Signed-off-by: CQ Tang <cq.tang@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index f713eabb7671..49a2dfcc8ba7 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -633,14 +633,15 @@ static const struct drm_i915_gem_object_ops i915_gem_object_stolen_ops = {
 
 static int __i915_gem_object_create_stolen(struct intel_memory_region *mem,
 					   struct drm_i915_gem_object *obj,
-					   struct drm_mm_node *stolen)
+					   struct drm_mm_node *stolen,
+					   unsigned int flags)
 {
 	static struct lock_class_key lock_class;
 	unsigned int cache_level;
 	int err;
 
 	drm_gem_private_object_init(&mem->i915->drm, &obj->base, stolen->size);
-	i915_gem_object_init(obj, &i915_gem_object_stolen_ops, &lock_class, 0);
+	i915_gem_object_init(obj, &i915_gem_object_stolen_ops, &lock_class, flags);
 
 	obj->stolen = stolen;
 	obj->read_domains = I915_GEM_DOMAIN_CPU | I915_GEM_DOMAIN_GTT;
@@ -682,7 +683,7 @@ static int _i915_gem_object_stolen_init(struct intel_memory_region *mem,
 	if (ret)
 		goto err_free;
 
-	ret = __i915_gem_object_create_stolen(mem, obj, stolen);
+	ret = __i915_gem_object_create_stolen(mem, obj, stolen, flags);
 	if (ret)
 		goto err_remove;
 
@@ -840,7 +841,8 @@ i915_gem_object_create_stolen_for_preallocated(struct drm_i915_private *i915,
 		goto err_stolen;
 	}
 
-	ret = __i915_gem_object_create_stolen(mem, obj, stolen);
+	ret = __i915_gem_object_create_stolen(mem, obj, stolen,
+					      I915_BO_ALLOC_CONTIGUOUS);
 	if (ret)
 		goto err_object_free;
 
-- 
2.26.3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
