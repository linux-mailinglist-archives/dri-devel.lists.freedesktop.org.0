Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3E651CB73
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 23:39:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0403110FA8C;
	Thu,  5 May 2022 21:38:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7184E10ECAD;
 Thu,  5 May 2022 21:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651786702; x=1683322702;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y7VRDT+9u7/ffAIo/19MXpNwmSWnQgmtiRhOblw05oo=;
 b=WkuQskBbr4qs0ZNaYFkdxS0nFOSq7zeBU1Qvy4JecxHDrOkfrg8kTqbR
 icqc4m0W79yxFNe9bnCwmJLUslcJuK0868LcwKEm1scngQpxvExvaD8bI
 yYcszaWmLexepiN1Q+Lpzhsgj23mV+i82pJRFTaAiZbfHMkRgQG/Lx0zV
 NmToRkPnGmHV25Y06X7wwkDlc8gWRAoPDu36JtiRislmv/R1NTgijb86f
 h0kA4U51uHQb7x4hJ2640vqxURI1fC7DYiDfhXV+1Vxxk+W2uFMbjTbNn
 eH1Ag/A0sTidtA6HpoSIt7bDPusnoOZoIufzlWVo54hs0qej+kl6mNGUS w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="248166064"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="248166064"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 14:38:21 -0700
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="549553275"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 14:38:21 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 06/12] drm/i915/pvc: Reduce stack usage in reset selftest
 with extra blitter engine
Date: Thu,  5 May 2022 14:38:06 -0700
Message-Id: <20220505213812.3979301-7-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220505213812.3979301-1-matthew.d.roper@intel.com>
References: <20220505213812.3979301-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

PVC adds extra blitter engines (in the following patch). The reset
selftest has a local array on the stack which is sized by the number
of engines. The increase pushes the size of this array to the point
where it trips the 'stack too large' compile warning. This patch takes
the allocation of the stack and makes it dynamic instead.

v2 (MattR):
 - Minor cosmetic changes:  re-sort definition and allocate using
   kmalloc_array().  (Tvrtko)

Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
index 83ff4c2e57c5..6493265d5f64 100644
--- a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
+++ b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
@@ -976,6 +976,7 @@ static int __igt_reset_engines(struct intel_gt *gt,
 {
 	struct i915_gpu_error *global = &gt->i915->gpu_error;
 	struct intel_engine_cs *engine, *other;
+	struct active_engine *threads;
 	enum intel_engine_id id, tmp;
 	struct hang h;
 	int err = 0;
@@ -996,8 +997,11 @@ static int __igt_reset_engines(struct intel_gt *gt,
 			h.ctx->sched.priority = 1024;
 	}
 
+	threads = kmalloc_array(I915_NUM_ENGINES, sizeof(*threads), GFP_KERNEL);
+	if (!threads)
+		return -ENOMEM;
+
 	for_each_engine(engine, gt, id) {
-		struct active_engine threads[I915_NUM_ENGINES] = {};
 		unsigned long device = i915_reset_count(global);
 		unsigned long count = 0, reported;
 		bool using_guc = intel_engine_uses_guc(engine);
@@ -1016,7 +1020,7 @@ static int __igt_reset_engines(struct intel_gt *gt,
 			break;
 		}
 
-		memset(threads, 0, sizeof(threads));
+		memset(threads, 0, sizeof(*threads) * I915_NUM_ENGINES);
 		for_each_engine(other, gt, tmp) {
 			struct task_struct *tsk;
 
@@ -1236,6 +1240,7 @@ static int __igt_reset_engines(struct intel_gt *gt,
 			break;
 		}
 	}
+	kfree(threads);
 
 	if (intel_gt_is_wedged(gt))
 		err = -EIO;
-- 
2.35.1

