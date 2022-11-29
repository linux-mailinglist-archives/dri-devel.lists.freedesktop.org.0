Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 392CD63CBB3
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 00:20:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE24010E27D;
	Tue, 29 Nov 2022 23:20:34 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4175C10E27A;
 Tue, 29 Nov 2022 23:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669764028; x=1701300028;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CBoOj5X+qQgqyQtcIItXJdD/lSoIdd/N1o7zafZyEmA=;
 b=e4Lhi5RjDh7QnROhStHckKqR205DrZJba9DiZFwsTcoi+mTvtP/nj/a2
 9VBBQwlblHlFmsvEcUN4r8k6de8aBlvJkruGFOEggvYaYOjWsd6/FSayC
 Gj2KVjhddBhFt2vpkDFM06IHUxIMjBTSuJqvKPx/A6eJ34OyvdL3u49lQ
 rf1bzNsmSXLkOHyv5XFjKe7mO7/Jg0Nroj466gPbBnVdmrjEX3bkiC42Q
 P+MnSE967ZULU1T/NctnhfX4vEuA8lxpXf+e1DSq4HQp1OzDjTBDh1qaW
 sGnjcoWYFJkfzhjrOHsXVVr+UNskZeNfputdNNvoOeQIxfl9skEYmrD5Z A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="295616531"
X-IronPort-AV: E=Sophos;i="5.96,204,1665471600"; d="scan'208";a="295616531"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2022 15:20:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="818408131"
X-IronPort-AV: E=Sophos;i="5.96,204,1665471600"; d="scan'208";a="818408131"
Received: from relo-linux-5.jf.intel.com ([10.165.21.143])
 by orsmga005.jf.intel.com with ESMTP; 29 Nov 2022 15:20:26 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v3 1/3] drm/i915/uc: Rationalise delimiters in filename macros
Date: Tue, 29 Nov 2022 15:20:29 -0800
Message-Id: <20221129232031.3401386-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221129232031.3401386-1-John.C.Harrison@Intel.com>
References: <20221129232031.3401386-1-John.C.Harrison@Intel.com>
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
index 31613c7e0838b..848304b2f2e30 100644
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

