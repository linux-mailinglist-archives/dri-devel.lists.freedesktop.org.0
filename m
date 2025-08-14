Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92133B26163
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 11:49:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1921F10E831;
	Thu, 14 Aug 2025 09:48:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GszPgjYn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D3F910E829;
 Thu, 14 Aug 2025 09:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755164937; x=1786700937;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3HvWywzk/74wUW75FRjyiFEfmGATLSwPr1U5TNMV5n0=;
 b=GszPgjYn+Mc47NZuh+kPUd32qE7V9LwWcLCEX0IMyBIbLUUJMeV2+I+4
 NAIrmZcCsWVo+D+LFPIXOR9D7zO0KRDB3rsHAvhObMhIe/drDF7o0kxHr
 DLN8CaP8SbRq1UhSsB/kq+VQgYEwaIDVGUKmufJX2viPxNxI7w9gCOY+1
 B+A2b4F7X2c1nePUlvUFJmO9Riukl3vUaibGMNXw7RUVl0++WEMOscd6M
 38FWleM1oHDVux1T2KjvFRANoIWZLnLYsw7GrLOszba238mYIupRfavxb
 K8RIO1xIUwGILfmSiAqMuvFUCCNGFAZfpzJBkDUMLn13tf5jZpAU/E23k w==;
X-CSE-ConnectionGUID: BdnaBZSpQByi++C5SbSzAw==
X-CSE-MsgGUID: je6FSul6RBi/9S265ZAI9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="67746953"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="67746953"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 02:48:57 -0700
X-CSE-ConnectionGUID: P0zOSWwDSN23cudyqTm5/g==
X-CSE-MsgGUID: WVaXgAKtSlmIHh6TIzcekQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="166980945"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.244.150])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 02:48:53 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH 1/4] dma-buf/fence-chain: Report time spent in wait_* test
 cases
Date: Thu, 14 Aug 2025 10:16:12 +0200
Message-ID: <20250814094824.217142-7-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250814094824.217142-6-janusz.krzysztofik@linux.intel.com>
References: <20250814094824.217142-6-janusz.krzysztofik@linux.intel.com>
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

CI results indicate excessive time spent on processing of wait_backward
selftest.  For easy comparison, report processing time of each wait_* test
case.

Suggested-by: Chris Wilson <chris.p.wilson@linux.intel.com>
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 drivers/dma-buf/st-dma-fence-chain.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/dma-buf/st-dma-fence-chain.c b/drivers/dma-buf/st-dma-fence-chain.c
index ed4b323886e43..80598da9237af 100644
--- a/drivers/dma-buf/st-dma-fence-chain.c
+++ b/drivers/dma-buf/st-dma-fence-chain.c
@@ -572,6 +572,7 @@ static int wait_forward(void *arg)
 {
 	struct fence_chains fc;
 	struct task_struct *tsk;
+	ktime_t dt;
 	int err;
 	int i;
 
@@ -587,8 +588,12 @@ static int wait_forward(void *arg)
 	get_task_struct(tsk);
 	yield_to(tsk, true);
 
+	dt = -ktime_get();
 	for (i = 0; i < fc.chain_length; i++)
 		dma_fence_signal(fc.fences[i]);
+	dt += ktime_get();
+
+	pr_info("%s: %d signals in %llu ns\n", __func__, fc.chain_length, ktime_to_ns(dt));
 
 	err = kthread_stop_put(tsk);
 
@@ -601,6 +606,7 @@ static int wait_backward(void *arg)
 {
 	struct fence_chains fc;
 	struct task_struct *tsk;
+	ktime_t dt;
 	int err;
 	int i;
 
@@ -616,8 +622,12 @@ static int wait_backward(void *arg)
 	get_task_struct(tsk);
 	yield_to(tsk, true);
 
+	dt = -ktime_get();
 	for (i = fc.chain_length; i--; )
 		dma_fence_signal(fc.fences[i]);
+	dt += ktime_get();
+
+	pr_info("%s: %d signals in %llu ns\n", __func__, fc.chain_length, ktime_to_ns(dt));
 
 	err = kthread_stop_put(tsk);
 
@@ -646,6 +656,7 @@ static int wait_random(void *arg)
 {
 	struct fence_chains fc;
 	struct task_struct *tsk;
+	ktime_t dt;
 	int err;
 	int i;
 
@@ -663,8 +674,12 @@ static int wait_random(void *arg)
 	get_task_struct(tsk);
 	yield_to(tsk, true);
 
+	dt = -ktime_get();
 	for (i = 0; i < fc.chain_length; i++)
 		dma_fence_signal(fc.fences[i]);
+	dt += ktime_get();
+
+	pr_info("%s: %d signals in %llu ns\n", __func__, fc.chain_length, ktime_to_ns(dt));
 
 	err = kthread_stop_put(tsk);
 
-- 
2.50.1

