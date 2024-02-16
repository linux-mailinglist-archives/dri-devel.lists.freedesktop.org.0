Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD3785856C
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 19:41:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 416B010E03C;
	Fri, 16 Feb 2024 18:41:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DQ9PTYEg";
	dkim-atps=neutral
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D72F10E041;
 Fri, 16 Feb 2024 18:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708108862; x=1739644862;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=U8OyiEfJWgnOFU1meEIS0iVhTU7rTvFpd1krXcgBxtk=;
 b=DQ9PTYEgs0Jef/7eYvbcjaWxGL2Ydo3UiGaE0GRTMa1F+bdCuQ83u3Mo
 yc/a28Tl6EzMWun5p3nHZ0UGTTg/Tiz1cudDzDfC6ArJw4o6uPXxNBweu
 AYeaDaYwMIPVplA9QiaJHKFUCb8EKEA4xiVLCx421eayKbbwZF5MW5vA9
 07aJ1s5y0TkxPJS4GyxkzvsDsyfLsIlkkOCDmv6AZ/rEA+Wk1dD4Gb9+Y
 KHzM+PEv/UaFZCJmbyDetCW1Rq52h1kq57u329rk366E1WXnBPAJHZmhs
 E30OxX1Idpxt2iJvKob8/tRwfyq6UxhNl/zyKhmuXIamb8fw+7Yy4cMKs Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10986"; a="6075809"
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; 
   d="scan'208";a="6075809"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 10:41:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; d="scan'208";a="34954856"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa001.fm.intel.com with ESMTP; 16 Feb 2024 10:41:01 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Cc: DRI-Devel@Lists.FreeDesktop.Org, John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v3] drm/i915/guc: Simplify/extend platform check for
 Wa_14018913170
Date: Fri, 16 Feb 2024 10:38:41 -0800
Message-ID: <20240216183841.497768-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.43.0
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

The above w/a is required for every platform that the i915 driver
supports. It is fixed on the latest platforms but they are only
supported by Xe instead of i915. So just remove the platform check
completely and keep the code simple.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
index 2b450c43bbd7f..a3662edb42032 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -321,8 +321,7 @@ static u32 guc_ctl_wa_flags(struct intel_guc *guc)
 
 	/* Wa_14018913170 */
 	if (GUC_FIRMWARE_VER(guc) >= MAKE_GUC_VER(70, 7, 0)) {
-		if (IS_DG2(gt->i915) || IS_METEORLAKE(gt->i915) || IS_PONTEVECCHIO(gt->i915))
-			flags |= GUC_WA_ENABLE_TSC_CHECK_ON_RC6;
+		flags |= GUC_WA_ENABLE_TSC_CHECK_ON_RC6;
 	}
 
 	return flags;
-- 
2.43.0

