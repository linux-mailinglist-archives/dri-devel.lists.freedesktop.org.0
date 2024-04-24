Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A88A48B1076
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 19:01:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D49E113C80;
	Wed, 24 Apr 2024 17:00:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=friedrich.vock@gmx.de header.b="kAOuRdWZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A14AF113ABC;
 Wed, 24 Apr 2024 17:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1713978039; x=1714582839; i=friedrich.vock@gmx.de;
 bh=dmthBPwHBQEh1ERv8gosthJ46ENZPmQH3m22QLhYX8E=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=kAOuRdWZQ3qiIK9QKbPR/x1jFBD8tM+phdjCIMXmz/HUDasq9zo4mfyZm4cMUclW
 3bHS81XVjU7vKTC51tx/+jYmKfgpia6DPII55KYBlUlYKI4IYteCX3zgb84zR0qiF
 cZGzVdpzI3t+p6JTC72RCSAo1R/chHkQVvzsCtb1kJi8oNCvKhy1LpU+s2vHTJ2X6
 OoZSUKoFoHZ5tiszJYnOg0itI0B2cTJjk91LFXX20KNNFOdWZdZgJuyw7FrCqOSeJ
 4nmmMA/0oI4+SuYb0npqlj9TsYMDthxv+8amiyBkfexmPBqtNMR67BVuy8hmvcxn2
 rXj6qPmHM+6kRgNl+g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from arch.fritz.box ([213.152.117.111]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M9FnZ-1s5R8i28vv-004cnG; Wed, 24
 Apr 2024 19:00:39 +0200
From: Friedrich Vock <friedrich.vock@gmx.de>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Cc: Pierre-Loup Griffais <pgriffais@valvesoftware.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 Joshua Ashton <joshua@froggi.es>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: [RFC PATCH 08/18] drm/amdgpu: Don't try moving BOs to preferred
 domain before submit
Date: Wed, 24 Apr 2024 18:56:58 +0200
Message-ID: <20240424165937.54759-9-friedrich.vock@gmx.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240424165937.54759-1-friedrich.vock@gmx.de>
References: <20240424165937.54759-1-friedrich.vock@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:a5YVxco+fRIJF/KEXvFQ0JJq85dgCX7W2vIexoQ5nzqNSXmkRng
 EPj9yaLoQhwKn2Ljp6Nh9DtNXySMAnkEmcbxuwt+hGxWu1r+2tX/+iZOvq+UNb2uSa9VtND
 uF/wu2hvJ2eifX4HHRot7oh76S8qvdUxRMWaa6RJdPbimduI9BsU0CQCRBz7rOO388/6R7s
 iJ+w2vImzberJEGuxPdlw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Eb0QnSAqzFY=;Hqa7WNtR1NEtSP1i3xP0H3Fkm/i
 ++WI6HvOhwhQFFyxwREL3E8b1jAu5TELdFEqQqKA9aR1LRNY5ri1SS/LikTmwxGNXt8VUxNVg
 e1myKOojvL4Wy9fA97lrjUQnaIYzqDKGFECl3DBSwb1g0sMh3hc1OdgLhJ1lfOiLMk+b2EbBb
 dML/bEgzXhzOJCRWXBFQ94s5tgo9fan+RwWu2JBNN5yU5KcHZUDsAkN6JtZS8hH6zK5xDDoFD
 InNvR2iV0jZDSVH9SLwvSwWk2BphtvE+vojjNpLhQaQUswcT1ACtqGCdPo24XOVepIRqa/PVZ
 Ydpmx+0zKLyZ05n3D6SfT0UojIPB4B6Ctu6CGxL2s8R+Big4Uk82JMcnNZhiWaFXRV+vMDlNj
 GcNTQaFTQ/6R2ZEBw3+2XNhSGm3LIBhqLuH+9lTZWXsz6NQYQaXpxTNydx/8nevpV86B3+Dv1
 HmvNQm6HNY0NMgN7FnCdcsm5e6C91TcuN61Zoaol0siJQG4gfYjQGfIq7JvLVH4Pac8qzWI2/
 eWHXEPIr+lTuUY3H0Z/eg1l+/DGEmx/POGzUGXzdN4D1lZWD25NDLET683V+MIWJmz1SmkV23
 Vi68F+3ZdNA44EPoJZf8T+R4THgEqMnBr7iSXvS+GEXlIma++fzzRfY3J+wBKrWsrAtalCyG7
 8Cxh24axZR4CEEIy43FyFKVOYVUcZmoxIRiKwW9ADYHlIbntZKQpEe5kUeOBg6qBrZvdwPgTu
 6xnk0/P9XEQj7A3d0bgKfixlvWTNS+P2ioQFsAFEowWApLythkbPCoT7wYyPp49O1e91JWXaF
 BTEFheHeFuCLaIOfmPYTwubN6NunrGx4pZu6YCZAc5f38=
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

TTM now takes care of moving buffers to the best possible domain.

Signed-off-by: Friedrich Vock <friedrich.vock@gmx.de>
=2D--
 drivers/gpu/drm/amd/amdgpu/amdgpu.h        |   2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c     | 191 +--------------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h     |   4 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |   7 -
 4 files changed, 3 insertions(+), 201 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amd=
gpu/amdgpu.h
index cac0ca64367b3..3004adc6fa679 100644
=2D-- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1404,8 +1404,6 @@ bool amdgpu_device_need_post(struct amdgpu_device *a=
dev);
 bool amdgpu_device_seamless_boot_supported(struct amdgpu_device *adev);
 bool amdgpu_device_should_use_aspm(struct amdgpu_device *adev);

-void amdgpu_cs_report_moved_bytes(struct amdgpu_device *adev, u64 num_byt=
es,
-				  u64 num_vis_bytes);
 int amdgpu_device_resize_fb_bar(struct amdgpu_device *adev);
 void amdgpu_device_program_register_sequence(struct amdgpu_device *adev,
 					     const u32 *registers,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_cs.c
index e9168677ef0a6..92a0cffc1adc3 100644
=2D-- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -638,196 +638,19 @@ static int amdgpu_cs_pass2(struct amdgpu_cs_parser =
*p)
 	return 0;
 }

-/* Convert microseconds to bytes. */
-static u64 us_to_bytes(struct amdgpu_device *adev, s64 us)
-{
-	if (us <=3D 0 || !adev->mm_stats.log2_max_MBps)
-		return 0;
-
-	/* Since accum_us is incremented by a million per second, just
-	 * multiply it by the number of MB/s to get the number of bytes.
-	 */
-	return us << adev->mm_stats.log2_max_MBps;
-}
-
-static s64 bytes_to_us(struct amdgpu_device *adev, u64 bytes)
-{
-	if (!adev->mm_stats.log2_max_MBps)
-		return 0;
-
-	return bytes >> adev->mm_stats.log2_max_MBps;
-}
-
-/* Returns how many bytes TTM can move right now. If no bytes can be move=
d,
- * it returns 0. If it returns non-zero, it's OK to move at least one buf=
fer,
- * which means it can go over the threshold once. If that happens, the dr=
iver
- * will be in debt and no other buffer migrations can be done until that =
debt
- * is repaid.
- *
- * This approach allows moving a buffer of any size (it's important to al=
low
- * that).
- *
- * The currency is simply time in microseconds and it increases as the cl=
ock
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
-	const s64 us_upper_bound =3D 200000;
-
-	if (!adev->mm_stats.log2_max_MBps) {
-		*max_bytes =3D 0;
-		*max_vis_bytes =3D 0;
-		return;
-	}
-
-	total_vram =3D adev->gmc.real_vram_size - atomic64_read(&adev->vram_pin_=
size);
-	used_vram =3D ttm_resource_manager_usage(&adev->mman.vram_mgr.manager);
-	free_vram =3D used_vram >=3D total_vram ? 0 : total_vram - used_vram;
-
-	spin_lock(&adev->mm_stats.lock);
-
-	/* Increase the amount of accumulated us. */
-	time_us =3D ktime_to_us(ktime_get());
-	increment_us =3D time_us - adev->mm_stats.last_update_us;
-	adev->mm_stats.last_update_us =3D time_us;
-	adev->mm_stats.accum_us =3D min(adev->mm_stats.accum_us + increment_us,
-				      us_upper_bound);
-
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
-	if (free_vram >=3D 128 * 1024 * 1024 || free_vram >=3D total_vram / 8) {
-		s64 min_us;
-
-		/* Be more aggressive on dGPUs. Try to fill a portion of free
-		 * VRAM now.
-		 */
-		if (!(adev->flags & AMD_IS_APU))
-			min_us =3D bytes_to_us(adev, free_vram / 4);
-		else
-			min_us =3D 0; /* Reset accum_us on APUs. */
-
-		adev->mm_stats.accum_us =3D max(min_us, adev->mm_stats.accum_us);
-	}
-
-	/* This is set to 0 if the driver is in debt to disallow (optional)
-	 * buffer moves.
-	 */
-	*max_bytes =3D us_to_bytes(adev, adev->mm_stats.accum_us);
-
-	/* Do the same for visible VRAM if half of it is free */
-	if (!amdgpu_gmc_vram_full_visible(&adev->gmc)) {
-		u64 total_vis_vram =3D adev->gmc.visible_vram_size;
-		u64 used_vis_vram =3D
-		  amdgpu_vram_mgr_vis_usage(&adev->mman.vram_mgr);
-
-		if (used_vis_vram < total_vis_vram) {
-			u64 free_vis_vram =3D total_vis_vram - used_vis_vram;
-
-			adev->mm_stats.accum_us_vis =3D min(adev->mm_stats.accum_us_vis +
-							  increment_us, us_upper_bound);
-
-			if (free_vis_vram >=3D total_vis_vram / 2)
-				adev->mm_stats.accum_us_vis =3D
-					max(bytes_to_us(adev, free_vis_vram / 2),
-					    adev->mm_stats.accum_us_vis);
-		}
-
-		*max_vis_bytes =3D us_to_bytes(adev, adev->mm_stats.accum_us_vis);
-	} else {
-		*max_vis_bytes =3D 0;
-	}
-
-	spin_unlock(&adev->mm_stats.lock);
-}
-
-/* Report how many bytes have really been moved for the last command
- * submission. This can result in a debt that can stop buffer migrations
- * temporarily.
- */
-void amdgpu_cs_report_moved_bytes(struct amdgpu_device *adev, u64 num_byt=
es,
-				  u64 num_vis_bytes)
-{
-	spin_lock(&adev->mm_stats.lock);
-	adev->mm_stats.accum_us -=3D bytes_to_us(adev, num_bytes);
-	adev->mm_stats.accum_us_vis -=3D bytes_to_us(adev, num_vis_bytes);
-	spin_unlock(&adev->mm_stats.lock);
-}
-
 static int amdgpu_cs_bo_validate(void *param, struct amdgpu_bo *bo)
 {
-	struct amdgpu_device *adev =3D amdgpu_ttm_adev(bo->tbo.bdev);
-	struct amdgpu_cs_parser *p =3D param;
 	struct ttm_operation_ctx ctx =3D {
 		.interruptible =3D true,
 		.no_wait_gpu =3D false,
 		.resv =3D bo->tbo.base.resv
 	};
-	uint32_t domain;
-	int r;

 	if (bo->tbo.pin_count)
 		return 0;

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
-				domain =3D bo->preferred_domains;
-			else
-				domain =3D bo->allowed_domains;
-		} else {
-			domain =3D bo->preferred_domains;
-		}
-	} else {
-		domain =3D bo->allowed_domains;
-	}
-
-retry:
-	amdgpu_bo_placement_from_domain(bo, domain);
-	r =3D ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
-
-	p->bytes_moved +=3D ctx.bytes_moved;
-	if (!amdgpu_gmc_vram_full_visible(&adev->gmc) &&
-	    amdgpu_res_cpu_visible(adev, bo->tbo.resource))
-		p->bytes_moved_vis +=3D ctx.bytes_moved;
-
-	if (unlikely(r =3D=3D -ENOMEM) && domain !=3D bo->allowed_domains) {
-		domain =3D bo->allowed_domains;
-		goto retry;
-	}
-
-	return r;
+	amdgpu_bo_placement_from_domain(bo, bo->allowed_domains);
+	return ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
 }

 static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
@@ -947,13 +770,8 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_pars=
er *p,
 		e->user_pages =3D NULL;
 	}

-	amdgpu_cs_get_threshold_for_moves(p->adev, &p->bytes_moved_threshold,
-					  &p->bytes_moved_vis_threshold);
-	p->bytes_moved =3D 0;
-	p->bytes_moved_vis =3D 0;
-
 	r =3D amdgpu_vm_validate(p->adev, &fpriv->vm, NULL,
-			       amdgpu_cs_bo_validate, p);
+			       amdgpu_cs_bo_validate, NULL);
 	if (r) {
 		DRM_ERROR("amdgpu_vm_validate() failed.\n");
 		goto out_free_user_pages;
@@ -973,9 +791,6 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parse=
r *p,
 		p->gang_leader->uf_addr +=3D amdgpu_bo_gpu_offset(p->uf_bo);
 	}

-	amdgpu_cs_report_moved_bytes(p->adev, p->bytes_moved,
-				     p->bytes_moved_vis);
-
 	for (i =3D 0; i < p->gang_size; ++i)
 		amdgpu_job_set_resources(p->jobs[i], p->bo_list->gds_obj,
 					 p->bo_list->gws_obj,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_cs.h
index 39c33ad100cb7..e3d04ac4764be 100644
=2D-- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h
@@ -67,10 +67,6 @@ struct amdgpu_cs_parser {
 	struct amdgpu_bo_list		*bo_list;
 	struct amdgpu_mn		*mn;
 	struct dma_fence		*fence;
-	uint64_t			bytes_moved_threshold;
-	uint64_t			bytes_moved_vis_threshold;
-	uint64_t			bytes_moved;
-	uint64_t			bytes_moved_vis;

 	/* user fence */
 	struct amdgpu_bo		*uf_bo;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_object.c
index 331b9ed8062c7..5834a95d680d9 100644
=2D-- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -621,13 +621,6 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
 	if (unlikely(r !=3D 0))
 		return r;

-	if (!amdgpu_gmc_vram_full_visible(&adev->gmc) &&
-	    amdgpu_res_cpu_visible(adev, bo->tbo.resource))
-		amdgpu_cs_report_moved_bytes(adev, ctx.bytes_moved,
-					     ctx.bytes_moved);
-	else
-		amdgpu_cs_report_moved_bytes(adev, ctx.bytes_moved, 0);
-
 	if (bp->flags & AMDGPU_GEM_CREATE_VRAM_CLEARED &&
 	    bo->tbo.resource->mem_type =3D=3D TTM_PL_VRAM) {
 		struct dma_fence *fence;
=2D-
2.44.0

