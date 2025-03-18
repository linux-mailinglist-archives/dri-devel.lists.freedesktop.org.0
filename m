Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6A1A670CC
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 11:11:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69F1C10E45F;
	Tue, 18 Mar 2025 10:10:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MMzwl/BJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADB9910E45C;
 Tue, 18 Mar 2025 10:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742292649; x=1773828649;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NdOXlQY6LSxWk1LYo10E/kXzqa2q06qeotqWrI9rn+I=;
 b=MMzwl/BJJ2D+ARZIyfyzTvVF4WLyUTfv/9KPcsPsAoAGcLBrk77IcxpX
 UzijFJ7Zi725d7HAyBAzOpnJe2g7ZhJrVXhvyCTOM1lN92Y8gjTWj+as7
 +s9S5bQc9JyHblgBPSQPTIqduzjfn1+lphlxVQqgCDu9sz1GgAiMwDS54
 Du7ztQaxIWER7Wr2vZcyH++3gMwapXfLanHoSLWZ8rc8gyhLn3GkmA4A5
 1dKto6QnJ7kVOl3HQUQXCOGpTdArC6uIV8rXoEKpI5/LGlg9YTbcBwsON
 RmHEQBPcVwm+TVJ3F1xxJpKnjtEHnmlC7xy2yfBJk8qkIuo3gpfC6kSnY g==;
X-CSE-ConnectionGUID: k7eDdg2eSYOd1Ah8k58DrQ==
X-CSE-MsgGUID: McCnwaFZR/yetmUsFy9RWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="60817152"
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; d="scan'208";a="60817152"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2025 03:10:45 -0700
X-CSE-ConnectionGUID: YIfUjykRS0G6i1+39LA79Q==
X-CSE-MsgGUID: O2B6gmp6TGePTSuPEgsE+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; d="scan'208";a="122713412"
Received: from unknown (HELO nitin-Super-Server.iind.intel.com)
 ([10.190.238.72])
 by fmviesa010.fm.intel.com with ESMTP; 18 Mar 2025 03:10:43 -0700
From: Nitin Gote <nitin.r.gote@intel.com>
To: christian.koenig@amd.com
Cc: intel-gfx@lists.freedesktop.org, sumit.semwal@linaro.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 chris.p.wilson@intel.com, andi.shyti@intel.com, nitin.r.gote@intel.com
Subject: [PATCH] dma-buf: Take a breath during dma-fence-chain subtests
Date: Tue, 18 Mar 2025 16:04:08 +0530
Message-Id: <20250318103408.3566010-1-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.25.1
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

Give the scheduler a chance to breathe by calling cond_resched()
as some of the loops may take some time on old machines (apl/bsw/pnv), and
so catch the attention of the watchdogs.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
Cc: Christian Konig <christian.koenig@amd.com>

Hi Konig,

This is not a functional issue in test. We wish to prevent softlock and allow the
dma-fence-chain test run to completion to verify it's functional correctness.

The performance issue takes about 5ms for the dma-fence-chain to be signalled on
older hardware which is an orthogonal issue and to be debugged separately for
which the test has to run to completion.

So, reverting to cond_resched() which fixes the issue instead of
delay functions.

- Nitin

 drivers/dma-buf/st-dma-fence-chain.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/st-dma-fence-chain.c b/drivers/dma-buf/st-dma-fence-chain.c
index ed4b323886e4..328a66ed59e5 100644
--- a/drivers/dma-buf/st-dma-fence-chain.c
+++ b/drivers/dma-buf/st-dma-fence-chain.c
@@ -505,6 +505,7 @@ static int signal_forward(void *arg)
 
 	for (i = 0; i < fc.chain_length; i++) {
 		dma_fence_signal(fc.fences[i]);
+		cond_resched();
 
 		if (!dma_fence_is_signaled(fc.chains[i])) {
 			pr_err("chain[%d] not signaled!\n", i);
@@ -537,6 +538,7 @@ static int signal_backward(void *arg)
 
 	for (i = fc.chain_length; i--; ) {
 		dma_fence_signal(fc.fences[i]);
+		cond_resched();
 
 		if (i > 0 && dma_fence_is_signaled(fc.chains[i])) {
 			pr_err("chain[%d] is signaled!\n", i);
@@ -587,8 +589,10 @@ static int wait_forward(void *arg)
 	get_task_struct(tsk);
 	yield_to(tsk, true);
 
-	for (i = 0; i < fc.chain_length; i++)
+	for (i = 0; i < fc.chain_length; i++) {
 		dma_fence_signal(fc.fences[i]);
+		cond_resched();
+	}
 
 	err = kthread_stop_put(tsk);
 
@@ -616,8 +620,10 @@ static int wait_backward(void *arg)
 	get_task_struct(tsk);
 	yield_to(tsk, true);
 
-	for (i = fc.chain_length; i--; )
+	for (i = fc.chain_length; i--; ) {
 		dma_fence_signal(fc.fences[i]);
+		cond_resched();
+	}
 
 	err = kthread_stop_put(tsk);
 
@@ -663,8 +669,10 @@ static int wait_random(void *arg)
 	get_task_struct(tsk);
 	yield_to(tsk, true);
 
-	for (i = 0; i < fc.chain_length; i++)
+	for (i = 0; i < fc.chain_length; i++) {
 		dma_fence_signal(fc.fences[i]);
+		cond_resched();
+	}
 
 	err = kthread_stop_put(tsk);
 
-- 
2.25.1

