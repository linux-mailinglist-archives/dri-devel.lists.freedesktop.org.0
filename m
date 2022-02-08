Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CD34AD5AB
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 11:45:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FE0E10E6C6;
	Tue,  8 Feb 2022 10:45:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BE2810E66B;
 Tue,  8 Feb 2022 10:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644317114; x=1675853114;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2lrGnLRs5mNfikzeKc7WPr/9xYVAmPT9rkFqJSW9Wig=;
 b=Wo2JWYvQaTRxfEkzx+0NJm5AW8WTQSk0Rt54/mDdje0RsSFaNcAUN/JW
 uqEoITMQ6JMXCHdvZMMU8e6Uz1Un1G3drZApVZypwoShc8ZL2NBdpe5x7
 44fEtcDDfCFbNWR5SAvwsO5U/ADvICfZUAz2AZ4DTLh4DswmKSeSYGdP0
 Pm1/NCliZzsS5/OQOeepB5P0S0IGYWdL8rE8V7xogH1YDl07ZKGndkvgj
 MGuYP4Vq6YHzGfUpv4xrqISmnYKn+fJptf+Xn5p5NUn4y8s9IxLr7WSyT
 hPFQqUzgTKRjBPsdGlCwYSxHWXMYGiUf6UxN1Uga/rRqCrUY1CuYLJjd0 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10251"; a="249130489"
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; d="scan'208";a="249130489"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 02:45:12 -0800
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; d="scan'208";a="700804145"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 02:45:10 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 13/18] drm/i915/guc: Convert capture list to iosys_map
Date: Tue,  8 Feb 2022 02:45:19 -0800
Message-Id: <20220208104524.2516209-14-lucas.demarchi@intel.com>
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

Use iosys_map to write the fields ads.capture_*.

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
index 9230e1a499aa..1f6a3d4d9431 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -541,7 +541,7 @@ static void guc_init_golden_context(struct intel_guc *guc)
 	GEM_BUG_ON(guc->ads_golden_ctxt_size != total_size);
 }
 
-static void guc_capture_list_init(struct intel_guc *guc, struct __guc_ads_blob *blob)
+static void guc_capture_list_init(struct intel_guc *guc)
 {
 	int i, j;
 	u32 addr_ggtt, offset;
@@ -553,11 +553,11 @@ static void guc_capture_list_init(struct intel_guc *guc, struct __guc_ads_blob *
 
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
 
@@ -597,7 +597,7 @@ static void __guc_ads_init(struct intel_guc *guc)
 	base = intel_guc_ggtt_offset(guc, guc->ads_vma);
 
 	/* Capture list for hang debug */
-	guc_capture_list_init(guc, blob);
+	guc_capture_list_init(guc);
 
 	/* ADS */
 	blob->ads.scheduler_policies = base + ptr_offset(blob, policies);
-- 
2.35.1

