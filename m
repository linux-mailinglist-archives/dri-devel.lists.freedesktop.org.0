Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB3787B2C4
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 21:20:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DB0510EAA0;
	Wed, 13 Mar 2024 20:20:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PgcyRh0i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3641E10E988;
 Wed, 13 Mar 2024 20:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710361238; x=1741897238;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r5NgUsrUCXSYJV76trjm0jpWeaLmzYtmdFCDjovonxA=;
 b=PgcyRh0iEgiksz0eAqxcyUBSct78hs/3hl67QRM6hTPw/ObVRiUwObBf
 Ffb/xPpPcoOTJ9xL1gVC8IKvunGOHJRsp2Ag44XXA/2pTTx9obxx+fr+M
 rb5WZV4SSdwOJkCIB7W8d0S0v8JW6bcYYiGYCO1sm11d2KomnrOAYRGO9
 ZrFHswynzuR2/Zz0jJW2SZaCdUFB6OeSsu9Cc2e8D11T3H81BJjsb2m2R
 H5JonsT9pjy7l6jVZ4MP69maPPnnaL4RpOLf8y28hIu9Dw7yfzN9HSRCY
 83/LY+2cE6PxrdoAC+V5oF2zevtPbDzOlTWtzivQiM8viQx4/s/3RXWQT w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5016260"
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; 
   d="scan'208";a="5016260"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 13:20:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; d="scan'208";a="49484943"
Received: from unknown (HELO intel.com) ([10.247.118.152])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 13:20:31 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, stable@vger.kernel.org,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Andi Shyti <andi.shyti@kernel.org>, Tvrtko Ursulin <tursulin@ursulin.net>
Subject: [PATCH v6 2/3] drm/i915/gt: Do not generate the command streamer for
 all the CCS
Date: Wed, 13 Mar 2024 21:19:50 +0100
Message-ID: <20240313201955.95716-3-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240313201955.95716-1-andi.shyti@linux.intel.com>
References: <20240313201955.95716-1-andi.shyti@linux.intel.com>
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
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index f553cf4e6449..c4fb31bb6e72 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -966,6 +966,7 @@ int intel_engines_init_mmio(struct intel_gt *gt)
 	const unsigned int engine_mask = init_engine_mask(gt);
 	unsigned int mask = 0;
 	unsigned int i, class;
+	u8 ccs_instance = 0;
 	u8 logical_ids[MAX_ENGINE_INSTANCE + 1];
 	int err;
 
@@ -986,6 +987,19 @@ int intel_engines_init_mmio(struct intel_gt *gt)
 			    !HAS_ENGINE(gt, i))
 				continue;
 
+			/*
+			 * Do not create the command streamer for CCS slices
+			 * beyond the first. All the workload submitted to the
+			 * first engine will be shared among all the slices.
+			 *
+			 * Once the user will be allowed to customize the CCS
+			 * mode, then this check needs to be removed.
+			 */
+			if (IS_DG2(i915) &&
+			    class == COMPUTE_CLASS &&
+			    ccs_instance++)
+				continue;
+
 			err = intel_engine_setup(gt, i,
 						 logical_ids[instance]);
 			if (err)
@@ -996,11 +1010,9 @@ int intel_engines_init_mmio(struct intel_gt *gt)
 	}
 
 	/*
-	 * Catch failures to update intel_engines table when the new engines
-	 * are added to the driver by a warning and disabling the forgotten
-	 * engines.
+	 * Update the intel_engines table.
 	 */
-	if (drm_WARN_ON(&i915->drm, mask != engine_mask))
+	if (mask != engine_mask)
 		gt->info.engine_mask = mask;
 
 	gt->info.num_engines = hweight32(mask);
-- 
2.43.0

