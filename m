Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB28E3A44D5
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 17:21:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50C256EEB5;
	Fri, 11 Jun 2021 15:21:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1A906EEAC
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 15:21:24 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id r9so6476487wrz.10
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 08:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=eHRT7kmMBf46JDowzG7HpuiDk8gjtISrNb+TeMrzI8M=;
 b=W6X8POMciQnbzFZEk4WJOh6eS/ShU1oQWRxshI0SC9JI3uEGmhXC0u3qlOa0ME6HFY
 9s26dhIS28SdIlPxLDdWyrC0wUr3q66N0fLLzsuwc1IgZ7S/kn6jXP+S1BDbIlH1aEHB
 GhKuKiSP0NGOc7KuTnMWoOfXqDhh4uD7SXszI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=eHRT7kmMBf46JDowzG7HpuiDk8gjtISrNb+TeMrzI8M=;
 b=rHm62ZpCF/yxn+vqILbeGY/h3+iHDZYCuzH3ul8BvKl/Tjz61iwVL2xtNjyjKEosRp
 BCjYt9qot/RN6dGF2O5VKbKH3iohUZGCAdilqe331I1frxLqIWxkw+ZZ3mEeHAj3H+zA
 wz3+D0scLU1qgb/0oNkPo+Lbsg0eufXLMMNoVzZDZFzTP5/mxGxML043U2MoCsM+JIEN
 MmJpvR6J1rq0T8dxdjEBN3YF/R3z+xP4GfiAw7S2XxljtJIBj8f6TEjTVUeGvY1zNbAf
 96/DYAEM4opyKGOxT+LLydZk/fZh/qNdFXBcARUVqNe+gSt7mbnitbuoJEA4wVCpkxXh
 lWow==
X-Gm-Message-State: AOAM531UU8lihSm1NeDIiTb08Vk+9GVRbsmZ8N+JUs3kcAV42ynnnisl
 3sCdoTr2Zxr8WADw/g8BhOXMFg==
X-Google-Smtp-Source: ABdhPJxOrtt85qHoSOFUm849A6VX6q/8UlnZxXRu++g+voRiqSfrnro4qdXd2oqsI9NZOiMrGPPfzg==
X-Received: by 2002:a5d:504d:: with SMTP id h13mr4675179wrt.133.1623424882637; 
 Fri, 11 Jun 2021 08:21:22 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l10sm7114144wrs.11.2021.06.11.08.21.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 08:21:21 -0700 (PDT)
Date: Fri, 11 Jun 2021 17:21:20 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 7/7] drm/amdgpu: rework dma_resv handling
Message-ID: <YMN/cPvzpRRB3z5B@phenom.ffwll.local>
References: <20210610091800.1833-1-christian.koenig@amd.com>
 <20210610091800.1833-8-christian.koenig@amd.com>
 <YMMqI2jRReeK067f@phenom.ffwll.local>
 <3a1eef23-7a9a-9a08-cb41-ce042d0bd36c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3a1eef23-7a9a-9a08-cb41-ce042d0bd36c@gmail.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 11, 2021 at 12:12:45PM +0200, Christian König wrote:
> Am 11.06.21 um 11:17 schrieb Daniel Vetter:
> > On Thu, Jun 10, 2021 at 11:18:00AM +0200, Christian König wrote:
> > > Drop the workaround and instead implement a better solution.
> > > 
> > > Basically we are now chaining all submissions using a dma_fence_chain
> > > container and adding them as exclusive fence to the dma_resv object.
> > > 
> > > This way other drivers can still sync to the single exclusive fence
> > > while amdgpu only sync to fences from different processes.
> > > 
> > > Signed-off-by: Christian König <christian.koenig@amd.com>
> > > ---
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h |  1 +
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c      | 54 +++++++++++++----
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 65 ---------------------
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c     |  3 +-
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  |  2 +-
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_object.h  |  1 -
> > >   6 files changed, 47 insertions(+), 79 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
> > > index a130e766cbdb..c905a4cfc173 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
> > > @@ -34,6 +34,7 @@ struct amdgpu_fpriv;
> > >   struct amdgpu_bo_list_entry {
> > >   	struct ttm_validate_buffer	tv;
> > >   	struct amdgpu_bo_va		*bo_va;
> > > +	struct dma_fence_chain		*chain;
> > >   	uint32_t			priority;
> > >   	struct page			**user_pages;
> > >   	bool				user_invalidated;
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> > > index 325e82621467..f6f3029f958d 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> > > @@ -587,6 +587,20 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
> > >   		goto out;
> > >   	}
> > > +	amdgpu_bo_list_for_each_entry(e, p->bo_list) {
> > > +		struct amdgpu_bo *bo = ttm_to_amdgpu_bo(e->tv.bo);
> > > +
> > > +		e->bo_va = amdgpu_vm_bo_find(vm, bo);
> > > +
> > > +		if (bo->tbo.base.dma_buf && !amdgpu_bo_explicit_sync(bo)) {
> > > +			e->chain = dma_fence_chain_alloc();
> > > +			if (!e->chain) {
> > > +				r = -ENOMEM;
> > > +				goto error_validate;
> > > +			}
> > > +		}
> > > +	}
> > > +
> > >   	amdgpu_cs_get_threshold_for_moves(p->adev, &p->bytes_moved_threshold,
> > >   					  &p->bytes_moved_vis_threshold);
> > >   	p->bytes_moved = 0;
> > > @@ -614,15 +628,6 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
> > >   	gws = p->bo_list->gws_obj;
> > >   	oa = p->bo_list->oa_obj;
> > > -	amdgpu_bo_list_for_each_entry(e, p->bo_list) {
> > > -		struct amdgpu_bo *bo = ttm_to_amdgpu_bo(e->tv.bo);
> > > -
> > > -		/* Make sure we use the exclusive slot for shared BOs */
> > > -		if (bo->prime_shared_count)
> > > -			e->tv.num_shared = 0;
> > > -		e->bo_va = amdgpu_vm_bo_find(vm, bo);
> > > -	}
> > > -
> > >   	if (gds) {
> > >   		p->job->gds_base = amdgpu_bo_gpu_offset(gds) >> PAGE_SHIFT;
> > >   		p->job->gds_size = amdgpu_bo_size(gds) >> PAGE_SHIFT;
> > > @@ -644,8 +649,13 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
> > >   	}
> > >   error_validate:
> > > -	if (r)
> > > +	if (r) {
> > > +		amdgpu_bo_list_for_each_entry(e, p->bo_list) {
> > > +			dma_fence_chain_free(e->chain);
> > > +			e->chain = NULL;
> > > +		}
> > >   		ttm_eu_backoff_reservation(&p->ticket, &p->validated);
> > > +	}
> > >   out:
> > >   	return r;
> > >   }
> > > @@ -685,9 +695,17 @@ static void amdgpu_cs_parser_fini(struct amdgpu_cs_parser *parser, int error,
> > >   {
> > >   	unsigned i;
> > > -	if (error && backoff)
> > > +	if (error && backoff) {
> > > +		struct amdgpu_bo_list_entry *e;
> > > +
> > > +		amdgpu_bo_list_for_each_entry(e, parser->bo_list) {
> > > +			dma_fence_chain_free(e->chain);
> > > +			e->chain = NULL;
> > > +		}
> > > +
> > >   		ttm_eu_backoff_reservation(&parser->ticket,
> > >   					   &parser->validated);
> > > +	}
> > >   	for (i = 0; i < parser->num_post_deps; i++) {
> > >   		drm_syncobj_put(parser->post_deps[i].syncobj);
> > > @@ -1260,6 +1278,20 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
> > >   	amdgpu_vm_move_to_lru_tail(p->adev, &fpriv->vm);
> > > +	amdgpu_bo_list_for_each_entry(e, p->bo_list) {
> > > +		struct dma_resv *resv = e->tv.bo->base.resv;
> > > +		struct dma_fence_chain *chain = e->chain;
> > > +
> > > +		if (!chain)
> > > +			continue;
> > > +
> > > +		dma_fence_chain_init(chain, dma_resv_excl_fence(resv),
> > > +				     dma_fence_get(p->fence), 1);
> > > +
> > > +		rcu_assign_pointer(resv->fence_excl, &chain->base);
> > So for safety since this is now driver interface I was thinking off a
> > helper which does this entire dance and _also_ adds the new fence to the
> > shared slots. This way we don't let drivers open-code this rather tricky
> > operation.
> 
> Well I only see this as a workaround for amdgpu and don't want to leak it
> into other drivers.
> 
> If somebody else wants to adopt it we should probably consider fixing the
> dma_resv object instead.

Well semantically this is exactly what what the sync_file import from
Jason does. And it's kinda also what a lot of the drivers with opt-out
implicit sync should be doing.

So I really think we do need this as a dma_resv primitive in form of a
function drivers can use. Once we have that rolled out and tested some,
then we can fix up the internals of dma_resv to make this case more
efficient.

> > You probably also want to then combine this with
> > ttm_eu_fence_buffer_objects below I think so you're not walking this list
> > 2x.
> > 
> > Iow I'd put the fence_chain parameter into struct ttm_validate_buffer and
> > then let ttm_eu_fence_buffer_objects() do this, by calling a new
> > dma_resv_add_shared_excl_fence. Ideally the same helper that also Jason's
> > sync_file import will use. We want to hide the inner workings of dma_resv
> > as much as possible ofc.
> > 
> > The other thing I'm wondering is whether this needs to be wrapped in a
> > single seqlock or whether we don't have ordering issues if we split up the
> > update here? Setting the exclusive fence before we also added it to the
> > shared slot can at least violate the "shared fences signal after exclusive
> > if both are present"
> 
> Uff, good point.

Plus it's actually fairly tricky thing :-)
-Daniel

> 
> > Finally I guess need to sprinkle the manual garbage collector somehwere
> > here too.
> 
> That is done automatically when somebody iterates the chain node.
> 
> Christian.
> 
> > 
> > But aside from the interface polish and correctness against races I think
> > this looks solid in the big picture.
> > 
> > Cheers, Daniel
> > 
> > > +		e->chain = NULL;
> > > +	}
> > > +
> > >   	ttm_eu_fence_buffer_objects(&p->ticket, &p->validated, p->fence);
> > >   	mutex_unlock(&p->adev->notifier_lock);
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> > > index c3053b83b80c..23219fc3b28c 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> > > @@ -42,48 +42,6 @@
> > >   #include <linux/pci-p2pdma.h>
> > >   #include <linux/pm_runtime.h>
> > > -static int
> > > -__dma_resv_make_exclusive(struct dma_resv *obj)
> > > -{
> > > -	struct dma_fence **fences;
> > > -	unsigned int count;
> > > -	int r;
> > > -
> > > -	if (!dma_resv_shared_list(obj)) /* no shared fences to convert */
> > > -		return 0;
> > > -
> > > -	r = dma_resv_get_fences(obj, NULL, &count, &fences);
> > > -	if (r)
> > > -		return r;
> > > -
> > > -	if (count == 0) {
> > > -		/* Now that was unexpected. */
> > > -	} else if (count == 1) {
> > > -		dma_resv_add_excl_fence(obj, fences[0]);
> > > -		dma_fence_put(fences[0]);
> > > -		kfree(fences);
> > > -	} else {
> > > -		struct dma_fence_array *array;
> > > -
> > > -		array = dma_fence_array_create(count, fences,
> > > -					       dma_fence_context_alloc(1), 0,
> > > -					       false);
> > > -		if (!array)
> > > -			goto err_fences_put;
> > > -
> > > -		dma_resv_add_excl_fence(obj, &array->base);
> > > -		dma_fence_put(&array->base);
> > > -	}
> > > -
> > > -	return 0;
> > > -
> > > -err_fences_put:
> > > -	while (count--)
> > > -		dma_fence_put(fences[count]);
> > > -	kfree(fences);
> > > -	return -ENOMEM;
> > > -}
> > > -
> > >   /**
> > >    * amdgpu_dma_buf_attach - &dma_buf_ops.attach implementation
> > >    *
> > > @@ -110,24 +68,6 @@ static int amdgpu_dma_buf_attach(struct dma_buf *dmabuf,
> > >   	if (r < 0)
> > >   		goto out;
> > > -	r = amdgpu_bo_reserve(bo, false);
> > > -	if (unlikely(r != 0))
> > > -		goto out;
> > > -
> > > -	/*
> > > -	 * We only create shared fences for internal use, but importers
> > > -	 * of the dmabuf rely on exclusive fences for implicitly
> > > -	 * tracking write hazards. As any of the current fences may
> > > -	 * correspond to a write, we need to convert all existing
> > > -	 * fences on the reservation object into a single exclusive
> > > -	 * fence.
> > > -	 */
> > > -	r = __dma_resv_make_exclusive(bo->tbo.base.resv);
> > > -	if (r)
> > > -		goto out;
> > > -
> > > -	bo->prime_shared_count++;
> > > -	amdgpu_bo_unreserve(bo);
> > >   	return 0;
> > >   out:
> > > @@ -150,9 +90,6 @@ static void amdgpu_dma_buf_detach(struct dma_buf *dmabuf,
> > >   	struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
> > >   	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
> > > -	if (attach->dev->driver != adev->dev->driver && bo->prime_shared_count)
> > > -		bo->prime_shared_count--;
> > > -
> > >   	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
> > >   	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
> > >   }
> > > @@ -406,8 +343,6 @@ amdgpu_dma_buf_create_obj(struct drm_device *dev, struct dma_buf *dma_buf)
> > >   	bo = gem_to_amdgpu_bo(gobj);
> > >   	bo->allowed_domains = AMDGPU_GEM_DOMAIN_GTT;
> > >   	bo->preferred_domains = AMDGPU_GEM_DOMAIN_GTT;
> > > -	if (dma_buf->ops != &amdgpu_dmabuf_ops)
> > > -		bo->prime_shared_count = 1;
> > >   	dma_resv_unlock(resv);
> > >   	return gobj;
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> > > index 1c3e3b608332..5d82120fc160 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> > > @@ -829,7 +829,8 @@ int amdgpu_gem_op_ioctl(struct drm_device *dev, void *data,
> > >   		break;
> > >   	}
> > >   	case AMDGPU_GEM_OP_SET_PLACEMENT:
> > > -		if (robj->prime_shared_count && (args->value & AMDGPU_GEM_DOMAIN_VRAM)) {
> > > +		if (robj->tbo.base.import_attach &&
> > > +		    args->value & AMDGPU_GEM_DOMAIN_VRAM) {
> > >   			r = -EINVAL;
> > >   			amdgpu_bo_unreserve(robj);
> > >   			break;
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> > > index 96447e1d4c9c..30951b593809 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> > > @@ -871,7 +871,7 @@ int amdgpu_bo_pin_restricted(struct amdgpu_bo *bo, u32 domain,
> > >   		return -EINVAL;
> > >   	/* A shared bo cannot be migrated to VRAM */
> > > -	if (bo->prime_shared_count || bo->tbo.base.import_attach) {
> > > +	if (bo->tbo.base.import_attach) {
> > >   		if (domain & AMDGPU_GEM_DOMAIN_GTT)
> > >   			domain = AMDGPU_GEM_DOMAIN_GTT;
> > >   		else
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> > > index b35962702278..55d7e90eaa72 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> > > @@ -98,7 +98,6 @@ struct amdgpu_bo {
> > >   	struct ttm_buffer_object	tbo;
> > >   	struct ttm_bo_kmap_obj		kmap;
> > >   	u64				flags;
> > > -	unsigned			prime_shared_count;
> > >   	/* per VM structure for page tables and with virtual addresses */
> > >   	struct amdgpu_vm_bo_base	*vm_bo;
> > >   	/* Constant after initialization */
> > > -- 
> > > 2.25.1
> > > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
