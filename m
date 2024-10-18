Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4A49A489B
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 22:55:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51C3C10E997;
	Fri, 18 Oct 2024 20:55:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vw2b1E+7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02E0F10E994;
 Fri, 18 Oct 2024 20:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729284922; x=1760820922;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lj32wKQDvLhtlT5n6QtNO68nOGBIKClj17sZdGyNIV4=;
 b=Vw2b1E+7dDVp3fGpBN0/0G3lr6k2d9ewTH0en1w+hMgcro/pFGm2LKgA
 qkwl4q1n5I2X0rqDiHkBuaxpvNOrqRshei6UIlx6sSBzCK9no3IYcP8Lh
 IV2GdL5HjSXOUwfYvWWXN1Z3VpMY4An7no4pzOIHbx3IZ72ehaIUDOa4M
 JJ21Qq/kjleZovt8DRz7Wq1lYdp4N2hhBAjkwnDGwm4U9cKVNDitHmMzw
 Klzw1LLHemdyClpcXFS76bWlhQY1zy16p8c48VXb+NS88+jZBRTaa7a41
 2AfC39hcpyLQzDfxst6akXNoqyuCiFvzKDeXtn13GvOg0e5Ha3d2KV4jc A==;
X-CSE-ConnectionGUID: z8+1IOTgRcuECUXARH7Bvg==
X-CSE-MsgGUID: kLr8CZdtS82Xyq30okNNQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28937234"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28937234"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 13:55:22 -0700
X-CSE-ConnectionGUID: kUZ5RYADSn+ahuEV8sc/uA==
X-CSE-MsgGUID: yiHIvDyQQUqsR/2+H11vUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; d="scan'208";a="78628375"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa007.fm.intel.com with ESMTP; 18 Oct 2024 13:55:22 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v1 1/1] drm/i915/guc: Disable ct during GuC reset
Date: Fri, 18 Oct 2024 13:55:19 -0700
Message-Id: <20241018205519.86326-2-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241018205519.86326-1-zhanjun.dong@intel.com>
References: <20241018205519.86326-1-zhanjun.dong@intel.com>
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

During GuC reset prepare, interrupt disabled before hardware reset.
Add disable ct to prevent unnecessary message processing.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c         | 3 +++
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index 0d5197c0824a..7fd4f8f9131a 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -1176,6 +1176,9 @@ static bool ct_process_incoming_requests(struct intel_guc_ct *ct)
 	bool done;
 	int err;
 
+	if (!ct->enabled)
+		return true;
+
 	spin_lock_irqsave(&ct->requests.lock, flags);
 	request = list_first_entry_or_null(&ct->requests.incoming,
 					   struct ct_incoming_msg, link);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 9ede6f240d79..866b71a87630 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -1684,6 +1684,8 @@ void intel_guc_submission_reset_prepare(struct intel_guc *guc)
 	guc->interrupts.disable(guc);
 	__reset_guc_busyness_stats(guc);
 
+	intel_guc_ct_disable(&guc->ct);
+
 	/* Flush IRQ handler */
 	spin_lock_irq(guc_to_gt(guc)->irq_lock);
 	spin_unlock_irq(guc_to_gt(guc)->irq_lock);
-- 
2.34.1

