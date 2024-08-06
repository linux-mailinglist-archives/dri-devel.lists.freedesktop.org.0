Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3089F9486CC
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 02:57:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FBC2892FD;
	Tue,  6 Aug 2024 00:57:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="irQLfjqO";
	dkim-atps=neutral
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A360B892FD;
 Tue,  6 Aug 2024 00:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722905841; x=1754441841;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=POqNc8NHwPBA8pTsiW8borXeQDlCY3QK9lz8VzkN1mE=;
 b=irQLfjqO2pXkQaHRMq7rGAjXbGtapsym+/bYmk0055Q1TDSv5luKDikp
 KRpmKHCQckwNG2MwSzi9QZfp8qrZkjnmRtVVAe6p5ZJEK2IBQpDfB9mqn
 ToyND02lXks2W2/41Iuhf1v49XTWkLI9Rx84n9WBS1ZwopJOTsC8cxtRR
 T+76gXVvTioMXzHK/vJdbquDjnHSK0V7PzqcbwAI/Lwnv5j3deq/bOgCq
 9tmeguNRJvENGzI9q0rLiIARTJ50zoxhsW3Tyq4BSZ/1jBXDUtvnnMwTm
 5IyxJdnYcFrtayY5DagxS23ODEvhJreQPQd2KkuvnEUs//ZB9G+ZvXdE1 Q==;
X-CSE-ConnectionGUID: VV21ylNBRR20K66o3z+4Pw==
X-CSE-MsgGUID: Ncyf6cHGStG8svelZZmqMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="32278645"
X-IronPort-AV: E=Sophos;i="6.09,266,1716274800"; d="scan'208";a="32278645"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 17:57:20 -0700
X-CSE-ConnectionGUID: qGcC0YjdRdKgalr1qO75+g==
X-CSE-MsgGUID: G2mq3YLIQiSm9GU1AA8i5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,266,1716274800"; d="scan'208";a="61303323"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa004.jf.intel.com with ESMTP; 05 Aug 2024 17:57:19 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Cc: DRI-Devel@Lists.FreeDesktop.Org, John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH] drm/i915/dg2: Enable Wa_14019159160 for DG2
Date: Mon,  5 Aug 2024 17:57:19 -0700
Message-ID: <20240806005719.215874-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.46.0
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
2.46.0

