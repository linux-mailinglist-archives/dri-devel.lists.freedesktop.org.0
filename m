Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DAA4DEA74
	for <lists+dri-devel@lfdr.de>; Sat, 19 Mar 2022 20:42:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4405E10ED79;
	Sat, 19 Mar 2022 19:42:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C7CC10E2E8;
 Sat, 19 Mar 2022 19:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647718952; x=1679254952;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rjwSuIUn6Jnmfr9jQ6pdOkmU1EWUv0epqhaVTmiX/lA=;
 b=IePVNZuL4k7ShheoKBGeKBaJZuYkRj9leTOJ+IHZw0ZcmJRne6eBZxRD
 jzkfzLzSsiH/3v/qVEI7eSeEgnEvba18BHkAnZ1gw5iGiKGr3ZmxeNI21
 CU9FMZt12Vn6y0JkkzaN0EJHsusErSYd3I8CfLfmLqshkc3NrrZmxlOgu
 ZrZ+M65I50o5MEC7/+hOogRayoCXYGzSe8iEU1y9wEpOd8w380rrv3uKj
 79v8KtnWX4sg9TBzOPlj2F3oIyGzYJqfKLxXE3Y+RThlgoFqv9MJAu54L
 7Vh4K7A9OrCYIaEWQJUIpB0wXdcbD6CwSZITk2BQFiRneG+q2t2RULEL+ g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10291"; a="282145182"
X-IronPort-AV: E=Sophos;i="5.90,195,1643702400"; d="scan'208";a="282145182"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2022 12:42:32 -0700
X-IronPort-AV: E=Sophos;i="5.90,195,1643702400"; d="scan'208";a="600019676"
Received: from jpulito-mobl2.amr.corp.intel.com (HELO mvcheng-desk2.intel.com)
 ([10.255.231.61])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2022 12:42:31 -0700
From: Michael Cheng <michael.cheng@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/4] i915/gem: drop wbinvd_on_all_cpus usage
Date: Sat, 19 Mar 2022 12:42:24 -0700
Message-Id: <20220319194227.297639-2-michael.cheng@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220319194227.297639-1-michael.cheng@intel.com>
References: <20220319194227.297639-1-michael.cheng@intel.com>
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
Cc: tvrtko.ursulin@linux.intel.com, thomas.hellstrom@linux.intel.com,
 michael.cheng@intel.com, wayne.boyer@intel.com, daniel.vetter@ffwll.ch,
 casey.g.bowman@intel.com, lucas.demarchi@intel.com,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Previous concern with using drm_clflush_sg was that we don't know what the
sg_table is pointing to, thus the usage of wbinvd_on_all_cpus to flush
everything at once to avoid paranoia.

To make i915 more architecture-neutral and be less paranoid, lets attempt to
use drm_clflush_sg to flush the pages for when the GPU wants to read
from main memory.

Signed-off-by: Michael Cheng <michael.cheng@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
index f5062d0c6333..b0a5baaebc43 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
@@ -8,6 +8,7 @@
 #include <linux/highmem.h>
 #include <linux/dma-resv.h>
 #include <linux/module.h>
+#include <drm/drm_cache.h>
 
 #include <asm/smp.h>
 
@@ -250,16 +251,10 @@ static int i915_gem_object_get_pages_dmabuf(struct drm_i915_gem_object *obj)
 	 * DG1 is special here since it still snoops transactions even with
 	 * CACHE_NONE. This is not the case with other HAS_SNOOP platforms. We
 	 * might need to revisit this as we add new discrete platforms.
-	 *
-	 * XXX: Consider doing a vmap flush or something, where possible.
-	 * Currently we just do a heavy handed wbinvd_on_all_cpus() here since
-	 * the underlying sg_table might not even point to struct pages, so we
-	 * can't just call drm_clflush_sg or similar, like we do elsewhere in
-	 * the driver.
 	 */
 	if (i915_gem_object_can_bypass_llc(obj) ||
 	    (!HAS_LLC(i915) && !IS_DG1(i915)))
-		wbinvd_on_all_cpus();
+		drm_clflush_sg(pages);
 
 	sg_page_sizes = i915_sg_dma_sizes(pages->sgl);
 	__i915_gem_object_set_pages(obj, pages, sg_page_sizes);
-- 
2.25.1

