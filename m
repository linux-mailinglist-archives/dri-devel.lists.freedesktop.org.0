Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E3F209E82
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jun 2020 14:35:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ED566E120;
	Thu, 25 Jun 2020 12:34:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44E4C6E120;
 Thu, 25 Jun 2020 12:34:54 +0000 (UTC)
IronPort-SDR: /9USE24iQMDjI3jS9g6iu/EFwTFFyXMRZjQKh4bt8RtVhE61srOZTavu6ZhO9y/emakAbtBeCK
 RBmyzRVJgAdA==
X-IronPort-AV: E=McAfee;i="6000,8403,9662"; a="125113127"
X-IronPort-AV: E=Sophos;i="5.75,279,1589266800"; d="scan'208";a="125113127"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2020 05:34:53 -0700
IronPort-SDR: oMGGq2F8l+bsvKImEyOkV+f8usbKZnt97wqgRyxTEulZ5a3X8MfGQbgPAH6vuGdw+fTCE2SsKM
 /hVS5Rbd2CDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,279,1589266800"; d="scan'208";a="263910504"
Received: from schiml-mobl3.ger.corp.intel.com (HELO delly.ger.corp.intel.com)
 ([10.249.41.48])
 by fmsmga007.fm.intel.com with ESMTP; 25 Jun 2020 05:34:52 -0700
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] Revert "dma-buf: Report signaled links inside
 dma-fence-chain"
Date: Thu, 25 Jun 2020 15:34:42 +0300
Message-Id: <20200625123443.19680-1-lionel.g.landwerlin@intel.com>
X-Mailer: git-send-email 2.27.0
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

This reverts commit 5de376bb434f80a13138f0ebedc8351ab73d8b0d.

This change breaks synchronization of a timeline.
dma_fence_chain_find_seqno() might be a bit of a confusing name but
this function is not trying to find a particular seqno, is supposed to
give a fence to wait on for a particular point in the timeline.

In a timeline, a particular value is reached when all the points up to
and including that value have signaled.

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 drivers/dma-buf/dma-fence-chain.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
index c435bbba851c..3d123502ff12 100644
--- a/drivers/dma-buf/dma-fence-chain.c
+++ b/drivers/dma-buf/dma-fence-chain.c
@@ -99,12 +99,6 @@ int dma_fence_chain_find_seqno(struct dma_fence **pfence, uint64_t seqno)
 		return -EINVAL;
 
 	dma_fence_chain_for_each(*pfence, &chain->base) {
-		if ((*pfence)->seqno < seqno) { /* already signaled */
-			dma_fence_put(*pfence);
-			*pfence = NULL;
-			break;
-		}
-
 		if ((*pfence)->context != chain->base.context ||
 		    to_dma_fence_chain(*pfence)->prev_seqno < seqno)
 			break;
@@ -228,7 +222,6 @@ EXPORT_SYMBOL(dma_fence_chain_ops);
  * @chain: the chain node to initialize
  * @prev: the previous fence
  * @fence: the current fence
- * @seqno: the sequence number (syncpt) of the fence within the chain
  *
  * Initialize a new chain node and either start a new chain or add the node to
  * the existing chain of the previous fence.
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
