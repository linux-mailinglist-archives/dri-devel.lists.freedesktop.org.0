Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB174A006D
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 19:52:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2FE110E839;
	Fri, 28 Jan 2022 18:52:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF00E10E7E6;
 Fri, 28 Jan 2022 18:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643395940; x=1674931940;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ovHvM3IodaKvzqteIAV3pVOZXXDnULNc713QriI7oww=;
 b=lE6rk+rk3Hp7NyrO1n8cfyso0ceJ1Eu1epHIRBl/V3HVqiPx7q2PXKPa
 46BehYyRsgn27tpTuJnhyD0fo6Bpg+G5mrsNypCgwyeZ67sCq/kZ8QJvG
 eXNBqtf+4n8jxlc2ryyh6aZhd1ncx2RXe70XK7Ui7Or/NMyxTX+56S5IH
 aWjEEohV7mfGuL8eg74fEQgvkHZ3n6IgG+hdcXR9NTzC7ji/DhS0WgECN
 qCehFhGsK9/ekd+FJJ/fDHr1wleP9ngfK3+OghMUKE2jBJ4wXsIeNmd99
 1aPWaEuxLUHY5+l9Dk4AqGqGKs29+zIiaErtv1MlpsXENd5AGsPkJBhOq Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10240"; a="310490214"
X-IronPort-AV: E=Sophos;i="5.88,324,1635231600"; d="scan'208";a="310490214"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 10:52:19 -0800
X-IronPort-AV: E=Sophos;i="5.88,324,1635231600"; d="scan'208";a="625718084"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 10:52:17 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH 5/5] drm/i915/guc: Allow user to override driver load failure
 without GuC
Date: Sat, 29 Jan 2022 00:22:09 +0530
Message-Id: <20220128185209.18077-6-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220128185209.18077-1-ramalingam.c@intel.com>
References: <20220128185209.18077-1-ramalingam.c@intel.com>
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
Cc: Stuart Summers <stuart.summers@intel.com>,
 Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Stuart Summers <stuart.summers@intel.com>

The driver is set currently to fail modprobe when GuC is disabled
(enable_guc=0) after GuC has been loaded on a previous modprobe.
For GuC deprivilege, the BIOS is setting the locked bit, so the
driver always considers the GuC to have been loaded and thus does
not support enable_guc=0 on these platforms.

There are some debug scenarios where loading without GuC can be
interesting. Add a new feature flag for GuC deprivilege and a mode
(enable_guc=0x80) which can be exclusively set to skip the locked
bit check.

cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_uc.c | 17 +++++++++++++++--
 drivers/gpu/drm/i915/i915_params.h    |  1 +
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
index da199aa6989f..a1376dbd04fe 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
@@ -108,7 +108,7 @@ static void __confirm_options(struct intel_uc *uc)
 			 "Incompatible option enable_guc=%d - %s\n",
 			 i915->params.enable_guc, "GuC submission is N/A");
 
-	if (i915->params.enable_guc & ~ENABLE_GUC_MASK)
+	if (i915->params.enable_guc & ~(ENABLE_GUC_MASK | ENABLE_GUC_DO_NOT_LOAD_GUC))
 		drm_info(&i915->drm,
 			 "Incompatible option enable_guc=%d - %s\n",
 			 i915->params.enable_guc, "undocumented flag");
@@ -416,8 +416,21 @@ static bool uc_is_wopcm_locked(struct intel_uc *uc)
 	       (intel_uncore_read(uncore, DMA_GUC_WOPCM_OFFSET) & GUC_WOPCM_OFFSET_VALID);
 }
 
+static inline bool skip_lock_check(struct drm_i915_private *i915)
+{
+	/*
+	 * For platforms with GuC deprivilege, if a user *really* wants
+	 * to run without GuC, let that happen by setting enable_guc=0x80.
+	 */
+	return (HAS_GUC_DEPRIVILEGE(i915) &&
+		(i915->params.enable_guc & ENABLE_GUC_DO_NOT_LOAD_GUC) &&
+		!(i915->params.enable_guc & ~ENABLE_GUC_DO_NOT_LOAD_GUC));
+}
+
 static int __uc_check_hw(struct intel_uc *uc)
 {
+	struct drm_i915_private *i915 = uc_to_gt(uc)->i915;
+
 	if (!intel_uc_supports_guc(uc))
 		return 0;
 
@@ -426,7 +439,7 @@ static int __uc_check_hw(struct intel_uc *uc)
 	 * before on this system after reboot, otherwise we risk GPU hangs.
 	 * To check if GuC was loaded before we look at WOPCM registers.
 	 */
-	if (uc_is_wopcm_locked(uc))
+	if (uc_is_wopcm_locked(uc) && likely(!skip_lock_check(i915)))
 		return -EIO;
 
 	return 0;
diff --git a/drivers/gpu/drm/i915/i915_params.h b/drivers/gpu/drm/i915/i915_params.h
index c9d53ff910a0..8996ba2cc3a8 100644
--- a/drivers/gpu/drm/i915/i915_params.h
+++ b/drivers/gpu/drm/i915/i915_params.h
@@ -32,6 +32,7 @@ struct drm_printer;
 
 #define ENABLE_GUC_SUBMISSION		BIT(0)
 #define ENABLE_GUC_LOAD_HUC		BIT(1)
+#define ENABLE_GUC_DO_NOT_LOAD_GUC	BIT(7)
 #define ENABLE_GUC_MASK			GENMASK(1, 0)
 
 /*
-- 
2.20.1

