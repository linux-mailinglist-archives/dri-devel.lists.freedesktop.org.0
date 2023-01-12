Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB23666920
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 03:53:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F183A10E855;
	Thu, 12 Jan 2023 02:53:52 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D9C610E2D8;
 Thu, 12 Jan 2023 02:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673492023; x=1705028023;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oUM8+s9CaIlKBqtwPwCkB3+uqFgPbmwEogc4Rv9Zk/4=;
 b=Z+G1UhB5ARPb9CbUikkWiONb5RsfUd5q1BVs3H5CDUc7Ot9B3m2QHf3S
 dbuRJMMeX0Jb4WM0C7ybhwX+S8JYOXGjekfxM8SaqvrpuDx4I+WU9dnlu
 NHL+wayaPWQRDl8PC0dLcWilaSnsdju8PROjXCcutQvcve+9un41ETjgO
 Q8zQVkdEP4C4bvkU7J/c1okyoqjjUz6NKqTIWtKtGZlneJGYVNHmCqbt7
 FMsgo+Igb1mX8X9ILCIosMZzhcaADmM0JE2J0BhLr9Tvajr02LLMM6AtR
 JWvtPWmzy/+vTpLMlrbMJqpNB2C8/SARw86ElC5lVis1c3CU3m90/rG3m w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="350823503"
X-IronPort-AV: E=Sophos;i="5.96,318,1665471600"; d="scan'208";a="350823503"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 18:53:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="986359635"
X-IronPort-AV: E=Sophos;i="5.96,318,1665471600"; d="scan'208";a="986359635"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmsmga005.fm.intel.com with ESMTP; 11 Jan 2023 18:53:42 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 4/4] drm/i915/guc: Add a debug print on GuC triggered reset
Date: Wed, 11 Jan 2023 18:53:11 -0800
Message-Id: <20230112025311.2577084-5-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230112025311.2577084-1-John.C.Harrison@Intel.com>
References: <20230112025311.2577084-1-John.C.Harrison@Intel.com>
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

For understanding bug reports, it can be useful to have an explicit
dmesg print when a reset notification is received from GuC. As opposed
to simply inferring that this happened from other messages.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 99d09e3394597..0be7c27a436dd 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -4665,6 +4665,10 @@ static void guc_handle_context_reset(struct intel_guc *guc,
 {
 	trace_intel_context_reset(ce);
 
+	drm_dbg(&guc_to_gt(guc)->i915->drm, "Got GuC reset of 0x%04X, exiting = %d, banned = %d\n",
+		ce->guc_id.id, test_bit(CONTEXT_EXITING, &ce->flags),
+		test_bit(CONTEXT_BANNED, &ce->flags));
+
 	if (likely(intel_context_is_schedulable(ce))) {
 		capture_error_state(guc, ce);
 		guc_context_replay(ce);
-- 
2.39.0

