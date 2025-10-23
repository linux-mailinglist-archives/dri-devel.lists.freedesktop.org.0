Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 179CDBFF11B
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 06:08:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19D5F10E864;
	Thu, 23 Oct 2025 04:08:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RrWC5uW4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C9C410E862;
 Thu, 23 Oct 2025 04:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761192486; x=1792728486;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D++GO/BX+vFgibBXj+3ucr6Aet5GAdUe4s8NnGcvdTE=;
 b=RrWC5uW4wNCLAMYFR7uErpooTQxi8Dv+I4WMcXsmuk8X/+ZRH6T2Mxa7
 pMhgWHw4excu39WBmbNWknT+GX/01Ryoo0yRU/9kVVULplqpEJRVWqX13
 KeYmWz5HeXoRb2K/GvvMiXIZmEFfaQ6pMs+OpZ6pOqvLmCgUI/cEmkRo/
 GEl7IJ5IDVJdpZHNX70nd35TZo/9171UJ+lPQ0xkIWiaL3l51dLKkQpLw
 5IlAz2jaSWHO0/NG9LyKZHuDM3socqRC6n5YvNQvI8EP/b8qN/WVQy9wR
 9pL2jcCBnypzD6O+W0pkpAPlQRzGRVEfJSiqbIgszW3iJ6/CWidWAoWA8 g==;
X-CSE-ConnectionGUID: xp9NJstLT6mQ071/wvSWXw==
X-CSE-MsgGUID: GLtIfIRwRM+Bo9H/1qMKMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63391279"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="63391279"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 21:08:05 -0700
X-CSE-ConnectionGUID: 3orl4rl8QQWESh8tSf+VTA==
X-CSE-MsgGUID: QjBQWFftRUeyi5SV8tUEXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="189175750"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 21:08:05 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: christian.koenig@amd.com
Subject: [RFC PATCH 02/14] dma-buf: rework stub fence initialisation
Date: Wed, 22 Oct 2025 21:07:48 -0700
Message-Id: <20251023040800.970283-3-matthew.brost@intel.com>
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

Instead of doing this on the first call of the function just initialize
the stub fence during kernel load.

This has the clear advantage of lower overhead and also doesn't rely on
the ops to not be NULL any more.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/dma-buf/dma-fence.c | 32 +++++++++++++++-----------------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index f0539c73ed57..51ee13d005bc 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -121,29 +121,27 @@ static const struct dma_fence_ops dma_fence_stub_ops = {
 	.get_timeline_name = dma_fence_stub_get_name,
 };
 
+static int __init dma_fence_init_stub(void)
+{
+	dma_fence_init(&dma_fence_stub, &dma_fence_stub_ops,
+		       &dma_fence_stub_lock, 0, 0);
+
+	set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
+		&dma_fence_stub.flags);
+
+	dma_fence_signal_locked(&dma_fence_stub);
+	return 0;
+}
+subsys_initcall(dma_fence_init_stub);
+
 /**
  * dma_fence_get_stub - return a signaled fence
  *
- * Return a stub fence which is already signaled. The fence's
- * timestamp corresponds to the first time after boot this
- * function is called.
+ * Return a stub fence which is already signaled. The fence's timestamp
+ * corresponds to the initialisation time of the linux kernel.
  */
 struct dma_fence *dma_fence_get_stub(void)
 {
-	spin_lock(&dma_fence_stub_lock);
-	if (!dma_fence_stub.ops) {
-		dma_fence_init(&dma_fence_stub,
-			       &dma_fence_stub_ops,
-			       &dma_fence_stub_lock,
-			       0, 0);
-
-		set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
-			&dma_fence_stub.flags);
-
-		dma_fence_signal_locked(&dma_fence_stub);
-	}
-	spin_unlock(&dma_fence_stub_lock);
-
 	return dma_fence_get(&dma_fence_stub);
 }
 EXPORT_SYMBOL(dma_fence_get_stub);
-- 
2.34.1

