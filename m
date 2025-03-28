Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B44A7503A
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 19:12:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76EA810EA99;
	Fri, 28 Mar 2025 18:12:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YmXMnE6s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3EF710EA92
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 18:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743185529; x=1774721529;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5x1XIpgIJ46XyaNxiDv5NuPUYSUhdlj95ULLyabr2S4=;
 b=YmXMnE6sUjHBxOCSqxag8Dvpk4tvVc0uQ3BQraKKI0MpA1YPE650LvCg
 3FIjvZ9fMjOZr5A2+TrsMfvwtlOlgzRAiEl6w0/iiIMsTidfbV7AyPPST
 U9ldkgUGDfQJt0P5RxBUcUzXa6rdf3NxhJyBPesUhhb26aHgKsDsMrZ/2
 hlhGpSTsi7rjQ3CQLghLyky4/y0aDuTZZcp9i+/Rk/J+pMJTssGllDr/c
 9ZPuX46EaZBogX5526lkfnQ5RpJ3lqrBH5lqkO31PpHlnH5pycEFhvS+G
 ZAibMdAQr9Kjz+XY5ScnSOcIzLsDneEirVKlC0/dDLc/qT47p4yKOoUA9 g==;
X-CSE-ConnectionGUID: OhmCV77DRku+Ubq8NSPUjw==
X-CSE-MsgGUID: u2ouWkdQT52utHln+PeMbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="48338818"
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; d="scan'208";a="48338818"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 11:12:09 -0700
X-CSE-ConnectionGUID: WfE+BXRiTQKAdubv53RmCQ==
X-CSE-MsgGUID: ui1cipAySDSplbfdXKeP/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; d="scan'208";a="130616386"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by fmviesa004.fm.intel.com with ESMTP; 28 Mar 2025 11:12:08 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v5 3/4] drm/xe/guc: Introduce enum with offsets for multi-LRC
 register H2G
Date: Fri, 28 Mar 2025 19:11:59 +0100
Message-Id: <20250328181200.1011623-4-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250328181200.1011623-1-tomasz.lis@intel.com>
References: <20250328181200.1011623-1-tomasz.lis@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some GuC messages are constructed with incrementing dword counter
rather than referencing specific DWORDs, as described in GuC interface
specification.

This change introduces the definitions of DWORD numbers for parameters
which will need to be referenced in a CTB parser to be added in a
following patch. To ensure correctness of these DWORDs, verification
in form of asserts was added to the message construction code.

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_actions_abi.h | 7 +++++++
 drivers/gpu/drm/xe/xe_guc_submit.c       | 4 ++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
index 448afb86e05c..86bd4b092c7c 100644
--- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
@@ -161,6 +161,13 @@ enum xe_guc_preempt_options {
 	XE_GUC_PREEMPT_OPTION_DROP_SUBMIT_Q = 0x8,
 };
 
+enum xe_guc_register_context_multi_lrc_param_offsets {
+	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_WQ_DESC = 5,
+	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_WQ_BASE = 7,
+	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_N_CHILDREN = 10,
+	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_HWLRCA = 11
+};
+
 enum xe_guc_report_status {
 	XE_GUC_REPORT_STATUS_UNKNOWN = 0x0,
 	XE_GUC_REPORT_STATUS_ACKED = 0x1,
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 31bc2022bfc2..3c8574e2c1f3 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -469,12 +469,16 @@ static void __register_mlrc_exec_queue(struct xe_guc *guc,
 	action[len++] = info->context_idx;
 	action[len++] = info->engine_class;
 	action[len++] = info->engine_submit_mask;
+	xe_gt_assert(guc_to_gt(guc), len == XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_WQ_DESC);
 	action[len++] = info->wq_desc_lo;
 	action[len++] = info->wq_desc_hi;
+	xe_gt_assert(guc_to_gt(guc), len == XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_WQ_BASE);
 	action[len++] = info->wq_base_lo;
 	action[len++] = info->wq_base_hi;
 	action[len++] = info->wq_size;
+	xe_gt_assert(guc_to_gt(guc), len == XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_N_CHILDREN);
 	action[len++] = q->width;
+	xe_gt_assert(guc_to_gt(guc), len == XE_GUC_REGISTER_CONTEXT_MULTI_LRC_OFFS_HWLRCA);
 	action[len++] = info->hwlrca_lo;
 	action[len++] = info->hwlrca_hi;
 
-- 
2.25.1

