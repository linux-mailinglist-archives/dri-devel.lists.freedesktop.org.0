Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 753E99E971F
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 14:33:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54D3610E75F;
	Mon,  9 Dec 2024 13:33:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EhBIQ97z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80FCF10E75E;
 Mon,  9 Dec 2024 13:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733751224; x=1765287224;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+xCFeV01j1EWvHaalSUnfctLoI4K8h3clbgsY+oeZDA=;
 b=EhBIQ97zumyZnN1Y1udDSUAnfbr/zMIY1lH+ztxU5gqq48eCgcQdGbiG
 i6q/o602WBLhjcAa0oIYrhjAuUOk/WmTXMqGSgebwybdjUMDy0zq/lHHY
 rvH9+gvOxd6GrQrtopUOYqtyOLrj2Cjog4vKGYu3oGL8mQG459uPY6+PQ
 Pgr1LF36cuF46f18DwJE7mt9iL6sCRQ4/7KZzeA5FqogotYubgI+hZ5jd
 YTtD3GP2EiAo5/ECX+b5LOUB2SO5EWo0fCXmreTT42Q+8mkEipi/4liF2
 SnS8YNlOVDXO78VzxRKKF94BFjUbs48dYhIVn7ut/3q0Bf8J9Z3f9iq2J g==;
X-CSE-ConnectionGUID: 81FNxyMaRESiNbkxSkM4Sw==
X-CSE-MsgGUID: jYoCNJnRSbCUWWnzFMouLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="34192190"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="34192190"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 05:33:43 -0800
X-CSE-ConnectionGUID: fCL5eKx2R2KlYOqIbCgRMA==
X-CSE-MsgGUID: xpaxzA6DSHm/x+8jVMQ93g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="99531377"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 05:33:42 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 23/26] drm/xe/eudebug: Add read/count/compare helper for eu
 attention
Date: Mon,  9 Dec 2024 15:33:14 +0200
Message-ID: <20241209133318.1806472-24-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241209133318.1806472-1-mika.kuoppala@linux.intel.com>
References: <20241209133318.1806472-1-mika.kuoppala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>

Add xe_eu_attentions structure to capture and store eu attention bits.
Add a function to count the number of eu threads that have turned on from
eu attentions, and add a function to count the number of eu threads that
have changed on a state between eu attentions.

Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_gt_debug.c | 64 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_debug.h | 15 ++++++++
 2 files changed, 79 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_debug.c b/drivers/gpu/drm/xe/xe_gt_debug.c
index 49f24db9da9c..a20e1e57212c 100644
--- a/drivers/gpu/drm/xe/xe_gt_debug.c
+++ b/drivers/gpu/drm/xe/xe_gt_debug.c
@@ -3,6 +3,7 @@
  * Copyright © 2023 Intel Corporation
  */
 
+#include <linux/delay.h>
 #include "regs/xe_gt_regs.h"
 #include "xe_device.h"
 #include "xe_force_wake.h"
@@ -146,3 +147,66 @@ int xe_gt_eu_threads_needing_attention(struct xe_gt *gt)
 
 	return err < 0 ? 0 : err;
 }
+
+static inline unsigned int
+xe_eu_attentions_count(const struct xe_eu_attentions *a)
+{
+	return bitmap_weight((void *)a->att, a->size * BITS_PER_BYTE);
+}
+
+void xe_gt_eu_attentions_read(struct xe_gt *gt,
+			      struct xe_eu_attentions *a,
+			      const unsigned int settle_time_ms)
+{
+	unsigned int prev = 0;
+	ktime_t end, now;
+
+	now = ktime_get_raw();
+	end = ktime_add_ms(now, settle_time_ms);
+
+	a->ts = 0;
+	a->size = min_t(int,
+			xe_gt_eu_attention_bitmap_size(gt),
+			sizeof(a->att));
+
+	do {
+		unsigned int attn;
+
+		xe_gt_eu_attention_bitmap(gt, a->att, a->size);
+		attn = xe_eu_attentions_count(a);
+
+		now = ktime_get_raw();
+
+		if (a->ts == 0)
+			a->ts = now;
+		else if (attn && attn != prev)
+			a->ts = now;
+
+		prev = attn;
+
+		if (settle_time_ms)
+			udelay(5);
+
+		/*
+		 * XXX We are gathering data for production SIP to find
+		 * the upper limit of settle time. For now, we wait full
+		 * timeout value regardless.
+		 */
+	} while (ktime_before(now, end));
+}
+
+unsigned int xe_eu_attentions_xor_count(const struct xe_eu_attentions *a,
+					const struct xe_eu_attentions *b)
+{
+	unsigned int count = 0;
+	unsigned int i;
+
+	if (XE_WARN_ON(a->size != b->size))
+		return -EINVAL;
+
+	for (i = 0; i < a->size; i++)
+		if (a->att[i] ^ b->att[i])
+			count++;
+
+	return count;
+}
diff --git a/drivers/gpu/drm/xe/xe_gt_debug.h b/drivers/gpu/drm/xe/xe_gt_debug.h
index 1edb667154f1..1d50b93235ae 100644
--- a/drivers/gpu/drm/xe/xe_gt_debug.h
+++ b/drivers/gpu/drm/xe/xe_gt_debug.h
@@ -11,6 +11,15 @@
 
 #define XE_GT_ATTENTION_TIMEOUT_MS 100
 
+struct xe_eu_attentions {
+#define XE_MAX_EUS 1024
+#define XE_MAX_THREADS 10
+
+	u8 att[DIV_ROUND_UP(XE_MAX_EUS * XE_MAX_THREADS, BITS_PER_BYTE)];
+	unsigned int size;
+	ktime_t ts;
+};
+
 static inline unsigned int xe_gt_debug_eu_att_rows(struct xe_gt *gt)
 {
 	return (GRAPHICS_VERx100(gt_to_xe(gt)) >= 3000) ? 4u : 2u;
@@ -28,4 +37,10 @@ int xe_gt_eu_attention_bitmap_size(struct xe_gt *gt);
 int xe_gt_eu_attention_bitmap(struct xe_gt *gt, u8 *bits,
 			      unsigned int bitmap_size);
 
+void xe_gt_eu_attentions_read(struct xe_gt *gt,
+			      struct xe_eu_attentions *a,
+			      const unsigned int settle_time_ms);
+
+unsigned int xe_eu_attentions_xor_count(const struct xe_eu_attentions *a,
+					const struct xe_eu_attentions *b);
 #endif
-- 
2.43.0

