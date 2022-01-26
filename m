Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F0949D3A9
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 21:37:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E4AE10E8FE;
	Wed, 26 Jan 2022 20:36:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 018E310E802;
 Wed, 26 Jan 2022 20:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643229387; x=1674765387;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tgargJNzKlTM8tDsHk4I1m9HBRI9PHrfYBs/SzQ0JCA=;
 b=LY/zdgFsn+zam4oi5TjeiZHqozZQN8DQKJjMFI+duHQxP0p8kifuo7UB
 eLObR/ymtS2ruFMy3/Ix24EHhw7TaeB4K0ixqCkQeviZDXDr5lW5ho8Nu
 17MlegvInw2aFyNy/KqXZ/cG5bDb+SZ6RIkAcnfGWhpOUYfSf2ifmFXqK
 eG6q8dQg+6tkbla34SziRSaBjEesXNA41wx2+9AqhwWUjDEgQ1vJPLWum
 cLwJcjoNFvMHN09J8/hgZTqHsYr5Pb9qpDRuZbCKirIji8mWkw2mWxxmi
 al40xqnNOJzn2AHiNpJKLCMAcz7Si/8pLuz8/R85tCWAIhdbDt4cE2YyQ Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="333000498"
X-IronPort-AV: E=Sophos;i="5.88,319,1635231600"; d="scan'208";a="333000498"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 12:36:22 -0800
X-IronPort-AV: E=Sophos;i="5.88,319,1635231600"; d="scan'208";a="581221501"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 12:36:22 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 04/19] drm/i915/guc: Keep dma_buf_map of ads_blob around
Date: Wed, 26 Jan 2022 12:36:47 -0800
Message-Id: <20220126203702.1784589-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220126203702.1784589-1-lucas.demarchi@intel.com>
References: <20220126203702.1784589-1-lucas.demarchi@intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert intel_guc_ads_create() and initialization to use dma_buf_map
rather than plain pointer and save it in the guc struct. This will help
with additional updates to the ads_blob after the
creation/initialization by abstracting the IO vs system memory.

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc.h     | 4 +++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c | 6 ++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index 697d9d66acef..e2e0df1c3d91 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -6,8 +6,9 @@
 #ifndef _INTEL_GUC_H_
 #define _INTEL_GUC_H_
 
-#include <linux/xarray.h>
 #include <linux/delay.h>
+#include <linux/dma-buf.h>
+#include <linux/xarray.h>
 
 #include "intel_uncore.h"
 #include "intel_guc_fw.h"
@@ -148,6 +149,7 @@ struct intel_guc {
 	struct i915_vma *ads_vma;
 	/** @ads_blob: contents of the GuC ADS */
 	struct __guc_ads_blob *ads_blob;
+	struct dma_buf_map ads_map;
 	/** @ads_regset_size: size of the save/restore regsets in the ADS */
 	u32 ads_regset_size;
 	/** @ads_golden_ctxt_size: size of the golden contexts in the ADS */
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index 668bf4ac9b0c..c012858376f0 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -623,6 +623,11 @@ int intel_guc_ads_create(struct intel_guc *guc)
 	if (ret)
 		return ret;
 
+	if (i915_gem_object_is_lmem(guc->ads_vma->obj))
+		dma_buf_map_set_vaddr_iomem(&guc->ads_map, (void __iomem *)guc->ads_blob);
+	else
+		dma_buf_map_set_vaddr(&guc->ads_map, guc->ads_blob);
+
 	__guc_ads_init(guc);
 
 	return 0;
@@ -644,6 +649,7 @@ void intel_guc_ads_destroy(struct intel_guc *guc)
 {
 	i915_vma_unpin_and_release(&guc->ads_vma, I915_VMA_RELEASE_MAP);
 	guc->ads_blob = NULL;
+	dma_buf_map_clear(&guc->ads_map);
 }
 
 static void guc_ads_private_data_reset(struct intel_guc *guc)
-- 
2.35.0

