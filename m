Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A4C3659CE
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 15:19:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A1F46E820;
	Tue, 20 Apr 2021 13:19:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 446C56E81C;
 Tue, 20 Apr 2021 13:19:49 +0000 (UTC)
IronPort-SDR: o6J+3lvStL6J/oCCzXXuFhnQ8fvuc48khQXoWBhoWyfdlTy1vyJYL920ayWM1s435QTZDohKj/
 HbXTJX9D5blw==
X-IronPort-AV: E=McAfee;i="6200,9189,9960"; a="192315867"
X-IronPort-AV: E=Sophos;i="5.82,237,1613462400"; d="scan'208";a="192315867"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2021 06:19:49 -0700
IronPort-SDR: W8mJB2p0n3Iv4ZSk9uxyyqtQoggDignicL4d2OWlUav1LRAF9gf9ISoyjWr+McjSgKR6eUNOYb
 QX7sc9LCmZNA==
X-IronPort-AV: E=Sophos;i="5.82,237,1613462400"; d="scan'208";a="534484896"
Received: from adrianwa-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.252.9.139])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2021 06:19:47 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 4/5] drm/i915/stolen: pass the allocation flags
Date: Tue, 20 Apr 2021 14:18:41 +0100
Message-Id: <20210420131842.164163-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210420131842.164163-1-matthew.auld@intel.com>
References: <20210420131842.164163-1-matthew.auld@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 CQ Tang <cq.tang@intel.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: CQ Tang <cq.tang@intel.com>

Stolen memory is always allocated as physically contiguous pages, mark
the object flags as such.

v2: move setting I915_BO_ALLOC_CONTIGUOUS into create_stolen

Signed-off-by: CQ Tang <cq.tang@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index 4f9fe5aca37e..46f79b240df7 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -633,14 +633,21 @@ static const struct drm_i915_gem_object_ops i915_gem_object_stolen_ops = {
 
 static int __i915_gem_object_create_stolen(struct intel_memory_region *mem,
 					   struct drm_i915_gem_object *obj,
-					   struct drm_mm_node *stolen)
+					   struct drm_mm_node *stolen,
+					   unsigned int flags)
 {
 	static struct lock_class_key lock_class;
 	unsigned int cache_level;
 	int err;
 
+	/*
+	 * Stolen objects are always physically contiguous since we just
+	 * allocate one big block underneath using the drm_mm range allocator.
+	 */
+	flags |= I915_BO_ALLOC_CONTIGUOUS;
+
 	drm_gem_private_object_init(&mem->i915->drm, &obj->base, stolen->size);
-	i915_gem_object_init(obj, &i915_gem_object_stolen_ops, &lock_class, 0);
+	i915_gem_object_init(obj, &i915_gem_object_stolen_ops, &lock_class, flags);
 
 	obj->stolen = stolen;
 	obj->read_domains = I915_GEM_DOMAIN_CPU | I915_GEM_DOMAIN_GTT;
@@ -682,7 +689,7 @@ static int _i915_gem_object_stolen_init(struct intel_memory_region *mem,
 	if (ret)
 		goto err_free;
 
-	ret = __i915_gem_object_create_stolen(mem, obj, stolen);
+	ret = __i915_gem_object_create_stolen(mem, obj, stolen, flags);
 	if (ret)
 		goto err_remove;
 
@@ -700,7 +707,7 @@ i915_gem_object_create_stolen(struct drm_i915_private *i915,
 			      resource_size_t size)
 {
 	return i915_gem_object_create_region(i915->mm.stolen_region,
-					     size, I915_BO_ALLOC_CONTIGUOUS);
+					     size, 0);
 }
 
 static int init_stolen_smem(struct intel_memory_region *mem)
@@ -866,7 +873,7 @@ i915_gem_object_create_stolen_for_preallocated(struct drm_i915_private *i915,
 		goto err_stolen;
 	}
 
-	ret = __i915_gem_object_create_stolen(mem, obj, stolen);
+	ret = __i915_gem_object_create_stolen(mem, obj, stolen, 0);
 	if (ret)
 		goto err_object_free;
 
-- 
2.26.3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
