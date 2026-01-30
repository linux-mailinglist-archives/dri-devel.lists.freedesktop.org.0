Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yELrCSzEfGmgOgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 15:46:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B64ABBB5F
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 15:46:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4ABB10EA03;
	Fri, 30 Jan 2026 14:46:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O0fkowIi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF05310EA03;
 Fri, 30 Jan 2026 14:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769784360; x=1801320360;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=15Hl+K7cKkodTSwPvhoZK9Gww0RwmQIdjPmcrj08khs=;
 b=O0fkowIiOLzysmm1Vos6EacA2gn2W0zDL54lIFnawwn+sPNyrI72AMGP
 4BrPB5bUFZq8angbAOdzhjsKgq2lIoWatgLY/KHABUzCcAQETSv93A3iS
 xyrbzfp56MzKSVDfcxgomu5t/R5l3Wte2Sp6VzpJLm0DYYFH+TSH4MCub
 txLagF1Vk7cVSJoqFPXV4QiSFGK3qqonLMVwudhbkLDS3D2EJ18mSPDT6
 s+eWa8AeZU7ir0UD8rpr/NRT/eU8mt5r6uzzQSa/jdIn5IBlKAT4cUSQ5
 5Ko8XtUnrhTVK1YkcMOf1AyBWfUZjxW0ztLKvavaTLRdrZEVQjsE84Jzv g==;
X-CSE-ConnectionGUID: iNRg/OERTbOF5dyrwXtoLQ==
X-CSE-MsgGUID: V16tbu78TxuL12id8qTQ3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="96495809"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="96495809"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 06:45:59 -0800
X-CSE-ConnectionGUID: XMz+iAomQ36BwmT6wZEAQw==
X-CSE-MsgGUID: dqWyryrwSxaMxaCisrfI1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="209224967"
Received: from rvuia-mobl.ger.corp.intel.com (HELO fedora) ([10.245.244.13])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 06:45:56 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Ralph Campbell <rcampbell@nvidia.com>, Christoph Hellwig <hch@lst.de>,
 Jason Gunthorpe <jgg@mellanox.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Matthew Brost <matthew.brost@intel.com>, linux-mm@kvack.org,
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] mm/hmm: Fix a hmm_range_fault() livelock / starvation problem
Date: Fri, 30 Jan 2026 15:45:29 +0100
Message-ID: <20260130144529.79909-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.52.0
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.hellstrom@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ziepe.ca:email,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linux.intel.com:mid];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: 7B64ABBB5F
X-Rspamd-Action: no action

If hmm_range_fault() fails a folio_trylock() in do_swap_page,
trying to acquire the lock of a device-private folio for migration,
to ram, the function will spin until it succeeds grabbing the lock.

However, if the process holding the lock is depending on a work
item to be completed, which is scheduled on the same CPU as the
spinning hmm_range_fault(), that work item might be starved and
we end up in a livelock / starvation situation which is never
resolved.

This can happen, for example if the process holding the
device-private folio lock is stuck in
   migrate_device_unmap()->lru_add_drain_all()
The lru_add_drain_all() function requires a short work-item
to be run on all online cpus to complete.

A prerequisite for this to happen is:
a) Both zone device and system memory folios are considered in
   migrate_device_unmap(), so that there is a reason to call
   lru_add_drain_all() for a system memory folio while a
   folio lock is held on a zone device folio.
b) The zone device folio has an initial mapcount > 1 which causes
   at least one migration PTE entry insertion to be deferred to
   try_to_migrate(), which can happen after the call to
   lru_add_drain_all().
c) No or voluntary only preemption.

This all seems pretty unlikely to happen, but indeed is hit by
the "xe_exec_system_allocator" igt test.

Resolve this using a cond_resched() after each iteration in
hmm_range_fault(). Future code improvements might consider moving
the lru_add_drain_all() call in migrate_device_unmap() out of the
folio locked region.

Also, hmm_range_fault() can be a very long-running function
so a cond_resched() at the end of each iteration can be
motivated even in the absence of an -EBUSY.

Fixes: d28c2c9a4877 ("mm/hmm: make full use of walk_page_range()")
Cc: Ralph Campbell <rcampbell@nvidia.com>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Jason Gunthorpe <jgg@mellanox.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Leon Romanovsky <leon@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: linux-mm@kvack.org
Cc: <stable@vger.kernel.org> # v5.5+
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 mm/hmm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/mm/hmm.c b/mm/hmm.c
index 4ec74c18bef6..160c9e4e5a92 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -674,6 +674,13 @@ int hmm_range_fault(struct hmm_range *range)
 			return -EBUSY;
 		ret = walk_page_range(mm, hmm_vma_walk.last, range->end,
 				      &hmm_walk_ops, &hmm_vma_walk);
+		/*
+		 * Conditionally reschedule to let other work items get
+		 * a chance to unlock device-private pages whose locks
+		 * we're spinning on.
+		 */
+		cond_resched();
+
 		/*
 		 * When -EBUSY is returned the loop restarts with
 		 * hmm_vma_walk.last set to an address that has not been stored
-- 
2.52.0

