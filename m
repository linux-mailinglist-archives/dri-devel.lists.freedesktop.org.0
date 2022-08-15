Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2165935F8
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 21:00:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 090BDD259F;
	Mon, 15 Aug 2022 19:00:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EFFDD2563
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 18:59:54 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id w3so10724615edc.2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 11:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=ZUBwAN7jOcjh1b7YeRiG+gYCX7eh7YBVKIzEHIFMfHM=;
 b=Tjfpf2ah8DAK01B0VdXqbBMag4keDgUFbJhaVEy0ir+HAK2Y8F67+UrfiwE14nO27S
 91zFbKqp4yMOCNfnD76jNH0b1oDO4rG2J3RsDYHsj0smpdCEk0BKPnayNS6kIKy+pV/2
 Nf9mL3c0J22GbKzGHcTK49HwhesQAWbZa1pOpyggKYX7FxulQiR7XXJ22iOwmCTaB2b3
 THBA0MXQt/GuMDpNP6lUL1PAFB9Ymwqw2q7kpSo3/qrvz4kYJsf3FkoZLDcfxiaO0EJ2
 FvCk/Ne1Bj6Rjjti0vIRRLZA6Td04ZYmEh8oK4HUYx6Hi38mha74yCoAljPdDAAgSRND
 rHng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=ZUBwAN7jOcjh1b7YeRiG+gYCX7eh7YBVKIzEHIFMfHM=;
 b=qUYitI87bd1WdlG2hBBlWj4I3vb/SMklMOsfNaZj2WKEur9ewUo9pGOg9Y8BVh3xqh
 m1hFh7C6GQPD85dlZKznn4gNqsGuUDhlFZFX44q5aiLdaiuAyM8spX70dG8COjgNX22j
 XSOw5Be3A7YjNPYmjqkaGXwt2PxW8S8kfNkm8Okb3v73c7WTi27tX2U/k3xuiQncgXWG
 yXrd0pzAp3LYtZTJm6WCfJzEXEN/ujdN1f/VI8A41pSD7Lk79zPG3sG0o5m3f203lhZX
 EaEe5cm5NXDAqMBUg/DcQgPBW7dgaLwE7VOe+RKMxngBfvuQQjxhR4WdVMJQrEhUjJ1U
 ZbHA==
X-Gm-Message-State: ACgBeo0VJuuyal5BgmzNHKwxMyRSkc9glgbtOiN5Iwjd/JUMs1vR9VRQ
 PGb1vccyv5Xnj/F4rtG67KCSBRghuIE=
X-Google-Smtp-Source: AA6agR6c3p+Fg05p043BGg/GJEq/umBgjCQsgdRv4yR2rBO2fr4aOk/2W89yd/Q86C7ygUliR2FloQ==
X-Received: by 2002:a05:6402:4282:b0:43e:612c:fcf7 with SMTP id
 g2-20020a056402428200b0043e612cfcf7mr15257719edc.242.1660589992641; 
 Mon, 15 Aug 2022 11:59:52 -0700 (PDT)
Received: from able.fritz.box (p57b0bd9f.dip0.t-ipconnect.de. [87.176.189.159])
 by smtp.gmail.com with ESMTPSA id
 d10-20020a170906304a00b00731745a7e62sm3553805ejd.28.2022.08.15.11.59.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 11:59:52 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 10/10] drm/amdgpu: add gang submit frontend v3
Date: Mon, 15 Aug 2022 20:59:40 +0200
Message-Id: <20220815185940.4744-11-christian.koenig@amd.com>
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

Allows submitting jobs as gang which needs to run on multiple engines at the
same time.

All members of the gang get the same implicit, explicit and VM dependencies. So
no gang member will start running until everything else is ready.

The last job is considered the gang leader (usually a submission to the GFX
ring) and used for signaling output dependencies.

Each job is remembered individually as user of a buffer object, so there is no
joining of work at the end.

v2: rebase and fix review comments from Andrey and Yogesh
v3: use READ instead of BOOKKEEP for now because of VM unmaps, set gang
    leader only when necessary

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c    | 258 ++++++++++++++--------
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h    |  10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h |  12 +-
 3 files changed, 185 insertions(+), 95 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 88f491dc7ca2..21f0a6c08eb4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -69,6 +69,7 @@ static int amdgpu_cs_p1_ib(struct amdgpu_cs_parser *p,
 			   unsigned int *num_ibs)
 {
 	struct drm_sched_entity *entity;
+	unsigned int i;
 	int r;
 
 	r = amdgpu_ctx_get_entity(p->ctx, chunk_ib->ip_type,
@@ -77,17 +78,28 @@ static int amdgpu_cs_p1_ib(struct amdgpu_cs_parser *p,
 	if (r)
 		return r;
 
-	/* Abort if there is no run queue associated with this entity.
-	 * Possibly because of disabled HW IP*/
+	/*
+	 * Abort if there is no run queue associated with this entity.
+	 * Possibly because of disabled HW IP.
+	 */
 	if (entity->rq == NULL)
 		return -EINVAL;
 
-	/* Currently we don't support submitting to multiple entities */
-	if (p->entity && p->entity != entity)
+	/* Check if we can add this IB to some existing job */
+	for (i = 0; i < p->gang_size; ++i) {
+		if (p->entities[i] == entity)
+			goto found;
+	}
+
+	/* If not increase the gang size if possible */
+	if (i == AMDGPU_CS_GANG_SIZE)
 		return -EINVAL;
 
-	p->entity = entity;
-	++(*num_ibs);
+	p->entities[i] = entity;
+	p->gang_size = i + 1;
+
+found:
+	++(num_ibs[i]);
 	return 0;
 }
 
@@ -161,11 +173,12 @@ static int amdgpu_cs_pass1(struct amdgpu_cs_parser *p,
 			   union drm_amdgpu_cs *cs)
 {
 	struct amdgpu_fpriv *fpriv = p->filp->driver_priv;
+	unsigned int num_ibs[AMDGPU_CS_GANG_SIZE] = { };
 	struct amdgpu_vm *vm = &fpriv->vm;
 	uint64_t *chunk_array_user;
 	uint64_t *chunk_array;
-	unsigned size, num_ibs = 0;
 	uint32_t uf_offset = 0;
+	unsigned int size;
 	int ret;
 	int i;
 
@@ -231,7 +244,7 @@ static int amdgpu_cs_pass1(struct amdgpu_cs_parser *p,
 			if (size < sizeof(struct drm_amdgpu_cs_chunk_ib))
 				goto free_partial_kdata;
 
-			ret = amdgpu_cs_p1_ib(p, p->chunks[i].kdata, &num_ibs);
+			ret = amdgpu_cs_p1_ib(p, p->chunks[i].kdata, num_ibs);
 			if (ret)
 				goto free_partial_kdata;
 			break;
@@ -268,21 +281,28 @@ static int amdgpu_cs_pass1(struct amdgpu_cs_parser *p,
 		}
 	}
 
-	ret = amdgpu_job_alloc(p->adev, num_ibs, &p->job, vm);
-	if (ret)
-		goto free_all_kdata;
+	if (!p->gang_size)
+		return -EINVAL;
 
-	ret = drm_sched_job_init(&p->job->base, p->entity, &fpriv->vm);
-	if (ret)
-		goto free_all_kdata;
+	for (i = 0; i < p->gang_size; ++i) {
+		ret = amdgpu_job_alloc(p->adev, num_ibs[i], &p->jobs[i], vm);
+		if (ret)
+			goto free_all_kdata;
+
+		ret = drm_sched_job_init(&p->jobs[i]->base, p->entities[i],
+					 &fpriv->vm);
+		if (ret)
+			goto free_all_kdata;
+	}
+	p->gang_leader = p->jobs[p->gang_size - 1];
 
-	if (p->ctx->vram_lost_counter != p->job->vram_lost_counter) {
+	if (p->ctx->vram_lost_counter != p->gang_leader->vram_lost_counter) {
 		ret = -ECANCELED;
 		goto free_all_kdata;
 	}
 
 	if (p->uf_entry.tv.bo)
-		p->job->uf_addr = uf_offset;
+		p->gang_leader->uf_addr = uf_offset;
 	kvfree(chunk_array);
 
 	/* Use this opportunity to fill in task info for the vm */
@@ -304,22 +324,18 @@ static int amdgpu_cs_pass1(struct amdgpu_cs_parser *p,
 	return ret;
 }
 
-static int amdgpu_cs_p2_ib(struct amdgpu_cs_parser *p,
-			   struct amdgpu_cs_chunk *chunk,
-			   unsigned int *num_ibs,
-			   unsigned int *ce_preempt,
-			   unsigned int *de_preempt)
+static int amdgpu_cs_p2_ib(struct amdgpu_cs_parser *p, struct amdgpu_job *job,
+			   struct amdgpu_ib *ib, struct amdgpu_cs_chunk *chunk,
+			   unsigned int *ce_preempt, unsigned int *de_preempt)
 {
-	struct amdgpu_ring *ring = to_amdgpu_ring(p->job->base.sched);
+	struct amdgpu_ring *ring = to_amdgpu_ring(job->base.sched);
 	struct drm_amdgpu_cs_chunk_ib *chunk_ib = chunk->kdata;
 	struct amdgpu_fpriv *fpriv = p->filp->driver_priv;
-	struct amdgpu_ib *ib = &p->job->ibs[*num_ibs];
 	struct amdgpu_vm *vm = &fpriv->vm;
 	int r;
 
-
 	/* MM engine doesn't support user fences */
-	if (p->job->uf_addr && ring->funcs->no_user_fence)
+	if (job->uf_addr && ring->funcs->no_user_fence)
 		return -EINVAL;
 
 	if (chunk_ib->ip_type == AMDGPU_HW_IP_GFX &&
@@ -336,7 +352,7 @@ static int amdgpu_cs_p2_ib(struct amdgpu_cs_parser *p,
 	}
 
 	if (chunk_ib->flags & AMDGPU_IB_FLAG_PREAMBLE)
-		p->job->preamble_status |= AMDGPU_PREAMBLE_IB_PRESENT;
+		job->preamble_status |= AMDGPU_PREAMBLE_IB_PRESENT;
 
 	r =  amdgpu_ib_get(p->adev, vm, ring->funcs->parse_cs ?
 			   chunk_ib->ib_bytes : 0,
@@ -349,8 +365,6 @@ static int amdgpu_cs_p2_ib(struct amdgpu_cs_parser *p,
 	ib->gpu_addr = chunk_ib->va_start;
 	ib->length_dw = chunk_ib->ib_bytes / 4;
 	ib->flags = chunk_ib->flags;
-
-	(*num_ibs)++;
 	return 0;
 }
 
@@ -399,7 +413,7 @@ static int amdgpu_cs_p2_dependencies(struct amdgpu_cs_parser *p,
 			dma_fence_put(old);
 		}
 
-		r = amdgpu_sync_fence(&p->job->sync, fence);
+		r = amdgpu_sync_fence(&p->gang_leader->sync, fence);
 		dma_fence_put(fence);
 		if (r)
 			return r;
@@ -421,7 +435,7 @@ static int amdgpu_syncobj_lookup_and_add(struct amdgpu_cs_parser *p,
 		return r;
 	}
 
-	r = amdgpu_sync_fence(&p->job->sync, fence);
+	r = amdgpu_sync_fence(&p->gang_leader->sync, fence);
 	dma_fence_put(fence);
 
 	return r;
@@ -544,20 +558,30 @@ static int amdgpu_cs_p2_syncobj_timeline_signal(struct amdgpu_cs_parser *p,
 
 static int amdgpu_cs_pass2(struct amdgpu_cs_parser *p)
 {
-	unsigned int num_ibs = 0, ce_preempt = 0, de_preempt = 0;
+	unsigned int ce_preempt = 0, de_preempt = 0;
+	unsigned int job_idx = 0, ib_idx = 0;
 	int i, r;
 
 	for (i = 0; i < p->nchunks; ++i) {
 		struct amdgpu_cs_chunk *chunk;
+		struct amdgpu_job *job;
 
 		chunk = &p->chunks[i];
 
 		switch (chunk->chunk_id) {
 		case AMDGPU_CHUNK_ID_IB:
-			r = amdgpu_cs_p2_ib(p, chunk, &num_ibs,
+			job = p->jobs[job_idx];
+			r = amdgpu_cs_p2_ib(p, job, &job->ibs[ib_idx], chunk,
 					    &ce_preempt, &de_preempt);
 			if (r)
 				return r;
+
+			if (++ib_idx == job->num_ibs) {
+				++job_idx;
+				ib_idx = 0;
+				ce_preempt = 0;
+				de_preempt = 0;
+			}
 			break;
 		case AMDGPU_CHUNK_ID_DEPENDENCIES:
 		case AMDGPU_CHUNK_ID_SCHEDULED_DEPENDENCIES:
@@ -828,6 +852,7 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 	struct amdgpu_vm *vm = &fpriv->vm;
 	struct amdgpu_bo_list_entry *e;
 	struct list_head duplicates;
+	unsigned int i;
 	int r;
 
 	INIT_LIST_HEAD(&p->validated);
@@ -911,16 +936,6 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 		e->bo_va = amdgpu_vm_bo_find(vm, bo);
 	}
 
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
 	amdgpu_cs_get_threshold_for_moves(p->adev, &p->bytes_moved_threshold,
 					  &p->bytes_moved_vis_threshold);
 	p->bytes_moved = 0;
@@ -944,8 +959,10 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 	amdgpu_cs_report_moved_bytes(p->adev, p->bytes_moved,
 				     p->bytes_moved_vis);
 
-	amdgpu_job_set_resources(p->job, p->bo_list->gds_obj,
-				 p->bo_list->gws_obj, p->bo_list->oa_obj);
+	for (i = 0; i < p->gang_size; ++i)
+		amdgpu_job_set_resources(p->jobs[i], p->bo_list->gds_obj,
+					 p->bo_list->gws_obj,
+					 p->bo_list->oa_obj);
 
 	if (p->uf_entry.tv.bo) {
 		struct amdgpu_bo *uf = ttm_to_amdgpu_bo(p->uf_entry.tv.bo);
@@ -954,7 +971,7 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 		if (r)
 			goto error_validate;
 
-		p->job->uf_addr += amdgpu_bo_gpu_offset(uf);
+		p->gang_leader->uf_addr += amdgpu_bo_gpu_offset(uf);
 	}
 	return 0;
 
@@ -975,20 +992,24 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 	return r;
 }
 
-static void trace_amdgpu_cs_ibs(struct amdgpu_cs_parser *parser)
+static void trace_amdgpu_cs_ibs(struct amdgpu_cs_parser *p)
 {
-	int i;
+	int i, j;
 
 	if (!trace_amdgpu_cs_enabled())
 		return;
 
-	for (i = 0; i < parser->job->num_ibs; i++)
-		trace_amdgpu_cs(parser, i);
+	for (i = 0; i < p->gang_size; ++i) {
+		struct amdgpu_job *job = p->jobs[i];
+
+		for (j = 0; j < job->num_ibs; ++j)
+			trace_amdgpu_cs(p, job, &job->ibs[j]);
+	}
 }
 
-static int amdgpu_cs_patch_ibs(struct amdgpu_cs_parser *p)
+static int amdgpu_cs_patch_ibs(struct amdgpu_cs_parser *p,
+			       struct amdgpu_job *job)
 {
-	struct amdgpu_job *job = p->job;
 	struct amdgpu_ring *ring = to_amdgpu_ring(job->base.sched);
 	unsigned int i;
 	int r;
@@ -1029,12 +1050,12 @@ static int amdgpu_cs_patch_ibs(struct amdgpu_cs_parser *p)
 			memcpy(ib->ptr, kptr, ib->length_dw * 4);
 			amdgpu_bo_kunmap(aobj);
 
-			r = amdgpu_ring_parse_cs(ring, p, p->job, ib);
+			r = amdgpu_ring_parse_cs(ring, p, job, ib);
 			if (r)
 				return r;
 		} else {
 			ib->ptr = (uint32_t *)kptr;
-			r = amdgpu_ring_patch_cs_in_place(ring, p, p->job, ib);
+			r = amdgpu_ring_patch_cs_in_place(ring, p, job, ib);
 			amdgpu_bo_kunmap(aobj);
 			if (r)
 				return r;
@@ -1044,14 +1065,29 @@ static int amdgpu_cs_patch_ibs(struct amdgpu_cs_parser *p)
 	return 0;
 }
 
+static int amdgpu_cs_patch_jobs(struct amdgpu_cs_parser *p)
+{
+	unsigned int i;
+	int r;
+
+	for (i = 0; i < p->gang_size; ++i) {
+		r = amdgpu_cs_patch_ibs(p, p->jobs[i]);
+		if (r)
+			return r;
+	}
+	return 0;
+}
+
 static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
 {
 	struct amdgpu_fpriv *fpriv = p->filp->driver_priv;
+	struct amdgpu_job *job = p->gang_leader;
 	struct amdgpu_device *adev = p->adev;
 	struct amdgpu_vm *vm = &fpriv->vm;
 	struct amdgpu_bo_list_entry *e;
 	struct amdgpu_bo_va *bo_va;
 	struct amdgpu_bo *bo;
+	unsigned int i;
 	int r;
 
 	r = amdgpu_vm_clear_freed(adev, vm, NULL);
@@ -1062,7 +1098,7 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
 	if (r)
 		return r;
 
-	r = amdgpu_sync_fence(&p->job->sync, fpriv->prt_va->last_pt_update);
+	r = amdgpu_sync_fence(&job->sync, fpriv->prt_va->last_pt_update);
 	if (r)
 		return r;
 
@@ -1072,7 +1108,7 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
 		if (r)
 			return r;
 
-		r = amdgpu_sync_fence(&p->job->sync, bo_va->last_pt_update);
+		r = amdgpu_sync_fence(&job->sync, bo_va->last_pt_update);
 		if (r)
 			return r;
 	}
@@ -1091,7 +1127,7 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
 		if (r)
 			return r;
 
-		r = amdgpu_sync_fence(&p->job->sync, bo_va->last_pt_update);
+		r = amdgpu_sync_fence(&job->sync, bo_va->last_pt_update);
 		if (r)
 			return r;
 	}
@@ -1104,11 +1140,18 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
 	if (r)
 		return r;
 
-	r = amdgpu_sync_fence(&p->job->sync, vm->last_update);
+	r = amdgpu_sync_fence(&job->sync, vm->last_update);
 	if (r)
 		return r;
 
-	p->job->vm_pd_addr = amdgpu_gmc_pd_addr(vm->root.bo);
+	for (i = 0; i < p->gang_size; ++i) {
+		job = p->jobs[i];
+
+		if (!job->vm)
+			continue;
+
+		job->vm_pd_addr = amdgpu_gmc_pd_addr(vm->root.bo);
+	}
 
 	if (amdgpu_vm_debug) {
 		/* Invalidate all BOs to test for userspace bugs */
@@ -1129,7 +1172,9 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
 static int amdgpu_cs_sync_rings(struct amdgpu_cs_parser *p)
 {
 	struct amdgpu_fpriv *fpriv = p->filp->driver_priv;
+	struct amdgpu_job *leader = p->gang_leader;
 	struct amdgpu_bo_list_entry *e;
+	unsigned int i;
 	int r;
 
 	list_for_each_entry(e, &p->validated, tv.head) {
@@ -1139,12 +1184,23 @@ static int amdgpu_cs_sync_rings(struct amdgpu_cs_parser *p)
 
 		sync_mode = amdgpu_bo_explicit_sync(bo) ?
 			AMDGPU_SYNC_EXPLICIT : AMDGPU_SYNC_NE_OWNER;
-		r = amdgpu_sync_resv(p->adev, &p->job->sync, resv, sync_mode,
+		r = amdgpu_sync_resv(p->adev, &leader->sync, resv, sync_mode,
 				     &fpriv->vm);
 		if (r)
 			return r;
 	}
-	return 0;
+
+	for (i = 0; i < p->gang_size - 1; ++i) {
+		r = amdgpu_sync_clone(&leader->sync, &p->jobs[i]->sync);
+		if (r)
+			return r;
+	}
+
+	r = amdgpu_ctx_wait_prev_fence(p->ctx, p->entities[p->gang_size - 1]);
+	if (r && r != -ERESTARTSYS)
+		DRM_ERROR("amdgpu_ctx_wait_prev_fence failed.\n");
+
+	return r;
 }
 
 static void amdgpu_cs_post_dependencies(struct amdgpu_cs_parser *p)
@@ -1168,16 +1224,28 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 			    union drm_amdgpu_cs *cs)
 {
 	struct amdgpu_fpriv *fpriv = p->filp->driver_priv;
-	struct drm_sched_entity *entity = p->entity;
+	struct amdgpu_job *leader = p->gang_leader;
 	struct amdgpu_bo_list_entry *e;
-	struct amdgpu_job *job;
+	unsigned int i;
 	uint64_t seq;
 	int r;
 
-	job = p->job;
-	p->job = NULL;
+	for (i = 0; i < p->gang_size; ++i)
+		drm_sched_job_arm(&p->jobs[i]->base);
 
-	drm_sched_job_arm(&job->base);
+	for (i = 0; i < (p->gang_size - 1); ++i) {
+		struct dma_fence *fence;
+
+		fence = &p->jobs[i]->base.s_fence->scheduled;
+		r = amdgpu_sync_fence(&leader->sync, fence);
+		if (r)
+			goto error_cleanup;
+	}
+
+	if (p->gang_size > 1) {
+		for (i = 0; i < p->gang_size; ++i)
+			amdgpu_job_set_gang_leader(p->jobs[i], leader);
+	}
 
 	/* No memory allocation is allowed while holding the notifier lock.
 	 * The lock is held until amdgpu_cs_submit is finished and fence is
@@ -1195,45 +1263,60 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 	}
 	if (r) {
 		r = -EAGAIN;
-		goto error_abort;
+		goto error_unlock;
 	}
 
-	p->fence = dma_fence_get(&job->base.s_fence->finished);
+	p->fence = dma_fence_get(&leader->base.s_fence->finished);
 
-	seq = amdgpu_ctx_add_fence(p->ctx, entity, p->fence);
+	seq = amdgpu_ctx_add_fence(p->ctx, p->entities[p->gang_size - 1],
+				   p->fence);
 	amdgpu_cs_post_dependencies(p);
 
-	if ((job->preamble_status & AMDGPU_PREAMBLE_IB_PRESENT) &&
+	if ((leader->preamble_status & AMDGPU_PREAMBLE_IB_PRESENT) &&
 	    !p->ctx->preamble_presented) {
-		job->preamble_status |= AMDGPU_PREAMBLE_IB_PRESENT_FIRST;
+		leader->preamble_status |= AMDGPU_PREAMBLE_IB_PRESENT_FIRST;
 		p->ctx->preamble_presented = true;
 	}
 
 	cs->out.handle = seq;
-	job->uf_sequence = seq;
-
-	amdgpu_job_free_resources(job);
+	leader->uf_sequence = seq;
 
-	trace_amdgpu_cs_ioctl(job);
 	amdgpu_vm_bo_trace_cs(&fpriv->vm, &p->ticket);
-	drm_sched_entity_push_job(&job->base);
+	for (i = 0; i < p->gang_size; ++i) {
+		amdgpu_job_free_resources(p->jobs[i]);
+		trace_amdgpu_cs_ioctl(p->jobs[i]);
+		drm_sched_entity_push_job(&p->jobs[i]->base);
+	}
 
 	amdgpu_vm_move_to_lru_tail(p->adev, &fpriv->vm);
 
-	/* Make sure all BOs are remembered as writers */
-	amdgpu_bo_list_for_each_entry(e, p->bo_list)
-		e->tv.num_shared = 0;
+	list_for_each_entry(e, &p->validated, tv.head) {
+
+		/* Everybody except for the gang leader uses READ */
+		for (i = 0; i < (p->gang_size - 1); ++i) {
+			dma_resv_add_fence(e->tv.bo->base.resv,
+					   &p->jobs[i]->base.s_fence->finished,
+					   DMA_RESV_USAGE_READ);
+		}
 
+		/* The gang leader as remembered as writer */
+		e->tv.num_shared = 0;
+	}
 	ttm_eu_fence_buffer_objects(&p->ticket, &p->validated, p->fence);
+
+	for (i = 0; i < p->gang_size; ++i)
+		p->jobs[i] = NULL;
+
 	mutex_unlock(&p->adev->notifier_lock);
 	mutex_unlock(&p->bo_list->bo_list_mutex);
-
 	return 0;
 
-error_abort:
-	drm_sched_job_cleanup(&job->base);
+error_unlock:
 	mutex_unlock(&p->adev->notifier_lock);
-	amdgpu_job_free(job);
+
+error_cleanup:
+	for (i = 0; i < p->gang_size; ++i)
+		drm_sched_job_cleanup(&p->jobs[i]->base);
 	return r;
 }
 
@@ -1250,17 +1333,18 @@ static void amdgpu_cs_parser_fini(struct amdgpu_cs_parser *parser)
 
 	dma_fence_put(parser->fence);
 
-	if (parser->ctx) {
+	if (parser->ctx)
 		amdgpu_ctx_put(parser->ctx);
-	}
 	if (parser->bo_list)
 		amdgpu_bo_list_put(parser->bo_list);
 
 	for (i = 0; i < parser->nchunks; i++)
 		kvfree(parser->chunks[i].kdata);
 	kvfree(parser->chunks);
-	if (parser->job)
-		amdgpu_job_free(parser->job);
+	for (i = 0; i < parser->gang_size; ++i) {
+		if (parser->jobs[i])
+			amdgpu_job_free(parser->jobs[i]);
+	}
 	if (parser->uf_entry.tv.bo) {
 		struct amdgpu_bo *uf = ttm_to_amdgpu_bo(parser->uf_entry.tv.bo);
 
@@ -1304,7 +1388,7 @@ int amdgpu_cs_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 		goto error_fini;
 	}
 
-	r = amdgpu_cs_patch_ibs(&parser);
+	r = amdgpu_cs_patch_jobs(&parser);
 	if (r)
 		goto error_backoff;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h
index 652b5593499f..cbaa19b2b8a3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h
@@ -27,6 +27,8 @@
 #include "amdgpu_bo_list.h"
 #include "amdgpu_ring.h"
 
+#define AMDGPU_CS_GANG_SIZE	4
+
 struct amdgpu_bo_va_mapping;
 
 struct amdgpu_cs_chunk {
@@ -50,9 +52,11 @@ struct amdgpu_cs_parser {
 	unsigned		nchunks;
 	struct amdgpu_cs_chunk	*chunks;
 
-	/* scheduler job object */
-	struct drm_sched_entity	*entity;
-	struct amdgpu_job	*job;
+	/* scheduler job objects */
+	unsigned int		gang_size;
+	struct drm_sched_entity	*entities[AMDGPU_CS_GANG_SIZE];
+	struct amdgpu_job	*jobs[AMDGPU_CS_GANG_SIZE];
+	struct amdgpu_job	*gang_leader;
 
 	/* buffer objects */
 	struct ww_acquire_ctx		ticket;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
index 06dfcf297a8d..5e6ddc7e101c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
@@ -140,8 +140,10 @@ TRACE_EVENT(amdgpu_bo_create,
 );
 
 TRACE_EVENT(amdgpu_cs,
-	    TP_PROTO(struct amdgpu_cs_parser *p, int i),
-	    TP_ARGS(p, i),
+	    TP_PROTO(struct amdgpu_cs_parser *p,
+		     struct amdgpu_job *job,
+		     struct amdgpu_ib *ib),
+	    TP_ARGS(p, job, ib),
 	    TP_STRUCT__entry(
 			     __field(struct amdgpu_bo_list *, bo_list)
 			     __field(u32, ring)
@@ -151,10 +153,10 @@ TRACE_EVENT(amdgpu_cs,
 
 	    TP_fast_assign(
 			   __entry->bo_list = p->bo_list;
-			   __entry->ring = to_amdgpu_ring(p->entity->rq->sched)->idx;
-			   __entry->dw = p->job->ibs[i].length_dw;
+			   __entry->ring = to_amdgpu_ring(job->base.sched)->idx;
+			   __entry->dw = ib->length_dw;
 			   __entry->fences = amdgpu_fence_count_emitted(
-				to_amdgpu_ring(p->entity->rq->sched));
+				to_amdgpu_ring(job->base.sched));
 			   ),
 	    TP_printk("bo_list=%p, ring=%u, dw=%u, fences=%u",
 		      __entry->bo_list, __entry->ring, __entry->dw,
-- 
2.25.1

