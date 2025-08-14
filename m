Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB7DB26166
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 11:49:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9058D10E839;
	Thu, 14 Aug 2025 09:49:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kRzVy2qS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7062410E83A;
 Thu, 14 Aug 2025 09:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755164946; x=1786700946;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cMBhYtJN9eUZiBfaIMk/jj2VIEguO002MZNgjid5hU4=;
 b=kRzVy2qSBdp/6GgqQ1v+uL2aiKCBzEx3kRkRasLGV6u4LESFu4bOPhIK
 c85TD4NA65QLl8moJ3M61RpWGyIA+ZICsTI1aZAqeIP2Yme2U332oLrii
 jCrdpBefjiCR9BNDG9llF7GMxyCKwS3V27SJtQmFC6PgiZLqpiaVaSlmm
 T7ZbfO+CpA2ecx//DIj3Yc/Pp7TrA6+aNhmPYRPzAc8i7xgnqcPpHDk7i
 py7puvmGS30neZvPiDO+u7zU7m4jkozW1I9eKRAjAZbNX96MLUwLvP/Z4
 UaRXuXWlO+Xw0PZkgigO4gIOaXSbRWMhlaVJMgrgBOR1HWM7mXloDEETT g==;
X-CSE-ConnectionGUID: G5or51iuRs6Io1at+EuOFg==
X-CSE-MsgGUID: nJUzafO2S7ykgZF5RXTgOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="67746983"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="67746983"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 02:49:05 -0700
X-CSE-ConnectionGUID: VcfNZq/tRVWwQf11LpqctA==
X-CSE-MsgGUID: dEEM3hVFSuy8bbUkRjOUSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="166980969"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.244.150])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 02:49:01 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH 3/4] dma-buf/fence-chain: Wait on each tested chain link
Date: Thu, 14 Aug 2025 10:16:14 +0200
Message-ID: <20250814094824.217142-9-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250814094824.217142-6-janusz.krzysztofik@linux.intel.com>
References: <20250814094824.217142-6-janusz.krzysztofik@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Userspace may build dma_fence chains of arbitrary length step by step,
e.g. via drm_syncobj IOCTLs, and each step may start waiting on a chain
link it has added.  Adjust the wait_* selftests to cover such extreme use
cases.

Having that done, don't enable signaling on each chain link when building
the chain.  There is no point in doing that as long as no user is waiting
on the link, and even then, signaling is enabled automatically as soon as
a user starts waiting on the fence.  Let individual test cases decide
which links of the chain should be waited on / need signaling enabled.

Suggested-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 drivers/dma-buf/st-dma-fence-chain.c | 120 ++++++++++++++++++++-------
 1 file changed, 91 insertions(+), 29 deletions(-)

diff --git a/drivers/dma-buf/st-dma-fence-chain.c b/drivers/dma-buf/st-dma-fence-chain.c
index bff4192420d8b..0e7a24ed7caeb 100644
--- a/drivers/dma-buf/st-dma-fence-chain.c
+++ b/drivers/dma-buf/st-dma-fence-chain.c
@@ -145,8 +145,6 @@ static int fence_chains_init(struct fence_chains *fc, unsigned int count,
 		}
 
 		fc->tail = fc->chains[i];
-
-		dma_fence_enable_sw_signaling(fc->chains[i]);
 	}
 
 	fc->chain_length = i;
@@ -570,23 +568,34 @@ static int __wait_fence_chains(void *arg)
 
 static int wait_forward(void *arg)
 {
+	struct task_struct **tsk;
 	struct fence_chains fc;
-	struct task_struct *tsk;
 	ktime_t dt;
+	int i = 0;
 	int err;
-	int i;
 
 	err = fence_chains_init(&fc, CHAIN_SZ, seqno_inc);
 	if (err)
 		return err;
 
-	tsk = kthread_run(__wait_fence_chains, fc.tail, "dmabuf/wait");
-	if (IS_ERR(tsk)) {
-		err = PTR_ERR(tsk);
+	tsk = kmalloc_array(fc.chain_length, sizeof(*tsk), GFP_KERNEL);
+	if (!tsk) {
+		err = -ENOMEM;
 		goto err;
 	}
-	get_task_struct(tsk);
-	yield_to(tsk, true);
+
+	for (i = 0; i < fc.chain_length; i++) {
+		tsk[i] = kthread_run(__wait_fence_chains, fc.chains[i],
+				     "dmabuf/wait-%llu", fc.fences[i]->seqno);
+		if (IS_ERR(tsk[i])) {
+			err = PTR_ERR(tsk[i]);
+			pr_err("Reported %d for kthread_run(%llu)!\n",
+			       err, fc.fences[i]->seqno);
+			goto err;
+		}
+		get_task_struct(tsk[i]);
+		yield_to(tsk[i], true);
+	}
 
 	dt = -ktime_get();
 	for (i = 0; i < fc.chain_length; i++)
@@ -595,32 +604,53 @@ static int wait_forward(void *arg)
 
 	pr_info("%s: %d signals in %llu ns\n", __func__, fc.chain_length, ktime_to_ns(dt));
 
-	err = kthread_stop_put(tsk);
-
 err:
+	while (i--) {
+		int tsk_err = kthread_stop_put(tsk[i]);
+
+		if (tsk_err)
+			pr_err("Reported %d for kthread_stop_put(%llu)!\n",
+			       tsk_err, fc.fences[i]->seqno);
+
+		if (!err)
+			err = tsk_err;
+	}
+	kfree(tsk);
+
 	fence_chains_fini(&fc);
 	return err;
 }
 
 static int wait_backward(void *arg)
 {
+	struct task_struct **tsk;
 	struct fence_chains fc;
-	struct task_struct *tsk;
 	ktime_t dt;
+	int i = 0;
 	int err;
-	int i;
 
 	err = fence_chains_init(&fc, CHAIN_SZ, seqno_inc);
 	if (err)
 		return err;
 
-	tsk = kthread_run(__wait_fence_chains, fc.tail, "dmabuf/wait");
-	if (IS_ERR(tsk)) {
-		err = PTR_ERR(tsk);
+	tsk = kmalloc_array(fc.chain_length, sizeof(*tsk), GFP_KERNEL);
+	if (!tsk) {
+		err = -ENOMEM;
 		goto err;
 	}
-	get_task_struct(tsk);
-	yield_to(tsk, true);
+
+	for (i = 0; i < fc.chain_length; i++) {
+		tsk[i] = kthread_run(__wait_fence_chains, fc.chains[i],
+				     "dmabuf/wait-%llu", fc.fences[i]->seqno);
+		if (IS_ERR(tsk[i])) {
+			err = PTR_ERR(tsk[i]);
+			pr_err("Reported %d for kthread_run(%llu)!\n",
+			       err, fc.fences[i]->seqno);
+			goto err;
+		}
+		get_task_struct(tsk[i]);
+		yield_to(tsk[i], true);
+	}
 
 	dt = -ktime_get();
 	for (i = fc.chain_length; i--; )
@@ -629,9 +659,20 @@ static int wait_backward(void *arg)
 
 	pr_info("%s: %d signals in %llu ns\n", __func__, fc.chain_length, ktime_to_ns(dt));
 
-	err = kthread_stop_put(tsk);
-
+	i = fc.chain_length;
 err:
+	while (i--) {
+		int tsk_err = kthread_stop_put(tsk[i]);
+
+		if (tsk_err)
+			pr_err("Reported %d for kthread_stop_put(%llu)!\n",
+			       tsk_err, fc.fences[i]->seqno);
+
+		if (!err)
+			err = tsk_err;
+	}
+	kfree(tsk);
+
 	fence_chains_fini(&fc);
 	return err;
 }
@@ -654,11 +695,11 @@ static void randomise_fences(struct fence_chains *fc)
 
 static int wait_random(void *arg)
 {
+	struct task_struct **tsk;
 	struct fence_chains fc;
-	struct task_struct *tsk;
 	ktime_t dt;
+	int i = 0;
 	int err;
-	int i;
 
 	err = fence_chains_init(&fc, CHAIN_SZ, seqno_inc);
 	if (err)
@@ -666,13 +707,24 @@ static int wait_random(void *arg)
 
 	randomise_fences(&fc);
 
-	tsk = kthread_run(__wait_fence_chains, fc.tail, "dmabuf/wait");
-	if (IS_ERR(tsk)) {
-		err = PTR_ERR(tsk);
+	tsk = kmalloc_array(fc.chain_length, sizeof(*tsk), GFP_KERNEL);
+	if (!tsk) {
+		err = -ENOMEM;
 		goto err;
 	}
-	get_task_struct(tsk);
-	yield_to(tsk, true);
+
+	for (i = 0; i < fc.chain_length; i++) {
+		tsk[i] = kthread_run(__wait_fence_chains, fc.chains[i],
+				     "dmabuf/wait-%llu", fc.fences[i]->seqno);
+		if (IS_ERR(tsk[i])) {
+			err = PTR_ERR(tsk[i]);
+			pr_err("Reported %d for kthread_run(%llu)!\n",
+			       err, fc.fences[i]->seqno);
+			goto err;
+		}
+		get_task_struct(tsk[i]);
+		yield_to(tsk[i], true);
+	}
 
 	dt = -ktime_get();
 	for (i = 0; i < fc.chain_length; i++)
@@ -681,9 +733,19 @@ static int wait_random(void *arg)
 
 	pr_info("%s: %d signals in %llu ns\n", __func__, fc.chain_length, ktime_to_ns(dt));
 
-	err = kthread_stop_put(tsk);
-
 err:
+	while (i--) {
+		int tsk_err = kthread_stop_put(tsk[i]);
+
+		if (tsk_err)
+			pr_err("Reported %d for kthread_stop_put(%llu)!\n",
+			       tsk_err, fc.fences[i]->seqno);
+
+		if (!err)
+			err = tsk_err;
+	}
+	kfree(tsk);
+
 	fence_chains_fini(&fc);
 	return err;
 }
-- 
2.50.1

