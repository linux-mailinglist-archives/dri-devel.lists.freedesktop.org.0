Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A89913141
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jun 2024 03:05:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D027D10E176;
	Sat, 22 Jun 2024 01:05:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ja01KFNH";
	dkim-atps=neutral
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 325D810EC0B;
 Sat, 22 Jun 2024 01:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719018337; x=1750554337;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X9VOT6kxYItBL8dPiEK95o+NkQ+WX91XGbMrakSoPcM=;
 b=Ja01KFNHh0OMflZw3nlPTvoleYjeRXMkTDaYLWShFOaLaMR/37WHxlRS
 ZVNjgG4y5WJUrT/gXYwNX4F9MOQ3so+Wt75sh9F3OUJYaU3hWIL8WKA+U
 DJfNy30kwjRN82CTvkHBwAuL+BRIwnf/Q1vK+c1g+5+um5eKfi6km6sRH
 u+VWWAVi08EGf/pPJEClBFeM0XhbLhtzTf7bOjRm5PVXubiwtpVYYeCDk
 KH6YkBfYoebgpVMzTgopth/QUv6gybE3uCUUVqAiheqKGzR116x+vXK3N
 0hRG1iG0fhYdT+454z9OQRsT2vTqCs5y5DidKA4ddrJgAg3B2wP6WD4Ip Q==;
X-CSE-ConnectionGUID: sPGZil6aT7q+V81GIRwLUQ==
X-CSE-MsgGUID: uR5jYoIuQsyFGMiCg+SNOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="15828211"
X-IronPort-AV: E=Sophos;i="6.08,256,1712646000"; d="scan'208";a="15828211"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 18:05:36 -0700
X-CSE-ConnectionGUID: V7rrf9RPRa6JvzYBR0l+pw==
X-CSE-MsgGUID: 7mexLXzOQdKfYBfh9Hmp6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,256,1712646000"; d="scan'208";a="47692098"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa005.jf.intel.com with ESMTP; 21 Jun 2024 18:05:35 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Cc: DRI-Devel@Lists.FreeDesktop.Org, John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH 1/3] drm/i915/arl: Enable Wa_14019159160 for ARL
Date: Fri, 21 Jun 2024 18:05:32 -0700
Message-ID: <20240622010534.665008-2-John.C.Harrison@Intel.com>
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

The context switch out workaround also applies to ARL.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc.c     | 2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
index 5e60a34692af8..097fc6bd1285e 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -296,7 +296,7 @@ static u32 guc_ctl_wa_flags(struct intel_guc *guc)
 
 	/* Wa_16019325821 */
 	/* Wa_14019159160 */
-	if (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71)))
+	if (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 74)))
 		flags |= GUC_WA_RCS_CCS_SWITCHOUT;
 
 	/*
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index 7995f059f30df..f1fe5f9054538 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -850,7 +850,7 @@ static void guc_waklv_init(struct intel_guc *guc)
 	remain = guc_ads_waklv_size(guc);
 
 	/* Wa_14019159160 */
-	if (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71)))
+	if (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 74)))
 		guc_waklv_enable_simple(guc,
 					GUC_WORKAROUND_KLV_SERIALIZED_RA_MODE,
 					&offset, &remain);
-- 
2.43.2

