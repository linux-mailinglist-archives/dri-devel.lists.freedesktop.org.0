Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0990F8C8D6B
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 22:43:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBD6610EF87;
	Fri, 17 May 2024 20:43:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AXJbcA0D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7DB910EF6C;
 Fri, 17 May 2024 20:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715978591; x=1747514591;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1cQ3w5hvk+fE/vadDvzkaOVMczVV7aLAy6G+Ufu7nDY=;
 b=AXJbcA0DcIGzCCE3nkO1KtZsDAYFlQj2KlgYuz1GS0ZIYkh66HudAZYY
 VzTe602hZqKrnyb1uYWY4X+Q/gTDfEiXnqclCjZAIj2FnRXGe7n1E1ItL
 eTv45lHcitU45Ppa3TAwD20iT6Ia+ny6zusAjGshqxF0OstzI2WPECeJP
 j1TnpPPQzFNk7Qv3dvB+8Bu2sJnHXFLCas+FZXecG4dOlDH1UITHLUecR
 nXyC/SDPR46Q4r0rfmNZSYKyfv2D2inJEIeGY3EGC5LDpNc2qBZrjRX7s
 rUsQiAsacwXtIrcMeWHng6RmfLs8GJrXacIcn9I2qrq0Fx3XPy0rbOtpg A==;
X-CSE-ConnectionGUID: k7nScczWQGGVDVtSvgDWZA==
X-CSE-MsgGUID: cmGv2u3/TtqoB6qp2ZTK0Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="12027924"
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; d="scan'208";a="12027924"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 13:43:10 -0700
X-CSE-ConnectionGUID: TwRtlKULQcaoVpHjZE2+Og==
X-CSE-MsgGUID: Q5ETi9cKTnK0Zm1VToWjqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; d="scan'208";a="55125254"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 13:43:10 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 dri-devel@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v5 7/8] drm/xe: Add helper to return any available hw engine
Date: Fri, 17 May 2024 13:43:09 -0700
Message-ID: <20240517204310.88854-8-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240517204310.88854-1-lucas.demarchi@intel.com>
References: <20240517204310.88854-1-lucas.demarchi@intel.com>
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

Get the first available engine from a gt, which helps in the case any
engine serves as a context, like when reading RING_TIMESTAMP.

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 11 +++++++++++
 drivers/gpu/drm/xe/xe_gt.h |  7 +++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 5194a3d38e76..3432fef56486 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -833,3 +833,14 @@ struct xe_hw_engine *xe_gt_any_hw_engine_by_reset_domain(struct xe_gt *gt,
 
 	return NULL;
 }
+
+struct xe_hw_engine *xe_gt_any_hw_engine(struct xe_gt *gt)
+{
+	struct xe_hw_engine *hwe;
+	enum xe_hw_engine_id id;
+
+	for_each_hw_engine(hwe, gt, id)
+		return hwe;
+
+	return NULL;
+}
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 1d010bf4a756..9073ac68a777 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -67,6 +67,13 @@ void xe_gt_remove(struct xe_gt *gt);
 struct xe_hw_engine *
 xe_gt_any_hw_engine_by_reset_domain(struct xe_gt *gt, enum xe_engine_class class);
 
+/**
+ * xe_gt_any_hw_engine - scan the list of engines and return the
+ * first available
+ * @gt: GT structure
+ */
+struct xe_hw_engine *xe_gt_any_hw_engine(struct xe_gt *gt);
+
 struct xe_hw_engine *xe_gt_hw_engine(struct xe_gt *gt,
 				     enum xe_engine_class class,
 				     u16 instance,
-- 
2.43.0

