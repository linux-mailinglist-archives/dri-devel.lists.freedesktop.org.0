Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJhBLxoVjGk8gQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 06:35:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 714E11215D5
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 06:35:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 551CB10E18E;
	Wed, 11 Feb 2026 05:35:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hy36xv0u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11FD310E1A3;
 Wed, 11 Feb 2026 05:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770788118; x=1802324118;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z08do99fCzPdCDQcf5a3SENfvAJV+KA4htV2uu2b7CI=;
 b=hy36xv0uO1OVidpc4YaQMJ1XYZiVhLgn2pQeFm52mOGL+GJeFGwkRrUf
 H140pIaBeL2el9FRkI2EZo7bU0VDS8XNZiWmbR4HbJWL7fkFVWvAOwQWX
 AYMqxayl4Dt+zIPBtxUbBxzzrxDt5c5QKmp3l3yEFTLjUp8NoDSUXDbyB
 tpYA62/oaIUFSFfRBTE+zrzUma9+/Y3iiyrZATpNniWUrNrAmzPG+YIJc
 NfWOC/7TLpeuTFVlVQ/zlUu5zhy5KL9P6k/WYpLKf1D0xa1ZrRqQIkQ8B
 C1KAUKqZPMHsIUauJIXPv5Ii55VcgWlUhbIBT3SKkaR35fobjFZYy2l/h A==;
X-CSE-ConnectionGUID: I84tKoHATg2ujiYqarjP7g==
X-CSE-MsgGUID: It1ekPFbQQCBFVgwLNWUZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="82248056"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="82248056"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 21:35:18 -0800
X-CSE-ConnectionGUID: 6fbAXx9QSfeOS4cERr7LEA==
X-CSE-MsgGUID: XOmBPksySkOxqj4rTH2Lrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="211464613"
Received: from yadavs-z690i-a-ultra-plus.iind.intel.com ([10.190.216.90])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 21:35:16 -0800
From: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v2 2/2] drm/buddy: Move internal helpers to buddy.c
Date: Wed, 11 Feb 2026 11:01:26 +0530
Message-ID: <20260211053123.260037-6-sanjay.kumar.yadav@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260211053123.260037-4-sanjay.kumar.yadav@intel.com>
References: <20260211053123.260037-4-sanjay.kumar.yadav@intel.com>
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
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,intel.com:mid,intel.com:dkim,intel.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[sanjay.kumar.yadav@intel.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: 714E11215D5
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
index b06241c78437..4d68445ac16d 100644
--- a/include/linux/gpu_buddy.h
+++ b/include/linux/gpu_buddy.h
@@ -190,16 +190,10 @@ gpu_buddy_block_order(struct gpu_buddy_block *block)
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
@@ -208,18 +202,6 @@ gpu_buddy_block_is_clear(struct gpu_buddy_block *block)
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
@@ -231,9 +213,6 @@ int gpu_buddy_init(struct gpu_buddy *mm, u64 size, u64 chunk_size);
 
 void gpu_buddy_fini(struct gpu_buddy *mm);
 
-struct gpu_buddy_block *
-gpu_get_buddy(struct gpu_buddy_block *block);
-
 int gpu_buddy_alloc_blocks(struct gpu_buddy *mm,
 			   u64 start, u64 end, u64 size,
 			   u64 min_page_size,
-- 
2.52.0

