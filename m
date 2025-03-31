Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C70CCA766BC
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 15:21:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBCDD10E402;
	Mon, 31 Mar 2025 13:21:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QIxaUD+Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDAAE10E412
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 13:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743427277; x=1774963277;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5x1XIpgIJ46XyaNxiDv5NuPUYSUhdlj95ULLyabr2S4=;
 b=QIxaUD+Zbs08/7zjVzArcGuHTPLBy5/8+Zu2SfALBWnfIaRXeXTdEiv3
 sJhwGF95A66b0pdhaX1f2UiP0lZYNco8WGAC7miAURfkfkvOb+yMPD5so
 q2Rw1NkEb4j8ttJRpp8jtgBNmc2fk5vjk75UFG3FyHJ69eolt1d2BdvLL
 I7CKcu2Ym4fu84dNMr2MtEdE/6q1CpWlqH87a2/HhxxkCceeC/NDVjJuz
 LWpOBykLic++bt2rsFJf658kX7GksLwa+tVGVxrRVyKjM1ZQemcyc5bww
 DYkLgJrncK6b6H/x88AeOCQtiK7it0bQLDV9+UTwFUjjH03ePJC9V+GIL A==;
X-CSE-ConnectionGUID: IoLpweGLQ9uOGC2NSXlEfg==
X-CSE-MsgGUID: m52eSwvlSDKieGjobNsiNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="44425983"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="44425983"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 06:21:17 -0700
X-CSE-ConnectionGUID: Ay0ffF0vTlWs6UpIq0to8g==
X-CSE-MsgGUID: E+UfW8tVS2qrzb+dNBikmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="130792686"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by fmviesa005.fm.intel.com with ESMTP; 31 Mar 2025 06:21:15 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v6 3/4] drm/xe/guc: Introduce enum with offsets for multi-LRC
 register H2G
Date: Mon, 31 Mar 2025 15:21:06 +0200
Message-Id: <20250331132107.1242954-4-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250331132107.1242954-1-tomasz.lis@intel.com>
References: <20250331132107.1242954-1-tomasz.lis@intel.com>
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

