Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D9F5FCF23
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 02:02:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB18910E2E0;
	Thu, 13 Oct 2022 00:01:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 759CA10E11E;
 Thu, 13 Oct 2022 00:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665619294; x=1697155294;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Jy+r+Ezy4aRLpD0W/AMkwrtHn8gcHjVObP94RtD7TUM=;
 b=khBnnTjt7a5I8KLHyKqqfOyZSATXMXaqeumBuDRr2zHNZInQ0kYYZSL3
 x1PdLtbIfzhSKtzavOU3iFYvtg0VYNm5EwdamAA2Rs9LzZrs6mUtCLkhR
 +SVmfYU9fzZzCgPMdXF4Dp4+iyZpXZQA294TyRr0XQG36OVEKIE9W5e7m
 Zmdo22NxvdS0pL2ZCgamLgU6ZZ0yFjfcU6287xFczE2X12Z7zp8QDn7Vb
 EcCYdvMBQ19QXk7u43qw5qWm0G1JRDn4WsTep5KfVn0PcWE1qdoGBmnrT
 M+xRusMrjpHhNh5h0qCrAP0Qn9xj5BcfrAKPpA0t6PeS3c9V0pRTVP8hb Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10498"; a="292263366"
X-IronPort-AV: E=Sophos;i="5.95,180,1661842800"; d="scan'208";a="292263366"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2022 17:01:34 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10498"; a="802031108"
X-IronPort-AV: E=Sophos;i="5.95,180,1661842800"; d="scan'208";a="802031108"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2022 17:01:33 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 4/7] drm/i915/guc: Add GuC deprivilege feature to MTL
Date: Wed, 12 Oct 2022 17:03:29 -0700
Message-Id: <20221013000332.1738078-5-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221013000332.1738078-1-daniele.ceraolospurio@intel.com>
References: <20221013000332.1738078-1-daniele.ceraolospurio@intel.com>
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
Cc: Stuart Summers <stuart.summers@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, dri-devel@lists.freedesktop.org,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Stuart Summers <stuart.summers@intel.com>

MTL supports GuC deprivilege. Add the feature flag to this platform.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Cc: John Harrison <john.c.harrison@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/i915_pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 38460a0bd7cb..c252ef31a610 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -1145,6 +1145,7 @@ static const struct intel_device_info mtl_info = {
 	.extra_gt_list = xelpmp_extra_gt,
 	.has_flat_ccs = 0,
 	.has_gmd_id = 1,
+	.has_guc_deprivilege = 1,
 	.has_snoop = 1,
 	.__runtime.memory_regions = REGION_SMEM | REGION_STOLEN_LMEM,
 	.__runtime.platform_engine_mask = BIT(RCS0) | BIT(BCS0) | BIT(CCS0),
-- 
2.37.3

