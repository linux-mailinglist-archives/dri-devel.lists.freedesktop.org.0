Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A26BBA3C9B8
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 21:29:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B423210E89B;
	Wed, 19 Feb 2025 20:28:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hpmqHXOI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3F8D10E365;
 Wed, 19 Feb 2025 20:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739996929; x=1771532929;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Gzg2r7fR3ov8t74dKxtvai5BqCJm/3d4stlGuCVvktw=;
 b=hpmqHXOIScrn1iw8OiN4EGnBZf6hzbhETHOUgqRZoAK2WG5bHdV7FEiA
 RNxwsdewfDCd51e8EpKXtJ3nCeUFaQM7qSYXunVYCl7PIAerrOrXfu5aC
 d9Jl3HiqbLkz+0/5BDjHskM+QdFc/WfWo8zvqCUHiBRFuc4ihTFp8V6R7
 qd2tE/46nZPnM6+n9PZtVRLwqFkurApiEATF13ZVO5fJ8doQd+ElFHsfs
 vKLB5Px9UJ+EUQg+qd+5jdA2TVLcxp99k+/7robJZ4F+27HlWTRtdGX2D
 9/io4pwXg3rk6szQSaU/z6q+qC5K0bHz8wel7gDxFNTvqyork9JytwS9q A==;
X-CSE-ConnectionGUID: XinLPSq5RNKBUsaIFO8caQ==
X-CSE-MsgGUID: o59kVRAMRSiHj7uOWm+WBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="41012245"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; d="scan'208";a="41012245"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 12:28:48 -0800
X-CSE-ConnectionGUID: 3fHIiw0rQ+2jtE+tc5CIog==
X-CSE-MsgGUID: g262hSPxQea6U+ftvylrZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="119765730"
Received: from dut4410lnl.fm.intel.com ([10.105.8.78])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 12:28:48 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, tvrtko.ursulin@igalia.com,
 lucas.demarchi@intel.com, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org, simona.vetter@ffwll.ch
Subject: [PATCH v4 4/6] drm/xe/xe_drm_client: Add per drm client reset stats
Date: Wed, 19 Feb 2025 20:28:44 +0000
Message-ID: <20250219202847.127425-5-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250219202847.127425-1-jonathan.cavitt@intel.com>
References: <20250219202847.127425-1-jonathan.cavitt@intel.com>
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

Add a counter to xe_drm_client that tracks the number of times the
engine has been reset since the drm client was created.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_drm_client.h | 2 ++
 drivers/gpu/drm/xe/xe_guc_submit.c | 4 +++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.h b/drivers/gpu/drm/xe/xe_drm_client.h
index b3d9b279d55f..6579c4b60ae7 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.h
+++ b/drivers/gpu/drm/xe/xe_drm_client.h
@@ -59,6 +59,8 @@ struct xe_drm_client {
 	 * @blame_len: length of @blame_list
 	 */
 	unsigned int blame_len;
+	/** @reset_count: number of times this drm client has seen an engine reset */
+	atomic_t reset_count;
 #endif
 };
 
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 92de926bd505..5d899de3dd83 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1988,7 +1988,9 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
 		return -EPROTO;
 
 	hwe = q->hwe;
-
+#ifdef CONFIG_PROC_FS
+	atomic_inc(&q->xef->client->reset_count);
+#endif
 	xe_gt_info(gt, "Engine reset: engine_class=%s, logical_mask: 0x%x, guc_id=%d",
 		   xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
 
-- 
2.43.0

