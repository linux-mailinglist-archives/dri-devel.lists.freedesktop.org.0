Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC248501ACD
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 20:10:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9A4F10E18B;
	Thu, 14 Apr 2022 18:10:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5168C10E1B8;
 Thu, 14 Apr 2022 18:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649959823; x=1681495823;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rjwSuIUn6Jnmfr9jQ6pdOkmU1EWUv0epqhaVTmiX/lA=;
 b=YWhcHtnTZ0OXY3uMqleNx3PKfyuquygmrnrb2LRRenUj1xBTm8cPDLqq
 m/mmuls/OvyNsyCrDW53HLFM8MtnHFaKkOHAF74t0K/QJHPTwvHr1Qe1H
 6rjLUc8a+a9lM197zGck3CSIx8h4j9s1ocSz3OFrv3TG74MlzpZSxNAhZ
 7gnVZ8JwxhRZCH0CQmUDOeaqHDs+oNbpfubz9t1H1YlWw1AQM2ZXrQqqo
 COlmMzDvYZGT6/dBOUZ5q4iWI9e7CLKt8M7lSKZQ7UBafciH13evzOTjR
 DoU46kWpX+vZm+M6fdNwUkD1/64TDy6mJUol8S062VcVa1vul2JDIsooC g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10317"; a="288056646"
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="288056646"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 11:10:22 -0700
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="725467858"
Received: from vijayve-mobl1.amr.corp.intel.com (HELO mvcheng-desk2.intel.com)
 ([10.212.162.57])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 11:10:22 -0700
From: Michael Cheng <michael.cheng@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 1/1] i915/gem: drop wbinvd_on_all_cpus usage
Date: Thu, 14 Apr 2022 11:10:19 -0700
Message-Id: <20220414181019.24701-2-michael.cheng@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220414181019.24701-1-michael.cheng@intel.com>
References: <20220414181019.24701-1-michael.cheng@intel.com>
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
Cc: thomas.hellstrom@linux.intel.com, michael.cheng@intel.com,
 wayne.boyer@intel.com, casey.g.bowman@intel.com, lucas.demarchi@intel.com,
 dri-devel@lists.freedesktop.org
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

