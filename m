Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8DD21F420
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 16:31:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 906B76E95D;
	Tue, 14 Jul 2020 14:31:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48FD06E15B
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 14:31:29 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id z2so22046103wrp.2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 07:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Ed/reeYJGTUlb4ySP35k6xiv1WgC2riT/Zo21y23//U=;
 b=Ewf+GMeScmyBFvFOvufdoDZRrV4/6flsTp734Xp/9GetkuBjRKOJnJ419fHD16cpdM
 AhYX/iXwFsLReavk7xNIjfwi7uzIpX1dGBAozfRZNkSYjhNoMz+bLN4RXXO/WCb5gmMZ
 4rSM1Bm1WWSq9mBfYuICycp2sEeRqptusJlf4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Ed/reeYJGTUlb4ySP35k6xiv1WgC2riT/Zo21y23//U=;
 b=GCB3VZ0zcMRapwYCZLk0Ktig/Tat2q8Qltb+TbiGzRpyE/jqTkqtkiG+mJw9ddu7iS
 5SPBWSQCjHn4ZJ+G5b8TBdQv8cmd/dUGUtkR4iRl2L9quNFzufnNEYhe2pQQgsV//1FI
 zwseU5xh1/7IULP7zF9Pfi6p1YTgYm8yvtEKAzDHePuvmI670QnlZCIfmhm5NquoC7Qz
 b8LJs9D7NfWMsamL8x42r7uF3lB4djlJfNqnKgRnieyMqduiDW9ENMRuxyiPLMvzKPEC
 pJgWir075i68EkD906M/jPoteTVKCOc1W2jA823EHON47cxtxUoB97CHPCYISRpdhF3C
 qGuQ==
X-Gm-Message-State: AOAM531nbx3cH99zJijWOXak07A5xOt2V2wXON2oNJIKoFG0l7YA6org
 06UEJk0h827wMJv5BgewNRDlMg==
X-Google-Smtp-Source: ABdhPJydohBAFr2y3Zo3uJbf1/CV8/Lg/F5ovzneHF4+jrt5NQvpk+Juk4QyRp3CnvJvu9Ou0xUmHQ==
X-Received: by 2002:a05:6000:11cc:: with SMTP id
 i12mr5936896wrx.224.1594737087739; 
 Tue, 14 Jul 2020 07:31:27 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d132sm4666892wmd.35.2020.07.14.07.31.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 07:31:26 -0700 (PDT)
Date: Tue, 14 Jul 2020 16:31:24 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 19/25] drm/amdgpu: s/GFP_KERNEL/GFP_ATOMIC in scheduler
 code
Message-ID: <20200714143124.GG3278063@phenom.ffwll.local>
References: <20200707201229.472834-1-daniel.vetter@ffwll.ch>
 <20200707201229.472834-20-daniel.vetter@ffwll.ch>
 <20200714104910.GC3278063@phenom.ffwll.local>
 <d3e85f62-e427-7f1c-0ff4-842ffe57172e@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d3e85f62-e427-7f1c-0ff4-842ffe57172e@amd.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: linux-rdma@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, linaro-mm-sig@lists.linaro.org,
 amd-gfx@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 14, 2020 at 01:40:11PM +0200, Christian K=F6nig wrote:
> Am 14.07.20 um 12:49 schrieb Daniel Vetter:
> > On Tue, Jul 07, 2020 at 10:12:23PM +0200, Daniel Vetter wrote:
> > > My dma-fence lockdep annotations caught an inversion because we
> > > allocate memory where we really shouldn't:
> > > =

> > > 	kmem_cache_alloc+0x2b/0x6d0
> > > 	amdgpu_fence_emit+0x30/0x330 [amdgpu]
> > > 	amdgpu_ib_schedule+0x306/0x550 [amdgpu]
> > > 	amdgpu_job_run+0x10f/0x260 [amdgpu]
> > > 	drm_sched_main+0x1b9/0x490 [gpu_sched]
> > > 	kthread+0x12e/0x150
> > > =

> > > Trouble right now is that lockdep only validates against GFP_FS, which
> > > would be good enough for shrinkers. But for mmu_notifiers we actually
> > > need !GFP_ATOMIC, since they can be called from any page laundering,
> > > even if GFP_NOFS or GFP_NOIO are set.
> > > =

> > > I guess we should improve the lockdep annotations for
> > > fs_reclaim_acquire/release.
> > > =

> > > Ofc real fix is to properly preallocate this fence and stuff it into
> > > the amdgpu job structure. But GFP_ATOMIC gets the lockdep splat out of
> > > the way.
> > > =

> > > v2: Two more allocations in scheduler paths.
> > > =

> > > Frist one:
> > > =

> > > 	__kmalloc+0x58/0x720
> > > 	amdgpu_vmid_grab+0x100/0xca0 [amdgpu]
> > > 	amdgpu_job_dependency+0xf9/0x120 [amdgpu]
> > > 	drm_sched_entity_pop_job+0x3f/0x440 [gpu_sched]
> > > 	drm_sched_main+0xf9/0x490 [gpu_sched]
> > > =

> > > Second one:
> > > =

> > > 	kmem_cache_alloc+0x2b/0x6d0
> > > 	amdgpu_sync_fence+0x7e/0x110 [amdgpu]
> > > 	amdgpu_vmid_grab+0x86b/0xca0 [amdgpu]
> > > 	amdgpu_job_dependency+0xf9/0x120 [amdgpu]
> > > 	drm_sched_entity_pop_job+0x3f/0x440 [gpu_sched]
> > > 	drm_sched_main+0xf9/0x490 [gpu_sched]
> > > =

> > > Cc: linux-media@vger.kernel.org
> > > Cc: linaro-mm-sig@lists.linaro.org
> > > Cc: linux-rdma@vger.kernel.org
> > > Cc: amd-gfx@lists.freedesktop.org
> > > Cc: intel-gfx@lists.freedesktop.org
> > > Cc: Chris Wilson <chris@chris-wilson.co.uk>
> > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > Cc: Christian K=F6nig <christian.koenig@amd.com>
> > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Has anyone from amd side started looking into how to fix this properly?
> =

> Yeah I checked both and neither are any real problem.

I'm confused ... do you mean "no real problem fixing them" or "not
actually a real problem"?

> > I looked a bit into fixing this with mempool, and the big guarantee we
> > need is that
> > - there's a hard upper limit on how many allocations we minimally need =
to
> >    guarantee forward progress. And the entire vmid allocation and
> >    amdgpu_sync_fence stuff kinda makes me question that's a valid
> >    assumption.
> =

> We do have hard upper limits for those.
> =

> The VMID allocation could as well just return the fence instead of putting
> it into the sync object IIRC. So that just needs some cleanup and can avo=
id
> the allocation entirely.

Yeah embedding should be simplest solution of all.

> The hardware fence is limited by the number of submissions we can have
> concurrently on the ring buffers, so also not a problem at all.

Ok that sounds good. Wrt releasing the memory again, is that also done
without any of the allocation-side locks held? I've seen some vmid manager
somewhere ...
-Daniel

> =

> Regards,
> Christian.
> =

> > =

> > - mempool_free must be called without any locks in the way which are he=
ld
> >    while we call mempool_alloc. Otherwise we again have a nice deadlock
> >    with no forward progress. I tried auditing that, but got lost in amd=
gpu
> >    and scheduler code. Some lockdep annotations for mempool.c might hel=
p,
> >    but they're not going to catch everything. Plus it would be again ma=
nual
> >    annotations because this is yet another cross-release issue. So not =
sure
> >    that helps at all.
> > =

> > iow, not sure what to do here. Ideas?
> > =

> > Cheers, Daniel
> > =

> > > ---
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 2 +-
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c   | 2 +-
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c  | 2 +-
> > >   3 files changed, 3 insertions(+), 3 deletions(-)
> > > =

> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/=
drm/amd/amdgpu/amdgpu_fence.c
> > > index 8d84975885cd..a089a827fdfe 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> > > @@ -143,7 +143,7 @@ int amdgpu_fence_emit(struct amdgpu_ring *ring, s=
truct dma_fence **f,
> > >   	uint32_t seq;
> > >   	int r;
> > > -	fence =3D kmem_cache_alloc(amdgpu_fence_slab, GFP_KERNEL);
> > > +	fence =3D kmem_cache_alloc(amdgpu_fence_slab, GFP_ATOMIC);
> > >   	if (fence =3D=3D NULL)
> > >   		return -ENOMEM;
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_ids.c
> > > index 267fa45ddb66..a333ca2d4ddd 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
> > > @@ -208,7 +208,7 @@ static int amdgpu_vmid_grab_idle(struct amdgpu_vm=
 *vm,
> > >   	if (ring->vmid_wait && !dma_fence_is_signaled(ring->vmid_wait))
> > >   		return amdgpu_sync_fence(sync, ring->vmid_wait);
> > > -	fences =3D kmalloc_array(sizeof(void *), id_mgr->num_ids, GFP_KERNE=
L);
> > > +	fences =3D kmalloc_array(sizeof(void *), id_mgr->num_ids, GFP_ATOMI=
C);
> > >   	if (!fences)
> > >   		return -ENOMEM;
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c b/drivers/gpu/d=
rm/amd/amdgpu/amdgpu_sync.c
> > > index 8ea6c49529e7..af22b526cec9 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
> > > @@ -160,7 +160,7 @@ int amdgpu_sync_fence(struct amdgpu_sync *sync, s=
truct dma_fence *f)
> > >   	if (amdgpu_sync_add_later(sync, f))
> > >   		return 0;
> > > -	e =3D kmem_cache_alloc(amdgpu_sync_slab, GFP_KERNEL);
> > > +	e =3D kmem_cache_alloc(amdgpu_sync_slab, GFP_ATOMIC);
> > >   	if (!e)
> > >   		return -ENOMEM;
> > > -- =

> > > 2.27.0
> > > =

> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
