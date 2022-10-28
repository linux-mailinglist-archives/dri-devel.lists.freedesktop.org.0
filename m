Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA00611B14
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 21:45:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8810210E8CE;
	Fri, 28 Oct 2022 19:45:24 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E86B810E8CC;
 Fri, 28 Oct 2022 19:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666986319; x=1698522319;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3lYphhyZVi7Wi2cxkFQ8Pw8jc83g2UGQ5dZMJbPn+68=;
 b=SzDevT0Q8bpb8OoBFFo8NgQ1f1f85Y1KTk2X5kxESB2eD3mVCbIy/695
 ZDMcjFbzCRMclqioC8sdvTI/o3jKCPg9GNF+RYgJgBtXWPuE8ZjTI5/J1
 jF4QG0YC1Ftvy/uFOilCefVaKGY1CzDeojKaWVTdD/64pdA/mKZZJYupi
 LpmvFLvcQQu0jdO5pcfnBTccfZIqF5yNSL8QRflS6mhIHtLlFsvMLLpJW
 LOJShLzWarkWMWB4YR5PA7Wnl+Tncp7dSWOgBu2ZYBm7rfY/d1ammAEvi
 lANLQoz2oy9vDa6GNvgfg4keBWYI2mI717gyCOgO9rBqw8z0H7LSxzZ+D w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="372787686"
X-IronPort-AV: E=Sophos;i="5.95,222,1661842800"; d="scan'208";a="372787686"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2022 12:45:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="775491785"
X-IronPort-AV: E=Sophos;i="5.95,222,1661842800"; d="scan'208";a="775491785"
Received: from relo-linux-5.jf.intel.com ([10.165.21.195])
 by fmsmga001.fm.intel.com with ESMTP; 28 Oct 2022 12:45:10 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 1/2] drm/i915/guc: Properly initialise kernel contexts
Date: Fri, 28 Oct 2022 12:46:48 -0700
Message-Id: <20221028194649.1130223-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028194649.1130223-1-John.C.Harrison@Intel.com>
References: <20221028194649.1130223-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

If a context has already been registered prior to first submission
then context init code was not being called. The noticeable effect of
that was the scheduling priority was left at zero (meaning super high
priority) instead of being set to normal. This would occur with
kernel contexts at start of day as they are manually pinned up front
rather than on first submission. So add a call to initialise those
when they are pinned.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 4ccb29f9ac55c..941613be3b9dd 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -4111,6 +4111,9 @@ static inline void guc_kernel_context_pin(struct intel_guc *guc,
 	if (context_guc_id_invalid(ce))
 		pin_guc_id(guc, ce);
 
+	if (!test_bit(CONTEXT_GUC_INIT, &ce->flags))
+		guc_context_init(ce);
+
 	try_context_registration(ce, true);
 }
 
-- 
2.37.3

