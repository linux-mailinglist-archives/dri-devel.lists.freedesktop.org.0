Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B17D4325F0
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 20:06:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 149026EA90;
	Mon, 18 Oct 2021 18:06:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B51B96EA66;
 Mon, 18 Oct 2021 18:06:17 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10141"; a="251786690"
X-IronPort-AV: E=Sophos;i="5.85,382,1624345200"; d="scan'208";a="251786690"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2021 10:49:29 -0700
X-IronPort-AV: E=Sophos;i="5.85,382,1624345200"; d="scan'208";a="526358849"
Received: from cscleary-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.13.221])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2021 10:49:24 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 9/9] drm/i915/selftests: mark up hugepages object with
 start_cpu_write
Date: Mon, 18 Oct 2021 18:45:08 +0100
Message-Id: <20211018174508.2137279-9-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20211018174508.2137279-1-matthew.auld@intel.com>
References: <20211018174508.2137279-1-matthew.auld@intel.com>
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

Just like we do for internal objects. Also just use
i915_gem_object_set_cache_coherency() here. No need for over-flushing on
LLC platforms.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/selftests/huge_pages.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
index 41d0680f3bd7..b2003133deaf 100644
--- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
+++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
@@ -136,6 +136,8 @@ static void put_huge_pages(struct drm_i915_gem_object *obj,
 	huge_pages_free_pages(pages);
 
 	obj->mm.dirty = false;
+
+	__start_cpu_write(obj);
 }
 
 static const struct drm_i915_gem_object_ops huge_page_ops = {
@@ -152,6 +154,7 @@ huge_pages_object(struct drm_i915_private *i915,
 {
 	static struct lock_class_key lock_class;
 	struct drm_i915_gem_object *obj;
+	unsigned int cache_level;
 
 	GEM_BUG_ON(!size);
 	GEM_BUG_ON(!IS_ALIGNED(size, BIT(__ffs(page_mask))));
@@ -173,7 +176,9 @@ huge_pages_object(struct drm_i915_private *i915,
 
 	obj->write_domain = I915_GEM_DOMAIN_CPU;
 	obj->read_domains = I915_GEM_DOMAIN_CPU;
-	obj->cache_level = I915_CACHE_NONE;
+
+	cache_level = HAS_LLC(i915) ? I915_CACHE_LLC : I915_CACHE_NONE;
+	i915_gem_object_set_cache_coherency(obj, cache_level);
 
 	obj->mm.page_mask = page_mask;
 
-- 
2.26.3

