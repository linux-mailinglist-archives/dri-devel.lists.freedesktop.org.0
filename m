Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E19D3B1F4CE
	for <lists+dri-devel@lfdr.de>; Sat,  9 Aug 2025 15:52:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85C5010E1E0;
	Sat,  9 Aug 2025 13:52:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gQKo7GDR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 317B510E1E0;
 Sat,  9 Aug 2025 13:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754747534; x=1786283534;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I0S46TL3ZGNQAM5NlfugwXaH73kKnXUT2H7X0Wkzjqo=;
 b=gQKo7GDRXdva3SdexVUMK4W43rfXtimtLTlFaq2TEEwImWAA0bS1n2vq
 eJSj3T8A/MVxC953uDhIQeQXpaO3hUhEBg4JC2LAI1yzOUAx/z8xZHVEG
 EnCGBD5dNCHiK+XKgUtGdNLPWFCO38lwTB3hRqQc71QIxch86D2qcFk+5
 w1Bfj98IiPTJfnVEkaLg8vSThGja9n7VrJCLY7zgEGz50IHdO6fOPsLqs
 Ew6kqUQ469uLb4lsvEmP1meFoguwmoSj6ipw460ipTIxGrmVpE7rumjtd
 KIUB7y7AbtMD66rJI0tz9eav/yiN73OWXTJNNmV9DPCaCjNvLGDpMRTRm Q==;
X-CSE-ConnectionGUID: QOtlvxvaRI2/bK5u8cqYDg==
X-CSE-MsgGUID: fnxLEy1KRoaDJeCJPcnMZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="68153545"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="68153545"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2025 06:52:14 -0700
X-CSE-ConnectionGUID: q0EFfHMxTtm9eDHUSNIpJA==
X-CSE-MsgGUID: Qrzeux62Rea+AK85jOp5yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="165903744"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.244.28])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2025 06:52:11 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Andrew Morton <akpm@linux-foundation.org>,
 Simona Vetter <simona.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [RFC PATCH 1/6] mm/mmu_notifier: Allow multiple struct
 mmu_interval_notifier passes
Date: Sat,  9 Aug 2025 15:51:32 +0200
Message-ID: <20250809135137.259427-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250809135137.259427-1-thomas.hellstrom@linux.intel.com>
References: <20250809135137.259427-1-thomas.hellstrom@linux.intel.com>
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

GPU use-cases for mmu_interval_notifiers with hmm often involve
starting a gpu operation and then waiting for it to complete.
These operations are typically context preemption or TLB flushing.

With single-pass notifiers per GPU this doesn't scale in
multi-gpu scenarios. In those scenarios we'd want to first start
preemption- or TLB flushing on all GPUs and as a second pass wait
for them to complete on all gpus.

One can do this on per-driver basis multiplexing per-driver
notifiers but that would mean sharing the notifier "user" lock
across all GPUs and that doesn't scale well either, so adding support
for multi-pass in the core appears like the right choice.

Implement multi-pass capability in the mmu_interval_notifier. Use a
linked list for the additional passes to minimize the impact for
use-cases that don't need the multi-pass functionality.

Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Dave Airlie <airlied@gmail.com>
Cc: <dri-devel@lists.freedesktop.org>
Cc: <linux-mm@kvack.org>
Cc: <linux-kernel@vger.kernel.org>

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 include/linux/mmu_notifier.h | 30 ++++++++++++++++
 mm/mmu_notifier.c            | 67 +++++++++++++++++++++++++++++++-----
 2 files changed, 88 insertions(+), 9 deletions(-)

diff --git a/include/linux/mmu_notifier.h b/include/linux/mmu_notifier.h
index d1094c2d5fb6..1107a8eafd8a 100644
--- a/include/linux/mmu_notifier.h
+++ b/include/linux/mmu_notifier.h
@@ -233,6 +233,32 @@ struct mmu_notifier {
 	unsigned int users;
 };
 
+/**
+ * struct mmu_interval_notifier_pass - mmu_interval_notifier multi-pass abstraction
+ * @link: List link for the notifiers pending pass list
+ *
+ * Allocate, typically using GFP_NOWAIT in the interval notifier's first pass.
+ * If allocation fails (which is not unlikely under memory pressure), fall back
+ * to single-pass operation.
+ */
+struct mmu_interval_notifier_pass {
+	struct list_head link;
+	/**
+	 * @pass: Driver callback for additionall pass.
+	 * @additional_pass: Pointer to the mmu_interval_notifier_pass structure.
+	 * @range: The mmu_notifier_range.
+	 * @cur_seq: The current sequence set by the first pass.
+	 *
+	 * Return: Either a pointer to a valid mmu_interval_notifier_pass for
+	 * another pass to be called, or %NULL if processing is complete for this
+	 * notifier. There is no error reporting mechanism for additional passes.
+	 */
+	struct mmu_interval_notifier_pass *
+	(*pass) (struct mmu_interval_notifier_pass *additional_pass,
+		 const struct mmu_notifier_range *range,
+		 unsigned long cur_seq);
+};
+
 /**
  * struct mmu_interval_notifier_ops
  * @invalidate: Upon return the caller must stop using any SPTEs within this
@@ -243,6 +269,10 @@ struct mmu_interval_notifier_ops {
 	bool (*invalidate)(struct mmu_interval_notifier *interval_sub,
 			   const struct mmu_notifier_range *range,
 			   unsigned long cur_seq);
+	bool (*invalidate_multipass)(struct mmu_interval_notifier *interval_sub,
+				     const struct mmu_notifier_range *range,
+				     unsigned long cur_seq,
+				     struct mmu_interval_notifier_pass **pass);
 };
 
 struct mmu_interval_notifier {
diff --git a/mm/mmu_notifier.c b/mm/mmu_notifier.c
index 8e0125dc0522..dd6af87db103 100644
--- a/mm/mmu_notifier.c
+++ b/mm/mmu_notifier.c
@@ -260,6 +260,22 @@ mmu_interval_read_begin(struct mmu_interval_notifier *interval_sub)
 }
 EXPORT_SYMBOL_GPL(mmu_interval_read_begin);
 
+static void mn_itree_additional_passes(struct list_head *additional_passes,
+				       const struct mmu_notifier_range *range,
+				       unsigned long cur_seq)
+{
+	struct mmu_interval_notifier_pass *p, *next;
+
+	while (!list_empty(additional_passes)) {
+		list_for_each_entry_safe(p, next, additional_passes, link) {
+			list_del_init(&p->link);
+			p = p->pass(p, range, cur_seq);
+			if (p)
+				list_add_tail(&p->link, additional_passes);
+		}
+	}
+}
+
 static void mn_itree_release(struct mmu_notifier_subscriptions *subscriptions,
 			     struct mm_struct *mm)
 {
@@ -272,17 +288,32 @@ static void mn_itree_release(struct mmu_notifier_subscriptions *subscriptions,
 	};
 	struct mmu_interval_notifier *interval_sub;
 	unsigned long cur_seq;
+	LIST_HEAD(additional_passes);
 	bool ret;
 
 	for (interval_sub =
 		     mn_itree_inv_start_range(subscriptions, &range, &cur_seq);
 	     interval_sub;
 	     interval_sub = mn_itree_inv_next(interval_sub, &range)) {
-		ret = interval_sub->ops->invalidate(interval_sub, &range,
-						    cur_seq);
+		if (interval_sub->ops->invalidate_multipass) {
+			struct mmu_interval_notifier_pass *second = NULL;
+
+			ret = interval_sub->ops->invalidate_multipass(interval_sub,
+								      &range,
+								      cur_seq,
+								      &second);
+			if (ret && second)
+				list_add_tail(&second->link, &additional_passes);
+
+		} else {
+			ret = interval_sub->ops->invalidate(interval_sub,
+							    &range,
+							    cur_seq);
+		}
 		WARN_ON(!ret);
 	}
 
+	mn_itree_additional_passes(&additional_passes, &range, cur_seq);
 	mn_itree_inv_end(subscriptions);
 }
 
@@ -431,6 +462,8 @@ static int mn_itree_invalidate(struct mmu_notifier_subscriptions *subscriptions,
 {
 	struct mmu_interval_notifier *interval_sub;
 	unsigned long cur_seq;
+	LIST_HEAD(additional_passes);
+	int err = 0;
 
 	for (interval_sub =
 		     mn_itree_inv_start_range(subscriptions, range, &cur_seq);
@@ -438,23 +471,39 @@ static int mn_itree_invalidate(struct mmu_notifier_subscriptions *subscriptions,
 	     interval_sub = mn_itree_inv_next(interval_sub, range)) {
 		bool ret;
 
-		ret = interval_sub->ops->invalidate(interval_sub, range,
-						    cur_seq);
+		if (interval_sub->ops->invalidate_multipass) {
+			struct mmu_interval_notifier_pass *second = NULL;
+
+			ret = interval_sub->ops->invalidate_multipass(interval_sub,
+								      range,
+								      cur_seq,
+								      &second);
+			if (ret && second)
+				list_add_tail(&second->link, &additional_passes);
+
+		} else {
+			ret = interval_sub->ops->invalidate(interval_sub,
+							    range,
+							    cur_seq);
+		}
 		if (!ret) {
 			if (WARN_ON(mmu_notifier_range_blockable(range)))
 				continue;
-			goto out_would_block;
+			err = -EAGAIN;
+			break;
 		}
 	}
-	return 0;
 
-out_would_block:
+	mn_itree_additional_passes(&additional_passes, range, cur_seq);
+
 	/*
 	 * On -EAGAIN the non-blocking caller is not allowed to call
 	 * invalidate_range_end()
 	 */
-	mn_itree_inv_end(subscriptions);
-	return -EAGAIN;
+	if (err)
+		mn_itree_inv_end(subscriptions);
+
+	return err;
 }
 
 static int mn_hlist_invalidate_range_start(
-- 
2.50.1

