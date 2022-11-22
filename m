Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC22634539
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 21:09:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F9F010E460;
	Tue, 22 Nov 2022 20:09:32 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D26CC10E455;
 Tue, 22 Nov 2022 20:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669147764; x=1700683764;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hWOiaNsDZCyUwS2Hs2Fgg6TzCkA8ghF32kXLVEdJTPc=;
 b=Y7DYbkCM5viGjWTps8dkC9MMvE19WTnu5RGbyNo8eC02RZiTR5z46M3c
 5Ml1kiqUmR/FZe+bZt2aXwpZjuLnkIfQodbcHAtimrVgARh7NZlutMPHH
 YjvKDg/3/zeQ9esfr/cN1I8Tx4AzXfjM55Bxv6bnIMxFmkfaDfhDBO+dh
 ZNWDWInRICj4ysAMC9e0ToomQ0dq9jOSkajk8oHE0NfzrBkiC11MZh6dn
 JO7scmCwE4ZceDpfwDMjivKuawQbbSaX6eOqlb5TuBoquixKVZlbkU3Bp
 GwJ50bobO1jnyT3z6Yb9VNKxrGaS6XCW958t5cNJObdwY1rqlYUnlc2Nb Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="301459452"
X-IronPort-AV: E=Sophos;i="5.96,185,1665471600"; d="scan'208";a="301459452"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2022 12:09:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="783966950"
X-IronPort-AV: E=Sophos;i="5.96,185,1665471600"; d="scan'208";a="783966950"
Received: from relo-linux-5.jf.intel.com ([10.165.21.144])
 by fmsmga001.fm.intel.com with ESMTP; 22 Nov 2022 12:09:23 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 1/3] drm/i915/uc: Rationalise delimiters in filename macros
Date: Tue, 22 Nov 2022 12:09:13 -0800
Message-Id: <20221122200915.680629-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221122200915.680629-1-John.C.Harrison@Intel.com>
References: <20221122200915.680629-1-John.C.Harrison@Intel.com>
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

The way delimieters (underscores and dots) were added to the UC
filenames was different for different types of delimter. Rationalise
them to all be done the same way - implicitly in the concatenation
macro rather than explicitly in the file name prefix.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
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

