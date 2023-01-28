Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB93067FAA8
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jan 2023 20:59:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CE7C10E294;
	Sat, 28 Jan 2023 19:59:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1C4110E1F3;
 Sat, 28 Jan 2023 19:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674935962; x=1706471962;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qMrelAzcUjwVCwnjedcx0WuIMD1C35P8jS2ZRKY5ctI=;
 b=mvWiHdK+qlh5e/yWPth7l+34BVVIpSQnmKwathgMdyaXXIWV0Gb+BPu1
 kMb70n5MzCwIPbRVJEBNmoeODSWO7L9Uk7Pz4jcBKu18Oizr2YeMVbSse
 TjZMFrBwXpJqOlMK54dvEmF0kpwRojUzGQi7X2e0fusETFFArbAC6b+fd
 Z2AotpyriYbcypGxatGjBvH/X7LdFzDlBxQgtTr0FvYd598ZysyJYibG9
 I0TGaiXZ0s6AOu6HsyDugBYzclM0AuCnOHD1909qeYjyBR4lARsVMlpvs
 EXuoJahU1SxAxTDwYfa/RomVheGIUJxLHiN0R0VopemEL5n26/mGBEIXK w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="306978119"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; d="scan'208";a="306978119"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2023 11:59:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="613567939"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; d="scan'208";a="613567939"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orsmga003.jf.intel.com with ESMTP; 28 Jan 2023 11:59:20 -0800
Received: from mwajdecz-MOBL.ger.corp.intel.com
 (mwajdecz-MOBL.ger.corp.intel.com [10.249.137.106])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 18C62333EC;
 Sat, 28 Jan 2023 19:59:20 +0000 (GMT)
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 4/8] drm/i915/guc: Update GuC messages in intel_guc_ct.c
Date: Sat, 28 Jan 2023 20:59:03 +0100
Message-Id: <20230128195907.1837-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230128195907.1837-1-michal.wajdeczko@intel.com>
References: <20230128195907.1837-1-michal.wajdeczko@intel.com>
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
Cc: John Harrison <John.C.Harrison@Intel.com>, dri-devel@lists.freedesktop.org,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use new macros to have common prefix that also include GT#.

v2: drop unused helpers

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 23 ++++-------------------
 1 file changed, 4 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index 2b22065e87bf..1803a633ed64 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -11,38 +11,23 @@
 
 #include "i915_drv.h"
 #include "intel_guc_ct.h"
-#include "gt/intel_gt.h"
+#include "intel_guc_print.h"
 
 static inline struct intel_guc *ct_to_guc(struct intel_guc_ct *ct)
 {
 	return container_of(ct, struct intel_guc, ct);
 }
 
-static inline struct intel_gt *ct_to_gt(struct intel_guc_ct *ct)
-{
-	return guc_to_gt(ct_to_guc(ct));
-}
-
-static inline struct drm_i915_private *ct_to_i915(struct intel_guc_ct *ct)
-{
-	return ct_to_gt(ct)->i915;
-}
-
-static inline struct drm_device *ct_to_drm(struct intel_guc_ct *ct)
-{
-	return &ct_to_i915(ct)->drm;
-}
-
 #define CT_ERROR(_ct, _fmt, ...) \
-	drm_err(ct_to_drm(_ct), "CT: " _fmt, ##__VA_ARGS__)
+	guc_err(ct_to_guc(_ct), "CT: " _fmt, ##__VA_ARGS__)
 #ifdef CONFIG_DRM_I915_DEBUG_GUC
 #define CT_DEBUG(_ct, _fmt, ...) \
-	drm_dbg(ct_to_drm(_ct), "CT: " _fmt, ##__VA_ARGS__)
+	guc_dbg(ct_to_guc(_ct), "CT: " _fmt, ##__VA_ARGS__)
 #else
 #define CT_DEBUG(...)	do { } while (0)
 #endif
 #define CT_PROBE_ERROR(_ct, _fmt, ...) \
-	i915_probe_error(ct_to_i915(ct), "CT: " _fmt, ##__VA_ARGS__)
+	guc_probe_error(ct_to_guc(ct), "CT: " _fmt, ##__VA_ARGS__)
 
 /**
  * DOC: CTB Blob
-- 
2.25.1

