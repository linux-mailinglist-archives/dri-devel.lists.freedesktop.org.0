Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDh+HHqdjWmD5QAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 10:29:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2397B12BDFC
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 10:29:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 478A410E70D;
	Thu, 12 Feb 2026 09:29:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PG3DgNIs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF7A010E709;
 Thu, 12 Feb 2026 09:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770888563; x=1802424563;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gGpMOERSjzLyE81SwMZUIAZ3Jgk8yEQN7nVaVZJjQe4=;
 b=PG3DgNIsk4E+nkJ/EuqK/8RVnkcQFNfOcSvm5FO7c/S3rj/j6SJQzS26
 WzZYQMT2jeG25FXQZqSCNjIsYwTcGh/aov6hYGFsqarHTFw79o3O3t2eK
 iV+j4otlOBD+xOl1VSwI/vgomSUErmXoNLcryEt1BjTstB9MdbbfD1DHe
 hIMgdwoZZAX7GpAfO3Bs3/3Jy6v+iH7PmRyJyxb4+P+Wi5h4vv65Th1ez
 aC5UfKxi6jc5PhpveHi524Yh7qVXMf4EXUeGyepJGOjpem6RWRmQN6/m4
 vMdEZBA0hqLqzOSiY83mFcCeW1/YBfNwfMD0xmUHQz8GbN/cYJ9Y3ZSQa g==;
X-CSE-ConnectionGUID: l4lbQy+TQ/Ol+UEmGN04Vg==
X-CSE-MsgGUID: KOC/2+jGQbmTunfu70SJyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="89463842"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="89463842"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 01:29:23 -0800
X-CSE-ConnectionGUID: mHNw5lnmS2eAHCe3A+Nbrw==
X-CSE-MsgGUID: e8r58oMeSSGnFYXubSkHcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="217016789"
Received: from yadavs-z690i-a-ultra-plus.iind.intel.com ([10.190.216.90])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 01:29:21 -0800
From: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 2/2] drm/buddy: Move internal helpers to buddy.c
Date: Thu, 12 Feb 2026 14:55:30 +0530
Message-ID: <20260212092527.718455-6-sanjay.kumar.yadav@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260212092527.718455-4-sanjay.kumar.yadav@intel.com>
References: <20260212092527.718455-4-sanjay.kumar.yadav@intel.com>
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:mid,intel.com:dkim,intel.com:email];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_NEQ_ENVFROM(0.00)[sanjay.kumar.yadav@intel.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: 2397B12BDFC
X-Rspamd-Action: no action

Move gpu_buddy_block_state(), gpu_buddy_block_is_allocated(),
and gpu_buddy_block_is_split() from gpu_buddy.h to gpu_buddy.c
as static functions since they have no external callers.

Remove gpu_get_buddy() as it was an unused exported wrapper
around the internal __get_buddy().

No functional changes.

v2:
- Rebased after DRM buddy allocator moved to drivers/gpu/
- Keep gpu_buddy_block_is_free() in header since it's now
  used by drm_buddy.c
- Updated commit message

Cc: Christian König <christian.koenig@amd.com>
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Suggested-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
Reviewed-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/buddy.c       | 35 ++++++++++++++++++-----------------
 include/linux/gpu_buddy.h | 25 ++-----------------------
 2 files changed, 20 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/buddy.c b/drivers/gpu/buddy.c
index 603c59a2013a..b27761246d4b 100644
--- a/drivers/gpu/buddy.c
+++ b/drivers/gpu/buddy.c
@@ -14,6 +14,24 @@
 
 static struct kmem_cache *slab_blocks;
 
+static unsigned int
+gpu_buddy_block_state(struct gpu_buddy_block *block)
+{
+	return block->header & GPU_BUDDY_HEADER_STATE;
+}
+
+static bool
+gpu_buddy_block_is_allocated(struct gpu_buddy_block *block)
+{
+	return gpu_buddy_block_state(block) == GPU_BUDDY_ALLOCATED;
+}
+
+static bool
+gpu_buddy_block_is_split(struct gpu_buddy_block *block)
+{
+	return gpu_buddy_block_state(block) == GPU_BUDDY_SPLIT;
+}
+
 static struct gpu_buddy_block *gpu_block_alloc(struct gpu_buddy *mm,
 					       struct gpu_buddy_block *parent,
 					       unsigned int order,
@@ -449,23 +467,6 @@ static int split_block(struct gpu_buddy *mm,
 	return 0;
 }
 
-/**
- * gpu_get_buddy - get buddy address
- *
- * @block: GPU buddy block
- *
- * Returns the corresponding buddy block for @block, or NULL
- * if this is a root block and can't be merged further.
- * Requires some kind of locking to protect against
- * any concurrent allocate and free operations.
- */
-struct gpu_buddy_block *
-gpu_get_buddy(struct gpu_buddy_block *block)
-{
-	return __get_buddy(block);
-}
-EXPORT_SYMBOL(gpu_get_buddy);
-
 /**
  * gpu_buddy_reset_clear - reset blocks clear state
  *
diff --git a/include/linux/gpu_buddy.h b/include/linux/gpu_buddy.h
index bf2a42256536..f1fb6eff604a 100644
--- a/include/linux/gpu_buddy.h
+++ b/include/linux/gpu_buddy.h
@@ -191,16 +191,10 @@ gpu_buddy_block_order(struct gpu_buddy_block *block)
 	return block->header & GPU_BUDDY_HEADER_ORDER;
 }
 
-static inline unsigned int
-gpu_buddy_block_state(struct gpu_buddy_block *block)
-{
-	return block->header & GPU_BUDDY_HEADER_STATE;
-}
-
 static inline bool
-gpu_buddy_block_is_allocated(struct gpu_buddy_block *block)
+gpu_buddy_block_is_free(struct gpu_buddy_block *block)
 {
-	return gpu_buddy_block_state(block) == GPU_BUDDY_ALLOCATED;
+	return (block->header & GPU_BUDDY_HEADER_STATE) == GPU_BUDDY_FREE;
 }
 
 static inline bool
@@ -209,18 +203,6 @@ gpu_buddy_block_is_clear(struct gpu_buddy_block *block)
 	return block->header & GPU_BUDDY_HEADER_CLEAR;
 }
 
-static inline bool
-gpu_buddy_block_is_free(struct gpu_buddy_block *block)
-{
-	return gpu_buddy_block_state(block) == GPU_BUDDY_FREE;
-}
-
-static inline bool
-gpu_buddy_block_is_split(struct gpu_buddy_block *block)
-{
-	return gpu_buddy_block_state(block) == GPU_BUDDY_SPLIT;
-}
-
 static inline u64
 gpu_buddy_block_size(struct gpu_buddy *mm,
 		     struct gpu_buddy_block *block)
@@ -232,9 +214,6 @@ int gpu_buddy_init(struct gpu_buddy *mm, u64 size, u64 chunk_size);
 
 void gpu_buddy_fini(struct gpu_buddy *mm);
 
-struct gpu_buddy_block *
-gpu_get_buddy(struct gpu_buddy_block *block);
-
 int gpu_buddy_alloc_blocks(struct gpu_buddy *mm,
 			   u64 start, u64 end, u64 size,
 			   u64 min_page_size,
-- 
2.52.0

