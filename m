Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA8E5A3364
	for <lists+dri-devel@lfdr.de>; Sat, 27 Aug 2022 03:17:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E258D10EAE1;
	Sat, 27 Aug 2022 01:17:04 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D89EF10EADC;
 Sat, 27 Aug 2022 01:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661563018; x=1693099018;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hkyXu+3jCQNIU9BoHS06FKlqx5t4fcwEeVKqr47FY3k=;
 b=fThDfBjz/ZA0Wwv2MDB0wU6vBy6WWF+heFUNQ5tVrbnL9adaIwWftSxb
 TfuLreYIerVlwlBiszIJXMt6swpZuUJ52tNKwiv808vIXXUyA8T/5SWWA
 DrQ3loA8tZCr9L9ggyc8lKuwOpK7RmS8yB7w8K5ogGwqStYakGKgpFHYW
 B64zJ56Fg1aAo5BCcS30LtSpIpwYhm9pcQflwpAtbxLMj3x2xHR8tXHhT
 UKq37B+r5XH3wvuzfSYLFd66lVbGCBMl7H0RMPWZJiHNb7+D/N3xdqgIE
 u8MqdRaFNKh8RWVO7IJqsu0muikJkjy3AMT3JY0FhjI9jiRkm3pOGy+wM A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10451"; a="320733976"
X-IronPort-AV: E=Sophos;i="5.93,267,1654585200"; d="scan'208";a="320733976"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2022 18:16:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,267,1654585200"; d="scan'208";a="610741939"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga002.jf.intel.com with ESMTP; 26 Aug 2022 18:16:57 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v3 3/3] drm/i915/uc: Enable version reduced firmware files for
 newest platforms
Date: Fri, 26 Aug 2022 18:17:02 -0700
Message-Id: <20220827011702.3465334-4-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220827011702.3465334-1-John.C.Harrison@Intel.com>
References: <20220827011702.3465334-1-John.C.Harrison@Intel.com>
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
index af425916cdf64..78b1198bcf39b 100644
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

