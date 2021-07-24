Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 058E63D43D8
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jul 2021 02:12:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E891B6FD57;
	Sat, 24 Jul 2021 00:11:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9B276FD2E;
 Sat, 24 Jul 2021 00:11:34 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10054"; a="191563465"
X-IronPort-AV: E=Sophos;i="5.84,265,1620716400"; d="scan'208";a="191563465"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2021 17:11:34 -0700
X-IronPort-AV: E=Sophos;i="5.84,265,1620716400"; d="scan'208";a="434270037"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2021 17:11:34 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 22/30] drm/i915: remove explicit CNL handling from
 intel_wopcm.c
Date: Fri, 23 Jul 2021 17:11:06 -0700
Message-Id: <20210724001114.249295-23-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210724001114.249295-1-lucas.demarchi@intel.com>
References: <20210724001114.249295-1-lucas.demarchi@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Jose Souza <jose.souza@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Consider the new WOPCM size as starting in ICL rather than CNL since the
latter is being removed from the driver.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/intel_wopcm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_wopcm.c b/drivers/gpu/drm/i915/intel_wopcm.c
index 8309455f13ea..5e511bb891f9 100644
--- a/drivers/gpu/drm/i915/intel_wopcm.c
+++ b/drivers/gpu/drm/i915/intel_wopcm.c
@@ -56,8 +56,8 @@
 
 /* 24KB at the end of WOPCM is reserved for RC6 CTX on BXT. */
 #define BXT_WOPCM_RC6_CTX_RESERVED	(SZ_16K + SZ_8K)
-/* 36KB WOPCM reserved at the end of WOPCM on CNL. */
-#define CNL_WOPCM_HW_CTX_RESERVED	(SZ_32K + SZ_4K)
+/* 36KB WOPCM reserved at the end of WOPCM on ICL. */
+#define ICL_WOPCM_HW_CTX_RESERVED	(SZ_32K + SZ_4K)
 
 /* 128KB from GUC_WOPCM_RESERVED is reserved for FW on Gen9. */
 #define GEN9_GUC_FW_RESERVED	SZ_128K
@@ -93,8 +93,8 @@ static u32 context_reserved_size(struct drm_i915_private *i915)
 {
 	if (IS_GEN9_LP(i915))
 		return BXT_WOPCM_RC6_CTX_RESERVED;
-	else if (GRAPHICS_VER(i915) >= 10)
-		return CNL_WOPCM_HW_CTX_RESERVED;
+	else if (GRAPHICS_VER(i915) >= 11)
+		return ICL_WOPCM_HW_CTX_RESERVED;
 	else
 		return 0;
 }
@@ -126,7 +126,7 @@ static bool gen9_check_huc_fw_fits(struct drm_i915_private *i915,
 				   u32 guc_wopcm_size, u32 huc_fw_size)
 {
 	/*
-	 * On Gen9 & CNL A0, hardware requires the total available GuC WOPCM
+	 * On Gen9, hardware requires the total available GuC WOPCM
 	 * size to be larger than or equal to HuC firmware size. Otherwise,
 	 * firmware uploading would fail.
 	 */
-- 
2.31.1

