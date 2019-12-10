Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF20118829
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 13:31:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 003206E8DA;
	Tue, 10 Dec 2019 12:31:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AF876E8DA;
 Tue, 10 Dec 2019 12:31:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Dec 2019 04:31:43 -0800
X-IronPort-AV: E=Sophos;i="5.69,299,1571727600"; d="scan'208";a="203173225"
Received: from orilivne-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.51.68])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Dec 2019 04:31:41 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 8/8] drm/i915/wopcm: convert to drm device based logging
Date: Tue, 10 Dec 2019 14:30:50 +0200
Message-Id: <20191210123050.8799-8-jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191210123050.8799-1-jani.nikula@intel.com>
References: <20191210123050.8799-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prefer drm_dbg() over DRM_DEV_DEBUG_DRIVER().

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/intel_wopcm.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_wopcm.c b/drivers/gpu/drm/i915/intel_wopcm.c
index 2bb9f9f9a50a..4e8f2862cfff 100644
--- a/drivers/gpu/drm/i915/intel_wopcm.c
+++ b/drivers/gpu/drm/i915/intel_wopcm.c
@@ -86,7 +86,7 @@ void intel_wopcm_init_early(struct intel_wopcm *wopcm)
 	else
 		wopcm->size = GEN9_WOPCM_SIZE;
 
-	DRM_DEV_DEBUG_DRIVER(i915->drm.dev, "WOPCM: %uK\n", wopcm->size / 1024);
+	drm_dbg(&i915->drm, "WOPCM: %uK\n", wopcm->size / 1024);
 }
 
 static inline u32 context_reserved_size(struct drm_i915_private *i915)
@@ -242,10 +242,8 @@ void intel_wopcm_init(struct intel_wopcm *wopcm)
 		return;
 
 	if (__wopcm_regs_locked(gt->uncore, &guc_wopcm_base, &guc_wopcm_size)) {
-		DRM_DEV_DEBUG_DRIVER(i915->drm.dev,
-				     "GuC WOPCM is already locked [%uK, %uK)\n",
-				     guc_wopcm_base / SZ_1K,
-				     guc_wopcm_size / SZ_1K);
+		drm_dbg(&i915->drm, "GuC WOPCM is already locked [%uK, %uK)\n",
+			guc_wopcm_base / SZ_1K, guc_wopcm_size / SZ_1K);
 		goto check;
 	}
 
@@ -266,8 +264,8 @@ void intel_wopcm_init(struct intel_wopcm *wopcm)
 	guc_wopcm_size = wopcm->size - ctx_rsvd - guc_wopcm_base;
 	guc_wopcm_size &= GUC_WOPCM_SIZE_MASK;
 
-	DRM_DEV_DEBUG_DRIVER(i915->drm.dev, "Calculated GuC WOPCM [%uK, %uK)\n",
-			     guc_wopcm_base / SZ_1K, guc_wopcm_size / SZ_1K);
+	drm_dbg(&i915->drm, "Calculated GuC WOPCM [%uK, %uK)\n",
+		guc_wopcm_base / SZ_1K, guc_wopcm_size / SZ_1K);
 
 check:
 	if (__check_layout(i915, wopcm->size, guc_wopcm_base, guc_wopcm_size,
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
