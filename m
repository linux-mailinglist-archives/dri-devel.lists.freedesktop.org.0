Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E95572F1AA2
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 17:14:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8F736E10D;
	Mon, 11 Jan 2021 16:14:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CF436E10D
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 16:14:01 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id v14so316686wml.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 08:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=FIpGh2VbT4cvMb6hVTu4aeJpEJ97yFxp8nn2cQGqx9k=;
 b=NnJN+Ls3CmjFsyEn5ycg09dnFsZpS4uUxLcdcDwj7zXsxS1lLilnZHIScCizgBkXSU
 A6IDcnS4C3J4+DBctzlrmPNQpIunFWD1dodWy35VGdVOB2B/40187p4ZsXu6XWa4WG9s
 20aBM1djF2DPiO+CuYqHm6H3Kn9SqgvWlwfLU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=FIpGh2VbT4cvMb6hVTu4aeJpEJ97yFxp8nn2cQGqx9k=;
 b=cLmCS+3TAiKCPnM1d3UPOop2s7kKMVmXrq1vCMGl8tv7JB9yvK0sQX+r2ElKudombk
 Vb3ax6yYU8tuqXmumtEHuAVVpwIxYciZoQISTzJVFdH8tTTjZT18B0BH2PecgTy5JU+I
 2vfunZ7NTA3VDS3t/hxl3veYgxQXnd3OTCTF2HuRi3uRKhUWpxY5sJml2LEni5Vp3fc1
 AIyWC3ZE3AEeg0allpf3s9Ybci6AxQfASeMJfIn7n6Ay3kV/46k4HzgJlk/Wcdm7cmj9
 tIG7M4hy3VDU7yBZfYcr3OUaw+JXBcA4WIsbCL7qVJ1NxjyrKsmQUfdiTOaKn2JvX5ED
 uFyA==
X-Gm-Message-State: AOAM530dkAumWPAl+/uy8+uZ0IVG/XV9NT3B5yDBigZ3kvNvi7w7Vx5v
 0dg5sw8KVysHlIsLHvSOKgtDsg==
X-Google-Smtp-Source: ABdhPJx7cqLYHXblwid+ByT0Ar8Wb8m9tieQqKxWKGLYhJHR4lKsFzTvRt/IJL3jXYxJIgl+W3Wy3w==
X-Received: by 2002:a1c:bd43:: with SMTP id n64mr369785wmf.169.1610381639625; 
 Mon, 11 Jan 2021 08:13:59 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z6sm86726wrw.58.2021.01.11.08.13.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 08:13:58 -0800 (PST)
Date: Mon, 11 Jan 2021 17:13:56 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
Subject: Re: [PATCH v3 01/12] drm: Add dummy page per device or GEM object
Message-ID: <X/x5RD0xQxWUYvQ3@phenom.ffwll.local>
References: <f374aaa4-4a30-e60c-cd4b-d463443c1137@amd.com>
 <X/c1IXX11chjHyl4@phenom.ffwll.local>
 <75c8a6f3-1e71-3242-6576-c0e661d6a62f@amd.com>
 <X/c3PKL70HXBt3Jk@phenom.ffwll.local>
 <589ece1f-2718-87ab-ec07-4044c3df1c58@amd.com>
 <a140ca34-9cfc-9c2f-39e2-1af156faabfe@amd.com>
 <b73319b2-1723-6650-8d03-d8f775119e53@amd.com>
 <29ef0c97-ac1b-a8e6-ee57-16727ff1803e@amd.com>
 <62645d03-704f-571e-bfe6-7d992b010a08@amd.com>
 <SN6PR12MB46235A1D04FDF4BBD9E60F94EAAE0@SN6PR12MB4623.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SN6PR12MB46235A1D04FDF4BBD9E60F94EAAE0@SN6PR12MB4623.namprd12.prod.outlook.com>
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
Cc: "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "yuq825@gmail.com" <yuq825@gmail.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 08, 2021 at 04:49:55PM +0000, Grodzovsky, Andrey wrote:
> Ok then, I guess I will proceed with the dummy pages list implementation =
then.
> =

> Andrey
> =

> ________________________________
> From: Koenig, Christian <Christian.Koenig@amd.com>
> Sent: 08 January 2021 09:52
> To: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>; Daniel Vetter <daniel=
@ffwll.ch>
> Cc: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; dri-de=
vel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; daniel.vetter@=
ffwll.ch <daniel.vetter@ffwll.ch>; robh@kernel.org <robh@kernel.org>; l.sta=
ch@pengutronix.de <l.stach@pengutronix.de>; yuq825@gmail.com <yuq825@gmail.=
com>; eric@anholt.net <eric@anholt.net>; Deucher, Alexander <Alexander.Deuc=
her@amd.com>; gregkh@linuxfoundation.org <gregkh@linuxfoundation.org>; ppaa=
lanen@gmail.com <ppaalanen@gmail.com>; Wentland, Harry <Harry.Wentland@amd.=
com>
> Subject: Re: [PATCH v3 01/12] drm: Add dummy page per device or GEM object
> =

> Mhm, I'm not aware of any let over pointer between TTM and GEM and we
> worked quite hard on reducing the size of the amdgpu_bo, so another
> extra pointer just for that corner case would suck quite a bit.

We have a ton of other pointers in struct amdgpu_bo (or any of it's lower
things) which are fairly single-use, so I'm really not much seeing the
point in making this a special case. It also means the lifetime management
becomes a bit iffy, since we can't throw away the dummy page then the last
reference to the bo is released (since we don't track it there), but only
when the last pointer to the device is released. Potentially this means a
pile of dangling pages hanging around for too long.

If you need some ideas for redundant pointers:
- destroy callback (kinda not cool to not have this const anyway), we
  could refcount it all with the overall gem bo. Quite a bit of work.
- bdev pointer, if we move the device ttm stuff into struct drm_device, or
  create a common struct ttm_device, we can ditch that
- We could probably merge a few of the fields and find 8 bytes somewhere
- we still have 2 krefs, would probably need to fix that before we can
  merge the destroy callbacks

So there's plenty of room still, if the size of a bo struct is really that
critical. Imo it's not.
-Daniel


> =

> Christian.
> =

> Am 08.01.21 um 15:46 schrieb Andrey Grodzovsky:
> > Daniel had some objections to this (see bellow) and so I guess I need
> > you both to agree on the approach before I proceed.
> >
> > Andrey
> >
> > On 1/8/21 9:33 AM, Christian K=F6nig wrote:
> >> Am 08.01.21 um 15:26 schrieb Andrey Grodzovsky:
> >>> Hey Christian, just a ping.
> >>
> >> Was there any question for me here?
> >>
> >> As far as I can see the best approach would still be to fill the VMA
> >> with a single dummy page and avoid pointers in the GEM object.
> >>
> >> Christian.
> >>
> >>>
> >>> Andrey
> >>>
> >>> On 1/7/21 11:37 AM, Andrey Grodzovsky wrote:
> >>>>
> >>>> On 1/7/21 11:30 AM, Daniel Vetter wrote:
> >>>>> On Thu, Jan 07, 2021 at 11:26:52AM -0500, Andrey Grodzovsky wrote:
> >>>>>> On 1/7/21 11:21 AM, Daniel Vetter wrote:
> >>>>>>> On Tue, Jan 05, 2021 at 04:04:16PM -0500, Andrey Grodzovsky wrote:
> >>>>>>>> On 11/23/20 3:01 AM, Christian K=F6nig wrote:
> >>>>>>>>> Am 23.11.20 um 05:54 schrieb Andrey Grodzovsky:
> >>>>>>>>>> On 11/21/20 9:15 AM, Christian K=F6nig wrote:
> >>>>>>>>>>> Am 21.11.20 um 06:21 schrieb Andrey Grodzovsky:
> >>>>>>>>>>>> Will be used to reroute CPU mapped BO's page faults once
> >>>>>>>>>>>> device is removed.
> >>>>>>>>>>> Uff, one page for each exported DMA-buf? That's not
> >>>>>>>>>>> something we can do.
> >>>>>>>>>>>
> >>>>>>>>>>> We need to find a different approach here.
> >>>>>>>>>>>
> >>>>>>>>>>> Can't we call alloc_page() on each fault and link them togeth=
er
> >>>>>>>>>>> so they are freed when the device is finally reaped?
> >>>>>>>>>> For sure better to optimize and allocate on demand when we rea=
ch
> >>>>>>>>>> this corner case, but why the linking ?
> >>>>>>>>>> Shouldn't drm_prime_gem_destroy be good enough place to free ?
> >>>>>>>>> I want to avoid keeping the page in the GEM object.
> >>>>>>>>>
> >>>>>>>>> What we can do is to allocate a page on demand for each fault
> >>>>>>>>> and link
> >>>>>>>>> the together in the bdev instead.
> >>>>>>>>>
> >>>>>>>>> And when the bdev is then finally destroyed after the last
> >>>>>>>>> application
> >>>>>>>>> closed we can finally release all of them.
> >>>>>>>>>
> >>>>>>>>> Christian.
> >>>>>>>> Hey, started to implement this and then realized that by
> >>>>>>>> allocating a page
> >>>>>>>> for each fault indiscriminately
> >>>>>>>> we will be allocating a new page for each faulting virtual
> >>>>>>>> address within a
> >>>>>>>> VA range belonging the same BO
> >>>>>>>> and this is obviously too much and not the intention. Should I
> >>>>>>>> instead use
> >>>>>>>> let's say a hashtable with the hash
> >>>>>>>> key being faulting BO address to actually keep allocating and
> >>>>>>>> reusing same
> >>>>>>>> dummy zero page per GEM BO
> >>>>>>>> (or for that matter DRM file object address for non imported
> >>>>>>>> BOs) ?
> >>>>>>> Why do we need a hashtable? All the sw structures to track this
> >>>>>>> should
> >>>>>>> still be around:
> >>>>>>> - if gem_bo->dma_buf is set the buffer is currently exported as
> >>>>>>> a dma-buf,
> >>>>>>>     so defensively allocate a per-bo page
> >>>>>>> - otherwise allocate a per-file page
> >>>>>>
> >>>>>> That exactly what we have in current implementation
> >>>>>>
> >>>>>>
> >>>>>>> Or is the idea to save the struct page * pointer? That feels a
> >>>>>>> bit like
> >>>>>>> over-optimizing stuff. Better to have a simple implementation
> >>>>>>> first and
> >>>>>>> then tune it if (and only if) any part of it becomes a problem
> >>>>>>> for normal
> >>>>>>> usage.
> >>>>>>
> >>>>>> Exactly - the idea is to avoid adding extra pointer to
> >>>>>> drm_gem_object,
> >>>>>> Christian suggested to instead keep a linked list of dummy pages
> >>>>>> to be
> >>>>>> allocated on demand once we hit a vm_fault. I will then also
> >>>>>> prefault the entire
> >>>>>> VA range from vma->vm_end - vma->vm_start to vma->vm_end and map
> >>>>>> them
> >>>>>> to that single dummy page.
> >>>>> This strongly feels like premature optimization. If you're worried
> >>>>> about
> >>>>> the overhead on amdgpu, pay down the debt by removing one of the
> >>>>> redundant
> >>>>> pointers between gem and ttm bo structs (I think we still have
> >>>>> some) :-)
> >>>>>
> >>>>> Until we've nuked these easy&obvious ones we shouldn't play "avoid 1
> >>>>> pointer just because" games with hashtables.
> >>>>> -Daniel
> >>>>
> >>>>
> >>>> Well, if you and Christian can agree on this approach and suggest
> >>>> maybe what pointer is
> >>>> redundant and can be removed from GEM struct so we can use the
> >>>> 'credit' to add the dummy page
> >>>> to GEM I will be happy to follow through.
> >>>>
> >>>> P.S Hash table is off the table anyway and we are talking only
> >>>> about linked list here since by prefaulting
> >>>> the entire VA range for a vmf->vma i will be avoiding redundant
> >>>> page faults to same VMA VA range and so
> >>>> don't need to search and reuse an existing dummy page but simply
> >>>> create a new one for each next fault.
> >>>>
> >>>> Andrey
> >>
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
