Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B97DE6EA0F0
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 03:16:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8C5610ED7F;
	Fri, 21 Apr 2023 01:15:41 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F169910ED6E;
 Fri, 21 Apr 2023 01:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682039732; x=1713575732;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Xv1p78MpGCSOGGD2HdJfwn+pVhf27jOeFiz5EMsVIgY=;
 b=fy1uIvW10KGj118j8bIEz1J8amWXCCNX+71BZPaq8PUY4Jc1XFBggJ1j
 jYDcRl8QYD0IZsLkOb9SF4wMDFZaZXMyVmXfoLYLKJXxusT+uFd+ptiOs
 T3kg45+bF72Y7KZLOFTi7ACoCUS1KNeosX1aOsnDOkb18HquGNtz703Sm
 QmYE5e6IunO0zfz04zHB3oxCFRVEXtBCTNCZ+h6W14V0YyRfBgV4Z8cwb
 X5/xxaEd3DnhKsjE0iF9nH3qVaF2Ppns4/hg0yJh2zDSsiU0T1OxzC8AF
 E9Le4lMkmd9I0EBuBxDvVOHIUltEL5Ygb1zLoCfNawmDmBZfyUocu5AdI A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="343380941"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="343380941"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 18:15:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="692114496"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="692114496"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga002.jf.intel.com with ESMTP; 20 Apr 2023 18:15:31 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 6/6] drm/i915/uc: Make unexpected firmware versions an error
 in debug builds
Date: Thu, 20 Apr 2023 18:15:25 -0700
Message-Id: <20230421011525.3282664-7-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230421011525.3282664-1-John.C.Harrison@Intel.com>
References: <20230421011525.3282664-1-John.C.Harrison@Intel.com>
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

If the DEBUG_GEM config option is set then escalate the 'unexpected
firmware version' message from a notice to an error. This will ensure
that the CI system treats such occurences as a failure and logs a bug
about it (or fails the pre-merge testing).

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 34 ++++++++++++++----------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index bc4011d55667c..c5b21d17ca437 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -17,6 +17,12 @@
 #include "i915_drv.h"
 #include "i915_reg.h"
 
+#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM)
+#define UNEXPECTED	gt_err
+#else
+#define UNEXPECTED	gt_notice
+#endif
+
 static inline struct intel_gt *
 ____uc_fw_to_gt(struct intel_uc_fw *uc_fw, enum intel_uc_fw_type type)
 {
@@ -828,10 +834,10 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
 	if (uc_fw->file_wanted.ver.major && uc_fw->file_selected.ver.major) {
 		/* Check the file's major version was as it claimed */
 		if (uc_fw->file_selected.ver.major != uc_fw->file_wanted.ver.major) {
-			gt_notice(gt, "%s firmware %s: unexpected version: %u.%u != %u.%u\n",
-				  intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
-				  uc_fw->file_selected.ver.major, uc_fw->file_selected.ver.minor,
-				  uc_fw->file_wanted.ver.major, uc_fw->file_wanted.ver.minor);
+			UNEXPECTED(gt, "%s firmware %s: unexpected version: %u.%u != %u.%u\n",
+				   intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
+				   uc_fw->file_selected.ver.major, uc_fw->file_selected.ver.minor,
+				   uc_fw->file_wanted.ver.major, uc_fw->file_wanted.ver.minor);
 			if (!intel_uc_fw_is_overridden(uc_fw)) {
 				err = -ENOEXEC;
 				goto fail;
@@ -849,16 +855,16 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
 		/* Preserve the version that was really wanted */
 		memcpy(&uc_fw->file_wanted, &file_ideal, sizeof(uc_fw->file_wanted));
 
-		gt_notice(gt, "%s firmware %s (%d.%d.%d) is recommended, but only %s (%d.%d.%d) was found\n",
-			  intel_uc_fw_type_repr(uc_fw->type),
-			  uc_fw->file_wanted.path,
-			  uc_fw->file_wanted.ver.major,
-			  uc_fw->file_wanted.ver.minor,
-			  uc_fw->file_wanted.ver.patch,
-			  uc_fw->file_selected.path,
-			  uc_fw->file_selected.ver.major,
-			  uc_fw->file_selected.ver.minor,
-			  uc_fw->file_selected.ver.patch);
+		UNEXPECTED(gt, "%s firmware %s (%d.%d.%d) is recommended, but only %s (%d.%d.%d) was found\n",
+			   intel_uc_fw_type_repr(uc_fw->type),
+			   uc_fw->file_wanted.path,
+			   uc_fw->file_wanted.ver.major,
+			   uc_fw->file_wanted.ver.minor,
+			   uc_fw->file_wanted.ver.patch,
+			   uc_fw->file_selected.path,
+			   uc_fw->file_selected.ver.major,
+			   uc_fw->file_selected.ver.minor,
+			   uc_fw->file_selected.ver.patch);
 		gt_info(gt, "Consider updating your linux-firmware pkg or downloading from %s\n",
 			INTEL_UC_FIRMWARE_URL);
 	}
-- 
2.39.1

