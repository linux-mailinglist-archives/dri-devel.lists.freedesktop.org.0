Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 050826EB0A4
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 19:37:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2EB810EE84;
	Fri, 21 Apr 2023 17:36:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDCC410E274;
 Fri, 21 Apr 2023 17:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682098610; x=1713634610;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3ZNmm4gyl1v+oHMmQGVidi6RVePQPzwihfDIsKK1pEw=;
 b=YKd8qnvdwSMlPBgVNtQZVXHTjsOhnZ+u0mirAiGULd20gsPt89GaYnWF
 Wn9wyWmBvuOZpqjnEqmm4DtEy+bLJdWaD17+QDnCAcf7cvZaNUCESNYR6
 3b/XbHxtslHfUki9dW3zjLgnzo4R7IJdn8kRP88fgT3RY4MCdy5wTtUqA
 Sm3L9EcOORRjO6KEUu15ZMNEcPPDCMMu7cXQCQYV3QuXMDuWGZ/nPuIRe
 k7uev7omutHNz1GtmMxgOEcI4iSW+KdEXVziVt0OrxNtHshJn8p6MNKRK
 JhAQytWzfaNT89Ly0V+CAPj3vHHkq/lc0CFZAdgAfG+Wy9Ks2WmvRt/7Z w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="347949459"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="347949459"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 10:36:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="669794794"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="669794794"
Received: from fyang16-desk.jf.intel.com ([10.24.96.243])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 10:36:49 -0700
From: fei.yang@intel.com
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 2/8] drm/i915/mtl: fix mocs selftest
Date: Fri, 21 Apr 2023 10:37:55 -0700
Message-Id: <20230421173801.3369303-3-fei.yang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230421173801.3369303-1-fei.yang@intel.com>
References: <20230421173801.3369303-1-fei.yang@intel.com>
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
Cc: Matt Roper <matthew.d.roper@intel.com>, Fei Yang <fei.yang@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fei Yang <fei.yang@intel.com>

Media GT has a different base for MOCS register, need to apply
gsi_offset to the mmio address if not using the intel_uncore_r/w
functions for register access.

Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Fei Yang <fei.yang@intel.com>
---
 drivers/gpu/drm/i915/gt/selftest_mocs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_mocs.c b/drivers/gpu/drm/i915/gt/selftest_mocs.c
index ca009a6a13bd..a8446ab82501 100644
--- a/drivers/gpu/drm/i915/gt/selftest_mocs.c
+++ b/drivers/gpu/drm/i915/gt/selftest_mocs.c
@@ -131,13 +131,14 @@ static int read_mocs_table(struct i915_request *rq,
 			   const struct drm_i915_mocs_table *table,
 			   u32 *offset)
 {
+	struct intel_gt *gt = rq->engine->gt;
 	u32 addr;
 
 	if (!table)
 		return 0;
 
 	if (HAS_GLOBAL_MOCS_REGISTERS(rq->engine->i915))
-		addr = global_mocs_offset();
+		addr = global_mocs_offset() + gt->uncore->gsi_offset;
 	else
 		addr = mocs_offset(rq->engine);
 
-- 
2.25.1

