Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB437BFF131
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 06:08:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BF2310E877;
	Thu, 23 Oct 2025 04:08:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="alLeHITu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4B6410E865;
 Thu, 23 Oct 2025 04:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761192486; x=1792728486;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Om4/3PkWm7JgZOXFAdBj3q1v/3+ns3ZZZaKOiDYjAaw=;
 b=alLeHITuBy9LEmM76ohLNshl4kbIQf2MClyFn+YzQbVvD4cjsJLffT+S
 FFgLojUyS+qi5hkzOti+qGyBfx21d8bw4S0UYEvHO16+FUCd2IAX9UjVs
 Kwm5bKIymRdmzLT2ECfG5eWDSwHjLQbhxHpkwKSemYjjeraG7VfsIIehO
 pzGkEXcWmyvjSfIF3/6v2rIX4e78NwgCG60cE10mf13MvbCPvebmZjYY5
 OJKQBaOOy8KrZWPPC9IwbEZaqXrMkXeY9UawgjeWFllmNppXtp41PD2ab
 NJUbH+KpQxV71DnMgplmo9e/inkfyAYxhk2bcTiqKnvLX46dgSZiKcS1z A==;
X-CSE-ConnectionGUID: mCdJ0YO/SXeTGqS+R408IA==
X-CSE-MsgGUID: 1GYZddyJR26eQ0k5EtD2kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63391284"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="63391284"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 21:08:05 -0700
X-CSE-ConnectionGUID: paWckcCMRkme+Hb8LRbWyg==
X-CSE-MsgGUID: g2fCELBGTF6dXnPFlRtW2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="189175755"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 21:08:05 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: christian.koenig@amd.com
Subject: [RFC PATCH 07/14] dma-buf: use inline lock for the dma-fence-array
Date: Wed, 22 Oct 2025 21:07:53 -0700
Message-Id: <20251023040800.970283-8-matthew.brost@intel.com>
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

Just as proof of concept and minor cleanup.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence-array.c | 5 ++---
 include/linux/dma-fence-array.h   | 1 -
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index 6657d4b30af9..c2119a8049fe 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -204,9 +204,8 @@ void dma_fence_array_init(struct dma_fence_array *array,
 
 	array->num_fences = num_fences;
 
-	spin_lock_init(&array->lock);
-	dma_fence_init(&array->base, &dma_fence_array_ops, &array->lock,
-		       context, seqno);
+	dma_fence_init(&array->base, &dma_fence_array_ops, NULL, context,
+		       seqno);
 	init_irq_work(&array->work, irq_dma_fence_array_work);
 
 	atomic_set(&array->num_pending, signal_on_any ? 1 : num_fences);
diff --git a/include/linux/dma-fence-array.h b/include/linux/dma-fence-array.h
index 079b3dec0a16..370b3d2bba37 100644
--- a/include/linux/dma-fence-array.h
+++ b/include/linux/dma-fence-array.h
@@ -38,7 +38,6 @@ struct dma_fence_array_cb {
 struct dma_fence_array {
 	struct dma_fence base;
 
-	spinlock_t lock;
 	unsigned num_fences;
 	atomic_t num_pending;
 	struct dma_fence **fences;
-- 
2.34.1

