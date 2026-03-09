Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YP5xOTHjrmmsJwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 16:11:45 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A66023B68A
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 16:11:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D938E10E535;
	Mon,  9 Mar 2026 15:11:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="JlzTx4vU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57E1510E52B
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 15:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1773069096;
 bh=I2lOcLRc5Qq2z5N68UVNnmgSau/eccl6k5OdKP+99zs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JlzTx4vUUgCRaqH5LMcfe4gyEZiPIO/k65gjzOMPXWnUJKDbL92WitICEsGhvL/17
 6xS9RK7Xo1CzXQ9FZX5iSZPeZSxqwoC86ra3rV963FwB/IuYqmk+I0+kWdde2Z+qKW
 NCUXbkICZDaYXUinOeiw99yMTUgeexF0HBbZwVN5WR1+KZl9qoh9LaTePfED8TdP9r
 XvmIbBG7h7K1dS9anPwyJwgTbT9074oMeeD/hmXMJteG2Z76rK4cm621ZLq2NtnZPH
 uNA6Jekdc8r8LrFDvm6DUtJ2AhQUhVXyO3mZQ8u98ntDVDyUuR5jTJZ8CS/V+K14ph
 g0K+Wqf15yvDg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 5F03F17E12A2;
 Mon,  9 Mar 2026 16:11:35 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Akash Goel <akash.goel@arm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Chris Diamand <chris.diamand@arm.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Alice Ryhl <aliceryhl@google.com>, Chia-I Wu <olvaffe@gmail.com>,
 kernel@collabora.com
Subject: [PATCH v5 7/9] drm/panthor: Split panthor_vm_prepare_map_op_ctx() to
 prepare for reclaim
Date: Mon,  9 Mar 2026 16:11:17 +0100
Message-ID: <20260309151119.290217-8-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260309151119.290217-1-boris.brezillon@collabora.com>
References: <20260309151119.290217-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
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
X-Rspamd-Queue-Id: 9A66023B68A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,gmail.com,ffwll.ch,arm.com,oss.qualcomm.com,poorly.run,kernel.org,linux.intel.com,suse.de,collabora.com,intel.com,google.com];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:steven.price@arm.com,m:liviu.dudau@arm.com,m:adrian.larumbe@collabora.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:akash.goel@arm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:dmitry.osipenko@collabora.com,m:chris.diamand@arm.com,m:dakr@kernel.org,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:aliceryhl@google.com,m:olvaffe@gmail.com,m:kernel@collabora.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,collabora.com:email,collabora.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,arm.com:email]
X-Rspamd-Action: no action

We're gonna need just the page table reservation logic when we restore
evicted BO mappings, so let's prepare for that by extracting the
op_ctx init and page table pre-allocation into separate helpers.

v2:
- Collect R-bs

v3:
- No changes

v4:
- No changes

v5:
- No changes

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panthor/panthor_mmu.c | 68 ++++++++++++++++-----------
 1 file changed, 41 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 3f73a35fe1fa..5d07c1b96e0a 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -1180,6 +1180,44 @@ panthor_vm_op_ctx_prealloc_vmas(struct panthor_vm_op_ctx *op_ctx)
 	return 0;
 }
 
+static void panthor_vm_init_op_ctx(struct panthor_vm_op_ctx *op_ctx,
+				   u64 size, u64 va, u32 flags)
+{
+	memset(op_ctx, 0, sizeof(*op_ctx));
+	op_ctx->flags = flags;
+	op_ctx->va.range = size;
+	op_ctx->va.addr = va;
+}
+
+static int panthor_vm_op_ctx_prealloc_pts(struct panthor_vm_op_ctx *op_ctx)
+{
+	u64 size = op_ctx->va.range;
+	u64 va = op_ctx->va.addr;
+	int ret;
+
+	/* L1, L2 and L3 page tables.
+	 * We could optimize L3 allocation by iterating over the sgt and merging
+	 * 2M contiguous blocks, but it's simpler to over-provision and return
+	 * the pages if they're not used.
+	 */
+	u64 pt_count = ((ALIGN(va + size, 1ull << 39) - ALIGN_DOWN(va, 1ull << 39)) >> 39) +
+		       ((ALIGN(va + size, 1ull << 30) - ALIGN_DOWN(va, 1ull << 30)) >> 30) +
+		       ((ALIGN(va + size, 1ull << 21) - ALIGN_DOWN(va, 1ull << 21)) >> 21);
+
+	op_ctx->rsvd_page_tables.pages = kzalloc_objs(*op_ctx->rsvd_page_tables.pages,
+						      pt_count);
+	if (!op_ctx->rsvd_page_tables.pages)
+		return -ENOMEM;
+
+	ret = kmem_cache_alloc_bulk(pt_cache, GFP_KERNEL, pt_count,
+				    op_ctx->rsvd_page_tables.pages);
+	op_ctx->rsvd_page_tables.count = ret;
+	if (ret != pt_count)
+		return -ENOMEM;
+
+	return 0;
+}
+
 #define PANTHOR_VM_BIND_OP_MAP_FLAGS \
 	(DRM_PANTHOR_VM_BIND_OP_MAP_READONLY | \
 	 DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC | \
@@ -1195,7 +1233,6 @@ static int panthor_vm_prepare_map_op_ctx(struct panthor_vm_op_ctx *op_ctx,
 {
 	struct drm_gpuvm_bo *preallocated_vm_bo;
 	struct sg_table *sgt = NULL;
-	u64 pt_count;
 	int ret;
 
 	if (!bo)
@@ -1214,10 +1251,7 @@ static int panthor_vm_prepare_map_op_ctx(struct panthor_vm_op_ctx *op_ctx,
 	    bo->exclusive_vm_root_gem != panthor_vm_root_gem(vm))
 		return -EINVAL;
 
-	memset(op_ctx, 0, sizeof(*op_ctx));
-	op_ctx->flags = flags;
-	op_ctx->va.range = size;
-	op_ctx->va.addr = va;
+	panthor_vm_init_op_ctx(op_ctx, size, va, flags);
 
 	ret = panthor_vm_op_ctx_prealloc_vmas(op_ctx);
 	if (ret)
@@ -1249,29 +1283,9 @@ static int panthor_vm_prepare_map_op_ctx(struct panthor_vm_op_ctx *op_ctx,
 	op_ctx->map.vm_bo = drm_gpuvm_bo_obtain_prealloc(preallocated_vm_bo);
 	op_ctx->map.bo_offset = offset;
 
-	/* L1, L2 and L3 page tables.
-	 * We could optimize L3 allocation by iterating over the sgt and merging
-	 * 2M contiguous blocks, but it's simpler to over-provision and return
-	 * the pages if they're not used.
-	 */
-	pt_count = ((ALIGN(va + size, 1ull << 39) - ALIGN_DOWN(va, 1ull << 39)) >> 39) +
-		   ((ALIGN(va + size, 1ull << 30) - ALIGN_DOWN(va, 1ull << 30)) >> 30) +
-		   ((ALIGN(va + size, 1ull << 21) - ALIGN_DOWN(va, 1ull << 21)) >> 21);
-
-	op_ctx->rsvd_page_tables.pages = kzalloc_objs(*op_ctx->rsvd_page_tables.pages,
-						      pt_count);
-	if (!op_ctx->rsvd_page_tables.pages) {
-		ret = -ENOMEM;
+	ret = panthor_vm_op_ctx_prealloc_pts(op_ctx);
+	if (ret)
 		goto err_cleanup;
-	}
-
-	ret = kmem_cache_alloc_bulk(pt_cache, GFP_KERNEL, pt_count,
-				    op_ctx->rsvd_page_tables.pages);
-	op_ctx->rsvd_page_tables.count = ret;
-	if (ret != pt_count) {
-		ret = -ENOMEM;
-		goto err_cleanup;
-	}
 
 	/* Insert BO into the extobj list last, when we know nothing can fail. */
 	if (bo->base.resv != panthor_vm_resv(vm)) {
-- 
2.53.0

