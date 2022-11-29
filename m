Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F51F63CA3B
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 22:13:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5EA510E3EC;
	Tue, 29 Nov 2022 21:12:56 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3647010E3EC;
 Tue, 29 Nov 2022 21:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669756370; x=1701292370;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XrpvAjUPcLM2nx70UX0X/r2sGPN7cr4xjn/aFgPl5nc=;
 b=Y0FmS0XuktTilHcP8tUkPfjlArAWloyuPbg1d1/PV2+8npUoT8xbejxc
 R7VkPiT1KX0kmq/VslVOl2cdU3ZXuXK1bSWswfIv474sbDKDfKfQOZ4ig
 st9rb6QJYhR8mfT+mC/GsGhaXTgwyBSnMn7dUVlUACTESZvWTHrB0gCm2
 eqnZWdb+vKRvaDd/0xd5tTnaI/7/T9lUQ2GO5VsumfPiqWsVpeLTSz52o
 tvKYFvKcHiBl5wW3VUu1tg2RoiUtSYzFRz6R0G1Qbt5u2MyclQjefsNWr
 OdqMiGMbzPWrB8um5/T2Mc6N/xYdEY5TLsURZCkq1ljAFLFC+vik1czVF A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="315261009"
X-IronPort-AV: E=Sophos;i="5.96,204,1665471600"; d="scan'208";a="315261009"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2022 13:12:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="676576082"
X-IronPort-AV: E=Sophos;i="5.96,204,1665471600"; d="scan'208";a="676576082"
Received: from relo-linux-5.jf.intel.com ([10.165.21.143])
 by orsmga001.jf.intel.com with ESMTP; 29 Nov 2022 13:12:49 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 2/2] drm/i915/guc: Look for a guilty context when an engine
 reset fails
Date: Tue, 29 Nov 2022 13:12:53 -0800
Message-Id: <20221129211253.3183480-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221129211253.3183480-1-John.C.Harrison@Intel.com>
References: <20221129211253.3183480-1-John.C.Harrison@Intel.com>
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

Engine resets are supposed to never happen. But in the case when one
does (due to unknwon reasons that normally come down to a missing
w/a), it is useful to get as much information out of the system as
possible. Given that the GuC effectively dies on such a situation, it
is not possible to get a guilty context notification back. So do a
manual search instead. Given that GuC is dead, this is safe because
GuC won't be changing the engine state asynchronously.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 0a42f1807f52c..c82730804a1c4 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -4751,11 +4751,24 @@ static void reset_fail_worker_func(struct work_struct *w)
 	guc->submission_state.reset_fail_mask = 0;
 	spin_unlock_irqrestore(&guc->submission_state.lock, flags);
 
-	if (likely(reset_fail_mask))
+	if (likely(reset_fail_mask)) {
+		struct intel_engine_cs *engine;
+		enum intel_engine_id id;
+
+		/*
+		 * GuC is toast at this point - it dead loops after sending the failed
+		 * reset notification. So need to manually determine the guilty context.
+		 * Note that it should be safe/reliable to do this here because the GuC
+		 * is toast and will not be scheduling behind the KMD's back.
+		 */
+		for_each_engine_masked(engine, gt, reset_fail_mask, id)
+			intel_guc_find_hung_context(engine);
+
 		intel_gt_handle_error(gt, reset_fail_mask,
 				      I915_ERROR_CAPTURE,
 				      "GuC failed to reset engine mask=0x%x\n",
 				      reset_fail_mask);
+	}
 }
 
 int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
-- 
2.37.3

