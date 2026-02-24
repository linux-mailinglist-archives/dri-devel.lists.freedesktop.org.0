Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AECnEynmnWlDSgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 18:55:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C963418ACE9
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 18:55:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7A0510E5F9;
	Tue, 24 Feb 2026 17:55:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jq1bbE45";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDBC710E5F9;
 Tue, 24 Feb 2026 17:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771955750; x=1803491750;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nHOG6w6eebcF49m96DVMXJlZNDj62aMkz0XMUwgn27g=;
 b=Jq1bbE45UQkJeoaXGTclD1tI7iEdY8eWRax11+93ePFPUreyYrqKxsce
 m7nav+O4MwU3BCOYHOpsrfbyj4qPFoKqznp74TlLHWb+d27S3WLQ3miKn
 Od4tmWd8Fp60rqTG4QLYuyTE+5Z0E2zkEkvDTy13PHKYN7Ps1PgXKeWRQ
 D89tFWowQ4dScC75zf0jVxhLJ4U51mbgGCsSaQZNxNyVG5o5E8OQn2p0f
 f24lo0j1dXuIhtO7Rd2sphMcuECAaoVFDjYKmRLwh83nwFDdMEUEMUJTE
 /PQmL7ZPxEGeqLUAsO9ggYFUSIUbuox9eQbcI2AOg946RPOIO+Cgs2+nF A==;
X-CSE-ConnectionGUID: krDjGrObTaqK4tG5NdDgZg==
X-CSE-MsgGUID: 6kSfEKw6RHWXIjMFrKFdwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="72683126"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="72683126"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 09:55:49 -0800
X-CSE-ConnectionGUID: d9vWSbqZSBqyQKiphGZSvA==
X-CSE-MsgGUID: 5/hkpLkMSkeshSuYwmZq3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="220479707"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 09:55:49 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Philipp Stanner <phasta@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH 1/2] dma-buf: Assign separate lockdep class to chain lock
Date: Tue, 24 Feb 2026 09:55:43 -0800
Message-Id: <20260224175544.2167712-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,intel.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,igalia.com:email,collabora.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: C963418ACE9
X-Rspamd-Action: no action

dma_fence_chain_enable_signaling() runs while holding the chain
inline_lock and may add callbacks to underlying fences, which takes
their inline_lock.

Since both locks share the same lockdep class, this valid nesting
triggers a recursive locking warning. Assign a distinct lockdep class
to the chain inline_lock so lockdep can correctly model the hierarchy.

Fixes: a408c0ca0c41 ("dma-buf: use inline lock for the dma-fence-chain")
Cc: Christian König <christian.koenig@amd.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Philipp Stanner <phasta@kernel.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/dma-buf/dma-fence-chain.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
index a707792b6025..4c2a9f2ce126 100644
--- a/drivers/dma-buf/dma-fence-chain.c
+++ b/drivers/dma-buf/dma-fence-chain.c
@@ -242,6 +242,9 @@ void dma_fence_chain_init(struct dma_fence_chain *chain,
 			  struct dma_fence *fence,
 			  uint64_t seqno)
 {
+#if IS_ENABLED(CONFIG_LOCKDEP)
+	static struct lock_class_key dma_fence_chain_lock_key;
+#endif
 	struct dma_fence_chain *prev_chain = to_dma_fence_chain(prev);
 	uint64_t context;
 
@@ -263,6 +266,20 @@ void dma_fence_chain_init(struct dma_fence_chain *chain,
 	dma_fence_init64(&chain->base, &dma_fence_chain_ops, NULL,
 			 context, seqno);
 
+#if IS_ENABLED(CONFIG_LOCKDEP)
+	/*
+	 * dma_fence_chain_enable_signaling() is invoked while holding
+	 * chain->base.inline_lock and may call dma_fence_add_callback()
+	 * on the underlying fences, which takes their inline_lock.
+	 *
+	 * Since both locks share the same lockdep class, this legitimate
+	 * nesting confuses lockdep and triggers a recursive locking
+	 * warning. Assign a separate lockdep class to the chain lock
+	 * to model this hierarchy correctly.
+	 */
+	lockdep_set_class(&chain->base.inline_lock, &dma_fence_chain_lock_key);
+#endif
+
 	/*
 	 * Chaining dma_fence_chain container together is only allowed through
 	 * the prev fence and not through the contained fence.
-- 
2.34.1

