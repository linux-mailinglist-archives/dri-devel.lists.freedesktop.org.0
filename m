Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A83616DB1
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 20:19:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4BC210E58F;
	Wed,  2 Nov 2022 19:19:28 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1AFA10E58F;
 Wed,  2 Nov 2022 19:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667416763; x=1698952763;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3lYphhyZVi7Wi2cxkFQ8Pw8jc83g2UGQ5dZMJbPn+68=;
 b=m+z3iJizGONN28hXwwyjQb6CgGTaW7nqdJ9zpFQn88IO6a3dEj7ZAVEa
 QqgC+AEZXB9YpdbEOsKgHzcVAQDstNMkIq2DRoYpkKW390y8QzYwirDsW
 Os+WyQ+1XhU2ScLpmFuuucuiK8cGkxUqSVScwoASVqE9fqsnseK0BW8E5
 Oa7h6dQZWhOAZIrLElZawWC/UEe6IU1NM7E697J7fCb4eXX5PTVjY+E5r
 1nEp/kWVKEkZi8/rXpga0FyhkH9xKeQV8hw9Mu+6fDsWfZoMV/hkGSGIA
 Q0YYtMjxdkEJKcm2Ehj/X/KEGe13vYGiPqL6NypAfwnY+qHGuAVgjBWs/ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="289213511"
X-IronPort-AV: E=Sophos;i="5.95,234,1661842800"; d="scan'208";a="289213511"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2022 12:19:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="777017567"
X-IronPort-AV: E=Sophos;i="5.95,234,1661842800"; d="scan'208";a="777017567"
Received: from relo-linux-5.jf.intel.com ([10.165.21.154])
 by fmsmga001.fm.intel.com with ESMTP; 02 Nov 2022 12:19:22 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v2 1/2] drm/i915/guc: Properly initialise kernel contexts
Date: Wed,  2 Nov 2022 12:21:08 -0700
Message-Id: <20221102192109.2492625-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221102192109.2492625-1-John.C.Harrison@Intel.com>
References: <20221102192109.2492625-1-John.C.Harrison@Intel.com>
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

