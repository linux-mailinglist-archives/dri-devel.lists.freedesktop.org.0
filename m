Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7C24AD5B9
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 11:46:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5F4710E761;
	Tue,  8 Feb 2022 10:45:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B302510E65A;
 Tue,  8 Feb 2022 10:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644317113; x=1675853113;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hKsfs/ueD4khjt0zRLrFK6ml51A906EPY/V17+csL40=;
 b=JpfmqYZZ2vA5gxQmNQmWj7kN7zzOvicqjha4Z9L1/QK7V+164xKhv7za
 pxcB7nJU6727j+E0brSMS/cDtZNUuWCkjvhFZJwvLU8ElNZwCVITAEegb
 1+jQExXGyH3/F1DiMiu9K/k/j7vW83ePT2SvZXNeF4sa2CFpUKzxr+gvi
 tuy9v1ppkNsj3VnsCRunHQE3Y4rxqT0DNTLYWbp4cplmRpFT77RZrmkno
 fMLLYkFbwFNIy+gycXLW9h2pqr9z3pmD1SZ+TxWPn+l3xt+ZRTzRMLFVe
 BJ4DPg4fRKxpRUJJB6NTQjbt/NnRSrFEjx0BD6264hC54dH48xL8dBX99 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10251"; a="273451090"
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; d="scan'208";a="273451090"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 02:45:13 -0800
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; d="scan'208";a="700804162"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 02:45:10 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 18/18] drm/i915/guc: Remove plain ads_blob pointer
Date: Tue,  8 Feb 2022 02:45:24 -0800
Message-Id: <20220208104524.2516209-19-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220208104524.2516209-1-lucas.demarchi@intel.com>
References: <20220208104524.2516209-1-lucas.demarchi@intel.com>
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

Now we have the access to content of GuC ADS either using iosys_map
API or using a temporary buffer. Remove guc->ads_blob as there shouldn't
be updates using the bare pointer anymore.

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc.h     | 3 +--
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c | 8 ++++----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index f857e9190750..bf7079480d47 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -147,8 +147,7 @@ struct intel_guc {
 
 	/** @ads_vma: object allocated to hold the GuC ADS */
 	struct i915_vma *ads_vma;
-	/** @ads_blob: contents of the GuC ADS */
-	struct __guc_ads_blob *ads_blob;
+	/** @ads_map: contents of the GuC ADS */
 	struct iosys_map ads_map;
 	/** @ads_regset_size: size of the save/restore regsets in the ADS */
 	u32 ads_regset_size;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index d0593063c0dc..847e00390b00 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -667,6 +667,7 @@ static void __guc_ads_init(struct intel_guc *guc)
  */
 int intel_guc_ads_create(struct intel_guc *guc)
 {
+	void *ads_blob;
 	u32 size;
 	int ret;
 
@@ -691,14 +692,14 @@ int intel_guc_ads_create(struct intel_guc *guc)
 	size = guc_ads_blob_size(guc);
 
 	ret = intel_guc_allocate_and_map_vma(guc, size, &guc->ads_vma,
-					     (void **)&guc->ads_blob);
+					     &ads_blob);
 	if (ret)
 		return ret;
 
 	if (i915_gem_object_is_lmem(guc->ads_vma->obj))
-		iosys_map_set_vaddr_iomem(&guc->ads_map, (void __iomem *)guc->ads_blob);
+		iosys_map_set_vaddr_iomem(&guc->ads_map, (void __iomem *)ads_blob);
 	else
-		iosys_map_set_vaddr(&guc->ads_map, guc->ads_blob);
+		iosys_map_set_vaddr(&guc->ads_map, ads_blob);
 
 	__guc_ads_init(guc);
 
@@ -720,7 +721,6 @@ void intel_guc_ads_init_late(struct intel_guc *guc)
 void intel_guc_ads_destroy(struct intel_guc *guc)
 {
 	i915_vma_unpin_and_release(&guc->ads_vma, I915_VMA_RELEASE_MAP);
-	guc->ads_blob = NULL;
 	iosys_map_clear(&guc->ads_map);
 	kfree(guc->ads_regset);
 }
-- 
2.35.1

