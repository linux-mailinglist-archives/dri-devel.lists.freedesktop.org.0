Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56985A797C2
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 23:39:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8DFC10E8D9;
	Wed,  2 Apr 2025 21:39:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Gd1zNfiK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDAB210E8D9;
 Wed,  2 Apr 2025 21:39:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 15462614AE;
 Wed,  2 Apr 2025 21:39:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7B5DC4CEEA;
 Wed,  2 Apr 2025 21:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743629950;
 bh=TSUZ/BtivkLRiKLsU2XCL8Ugofa5D2b//TRkx+fWb90=;
 h=Date:From:To:Cc:Subject:From;
 b=Gd1zNfiK12s9/7C+9AiJxdL37Jazmrvm2NVQveKCMeStcTD8bdgZ4g5vPmXFMZfF4
 FHo9du/fzkGCwZ6RbnqQnnVAVTt+70lJqq33GWG6m8wnNDEJG0w9azwVqpdI0drjyN
 SX9I/vDWWXiKYFWADa0UgE06UZ6rTQpjCh+6YX3USklPSEWgm+OBqxTdVdy48yA4Rf
 VmUWYuaI3hNv7gHNaztS5eNgFmjMoxwKmtQV/qrGAnNbI+ja3b4L9wRCf89rBLRD4U
 MOqD3nKvhtoWRiyUN9WLal56LDporgVl4J9aJyQe6ORkhNHcgcwcZarkc6Qu7g2mr0
 tR8TzxA8/8sYw==
Date: Wed, 2 Apr 2025 15:39:07 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-hardening@vger.kernel.org
Subject: [PATCH][next] drm/nouveau: svm: Avoid -Wflex-array-member-not-at-end
 warning
Message-ID: <Z-2uezeHt1aaHH6x@kspp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

-Wflex-array-member-not-at-end was introduced in GCC-14, and we are
getting ready to enable it, globally.

Use the `DEFINE_RAW_FLEX()` helper for an on-stack definition of
a flexible structure where the size of the flexible-array member
is known at compile-time, and refactor the rest of the code,
accordingly.

So, with these changes, fix the following warning:

drivers/gpu/drm/nouveau/nouveau_svm.c:724:44: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/gpu/drm/nouveau/nouveau_svm.c | 39 +++++++++++++--------------
 1 file changed, 18 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index e12e2596ed84..6fa387da0637 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -720,10 +720,7 @@ nouveau_svm_fault(struct work_struct *work)
 	struct nouveau_svm *svm = container_of(buffer, typeof(*svm), buffer[buffer->id]);
 	struct nvif_object *device = &svm->drm->client.device.object;
 	struct nouveau_svmm *svmm;
-	struct {
-		struct nouveau_pfnmap_args i;
-		u64 phys[1];
-	} args;
+	DEFINE_RAW_FLEX(struct nouveau_pfnmap_args, args, p.phys, 1);
 	unsigned long hmm_flags;
 	u64 inst, start, limit;
 	int fi, fn;
@@ -772,11 +769,11 @@ nouveau_svm_fault(struct work_struct *work)
 	mutex_unlock(&svm->mutex);
 
 	/* Process list of faults. */
-	args.i.i.version = 0;
-	args.i.i.type = NVIF_IOCTL_V0_MTHD;
-	args.i.m.version = 0;
-	args.i.m.method = NVIF_VMM_V0_PFNMAP;
-	args.i.p.version = 0;
+	args->i.version = 0;
+	args->i.type = NVIF_IOCTL_V0_MTHD;
+	args->m.version = 0;
+	args->m.method = NVIF_VMM_V0_PFNMAP;
+	args->p.version = 0;
 
 	for (fi = 0; fn = fi + 1, fi < buffer->fault_nr; fi = fn) {
 		struct svm_notifier notifier;
@@ -802,9 +799,9 @@ nouveau_svm_fault(struct work_struct *work)
 		 * fault window, determining required pages and access
 		 * permissions based on pending faults.
 		 */
-		args.i.p.addr = start;
-		args.i.p.page = PAGE_SHIFT;
-		args.i.p.size = PAGE_SIZE;
+		args->p.addr = start;
+		args->p.page = PAGE_SHIFT;
+		args->p.size = PAGE_SIZE;
 		/*
 		 * Determine required permissions based on GPU fault
 		 * access flags.
@@ -832,16 +829,16 @@ nouveau_svm_fault(struct work_struct *work)
 
 		notifier.svmm = svmm;
 		if (atomic)
-			ret = nouveau_atomic_range_fault(svmm, svm->drm,
-							 &args.i, sizeof(args),
+			ret = nouveau_atomic_range_fault(svmm, svm->drm, args,
+							 __struct_size(args),
 							 &notifier);
 		else
-			ret = nouveau_range_fault(svmm, svm->drm, &args.i,
-						  sizeof(args), hmm_flags,
-						  &notifier);
+			ret = nouveau_range_fault(svmm, svm->drm, args,
+						  __struct_size(args),
+						  hmm_flags, &notifier);
 		mmput(mm);
 
-		limit = args.i.p.addr + args.i.p.size;
+		limit = args->p.addr + args->p.size;
 		for (fn = fi; ++fn < buffer->fault_nr; ) {
 			/* It's okay to skip over duplicate addresses from the
 			 * same SVMM as faults are ordered by access type such
@@ -855,14 +852,14 @@ nouveau_svm_fault(struct work_struct *work)
 			if (buffer->fault[fn]->svmm != svmm ||
 			    buffer->fault[fn]->addr >= limit ||
 			    (buffer->fault[fi]->access == FAULT_ACCESS_READ &&
-			     !(args.phys[0] & NVIF_VMM_PFNMAP_V0_V)) ||
+			     !(args->p.phys[0] & NVIF_VMM_PFNMAP_V0_V)) ||
 			    (buffer->fault[fi]->access != FAULT_ACCESS_READ &&
 			     buffer->fault[fi]->access != FAULT_ACCESS_PREFETCH &&
-			     !(args.phys[0] & NVIF_VMM_PFNMAP_V0_W)) ||
+			     !(args->p.phys[0] & NVIF_VMM_PFNMAP_V0_W)) ||
 			    (buffer->fault[fi]->access != FAULT_ACCESS_READ &&
 			     buffer->fault[fi]->access != FAULT_ACCESS_WRITE &&
 			     buffer->fault[fi]->access != FAULT_ACCESS_PREFETCH &&
-			     !(args.phys[0] & NVIF_VMM_PFNMAP_V0_A)))
+			     !(args->p.phys[0] & NVIF_VMM_PFNMAP_V0_A)))
 				break;
 		}
 
-- 
2.43.0

