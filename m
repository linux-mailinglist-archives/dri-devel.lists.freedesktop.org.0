Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E426F4DBF
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 01:40:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2077B10E166;
	Tue,  2 May 2023 23:40:02 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAD4310E127;
 Tue,  2 May 2023 23:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683070797; x=1714606797;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZnlFMrm3vSe/fgzpcy4mVJfRTwg0AFpN2wuu12IUBAg=;
 b=HsI3lMNnzVTPtKfFZ0Rdxd82SDogp+CC881LWkfHoscHMthcEH2/2TDA
 /jY3Gvdyxm/xaG/lF4TChy1jYUuejN4u81e1/zlJx5cmxLxdIwo4zmBB4
 Ho3Qsa1CBDXbFOfsbIhVtu426aOMxPHVWgKmVXicrGge8/VwWFx1pkPI8
 uZDWlTJ17afzEc08+X5llcEpSpMxJTl3lTJVCUWk9LW8bInx2IIuy8Gra
 oi9xEPzaySy2K/oFesOoBzRXy7yly1brgKCnwdN1HJ1mvy4tcevcLbAtw
 NOJ35yfWDoYehvUmQMAiYZmCeaO1dSDDSeS231SC7TlwVMReEdwYO6yLg g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="350601510"
X-IronPort-AV: E=Sophos;i="5.99,245,1677571200"; d="scan'208";a="350601510"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2023 16:39:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="673865810"
X-IronPort-AV: E=Sophos;i="5.99,245,1677571200"; d="scan'208";a="673865810"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga006.jf.intel.com with ESMTP; 02 May 2023 16:39:56 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v3 1/6] drm/i915/guc: Decode another GuC load failure case
Date: Tue,  2 May 2023 16:40:02 -0700
Message-Id: <20230502234007.1762014-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230502234007.1762014-1-John.C.Harrison@Intel.com>
References: <20230502234007.1762014-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
 John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Explain another potential firmware failure mode and early exit the
long wait if hit.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h | 1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c       | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h
index bcb1129b36102..dabeaf4f245f3 100644
--- a/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h
+++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h
@@ -44,6 +44,7 @@ enum intel_guc_load_status {
 enum intel_bootrom_load_status {
 	INTEL_BOOTROM_STATUS_NO_KEY_FOUND                 = 0x13,
 	INTEL_BOOTROM_STATUS_AES_PROD_KEY_FOUND           = 0x1A,
+	INTEL_BOOTROM_STATUS_PROD_KEY_CHECK_FAILURE       = 0x2B,
 	INTEL_BOOTROM_STATUS_RSA_FAILED                   = 0x50,
 	INTEL_BOOTROM_STATUS_PAVPC_FAILED                 = 0x73,
 	INTEL_BOOTROM_STATUS_WOPCM_FAILED                 = 0x74,
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
index 6fda3aec5c66a..0ff088a5e51a8 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
@@ -129,6 +129,7 @@ static inline bool guc_load_done(struct intel_uncore *uncore, u32 *status, bool
 	case INTEL_BOOTROM_STATUS_RC6CTXCONFIG_FAILED:
 	case INTEL_BOOTROM_STATUS_MPUMAP_INCORRECT:
 	case INTEL_BOOTROM_STATUS_EXCEPTION:
+	case INTEL_BOOTROM_STATUS_PROD_KEY_CHECK_FAILURE:
 		*success = false;
 		return true;
 	}
@@ -219,6 +220,11 @@ static int guc_wait_ucode(struct intel_guc *guc)
 			guc_info(guc, "firmware signature verification failed\n");
 			ret = -ENOEXEC;
 			break;
+
+		case INTEL_BOOTROM_STATUS_PROD_KEY_CHECK_FAILURE:
+			guc_info(guc, "firmware production part check failure\n");
+			ret = -ENOEXEC;
+			break;
 		}
 
 		switch (ukernel) {
-- 
2.39.1

