Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B62C56B832F
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 21:56:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3951210E62C;
	Mon, 13 Mar 2023 20:56:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA05A10E62B;
 Mon, 13 Mar 2023 20:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678740969; x=1710276969;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=THTDwnCqhVLz4biurwKN/PQ3gMDzRpGjfirl/XaLMq8=;
 b=CmILjQk94t120XeKe9DtwhPxAOvQ/IATIAvscfsIHdw8ASSAWxl2Bfz5
 GDQAIgmNmBU10Ce9Dg3HZ/2M4fBP/zOLQ5VWoXvjhzamtUzk/Iy4efE47
 zSfGzeSnT1qrwdytdGKcHGlIihHiytwbE2X/87qRltsv3GvS2TI4sBBEH
 POH0aVDvzx3l9dYMehs1wPyoLaImbXMVoLngFF99/TIjKNG12P0lcVmMP
 +WWwAqg2WV5o99BS3wo4yEXNbBodpLCypEFwavbmDlDtJOpSc7wrddYhx
 79P5S5GjWOxGM0WWpqPYqSMVSTgqVqMF4zaJ13a4BtDTYh/YK/NoodPPS w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="399850516"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; d="scan'208";a="399850516"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 13:56:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="656090768"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; d="scan'208";a="656090768"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 13:56:08 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/huc: Cancel HuC delayed load timer on reset.
Date: Mon, 13 Mar 2023 13:55:56 -0700
Message-Id: <20230313205556.1174503-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.3
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the rare case where we do a full GT reset after starting the HuC
load and before it completes (which basically boils down to i915 hanging
during init), we need to cancel the delayed load fence, as it will be
re-initialized in the post-reset recovery.

Fixes: 27536e03271d ("drm/i915/huc: track delayed HuC load with a fence")
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_huc.c | 7 +++++++
 drivers/gpu/drm/i915/gt/uc/intel_huc.h | 7 +------
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
index 72884e21470b..aefdaa62da99 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
@@ -241,6 +241,13 @@ static void delayed_huc_load_fini(struct intel_huc *huc)
 	i915_sw_fence_fini(&huc->delayed_load.fence);
 }
 
+int intel_huc_sanitize(struct intel_huc *huc)
+{
+	delayed_huc_load_complete(huc);
+	intel_uc_fw_sanitize(&huc->fw);
+	return 0;
+}
+
 static bool vcs_supported(struct intel_gt *gt)
 {
 	intel_engine_mask_t mask = gt->info.engine_mask;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.h b/drivers/gpu/drm/i915/gt/uc/intel_huc.h
index 52db03620c60..db555b3c1f56 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.h
@@ -41,6 +41,7 @@ struct intel_huc {
 	} delayed_load;
 };
 
+int intel_huc_sanitize(struct intel_huc *huc);
 void intel_huc_init_early(struct intel_huc *huc);
 int intel_huc_init(struct intel_huc *huc);
 void intel_huc_fini(struct intel_huc *huc);
@@ -54,12 +55,6 @@ bool intel_huc_is_authenticated(struct intel_huc *huc);
 void intel_huc_register_gsc_notifier(struct intel_huc *huc, struct bus_type *bus);
 void intel_huc_unregister_gsc_notifier(struct intel_huc *huc, struct bus_type *bus);
 
-static inline int intel_huc_sanitize(struct intel_huc *huc)
-{
-	intel_uc_fw_sanitize(&huc->fw);
-	return 0;
-}
-
 static inline bool intel_huc_is_supported(struct intel_huc *huc)
 {
 	return intel_uc_fw_is_supported(&huc->fw);
-- 
2.37.3

