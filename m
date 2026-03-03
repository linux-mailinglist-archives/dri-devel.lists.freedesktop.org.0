Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIUSAX3jpmnpYgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 14:34:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECF11F0591
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 14:34:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C84E410E7FB;
	Tue,  3 Mar 2026 13:34:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OBPiYohH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62B8210E10B;
 Tue,  3 Mar 2026 13:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772544887; x=1804080887;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YYM77PWEsZvPf9BMtWUsHxAlnv4gCoCbFenb5zHX8Es=;
 b=OBPiYohHhHLd3KgjEQmY3wQj73A+ZQu16PKyhyqnzhKGXAxRRs8TVyg7
 ojbKJaygc6zQaYohGSApK9G1uehR2LYZiFTp/OTKBYKfe6pdZIoJIkcc9
 Uu2hJweIoiu9uAmOVKKHb12SHdtYDEQdNg1xZwSdArjXw2XcUdZrBjTkL
 sa/jRrOaDLzmxX3YBLQmb8b7n9SDhDk3W2obti1Wu+L5K1hxPnvNjFIyV
 qK1IS4Cc39XoKHLN5QqGuDdn9wtEkUVr1buSGn2sgtoxAZyvOKYqrUmiJ
 1mqf6GjA9PzKff/u6xik6fI/v+slZG590JZBLoPXid3j+NV/ovKumboCZ Q==;
X-CSE-ConnectionGUID: aJ7QqZyzSkuRs8s1ImNMBA==
X-CSE-MsgGUID: pgaW2nqZRQ2F/3mBhF3SYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="76179730"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="76179730"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 05:34:46 -0800
X-CSE-ConnectionGUID: 74z5+D3oTEKuhONNOtvVIA==
X-CSE-MsgGUID: i5vZ0K2jRViYn8lB0SnNTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="217947917"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.244.243])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 05:34:43 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Andrew Morton <akpm@linux-foundation.org>,
 Simona Vetter <simona.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>,
 Alistair Popple <apopple@nvidia.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH v3 1/4] mm/mmu_notifier: Allow two-pass struct
 mmu_interval_notifiers
Date: Tue,  3 Mar 2026 14:34:06 +0100
Message-ID: <20260303133409.11609-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303133409.11609-1-thomas.hellstrom@linux.intel.com>
References: <20260303133409.11609-1-thomas.hellstrom@linux.intel.com>
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
X-Rspamd-Queue-Id: 0ECF11F0591
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.39 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,ziepe.ca,linux-foundation.org,ffwll.ch,gmail.com,nvidia.com,lists.freedesktop.org,kvack.org,vger.kernel.org,intel.com,amd.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DMARC_DNSFAIL(0.00)[intel.com : server fail];
	FROM_NEQ_ENVFROM(0.00)[thomas.hellstrom@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[intel.com:?];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	R_DKIM_TEMPFAIL(0.00)[intel.com:s=Intel];
	NEURAL_SPAM(0.00)[0.997];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,ziepe.ca:email,linux-foundation.org:email,intel.com:email]
X-Rspamd-Action: no action

GPU use-cases for mmu_interval_notifiers with hmm often involve
starting a gpu operation and then waiting for it to complete.
These operations are typically context preemption or TLB flushing.

With single-pass notifiers per GPU this doesn't scale in
multi-gpu scenarios. In those scenarios we'd want to first start
preemption- or TLB flushing on all GPUs and as a second pass wait
for them to complete.

One can do this on per-driver basis multiplexing per-driver
notifiers but that would mean sharing the notifier "user" lock
across all GPUs and that doesn't scale well either, so adding support
for multi-pass in the core appears to be the right choice.

Implement two-pass capability in the mmu_interval_notifier. Use a
linked list for the final passes to minimize the impact for
use-cases that don't need the multi-pass functionality by avoiding
a second interval tree walk, and to be able to easily pass data
between the two passes.

v1:
- Restrict to two passes (Jason Gunthorpe)
- Improve on documentation (Jason Gunthorpe)
- Improve on function naming (Alistair Popple)
v2:
- Include the invalidate_finish() callback in the
  struct mmu_interval_notifier_ops.
- Update documentation (GitHub Copilot:claude-sonnet-4.6)
- Use lockless list for list management.
v3:
- Update kerneldoc for the struct mmu_interval_notifier_finish::list member
  (Matthew Brost)
- Add a WARN_ON_ONCE() checking for NULL invalidate_finish() op if
  if invalidate_start() is non-NULL. (Matthew Brost)

Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Dave Airlie <airlied@gmail.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: <dri-devel@lists.freedesktop.org>
Cc: <linux-mm@kvack.org>
Cc: <linux-kernel@vger.kernel.org>

Assisted-by: GitHub Copilot:claude-sonnet-4.6 # Documentation only.
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 include/linux/mmu_notifier.h | 38 +++++++++++++++++++++
 mm/mmu_notifier.c            | 65 +++++++++++++++++++++++++++++++-----
 2 files changed, 94 insertions(+), 9 deletions(-)

diff --git a/include/linux/mmu_notifier.h b/include/linux/mmu_notifier.h
index 07a2bbaf86e9..37b683163235 100644
--- a/include/linux/mmu_notifier.h
+++ b/include/linux/mmu_notifier.h
@@ -233,16 +233,54 @@ struct mmu_notifier {
 	unsigned int users;
 };
 
+/**
+ * struct mmu_interval_notifier_finish - mmu_interval_notifier two-pass abstraction
+ * @link: Lockless list link for the notifiers pending pass list
+ * @notifier: The mmu_interval_notifier for which the finish pass is called.
+ *
+ * Allocate, typically using GFP_NOWAIT in the interval notifier's first pass.
+ * If allocation fails (which is not unlikely under memory pressure), fall back
+ * to single-pass operation. Note that with a large number of notifiers
+ * implementing two passes, allocation with GFP_NOWAIT will become increasingly
+ * likely to fail, so consider implementing a small pool instead of using
+ * kmalloc() allocations.
+ *
+ * If the implementation needs to pass data between the two passes,
+ * the recommended way is to embed struct mmu_interval_notifier_finish into a larger
+ * structure that also contains the data needed to be shared. Keep in mind that
+ * a notifier callback can be invoked in parallel, and each invocation needs its
+ * own struct mmu_interval_notifier_finish.
+ */
+struct mmu_interval_notifier_finish {
+	struct llist_node link;
+	struct mmu_interval_notifier *notifier;
+};
+
 /**
  * struct mmu_interval_notifier_ops
  * @invalidate: Upon return the caller must stop using any SPTEs within this
  *              range. This function can sleep. Return false only if sleeping
  *              was required but mmu_notifier_range_blockable(range) is false.
+ * @invalidate_start: Similar to @invalidate, but intended for two-pass notifier
+ *                    callbacks where the call to @invalidate_start is the first
+ *                    pass and any struct mmu_interval_notifier_finish pointer
+ *                    returned in the @finish parameter describes the final pass.
+ *                    If @finish is %NULL on return, then no final pass will be
+ *                    called.
+ * @invalidate_finish: Called as the second pass for any notifier that returned
+ *                     a non-NULL @finish from @invalidate_start. The @finish
+ *                     pointer passed here is the same one returned by
+ *                     @invalidate_start.
  */
 struct mmu_interval_notifier_ops {
 	bool (*invalidate)(struct mmu_interval_notifier *interval_sub,
 			   const struct mmu_notifier_range *range,
 			   unsigned long cur_seq);
+	bool (*invalidate_start)(struct mmu_interval_notifier *interval_sub,
+				 const struct mmu_notifier_range *range,
+				 unsigned long cur_seq,
+				 struct mmu_interval_notifier_finish **finish);
+	void (*invalidate_finish)(struct mmu_interval_notifier_finish *finish);
 };
 
 struct mmu_interval_notifier {
diff --git a/mm/mmu_notifier.c b/mm/mmu_notifier.c
index a6cdf3674bdc..4d8a64ce8eda 100644
--- a/mm/mmu_notifier.c
+++ b/mm/mmu_notifier.c
@@ -260,6 +260,15 @@ mmu_interval_read_begin(struct mmu_interval_notifier *interval_sub)
 }
 EXPORT_SYMBOL_GPL(mmu_interval_read_begin);
 
+static void mn_itree_finish_pass(struct llist_head *finish_passes)
+{
+	struct llist_node *first = llist_reverse_order(__llist_del_all(finish_passes));
+	struct mmu_interval_notifier_finish *f, *next;
+
+	llist_for_each_entry_safe(f, next, first, link)
+		f->notifier->ops->invalidate_finish(f);
+}
+
 static void mn_itree_release(struct mmu_notifier_subscriptions *subscriptions,
 			     struct mm_struct *mm)
 {
@@ -271,6 +280,7 @@ static void mn_itree_release(struct mmu_notifier_subscriptions *subscriptions,
 		.end = ULONG_MAX,
 	};
 	struct mmu_interval_notifier *interval_sub;
+	LLIST_HEAD(finish_passes);
 	unsigned long cur_seq;
 	bool ret;
 
@@ -278,11 +288,27 @@ static void mn_itree_release(struct mmu_notifier_subscriptions *subscriptions,
 		     mn_itree_inv_start_range(subscriptions, &range, &cur_seq);
 	     interval_sub;
 	     interval_sub = mn_itree_inv_next(interval_sub, &range)) {
-		ret = interval_sub->ops->invalidate(interval_sub, &range,
-						    cur_seq);
+		if (interval_sub->ops->invalidate_start) {
+			struct mmu_interval_notifier_finish *finish = NULL;
+
+			ret = interval_sub->ops->invalidate_start(interval_sub,
+								  &range,
+								  cur_seq,
+								  &finish);
+			if (ret && finish) {
+				finish->notifier = interval_sub;
+				__llist_add(&finish->link, &finish_passes);
+			}
+
+		} else {
+			ret = interval_sub->ops->invalidate(interval_sub,
+							    &range,
+							    cur_seq);
+		}
 		WARN_ON(!ret);
 	}
 
+	mn_itree_finish_pass(&finish_passes);
 	mn_itree_inv_end(subscriptions);
 }
 
@@ -430,7 +456,9 @@ static int mn_itree_invalidate(struct mmu_notifier_subscriptions *subscriptions,
 			       const struct mmu_notifier_range *range)
 {
 	struct mmu_interval_notifier *interval_sub;
+	LLIST_HEAD(finish_passes);
 	unsigned long cur_seq;
+	int err = 0;
 
 	for (interval_sub =
 		     mn_itree_inv_start_range(subscriptions, range, &cur_seq);
@@ -438,23 +466,41 @@ static int mn_itree_invalidate(struct mmu_notifier_subscriptions *subscriptions,
 	     interval_sub = mn_itree_inv_next(interval_sub, range)) {
 		bool ret;
 
-		ret = interval_sub->ops->invalidate(interval_sub, range,
-						    cur_seq);
+		if (interval_sub->ops->invalidate_start) {
+			struct mmu_interval_notifier_finish *finish = NULL;
+
+			ret = interval_sub->ops->invalidate_start(interval_sub,
+								  range,
+								  cur_seq,
+								  &finish);
+			if (ret && finish) {
+				finish->notifier = interval_sub;
+				__llist_add(&finish->link, &finish_passes);
+			}
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
+	mn_itree_finish_pass(&finish_passes);
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
@@ -976,6 +1022,7 @@ int mmu_interval_notifier_insert(struct mmu_interval_notifier *interval_sub,
 	struct mmu_notifier_subscriptions *subscriptions;
 	int ret;
 
+	WARN_ON_ONCE(ops->invalidate_start && !ops->invalidate_finish);
 	might_lock(&mm->mmap_lock);
 
 	subscriptions = smp_load_acquire(&mm->notifier_subscriptions);
-- 
2.53.0

