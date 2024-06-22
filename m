Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E76913147
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jun 2024 03:05:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEE0010EC5C;
	Sat, 22 Jun 2024 01:05:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lEWzOG9W";
	dkim-atps=neutral
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58FED10EC0C;
 Sat, 22 Jun 2024 01:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719018338; x=1750554338;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RQoj7RYWPQVZL7PHjbs1R6G/353gcF7rszDy/3rpYLY=;
 b=lEWzOG9WczW5UtxavDMDBg9FbI5tHHWR4DZGinuym3c/FiezDeqBwkXi
 DpywRsc07GrLS93VsN79geKOyVl3C0YNrzGFFkQd5InmukRgT8mSbeuDf
 6dsvwjZv2Fas+dBFeOAOdYX+IsKaWA00IVkY2PlYWxhu44ka4CRqeZLZP
 oNsttC3pB+ZKB0hdkvHRi1Am1t6q1+NmF2V2FWOGyiRIZlO9AmAQvPHhL
 lcMPGHiDQqb8XC3NsMdFmlKF+Lz5g8J4l779I5Qpnrllk+tonYoznWOYO
 IopBJVByihUFCuTbu8ahYD/BsxkaQ69xbDQV/5ylzZwgb0XcyfyT5I5AF g==;
X-CSE-ConnectionGUID: xvNNP/S9ShuDE+QToUY6tA==
X-CSE-MsgGUID: kXqNP3wiQZe+9qEZ3jj2Cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="15828212"
X-IronPort-AV: E=Sophos;i="6.08,256,1712646000"; d="scan'208";a="15828212"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 18:05:36 -0700
X-CSE-ConnectionGUID: wq+buyelT+e5JvWjmLks9Q==
X-CSE-MsgGUID: OUnPYFiOQnSY7k2/3Z7Z4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,256,1712646000"; d="scan'208";a="47692102"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa005.jf.intel.com with ESMTP; 21 Jun 2024 18:05:35 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Cc: DRI-Devel@Lists.FreeDesktop.Org, John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH 2/3] drm/i915/guc: Extend w/a 14019159160
Date: Fri, 21 Jun 2024 18:05:33 -0700
Message-ID: <20240622010534.665008-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240622010534.665008-1-John.C.Harrison@Intel.com>
References: <20240622010534.665008-1-John.C.Harrison@Intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

There is a new part to an existing workaround, so enable that piece as
well.

v2: Extend even further.
v3: Drop DG2 as there are CI failures still to resolve. Also re-order
the parameters to a function to reduce excessive line wrapping.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h |  1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    | 18 +++++++++---------
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
index 37ff539a6963d..0c709e6c15be7 100644
--- a/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
@@ -107,6 +107,7 @@ enum {
 enum {
 	GUC_WORKAROUND_KLV_SERIALIZED_RA_MODE				= 0x9001,
 	GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED		= 0x9002,
+	GUC_WORKAROUND_KLV_AVOID_GFX_CLEAR_WHILE_ACTIVE			= 0x9006,
 };
 
 #endif /* _ABI_GUC_KLVS_ABI_H */
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index f1fe5f9054538..46fabbfc775e0 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -815,8 +815,7 @@ guc_capture_prep_lists(struct intel_guc *guc)
 	return PAGE_ALIGN(total_size);
 }
 
-static void guc_waklv_enable_simple(struct intel_guc *guc,
-				    u32 klv_id, u32 *offset, u32 *remain)
+static void guc_waklv_enable_simple(struct intel_guc *guc, u32 *offset, u32 *remain, u32 klv_id)
 {
 	u32 size;
 	u32 klv_entry[] = {
@@ -850,19 +849,20 @@ static void guc_waklv_init(struct intel_guc *guc)
 	remain = guc_ads_waklv_size(guc);
 
 	/* Wa_14019159160 */
-	if (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 74)))
-		guc_waklv_enable_simple(guc,
-					GUC_WORKAROUND_KLV_SERIALIZED_RA_MODE,
-					&offset, &remain);
+	if (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 74))) {
+		guc_waklv_enable_simple(guc, &offset, &remain,
+					GUC_WORKAROUND_KLV_SERIALIZED_RA_MODE);
+		guc_waklv_enable_simple(guc, &offset, &remain,
+					GUC_WORKAROUND_KLV_AVOID_GFX_CLEAR_WHILE_ACTIVE);
+	}
 
 	/* Wa_16021333562 */
 	if ((GUC_FIRMWARE_VER(guc) >= MAKE_GUC_VER(70, 21, 1)) &&
 	    (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 74)) ||
 	     IS_MEDIA_GT_IP_RANGE(gt, IP_VER(13, 0), IP_VER(13, 0)) ||
 	     IS_DG2(gt->i915)))
-		guc_waklv_enable_simple(guc,
-					GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED,
-					&offset, &remain);
+		guc_waklv_enable_simple(guc, &offset, &remain,
+					GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED);
 
 	size = guc_ads_waklv_size(guc) - remain;
 	if (!size)
-- 
2.43.2

