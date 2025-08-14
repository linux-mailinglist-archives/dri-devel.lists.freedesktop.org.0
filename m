Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16688B26165
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 11:49:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B78810E833;
	Thu, 14 Aug 2025 09:49:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IK5duOle";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F2BB10E829;
 Thu, 14 Aug 2025 09:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755164942; x=1786700942;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9H3qdfmrHoH0j64nmvr5Ic6+tT8BMGk7389BUcrVgFU=;
 b=IK5duOleAWJatSpXFMERLwMFH+qujTFw87vl21cTtJsVqVwBCgpLyxIN
 PzYOy9H1LBrbBvZtYPC2WhFKavbxrx1To7fHuCFxeA+qBJBEzQSgb3Cjc
 +ZDH6mPVm7UsUIhyoALrGlkXl1NWi6v52qhfKSTg7Lj0FM0ZMbS7ALfxB
 y4kFXrho/dhCKB2y4ALKCuDIYx0GeCPhl0PvBZFfbcCeU7sYhRyXft3WG
 +OJAXuL2QTZKjkwhJIEJPrG8mR7VpWBAh/NdcTWuqSYSspZsHwm2O+FNd
 3i3NW3Iob1Jxt3XmXUZb5kirZQ6FCyymWa/DXL1RdiffFRpd7C0SDy5sN Q==;
X-CSE-ConnectionGUID: wKcTKKrOQjmhNQrzIXwkYQ==
X-CSE-MsgGUID: xUvFPKr+RCiO7A+qnZKcrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="67746968"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="67746968"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 02:49:01 -0700
X-CSE-ConnectionGUID: 4Of09AkvQHqarNvX/65yoQ==
X-CSE-MsgGUID: JplX0PE3SDiTnAP8zoJ52w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="166980954"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.244.150])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 02:48:57 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH 2/4] dma-buf/fence-chain: Let test cases decide which fence to
 wait on
Date: Thu, 14 Aug 2025 10:16:13 +0200
Message-ID: <20250814094824.217142-8-janusz.krzysztofik@linux.intel.com>
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

Test cases that create threads around __wait_fence_chains() function now
pass info about the whole chain to those threads as an argument, with no
hint on which fence of the chain to wait on.  That decision is hard coded
into the __wait_fence_chains() function which always selects the tail of
the chain.

Since future test cases may decide to spawn threads that wait on arbitrary
links of the chain, pass a single fence as the thread argument instead.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 drivers/dma-buf/st-dma-fence-chain.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/dma-buf/st-dma-fence-chain.c b/drivers/dma-buf/st-dma-fence-chain.c
index 80598da9237af..bff4192420d8b 100644
--- a/drivers/dma-buf/st-dma-fence-chain.c
+++ b/drivers/dma-buf/st-dma-fence-chain.c
@@ -560,9 +560,9 @@ static int signal_backward(void *arg)
 
 static int __wait_fence_chains(void *arg)
 {
-	struct fence_chains *fc = arg;
+	struct dma_fence *f = arg;
 
-	if (dma_fence_wait(fc->tail, false))
+	if (dma_fence_wait(f, false))
 		return -EIO;
 
 	return 0;
@@ -580,7 +580,7 @@ static int wait_forward(void *arg)
 	if (err)
 		return err;
 
-	tsk = kthread_run(__wait_fence_chains, &fc, "dmabuf/wait");
+	tsk = kthread_run(__wait_fence_chains, fc.tail, "dmabuf/wait");
 	if (IS_ERR(tsk)) {
 		err = PTR_ERR(tsk);
 		goto err;
@@ -614,7 +614,7 @@ static int wait_backward(void *arg)
 	if (err)
 		return err;
 
-	tsk = kthread_run(__wait_fence_chains, &fc, "dmabuf/wait");
+	tsk = kthread_run(__wait_fence_chains, fc.tail, "dmabuf/wait");
 	if (IS_ERR(tsk)) {
 		err = PTR_ERR(tsk);
 		goto err;
@@ -666,7 +666,7 @@ static int wait_random(void *arg)
 
 	randomise_fences(&fc);
 
-	tsk = kthread_run(__wait_fence_chains, &fc, "dmabuf/wait");
+	tsk = kthread_run(__wait_fence_chains, fc.tail, "dmabuf/wait");
 	if (IS_ERR(tsk)) {
 		err = PTR_ERR(tsk);
 		goto err;
-- 
2.50.1

