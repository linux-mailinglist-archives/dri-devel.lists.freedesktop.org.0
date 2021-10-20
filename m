Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A871343479E
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 11:06:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA73E6E8DA;
	Wed, 20 Oct 2021 09:06:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA9876E23F;
 Wed, 20 Oct 2021 09:06:43 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10142"; a="228607075"
X-IronPort-AV: E=Sophos;i="5.87,166,1631602800"; d="scan'208";a="228607075"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2021 02:06:43 -0700
X-IronPort-AV: E=Sophos;i="5.87,166,1631602800"; d="scan'208";a="463105214"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2021 02:06:43 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Chris Wilson <chris@chris-wilson.co.uk>, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/gem: stop using PAGE_KERNEL_IO
Date: Wed, 20 Oct 2021 02:06:25 -0700
Message-Id: <20211020090625.1037517-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.33.1
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

PAGE_KERNEL_IO is only defined for x86 and is the same as PAGE_KERNEL.
Use the latter since that is also available on other archs, which should
help us getting i915 there.

This is the same that was done done in commit 80c33624e472 ("io-mapping:
Fixup for different names of writecombine"). Later the commit
80c33624e472 ("io-mapping: Fixup for different names of writecombine")
added a "Fixes" tag to the first one, but that is actually fixing a
separate issue:  the different names for pgprot_writecombine().

Fast-forward today, it seems the only 2 archs that define
pgprot_noncached_wc() are microblaze and powerpc. Microblaze has the
same definition for pgprot_writecombine() since commit
97ccedd793ac ("microblaze: Provide pgprot_device/writecombine macros for
nommu"). Powerpc has 3 variants and all of them have the same behavior
for pgprot_writecombine() and pgprot_noncached_wc(). From the commit message
and linked issue, the fallback was needed for arm, but apparently today
all the variants there also have pgprot_writecombine().

So, just use PAGE_KERNEL, and just use pgprot_writecombine().

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_pages.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
index 8eb1c3a6fc9c..68fe1837ef54 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
@@ -289,7 +289,7 @@ static void *i915_gem_object_map_page(struct drm_i915_gem_object *obj,
 		pgprot = PAGE_KERNEL;
 		break;
 	case I915_MAP_WC:
-		pgprot = pgprot_writecombine(PAGE_KERNEL_IO);
+		pgprot = pgprot_writecombine(PAGE_KERNEL);
 		break;
 	}
 
@@ -333,7 +333,7 @@ static void *i915_gem_object_map_pfn(struct drm_i915_gem_object *obj,
 	i = 0;
 	for_each_sgt_daddr(addr, iter, obj->mm.pages)
 		pfns[i++] = (iomap + addr) >> PAGE_SHIFT;
-	vaddr = vmap_pfn(pfns, n_pfn, pgprot_writecombine(PAGE_KERNEL_IO));
+	vaddr = vmap_pfn(pfns, n_pfn, pgprot_writecombine(PAGE_KERNEL));
 	if (pfns != stack)
 		kvfree(pfns);
 
-- 
2.33.1

