Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C085B9113
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 01:45:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67D7510E132;
	Wed, 14 Sep 2022 23:45:40 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8772310E132;
 Wed, 14 Sep 2022 23:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663199133; x=1694735133;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ipAsCdjCCDE/j0yO1hCFTzWn2JAHgrDPHnlIvQDlkMA=;
 b=jr9PY6bL7hEcGMy+ZPjLzfJtbhpgJ5D24qktzxNjtMH7J5oqVd25QSiX
 NTG1r8uuF1mmOsZlfDe5plqjKWBQ5vG2wyVrY9UVPe56zjbQZVj5VIx6A
 f1yhJb79ewp86Yxr6ajx4fZpcG8Y29h/2nU1kf8Rx4J6YMN3ExGyG5xqK
 qRTQAjgjpRPWWDW6ijy2Eo5vh39J/lvO2nRan/OBnqjNJcRk5XM7tEzyS
 IZ3YELgEUiBvkTehotMspFAyQhgWTtYVqysuz+QJ6G5BKYF+r55rcg0J5
 KM0LQ4RJcnlr3fbP4P5qPLmhW5PbjqCAvoqaMY2861NH6d9tADLDpaH6F g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10470"; a="384859082"
X-IronPort-AV: E=Sophos;i="5.93,316,1654585200"; d="scan'208";a="384859082"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2022 16:45:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,316,1654585200"; d="scan'208";a="568202658"
Received: from relo-linux-5.jf.intel.com ([10.165.21.154])
 by orsmga003.jf.intel.com with ESMTP; 14 Sep 2022 16:45:32 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 1/1] drm/i915/uc: Update to latest GuC and use new-format
 GuC/HuC names
Date: Wed, 14 Sep 2022 16:46:05 -0700
Message-Id: <20220914234605.622342-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220914234605.622342-1-John.C.Harrison@Intel.com>
References: <20220914234605.622342-1-John.C.Harrison@Intel.com>
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Going forwards, the intention is for GuC firmware files to be named
for their major version only and HuC firmware files to have no version
number in the name at all. This patch adds those entries for all
platforms that are officially GuC/HuC enabled.

Also, update the expected GuC version numbers to the latest firmware
release for those platforms.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index 1169e2a09da24..b91ad4aede1f7 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -72,12 +72,14 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
  * security fixes, etc. to be enabled.
  */
 #define INTEL_GUC_FIRMWARE_DEFS(fw_def, guc_maj, guc_mmp) \
-	fw_def(DG2,          0, guc_mmp(dg2,  70, 4, 1)) \
+	fw_def(DG2,          0, guc_maj(dg2,  70, 5)) \
+	fw_def(ALDERLAKE_P,  0, guc_maj(adlp, 70, 5)) \
 	fw_def(ALDERLAKE_P,  0, guc_mmp(adlp, 70, 1, 1)) \
 	fw_def(ALDERLAKE_P,  0, guc_mmp(adlp, 69, 0, 3)) \
+	fw_def(ALDERLAKE_S,  0, guc_maj(tgl,  70, 5)) \
 	fw_def(ALDERLAKE_S,  0, guc_mmp(tgl,  70, 1, 1)) \
 	fw_def(ALDERLAKE_S,  0, guc_mmp(tgl,  69, 0, 3)) \
-	fw_def(DG1,          0, guc_mmp(dg1,  70, 1, 1)) \
+	fw_def(DG1,          0, guc_maj(dg1,  70, 5)) \
 	fw_def(ROCKETLAKE,   0, guc_mmp(tgl,  70, 1, 1)) \
 	fw_def(TIGERLAKE,    0, guc_mmp(tgl,  70, 1, 1)) \
 	fw_def(JASPERLAKE,   0, guc_mmp(ehl,  70, 1, 1)) \
@@ -92,9 +94,11 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
 	fw_def(SKYLAKE,      0, guc_mmp(skl,  70, 1, 1))
 
 #define INTEL_HUC_FIRMWARE_DEFS(fw_def, huc_raw, huc_mmp) \
+	fw_def(ALDERLAKE_P,  0, huc_raw(tgl)) \
 	fw_def(ALDERLAKE_P,  0, huc_mmp(tgl,  7, 9, 3)) \
+	fw_def(ALDERLAKE_S,  0, huc_raw(tgl)) \
 	fw_def(ALDERLAKE_S,  0, huc_mmp(tgl,  7, 9, 3)) \
-	fw_def(DG1,          0, huc_mmp(dg1,  7, 9, 3)) \
+	fw_def(DG1,          0, huc_raw(dg1)) \
 	fw_def(ROCKETLAKE,   0, huc_mmp(tgl,  7, 9, 3)) \
 	fw_def(TIGERLAKE,    0, huc_mmp(tgl,  7, 9, 3)) \
 	fw_def(JASPERLAKE,   0, huc_mmp(ehl,  9, 0, 0)) \
-- 
2.37.3

