Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B64968910
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 15:40:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D29710E2F6;
	Mon,  2 Sep 2024 13:40:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="TlnC/Yox";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0AD810E304
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 13:40:13 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-374b25263a3so1664831f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2024 06:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1725284412; x=1725889212; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=o2MMKzlbUqC46O6Bg49GW/j/QmgpFtwzbcsjgwtFPLU=;
 b=TlnC/YoxQbPXz9qzw5jR/xV892ddbuNgj/1LfUi55MIyJbmFufCEE0hjxM0vGJM4v2
 bH4LLGQcMHU8j/q5aCmCdteblBHC2jBkwerYTQyZXIeFK98U8vj2mD58su+AYC3KtAmi
 5zsdgYAoarciVsL+Fzn7ltXyL5+CthTAxM1Rg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725284412; x=1725889212;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o2MMKzlbUqC46O6Bg49GW/j/QmgpFtwzbcsjgwtFPLU=;
 b=wEdxpBb2h3Wx3IWAk3Rz+i4LhxJRlSoEnkSFgw1mE8OYZ4Bs9iqT+Y2ni1EtckHYPQ
 8mAl5wCNP20mr5ll0TIcQQ9wdZSmeQ4WilLLsBNbgqOcF0Dv71qOpTnR5akzay3E2mtB
 NPRYLa46VKUPHvvFk01PxfAVtVFOeahuIBtW9dCVjdkNsBBFDK4PqK/WrX5zBAE0gJOi
 TfskA9pWdKfX0N1siLl5VOvkhJUYGNSf0qgz4125J2s2Fd9vnywVSqhpvyP60Gknesu5
 yP4JvtP9xBheM99cB8Pg84rhthrmx1Mgp+FYfwJNqe1Suwn/Fhss1YI44ZcrnRpVjITI
 PhXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXA1wxoLYYWUPIn2vYIV5KW4ZfAU42vjfOQWegRW1KtPua1zAh5fcKCiyvxvywpMVYo0+kdgg5ykNQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxs1MnwL886VQP17ogGco/utfqtvDdRBOT2uUy1yBdMqzAS6ATK
 F2TTayRSgTmJWwkpSUPpomshll9D5NpSH8luIM6jz80QYulTWbkIyQVmsh2uTiM=
X-Google-Smtp-Source: AGHT+IFS7LXlAENn5JBrAhk4/cTQ7uqDoCsRWfreZ8H/IIMa+Vo/hLAsv92XzhXlIUkSJCzEl15kVQ==
X-Received: by 2002:a05:6000:1565:b0:374:c8dd:ea47 with SMTP id
 ffacd0b85a97d-374c8dded26mr3292998f8f.50.1725284411763; 
 Mon, 02 Sep 2024 06:40:11 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374c046685fsm6387028f8f.79.2024.09.02.06.40.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 06:40:11 -0700 (PDT)
Date: Mon, 2 Sep 2024 15:40:09 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, kernel@collabora.com,
 Luben Tuikov <ltuikov89@gmail.com>, Danilo Krummrich <dakr@redhat.com>
Subject: Re: [RFC PATCH] drm/sched: Make sure drm_sched_fence_ops don't vanish
Message-ID: <ZtXAOUsHa_Lmm6x5@phenom.ffwll.local>
References: <20240830104057.1479321-1-boris.brezillon@collabora.com>
 <ZtJHg8JOPi7CVme+@DUT025-TGLU.fm.intel.com>
 <f43f8310-8e5a-48fc-af44-949a78599de9@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f43f8310-8e5a-48fc-af44-949a78599de9@amd.com>
X-Operating-System: Linux phenom 6.9.12-amd64 
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

On Mon, Sep 02, 2024 at 12:58:54PM +0200, Christian König wrote:
> Am 31.08.24 um 00:28 schrieb Matthew Brost:
> > On Fri, Aug 30, 2024 at 12:40:57PM +0200, Boris Brezillon wrote:
> > > dma_fence objects created by drm_sched might hit other subsystems, which
> > > means the fence object might potentially outlive the drm_sched module
> > > lifetime, and at this point the dma_fence::ops points to a memory region
> > > that no longer exists.
> > > 
> > > In order to fix that, let's make sure the drm_sched_fence code is always
> > > statically linked, just like dma-fence{-chain}.c does.
> > > 
> > > Cc: Luben Tuikov <ltuikov89@gmail.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: "Christian König" <christian.koenig@amd.com>
> > > Cc: Danilo Krummrich <dakr@redhat.com>
> > > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > > ---
> > > Just like for the other UAF fix, this is an RFC, as I'm not sure that's
> > > how we want it fixed. The other option we have is to retain a module ref
> > > for each initialized fence and release it when the fence is freed.
> > So this is different than your other patch. From Xe PoV the other patch
> > is referencing an object which is tied to an IOCTL rather than a module
> > whereas this referencing a module. If a module can disappear when fence
> > tied to the module, well that is a bit scary and Xe might have some
> > issues there - I'd have audit our of exporting internally created
> > fences.
> > 
> > Based on Christian's feedback we really shouldn't be allowing this but
> > also don't really love the idea of a fence holding a module ref either.
> 
> IIRC the initial proposal for dma_fences actually contained grabbing a
> module reference, similar to what we do for dma-bufs.
> 
> But I think that was dropped because of the circle dependency issues and
> preventing module unload. After that nobody really looked into it again.
> 
> I think using the scheduler fence to decouple the hardware fence lifetime
> should work. We would just need to drop the hardware fence reference after
> the scheduler fence signaled and not when it is destroyed.
> 
> This unfortunately also creates another problems for error recovery,  but
> that is a different topic I think.
> 
> > Seems like we need a well defined + documented rule - exported fences
> > need to be completely decoupled from the module upon signaling or
> > exported fences must retain a module ref. I'd probably lean towards the
> > former. One reason to support the former is fences can be released in
> > IRQ contexts and dropping a module ref in IRQ context seems a bit
> > problematic. Also because some oher part of kernel holds on to fence ref
> > lazily block a module unload just seems wrong.
> 
> Modules are not auto unloaded when their reference count becomes zero. Only
> when rmmod (or the corresponding system call) is issued.
> 
> So dropping a module reference from interrupt context should be
> unproblematic I think. But we should probably double check.
> 
> Fully decoupling fence destruction from the module is most likely not
> possible since we will always need the free callback from the ops for some
> use cases.

I think the issue is that we don't garbage collect fences, so with a full
module refcount you can pin a module. Which isn't great.
-Sima

> 
> > Sorry if above we have well defined rule and I'm just not aware.
> 
> No, it's basically just a well known mess nobody cared much about.
> 
> Regards,
> Christian.
> 
> > 
> > Matt
> > 
> > > ---
> > >   drivers/gpu/drm/Makefile                |  2 +-
> > >   drivers/gpu/drm/scheduler/Makefile      |  7 ++++++-
> > >   drivers/gpu/drm/scheduler/sched_fence.c | 21 +++++++++------------
> > >   drivers/gpu/drm/scheduler/sched_main.c  |  3 +++
> > >   4 files changed, 19 insertions(+), 14 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> > > index 68cc9258ffc4..b97127da58b7 100644
> > > --- a/drivers/gpu/drm/Makefile
> > > +++ b/drivers/gpu/drm/Makefile
> > > @@ -158,7 +158,7 @@ obj-$(CONFIG_DRM_MIPI_DSI) += drm_mipi_dsi.o
> > >   obj-y			+= arm/
> > >   obj-y			+= display/
> > >   obj-$(CONFIG_DRM_TTM)	+= ttm/
> > > -obj-$(CONFIG_DRM_SCHED)	+= scheduler/
> > > +obj-y			+= scheduler/
> > >   obj-$(CONFIG_DRM_RADEON)+= radeon/
> > >   obj-$(CONFIG_DRM_AMDGPU)+= amd/amdgpu/
> > >   obj-$(CONFIG_DRM_AMDGPU)+= amd/amdxcp/
> > > diff --git a/drivers/gpu/drm/scheduler/Makefile b/drivers/gpu/drm/scheduler/Makefile
> > > index 53863621829f..bc18d26f27a1 100644
> > > --- a/drivers/gpu/drm/scheduler/Makefile
> > > +++ b/drivers/gpu/drm/scheduler/Makefile
> > > @@ -20,6 +20,11 @@
> > >   # OTHER DEALINGS IN THE SOFTWARE.
> > >   #
> > >   #
> > > -gpu-sched-y := sched_main.o sched_fence.o sched_entity.o
> > > +
> > > +# sched_fence.c contains dma_fence_ops that can't go away, so make sure it's
> > > +# statically linked when CONFIG_DRM_SCHED=m
> > > +obj-y += $(if $(CONFIG_DRM_SCHED),sched_fence.o,)
> > > +
> > > +gpu-sched-y := sched_main.o sched_entity.o
> > >   obj-$(CONFIG_DRM_SCHED) += gpu-sched.o
> > > diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
> > > index efa2a71d98eb..ac65589476dd 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_fence.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> > > @@ -39,12 +39,7 @@ static int __init drm_sched_fence_slab_init(void)
> > >   	return 0;
> > >   }
> > > -
> > > -static void __exit drm_sched_fence_slab_fini(void)
> > > -{
> > > -	rcu_barrier();
> > > -	kmem_cache_destroy(sched_fence_slab);
> > > -}
> > > +subsys_initcall(drm_sched_fence_slab_init);
> > >   static void drm_sched_fence_set_parent(struct drm_sched_fence *s_fence,
> > >   				       struct dma_fence *fence)
> > > @@ -74,6 +69,7 @@ void drm_sched_fence_scheduled(struct drm_sched_fence *fence,
> > >   	dma_fence_signal(&fence->scheduled);
> > >   }
> > > +EXPORT_SYMBOL(drm_sched_fence_scheduled);
> > >   void drm_sched_fence_finished(struct drm_sched_fence *fence, int result)
> > >   {
> > > @@ -81,6 +77,7 @@ void drm_sched_fence_finished(struct drm_sched_fence *fence, int result)
> > >   		dma_fence_set_error(&fence->finished, result);
> > >   	dma_fence_signal(&fence->finished);
> > >   }
> > > +EXPORT_SYMBOL(drm_sched_fence_finished);
> > >   static const char *drm_sched_fence_get_driver_name(struct dma_fence *fence)
> > >   {
> > > @@ -118,6 +115,7 @@ void drm_sched_fence_free(struct drm_sched_fence *fence)
> > >   	if (!WARN_ON_ONCE(fence->timeline))
> > >   		kmem_cache_free(sched_fence_slab, fence);
> > >   }
> > > +EXPORT_SYMBOL(drm_sched_fence_free);
> > >   /**
> > >    * drm_sched_fence_release_scheduled - callback that fence can be freed
> > > @@ -210,6 +208,9 @@ struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entity *entity,
> > >   {
> > >   	struct drm_sched_fence *fence = NULL;
> > > +	if (unlikely(!sched_fence_slab))
> > > +		return NULL;
> > > +
> > >   	fence = kmem_cache_zalloc(sched_fence_slab, GFP_KERNEL);
> > >   	if (fence == NULL)
> > >   		return NULL;
> > > @@ -219,6 +220,7 @@ struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entity *entity,
> > >   	return fence;
> > >   }
> > > +EXPORT_SYMBOL(drm_sched_fence_alloc);
> > >   void drm_sched_fence_init(struct drm_sched_fence *fence,
> > >   			  struct drm_sched_entity *entity)
> > > @@ -234,9 +236,4 @@ void drm_sched_fence_init(struct drm_sched_fence *fence,
> > >   	dma_fence_init(&fence->finished, &drm_sched_fence_ops_finished,
> > >   		       &fence->lock, entity->fence_context + 1, seq);
> > >   }
> > > -
> > > -module_init(drm_sched_fence_slab_init);
> > > -module_exit(drm_sched_fence_slab_fini);
> > > -
> > > -MODULE_DESCRIPTION("DRM GPU scheduler");
> > > -MODULE_LICENSE("GPL and additional rights");
> > > +EXPORT_SYMBOL(drm_sched_fence_init);
> > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > > index 1e31a9c8ce15..eaaf086eab30 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > @@ -1467,3 +1467,6 @@ void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched)
> > >   	queue_work(sched->submit_wq, &sched->work_free_job);
> > >   }
> > >   EXPORT_SYMBOL(drm_sched_wqueue_start);
> > > +
> > > +MODULE_DESCRIPTION("DRM GPU scheduler");
> > > +MODULE_LICENSE("GPL and additional rights");
> > > -- 
> > > 2.46.0
> > > 
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
