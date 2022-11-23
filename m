Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CBB636D2C
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 23:32:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20EA810E656;
	Wed, 23 Nov 2022 22:31:51 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 033D210E64A;
 Wed, 23 Nov 2022 22:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669242687; x=1700778687;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ln5UizDXlx8cVXqMuGhMrtXacj7NzgtrDRsK6Ff0CoA=;
 b=a8z7VyElHSpf0KL9o0URCuI5S+Vb8h2SQ2eFtyvYt9mX6BLJ1pCPNfz6
 oUo39caZZ/t48HhMMvOfbJuNlXV8hIH/nfSNVWHVfrYBQDv40OPu4g8u5
 wIsHS7eFiQfFI64wCAJdVUNOFNxWVa9D+Fh/IBebHqk5HQruD7jcHDPtn
 RswL6bgEcK1ZQv84WzpFwB0h7YPp1PlVzQQL6fw+7Dqey3SAhxm3mVt6L
 s3TbSZ97B2jSyOSR99lz/MXD5Yixv2m5dm1Im8dKlbtwUU73QxPMWjQzp
 hgKfHY0QKND0SPTA0nf0u5l3qddTROusM5aWjsrm7lakjjD1PfmbleFlq A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="314204546"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; d="scan'208";a="314204546"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2022 14:31:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="642012964"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; d="scan'208";a="642012964"
Received: from relo-linux-5.jf.intel.com ([10.165.21.144])
 by orsmga002.jf.intel.com with ESMTP; 23 Nov 2022 14:31:13 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v2 1/3] drm/i915/uc: Rationalise delimiters in filename macros
Date: Wed, 23 Nov 2022 14:31:06 -0800
Message-Id: <20221123223108.1696415-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221123223108.1696415-1-John.C.Harrison@Intel.com>
References: <20221123223108.1696415-1-John.C.Harrison@Intel.com>
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

The way delimiters (underscores and dots) were added to the UC
filenames was different for different types of delimiter. Rationalise
them to all be done the same way - implicitly in the concatenation
macro rather than explicitly in the file name prefix.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index 0c80ba51a4bdc..774c3d84a4243 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -118,35 +118,35 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
  */
 #define __MAKE_UC_FW_PATH_BLANK(prefix_, name_) \
 	"i915/" \
-	__stringify(prefix_) name_ ".bin"
+	__stringify(prefix_) "_" name_ ".bin"
 
 #define __MAKE_UC_FW_PATH_MAJOR(prefix_, name_, major_) \
 	"i915/" \
-	__stringify(prefix_) name_ \
+	__stringify(prefix_) "_" name_ "_" \
 	__stringify(major_) ".bin"
 
 #define __MAKE_UC_FW_PATH_MMP(prefix_, name_, major_, minor_, patch_) \
 	"i915/" \
-	__stringify(prefix_) name_ \
+	__stringify(prefix_) "_" name_  "_" \
 	__stringify(major_) "." \
 	__stringify(minor_) "." \
 	__stringify(patch_) ".bin"
 
 /* Minor for internal driver use, not part of file name */
 #define MAKE_GUC_FW_PATH_MAJOR(prefix_, major_, minor_) \
-	__MAKE_UC_FW_PATH_MAJOR(prefix_, "_guc_", major_)
+	__MAKE_UC_FW_PATH_MAJOR(prefix_, "guc", major_)
 
 #define MAKE_GUC_FW_PATH_MMP(prefix_, major_, minor_, patch_) \
-	__MAKE_UC_FW_PATH_MMP(prefix_, "_guc_", major_, minor_, patch_)
+	__MAKE_UC_FW_PATH_MMP(prefix_, "guc", major_, minor_, patch_)
 
 #define MAKE_HUC_FW_PATH_BLANK(prefix_) \
-	__MAKE_UC_FW_PATH_BLANK(prefix_, "_huc")
+	__MAKE_UC_FW_PATH_BLANK(prefix_, "huc")
 
 #define MAKE_HUC_FW_PATH_GSC(prefix_) \
-	__MAKE_UC_FW_PATH_BLANK(prefix_, "_huc_gsc")
+	__MAKE_UC_FW_PATH_BLANK(prefix_, "huc_gsc")
 
 #define MAKE_HUC_FW_PATH_MMP(prefix_, major_, minor_, patch_) \
-	__MAKE_UC_FW_PATH_MMP(prefix_, "_huc_", major_, minor_, patch_)
+	__MAKE_UC_FW_PATH_MMP(prefix_, "huc", major_, minor_, patch_)
 
 /*
  * All blobs need to be declared via MODULE_FIRMWARE().
-- 
2.37.3

