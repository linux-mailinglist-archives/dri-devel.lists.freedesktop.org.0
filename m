Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 890183B34C8
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 19:29:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 699EF6EC68;
	Thu, 24 Jun 2021 17:29:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 818DE6EC68
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 17:29:51 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id j2so7527888wrs.12
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 10:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=saX4Gny9RDWfrCL0uL3GYr+MS8Qw2OkrG9lRhKHnb4U=;
 b=BRnKsadNN/RdaVKa7IOtAoQoIxCh0Z78j27x+SigYQXYBcTpL2TojA1SfY8lbCasAw
 khKjf1ViltOlLNPiydWRozg/wxjpBQScTBEVaeIcVI3Pvd+L7juZCvSEojh2T3NYzFVc
 PMZ3yzdQVGmFH2SpGU7oQfVTV74diMfU8RpF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=saX4Gny9RDWfrCL0uL3GYr+MS8Qw2OkrG9lRhKHnb4U=;
 b=JOfWWhBk8cIFQJQ6Pqrbmg22kTjYKTJ/iRazXsrhbsqGGma0yy452wwWPJeaofPtSh
 GMBWFiWSL36mYnUoXSkY7qJqYBXqJZswkwc7JUZSjfMLP0CME89C4UPFYbbz2TiubEs2
 6bC1ULHoKZ+k0qt+fTn5q29MwSvxgoc3ouxX/3Km/6NrVlTgraMmYBnVQ0tyMx2vr4XR
 7jIoxhUbbhNG1DjL+mNMRnhs9MEW4k4r9DOCElthmGk/V/p4jLr4F++x2Gk/BWYToH0X
 htDzpVoTbE4Ze9RaJNFrBk2ekY8M6qaeyCsSL+zAhpL9l855g+VOjBNM9Nb3+C0wqTGS
 UUFA==
X-Gm-Message-State: AOAM531vl82OhJ8WxmzAHw0HnUAMVV96aYuWsYbqtrDl7AJUJsgvEcCa
 x5oSzjWvtJ5MDxU+irNBmjkjCQ==
X-Google-Smtp-Source: ABdhPJwlAo9/IGVYDxSE3S+IbO+qAC9VNzvD7rrYufm1nhiwJklNA/5AAB0+R+iBNSYVsm9YwGnBog==
X-Received: by 2002:a5d:49ce:: with SMTP id t14mr5761182wrs.365.1624555790255; 
 Thu, 24 Jun 2021 10:29:50 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q11sm3759847wrx.80.2021.06.24.10.29.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 10:29:49 -0700 (PDT)
Date: Thu, 24 Jun 2021 19:29:47 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 10/11] drm/scheduler: Don't store self-dependencies
Message-ID: <YNTBC04wfQ7ItRq7@phenom.ffwll.local>
References: <20210624140025.438303-1-daniel.vetter@ffwll.ch>
 <20210624140025.438303-11-daniel.vetter@ffwll.ch>
 <fa721d0e-46d7-b5f3-f846-560b8dad4e58@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fa721d0e-46d7-b5f3-f846-560b8dad4e58@amd.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: Jack Zhang <Jack.Zhang1@amd.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 24, 2021 at 07:03:10PM +0200, Christian König wrote:
> Am 24.06.21 um 16:00 schrieb Daniel Vetter:
> > This is essentially part of drm_sched_dependency_optimized(), which
> > only amdgpu seems to make use of. Use it a bit more.
> > 
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: "Christian König" <christian.koenig@amd.com>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Luben Tuikov <luben.tuikov@amd.com>
> > Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Cc: Jack Zhang <Jack.Zhang1@amd.com>
> > ---
> >   drivers/gpu/drm/scheduler/sched_main.c | 7 +++++++
> >   1 file changed, 7 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > index 370c336d383f..c31d7cf7df74 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -649,6 +649,13 @@ int drm_sched_job_await_fence(struct drm_sched_job *job,
> >   	if (!fence)
> >   		return 0;
> > +	/* if it's a fence from us it's guaranteed to be earlier */
> > +	if (fence->context == job->entity->fence_context ||
> > +	    fence->context == job->entity->fence_context + 1) {
> > +		dma_fence_put(fence);
> > +		return 0;
> > +	}
> > +
> 
> Well NAK. That would break Vulkan.
> 
> The problem is that Vulkan can insert dependencies between jobs which run on
> the same queue.
> 
> So we need to track those as well and if the previous job for the same
> queue/scheduler is not yet finished a pipeline synchronization needs to be
> inserted.
> 
> That's one of the reasons we wasn't able to unify the dependency handling
> yet.

That sounds like an extremely amdgpu specific constraint? You're also the
only one who keeps track of whether the previous job we've scheduled has
finished already (I guess they can get pipelined and you don't flush by
default), so you insert fences.

I guess we can add a await_fence_no_dedup or so for amdgpu, but I'm not
sure why we have to inflict this design constraint on all other drivers?
At least I'm not seeing anything in lima, panfrost, v3d or entaviv that
would break with this, and i915 will also be perfectly fine.

Also note: I'm not using this for amdgpu, exactly because there's a few
funny things going on.

Finally: You _really_ need explicit dependency handling for vulkan in your
uapi, instead of the kernel second-guessing what userspace might be doing.
That's really not how vulkan is designed to work :-)

Cheers, Daniel


> Christian.
> 
> >   	/* Deduplicate if we already depend on a fence from the same context.
> >   	 * This lets the size of the array of deps scale with the number of
> >   	 * engines involved, rather than the number of BOs.
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
