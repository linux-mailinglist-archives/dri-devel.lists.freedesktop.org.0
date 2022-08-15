Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 764995A002C
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 19:15:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E7B4BB4AC;
	Wed, 24 Aug 2022 17:15:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67CFEBC908
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 18:59:48 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id gb36so15014455ejc.10
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 11:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=jAANwixxP8Y/gdKO7coN2dVqc4AjjjIKz5KIhiIg/to=;
 b=JtqxEGNgWdFyyTU630y8C6MpwHT4SFD6s3z+mS55MQksh2uwuBxiCoaw8nD5UJStm1
 vNU0exvvP+9QydeSmUSgHkG7Ov2Buc8BPtb295rYG8pDSqZ3Uh0Uv20u+26QigiBd5vl
 N9jLKDal0FTpWmov63Zar+xcOE2GVqATGJ0jA/ae8m5sDbDry7cNsNtu/llLTCnV94me
 M035/bhdSzQC+6BfN02g+1DXE8wlK6iOvkkpNUKNxl/JQ8yrft2s7pZV8AC6ROyGMZcC
 d3R8sVT5L8a5QOy8kVS/JQ2MHwAaMBZU0FPUb4bldt5vBXs77z8kUYLPFpYk44MLJYmL
 6tFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=jAANwixxP8Y/gdKO7coN2dVqc4AjjjIKz5KIhiIg/to=;
 b=t9xBemtSUI/kcP3flmGRG6cy0fpyRl/3bc5AjNwRggVvxQTCIkgKA8KWqSS9gAaGrp
 bCuSMlJb4MBZDPDy0UClibdOh3Hb9AJKxkEOueX1pAgCMBB6m5xTK9iSItu+8GcBWndu
 SKnIfQ31DkWQjhkbvbDG+QBQsQdKxVPdJWR+MEwSD/JIIPHHnJDESwfuZJjTi7Vbw9M/
 EBjuZyhSYKJhJqcw35buvAXgx62tVt5nkiooYFl0XjldIvIvWZWEIzCbBGgRUkDkXrPd
 7KRN7PMASTPJmZTsqoV+lpYgKkNUPryKPOOicmx70VutSr3m1iT+7vJ29bkPTI+IhJ3V
 CLbg==
X-Gm-Message-State: ACgBeo3VwyrrmrY+MGsjUrzUdKyq31Rg57cmeYN+/xFj4YQoNtoWm4nS
 yu6Rcj3SMkRhCnNsnlHBkdRJ4qTcoZQ=
X-Google-Smtp-Source: AA6agR4el8JKzZ3SH5UzBhWqMfL1LXxYGrLtwJymy5NARWR9uhT5QyaHX2zrJ6u2Se6OMRshYxiDnA==
X-Received: by 2002:a17:906:4bd3:b0:731:3bdf:b95c with SMTP id
 x19-20020a1709064bd300b007313bdfb95cmr11211356ejv.677.1660589987300; 
 Mon, 15 Aug 2022 11:59:47 -0700 (PDT)
Received: from able.fritz.box (p57b0bd9f.dip0.t-ipconnect.de. [87.176.189.159])
 by smtp.gmail.com with ESMTPSA id
 d10-20020a170906304a00b00731745a7e62sm3553805ejd.28.2022.08.15.11.59.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 11:59:46 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 04/10] drm/amdgpu: cleanup and reorder amdgpu_cs.c
Date: Mon, 15 Aug 2022 20:59:34 +0200
Message-Id: <20220815185940.4744-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220815185940.4744-1-christian.koenig@amd.com>
References: <20220815185940.4744-1-christian.koenig@amd.com>
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sort the functions in the order they are called and cleanup the coding
style and function names to represent the data they process.

Check the size of the IB chunk, initialize resulting entity and scheduler
job much earlier as well.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 1641 ++++++++++++------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h |    2 +-
 2 files changed, 817 insertions(+), 826 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index a3b8400c914e..b9de631a66a3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -39,9 +39,61 @@
 #include "amdgpu_gem.h"
 #include "amdgpu_ras.h"
 
-static int amdgpu_cs_user_fence_chunk(struct amdgpu_cs_parser *p,
-				      struct drm_amdgpu_cs_chunk_fence *data,
-				      uint32_t *offset)
+static int amdgpu_cs_parser_init(struct amdgpu_cs_parser *p,
+				 struct amdgpu_device *adev,
+				 struct drm_file *filp,
+				 union drm_amdgpu_cs *cs)
+{
+	struct amdgpu_fpriv *fpriv = filp->driver_priv;
+
+	if (cs->in.num_chunks == 0)
+		return -EINVAL;
+
+	memset(p, 0, sizeof(*p));
+	p->adev = adev;
+	p->filp = filp;
+
+	p->ctx = amdgpu_ctx_get(fpriv, cs->in.ctx_id);
+	if (!p->ctx)
+		return -EINVAL;
+
+	if (atomic_read(&p->ctx->guilty)) {
+		amdgpu_ctx_put(p->ctx);
+		return -ECANCELED;
+	}
+	return 0;
+}
+
+static int amdgpu_cs_p1_ib(struct amdgpu_cs_parser *p,
+			   struct drm_amdgpu_cs_chunk_ib *chunk_ib,
+			   unsigned int *num_ibs)
+{
+	struct drm_sched_entity *entity;
+	int r;
+
+	r = amdgpu_ctx_get_entity(p->ctx, chunk_ib->ip_type,
+				  chunk_ib->ip_instance,
+				  chunk_ib->ring, &entity);
+	if (r)
+		return r;
+
+	/* Abort if there is no run queue associated with this entity.
+	 * Possibly because of disabled HW IP*/
+	if (entity->rq == NULL)
+		return -EINVAL;
+
+	/* Currently we don't support submitting to multiple entities */
+	if (p->entity && p->entity != entity)
+		return -EINVAL;
+
+	p->entity = entity;
+	++(*num_ibs);
+	return 0;
+}
+
+static int amdgpu_cs_p1_user_fence(struct amdgpu_cs_parser *p,
+				   struct drm_amdgpu_cs_chunk_fence *data,
+				   uint32_t *offset)
 {
 	struct drm_gem_object *gobj;
 	struct amdgpu_bo *bo;
@@ -80,11 +132,11 @@ static int amdgpu_cs_user_fence_chunk(struct amdgpu_cs_parser *p,
 	return r;
 }
 
-static int amdgpu_cs_bo_handles_chunk(struct amdgpu_cs_parser *p,
-				      struct drm_amdgpu_bo_list_in *data)
+static int amdgpu_cs_p1_bo_handles(struct amdgpu_cs_parser *p,
+				   struct drm_amdgpu_bo_list_in *data)
 {
+	struct drm_amdgpu_bo_list_entry *info;
 	int r;
-	struct drm_amdgpu_bo_list_entry *info = NULL;
 
 	r = amdgpu_bo_create_list_entry_array(data, &info);
 	if (r)
@@ -104,7 +156,9 @@ static int amdgpu_cs_bo_handles_chunk(struct amdgpu_cs_parser *p,
 	return r;
 }
 
-static int amdgpu_cs_parser_init(struct amdgpu_cs_parser *p, union drm_amdgpu_cs *cs)
+/* Copy the data from userspace and go over it the first time */
+static int amdgpu_cs_pass1(struct amdgpu_cs_parser *p,
+			   union drm_amdgpu_cs *cs)
 {
 	struct amdgpu_fpriv *fpriv = p->filp->driver_priv;
 	struct amdgpu_vm *vm = &fpriv->vm;
@@ -112,28 +166,17 @@ static int amdgpu_cs_parser_init(struct amdgpu_cs_parser *p, union drm_amdgpu_cs
 	uint64_t *chunk_array;
 	unsigned size, num_ibs = 0;
 	uint32_t uf_offset = 0;
-	int i;
 	int ret;
+	int i;
 
 	if (cs->in.num_chunks == 0)
 		return -EINVAL;
 
-	chunk_array = kvmalloc_array(cs->in.num_chunks, sizeof(uint64_t), GFP_KERNEL);
+	chunk_array = kvmalloc_array(cs->in.num_chunks, sizeof(uint64_t),
+				     GFP_KERNEL);
 	if (!chunk_array)
 		return -ENOMEM;
 
-	p->ctx = amdgpu_ctx_get(fpriv, cs->in.ctx_id);
-	if (!p->ctx) {
-		ret = -EINVAL;
-		goto free_chunk;
-	}
-
-	/* skip guilty context job */
-	if (atomic_read(&p->ctx->guilty) == 1) {
-		ret = -ECANCELED;
-		goto free_chunk;
-	}
-
 	/* get chunks */
 	chunk_array_user = u64_to_user_ptr(cs->in.chunks);
 	if (copy_from_user(chunk_array, chunk_array_user,
@@ -168,7 +211,8 @@ static int amdgpu_cs_parser_init(struct amdgpu_cs_parser *p, union drm_amdgpu_cs
 		size = p->chunks[i].length_dw;
 		cdata = u64_to_user_ptr(user_chunk.chunk_data);
 
-		p->chunks[i].kdata = kvmalloc_array(size, sizeof(uint32_t), GFP_KERNEL);
+		p->chunks[i].kdata = kvmalloc_array(size, sizeof(uint32_t),
+						    GFP_KERNEL);
 		if (p->chunks[i].kdata == NULL) {
 			ret = -ENOMEM;
 			i--;
@@ -180,36 +224,35 @@ static int amdgpu_cs_parser_init(struct amdgpu_cs_parser *p, union drm_amdgpu_cs
 			goto free_partial_kdata;
 		}
 
+		/* Assume the worst on the following checks */
+		ret = -EINVAL;
 		switch (p->chunks[i].chunk_id) {
 		case AMDGPU_CHUNK_ID_IB:
-			++num_ibs;
+			if (size < sizeof(struct drm_amdgpu_cs_chunk_ib))
+				goto free_partial_kdata;
+
+			ret = amdgpu_cs_p1_ib(p, p->chunks[i].kdata, &num_ibs);
+			if (ret)
+				goto free_partial_kdata;
 			break;
 
 		case AMDGPU_CHUNK_ID_FENCE:
-			size = sizeof(struct drm_amdgpu_cs_chunk_fence);
-			if (p->chunks[i].length_dw * sizeof(uint32_t) < size) {
-				ret = -EINVAL;
+			if (size < sizeof(struct drm_amdgpu_cs_chunk_fence))
 				goto free_partial_kdata;
-			}
 
-			ret = amdgpu_cs_user_fence_chunk(p, p->chunks[i].kdata,
-							 &uf_offset);
+			ret = amdgpu_cs_p1_user_fence(p, p->chunks[i].kdata,
+						      &uf_offset);
 			if (ret)
 				goto free_partial_kdata;
-
 			break;
 
 		case AMDGPU_CHUNK_ID_BO_HANDLES:
-			size = sizeof(struct drm_amdgpu_bo_list_in);
-			if (p->chunks[i].length_dw * sizeof(uint32_t) < size) {
-				ret = -EINVAL;
+			if (size < sizeof(struct drm_amdgpu_bo_list_in))
 				goto free_partial_kdata;
-			}
 
-			ret = amdgpu_cs_bo_handles_chunk(p, p->chunks[i].kdata);
+			ret = amdgpu_cs_p1_bo_handles(p, p->chunks[i].kdata);
 			if (ret)
 				goto free_partial_kdata;
-
 			break;
 
 		case AMDGPU_CHUNK_ID_DEPENDENCIES:
@@ -221,7 +264,6 @@ static int amdgpu_cs_parser_init(struct amdgpu_cs_parser *p, union drm_amdgpu_cs
 			break;
 
 		default:
-			ret = -EINVAL;
 			goto free_partial_kdata;
 		}
 	}
@@ -230,6 +272,10 @@ static int amdgpu_cs_parser_init(struct amdgpu_cs_parser *p, union drm_amdgpu_cs
 	if (ret)
 		goto free_all_kdata;
 
+	ret = drm_sched_job_init(&p->job->base, p->entity, &fpriv->vm);
+	if (ret)
+		goto free_all_kdata;
+
 	if (p->ctx->vram_lost_counter != p->job->vram_lost_counter) {
 		ret = -ECANCELED;
 		goto free_all_kdata;
@@ -258,941 +304,864 @@ static int amdgpu_cs_parser_init(struct amdgpu_cs_parser *p, union drm_amdgpu_cs
 	return ret;
 }
 
-/* Convert microseconds to bytes. */
-static u64 us_to_bytes(struct amdgpu_device *adev, s64 us)
+static int amdgpu_cs_p2_ib(struct amdgpu_cs_parser *p,
+			   struct amdgpu_cs_chunk *chunk,
+			   unsigned int *num_ibs,
+			   unsigned int *ce_preempt,
+			   unsigned int *de_preempt)
 {
-	if (us <= 0 || !adev->mm_stats.log2_max_MBps)
-		return 0;
+	struct amdgpu_ring *ring = to_amdgpu_ring(p->job->base.sched);
+	struct drm_amdgpu_cs_chunk_ib *chunk_ib = chunk->kdata;
+	struct amdgpu_fpriv *fpriv = p->filp->driver_priv;
+	struct amdgpu_ib *ib = &p->job->ibs[*num_ibs];
+	struct amdgpu_vm *vm = &fpriv->vm;
+	int r;
 
-	/* Since accum_us is incremented by a million per second, just
-	 * multiply it by the number of MB/s to get the number of bytes.
-	 */
-	return us << adev->mm_stats.log2_max_MBps;
-}
 
-static s64 bytes_to_us(struct amdgpu_device *adev, u64 bytes)
-{
-	if (!adev->mm_stats.log2_max_MBps)
-		return 0;
+	/* MM engine doesn't support user fences */
+	if (p->job->uf_addr && ring->funcs->no_user_fence)
+		return -EINVAL;
 
-	return bytes >> adev->mm_stats.log2_max_MBps;
-}
+	if (chunk_ib->ip_type == AMDGPU_HW_IP_GFX &&
+	    chunk_ib->flags & AMDGPU_IB_FLAG_PREEMPT &&
+	    (amdgpu_mcbp || amdgpu_sriov_vf(p->adev))) {
+		if (chunk_ib->flags & AMDGPU_IB_FLAG_CE)
+			(*ce_preempt)++;
+		else
+			(*de_preempt)++;
 
-/* Returns how many bytes TTM can move right now. If no bytes can be moved,
- * it returns 0. If it returns non-zero, it's OK to move at least one buffer,
- * which means it can go over the threshold once. If that happens, the driver
- * will be in debt and no other buffer migrations can be done until that debt
- * is repaid.
- *
- * This approach allows moving a buffer of any size (it's important to allow
- * that).
- *
- * The currency is simply time in microseconds and it increases as the clock
- * ticks. The accumulated microseconds (us) are converted to bytes and
- * returned.
- */
-static void amdgpu_cs_get_threshold_for_moves(struct amdgpu_device *adev,
-					      u64 *max_bytes,
-					      u64 *max_vis_bytes)
-{
-	s64 time_us, increment_us;
-	u64 free_vram, total_vram, used_vram;
-	/* Allow a maximum of 200 accumulated ms. This is basically per-IB
-	 * throttling.
-	 *
-	 * It means that in order to get full max MBps, at least 5 IBs per
-	 * second must be submitted and not more than 200ms apart from each
-	 * other.
-	 */
-	const s64 us_upper_bound = 200000;
+		/* Each GFX command submit allows only 1 IB max
+		 * preemptible for CE & DE */
+		if (*ce_preempt > 1 || *de_preempt > 1)
+			return -EINVAL;
+	}
 
-	if (!adev->mm_stats.log2_max_MBps) {
-		*max_bytes = 0;
-		*max_vis_bytes = 0;
-		return;
+	if (chunk_ib->flags & AMDGPU_IB_FLAG_PREAMBLE)
+		p->job->preamble_status |= AMDGPU_PREAMBLE_IB_PRESENT;
+
+	r =  amdgpu_ib_get(p->adev, vm, ring->funcs->parse_cs ?
+			   chunk_ib->ib_bytes : 0,
+			   AMDGPU_IB_POOL_DELAYED, ib);
+	if (r) {
+		DRM_ERROR("Failed to get ib !\n");
+		return r;
 	}
 
-	total_vram = adev->gmc.real_vram_size - atomic64_read(&adev->vram_pin_size);
-	used_vram = ttm_resource_manager_usage(&adev->mman.vram_mgr.manager);
-	free_vram = used_vram >= total_vram ? 0 : total_vram - used_vram;
+	ib->gpu_addr = chunk_ib->va_start;
+	ib->length_dw = chunk_ib->ib_bytes / 4;
+	ib->flags = chunk_ib->flags;
 
-	spin_lock(&adev->mm_stats.lock);
+	(*num_ibs)++;
+	return 0;
+}
 
-	/* Increase the amount of accumulated us. */
-	time_us = ktime_to_us(ktime_get());
-	increment_us = time_us - adev->mm_stats.last_update_us;
-	adev->mm_stats.last_update_us = time_us;
-	adev->mm_stats.accum_us = min(adev->mm_stats.accum_us + increment_us,
-				      us_upper_bound);
+static int amdgpu_cs_p2_dependencies(struct amdgpu_cs_parser *p,
+				     struct amdgpu_cs_chunk *chunk)
+{
+	struct drm_amdgpu_cs_chunk_dep *deps = chunk->kdata;
+	struct amdgpu_fpriv *fpriv = p->filp->driver_priv;
+	unsigned num_deps;
+	int i, r;
 
-	/* This prevents the short period of low performance when the VRAM
-	 * usage is low and the driver is in debt or doesn't have enough
-	 * accumulated us to fill VRAM quickly.
-	 *
-	 * The situation can occur in these cases:
-	 * - a lot of VRAM is freed by userspace
-	 * - the presence of a big buffer causes a lot of evictions
-	 *   (solution: split buffers into smaller ones)
-	 *
-	 * If 128 MB or 1/8th of VRAM is free, start filling it now by setting
-	 * accum_us to a positive number.
-	 */
-	if (free_vram >= 128 * 1024 * 1024 || free_vram >= total_vram / 8) {
-		s64 min_us;
+	num_deps = chunk->length_dw * 4 /
+		sizeof(struct drm_amdgpu_cs_chunk_dep);
 
-		/* Be more aggressive on dGPUs. Try to fill a portion of free
-		 * VRAM now.
-		 */
-		if (!(adev->flags & AMD_IS_APU))
-			min_us = bytes_to_us(adev, free_vram / 4);
-		else
-			min_us = 0; /* Reset accum_us on APUs. */
+	for (i = 0; i < num_deps; ++i) {
+		struct amdgpu_ctx *ctx;
+		struct drm_sched_entity *entity;
+		struct dma_fence *fence;
 
-		adev->mm_stats.accum_us = max(min_us, adev->mm_stats.accum_us);
-	}
+		ctx = amdgpu_ctx_get(fpriv, deps[i].ctx_id);
+		if (ctx == NULL)
+			return -EINVAL;
 
-	/* This is set to 0 if the driver is in debt to disallow (optional)
-	 * buffer moves.
-	 */
-	*max_bytes = us_to_bytes(adev, adev->mm_stats.accum_us);
+		r = amdgpu_ctx_get_entity(ctx, deps[i].ip_type,
+					  deps[i].ip_instance,
+					  deps[i].ring, &entity);
+		if (r) {
+			amdgpu_ctx_put(ctx);
+			return r;
+		}
 
-	/* Do the same for visible VRAM if half of it is free */
-	if (!amdgpu_gmc_vram_full_visible(&adev->gmc)) {
-		u64 total_vis_vram = adev->gmc.visible_vram_size;
-		u64 used_vis_vram =
-		  amdgpu_vram_mgr_vis_usage(&adev->mman.vram_mgr);
+		fence = amdgpu_ctx_get_fence(ctx, entity, deps[i].handle);
+		amdgpu_ctx_put(ctx);
 
-		if (used_vis_vram < total_vis_vram) {
-			u64 free_vis_vram = total_vis_vram - used_vis_vram;
-			adev->mm_stats.accum_us_vis = min(adev->mm_stats.accum_us_vis +
-							  increment_us, us_upper_bound);
+		if (IS_ERR(fence))
+			return PTR_ERR(fence);
+		else if (!fence)
+			continue;
 
-			if (free_vis_vram >= total_vis_vram / 2)
-				adev->mm_stats.accum_us_vis =
-					max(bytes_to_us(adev, free_vis_vram / 2),
-					    adev->mm_stats.accum_us_vis);
+		if (chunk->chunk_id == AMDGPU_CHUNK_ID_SCHEDULED_DEPENDENCIES) {
+			struct drm_sched_fence *s_fence;
+			struct dma_fence *old = fence;
+
+			s_fence = to_drm_sched_fence(fence);
+			fence = dma_fence_get(&s_fence->scheduled);
+			dma_fence_put(old);
 		}
 
-		*max_vis_bytes = us_to_bytes(adev, adev->mm_stats.accum_us_vis);
-	} else {
-		*max_vis_bytes = 0;
+		r = amdgpu_sync_fence(&p->job->sync, fence);
+		dma_fence_put(fence);
+		if (r)
+			return r;
 	}
+	return 0;
+}
 
-	spin_unlock(&adev->mm_stats.lock);
+static int amdgpu_syncobj_lookup_and_add(struct amdgpu_cs_parser *p,
+					 uint32_t handle, u64 point,
+					 u64 flags)
+{
+	struct dma_fence *fence;
+	int r;
+
+	r = drm_syncobj_find_fence(p->filp, handle, point, flags, &fence);
+	if (r) {
+		DRM_ERROR("syncobj %u failed to find fence @ %llu (%d)!\n",
+			  handle, point, r);
+		return r;
+	}
+
+	r = amdgpu_sync_fence(&p->job->sync, fence);
+	dma_fence_put(fence);
+
+	return r;
 }
 
-/* Report how many bytes have really been moved for the last command
- * submission. This can result in a debt that can stop buffer migrations
- * temporarily.
- */
-void amdgpu_cs_report_moved_bytes(struct amdgpu_device *adev, u64 num_bytes,
-				  u64 num_vis_bytes)
+static int amdgpu_cs_p2_syncobj_in(struct amdgpu_cs_parser *p,
+				   struct amdgpu_cs_chunk *chunk)
 {
-	spin_lock(&adev->mm_stats.lock);
-	adev->mm_stats.accum_us -= bytes_to_us(adev, num_bytes);
-	adev->mm_stats.accum_us_vis -= bytes_to_us(adev, num_vis_bytes);
-	spin_unlock(&adev->mm_stats.lock);
+	struct drm_amdgpu_cs_chunk_sem *deps = chunk->kdata;
+	unsigned num_deps;
+	int i, r;
+
+	num_deps = chunk->length_dw * 4 /
+		sizeof(struct drm_amdgpu_cs_chunk_sem);
+	for (i = 0; i < num_deps; ++i) {
+		r = amdgpu_syncobj_lookup_and_add(p, deps[i].handle, 0, 0);
+		if (r)
+			return r;
+	}
+
+	return 0;
 }
 
-static int amdgpu_cs_bo_validate(void *param, struct amdgpu_bo *bo)
+static int amdgpu_cs_p2_syncobj_timeline_wait(struct amdgpu_cs_parser *p,
+					      struct amdgpu_cs_chunk *chunk)
 {
-	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
-	struct amdgpu_cs_parser *p = param;
-	struct ttm_operation_ctx ctx = {
-		.interruptible = true,
-		.no_wait_gpu = false,
-		.resv = bo->tbo.base.resv
-	};
-	uint32_t domain;
-	int r;
+	struct drm_amdgpu_cs_chunk_syncobj *syncobj_deps = chunk->kdata;
+	unsigned num_deps;
+	int i, r;
 
-	if (bo->tbo.pin_count)
-		return 0;
+	num_deps = chunk->length_dw * 4 /
+		sizeof(struct drm_amdgpu_cs_chunk_syncobj);
+	for (i = 0; i < num_deps; ++i) {
+		r = amdgpu_syncobj_lookup_and_add(p, syncobj_deps[i].handle,
+						  syncobj_deps[i].point,
+						  syncobj_deps[i].flags);
+		if (r)
+			return r;
+	}
 
-	/* Don't move this buffer if we have depleted our allowance
-	 * to move it. Don't move anything if the threshold is zero.
-	 */
-	if (p->bytes_moved < p->bytes_moved_threshold &&
-	    (!bo->tbo.base.dma_buf ||
-	    list_empty(&bo->tbo.base.dma_buf->attachments))) {
-		if (!amdgpu_gmc_vram_full_visible(&adev->gmc) &&
-		    (bo->flags & AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED)) {
-			/* And don't move a CPU_ACCESS_REQUIRED BO to limited
-			 * visible VRAM if we've depleted our allowance to do
-			 * that.
-			 */
-			if (p->bytes_moved_vis < p->bytes_moved_vis_threshold)
-				domain = bo->preferred_domains;
-			else
-				domain = bo->allowed_domains;
-		} else {
-			domain = bo->preferred_domains;
-		}
-	} else {
-		domain = bo->allowed_domains;
-	}
-
-retry:
-	amdgpu_bo_placement_from_domain(bo, domain);
-	r = ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
-
-	p->bytes_moved += ctx.bytes_moved;
-	if (!amdgpu_gmc_vram_full_visible(&adev->gmc) &&
-	    amdgpu_bo_in_cpu_visible_vram(bo))
-		p->bytes_moved_vis += ctx.bytes_moved;
-
-	if (unlikely(r == -ENOMEM) && domain != bo->allowed_domains) {
-		domain = bo->allowed_domains;
-		goto retry;
-	}
-
-	return r;
+	return 0;
 }
 
-static int amdgpu_cs_list_validate(struct amdgpu_cs_parser *p,
-			    struct list_head *validated)
+static int amdgpu_cs_p2_syncobj_out(struct amdgpu_cs_parser *p,
+				    struct amdgpu_cs_chunk *chunk)
 {
-	struct ttm_operation_ctx ctx = { true, false };
-	struct amdgpu_bo_list_entry *lobj;
-	int r;
+	struct drm_amdgpu_cs_chunk_sem *deps = chunk->kdata;
+	unsigned num_deps;
+	int i;
 
-	list_for_each_entry(lobj, validated, tv.head) {
-		struct amdgpu_bo *bo = ttm_to_amdgpu_bo(lobj->tv.bo);
-		struct mm_struct *usermm;
+	num_deps = chunk->length_dw * 4 /
+		sizeof(struct drm_amdgpu_cs_chunk_sem);
 
-		usermm = amdgpu_ttm_tt_get_usermm(bo->tbo.ttm);
-		if (usermm && usermm != current->mm)
-			return -EPERM;
+	if (p->post_deps)
+		return -EINVAL;
 
-		if (amdgpu_ttm_tt_is_userptr(bo->tbo.ttm) &&
-		    lobj->user_invalidated && lobj->user_pages) {
-			amdgpu_bo_placement_from_domain(bo,
-							AMDGPU_GEM_DOMAIN_CPU);
-			r = ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
-			if (r)
-				return r;
+	p->post_deps = kmalloc_array(num_deps, sizeof(*p->post_deps),
+				     GFP_KERNEL);
+	p->num_post_deps = 0;
 
-			amdgpu_ttm_tt_set_user_pages(bo->tbo.ttm,
-						     lobj->user_pages);
-		}
+	if (!p->post_deps)
+		return -ENOMEM;
 
-		r = amdgpu_cs_bo_validate(p, bo);
-		if (r)
-			return r;
 
-		kvfree(lobj->user_pages);
-		lobj->user_pages = NULL;
+	for (i = 0; i < num_deps; ++i) {
+		p->post_deps[i].syncobj =
+			drm_syncobj_find(p->filp, deps[i].handle);
+		if (!p->post_deps[i].syncobj)
+			return -EINVAL;
+		p->post_deps[i].chain = NULL;
+		p->post_deps[i].point = 0;
+		p->num_post_deps++;
 	}
+
 	return 0;
 }
 
-static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
-				union drm_amdgpu_cs *cs)
+static int amdgpu_cs_p2_syncobj_timeline_signal(struct amdgpu_cs_parser *p,
+						struct amdgpu_cs_chunk *chunk)
 {
-	struct amdgpu_fpriv *fpriv = p->filp->driver_priv;
-	struct amdgpu_vm *vm = &fpriv->vm;
-	struct amdgpu_bo_list_entry *e;
-	struct list_head duplicates;
-	struct amdgpu_bo *gds;
-	struct amdgpu_bo *gws;
-	struct amdgpu_bo *oa;
-	int r;
-
-	INIT_LIST_HEAD(&p->validated);
-
-	/* p->bo_list could already be assigned if AMDGPU_CHUNK_ID_BO_HANDLES is present */
-	if (cs->in.bo_list_handle) {
-		if (p->bo_list)
-			return -EINVAL;
-
-		r = amdgpu_bo_list_get(fpriv, cs->in.bo_list_handle,
-				       &p->bo_list);
-		if (r)
-			return r;
-	} else if (!p->bo_list) {
-		/* Create a empty bo_list when no handle is provided */
-		r = amdgpu_bo_list_create(p->adev, p->filp, NULL, 0,
-					  &p->bo_list);
-		if (r)
-			return r;
-	}
-
-	mutex_lock(&p->bo_list->bo_list_mutex);
-
-	/* One for TTM and one for the CS job */
-	amdgpu_bo_list_for_each_entry(e, p->bo_list)
-		e->tv.num_shared = 2;
+	struct drm_amdgpu_cs_chunk_syncobj *syncobj_deps = chunk->kdata;
+	unsigned num_deps;
+	int i;
 
-	amdgpu_bo_list_get_list(p->bo_list, &p->validated);
+	num_deps = chunk->length_dw * 4 /
+		sizeof(struct drm_amdgpu_cs_chunk_syncobj);
 
-	INIT_LIST_HEAD(&duplicates);
-	amdgpu_vm_get_pd_bo(&fpriv->vm, &p->validated, &p->vm_pd);
+	if (p->post_deps)
+		return -EINVAL;
 
-	if (p->uf_entry.tv.bo && !ttm_to_amdgpu_bo(p->uf_entry.tv.bo)->parent)
-		list_add(&p->uf_entry.tv.head, &p->validated);
+	p->post_deps = kmalloc_array(num_deps, sizeof(*p->post_deps),
+				     GFP_KERNEL);
+	p->num_post_deps = 0;
 
-	/* Get userptr backing pages. If pages are updated after registered
-	 * in amdgpu_gem_userptr_ioctl(), amdgpu_cs_list_validate() will do
-	 * amdgpu_ttm_backend_bind() to flush and invalidate new pages
-	 */
-	amdgpu_bo_list_for_each_userptr_entry(e, p->bo_list) {
-		struct amdgpu_bo *bo = ttm_to_amdgpu_bo(e->tv.bo);
-		bool userpage_invalidated = false;
-		int i;
+	if (!p->post_deps)
+		return -ENOMEM;
 
-		e->user_pages = kvmalloc_array(bo->tbo.ttm->num_pages,
-					sizeof(struct page *),
-					GFP_KERNEL | __GFP_ZERO);
-		if (!e->user_pages) {
-			DRM_ERROR("kvmalloc_array failure\n");
-			r = -ENOMEM;
-			goto out_free_user_pages;
-		}
+	for (i = 0; i < num_deps; ++i) {
+		struct amdgpu_cs_post_dep *dep = &p->post_deps[i];
 
-		r = amdgpu_ttm_tt_get_user_pages(bo, e->user_pages);
-		if (r) {
-			kvfree(e->user_pages);
-			e->user_pages = NULL;
-			goto out_free_user_pages;
+		dep->chain = NULL;
+		if (syncobj_deps[i].point) {
+			dep->chain = dma_fence_chain_alloc();
+			if (!dep->chain)
+				return -ENOMEM;
 		}
 
-		for (i = 0; i < bo->tbo.ttm->num_pages; i++) {
-			if (bo->tbo.ttm->pages[i] != e->user_pages[i]) {
-				userpage_invalidated = true;
-				break;
-			}
+		dep->syncobj = drm_syncobj_find(p->filp,
+						syncobj_deps[i].handle);
+		if (!dep->syncobj) {
+			dma_fence_chain_free(dep->chain);
+			return -EINVAL;
 		}
-		e->user_invalidated = userpage_invalidated;
-	}
-
-	r = ttm_eu_reserve_buffers(&p->ticket, &p->validated, true,
-				   &duplicates);
-	if (unlikely(r != 0)) {
-		if (r != -ERESTARTSYS)
-			DRM_ERROR("ttm_eu_reserve_buffers failed.\n");
-		goto out_free_user_pages;
-	}
-
-	amdgpu_bo_list_for_each_entry(e, p->bo_list) {
-		struct amdgpu_bo *bo = ttm_to_amdgpu_bo(e->tv.bo);
-
-		e->bo_va = amdgpu_vm_bo_find(vm, bo);
-	}
-
-	/* Move fence waiting after getting reservation lock of
-	 * PD root. Then there is no need on a ctx mutex lock.
-	 */
-	r = amdgpu_ctx_wait_prev_fence(p->ctx, p->entity);
-	if (unlikely(r != 0)) {
-		if (r != -ERESTARTSYS)
-			DRM_ERROR("amdgpu_ctx_wait_prev_fence failed.\n");
-		goto error_validate;
-	}
-
-	amdgpu_cs_get_threshold_for_moves(p->adev, &p->bytes_moved_threshold,
-					  &p->bytes_moved_vis_threshold);
-	p->bytes_moved = 0;
-	p->bytes_moved_vis = 0;
-
-	r = amdgpu_vm_validate_pt_bos(p->adev, &fpriv->vm,
-				      amdgpu_cs_bo_validate, p);
-	if (r) {
-		DRM_ERROR("amdgpu_vm_validate_pt_bos() failed.\n");
-		goto error_validate;
+		dep->point = syncobj_deps[i].point;
+		p->num_post_deps++;
 	}
 
-	r = amdgpu_cs_list_validate(p, &duplicates);
-	if (r)
-		goto error_validate;
-
-	r = amdgpu_cs_list_validate(p, &p->validated);
-	if (r)
-		goto error_validate;
-
-	amdgpu_cs_report_moved_bytes(p->adev, p->bytes_moved,
-				     p->bytes_moved_vis);
+	return 0;
+}
 
-	gds = p->bo_list->gds_obj;
-	gws = p->bo_list->gws_obj;
-	oa = p->bo_list->oa_obj;
+static int amdgpu_cs_pass2(struct amdgpu_cs_parser *p)
+{
+	unsigned int num_ibs = 0, ce_preempt = 0, de_preempt = 0;
+	int i, r;
 
-	if (gds) {
-		p->job->gds_base = amdgpu_bo_gpu_offset(gds) >> PAGE_SHIFT;
-		p->job->gds_size = amdgpu_bo_size(gds) >> PAGE_SHIFT;
-	}
-	if (gws) {
-		p->job->gws_base = amdgpu_bo_gpu_offset(gws) >> PAGE_SHIFT;
-		p->job->gws_size = amdgpu_bo_size(gws) >> PAGE_SHIFT;
-	}
-	if (oa) {
-		p->job->oa_base = amdgpu_bo_gpu_offset(oa) >> PAGE_SHIFT;
-		p->job->oa_size = amdgpu_bo_size(oa) >> PAGE_SHIFT;
-	}
+	for (i = 0; i < p->nchunks; ++i) {
+		struct amdgpu_cs_chunk *chunk;
 
-	if (!r && p->uf_entry.tv.bo) {
-		struct amdgpu_bo *uf = ttm_to_amdgpu_bo(p->uf_entry.tv.bo);
+		chunk = &p->chunks[i];
 
-		r = amdgpu_ttm_alloc_gart(&uf->tbo);
-		p->job->uf_addr += amdgpu_bo_gpu_offset(uf);
+		switch (chunk->chunk_id) {
+		case AMDGPU_CHUNK_ID_IB:
+			r = amdgpu_cs_p2_ib(p, chunk, &num_ibs,
+					    &ce_preempt, &de_preempt);
+			if (r)
+				return r;
+			break;
+		case AMDGPU_CHUNK_ID_DEPENDENCIES:
+		case AMDGPU_CHUNK_ID_SCHEDULED_DEPENDENCIES:
+			r = amdgpu_cs_p2_dependencies(p, chunk);
+			if (r)
+				return r;
+			break;
+		case AMDGPU_CHUNK_ID_SYNCOBJ_IN:
+			r = amdgpu_cs_p2_syncobj_in(p, chunk);
+			if (r)
+				return r;
+			break;
+		case AMDGPU_CHUNK_ID_SYNCOBJ_OUT:
+			r = amdgpu_cs_p2_syncobj_out(p, chunk);
+			if (r)
+				return r;
+			break;
+		case AMDGPU_CHUNK_ID_SYNCOBJ_TIMELINE_WAIT:
+			r = amdgpu_cs_p2_syncobj_timeline_wait(p, chunk);
+			if (r)
+				return r;
+			break;
+		case AMDGPU_CHUNK_ID_SYNCOBJ_TIMELINE_SIGNAL:
+			r = amdgpu_cs_p2_syncobj_timeline_signal(p, chunk);
+			if (r)
+				return r;
+			break;
+		}
 	}
 
-error_validate:
-	if (r)
-		ttm_eu_backoff_reservation(&p->ticket, &p->validated);
+	return 0;
+}
 
-out_free_user_pages:
-	if (r) {
-		amdgpu_bo_list_for_each_userptr_entry(e, p->bo_list) {
-			struct amdgpu_bo *bo = ttm_to_amdgpu_bo(e->tv.bo);
+/* Convert microseconds to bytes. */
+static u64 us_to_bytes(struct amdgpu_device *adev, s64 us)
+{
+	if (us <= 0 || !adev->mm_stats.log2_max_MBps)
+		return 0;
 
-			if (!e->user_pages)
-				continue;
-			amdgpu_ttm_tt_get_user_pages_done(bo->tbo.ttm);
-			kvfree(e->user_pages);
-			e->user_pages = NULL;
-		}
-		mutex_unlock(&p->bo_list->bo_list_mutex);
-	}
-	return r;
+	/* Since accum_us is incremented by a million per second, just
+	 * multiply it by the number of MB/s to get the number of bytes.
+	 */
+	return us << adev->mm_stats.log2_max_MBps;
 }
 
-static int amdgpu_cs_sync_rings(struct amdgpu_cs_parser *p)
+static s64 bytes_to_us(struct amdgpu_device *adev, u64 bytes)
 {
-	struct amdgpu_fpriv *fpriv = p->filp->driver_priv;
-	struct amdgpu_bo_list_entry *e;
-	int r;
-
-	list_for_each_entry(e, &p->validated, tv.head) {
-		struct amdgpu_bo *bo = ttm_to_amdgpu_bo(e->tv.bo);
-		struct dma_resv *resv = bo->tbo.base.resv;
-		enum amdgpu_sync_mode sync_mode;
+	if (!adev->mm_stats.log2_max_MBps)
+		return 0;
 
-		sync_mode = amdgpu_bo_explicit_sync(bo) ?
-			AMDGPU_SYNC_EXPLICIT : AMDGPU_SYNC_NE_OWNER;
-		r = amdgpu_sync_resv(p->adev, &p->job->sync, resv, sync_mode,
-				     &fpriv->vm);
-		if (r)
-			return r;
-	}
-	return 0;
+	return bytes >> adev->mm_stats.log2_max_MBps;
 }
 
-/**
- * amdgpu_cs_parser_fini() - clean parser states
- * @parser:	parser structure holding parsing context.
- * @error:	error number
- * @backoff:	indicator to backoff the reservation
+/* Returns how many bytes TTM can move right now. If no bytes can be moved,
+ * it returns 0. If it returns non-zero, it's OK to move at least one buffer,
+ * which means it can go over the threshold once. If that happens, the driver
+ * will be in debt and no other buffer migrations can be done until that debt
+ * is repaid.
  *
- * If error is set then unvalidate buffer, otherwise just free memory
- * used by parsing context.
- **/
-static void amdgpu_cs_parser_fini(struct amdgpu_cs_parser *parser, int error,
-				  bool backoff)
+ * This approach allows moving a buffer of any size (it's important to allow
+ * that).
+ *
+ * The currency is simply time in microseconds and it increases as the clock
+ * ticks. The accumulated microseconds (us) are converted to bytes and
+ * returned.
+ */
+static void amdgpu_cs_get_threshold_for_moves(struct amdgpu_device *adev,
+					      u64 *max_bytes,
+					      u64 *max_vis_bytes)
 {
-	unsigned i;
-
-	if (error && backoff) {
-		ttm_eu_backoff_reservation(&parser->ticket,
-					   &parser->validated);
-		mutex_unlock(&parser->bo_list->bo_list_mutex);
-	}
+	s64 time_us, increment_us;
+	u64 free_vram, total_vram, used_vram;
+	/* Allow a maximum of 200 accumulated ms. This is basically per-IB
+	 * throttling.
+	 *
+	 * It means that in order to get full max MBps, at least 5 IBs per
+	 * second must be submitted and not more than 200ms apart from each
+	 * other.
+	 */
+	const s64 us_upper_bound = 200000;
 
-	for (i = 0; i < parser->num_post_deps; i++) {
-		drm_syncobj_put(parser->post_deps[i].syncobj);
-		kfree(parser->post_deps[i].chain);
+	if (!adev->mm_stats.log2_max_MBps) {
+		*max_bytes = 0;
+		*max_vis_bytes = 0;
+		return;
 	}
-	kfree(parser->post_deps);
-
-	dma_fence_put(parser->fence);
 
-	if (parser->ctx) {
-		amdgpu_ctx_put(parser->ctx);
-	}
-	if (parser->bo_list)
-		amdgpu_bo_list_put(parser->bo_list);
+	total_vram = adev->gmc.real_vram_size -
+		atomic64_read(&adev->vram_pin_size);
+	used_vram = ttm_resource_manager_usage(&adev->mman.vram_mgr.manager);
+	free_vram = used_vram >= total_vram ? 0 : total_vram - used_vram;
 
-	for (i = 0; i < parser->nchunks; i++)
-		kvfree(parser->chunks[i].kdata);
-	kvfree(parser->chunks);
-	if (parser->job)
-		amdgpu_job_free(parser->job);
-	if (parser->uf_entry.tv.bo) {
-		struct amdgpu_bo *uf = ttm_to_amdgpu_bo(parser->uf_entry.tv.bo);
+	spin_lock(&adev->mm_stats.lock);
 
-		amdgpu_bo_unref(&uf);
-	}
-}
+	/* Increase the amount of accumulated us. */
+	time_us = ktime_to_us(ktime_get());
+	increment_us = time_us - adev->mm_stats.last_update_us;
+	adev->mm_stats.last_update_us = time_us;
+	adev->mm_stats.accum_us = min(adev->mm_stats.accum_us + increment_us,
+				      us_upper_bound);
 
-static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
-{
-	struct amdgpu_ring *ring = to_amdgpu_ring(p->entity->rq->sched);
-	struct amdgpu_fpriv *fpriv = p->filp->driver_priv;
-	struct amdgpu_device *adev = p->adev;
-	struct amdgpu_vm *vm = &fpriv->vm;
-	struct amdgpu_bo_list_entry *e;
-	struct amdgpu_bo_va *bo_va;
-	struct amdgpu_bo *bo;
-	int r;
+	/* This prevents the short period of low performance when the VRAM
+	 * usage is low and the driver is in debt or doesn't have enough
+	 * accumulated us to fill VRAM quickly.
+	 *
+	 * The situation can occur in these cases:
+	 * - a lot of VRAM is freed by userspace
+	 * - the presence of a big buffer causes a lot of evictions
+	 *   (solution: split buffers into smaller ones)
+	 *
+	 * If 128 MB or 1/8th of VRAM is free, start filling it now by setting
+	 * accum_us to a positive number.
+	 */
+	if (free_vram >= 128 * 1024 * 1024 || free_vram >= total_vram / 8) {
+		s64 min_us;
 
-	/* Only for UVD/VCE VM emulation */
-	if (ring->funcs->parse_cs || ring->funcs->patch_cs_in_place) {
-		unsigned i, j;
-
-		for (i = 0, j = 0; i < p->nchunks && j < p->job->num_ibs; i++) {
-			struct drm_amdgpu_cs_chunk_ib *chunk_ib;
-			struct amdgpu_bo_va_mapping *m;
-			struct amdgpu_bo *aobj = NULL;
-			struct amdgpu_cs_chunk *chunk;
-			uint64_t offset, va_start;
-			struct amdgpu_ib *ib;
-			uint8_t *kptr;
-
-			chunk = &p->chunks[i];
-			ib = &p->job->ibs[j];
-			chunk_ib = chunk->kdata;
-
-			if (chunk->chunk_id != AMDGPU_CHUNK_ID_IB)
-				continue;
+		/* Be more aggresive on dGPUs. Try to fill a portion of free
+		 * VRAM now.
+		 */
+		if (!(adev->flags & AMD_IS_APU))
+			min_us = bytes_to_us(adev, free_vram / 4);
+		else
+			min_us = 0; /* Reset accum_us on APUs. */
 
-			va_start = chunk_ib->va_start & AMDGPU_GMC_HOLE_MASK;
-			r = amdgpu_cs_find_mapping(p, va_start, &aobj, &m);
-			if (r) {
-				DRM_ERROR("IB va_start is invalid\n");
-				return r;
-			}
+		adev->mm_stats.accum_us = max(min_us, adev->mm_stats.accum_us);
+	}
 
-			if ((va_start + chunk_ib->ib_bytes) >
-			    (m->last + 1) * AMDGPU_GPU_PAGE_SIZE) {
-				DRM_ERROR("IB va_start+ib_bytes is invalid\n");
-				return -EINVAL;
-			}
+	/* This is set to 0 if the driver is in debt to disallow (optional)
+	 * buffer moves.
+	 */
+	*max_bytes = us_to_bytes(adev, adev->mm_stats.accum_us);
 
-			/* the IB should be reserved at this point */
-			r = amdgpu_bo_kmap(aobj, (void **)&kptr);
-			if (r) {
-				return r;
-			}
+	/* Do the same for visible VRAM if half of it is free */
+	if (!amdgpu_gmc_vram_full_visible(&adev->gmc)) {
+		u64 total_vis_vram = adev->gmc.visible_vram_size;
+		u64 used_vis_vram =
+		  amdgpu_vram_mgr_vis_usage(&adev->mman.vram_mgr);
 
-			offset = m->start * AMDGPU_GPU_PAGE_SIZE;
-			kptr += va_start - offset;
-
-			if (ring->funcs->parse_cs) {
-				memcpy(ib->ptr, kptr, chunk_ib->ib_bytes);
-				amdgpu_bo_kunmap(aobj);
-
-				r = amdgpu_ring_parse_cs(ring, p, p->job, ib);
-				if (r)
-					return r;
-			} else {
-				ib->ptr = (uint32_t *)kptr;
-				r = amdgpu_ring_patch_cs_in_place(ring, p, p->job, ib);
-				amdgpu_bo_kunmap(aobj);
-				if (r)
-					return r;
-			}
+		if (used_vis_vram < total_vis_vram) {
+			u64 free_vis_vram = total_vis_vram - used_vis_vram;
+			adev->mm_stats.accum_us_vis =
+				min(adev->mm_stats.accum_us_vis +
+				    increment_us, us_upper_bound);
 
-			j++;
+			if (free_vis_vram >= total_vis_vram / 2)
+				adev->mm_stats.accum_us_vis =
+					max(bytes_to_us(adev, free_vis_vram / 2),
+					    adev->mm_stats.accum_us_vis);
 		}
-	}
-
-	if (!p->job->vm)
-		return amdgpu_cs_sync_rings(p);
 
+		*max_vis_bytes = us_to_bytes(adev, adev->mm_stats.accum_us_vis);
+	} else {
+		*max_vis_bytes = 0;
+	}
 
-	r = amdgpu_vm_clear_freed(adev, vm, NULL);
-	if (r)
-		return r;
-
-	r = amdgpu_vm_bo_update(adev, fpriv->prt_va, false);
-	if (r)
-		return r;
+	spin_unlock(&adev->mm_stats.lock);
+}
 
-	r = amdgpu_sync_fence(&p->job->sync, fpriv->prt_va->last_pt_update);
-	if (r)
-		return r;
+/* Report how many bytes have really been moved for the last command
+ * submission. This can result in a debt that can stop buffer migrations
+ * temporarily.
+ */
+void amdgpu_cs_report_moved_bytes(struct amdgpu_device *adev, u64 num_bytes,
+				  u64 num_vis_bytes)
+{
+	spin_lock(&adev->mm_stats.lock);
+	adev->mm_stats.accum_us -= bytes_to_us(adev, num_bytes);
+	adev->mm_stats.accum_us_vis -= bytes_to_us(adev, num_vis_bytes);
+	spin_unlock(&adev->mm_stats.lock);
+}
 
-	if (amdgpu_mcbp || amdgpu_sriov_vf(adev)) {
-		bo_va = fpriv->csa_va;
-		BUG_ON(!bo_va);
-		r = amdgpu_vm_bo_update(adev, bo_va, false);
-		if (r)
-			return r;
+static int amdgpu_cs_bo_validate(void *param, struct amdgpu_bo *bo)
+{
+	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
+	struct amdgpu_cs_parser *p = param;
+	struct ttm_operation_ctx ctx = {
+		.interruptible = true,
+		.no_wait_gpu = false,
+		.resv = bo->tbo.base.resv
+	};
+	uint32_t domain;
+	int r;
 
-		r = amdgpu_sync_fence(&p->job->sync, bo_va->last_pt_update);
-		if (r)
-			return r;
-	}
+	if (bo->tbo.pin_count)
+		return 0;
 
-	amdgpu_bo_list_for_each_entry(e, p->bo_list) {
-		/* ignore duplicates */
-		bo = ttm_to_amdgpu_bo(e->tv.bo);
-		if (!bo)
-			continue;
+	/* Don't move this buffer if we have depleted our allowance
+	 * to move it. Don't move anything if the threshold is zero.
+	 */
+	if (p->bytes_moved < p->bytes_moved_threshold &&
+	    (!bo->tbo.base.dma_buf ||
+	    list_empty(&bo->tbo.base.dma_buf->attachments))) {
+		if (!amdgpu_gmc_vram_full_visible(&adev->gmc) &&
+		    (bo->flags & AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED)) {
+			/* And don't move a CPU_ACCESS_REQUIRED BO to limited
+			 * visible VRAM if we've depleted our allowance to do
+			 * that.
+			 */
+			if (p->bytes_moved_vis < p->bytes_moved_vis_threshold)
+				domain = bo->preferred_domains;
+			else
+				domain = bo->allowed_domains;
+		} else {
+			domain = bo->preferred_domains;
+		}
+	} else {
+		domain = bo->allowed_domains;
+	}
 
-		bo_va = e->bo_va;
-		if (bo_va == NULL)
-			continue;
+retry:
+	amdgpu_bo_placement_from_domain(bo, domain);
+	r = ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
 
-		r = amdgpu_vm_bo_update(adev, bo_va, false);
-		if (r) {
-			mutex_unlock(&p->bo_list->bo_list_mutex);
-			return r;
-		}
+	p->bytes_moved += ctx.bytes_moved;
+	if (!amdgpu_gmc_vram_full_visible(&adev->gmc) &&
+	    amdgpu_bo_in_cpu_visible_vram(bo))
+		p->bytes_moved_vis += ctx.bytes_moved;
 
-		r = amdgpu_sync_fence(&p->job->sync, bo_va->last_pt_update);
-		if (r) {
-			mutex_unlock(&p->bo_list->bo_list_mutex);
-			return r;
-		}
+	if (unlikely(r == -ENOMEM) && domain != bo->allowed_domains) {
+		domain = bo->allowed_domains;
+		goto retry;
 	}
 
-	r = amdgpu_vm_handle_moved(adev, vm);
-	if (r)
-		return r;
-
-	r = amdgpu_vm_update_pdes(adev, vm, false);
-	if (r)
-		return r;
+	return r;
+}
 
-	r = amdgpu_sync_fence(&p->job->sync, vm->last_update);
-	if (r)
-		return r;
+static int amdgpu_cs_list_validate(struct amdgpu_cs_parser *p,
+			    struct list_head *validated)
+{
+	struct ttm_operation_ctx ctx = { true, false };
+	struct amdgpu_bo_list_entry *lobj;
+	int r;
 
-	p->job->vm_pd_addr = amdgpu_gmc_pd_addr(vm->root.bo);
+	list_for_each_entry(lobj, validated, tv.head) {
+		struct amdgpu_bo *bo = ttm_to_amdgpu_bo(lobj->tv.bo);
+		struct mm_struct *usermm;
 
-	if (amdgpu_vm_debug) {
-		/* Invalidate all BOs to test for userspace bugs */
-		amdgpu_bo_list_for_each_entry(e, p->bo_list) {
-			struct amdgpu_bo *bo = ttm_to_amdgpu_bo(e->tv.bo);
+		usermm = amdgpu_ttm_tt_get_usermm(bo->tbo.ttm);
+		if (usermm && usermm != current->mm)
+			return -EPERM;
 
-			/* ignore duplicates */
-			if (!bo)
-				continue;
+		if (amdgpu_ttm_tt_is_userptr(bo->tbo.ttm) &&
+		    lobj->user_invalidated && lobj->user_pages) {
+			amdgpu_bo_placement_from_domain(bo,
+							AMDGPU_GEM_DOMAIN_CPU);
+			r = ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
+			if (r)
+				return r;
 
-			amdgpu_vm_bo_invalidate(adev, bo, false);
+			amdgpu_ttm_tt_set_user_pages(bo->tbo.ttm,
+						     lobj->user_pages);
 		}
-	}
 
-	return amdgpu_cs_sync_rings(p);
+		r = amdgpu_cs_bo_validate(p, bo);
+		if (r)
+			return r;
+
+		kvfree(lobj->user_pages);
+		lobj->user_pages = NULL;
+	}
+	return 0;
 }
 
-static int amdgpu_cs_ib_fill(struct amdgpu_device *adev,
-			     struct amdgpu_cs_parser *parser)
+static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
+				union drm_amdgpu_cs *cs)
 {
-	struct amdgpu_fpriv *fpriv = parser->filp->driver_priv;
+	struct amdgpu_fpriv *fpriv = p->filp->driver_priv;
 	struct amdgpu_vm *vm = &fpriv->vm;
-	int r, ce_preempt = 0, de_preempt = 0;
-	struct amdgpu_ring *ring;
-	int i, j;
+	struct amdgpu_bo_list_entry *e;
+	struct list_head duplicates;
+	struct amdgpu_bo *gds;
+	struct amdgpu_bo *gws;
+	struct amdgpu_bo *oa;
+	int r;
 
-	for (i = 0, j = 0; i < parser->nchunks && j < parser->job->num_ibs; i++) {
-		struct amdgpu_cs_chunk *chunk;
-		struct amdgpu_ib *ib;
-		struct drm_amdgpu_cs_chunk_ib *chunk_ib;
-		struct drm_sched_entity *entity;
+	INIT_LIST_HEAD(&p->validated);
 
-		chunk = &parser->chunks[i];
-		ib = &parser->job->ibs[j];
-		chunk_ib = (struct drm_amdgpu_cs_chunk_ib *)chunk->kdata;
+	/* p->bo_list could already be assigned if AMDGPU_CHUNK_ID_BO_HANDLES is present */
+	if (cs->in.bo_list_handle) {
+		if (p->bo_list)
+			return -EINVAL;
 
-		if (chunk->chunk_id != AMDGPU_CHUNK_ID_IB)
-			continue;
+		r = amdgpu_bo_list_get(fpriv, cs->in.bo_list_handle,
+				       &p->bo_list);
+		if (r)
+			return r;
+	} else if (!p->bo_list) {
+		/* Create a empty bo_list when no handle is provided */
+		r = amdgpu_bo_list_create(p->adev, p->filp, NULL, 0,
+					  &p->bo_list);
+		if (r)
+			return r;
+	}
 
-		if (chunk_ib->ip_type == AMDGPU_HW_IP_GFX &&
-		    (amdgpu_mcbp || amdgpu_sriov_vf(adev))) {
-			if (chunk_ib->flags & AMDGPU_IB_FLAG_PREEMPT) {
-				if (chunk_ib->flags & AMDGPU_IB_FLAG_CE)
-					ce_preempt++;
-				else
-					de_preempt++;
-			}
+	mutex_lock(&p->bo_list->bo_list_mutex);
 
-			/* each GFX command submit allows 0 or 1 IB preemptible for CE & DE */
-			if (ce_preempt > 1 || de_preempt > 1)
-				return -EINVAL;
-		}
+	/* One for TTM and one for the CS job */
+	amdgpu_bo_list_for_each_entry(e, p->bo_list)
+		e->tv.num_shared = 2;
 
-		r = amdgpu_ctx_get_entity(parser->ctx, chunk_ib->ip_type,
-					  chunk_ib->ip_instance, chunk_ib->ring,
-					  &entity);
-		if (r)
-			return r;
+	amdgpu_bo_list_get_list(p->bo_list, &p->validated);
 
-		if (chunk_ib->flags & AMDGPU_IB_FLAG_PREAMBLE)
-			parser->job->preamble_status |=
-				AMDGPU_PREAMBLE_IB_PRESENT;
+	INIT_LIST_HEAD(&duplicates);
+	amdgpu_vm_get_pd_bo(&fpriv->vm, &p->validated, &p->vm_pd);
 
-		if (parser->entity && parser->entity != entity)
-			return -EINVAL;
+	if (p->uf_entry.tv.bo && !ttm_to_amdgpu_bo(p->uf_entry.tv.bo)->parent)
+		list_add(&p->uf_entry.tv.head, &p->validated);
 
-		/* Return if there is no run queue associated with this entity.
-		 * Possibly because of disabled HW IP*/
-		if (entity->rq == NULL)
-			return -EINVAL;
+	/* Get userptr backing pages. If pages are updated after registered
+	 * in amdgpu_gem_userptr_ioctl(), amdgpu_cs_list_validate() will do
+	 * amdgpu_ttm_backend_bind() to flush and invalidate new pages
+	 */
+	amdgpu_bo_list_for_each_userptr_entry(e, p->bo_list) {
+		struct amdgpu_bo *bo = ttm_to_amdgpu_bo(e->tv.bo);
+		bool userpage_invalidated = false;
+		int i;
 
-		parser->entity = entity;
+		e->user_pages = kvmalloc_array(bo->tbo.ttm->num_pages,
+					sizeof(struct page *),
+					GFP_KERNEL | __GFP_ZERO);
+		if (!e->user_pages) {
+			DRM_ERROR("kvmalloc_array failure\n");
+			r = -ENOMEM;
+			goto out_free_user_pages;
+		}
 
-		ring = to_amdgpu_ring(entity->rq->sched);
-		r =  amdgpu_ib_get(adev, vm, ring->funcs->parse_cs ?
-				   chunk_ib->ib_bytes : 0,
-				   AMDGPU_IB_POOL_DELAYED, ib);
+		r = amdgpu_ttm_tt_get_user_pages(bo, e->user_pages);
 		if (r) {
-			DRM_ERROR("Failed to get ib !\n");
-			return r;
+			kvfree(e->user_pages);
+			e->user_pages = NULL;
+			goto out_free_user_pages;
 		}
 
-		ib->gpu_addr = chunk_ib->va_start;
-		ib->length_dw = chunk_ib->ib_bytes / 4;
-		ib->flags = chunk_ib->flags;
+		for (i = 0; i < bo->tbo.ttm->num_pages; i++) {
+			if (bo->tbo.ttm->pages[i] != e->user_pages[i]) {
+				userpage_invalidated = true;
+				break;
+			}
+		}
+		e->user_invalidated = userpage_invalidated;
+	}
 
-		j++;
+	r = ttm_eu_reserve_buffers(&p->ticket, &p->validated, true,
+				   &duplicates);
+	if (unlikely(r != 0)) {
+		if (r != -ERESTARTSYS)
+			DRM_ERROR("ttm_eu_reserve_buffers failed.\n");
+		goto out_free_user_pages;
 	}
 
-	/* MM engine doesn't support user fences */
-	ring = to_amdgpu_ring(parser->entity->rq->sched);
-	if (parser->job->uf_addr && ring->funcs->no_user_fence)
-		return -EINVAL;
+	amdgpu_bo_list_for_each_entry(e, p->bo_list) {
+		struct amdgpu_bo *bo = ttm_to_amdgpu_bo(e->tv.bo);
 
-	return 0;
-}
+		e->bo_va = amdgpu_vm_bo_find(vm, bo);
+	}
 
-static int amdgpu_cs_process_fence_dep(struct amdgpu_cs_parser *p,
-				       struct amdgpu_cs_chunk *chunk)
-{
-	struct amdgpu_fpriv *fpriv = p->filp->driver_priv;
-	unsigned num_deps;
-	int i, r;
-	struct drm_amdgpu_cs_chunk_dep *deps;
+	/* Move fence waiting after getting reservation lock of
+	 * PD root. Then there is no need on a ctx mutex lock.
+	 */
+	r = amdgpu_ctx_wait_prev_fence(p->ctx, p->entity);
+	if (unlikely(r != 0)) {
+		if (r != -ERESTARTSYS)
+			DRM_ERROR("amdgpu_ctx_wait_prev_fence failed.\n");
+		goto error_validate;
+	}
 
-	deps = (struct drm_amdgpu_cs_chunk_dep *)chunk->kdata;
-	num_deps = chunk->length_dw * 4 /
-		sizeof(struct drm_amdgpu_cs_chunk_dep);
+	amdgpu_cs_get_threshold_for_moves(p->adev, &p->bytes_moved_threshold,
+					  &p->bytes_moved_vis_threshold);
+	p->bytes_moved = 0;
+	p->bytes_moved_vis = 0;
 
-	for (i = 0; i < num_deps; ++i) {
-		struct amdgpu_ctx *ctx;
-		struct drm_sched_entity *entity;
-		struct dma_fence *fence;
+	r = amdgpu_vm_validate_pt_bos(p->adev, &fpriv->vm,
+				      amdgpu_cs_bo_validate, p);
+	if (r) {
+		DRM_ERROR("amdgpu_vm_validate_pt_bos() failed.\n");
+		goto error_validate;
+	}
 
-		ctx = amdgpu_ctx_get(fpriv, deps[i].ctx_id);
-		if (ctx == NULL)
-			return -EINVAL;
+	r = amdgpu_cs_list_validate(p, &duplicates);
+	if (r)
+		goto error_validate;
 
-		r = amdgpu_ctx_get_entity(ctx, deps[i].ip_type,
-					  deps[i].ip_instance,
-					  deps[i].ring, &entity);
-		if (r) {
-			amdgpu_ctx_put(ctx);
-			return r;
-		}
+	r = amdgpu_cs_list_validate(p, &p->validated);
+	if (r)
+		goto error_validate;
 
-		fence = amdgpu_ctx_get_fence(ctx, entity, deps[i].handle);
-		amdgpu_ctx_put(ctx);
+	amdgpu_cs_report_moved_bytes(p->adev, p->bytes_moved,
+				     p->bytes_moved_vis);
 
-		if (IS_ERR(fence))
-			return PTR_ERR(fence);
-		else if (!fence)
-			continue;
+	gds = p->bo_list->gds_obj;
+	gws = p->bo_list->gws_obj;
+	oa = p->bo_list->oa_obj;
 
-		if (chunk->chunk_id == AMDGPU_CHUNK_ID_SCHEDULED_DEPENDENCIES) {
-			struct drm_sched_fence *s_fence;
-			struct dma_fence *old = fence;
+	if (gds) {
+		p->job->gds_base = amdgpu_bo_gpu_offset(gds) >> PAGE_SHIFT;
+		p->job->gds_size = amdgpu_bo_size(gds) >> PAGE_SHIFT;
+	}
+	if (gws) {
+		p->job->gws_base = amdgpu_bo_gpu_offset(gws) >> PAGE_SHIFT;
+		p->job->gws_size = amdgpu_bo_size(gws) >> PAGE_SHIFT;
+	}
+	if (oa) {
+		p->job->oa_base = amdgpu_bo_gpu_offset(oa) >> PAGE_SHIFT;
+		p->job->oa_size = amdgpu_bo_size(oa) >> PAGE_SHIFT;
+	}
 
-			s_fence = to_drm_sched_fence(fence);
-			fence = dma_fence_get(&s_fence->scheduled);
-			dma_fence_put(old);
-		}
+	if (p->uf_entry.tv.bo) {
+		struct amdgpu_bo *uf = ttm_to_amdgpu_bo(p->uf_entry.tv.bo);
 
-		r = amdgpu_sync_fence(&p->job->sync, fence);
-		dma_fence_put(fence);
+		r = amdgpu_ttm_alloc_gart(&uf->tbo);
 		if (r)
-			return r;
-	}
-	return 0;
-}
-
-static int amdgpu_syncobj_lookup_and_add_to_sync(struct amdgpu_cs_parser *p,
-						 uint32_t handle, u64 point,
-						 u64 flags)
-{
-	struct dma_fence *fence;
-	int r;
+			goto error_validate;
 
-	r = drm_syncobj_find_fence(p->filp, handle, point, flags, &fence);
-	if (r) {
-		DRM_ERROR("syncobj %u failed to find fence @ %llu (%d)!\n",
-			  handle, point, r);
-		return r;
+		p->job->uf_addr += amdgpu_bo_gpu_offset(uf);
 	}
+	return 0;
 
-	r = amdgpu_sync_fence(&p->job->sync, fence);
-	dma_fence_put(fence);
+error_validate:
+	ttm_eu_backoff_reservation(&p->ticket, &p->validated);
+
+out_free_user_pages:
+	amdgpu_bo_list_for_each_userptr_entry(e, p->bo_list) {
+		struct amdgpu_bo *bo = ttm_to_amdgpu_bo(e->tv.bo);
 
+		if (!e->user_pages)
+			continue;
+		amdgpu_ttm_tt_get_user_pages_done(bo->tbo.ttm);
+		kvfree(e->user_pages);
+		e->user_pages = NULL;
+	}
+	mutex_unlock(&p->bo_list->bo_list_mutex);
 	return r;
 }
 
-static int amdgpu_cs_process_syncobj_in_dep(struct amdgpu_cs_parser *p,
-					    struct amdgpu_cs_chunk *chunk)
+static void trace_amdgpu_cs_ibs(struct amdgpu_cs_parser *parser)
 {
-	struct drm_amdgpu_cs_chunk_sem *deps;
-	unsigned num_deps;
-	int i, r;
+	int i;
 
-	deps = (struct drm_amdgpu_cs_chunk_sem *)chunk->kdata;
-	num_deps = chunk->length_dw * 4 /
-		sizeof(struct drm_amdgpu_cs_chunk_sem);
-	for (i = 0; i < num_deps; ++i) {
-		r = amdgpu_syncobj_lookup_and_add_to_sync(p, deps[i].handle,
-							  0, 0);
-		if (r)
-			return r;
-	}
+	if (!trace_amdgpu_cs_enabled())
+		return;
 
-	return 0;
+	for (i = 0; i < parser->job->num_ibs; i++)
+		trace_amdgpu_cs(parser, i);
 }
 
-
-static int amdgpu_cs_process_syncobj_timeline_in_dep(struct amdgpu_cs_parser *p,
-						     struct amdgpu_cs_chunk *chunk)
+static int amdgpu_cs_patch_ibs(struct amdgpu_cs_parser *p)
 {
-	struct drm_amdgpu_cs_chunk_syncobj *syncobj_deps;
-	unsigned num_deps;
-	int i, r;
+	struct amdgpu_job *job = p->job;
+	struct amdgpu_ring *ring = to_amdgpu_ring(job->base.sched);
+	unsigned int i;
+	int r;
 
-	syncobj_deps = (struct drm_amdgpu_cs_chunk_syncobj *)chunk->kdata;
-	num_deps = chunk->length_dw * 4 /
-		sizeof(struct drm_amdgpu_cs_chunk_syncobj);
-	for (i = 0; i < num_deps; ++i) {
-		r = amdgpu_syncobj_lookup_and_add_to_sync(p,
-							  syncobj_deps[i].handle,
-							  syncobj_deps[i].point,
-							  syncobj_deps[i].flags);
-		if (r)
+	/* Only for UVD/VCE VM emulation */
+	if (!ring->funcs->parse_cs && !ring->funcs->patch_cs_in_place)
+		return 0;
+
+	for (i = 0; i < job->num_ibs; ++i) {
+		struct amdgpu_ib *ib = &job->ibs[i];
+		struct amdgpu_bo_va_mapping *m;
+		struct amdgpu_bo *aobj;
+		uint64_t va_start;
+		uint8_t *kptr;
+
+		va_start = ib->gpu_addr;
+		r = amdgpu_cs_find_mapping(p, va_start, &aobj, &m);
+		if (r) {
+			DRM_ERROR("IB va_start is invalid\n");
 			return r;
+		}
+
+		if ((va_start + ib->length_dw * 4) >
+		    (m->last + 1) * AMDGPU_GPU_PAGE_SIZE) {
+			DRM_ERROR("IB va_start+ib_bytes is invalid\n");
+			return -EINVAL;
+		}
+
+		/* the IB should be reserved at this point */
+		r = amdgpu_bo_kmap(aobj, (void **)&kptr);
+		if (r) {
+			return r;
+		}
+
+		kptr += va_start - (m->start * AMDGPU_GPU_PAGE_SIZE);
+
+		if (ring->funcs->parse_cs) {
+			memcpy(ib->ptr, kptr, ib->length_dw * 4);
+			amdgpu_bo_kunmap(aobj);
+
+			r = amdgpu_ring_parse_cs(ring, p, p->job, ib);
+			if (r)
+				return r;
+		} else {
+			ib->ptr = (uint32_t *)kptr;
+			r = amdgpu_ring_patch_cs_in_place(ring, p, p->job, ib);
+			amdgpu_bo_kunmap(aobj);
+			if (r)
+				return r;
+		}
 	}
 
 	return 0;
 }
 
-static int amdgpu_cs_process_syncobj_out_dep(struct amdgpu_cs_parser *p,
-					     struct amdgpu_cs_chunk *chunk)
+static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
 {
-	struct drm_amdgpu_cs_chunk_sem *deps;
-	unsigned num_deps;
-	int i;
-
-	deps = (struct drm_amdgpu_cs_chunk_sem *)chunk->kdata;
-	num_deps = chunk->length_dw * 4 /
-		sizeof(struct drm_amdgpu_cs_chunk_sem);
+	struct amdgpu_fpriv *fpriv = p->filp->driver_priv;
+	struct amdgpu_device *adev = p->adev;
+	struct amdgpu_vm *vm = &fpriv->vm;
+	struct amdgpu_bo_list_entry *e;
+	struct amdgpu_bo_va *bo_va;
+	struct amdgpu_bo *bo;
+	int r;
 
-	if (p->post_deps)
-		return -EINVAL;
+	r = amdgpu_vm_clear_freed(adev, vm, NULL);
+	if (r)
+		return r;
 
-	p->post_deps = kmalloc_array(num_deps, sizeof(*p->post_deps),
-				     GFP_KERNEL);
-	p->num_post_deps = 0;
+	r = amdgpu_vm_bo_update(adev, fpriv->prt_va, false);
+	if (r)
+		return r;
 
-	if (!p->post_deps)
-		return -ENOMEM;
+	r = amdgpu_sync_fence(&p->job->sync, fpriv->prt_va->last_pt_update);
+	if (r)
+		return r;
 
+	if (amdgpu_mcbp || amdgpu_sriov_vf(adev)) {
+		bo_va = fpriv->csa_va;
+		r = amdgpu_vm_bo_update(adev, bo_va, false);
+		if (r)
+			return r;
 
-	for (i = 0; i < num_deps; ++i) {
-		p->post_deps[i].syncobj =
-			drm_syncobj_find(p->filp, deps[i].handle);
-		if (!p->post_deps[i].syncobj)
-			return -EINVAL;
-		p->post_deps[i].chain = NULL;
-		p->post_deps[i].point = 0;
-		p->num_post_deps++;
+		r = amdgpu_sync_fence(&p->job->sync, bo_va->last_pt_update);
+		if (r)
+			return r;
 	}
 
-	return 0;
-}
+	amdgpu_bo_list_for_each_entry(e, p->bo_list) {
+		/* ignore duplicates */
+		bo = ttm_to_amdgpu_bo(e->tv.bo);
+		if (!bo)
+			continue;
 
+		bo_va = e->bo_va;
+		if (bo_va == NULL)
+			continue;
 
-static int amdgpu_cs_process_syncobj_timeline_out_dep(struct amdgpu_cs_parser *p,
-						      struct amdgpu_cs_chunk *chunk)
-{
-	struct drm_amdgpu_cs_chunk_syncobj *syncobj_deps;
-	unsigned num_deps;
-	int i;
+		r = amdgpu_vm_bo_update(adev, bo_va, false);
+		if (r)
+			return r;
 
-	syncobj_deps = (struct drm_amdgpu_cs_chunk_syncobj *)chunk->kdata;
-	num_deps = chunk->length_dw * 4 /
-		sizeof(struct drm_amdgpu_cs_chunk_syncobj);
+		r = amdgpu_sync_fence(&p->job->sync, bo_va->last_pt_update);
+		if (r)
+			return r;
+	}
 
-	if (p->post_deps)
-		return -EINVAL;
+	r = amdgpu_vm_handle_moved(adev, vm);
+	if (r)
+		return r;
 
-	p->post_deps = kmalloc_array(num_deps, sizeof(*p->post_deps),
-				     GFP_KERNEL);
-	p->num_post_deps = 0;
+	r = amdgpu_vm_update_pdes(adev, vm, false);
+	if (r)
+		return r;
 
-	if (!p->post_deps)
-		return -ENOMEM;
+	r = amdgpu_sync_fence(&p->job->sync, vm->last_update);
+	if (r)
+		return r;
 
-	for (i = 0; i < num_deps; ++i) {
-		struct amdgpu_cs_post_dep *dep = &p->post_deps[i];
+	p->job->vm_pd_addr = amdgpu_gmc_pd_addr(vm->root.bo);
 
-		dep->chain = NULL;
-		if (syncobj_deps[i].point) {
-			dep->chain = dma_fence_chain_alloc();
-			if (!dep->chain)
-				return -ENOMEM;
-		}
+	if (amdgpu_vm_debug) {
+		/* Invalidate all BOs to test for userspace bugs */
+		amdgpu_bo_list_for_each_entry(e, p->bo_list) {
+			struct amdgpu_bo *bo = ttm_to_amdgpu_bo(e->tv.bo);
 
-		dep->syncobj = drm_syncobj_find(p->filp,
-						syncobj_deps[i].handle);
-		if (!dep->syncobj) {
-			dma_fence_chain_free(dep->chain);
-			return -EINVAL;
+			/* ignore duplicates */
+			if (!bo)
+				continue;
+
+			amdgpu_vm_bo_invalidate(adev, bo, false);
 		}
-		dep->point = syncobj_deps[i].point;
-		p->num_post_deps++;
 	}
 
 	return 0;
 }
 
-static int amdgpu_cs_dependencies(struct amdgpu_device *adev,
-				  struct amdgpu_cs_parser *p)
+static int amdgpu_cs_sync_rings(struct amdgpu_cs_parser *p)
 {
-	int i, r;
-
-	for (i = 0; i < p->nchunks; ++i) {
-		struct amdgpu_cs_chunk *chunk;
+	struct amdgpu_fpriv *fpriv = p->filp->driver_priv;
+	struct amdgpu_bo_list_entry *e;
+	int r;
 
-		chunk = &p->chunks[i];
+	list_for_each_entry(e, &p->validated, tv.head) {
+		struct amdgpu_bo *bo = ttm_to_amdgpu_bo(e->tv.bo);
+		struct dma_resv *resv = bo->tbo.base.resv;
+		enum amdgpu_sync_mode sync_mode;
 
-		switch (chunk->chunk_id) {
-		case AMDGPU_CHUNK_ID_DEPENDENCIES:
-		case AMDGPU_CHUNK_ID_SCHEDULED_DEPENDENCIES:
-			r = amdgpu_cs_process_fence_dep(p, chunk);
-			if (r)
-				return r;
-			break;
-		case AMDGPU_CHUNK_ID_SYNCOBJ_IN:
-			r = amdgpu_cs_process_syncobj_in_dep(p, chunk);
-			if (r)
-				return r;
-			break;
-		case AMDGPU_CHUNK_ID_SYNCOBJ_OUT:
-			r = amdgpu_cs_process_syncobj_out_dep(p, chunk);
-			if (r)
-				return r;
-			break;
-		case AMDGPU_CHUNK_ID_SYNCOBJ_TIMELINE_WAIT:
-			r = amdgpu_cs_process_syncobj_timeline_in_dep(p, chunk);
-			if (r)
-				return r;
-			break;
-		case AMDGPU_CHUNK_ID_SYNCOBJ_TIMELINE_SIGNAL:
-			r = amdgpu_cs_process_syncobj_timeline_out_dep(p, chunk);
-			if (r)
-				return r;
-			break;
-		}
+		sync_mode = amdgpu_bo_explicit_sync(bo) ?
+			AMDGPU_SYNC_EXPLICIT : AMDGPU_SYNC_NE_OWNER;
+		r = amdgpu_sync_resv(p->adev, &p->job->sync, resv, sync_mode,
+				     &fpriv->vm);
+		if (r)
+			return r;
 	}
-
 	return 0;
 }
 
@@ -1226,10 +1195,6 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 	job = p->job;
 	p->job = NULL;
 
-	r = drm_sched_job_init(&job->base, entity, &fpriv->vm);
-	if (r)
-		goto error_unlock;
-
 	drm_sched_job_arm(&job->base);
 
 	/* No memory allocation is allowed while holding the notifier lock.
@@ -1286,29 +1251,45 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 error_abort:
 	drm_sched_job_cleanup(&job->base);
 	mutex_unlock(&p->adev->notifier_lock);
-
-error_unlock:
 	amdgpu_job_free(job);
 	return r;
 }
 
-static void trace_amdgpu_cs_ibs(struct amdgpu_cs_parser *parser)
+/* Cleanup the parser structure */
+static void amdgpu_cs_parser_fini(struct amdgpu_cs_parser *parser)
 {
-	int i;
+	unsigned i;
 
-	if (!trace_amdgpu_cs_enabled())
-		return;
+	for (i = 0; i < parser->num_post_deps; i++) {
+		drm_syncobj_put(parser->post_deps[i].syncobj);
+		kfree(parser->post_deps[i].chain);
+	}
+	kfree(parser->post_deps);
 
-	for (i = 0; i < parser->job->num_ibs; i++)
-		trace_amdgpu_cs(parser, i);
+	dma_fence_put(parser->fence);
+
+	if (parser->ctx) {
+		amdgpu_ctx_put(parser->ctx);
+	}
+	if (parser->bo_list)
+		amdgpu_bo_list_put(parser->bo_list);
+
+	for (i = 0; i < parser->nchunks; i++)
+		kvfree(parser->chunks[i].kdata);
+	kvfree(parser->chunks);
+	if (parser->job)
+		amdgpu_job_free(parser->job);
+	if (parser->uf_entry.tv.bo) {
+		struct amdgpu_bo *uf = ttm_to_amdgpu_bo(parser->uf_entry.tv.bo);
+
+		amdgpu_bo_unref(&uf);
+	}
 }
 
 int amdgpu_cs_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 {
 	struct amdgpu_device *adev = drm_to_adev(dev);
-	union drm_amdgpu_cs *cs = data;
-	struct amdgpu_cs_parser parser = {};
-	bool reserved_buffers = false;
+	struct amdgpu_cs_parser parser;
 	int r;
 
 	if (amdgpu_ras_intr_triggered())
@@ -1317,25 +1298,20 @@ int amdgpu_cs_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 	if (!adev->accel_working)
 		return -EBUSY;
 
-	parser.adev = adev;
-	parser.filp = filp;
-
-	r = amdgpu_cs_parser_init(&parser, data);
+	r = amdgpu_cs_parser_init(&parser, adev, filp, data);
 	if (r) {
 		if (printk_ratelimit())
 			DRM_ERROR("Failed to initialize parser %d!\n", r);
-		goto out;
+		return r;
 	}
 
-	r = amdgpu_cs_ib_fill(adev, &parser);
+	r = amdgpu_cs_pass1(&parser, data);
 	if (r)
-		goto out;
+		goto error_fini;
 
-	r = amdgpu_cs_dependencies(adev, &parser);
-	if (r) {
-		DRM_ERROR("Failed in the dependencies handling %d!\n", r);
-		goto out;
-	}
+	r = amdgpu_cs_pass2(&parser);
+	if (r)
+		goto error_fini;
 
 	r = amdgpu_cs_parser_bos(&parser, data);
 	if (r) {
@@ -1343,21 +1319,36 @@ int amdgpu_cs_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 			DRM_ERROR("Not enough memory for command submission!\n");
 		else if (r != -ERESTARTSYS && r != -EAGAIN)
 			DRM_ERROR("Failed to process the buffer list %d!\n", r);
-		goto out;
+		goto error_fini;
 	}
 
-	reserved_buffers = true;
+	r = amdgpu_cs_patch_ibs(&parser);
+	if (r)
+		goto error_backoff;
+
+	r = amdgpu_cs_vm_handling(&parser);
+	if (r)
+		goto error_backoff;
+
+	r = amdgpu_cs_sync_rings(&parser);
+	if (r)
+		goto error_backoff;
 
 	trace_amdgpu_cs_ibs(&parser);
 
-	r = amdgpu_cs_vm_handling(&parser);
+	r = amdgpu_cs_submit(&parser, data);
 	if (r)
-		goto out;
+		goto error_backoff;
 
-	r = amdgpu_cs_submit(&parser, cs);
-out:
-	amdgpu_cs_parser_fini(&parser, r, reserved_buffers);
+	amdgpu_cs_parser_fini(&parser);
+	return 0;
+
+error_backoff:
+	ttm_eu_backoff_reservation(&parser.ticket, &parser.validated);
+	mutex_unlock(&parser.bo_list->bo_list_mutex);
 
+error_fini:
+	amdgpu_cs_parser_fini(&parser);
 	return r;
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h
index 30ecc4917f81..652b5593499f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h
@@ -51,8 +51,8 @@ struct amdgpu_cs_parser {
 	struct amdgpu_cs_chunk	*chunks;
 
 	/* scheduler job object */
-	struct amdgpu_job	*job;
 	struct drm_sched_entity	*entity;
+	struct amdgpu_job	*job;
 
 	/* buffer objects */
 	struct ww_acquire_ctx		ticket;
-- 
2.25.1

