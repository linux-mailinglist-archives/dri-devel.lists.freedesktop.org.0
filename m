Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3688D7E7619
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 01:54:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E57810E401;
	Fri, 10 Nov 2023 00:53:58 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2028110E395;
 Fri, 10 Nov 2023 00:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699577625; x=1731113625;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qPU6h5YKoiEn1bzN6Te9l/ZFP/0xck7VA1TRirSI9xQ=;
 b=IqWVpAPj90lGpAZv+W/+/h2XowPisGLlCjrsNxOHZfi5p63k2iIqgdhl
 1mUZ7zeb4AZWfqKx0VXHS0IfKcaDxq4Ca7mMOXmLtjuFCU0KcKNakP5yJ
 4GzLWq03gt4oVF8CrmQzxesyQw8c5MpNL+DraRm16mC1TKXCB3BTGwbSm
 3SrOL3owSiaNUHu5QcOUzgUP45vD2T4YghVMW1/PmNYZ95DkaDIxA8L2P
 h83Nmw6/CnDoTwkYn6cC/zfbF3xHynYcAgG8S9Bt4yAUGZ7qS6Ir5mPr2
 Ltq1K4J05baPU8OpUxtwFHCPJuuVmnEpCoisBUCPMWx7yEszV1V+Q1hHs A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="11654503"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; d="scan'208";a="11654503"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 16:53:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="887206115"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; d="scan'208";a="887206115"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga004.jf.intel.com with ESMTP; 09 Nov 2023 16:53:41 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 1/2] drm/i915/guc: Don't double enable a context
Date: Thu,  9 Nov 2023 16:54:08 -0800
Message-ID: <20231110005409.304273-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231110005409.304273-1-John.C.Harrison@Intel.com>
References: <20231110005409.304273-1-John.C.Harrison@Intel.com>
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

If a context is blocked, unblocked and subitted repeatedly in rapid
succession, the driver can end up trying to enable the context while
the previous enable request is still in flight. This can lead to much
confusion in the state tracking.

Prevent that by checking the pending enable flag before trying to
enable a context.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index d37698bd6b91a..d399e4d238c10 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -720,7 +720,7 @@ static int __guc_add_request(struct intel_guc *guc, struct i915_request *rq)
 	if (unlikely(context_blocked(ce) && !intel_context_is_parent(ce)))
 		goto out;
 
-	enabled = context_enabled(ce) || context_blocked(ce);
+	enabled = context_enabled(ce) || context_blocked(ce) || context_pending_enable(ce);
 
 	if (!enabled) {
 		action[len++] = INTEL_GUC_ACTION_SCHED_CONTEXT_MODE_SET;
-- 
2.41.0

