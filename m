Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 918406ED224
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 18:10:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B77FC10E532;
	Mon, 24 Apr 2023 16:10:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7B7510E1A6;
 Mon, 24 Apr 2023 16:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682352636; x=1713888636;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=coi5Vjns5duNbkYPJ7E4FYYeE5hvswdptrqTez1vh0c=;
 b=n7rJRY3HwWir/5os9uAbkzSoYczvJ8gLGF50CyjLHEM3ZyEmePT8UOCr
 /FcTiXPOiiYAqvF5vQSd9LYVoRtIgdkz3rNs06x7mTkgNPLCmmqmCRtX5
 ec+9ZOa95M9iiiCmlbncwAFKgTek8u6pWwJYeRggY13zu/dIMaTkOI1mu
 p+o7C41ILHo9++1eIir+6vEm2jBdEuPmKjcSBV07B6YR0NHwYAWyLOwkz
 49PDrza5AqWf7X5PmIEs88O9nbeRadaAffH2RCMnxHh+NtVB7I2aA86cx
 Sn3Ckd0TPU/c0gGHs0VYl2FvxDc7ab391QdjNSgV/yU1TTDK/LLHyapSC A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="326808649"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="326808649"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 09:09:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="695822641"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="695822641"
Received: from apalfi-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.34.175])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 09:09:30 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>, Fei Yang <fei.yang@intel.com>
Subject: [PATCH 1/2] Revert "drm/i915/mtl: fix mocs selftest"
Date: Mon, 24 Apr 2023 18:09:12 +0200
Message-Id: <20230424160913.19886-2-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230424160913.19886-1-andi.shyti@linux.intel.com>
References: <20230424160913.19886-1-andi.shyti@linux.intel.com>
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
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Lucas Martins De Marchi <lucas.demarchi@intel.com>,
 Andi Shyti <andi.shyti@kernel.org>, Andi Shyti <andi.shyti@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit faca6aaa4838c3c234caa619d3c7d1f09da0d303.

This patch, in series with the next "Define MOCS and PAT tables
for MTL" are causing boot failures for MTL.

Revert them both.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Fei Yang <fei.yang@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/selftest_mocs.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_mocs.c b/drivers/gpu/drm/i915/gt/selftest_mocs.c
index a8446ab825012..ca009a6a13bdb 100644
--- a/drivers/gpu/drm/i915/gt/selftest_mocs.c
+++ b/drivers/gpu/drm/i915/gt/selftest_mocs.c
@@ -131,14 +131,13 @@ static int read_mocs_table(struct i915_request *rq,
 			   const struct drm_i915_mocs_table *table,
 			   u32 *offset)
 {
-	struct intel_gt *gt = rq->engine->gt;
 	u32 addr;
 
 	if (!table)
 		return 0;
 
 	if (HAS_GLOBAL_MOCS_REGISTERS(rq->engine->i915))
-		addr = global_mocs_offset() + gt->uncore->gsi_offset;
+		addr = global_mocs_offset();
 	else
 		addr = mocs_offset(rq->engine);
 
-- 
2.40.0

