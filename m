Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF94A9E9719
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 14:33:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7445210E760;
	Mon,  9 Dec 2024 13:33:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H5hfLQlq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BCA510E773;
 Mon,  9 Dec 2024 13:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733751220; x=1765287220;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RThmuulfUqOi6traoABdpzCGlKL3v7YFxMezvg+1QfM=;
 b=H5hfLQlq4vrTzgC9Zkv2LV4IoH6XZBYf1edOqxDbXWqp/XBZQFdXshUi
 khnsCfLceZslI+Ezaxdh/2Gn9uJrKuHCywrtC3kCaRhblTpcc9W7sj7QQ
 cBJthN1hUs1EqevuOXBDXE1/5zXTAjybGEI0PMA0B0aujre1O5MKc3oxO
 KFr0yXyeI9xmiwkqzpdHTRyyzHwv6DB2WrRRr02TCE5xPi6cRMVYxxFTG
 RKFseytJlfJtTeMnUblMTviwoJSa7cvX8dhYzofg2GW9tDR7K5EC8Edy5
 dWa8Na6GbAY7MEV5PzOuRLiNO7KpBT+sVkRHqdbbuvxjmLE7hp+7dW1kM A==;
X-CSE-ConnectionGUID: mXnOcPJMR46kNp3CpI5Zuw==
X-CSE-MsgGUID: YzOqFb4xRNCxYz9UJdjChg==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="34192166"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="34192166"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 05:33:40 -0800
X-CSE-ConnectionGUID: EgMafpxUTpmPuV+Jf7pL9A==
X-CSE-MsgGUID: P/jMAcn4TM2ke/XRu48FjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="99531365"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 05:33:39 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 21/26] drm/xe/eudebug/ptl: Add support for extra attention
 register
Date: Mon,  9 Dec 2024 15:33:12 +0200
Message-ID: <20241209133318.1806472-22-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241209133318.1806472-1-mika.kuoppala@linux.intel.com>
References: <20241209133318.1806472-1-mika.kuoppala@linux.intel.com>
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

From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

xe3 can set bits within an additional attention bit register EU_ATT1.
Recalculate bitmask and make sure we read all required data.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_eudebug.c  | 4 ++--
 drivers/gpu/drm/xe/xe_gt_debug.c | 8 ++++----
 drivers/gpu/drm/xe/xe_gt_debug.h | 8 ++++++--
 3 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index f44cc0f8290e..c259e5804386 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -1858,7 +1858,7 @@ static int check_attn_mcr(struct xe_gt *gt, void *data,
 	struct xe_eudebug *d = iter->debugger;
 	unsigned int row;
 
-	for (row = 0; row < TD_EU_ATTENTION_MAX_ROWS; row++) {
+	for (row = 0; row < xe_gt_debug_eu_att_rows(gt); row++) {
 		u32 val, cur = 0;
 
 		if (iter->i >= iter->size)
@@ -1891,7 +1891,7 @@ static int clear_attn_mcr(struct xe_gt *gt, void *data,
 	struct xe_eudebug *d = iter->debugger;
 	unsigned int row;
 
-	for (row = 0; row < TD_EU_ATTENTION_MAX_ROWS; row++) {
+	for (row = 0; row < xe_gt_debug_eu_att_rows(gt); row++) {
 		u32 val;
 
 		if (iter->i >= iter->size)
diff --git a/drivers/gpu/drm/xe/xe_gt_debug.c b/drivers/gpu/drm/xe/xe_gt_debug.c
index f35b9df5e41b..49f24db9da9c 100644
--- a/drivers/gpu/drm/xe/xe_gt_debug.c
+++ b/drivers/gpu/drm/xe/xe_gt_debug.c
@@ -74,9 +74,9 @@ int xe_gt_eu_attention_bitmap_size(struct xe_gt *gt)
 	bitmap_or(dss_mask, gt->fuse_topo.c_dss_mask,
 		  gt->fuse_topo.g_dss_mask, XE_MAX_DSS_FUSE_BITS);
 
-	return  bitmap_weight(dss_mask, XE_MAX_DSS_FUSE_BITS) *
-		TD_EU_ATTENTION_MAX_ROWS * MAX_THREADS *
-		MAX_EUS_PER_ROW / 8;
+	return bitmap_weight(dss_mask, XE_MAX_DSS_FUSE_BITS) *
+	       xe_gt_debug_eu_att_rows(gt) * MAX_THREADS *
+	       MAX_EUS_PER_ROW / 8;
 }
 
 struct attn_read_iter {
@@ -92,7 +92,7 @@ static int read_eu_attentions_mcr(struct xe_gt *gt, void *data,
 	struct attn_read_iter * const iter = data;
 	unsigned int row;
 
-	for (row = 0; row < TD_EU_ATTENTION_MAX_ROWS; row++) {
+	for (row = 0; row < xe_gt_debug_eu_att_rows(gt); row++) {
 		u32 val;
 
 		if (iter->i >= iter->size)
diff --git a/drivers/gpu/drm/xe/xe_gt_debug.h b/drivers/gpu/drm/xe/xe_gt_debug.h
index 342082699ff6..1edb667154f1 100644
--- a/drivers/gpu/drm/xe/xe_gt_debug.h
+++ b/drivers/gpu/drm/xe/xe_gt_debug.h
@@ -6,12 +6,16 @@
 #ifndef __XE_GT_DEBUG_
 #define __XE_GT_DEBUG_
 
-#define TD_EU_ATTENTION_MAX_ROWS 2u
-
+#include "xe_device_types.h"
 #include "xe_gt_types.h"
 
 #define XE_GT_ATTENTION_TIMEOUT_MS 100
 
+static inline unsigned int xe_gt_debug_eu_att_rows(struct xe_gt *gt)
+{
+	return (GRAPHICS_VERx100(gt_to_xe(gt)) >= 3000) ? 4u : 2u;
+}
+
 int xe_gt_eu_threads_needing_attention(struct xe_gt *gt);
 int xe_gt_foreach_dss_group_instance(struct xe_gt *gt,
 				     int (*fn)(struct xe_gt *gt,
-- 
2.43.0

