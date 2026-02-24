Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHPzAWbwnWkHSwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 19:39:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D7B18B824
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 19:39:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 316A110E613;
	Tue, 24 Feb 2026 18:39:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VlcBY8ZA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44C6A10E610;
 Tue, 24 Feb 2026 18:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771958367; x=1803494367;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iiCG/Tw7CVO4CxDBafjb0vOz/+PDhdQUXcWeG81Ugew=;
 b=VlcBY8ZAeVN/VncZQcSnDX28Pybv4qkpLx7KFso0xRg/fDhlr3wsh/KZ
 agTR79mfCHmFKZzP9FdYgtTY5vZOl8qb8pGcfC7qC2zbdRgXG/stvTd6e
 7ittVxQjqipzmmgIObV1cXGptq2axY6oT27pFwvo1tTYj3a00zJDZLUlL
 atwH+n0LrZO6mvCwT4NOi5xqYwStsw+620BMjYrJTV5QSMG+J99ObVJPD
 BCCk3Y/VJxQKv/WKGGSBVp3/ti6p6SZuqtshVNoM7X7ucQEZPivmt743w
 mMoW06yAvKyt8Y6p96li/Uj0o45j83e9Gugod3IJ/LIyOd5xxrLr3j0/w Q==;
X-CSE-ConnectionGUID: kdfDAC0qSA+Fwqh8kmgsrw==
X-CSE-MsgGUID: P+ZlIJZHRPGQ/VywqCfp+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="72894502"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="72894502"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 10:39:26 -0800
X-CSE-ConnectionGUID: Z34wyAtRSLqIxqZ/QolKOg==
X-CSE-MsgGUID: bCKgPv3gTNqF17Vv3E8Rcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="215999661"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 10:39:26 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Philipp Stanner <phasta@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH v2 2/2] dma-buf: Assign separate lockdep class to array lock
Date: Tue, 24 Feb 2026 10:39:22 -0800
Message-Id: <20260224183922.2256492-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260224183922.2256492-1-matthew.brost@intel.com>
References: <20260224183922.2256492-1-matthew.brost@intel.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,intel.com:mid,intel.com:dkim,intel.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: C5D7B18B824
X-Rspamd-Action: no action

dma_fence_array_enable_signaling() runs while holding the array
inline_lock and may add callbacks to underlying fences, which takes
their inline_lock.

Since both locks share the same lockdep class, this valid nesting
triggers a recursive locking warning. Assign a distinct lockdep class
to the array inline_lock so lockdep can correctly model the hierarchy.

Fixes: 5943243914b9 ("dma-buf: use inline lock for the dma-fence-array")
Cc: Christian König <christian.koenig@amd.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Philipp Stanner <phasta@kernel.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>

---
v2:
 - Drop if IS_ENABLED(CONFIG_LOCKDEP), lockdep does this
---
 drivers/dma-buf/dma-fence-array.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index cd970eceaefb..089f69469524 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -200,6 +200,8 @@ void dma_fence_array_init(struct dma_fence_array *array,
 			  u64 context, unsigned seqno,
 			  bool signal_on_any)
 {
+	static struct lock_class_key dma_fence_array_lock_key;
+
 	WARN_ON(!num_fences || !fences);
 
 	array->num_fences = num_fences;
@@ -208,6 +210,18 @@ void dma_fence_array_init(struct dma_fence_array *array,
 		       seqno);
 	init_irq_work(&array->work, irq_dma_fence_array_work);
 
+	/*
+	 * dma_fence_array_enable_signaling() is invoked while holding
+	 * array->base.inline_lock and may call dma_fence_add_callback()
+	 * on the underlying fences, which takes their inline_lock.
+	 *
+	 * Since both locks share the same lockdep class, this legitimate
+	 * nesting confuses lockdep and triggers a recursive locking
+	 * warning. Assign a separate lockdep class to the array lock
+	 * to model this hierarchy correctly.
+	 */
+	lockdep_set_class(&array->base.inline_lock, &dma_fence_array_lock_key);
+
 	atomic_set(&array->num_pending, signal_on_any ? 1 : num_fences);
 	array->fences = fences;
 
-- 
2.34.1

