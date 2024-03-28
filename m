Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A3088F8DA
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 08:35:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59C9611233C;
	Thu, 28 Mar 2024 07:34:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DxSAsMsS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03ABF112222;
 Thu, 28 Mar 2024 07:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711611298; x=1743147298;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XTFPaTmXSta6mgFUckkxJnipFhHYQtbRcrwp6ptz84Y=;
 b=DxSAsMsSO6DPL1dzSBE+/Oh9MYP972DCu/lQ2p8N3A9o5yXIQYemEdeK
 jZr5E2Li5pg7mOYiwPIAkm8FOmijLhoHcE86T37+UN8AbWpIrDq/VnATS
 CPcNKJ1unfdcCoRn2nvulI0gpz1idPY/pYrJP8wQDj7du9pnaTfCDW5zi
 2AWK/k87s4Bgd8/CNXarMfdrBPnpBCpJDLdqzIKtRd1stALsX1TtwhH/z
 /n2bpD0ijibVbglg59A7NaeD48BeixLmTHxs4ugsE8Q2tIKkuTSHlqAAV
 NsEpW1iIk12UIvmPMk2Unn7uT8YRAbZ9mSDAXyzZTPLmU359p6kWFGSq3 A==;
X-CSE-ConnectionGUID: qYeamJqfRcaaM+gCZcbU/A==
X-CSE-MsgGUID: HP3wYDsLQsK/RVCFnXSAWw==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="10555536"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; d="scan'208";a="10555536"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 00:34:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; d="scan'208";a="16568519"
Received: from unknown (HELO intel.com) ([10.247.118.221])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 00:34:50 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, stable@vger.kernel.org,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Andi Shyti <andi.shyti@kernel.org>, Tvrtko Ursulin <tursulin@ursulin.net>
Subject: [PATCH v8 2/3] drm/i915/gt: Do not generate the command streamer for
 all the CCS
Date: Thu, 28 Mar 2024 08:34:04 +0100
Message-ID: <20240328073409.674098-3-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240328073409.674098-1-andi.shyti@linux.intel.com>
References: <20240328073409.674098-1-andi.shyti@linux.intel.com>
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

We want a fixed load CCS balancing consisting in all slices
sharing one single user engine. For this reason do not create the
intel_engine_cs structure with its dedicated command streamer for
CCS slices beyond the first.

Fixes: d2eae8e98d59 ("drm/i915/dg2: Drop force_probe requirement")
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: <stable@vger.kernel.org> # v6.2+
Acked-by: Michal Mrozek <michal.mrozek@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 476651bd0a21..8c44af1c3451 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -874,6 +874,23 @@ static intel_engine_mask_t init_engine_mask(struct intel_gt *gt)
 		info->engine_mask &= ~BIT(GSC0);
 	}
 
+	/*
+	 * Do not create the command streamer for CCS slices beyond the first.
+	 * All the workload submitted to the first engine will be shared among
+	 * all the slices.
+	 *
+	 * Once the user will be allowed to customize the CCS mode, then this
+	 * check needs to be removed.
+	 */
+	if (IS_DG2(gt->i915)) {
+		u8 first_ccs = __ffs(CCS_MASK(gt));
+
+		/* Mask off all the CCS engine */
+		info->engine_mask &= ~GENMASK(CCS3, CCS0);
+		/* Put back in the first CCS engine */
+		info->engine_mask |= BIT(_CCS(first_ccs));
+	}
+
 	return info->engine_mask;
 }
 
-- 
2.43.0

