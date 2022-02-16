Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B434B8F7B
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 18:41:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4807910E8D6;
	Wed, 16 Feb 2022 17:41:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FF5010E859;
 Wed, 16 Feb 2022 17:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645033260; x=1676569260;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vlXEMle1HLq1hf+RJ3WqOQut1raydOTHoXTFodk7P1o=;
 b=TFI1cLthjk2TefT82nWVD7nH49zfY928Dyns8WGyG71b2W1aJ2H1WnTd
 ORSRvNUuVAjYSr6ry5XUKveUmf3eVxmVGgaD3WQLG7N/pSlfKTVnZTmSA
 Pkz88bE5hBNCy7uWoZ18tovy7bEP7dbUfJad2vTZpdUngBPh1WbqhzZC0
 gUVtrDUUUHPnX8iNik6+FLKw+cmUUGBE7XsC8FXZQiEmxKjYSfNl80SFB
 YWxmKp1HFywXenN+JiwLN5lna84iTJkAI0sjnAzE6QavM9nZImG6QV5bt
 rs8uqvad3uA8+DI+sxxOjj/bFLZz8SfHZZ3lwO9q7CAcHhi/CJbsNSRqm Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="230641973"
X-IronPort-AV: E=Sophos;i="5.88,374,1635231600"; d="scan'208";a="230641973"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 09:41:00 -0800
X-IronPort-AV: E=Sophos;i="5.88,374,1635231600"; d="scan'208";a="540226734"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 09:40:59 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 13/16] drm/i915/guc: Convert capture list to iosys_map
Date: Wed, 16 Feb 2022 09:41:44 -0800
Message-Id: <20220216174147.3073235-14-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220216174147.3073235-1-lucas.demarchi@intel.com>
References: <20220216174147.3073235-1-lucas.demarchi@intel.com>
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
 Sumit Semwal <sumit.semwal@linaro.org>,
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
index c3c31b679e79..ec0ccdf98dfa 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -580,7 +580,7 @@ static void guc_init_golden_context(struct intel_guc *guc)
 	GEM_BUG_ON(guc->ads_golden_ctxt_size != total_size);
 }
 
-static void guc_capture_list_init(struct intel_guc *guc, struct __guc_ads_blob *blob)
+static void guc_capture_list_init(struct intel_guc *guc)
 {
 	int i, j;
 	u32 addr_ggtt, offset;
@@ -592,11 +592,11 @@ static void guc_capture_list_init(struct intel_guc *guc, struct __guc_ads_blob *
 
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
 
@@ -636,7 +636,7 @@ static void __guc_ads_init(struct intel_guc *guc)
 	base = intel_guc_ggtt_offset(guc, guc->ads_vma);
 
 	/* Capture list for hang debug */
-	guc_capture_list_init(guc, blob);
+	guc_capture_list_init(guc);
 
 	/* ADS */
 	blob->ads.scheduler_policies = base + ptr_offset(blob, policies);
-- 
2.35.1

