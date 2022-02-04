Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 504CD4A9DFB
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 18:45:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63D8A10EEED;
	Fri,  4 Feb 2022 17:45:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9159F10E8EC;
 Fri,  4 Feb 2022 17:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643996710; x=1675532710;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5gO6T8XWL1W/zM0H8HQzYzQpnrwHGrQIalBC7oa3aUw=;
 b=XJoDgMbJU/AoWYmez6bc0whWSjoIkir+aNXYtZpSEKN50/2r4CFJ7p7f
 SETvt2AtChAQVjGBpUt9qBzvOXtDlHzwBoqZ0U8LGQ5wmHkYRbrClvtTT
 AoR8SYZL1IHqN0zWgE9b38MVGXZiCNXjZTiETIbqj3PWhNMbOqb4IoG8D
 HndKGUXVo041MSR5nPIQ5MOrIOSvPOiLgHKGOknzXDKaoFvfEIEiE0BqD
 ChShx9kSpuCFNW3BuxC03UIl2sauYjN6cLzHcLuCVp4EKILbyOVt2qbJ5
 zCVO9rQcs61As6hPIAqp+dScS6RrUMOprOotHGF1TjsFDLhbLYVLdw6E/ Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10248"; a="247242173"
X-IronPort-AV: E=Sophos;i="5.88,343,1635231600"; d="scan'208";a="247242173"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 09:45:09 -0800
X-IronPort-AV: E=Sophos;i="5.88,343,1635231600"; d="scan'208";a="539240799"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 09:45:08 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 05/19] drm/i915/guc: Keep iosys_map of ads_blob around
Date: Fri,  4 Feb 2022 09:44:22 -0800
Message-Id: <20220204174436.830121-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220204174436.830121-1-lucas.demarchi@intel.com>
References: <20220204174436.830121-1-lucas.demarchi@intel.com>
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
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert intel_guc_ads_create() and initialization to use iosys_map
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
index 697d9d66acef..9b9ba79f7594 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -6,8 +6,9 @@
 #ifndef _INTEL_GUC_H_
 #define _INTEL_GUC_H_
 
-#include <linux/xarray.h>
 #include <linux/delay.h>
+#include <linux/iosys-map.h>
+#include <linux/xarray.h>
 
 #include "intel_uncore.h"
 #include "intel_guc_fw.h"
@@ -148,6 +149,7 @@ struct intel_guc {
 	struct i915_vma *ads_vma;
 	/** @ads_blob: contents of the GuC ADS */
 	struct __guc_ads_blob *ads_blob;
+	struct iosys_map ads_map;
 	/** @ads_regset_size: size of the save/restore regsets in the ADS */
 	u32 ads_regset_size;
 	/** @ads_golden_ctxt_size: size of the golden contexts in the ADS */
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index e61150adcbe9..13671b186908 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -624,6 +624,11 @@ int intel_guc_ads_create(struct intel_guc *guc)
 	if (ret)
 		return ret;
 
+	if (i915_gem_object_is_lmem(guc->ads_vma->obj))
+		iosys_map_set_vaddr_iomem(&guc->ads_map, (void __iomem *)guc->ads_blob);
+	else
+		iosys_map_set_vaddr(&guc->ads_map, guc->ads_blob);
+
 	__guc_ads_init(guc);
 
 	return 0;
@@ -645,6 +650,7 @@ void intel_guc_ads_destroy(struct intel_guc *guc)
 {
 	i915_vma_unpin_and_release(&guc->ads_vma, I915_VMA_RELEASE_MAP);
 	guc->ads_blob = NULL;
+	iosys_map_clear(&guc->ads_map);
 }
 
 static void guc_ads_private_data_reset(struct intel_guc *guc)
-- 
2.35.1

