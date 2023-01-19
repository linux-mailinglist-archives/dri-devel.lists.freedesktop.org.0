Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E9B6731F4
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 07:50:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A897510E8B9;
	Thu, 19 Jan 2023 06:50:38 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B65A810E8B3;
 Thu, 19 Jan 2023 06:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674111033; x=1705647033;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xbbJ1YgtFuol2H6ICruayFiqlhvGc5yaiK2Rt4k4F7U=;
 b=bGISL+UAcog2nreexesGYN4mSFuqknGNZKidqSQce8lxm/LTo4bJqfHs
 lvluuh9rFi6m4icrrdXcKLl8HzDblbvhbJd9gm8VvIHtc/h9CDe9SGYrd
 pwiFazBM+lqJDersaI6P7CctSqnXzhMaWtuDT3b/LYiPL/jL8GZxIwm4M
 M0axeZGYh8K4Gr72981mEWVDKKzDCwjpSy+gxTlI+ImioJkRcY0L7BO+V
 h9otObmSt9WBrfErF2/kvYc5qAVA1YDyB0cypj6+/HXiUGNs4jSTqO1M9
 ZY4v1UEN0dvG8bMqqlywLTALl/7s5lm/CtoyN6uxw6N8jXUyTRSw4qlrO w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="323897866"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; d="scan'208";a="323897866"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 22:50:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="723385752"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; d="scan'208";a="723385752"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmsmga008.fm.intel.com with ESMTP; 18 Jan 2023 22:50:21 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v3 6/6] drm/i915/guc: Add a debug print on GuC triggered reset
Date: Wed, 18 Jan 2023 22:50:00 -0800
Message-Id: <20230119065000.1661857-7-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230119065000.1661857-1-John.C.Harrison@Intel.com>
References: <20230119065000.1661857-1-John.C.Harrison@Intel.com>
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

For understanding bug reports, it can be useful to have an explicit
dmesg print when a reset notification is received from GuC. As opposed
to simply inferring that this happened from other messages.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 7c5ea66218443..30f79d333ae9b 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -4667,6 +4667,10 @@ static void guc_handle_context_reset(struct intel_guc *guc,
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

