Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D92249D3BB
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 21:37:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82B3710E8F3;
	Wed, 26 Jan 2022 20:36:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A904E10E91D;
 Wed, 26 Jan 2022 20:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643229388; x=1674765388;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3jmDiWUEtRCn5pgI7a3cD0afFPjqoS4Yz9KjtGbG6yg=;
 b=UBGbpB3T3caIShLsAgYJQ56P7Gcgf6ttSGLRkDR2qbCcpVBjyTV8Y8JT
 OG2RlxvU1Zk9y/iTJqmopY3AzQkKtz7gwIJZto/2RqWo+AD3Dt3Fd9BCa
 CzJMC8/Lt3omfhzGiCrjZ4cj4rU2DX7s8y29KQci0kS3wlHv+LP6mgx+Y
 6WWo8k/mbdUR/IoAomljzm/CC2F5HhzQWpXw9P9OJ4IO3gKmZ70Nye4EQ
 3JHhL109plqMUn7k+PC9UK4rhSD22DdfKlLqi/aNFuZaH3ZnoqM+aQCJX
 tqofjzdJa7XUy64kRGfe44/0ZCVz2jPLk2T2+xtqs5mHBwjTKwL6M/U9w g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="333000523"
X-IronPort-AV: E=Sophos;i="5.88,319,1635231600"; d="scan'208";a="333000523"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 12:36:26 -0800
X-IronPort-AV: E=Sophos;i="5.88,319,1635231600"; d="scan'208";a="581221550"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 12:36:25 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 19/19] drm/i915/guc: Remove plain ads_blob pointer
Date: Wed, 26 Jan 2022 12:37:02 -0800
Message-Id: <20220126203702.1784589-20-lucas.demarchi@intel.com>
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

Now we have the access to content of GuC ADS either using dma_buf_map
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
index 4c852eee3ad8..7349483d0e35 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -147,8 +147,7 @@ struct intel_guc {
 
 	/** @ads_vma: object allocated to hold the GuC ADS */
 	struct i915_vma *ads_vma;
-	/** @ads_blob: contents of the GuC ADS */
-	struct __guc_ads_blob *ads_blob;
+	/** @ads_map: contents of the GuC ADS */
 	struct dma_buf_map ads_map;
 	/** @ads_regset_size: size of the save/restore regsets in the ADS */
 	u32 ads_regset_size;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index 30edac93afbf..b87269081650 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -661,6 +661,7 @@ static void __guc_ads_init(struct intel_guc *guc)
  */
 int intel_guc_ads_create(struct intel_guc *guc)
 {
+	void *ads_blob;
 	u32 size;
 	int ret;
 
@@ -685,14 +686,14 @@ int intel_guc_ads_create(struct intel_guc *guc)
 	size = guc_ads_blob_size(guc);
 
 	ret = intel_guc_allocate_and_map_vma(guc, size, &guc->ads_vma,
-					     (void **)&guc->ads_blob);
+					     &ads_blob);
 	if (ret)
 		return ret;
 
 	if (i915_gem_object_is_lmem(guc->ads_vma->obj))
-		dma_buf_map_set_vaddr_iomem(&guc->ads_map, (void __iomem *)guc->ads_blob);
+		dma_buf_map_set_vaddr_iomem(&guc->ads_map, (void __iomem *)ads_blob);
 	else
-		dma_buf_map_set_vaddr(&guc->ads_map, guc->ads_blob);
+		dma_buf_map_set_vaddr(&guc->ads_map, ads_blob);
 
 	__guc_ads_init(guc);
 
@@ -714,7 +715,6 @@ void intel_guc_ads_init_late(struct intel_guc *guc)
 void intel_guc_ads_destroy(struct intel_guc *guc)
 {
 	i915_vma_unpin_and_release(&guc->ads_vma, I915_VMA_RELEASE_MAP);
-	guc->ads_blob = NULL;
 	dma_buf_map_clear(&guc->ads_map);
 	kfree(guc->ads_regset);
 }
-- 
2.35.0

