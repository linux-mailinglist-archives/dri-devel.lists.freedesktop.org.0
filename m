Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B2628BA86
	for <lists+dri-devel@lfdr.de>; Mon, 12 Oct 2020 16:14:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4F686E483;
	Mon, 12 Oct 2020 14:14:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03F956E46B
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Oct 2020 14:14:29 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id e17so19346067wru.12
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Oct 2020 07:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=9ibijnEN2JPc5oBpFC/2hm00LYtiw367RVa/8x48tgU=;
 b=c+K8bRytdmB4IiSK2WDkbjp/aatktTmUeQtKCodGWDM4Ddga1JlWUO0OQdfm2Y7SPL
 kXJNW7lx40Qq8M9kgZrIpwcvDsaZAbuxPLnqKgOxLcWOPPn8W9u2LNTyjm5xMPnp9kNJ
 80vlIWGGYaz74TCWhCGtN4Du4N68tbRXl+yRE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=9ibijnEN2JPc5oBpFC/2hm00LYtiw367RVa/8x48tgU=;
 b=Texgcux/ntiVpodAZYw6t1tAl4IWhIgnrA6RSDtdLmU92eNk5KjTwu+KoNwdNfI4wd
 yfaDmo++R+8Q0DZEl9jOYhopP66qPKKpUWvQK0BfR60g0bzpg9WGJezQkdlB+7//QSCT
 OMAwia2IRKJQks2++ppQK22BTvDOLFwhO6ui2+dJTiqSrXQ0Td2Jepa9+Cz1ocboMa+c
 Cz3qYUNQAhW8kARZ5PjLtEd21Ei4Kmukt+wL9doPkuIvjPAGwOnfThV1IBmnQWO0q9rf
 1Eyrc2E/qEhXiutFepOPQH8b/CjtJAEGeFkfRi4u6YwBFPa5sLw2adhF08D006fS/46M
 alVg==
X-Gm-Message-State: AOAM532Hp//LewH74cLHkk7RHyXZ5JWm4kINJK0uPFsX9zZqXyHrGcdi
 lhtolypvxVtivMQS5elQkP3H2oQt5rV934am
X-Google-Smtp-Source: ABdhPJymKortu71DWPRSNwsvUUD88nrvEABEGsLnWBZImIN/CA+TqrRJkTeiIkS9M+wdms6PdRAdDQ==
X-Received: by 2002:a5d:4802:: with SMTP id l2mr29297196wrq.282.1602512067448; 
 Mon, 12 Oct 2020 07:14:27 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r1sm25059995wro.18.2020.10.12.07.14.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 07:14:26 -0700 (PDT)
Date: Mon, 12 Oct 2020 16:14:25 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 1/4] drm/ttm: set the tt caching state at creation time
Message-ID: <20201012141425.GW438822@phenom.ffwll.local>
References: <20201008093154.2991-1-christian.koenig@amd.com>
 <a40e5ba8-4710-6902-3e58-aacc0f817155@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a40e5ba8-4710-6902-3e58-aacc0f817155@gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 12, 2020 at 10:57:57AM +0200, Christian K=F6nig wrote:
> Ping? Anybody any more comments on this?
> =

> Otherwise I'm going to push it to drm-misc-next by tomorrow or so.

tbh the entire coherency/caching topic is imo a giantic mess in
drivers/gpu (mostly because we're half-fighting dma-api all the time). But
I don't have clear opinion where to go, hence *shrug*.
-Daniel

> =

> Thanks,
> Christian.
> =

> Am 08.10.20 um 11:31 schrieb Christian K=F6nig:
> > All drivers can determine the tt caching state at creation time,
> > no need to do this on the fly during every validation.
> > =

> > Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> > Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c    |  2 +-
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 11 +++++--
> >   drivers/gpu/drm/drm_gem_vram_helper.c      |  2 +-
> >   drivers/gpu/drm/nouveau/nouveau_sgdma.c    | 13 ++++++++-
> >   drivers/gpu/drm/qxl/qxl_ttm.c              |  2 +-
> >   drivers/gpu/drm/radeon/radeon_ttm.c        | 16 ++++++++--
> >   drivers/gpu/drm/ttm/ttm_agp_backend.c      |  2 +-
> >   drivers/gpu/drm/ttm/ttm_page_alloc.c       | 26 ++++++++---------
> >   drivers/gpu/drm/ttm/ttm_page_alloc_dma.c   | 20 ++++++-------
> >   drivers/gpu/drm/ttm/ttm_tt.c               | 33 +++++++++++----------
> >   drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c |  6 ++--
> >   include/drm/ttm/ttm_caching.h              | 34 ++++++++++++++++++++++
> >   include/drm/ttm/ttm_tt.h                   | 16 ++++------
> >   13 files changed, 123 insertions(+), 60 deletions(-)
> >   create mode 100644 include/drm/ttm/ttm_caching.h
> > =

> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_gmc.c
> > index 213ef090bb0e..3c5ad69eff19 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> > @@ -124,7 +124,7 @@ uint64_t amdgpu_gmc_agp_addr(struct ttm_buffer_obje=
ct *bo)
> >   	struct amdgpu_device *adev =3D amdgpu_ttm_adev(bo->bdev);
> >   	struct ttm_dma_tt *ttm;
> > -	if (bo->num_pages !=3D 1 || bo->ttm->caching_state =3D=3D tt_cached)
> > +	if (bo->num_pages !=3D 1 || bo->ttm->caching =3D=3D ttm_cached)
> >   		return AMDGPU_BO_INVALID_OFFSET;
> >   	ttm =3D container_of(bo->ttm, struct ttm_dma_tt, ttm);
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_ttm.c
> > index 399961035ae6..7f41a47e7353 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> > @@ -1292,7 +1292,9 @@ static void amdgpu_ttm_backend_destroy(struct ttm=
_bo_device *bdev,
> >   static struct ttm_tt *amdgpu_ttm_tt_create(struct ttm_buffer_object *=
bo,
> >   					   uint32_t page_flags)
> >   {
> > +	struct amdgpu_bo *abo =3D ttm_to_amdgpu_bo(bo);
> >   	struct amdgpu_ttm_tt *gtt;
> > +	enum ttm_caching caching;
> >   	gtt =3D kzalloc(sizeof(struct amdgpu_ttm_tt), GFP_KERNEL);
> >   	if (gtt =3D=3D NULL) {
> > @@ -1300,8 +1302,13 @@ static struct ttm_tt *amdgpu_ttm_tt_create(struc=
t ttm_buffer_object *bo,
> >   	}
> >   	gtt->gobj =3D &bo->base;
> > +	if (abo->flags & AMDGPU_GEM_CREATE_CPU_GTT_USWC)
> > +		caching =3D ttm_write_combined;
> > +	else
> > +		caching =3D ttm_cached;
> > +
> >   	/* allocate space for the uninitialized page entries */
> > -	if (ttm_sg_tt_init(&gtt->ttm, bo, page_flags)) {
> > +	if (ttm_sg_tt_init(&gtt->ttm, bo, page_flags, caching)) {
> >   		kfree(gtt);
> >   		return NULL;
> >   	}
> > @@ -1525,7 +1532,7 @@ uint64_t amdgpu_ttm_tt_pde_flags(struct ttm_tt *t=
tm, struct ttm_resource *mem)
> >   	if (mem && mem->mem_type =3D=3D TTM_PL_TT) {
> >   		flags |=3D AMDGPU_PTE_SYSTEM;
> > -		if (ttm->caching_state =3D=3D tt_cached)
> > +		if (ttm->caching =3D=3D ttm_cached)
> >   			flags |=3D AMDGPU_PTE_SNOOPED;
> >   	}
> > diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/dr=
m_gem_vram_helper.c
> > index 3213429f8444..ad58d0af5141 100644
> > --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> > +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> > @@ -918,7 +918,7 @@ static struct ttm_tt *bo_driver_ttm_tt_create(struc=
t ttm_buffer_object *bo,
> >   	if (!tt)
> >   		return NULL;
> > -	ret =3D ttm_tt_init(tt, bo, page_flags);
> > +	ret =3D ttm_tt_init(tt, bo, page_flags, ttm_cached);
> >   	if (ret < 0)
> >   		goto err_ttm_tt_init;
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_sgdma.c b/drivers/gpu/drm/=
nouveau/nouveau_sgdma.c
> > index 806d9ec310f5..cd6fdebae795 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_sgdma.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_sgdma.c
> > @@ -5,6 +5,7 @@
> >   #include "nouveau_drv.h"
> >   #include "nouveau_mem.h"
> >   #include "nouveau_ttm.h"
> > +#include "nouveau_bo.h"
> >   struct nouveau_sgdma_be {
> >   	/* this has to be the first field so populate/unpopulated in
> > @@ -67,13 +68,23 @@ nouveau_sgdma_unbind(struct ttm_bo_device *bdev, st=
ruct ttm_tt *ttm)
> >   struct ttm_tt *
> >   nouveau_sgdma_create_ttm(struct ttm_buffer_object *bo, uint32_t page_=
flags)
> >   {
> > +	struct nouveau_drm *drm =3D nouveau_bdev(bo->bdev);
> > +	struct nouveau_bo *nvbo =3D nouveau_bo(bo);
> >   	struct nouveau_sgdma_be *nvbe;
> > +	enum ttm_caching caching;
> > +
> > +	if (nvbo->force_coherent)
> > +		caching =3D ttm_uncached;
> > +	else if (drm->agp.bridge)
> > +		caching =3D ttm_write_combined;
> > +	else
> > +		caching =3D ttm_cached;
> >   	nvbe =3D kzalloc(sizeof(*nvbe), GFP_KERNEL);
> >   	if (!nvbe)
> >   		return NULL;
> > -	if (ttm_dma_tt_init(&nvbe->ttm, bo, page_flags)) {
> > +	if (ttm_dma_tt_init(&nvbe->ttm, bo, page_flags, caching)) {
> >   		kfree(nvbe);
> >   		return NULL;
> >   	}
> > diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_tt=
m.c
> > index 669bceb58205..f50863493f64 100644
> > --- a/drivers/gpu/drm/qxl/qxl_ttm.c
> > +++ b/drivers/gpu/drm/qxl/qxl_ttm.c
> > @@ -133,7 +133,7 @@ static struct ttm_tt *qxl_ttm_tt_create(struct ttm_=
buffer_object *bo,
> >   	ttm =3D kzalloc(sizeof(struct ttm_tt), GFP_KERNEL);
> >   	if (ttm =3D=3D NULL)
> >   		return NULL;
> > -	if (ttm_tt_init(ttm, bo, page_flags)) {
> > +	if (ttm_tt_init(ttm, bo, page_flags, ttm_cached)) {
> >   		kfree(ttm);
> >   		return NULL;
> >   	}
> > diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/rade=
on/radeon_ttm.c
> > index 63e38b05a5bc..130a7cea35c3 100644
> > --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> > +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> > @@ -546,7 +546,7 @@ static int radeon_ttm_backend_bind(struct ttm_bo_de=
vice *bdev,
> >   		WARN(1, "nothing to bind %lu pages for mreg %p back %p!\n",
> >   		     ttm->num_pages, bo_mem, ttm);
> >   	}
> > -	if (ttm->caching_state =3D=3D tt_cached)
> > +	if (ttm->caching =3D=3D ttm_cached)
> >   		flags |=3D RADEON_GART_PAGE_SNOOP;
> >   	r =3D radeon_gart_bind(rdev, gtt->offset, ttm->num_pages,
> >   			     ttm->pages, gtt->ttm.dma_address, flags);
> > @@ -590,6 +590,10 @@ static struct ttm_tt *radeon_ttm_tt_create(struct =
ttm_buffer_object *bo,
> >   {
> >   	struct radeon_device *rdev;
> >   	struct radeon_ttm_tt *gtt;
> > +	enum ttm_caching caching;
> > +	struct radeon_bo *rbo;
> > +
> > +	rbo =3D container_of(bo, struct radeon_bo, tbo);
> >   	rdev =3D radeon_get_rdev(bo->bdev);
> >   #if IS_ENABLED(CONFIG_AGP)
> > @@ -603,7 +607,15 @@ static struct ttm_tt *radeon_ttm_tt_create(struct =
ttm_buffer_object *bo,
> >   	if (gtt =3D=3D NULL) {
> >   		return NULL;
> >   	}
> > -	if (ttm_dma_tt_init(&gtt->ttm, bo, page_flags)) {
> > +
> > +	if (rbo->flags & RADEON_GEM_GTT_UC)
> > +		caching =3D ttm_uncached;
> > +	else if (rbo->flags & RADEON_GEM_GTT_WC)
> > +		caching =3D ttm_write_combined;
> > +	else
> > +		caching =3D ttm_cached;
> > +
> > +	if (ttm_dma_tt_init(&gtt->ttm, bo, page_flags, caching)) {
> >   		kfree(gtt);
> >   		return NULL;
> >   	}
> > diff --git a/drivers/gpu/drm/ttm/ttm_agp_backend.c b/drivers/gpu/drm/tt=
m/ttm_agp_backend.c
> > index a98fd795b752..a723062d37e7 100644
> > --- a/drivers/gpu/drm/ttm/ttm_agp_backend.c
> > +++ b/drivers/gpu/drm/ttm/ttm_agp_backend.c
> > @@ -136,7 +136,7 @@ struct ttm_tt *ttm_agp_tt_create(struct ttm_buffer_=
object *bo,
> >   	agp_be->mem =3D NULL;
> >   	agp_be->bridge =3D bridge;
> > -	if (ttm_tt_init(&agp_be->ttm, bo, page_flags)) {
> > +	if (ttm_tt_init(&agp_be->ttm, bo, page_flags, ttm_write_combined)) {
> >   		kfree(agp_be);
> >   		return NULL;
> >   	}
> > diff --git a/drivers/gpu/drm/ttm/ttm_page_alloc.c b/drivers/gpu/drm/ttm=
/ttm_page_alloc.c
> > index 111031cbb6df..c8f6790962b9 100644
> > --- a/drivers/gpu/drm/ttm/ttm_page_alloc.c
> > +++ b/drivers/gpu/drm/ttm/ttm_page_alloc.c
> > @@ -220,14 +220,14 @@ static struct ttm_pool_manager *_manager;
> >   /**
> >    * Select the right pool or requested caching state and ttm flags. */
> >   static struct ttm_page_pool *ttm_get_pool(int flags, bool huge,
> > -					  enum ttm_caching_state cstate)
> > +					  enum ttm_caching cstate)
> >   {
> >   	int pool_index;
> > -	if (cstate =3D=3D tt_cached)
> > +	if (cstate =3D=3D ttm_cached)
> >   		return NULL;
> > -	if (cstate =3D=3D tt_wc)
> > +	if (cstate =3D=3D ttm_write_combined)
> >   		pool_index =3D 0x0;
> >   	else
> >   		pool_index =3D 0x1;
> > @@ -441,17 +441,17 @@ static void ttm_pool_mm_shrink_fini(struct ttm_po=
ol_manager *manager)
> >   }
> >   static int ttm_set_pages_caching(struct page **pages,
> > -		enum ttm_caching_state cstate, unsigned cpages)
> > +		enum ttm_caching cstate, unsigned cpages)
> >   {
> >   	int r =3D 0;
> >   	/* Set page caching */
> >   	switch (cstate) {
> > -	case tt_uncached:
> > +	case ttm_uncached:
> >   		r =3D ttm_set_pages_array_uc(pages, cpages);
> >   		if (r)
> >   			pr_err("Failed to set %d pages to uc!\n", cpages);
> >   		break;
> > -	case tt_wc:
> > +	case ttm_write_combined:
> >   		r =3D ttm_set_pages_array_wc(pages, cpages);
> >   		if (r)
> >   			pr_err("Failed to set %d pages to wc!\n", cpages);
> > @@ -486,7 +486,7 @@ static void ttm_handle_caching_failure(struct page =
**failed_pages,
> >    * pages returned in pages array.
> >    */
> >   static int ttm_alloc_new_pages(struct list_head *pages, gfp_t gfp_fla=
gs,
> > -			       int ttm_flags, enum ttm_caching_state cstate,
> > +			       int ttm_flags, enum ttm_caching cstate,
> >   			       unsigned count, unsigned order)
> >   {
> >   	struct page **caching_array;
> > @@ -566,7 +566,7 @@ static int ttm_alloc_new_pages(struct list_head *pa=
ges, gfp_t gfp_flags,
> >    * pages is small.
> >    */
> >   static void ttm_page_pool_fill_locked(struct ttm_page_pool *pool, int=
 ttm_flags,
> > -				      enum ttm_caching_state cstate,
> > +				      enum ttm_caching cstate,
> >   				      unsigned count, unsigned long *irq_flags)
> >   {
> >   	struct page *p;
> > @@ -626,7 +626,7 @@ static void ttm_page_pool_fill_locked(struct ttm_pa=
ge_pool *pool, int ttm_flags,
> >   static int ttm_page_pool_get_pages(struct ttm_page_pool *pool,
> >   				   struct list_head *pages,
> >   				   int ttm_flags,
> > -				   enum ttm_caching_state cstate,
> > +				   enum ttm_caching cstate,
> >   				   unsigned count, unsigned order)
> >   {
> >   	unsigned long irq_flags;
> > @@ -703,7 +703,7 @@ static int ttm_page_pool_get_pages(struct ttm_page_=
pool *pool,
> >   /* Put all pages in pages list to correct pool to wait for reuse */
> >   static void ttm_put_pages(struct page **pages, unsigned npages, int f=
lags,
> > -			  enum ttm_caching_state cstate)
> > +			  enum ttm_caching cstate)
> >   {
> >   	struct ttm_page_pool *pool =3D ttm_get_pool(flags, false, cstate);
> >   #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> > @@ -821,7 +821,7 @@ static void ttm_put_pages(struct page **pages, unsi=
gned npages, int flags,
> >    * cached pages.
> >    */
> >   static int ttm_get_pages(struct page **pages, unsigned npages, int fl=
ags,
> > -			 enum ttm_caching_state cstate)
> > +			 enum ttm_caching cstate)
> >   {
> >   	struct ttm_page_pool *pool =3D ttm_get_pool(flags, false, cstate);
> >   #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> > @@ -1040,7 +1040,7 @@ ttm_pool_unpopulate_helper(struct ttm_tt *ttm, un=
signed mem_count_update)
> >   put_pages:
> >   	ttm_put_pages(ttm->pages, ttm->num_pages, ttm->page_flags,
> > -		      ttm->caching_state);
> > +		      ttm->caching);
> >   	ttm_tt_set_unpopulated(ttm);
> >   }
> > @@ -1057,7 +1057,7 @@ int ttm_pool_populate(struct ttm_tt *ttm, struct =
ttm_operation_ctx *ctx)
> >   		return -ENOMEM;
> >   	ret =3D ttm_get_pages(ttm->pages, ttm->num_pages, ttm->page_flags,
> > -			    ttm->caching_state);
> > +			    ttm->caching);
> >   	if (unlikely(ret !=3D 0)) {
> >   		ttm_pool_unpopulate_helper(ttm, 0);
> >   		return ret;
> > diff --git a/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c b/drivers/gpu/drm=
/ttm/ttm_page_alloc_dma.c
> > index 1045a5c26ee3..6625b43f6256 100644
> > --- a/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c
> > +++ b/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c
> > @@ -325,15 +325,15 @@ static struct dma_page *__ttm_dma_alloc_page(stru=
ct dma_pool *pool)
> >   	}
> >   	return d_page;
> >   }
> > -static enum pool_type ttm_to_type(int flags, enum ttm_caching_state cs=
tate)
> > +static enum pool_type ttm_to_type(int flags, enum ttm_caching cstate)
> >   {
> >   	enum pool_type type =3D IS_UNDEFINED;
> >   	if (flags & TTM_PAGE_FLAG_DMA32)
> >   		type |=3D IS_DMA32;
> > -	if (cstate =3D=3D tt_cached)
> > +	if (cstate =3D=3D ttm_cached)
> >   		type |=3D IS_CACHED;
> > -	else if (cstate =3D=3D tt_uncached)
> > +	else if (cstate =3D=3D ttm_uncached)
> >   		type |=3D IS_UC;
> >   	else
> >   		type |=3D IS_WC;
> > @@ -663,7 +663,7 @@ static struct dma_pool *ttm_dma_find_pool(struct de=
vice *dev,
> >    * are pages that have changed their caching state already put them t=
o the
> >    * pool.
> >    */
> > -static void ttm_dma_handle_caching_state_failure(struct dma_pool *pool,
> > +static void ttm_dma_handle_caching_failure(struct dma_pool *pool,
> >   						 struct list_head *d_pages,
> >   						 struct page **failed_pages,
> >   						 unsigned cpages)
> > @@ -734,7 +734,7 @@ static int ttm_dma_pool_alloc_new_pages(struct dma_=
pool *pool,
> >   				r =3D ttm_set_pages_caching(pool, caching_array,
> >   							  cpages);
> >   				if (r)
> > -					ttm_dma_handle_caching_state_failure(
> > +					ttm_dma_handle_caching_failure(
> >   						pool, d_pages, caching_array,
> >   						cpages);
> >   			}
> > @@ -760,7 +760,7 @@ static int ttm_dma_pool_alloc_new_pages(struct dma_=
pool *pool,
> >   				r =3D ttm_set_pages_caching(pool, caching_array,
> >   							  cpages);
> >   				if (r) {
> > -					ttm_dma_handle_caching_state_failure(
> > +					ttm_dma_handle_caching_failure(
> >   					     pool, d_pages, caching_array,
> >   					     cpages);
> >   					goto out;
> > @@ -773,7 +773,7 @@ static int ttm_dma_pool_alloc_new_pages(struct dma_=
pool *pool,
> >   	if (cpages) {
> >   		r =3D ttm_set_pages_caching(pool, caching_array, cpages);
> >   		if (r)
> > -			ttm_dma_handle_caching_state_failure(pool, d_pages,
> > +			ttm_dma_handle_caching_failure(pool, d_pages,
> >   					caching_array, cpages);
> >   	}
> >   out:
> > @@ -904,7 +904,7 @@ int ttm_dma_populate(struct ttm_dma_tt *ttm_dma, st=
ruct device *dev,
> >   	INIT_LIST_HEAD(&ttm_dma->pages_list);
> >   	i =3D 0;
> > -	type =3D ttm_to_type(ttm->page_flags, ttm->caching_state);
> > +	type =3D ttm_to_type(ttm->page_flags, ttm->caching);
> >   #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> >   	if (ttm->page_flags & TTM_PAGE_FLAG_DMA32)
> > @@ -1000,7 +1000,7 @@ void ttm_dma_unpopulate(struct ttm_dma_tt *ttm_dm=
a, struct device *dev)
> >   	unsigned count, i, npages =3D 0;
> >   	unsigned long irq_flags;
> > -	type =3D ttm_to_type(ttm->page_flags, ttm->caching_state);
> > +	type =3D ttm_to_type(ttm->page_flags, ttm->caching);
> >   #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> >   	pool =3D ttm_dma_find_pool(dev, type | IS_HUGE);
> > @@ -1032,7 +1032,7 @@ void ttm_dma_unpopulate(struct ttm_dma_tt *ttm_dm=
a, struct device *dev)
> >   		return;
> >   	is_cached =3D (ttm_dma_find_pool(pool->dev,
> > -		     ttm_to_type(ttm->page_flags, tt_cached)) =3D=3D pool);
> > +		     ttm_to_type(ttm->page_flags, ttm_cached)) =3D=3D pool);
> >   	/* make sure pages array match list and count number of pages */
> >   	count =3D 0;
> > diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> > index 23e9604bc924..a465f51df027 100644
> > --- a/drivers/gpu/drm/ttm/ttm_tt.c
> > +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> > @@ -114,31 +114,30 @@ static int ttm_sg_tt_alloc_page_directory(struct =
ttm_dma_tt *ttm)
> >   	return 0;
> >   }
> > -static int ttm_tt_set_caching(struct ttm_tt *ttm,
> > -			      enum ttm_caching_state c_state)
> > +static int ttm_tt_set_caching(struct ttm_tt *ttm, enum ttm_caching cac=
hing)
> >   {
> > -	if (ttm->caching_state =3D=3D c_state)
> > +	if (ttm->caching =3D=3D caching)
> >   		return 0;
> >   	/* Can't change the caching state after TT is populated */
> >   	if (WARN_ON_ONCE(ttm_tt_is_populated(ttm)))
> >   		return -EINVAL;
> > -	ttm->caching_state =3D c_state;
> > +	ttm->caching =3D caching;
> >   	return 0;
> >   }
> >   int ttm_tt_set_placement_caching(struct ttm_tt *ttm, uint32_t placeme=
nt)
> >   {
> > -	enum ttm_caching_state state;
> > +	enum ttm_caching state;
> >   	if (placement & TTM_PL_FLAG_WC)
> > -		state =3D tt_wc;
> > +		state =3D ttm_write_combined;
> >   	else if (placement & TTM_PL_FLAG_UNCACHED)
> > -		state =3D tt_uncached;
> > +		state =3D ttm_uncached;
> >   	else
> > -		state =3D tt_cached;
> > +		state =3D ttm_cached;
> >   	return ttm_tt_set_caching(ttm, state);
> >   }
> > @@ -162,20 +161,22 @@ void ttm_tt_destroy(struct ttm_bo_device *bdev, s=
truct ttm_tt *ttm)
> >   static void ttm_tt_init_fields(struct ttm_tt *ttm,
> >   			       struct ttm_buffer_object *bo,
> > -			       uint32_t page_flags)
> > +			       uint32_t page_flags,
> > +			       enum ttm_caching caching)
> >   {
> >   	ttm->num_pages =3D bo->num_pages;
> > -	ttm->caching_state =3D tt_cached;
> > +	ttm->caching =3D ttm_cached;
> >   	ttm->page_flags =3D page_flags;
> >   	ttm_tt_set_unpopulated(ttm);
> >   	ttm->swap_storage =3D NULL;
> >   	ttm->sg =3D bo->sg;
> > +	ttm->caching =3D caching;
> >   }
> >   int ttm_tt_init(struct ttm_tt *ttm, struct ttm_buffer_object *bo,
> > -		uint32_t page_flags)
> > +		uint32_t page_flags, enum ttm_caching caching)
> >   {
> > -	ttm_tt_init_fields(ttm, bo, page_flags);
> > +	ttm_tt_init_fields(ttm, bo, page_flags, caching);
> >   	if (ttm_tt_alloc_page_directory(ttm)) {
> >   		pr_err("Failed allocating page table\n");
> > @@ -193,11 +194,11 @@ void ttm_tt_fini(struct ttm_tt *ttm)
> >   EXPORT_SYMBOL(ttm_tt_fini);
> >   int ttm_dma_tt_init(struct ttm_dma_tt *ttm_dma, struct ttm_buffer_obj=
ect *bo,
> > -		    uint32_t page_flags)
> > +		    uint32_t page_flags, enum ttm_caching caching)
> >   {
> >   	struct ttm_tt *ttm =3D &ttm_dma->ttm;
> > -	ttm_tt_init_fields(ttm, bo, page_flags);
> > +	ttm_tt_init_fields(ttm, bo, page_flags, caching);
> >   	INIT_LIST_HEAD(&ttm_dma->pages_list);
> >   	if (ttm_dma_tt_alloc_page_directory(ttm_dma)) {
> > @@ -209,12 +210,12 @@ int ttm_dma_tt_init(struct ttm_dma_tt *ttm_dma, s=
truct ttm_buffer_object *bo,
> >   EXPORT_SYMBOL(ttm_dma_tt_init);
> >   int ttm_sg_tt_init(struct ttm_dma_tt *ttm_dma, struct ttm_buffer_obje=
ct *bo,
> > -		   uint32_t page_flags)
> > +		   uint32_t page_flags, enum ttm_caching caching)
> >   {
> >   	struct ttm_tt *ttm =3D &ttm_dma->ttm;
> >   	int ret;
> > -	ttm_tt_init_fields(ttm, bo, page_flags);
> > +	ttm_tt_init_fields(ttm, bo, page_flags, caching);
> >   	INIT_LIST_HEAD(&ttm_dma->pages_list);
> >   	if (page_flags & TTM_PAGE_FLAG_SG)
> > diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/d=
rm/vmwgfx/vmwgfx_ttm_buffer.c
> > index 7b5fd5288870..1fa7f9438ec4 100644
> > --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> > +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> > @@ -647,9 +647,11 @@ static struct ttm_tt *vmw_ttm_tt_create(struct ttm=
_buffer_object *bo,
> >   	vmw_be->mob =3D NULL;
> >   	if (vmw_be->dev_priv->map_mode =3D=3D vmw_dma_alloc_coherent)
> > -		ret =3D ttm_dma_tt_init(&vmw_be->dma_ttm, bo, page_flags);
> > +		ret =3D ttm_dma_tt_init(&vmw_be->dma_ttm, bo, page_flags,
> > +				      ttm_cached);
> >   	else
> > -		ret =3D ttm_tt_init(&vmw_be->dma_ttm.ttm, bo, page_flags);
> > +		ret =3D ttm_tt_init(&vmw_be->dma_ttm.ttm, bo, page_flags,
> > +				  ttm_cached);
> >   	if (unlikely(ret !=3D 0))
> >   		goto out_no_init;
> > diff --git a/include/drm/ttm/ttm_caching.h b/include/drm/ttm/ttm_cachin=
g.h
> > new file mode 100644
> > index 000000000000..161624dcf6be
> > --- /dev/null
> > +++ b/include/drm/ttm/ttm_caching.h
> > @@ -0,0 +1,34 @@
> > +/*
> > + * Copyright 2020 Advanced Micro Devices, Inc.
> > + *
> > + * Permission is hereby granted, free of charge, to any person obtaini=
ng a
> > + * copy of this software and associated documentation files (the "Soft=
ware"),
> > + * to deal in the Software without restriction, including without limi=
tation
> > + * the rights to use, copy, modify, merge, publish, distribute, sublic=
ense,
> > + * and/or sell copies of the Software, and to permit persons to whom t=
he
> > + * Software is furnished to do so, subject to the following conditions:
> > + *
> > + * The above copyright notice and this permission notice shall be incl=
uded in
> > + * all copies or substantial portions of the Software.
> > + *
> > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXP=
RESS OR
> > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABI=
LITY,
> > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT =
SHALL
> > + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAG=
ES OR
> > + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWIS=
E,
> > + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE =
OR
> > + * OTHER DEALINGS IN THE SOFTWARE.
> > + *
> > + * Authors: Christian K=F6nig
> > + */
> > +
> > +#ifndef _TTM_CACHING_H_
> > +#define _TTM_CACHING_H_
> > +
> > +enum ttm_caching {
> > +	ttm_uncached,
> > +	ttm_write_combined,
> > +	ttm_cached
> > +};
> > +
> > +#endif
> > diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
> > index 5d1835d44084..c39c722d5184 100644
> > --- a/include/drm/ttm/ttm_tt.h
> > +++ b/include/drm/ttm/ttm_tt.h
> > @@ -28,6 +28,7 @@
> >   #define _TTM_TT_H_
> >   #include <linux/types.h>
> > +#include <drm/ttm/ttm_caching.h>
> >   struct ttm_tt;
> >   struct ttm_resource;
> > @@ -42,12 +43,6 @@ struct ttm_operation_ctx;
> >   #define TTM_PAGE_FLAG_PRIV_POPULATED  (1 << 31)
> > -enum ttm_caching_state {
> > -	tt_uncached,
> > -	tt_wc,
> > -	tt_cached
> > -};
> > -
> >   /**
> >    * struct ttm_tt
> >    *
> > @@ -69,7 +64,7 @@ struct ttm_tt {
> >   	unsigned long num_pages;
> >   	struct sg_table *sg; /* for SG objects via dma-buf */
> >   	struct file *swap_storage;
> > -	enum ttm_caching_state caching_state;
> > +	enum ttm_caching caching;
> >   };
> >   static inline bool ttm_tt_is_populated(struct ttm_tt *tt)
> > @@ -121,6 +116,7 @@ int ttm_tt_create(struct ttm_buffer_object *bo, boo=
l zero_alloc);
> >    * @ttm: The struct ttm_tt.
> >    * @bo: The buffer object we create the ttm for.
> >    * @page_flags: Page flags as identified by TTM_PAGE_FLAG_XX flags.
> > + * @caching: the desired caching state of the pages
> >    *
> >    * Create a struct ttm_tt to back data with system memory pages.
> >    * No pages are actually allocated.
> > @@ -128,11 +124,11 @@ int ttm_tt_create(struct ttm_buffer_object *bo, b=
ool zero_alloc);
> >    * NULL: Out of memory.
> >    */
> >   int ttm_tt_init(struct ttm_tt *ttm, struct ttm_buffer_object *bo,
> > -		uint32_t page_flags);
> > +		uint32_t page_flags, enum ttm_caching caching);
> >   int ttm_dma_tt_init(struct ttm_dma_tt *ttm_dma, struct ttm_buffer_obj=
ect *bo,
> > -		    uint32_t page_flags);
> > +		    uint32_t page_flags, enum ttm_caching caching);
> >   int ttm_sg_tt_init(struct ttm_dma_tt *ttm_dma, struct ttm_buffer_obje=
ct *bo,
> > -		   uint32_t page_flags);
> > +		   uint32_t page_flags, enum ttm_caching caching);
> >   /**
> >    * ttm_tt_fini
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
