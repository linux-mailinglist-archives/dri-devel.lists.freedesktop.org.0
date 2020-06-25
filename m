Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75667209E84
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jun 2020 14:35:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A68B96E2B1;
	Thu, 25 Jun 2020 12:34:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6F596E266;
 Thu, 25 Jun 2020 12:34:55 +0000 (UTC)
IronPort-SDR: BPEGOhKKJpVHkUvnyiGxYMolel1mybPyqksJIWCIVj4Z9lRUXOFwhPX4rEB3A63Ep2R19hYugu
 c2kuFhV3AN0w==
X-IronPort-AV: E=McAfee;i="6000,8403,9662"; a="125113132"
X-IronPort-AV: E=Sophos;i="5.75,279,1589266800"; d="scan'208";a="125113132"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2020 05:34:55 -0700
IronPort-SDR: +emTzLy1OAYQ1P3sTkuHF3rIYpwELka+LbDef6hs9Uw8frxsLaa6fn3/lR/5XRKwqxnvDKd3yo
 at3+44AOdvaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,279,1589266800"; d="scan'208";a="263910511"
Received: from schiml-mobl3.ger.corp.intel.com (HELO delly.ger.corp.intel.com)
 ([10.249.41.48])
 by fmsmga007.fm.intel.com with ESMTP; 25 Jun 2020 05:34:54 -0700
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] dma-buf: fix dma-fence-chain out of order test
Date: Thu, 25 Jun 2020 15:34:43 +0300
Message-Id: <20200625123443.19680-2-lionel.g.landwerlin@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200625123443.19680-1-lionel.g.landwerlin@intel.com>
References: <20200625123443.19680-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
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
Cc: intel-gfx@lists.freedesktop.org, christian.koenig@amd.com,
 chris@chris-wilson.co.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There was probably a misunderstand on how the dma-fence-chain is
supposed to work or what dma_fence_chain_find_seqno() is supposed to
return.

dma_fence_chain_find_seqno() is here to give us the fence to wait upon
for a particular point in the timeline. The timeline progresses only
when all the points prior to a given number have completed.

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Fixes: dc2f7e67a28a5c ("dma-buf: Exercise dma-fence-chain under selftests")
---
 drivers/dma-buf/st-dma-fence-chain.c | 43 ++++++++++++++--------------
 1 file changed, 21 insertions(+), 22 deletions(-)

diff --git a/drivers/dma-buf/st-dma-fence-chain.c b/drivers/dma-buf/st-dma-fence-chain.c
index 5d45ba7ba3cd..9525f7f56119 100644
--- a/drivers/dma-buf/st-dma-fence-chain.c
+++ b/drivers/dma-buf/st-dma-fence-chain.c
@@ -318,15 +318,16 @@ static int find_out_of_order(void *arg)
 		goto err;
 	}
 
-	if (fence && fence != fc.chains[1]) {
+	/*
+	 * We signaled the middle fence (2) of the 1-2-3 chain. The behavior
+	 * of the dma-fence-chain is to make us wait for all the fences up to
+	 * the point we want. Since fence 1 is still not signaled, this what
+	 * we should get as fence to wait upon (fence 2 being garbage
+	 * collected during the traversal of the chain).
+	 */
+	if (fence != fc.chains[0]) {
 		pr_err("Incorrect chain-fence.seqno:%lld reported for completed seqno:2\n",
-		       fence->seqno);
-
-		dma_fence_get(fence);
-		err = dma_fence_chain_find_seqno(&fence, 2);
-		dma_fence_put(fence);
-		if (err)
-			pr_err("Reported %d for finding self!\n", err);
+		       fence ? fence->seqno : 0);
 
 		err = -EINVAL;
 	}
@@ -415,20 +416,18 @@ static int __find_race(void *arg)
 		if (!fence)
 			goto signal;
 
-		err = dma_fence_chain_find_seqno(&fence, seqno);
-		if (err) {
-			pr_err("Reported an invalid fence for find-self:%d\n",
-			       seqno);
-			dma_fence_put(fence);
-			break;
-		}
-
-		if (fence->seqno < seqno) {
-			pr_err("Reported an earlier fence.seqno:%lld for seqno:%d\n",
-			       fence->seqno, seqno);
-			err = -EINVAL;
-			dma_fence_put(fence);
-			break;
+		/*
+		 * We can only find ourselves if we are on fence we were
+		 * looking for.
+		 */
+		if (fence->seqno == seqno) {
+			err = dma_fence_chain_find_seqno(&fence, seqno);
+			if (err) {
+				pr_err("Reported an invalid fence for find-self:%d\n",
+				       seqno);
+				dma_fence_put(fence);
+				break;
+			}
 		}
 
 		dma_fence_put(fence);
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
