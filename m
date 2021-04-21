Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B41366972
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 12:47:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABEED6E987;
	Wed, 21 Apr 2021 10:47:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34ABC6E982;
 Wed, 21 Apr 2021 10:47:17 +0000 (UTC)
IronPort-SDR: N9xknx45e/6Nca7EiNN2krldEO3Jakp7ulswHxYlB4wUrbvObrdlHP2/RaXqkeZMenZviUcOQs
 Tc/1vQq9CeRw==
X-IronPort-AV: E=McAfee;i="6200,9189,9960"; a="175784352"
X-IronPort-AV: E=Sophos;i="5.82,238,1613462400"; d="scan'208";a="175784352"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2021 03:47:16 -0700
IronPort-SDR: 92QWXgVTIAH/jJ7gDAks2qFCv4GQimLZOk3Rkeoj1UNtpC/QIf3UfK0hfoHT8EkELobMrBOORL
 Wtk5uDysbAAQ==
X-IronPort-AV: E=Sophos;i="5.82,238,1613462400"; d="scan'208";a="427468840"
Received: from ddacost1-mobl1.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.252.9.23])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2021 03:47:15 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 4/4] drm/i915/stolen: actually mark as contiguous
Date: Wed, 21 Apr 2021 11:46:58 +0100
Message-Id: <20210421104658.304142-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210421104658.304142-1-matthew.auld@intel.com>
References: <20210421104658.304142-1-matthew.auld@intel.com>
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
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Stolen memory is always allocated as physically contiguous pages, so
mark the object flags as such. It looks like the flags were previously
just ignored so this had no effect. In the future we might to add the
proper plumbing for passing the flags all over the way down from the
caller, but for now we don't have a use for that.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index b43929da8de8..c5b64b2400e8 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -637,10 +637,17 @@ static int __i915_gem_object_create_stolen(struct intel_memory_region *mem,
 {
 	static struct lock_class_key lock_class;
 	unsigned int cache_level;
+	unsigned int flags;
 	int err;
 
+	/*
+	 * Stolen objects are always physically contiguous since we just
+	 * allocate one big block underneath using the drm_mm range allocator.
+	 */
+	flags = I915_BO_ALLOC_CONTIGUOUS;
+
 	drm_gem_private_object_init(&mem->i915->drm, &obj->base, stolen->size);
-	i915_gem_object_init(obj, &i915_gem_object_stolen_ops, &lock_class, 0);
+	i915_gem_object_init(obj, &i915_gem_object_stolen_ops, &lock_class, flags);
 
 	obj->stolen = stolen;
 	obj->read_domains = I915_GEM_DOMAIN_CPU | I915_GEM_DOMAIN_GTT;
@@ -699,8 +706,7 @@ struct drm_i915_gem_object *
 i915_gem_object_create_stolen(struct drm_i915_private *i915,
 			      resource_size_t size)
 {
-	return i915_gem_object_create_region(i915->mm.stolen_region,
-					     size, I915_BO_ALLOC_CONTIGUOUS);
+	return i915_gem_object_create_region(i915->mm.stolen_region, size, 0);
 }
 
 static int init_stolen_smem(struct intel_memory_region *mem)
-- 
2.26.3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
