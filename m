Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0D2393023
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 15:53:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F83A6ED74;
	Thu, 27 May 2021 13:53:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0350D6E42E;
 Thu, 27 May 2021 13:53:02 +0000 (UTC)
IronPort-SDR: 4BPoz8TGu/vSL73kqVASWIthIeQVVrBPAwA+CiPycGDugDyAkYWDRhiQ8FpQlAzMRjvZaJIY+G
 dbcRtW+bSgoA==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="202742419"
X-IronPort-AV: E=Sophos;i="5.82,334,1613462400"; d="scan'208";a="202742419"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2021 06:53:02 -0700
IronPort-SDR: pxapOZ4w6izmWCeqsjitHmnayyvbA3quMBvMNP9QjTFndU1cksKBa/l0avI1IQcF0ApzGwf1CP
 Cn4ViaQOdXdQ==
X-IronPort-AV: E=Sophos;i="5.82,334,1613462400"; d="scan'208";a="633999265"
Received: from ibanaga-mobl.ger.corp.intel.com ([10.249.254.58])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2021 06:52:59 -0700
Message-ID: <3a74dca5db06864630653f8ee4c50a05d24b7004.camel@linux.intel.com>
Subject: Re: [PATCH v4 10/15] drm/ttm, drm/amdgpu: Allow the driver some
 control over swapping
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Thomas
 =?ISO-8859-1?Q?Hellstr=F6m?= "(Intel)"
 <thomas_os@shipmail.org>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Date: Thu, 27 May 2021 15:52:56 +0200
In-Reply-To: <562ed088-5b43-7b3f-703e-37c21d3933ef@amd.com>
References: <20210526113259.1661914-1-thomas.hellstrom@linux.intel.com>
 <20210526113259.1661914-11-thomas.hellstrom@linux.intel.com>
 <9f49eb8e-8ec5-cb24-0ce1-3e63272628e8@amd.com>
 <b2fea11f-bc69-7347-1781-79626c2d5ceb@shipmail.org>
 <562ed088-5b43-7b3f-703e-37c21d3933ef@amd.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
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

On Thu, 2021-05-27 at 14:36 +0200, Christian König wrote:
> Am 27.05.21 um 09:33 schrieb Thomas Hellström (Intel):
> > Hi, Christian,
> > 
> > Thanks for reviewing.
> > 
> > On 5/26/21 3:26 PM, Christian König wrote:
> > > Am 26.05.21 um 13:32 schrieb Thomas Hellström:
> > > > We are calling the eviction_valuable driver callback at eviction 
> > > > time to
> > > > determine whether we actually can evict a buffer object.
> > > > The upcoming i915 TTM backend needs the same functionality for
> > > > swapout,
> > > > and that might actually be beneficial to other drivers as well.
> > > > 
> > > > Add an eviction_valuable call also in the swapout path. Try to
> > > > keep the
> > > > current behaviour for all drivers by returning true if the buffer
> > > > object
> > > > is already in the TTM_PL_SYSTEM placement. We change behaviour
> > > > for the
> > > > case where a buffer object is in a TT backed placement when
> > > > swapped 
> > > > out,
> > > > in which case the drivers normal eviction_valuable path is run.
> > > > 
> > > > Finally make sure we don't try to swapout a bo that was recently
> > > > purged
> > > > and therefore unpopulated.
> > > > 
> > > > Reviewed-by: Maarten Lankhorst <
> > > > maarten.lankhorst@linux.intel.com>
> > > > Cc: Christian König <christian.koenig@amd.com>
> > > > Signed-off-by: Thomas Hellström <
> > > > thomas.hellstrom@linux.intel.com>
> > > > ---
> > > > v3:
> > > > - Don't export ttm_tt_unpopulate
> > > > - Fix confusion reading the locked pointer instead of the value
> > > >    pointed to in ttm_bo_evict_swapout_allowable (Reported by
> > > >    Maarten Lankhorst)
> > > > ---
> > > >   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c |  4 +++
> > > >   drivers/gpu/drm/ttm/ttm_bo.c            | 43 
> > > > ++++++++++++++++---------
> > > >   drivers/gpu/drm/ttm/ttm_tt.c            |  3 ++
> > > >   3 files changed, 34 insertions(+), 16 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c 
> > > > b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> > > > index 3bc3aebfef7c..45d194bffc3f 100644
> > > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> > > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> > > > @@ -1348,6 +1348,10 @@ static bool 
> > > > amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
> > > >       struct dma_fence *f;
> > > >       int i;
> > > >   +    /* Swapout? */
> > > > +    if (bo->mem.mem_type == TTM_PL_SYSTEM)
> > > > +        return true;
> > > > +
> > > >       if (bo->type == ttm_bo_type_kernel &&
> > > >           !amdgpu_vm_evictable(ttm_to_amdgpu_bo(bo)))
> > > >           return false;
> > > > diff --git a/drivers/gpu/drm/ttm/ttm_bo.c 
> > > > b/drivers/gpu/drm/ttm/ttm_bo.c
> > > > index be0406466460..1b2d062266ed 100644
> > > > --- a/drivers/gpu/drm/ttm/ttm_bo.c
> > > > +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> > > > @@ -536,6 +536,10 @@ static int ttm_bo_evict(struct 
> > > > ttm_buffer_object *bo,
> > > >   bool ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
> > > >                     const struct ttm_place *place)
> > > >   {
> > > > +    dma_resv_assert_held(bo->base.resv);
> > > > +    if (bo->mem.mem_type == TTM_PL_SYSTEM)
> > > > +        return true;
> > > > +
> > > >       /* Don't evict this BO if it's outside of the
> > > >        * requested placement range
> > > >        */
> > > > @@ -558,7 +562,9 @@ EXPORT_SYMBOL(ttm_bo_eviction_valuable);
> > > >    * b. Otherwise, trylock it.
> > > >    */
> > > >   static bool ttm_bo_evict_swapout_allowable(struct 
> > > > ttm_buffer_object *bo,
> > > > -            struct ttm_operation_ctx *ctx, bool *locked, bool
> > > > *busy)
> > > > +                       struct ttm_operation_ctx *ctx,
> > > > +                       const struct ttm_place *place,
> > > > +                       bool *locked, bool *busy)
> > > >   {
> > > >       bool ret = false;
> > > >   @@ -576,6 +582,14 @@ static bool 
> > > > ttm_bo_evict_swapout_allowable(struct ttm_buffer_object *bo,
> > > >               *busy = !ret;
> > > >       }
> > > >   +    if (ret && place && !bo->bdev->funcs-
> > > > >eviction_valuable(bo, 
> > > > place)) {
> > > > +        ret = false;
> > > > +        if (*locked) {
> > > > +            dma_resv_unlock(bo->base.resv);
> > > > +            *locked = false;
> > > > +        }
> > > > +    }
> > > > +
> > > >       return ret;
> > > >   }
> > > >   @@ -630,20 +644,14 @@ int ttm_mem_evict_first(struct ttm_device
> > > > *bdev,
> > > >           list_for_each_entry(bo, &man->lru[i], lru) {
> > > >               bool busy;
> > > >   -            if (!ttm_bo_evict_swapout_allowable(bo, ctx,
> > > > &locked,
> > > > -                                &busy)) {
> > > > +            if (!ttm_bo_evict_swapout_allowable(bo, ctx, place,
> > > > +                                &locked, &busy)) {
> > > >                   if (busy && !busy_bo && ticket !=
> > > >                       dma_resv_locking_ctx(bo->base.resv))
> > > >                       busy_bo = bo;
> > > >                   continue;
> > > >               }
> > > >   -            if (place && !bdev->funcs->eviction_valuable(bo,
> > > > -                                      place)) {
> > > > -                if (locked)
> > > > -                    dma_resv_unlock(bo->base.resv);
> > > > -                continue;
> > > > -            }
> > > >               if (!ttm_bo_get_unless_zero(bo)) {
> > > >                   if (locked)
> > > >                       dma_resv_unlock(bo->base.resv);
> > > > @@ -1140,10 +1148,18 @@ EXPORT_SYMBOL(ttm_bo_wait);
> > > >   int ttm_bo_swapout(struct ttm_buffer_object *bo, struct 
> > > > ttm_operation_ctx *ctx,
> > > >              gfp_t gfp_flags)
> > > >   {
> > > > +    struct ttm_place place = {};
> > > >       bool locked;
> > > >       int ret;
> > > >   -    if (!ttm_bo_evict_swapout_allowable(bo, ctx, &locked,
> > > > NULL))
> > > > +    /*
> > > > +     * While the bo may already reside in SYSTEM placement, set
> > > > +     * SYSTEM as new placement to cover also the move further
> > > > below.
> > > > +     * The driver may use the fact that we're moving from SYSTEM
> > > > +     * as an indication that we're about to swap out.
> > > > +     */
> > > > +    place.mem_type = TTM_PL_SYSTEM;
> > > > +    if (!ttm_bo_evict_swapout_allowable(bo, ctx, &place,
> > > > &locked, 
> > > > NULL))
> > > >           return -EBUSY;
> > > >         if (!ttm_bo_get_unless_zero(bo)) {
> > > > @@ -1168,12 +1184,7 @@ int ttm_bo_swapout(struct
> > > > ttm_buffer_object 
> > > > *bo, struct ttm_operation_ctx *ctx,
> > > >       if (bo->mem.mem_type != TTM_PL_SYSTEM) {
> > > >           struct ttm_operation_ctx ctx = { false, false };
> > > >           struct ttm_resource evict_mem;
> > > > -        struct ttm_place place, hop;
> > > > -
> > > > -        memset(&place, 0, sizeof(place));
> > > > -        memset(&hop, 0, sizeof(hop));
> > > > -
> > > > -        place.mem_type = TTM_PL_SYSTEM;
> > > > +        struct ttm_place hop = {};
> > > 
> > > I would stick with memset because of the padding reasons.
> > > 
> > > >             ret = ttm_resource_alloc(bo, &place, &evict_mem);
> > > >           if (unlikely(ret))
> > > > diff --git a/drivers/gpu/drm/ttm/ttm_tt.c 
> > > > b/drivers/gpu/drm/ttm/ttm_tt.c
> > > > index 913b330a234b..d9793cbb6d13 100644
> > > > --- a/drivers/gpu/drm/ttm/ttm_tt.c
> > > > +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> > > > @@ -263,6 +263,9 @@ int ttm_tt_swapout(struct ttm_device *bdev,
> > > > struct ttm_tt *ttm,
> > > >       struct page *to_page;
> > > >       int i, ret;
> > > >   +    if (!ttm_tt_is_populated(ttm))
> > > > +        return 0;
> > > > +
> > > 
> > > This here is just because of a bug in the higher level function.
> > > 
> > > I've just pushed the fix for that to drm-misc-fixes, so maybe drop 
> > > that here as soon as this is backmerged.
> > > 
> > That code doesn't look correct to me. In ttm_device_swapout only the 
> > lru lock is held, and the bo->ttm pointer is protected by the resv 
> > lock, meaning that bo->ttm can disappear at any time in that
> > function, 
> > so while an advisory reading bo->ttm using READ_ONCE() is ok, 
> > dereferencing the bo->ttm pointer without reservation held is illegal
> > and may send you into recently freed memory.
> > 
> > For an example, consider
> > 
> > thread A. Selects bo for eviction, moves to system lru, creates ttm
> > Thread B locks lru in swapout code. finds bo->ttm NON_NULL,
> > thread A tries to evict bo, fails, destroys the ttm.
> > Thread B derefs freed memory.
> > 
> > But even relying on that there were no such example in the ttm core
> > itself, not adhering to the protection of bo->ttm makes the code 
> > extremely fragile and IMHO needs fixing.
> > 
> > Also as a secondary note, a driver is in principle free to do things 
> > in the swap notifier that may result in an unpopulated ttm so IMHO a 
> > late check is needed here.
> > 
> > So ack to keep the above?
> 
> Oh, really good point. Haven't thought about that for the quick fix.
> 
> I think for the short term we need to protect TT destruction by the 
> spinlock.

To avoid more locking complexity, 
I think it would be easy to just defer the code that derefs the ttm
(except the new unpopulated check) to ttm_bo_swapout() after we've
taken the resv trylock, but before taking the kref, returning -EBUSY if
conditions for swapping are not met.

> 
> The problem doing it here is that you end up in an endless loop
> currently.
> 
> E.g. you trylock and inspect the same BO over and over again.
> 
> Need to double check the code to see if that can somehow be avoided.

Well ttm_tt_swapout happily returns 0, so the BO gets pulled off the
LRU anyway so I think that shouldn't happen.

The only thing that becomes incorrect is the num_pages return in
ttm_device_swapout(). OTOH, the caller shouldn't care whether we
actually swapped out or whether the bo losts its pages in swap_notify.

/Thomas


> 
> Christian.
> 
> > 
> > Thanks,
> > 
> > Thomas
> > 
> > 
> > > 
> > > Christian.
> > > 
> > > 
> > > >       swap_storage = shmem_file_setup("ttm swap", size, 0);
> > > >       if (IS_ERR(swap_storage)) {
> > > >           pr_err("Failed allocating swap storage\n");
> 


