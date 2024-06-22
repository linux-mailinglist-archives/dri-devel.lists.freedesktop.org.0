Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9588913146
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jun 2024 03:05:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C82810EC3B;
	Sat, 22 Jun 2024 01:05:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hxFvWMAY";
	dkim-atps=neutral
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 715F910E176;
 Sat, 22 Jun 2024 01:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719018338; x=1750554338;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X1Q4QtQGA1aO8h0WJqPC6Uz20ibMdjQRIHgw7C8U8S8=;
 b=hxFvWMAYGwc9cuTQHBJXQnwEBLzN37wrefBwQhqdUzPHpuGbZeQ4Ligy
 4DVPHRN34/toc6EjE4dIBQJlkAqfv8wPLcnz4dH7v9YVdraP5P6C78WKr
 XdEDi72LkshJNuv4AST6B/6zPLs9nsLbwNC4y/dcprVz0t/01JBjctYE/
 PhrsYbjaGLE1kRTYrbMWoyE5iwrXSzqlJSlth+Deggo4nBwW8fVTGnI3N
 pvqWdHW0YW83WvPIK9aMY6E1z2MUHIXs67B0vcr1CjeHLYCLesolLhOPR
 4r8vn6QWu0I5GFjck4L+trf3oL21ebGpd6TJ1v1c9aNNX99QCyVdzjEjj A==;
X-CSE-ConnectionGUID: of+txjoBQcSArObxITglKg==
X-CSE-MsgGUID: 4GBjWaElSoerpxDv2cgO5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="15828213"
X-IronPort-AV: E=Sophos;i="6.08,256,1712646000"; d="scan'208";a="15828213"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 18:05:36 -0700
X-CSE-ConnectionGUID: c2eGaxceSuuPhwGHqxd/qg==
X-CSE-MsgGUID: oXNtDjxfQZKhpb8Fvu1o1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,256,1712646000"; d="scan'208";a="47692105"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa005.jf.intel.com with ESMTP; 21 Jun 2024 18:05:35 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Cc: DRI-Devel@Lists.FreeDesktop.Org, John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH 3/3] drm/i915/dg2: Enable Wa_14019159160 for DG2
Date: Fri, 21 Jun 2024 18:05:34 -0700
Message-ID: <20240622010534.665008-4-John.C.Harrison@Intel.com>
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

The context switch hold out workaround also applies to DG2.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc.c     | 3 ++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
index 097fc6bd1285e..2a27bc625abe1 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -296,7 +296,8 @@ static u32 guc_ctl_wa_flags(struct intel_guc *guc)
 
 	/* Wa_16019325821 */
 	/* Wa_14019159160 */
-	if (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 74)))
+	if (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 74)) ||
+	    IS_DG2(gt->i915))
 		flags |= GUC_WA_RCS_CCS_SWITCHOUT;
 
 	/*
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index 46fabbfc775e0..2378e3c59def9 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -849,7 +849,8 @@ static void guc_waklv_init(struct intel_guc *guc)
 	remain = guc_ads_waklv_size(guc);
 
 	/* Wa_14019159160 */
-	if (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 74))) {
+	if (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 74)) ||
+	    IS_DG2(gt->i915)) {
 		guc_waklv_enable_simple(guc, &offset, &remain,
 					GUC_WORKAROUND_KLV_SERIALIZED_RA_MODE);
 		guc_waklv_enable_simple(guc, &offset, &remain,
-- 
2.43.2

