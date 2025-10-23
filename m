Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD017BFF121
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 06:08:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35FD510E862;
	Thu, 23 Oct 2025 04:08:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="adzwMEUZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3895210E863;
 Thu, 23 Oct 2025 04:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761192486; x=1792728486;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k6gZmzZ88p2BOCA1aiTVo/nz/gFj7de9c5S/JVNhRYM=;
 b=adzwMEUZtjbUYCCJ8cQ29upFL9gBiN4fQDjIt//740E0TEj3pAzfzx0Z
 xsYlSF0VFnrWR2DRfQH8fmHSdufPOT8GBIecJF39yBnPn69+PcIvpydZy
 csVLqKyOvCXypjV2Nx3gqRoAH3l43ic9pTNbmAX9BLzR2MozXB1Qf9pPr
 1UTtdcakbsWMQ96Wd33OVnZOyXU7Bm2XJIjeRPdtLpPbm47PoQuYqfy4P
 4Wlb4uPDVdAEgYnrH/UNrKmyXQ+1YB3atW7+DzGaqYcGrhRfT1jOse1Y7
 1z2Yq/EbjOtjWXNPK78+WSCyoH5ShNsjSo4sCRplLl37dgiHhsISHI8J8 Q==;
X-CSE-ConnectionGUID: ncqffmGVQYupgdG05NZ65Q==
X-CSE-MsgGUID: MZj6V3bWTTCourRoDeFobQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63391278"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="63391278"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 21:08:05 -0700
X-CSE-ConnectionGUID: IcBdpNlbRkeYWREFS5crGQ==
X-CSE-MsgGUID: S30+OM+QRsu+pfxFENVoWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="189175749"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 21:08:04 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: christian.koenig@amd.com
Subject: [RFC PATCH 01/14] dma-buf: cleanup dma_fence_describe
Date: Wed, 22 Oct 2025 21:07:47 -0700
Message-Id: <20251023040800.970283-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251023040800.970283-1-matthew.brost@intel.com>
References: <20251023040800.970283-1-matthew.brost@intel.com>
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

From: Christian König <ckoenig.leichtzumerken@gmail.com>

The driver and timeline name are meaningless for signaled fences.

Drop them and also print the context number.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 3f78c56b58dc..f0539c73ed57 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -1001,17 +1001,18 @@ void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq)
 {
 	const char __rcu *timeline;
 	const char __rcu *driver;
+	const char *signaled = "un";
 
 	rcu_read_lock();
 
 	timeline = dma_fence_timeline_name(fence);
 	driver = dma_fence_driver_name(fence);
 
-	seq_printf(seq, "%s %s seq %llu %ssignalled\n",
-		   rcu_dereference(driver),
-		   rcu_dereference(timeline),
-		   fence->seqno,
-		   dma_fence_is_signaled(fence) ? "" : "un");
+	if (dma_fence_is_signaled(fence))
+		timeline = driver = signaled = "";
+
+	seq_printf(seq, "%llu %s %s seq %llu %ssignalled\n", fence->context,
+		   timeline, driver, fence->seqno, signaled);
 
 	rcu_read_unlock();
 }
-- 
2.34.1

