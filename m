Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2939510D25
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 02:26:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F52B10EA0F;
	Wed, 27 Apr 2022 00:26:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A3CE10EA0F;
 Wed, 27 Apr 2022 00:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651019192; x=1682555192;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fDX3Wv1OPXgMC0aohqmdIA1KeuTtrc+9mfcl7MY8LBg=;
 b=nMTER7I3AK7Kumb0LNCX6Df5/Zy4YiFuA2MoFsshmn5Tim9PogAITkim
 gJ9rRe9ar2uRHlyq9FlMnJP3Rho6rtiQrjn6QC69HlMGFCB5GEaN6tmf2
 HsTro0y4BrOGp6jE1gnLumivhAqvMN16izcYImroVojQGtfQPHD9Ywium
 snrDHFhwn460M59Cc3m0l1t3K58kvystL/Z/AiqW1Qdo27j6ZsrraFMBL
 FKFjr/Ai3qXfk4/1eajiAYLTf3cmXyfbGfOhl675YGSA0zcGZTJN6/c8m
 sL2swQocY9h71lUFNUpuc/CaIg6AXoBSfk5L4ZAmNBhS6CX/55CX5xXXb g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="247695768"
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="247695768"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 17:26:32 -0700
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="730524663"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 17:26:31 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/4] drm/i915/huc: check HW directly for HuC auth status
Date: Tue, 26 Apr 2022 17:26:14 -0700
Message-Id: <20220427002617.1767295-2-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220427002617.1767295-1-daniele.ceraolospurio@intel.com>
References: <20220427002617.1767295-1-daniele.ceraolospurio@intel.com>
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The huc_is_authenticated function return is based on our SW tracking of
the HuC auth status. However, around suspend/resume and reset this can
go out of sync with the actual HW state, which is why we use
huc_check_state() to look at the actual HW state. Instead of having this
duality, just make huc_is_authenticated() return the HW state and use it
everywhere we need to know if HuC is running.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_huc.c | 23 ++++++++++++++---------
 drivers/gpu/drm/i915/gt/uc/intel_huc.h |  5 -----
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
index 556829de9c172..773020e69589a 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
@@ -80,6 +80,18 @@ void intel_huc_fini(struct intel_huc *huc)
 	intel_uc_fw_fini(&huc->fw);
 }
 
+static bool huc_is_authenticated(struct intel_huc *huc)
+{
+	struct intel_gt *gt = huc_to_gt(huc);
+	intel_wakeref_t wakeref;
+	u32 status = 0;
+
+	with_intel_runtime_pm(gt->uncore->rpm, wakeref)
+		status = intel_uncore_read(gt->uncore, huc->status.reg);
+
+	return (status & huc->status.mask) == huc->status.value;
+}
+
 /**
  * intel_huc_auth() - Authenticate HuC uCode
  * @huc: intel_huc structure
@@ -96,7 +108,7 @@ int intel_huc_auth(struct intel_huc *huc)
 	struct intel_guc *guc = &gt->uc.guc;
 	int ret;
 
-	GEM_BUG_ON(intel_huc_is_authenticated(huc));
+	GEM_BUG_ON(huc_is_authenticated(huc));
 
 	if (!intel_uc_fw_is_loaded(&huc->fw))
 		return -ENOEXEC;
@@ -150,10 +162,6 @@ int intel_huc_auth(struct intel_huc *huc)
  */
 int intel_huc_check_status(struct intel_huc *huc)
 {
-	struct intel_gt *gt = huc_to_gt(huc);
-	intel_wakeref_t wakeref;
-	u32 status = 0;
-
 	switch (__intel_uc_fw_status(&huc->fw)) {
 	case INTEL_UC_FIRMWARE_NOT_SUPPORTED:
 		return -ENODEV;
@@ -167,10 +175,7 @@ int intel_huc_check_status(struct intel_huc *huc)
 		break;
 	}
 
-	with_intel_runtime_pm(gt->uncore->rpm, wakeref)
-		status = intel_uncore_read(gt->uncore, huc->status.reg);
-
-	return (status & huc->status.mask) == huc->status.value;
+	return huc_is_authenticated(huc);
 }
 
 /**
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.h b/drivers/gpu/drm/i915/gt/uc/intel_huc.h
index 73ec670800f2b..77d813840d76c 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.h
@@ -50,11 +50,6 @@ static inline bool intel_huc_is_used(struct intel_huc *huc)
 	return intel_uc_fw_is_available(&huc->fw);
 }
 
-static inline bool intel_huc_is_authenticated(struct intel_huc *huc)
-{
-	return intel_uc_fw_is_running(&huc->fw);
-}
-
 void intel_huc_load_status(struct intel_huc *huc, struct drm_printer *p);
 
 #endif
-- 
2.25.1

