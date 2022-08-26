Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 475895A1F3E
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 05:06:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2209010E2B6;
	Fri, 26 Aug 2022 03:05:57 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 913A710E28A;
 Fri, 26 Aug 2022 03:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661483151; x=1693019151;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Q+0eRE0kilE9RgjFt+igsvIpc0KvJebeCn733L5iEJ8=;
 b=YUR/4RXFBqK0VlD1A5XDziOmjns3KzW8s4TZgAc8mQNnDErjhL+gkQEn
 WZvk/uPdskBhm4nZ6V7Yz58FLSqy9daQ284k1yuTLnLHZ5xqBja7wNVXG
 ttaXd04j0ReiCzqcE7M4WVP/+2OZCKHmWMycpXpRCSt6hOSCfFxlzaMFI
 OTgqU4tXsPqmBhrM1OYzJc4SkDJG6yYxnmUoKMgtpZJdTbds67IpvaTu+
 FU7gtSlHXf1/GfjeF+gmNVg83L3ELMhTIvzNH7qGw0aeaCWMpVsh0WeI/
 OdakJJmScFdsPYOBBlDnayMILdXGS+zcgvre6T47VDQjhOf8JuI8kXF6y g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10450"; a="281380684"
X-IronPort-AV: E=Sophos;i="5.93,264,1654585200"; d="scan'208";a="281380684"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2022 20:05:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,264,1654585200"; d="scan'208";a="610421805"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by orsmga002.jf.intel.com with ESMTP; 25 Aug 2022 20:05:50 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v2 3/3] drm/i915/uc: Enable version reduced firmware files for
 newest platforms
Date: Thu, 25 Aug 2022 20:05:53 -0700
Message-Id: <20220826030553.2611574-4-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220826030553.2611574-1-John.C.Harrison@Intel.com>
References: <20220826030553.2611574-1-John.C.Harrison@Intel.com>
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
number in the name at all. This patch adds those entries for DG1/2 and
ADL-P/S.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index 7c45c097d6845..d6e6fe10c5aca 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -72,11 +72,14 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
  * security fixes, etc. to be enabled.
  */
 #define INTEL_GUC_FIRMWARE_DEFS(fw_def, guc_maj, guc_mmp) \
-	fw_def(DG2,          0, guc_mmp(dg2,  70, 4, 1)) \
+	fw_def(DG2,          0, guc_maj(dg2,  70, 4)) \
+	fw_def(ALDERLAKE_P,  0, guc_maj(adlp, 70, 1)) \
 	fw_def(ALDERLAKE_P,  0, guc_mmp(adlp, 70, 1, 1)) \
 	fw_def(ALDERLAKE_P,  0, guc_mmp(adlp, 69, 0, 3)) \
+	fw_def(ALDERLAKE_S,  0, guc_maj(tgl,  70, 1)) \
 	fw_def(ALDERLAKE_S,  0, guc_mmp(tgl,  70, 1, 1)) \
 	fw_def(ALDERLAKE_S,  0, guc_mmp(tgl,  69, 0, 3)) \
+	fw_def(DG1,          0, guc_maj(dg1,  70, 1)) \
 	fw_def(DG1,          0, guc_mmp(dg1,  70, 1, 1)) \
 	fw_def(ROCKETLAKE,   0, guc_mmp(tgl,  70, 1, 1)) \
 	fw_def(TIGERLAKE,    0, guc_mmp(tgl,  70, 1, 1)) \
@@ -92,8 +95,11 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
 	fw_def(SKYLAKE,      0, guc_mmp(skl,  70, 1, 1))
 
 #define INTEL_HUC_FIRMWARE_DEFS(fw_def, huc_raw, huc_mmp) \
+	fw_def(ALDERLAKE_P,  0, huc_raw(tgl)) \
 	fw_def(ALDERLAKE_P,  0, huc_mmp(tgl,  7, 9, 3)) \
+	fw_def(ALDERLAKE_S,  0, huc_raw(tgl)) \
 	fw_def(ALDERLAKE_S,  0, huc_mmp(tgl,  7, 9, 3)) \
+	fw_def(DG1,          0, huc_raw(dg1)) \
 	fw_def(DG1,          0, huc_mmp(dg1,  7, 9, 3)) \
 	fw_def(ROCKETLAKE,   0, huc_mmp(tgl,  7, 9, 3)) \
 	fw_def(TIGERLAKE,    0, huc_mmp(tgl,  7, 9, 3)) \
-- 
2.37.2

