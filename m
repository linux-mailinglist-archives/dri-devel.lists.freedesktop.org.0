Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DB349D3A2
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 21:37:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 854DA10E94E;
	Wed, 26 Jan 2022 20:36:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDE0410E8F3;
 Wed, 26 Jan 2022 20:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643229388; x=1674765388;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bzf6lc9bApX/ewfhTO1t8CcPepjuy6Uh0vmFT+3QfBg=;
 b=eIlUoM8zRNwBO6HAoD+8pzUZag1WTcy2HMDXo5p4ksdnDfNupkXu8a9i
 OVf/MUF/GeJPv+2RWwKzqKJ9LluaNfS3eMsMjrNG5GAA8/KPxwV88nEE4
 9Xa2yyte7PdvPYs4wZsC1f8hDv1LiI3oo5V7Iv/oiGKjoC9AYyO5OXrqM
 5DL+Fp/bJQmeEI0f+dfz2ZHyTVJzSq9Q3UPQF1C0MeO6btTnPlABDr1lZ
 T2TppJVvZqgniFkzYsaEeGjWHK+ty6576/zkBKVnu/nr0ym8CxzATqSNh
 J8X46HaCujlYzGDzmFwGPNaz4OOCeKa6QBqfgm7YSGAo6s1pGmoRZxMzt Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="333000514"
X-IronPort-AV: E=Sophos;i="5.88,319,1635231600"; d="scan'208";a="333000514"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 12:36:24 -0800
X-IronPort-AV: E=Sophos;i="5.88,319,1635231600"; d="scan'208";a="581221534"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 12:36:24 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 14/19] drm/i915/guc: Convert capture list to dma_buf_map
Date: Wed, 26 Jan 2022 12:36:57 -0800
Message-Id: <20220126203702.1784589-15-lucas.demarchi@intel.com>
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

Use dma_buf_map to write the fields ads.capture_*.

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index dca7c3db9cdd..cad1e325656e 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -544,7 +544,7 @@ static void guc_init_golden_context(struct intel_guc *guc)
 	GEM_BUG_ON(guc->ads_golden_ctxt_size != total_size);
 }
 
-static void guc_capture_list_init(struct intel_guc *guc, struct __guc_ads_blob *blob)
+static void guc_capture_list_init(struct intel_guc *guc)
 {
 	int i, j;
 	u32 addr_ggtt, offset;
@@ -556,11 +556,11 @@ static void guc_capture_list_init(struct intel_guc *guc, struct __guc_ads_blob *
 
 	for (i = 0; i < GUC_CAPTURE_LIST_INDEX_MAX; i++) {
 		for (j = 0; j < GUC_MAX_ENGINE_CLASSES; j++) {
-			blob->ads.capture_instance[i][j] = addr_ggtt;
-			blob->ads.capture_class[i][j] = addr_ggtt;
+			ads_blob_write(guc, ads.capture_instance[i][j], addr_ggtt);
+			ads_blob_write(guc, ads.capture_class[i][j], addr_ggtt);
 		}
 
-		blob->ads.capture_global[i] = addr_ggtt;
+		ads_blob_write(guc, ads.capture_global[i], addr_ggtt);
 	}
 }
 
@@ -600,7 +600,7 @@ static void __guc_ads_init(struct intel_guc *guc)
 	base = intel_guc_ggtt_offset(guc, guc->ads_vma);
 
 	/* Capture list for hang debug */
-	guc_capture_list_init(guc, blob);
+	guc_capture_list_init(guc);
 
 	/* ADS */
 	blob->ads.scheduler_policies = base + ptr_offset(blob, policies);
-- 
2.35.0

