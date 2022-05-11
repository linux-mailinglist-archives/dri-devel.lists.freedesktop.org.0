Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 387D4523D00
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 21:05:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D45410E216;
	Wed, 11 May 2022 19:05:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB01810E216
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 19:05:13 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id w24so3682964edx.3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 12:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=4K/BqknQQ3B81Ri9IMPLTLrHNMzicKZVVfstqbcQoXw=;
 b=A/KCQGg5ugLO69SideOJEv3eS/RyBeILjrfEq1trEjYp4cb9RZCmIZVFqxyI7WsooG
 XsWzCAMH5B+G8qNASIFfM8v3cZTbZl3x5TWJGNd90LgqR8xJipz7OP0NHwqKYzKNE3I7
 MVIOk5NK+bWC0jwrLMNufBwoueLjBB6jdZuiE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=4K/BqknQQ3B81Ri9IMPLTLrHNMzicKZVVfstqbcQoXw=;
 b=zwOoJdkWkWO4nKJxi2X5g0awF8S2knObNiTB/4AtDz1K4UuKK+4ZaP8tezK7Ycuicv
 cUVYSZCWDR7EVMbsCcGDprncWJI9rbWoL44iam4+TX8IIPag/QWio7PM1sEJLsFWARuG
 pRQS1PNoC7vtvCn4hS2+TWnakHmROKvUDBokZL7PMiAhWGiU/s4c/Q+eYKL8/OAngBXs
 e/eBiDXr90Y2IIwrJD2HNZXrOAAZh0lAI4OIbvxpuddNOzL2rIKZNWKuNSEiv7mMWy0q
 U+/jOZx21hEy5Vp93ofZXj4nWDYeaMGu4zYXJSr8AK3subMR8lQ3Rcy1BKnFqyWV3jVU
 rHeQ==
X-Gm-Message-State: AOAM531jPRTPqc2AUg/oVoOHTImrD1h4ysTM+2+cs1NzH5/8Cz6sZE3p
 Y/XFGJN+VVqRZhvaEKfIKAhpkA==
X-Google-Smtp-Source: ABdhPJxzbQWruH8VN9oOr7p/K2/W+DT07g4nY6eAZpa/3zcSLOTXAgDkDgKjcZvZEO42b/8vTn+Ifg==
X-Received: by 2002:a05:6402:278d:b0:42a:2dc0:744f with SMTP id
 b13-20020a056402278d00b0042a2dc0744fmr1951646ede.226.1652295912301; 
 Wed, 11 May 2022 12:05:12 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 i26-20020a1709063c5a00b006fa9384a0b5sm1259045ejg.61.2022.05.11.12.05.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 12:05:11 -0700 (PDT)
Date: Wed, 11 May 2022 21:05:09 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v4 10/15] drm/shmem-helper: Take reservation lock instead
 of drm_gem_shmem locks
Message-ID: <YnwI5UX/zvmnAHvg@phenom.ffwll.local>
Mail-Followup-To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Stone <daniel@fooishbar.org>,
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Clark <robdclark@gmail.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Dmitry Osipenko <digetx@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
References: <01506516-ab2f-cb6e-7507-f2a3295efb59@collabora.com>
 <YnOHAh9I1ds4+1J+@phenom.ffwll.local>
 <83e68918-68de-c0c6-6f9b-e94d34b19383@collabora.com>
 <YnkaUk0mZNuPsZ5r@phenom.ffwll.local>
 <4d08b382-0076-1ea2-b565-893d50b453cb@collabora.com>
 <YnuziJDmXVR09UzP@phenom.ffwll.local>
 <56787b70-fb64-64da-6006-d3aa3ed59d12@gmail.com>
 <3a362c32-870c-1d73-bba6-bbdcd62dc326@collabora.com>
 <YnvWUbh5QDDs6u2B@phenom.ffwll.local>
 <ba2836d0-9a3a-b879-cb1e-a48aed31637d@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ba2836d0-9a3a-b879-cb1e-a48aed31637d@collabora.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Dmitry Osipenko <digetx@gmail.com>,
 Steven Price <steven.price@arm.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 virtualization@lists.linux-foundation.org,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Emil Velikov <emil.l.velikov@gmail.com>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 11, 2022 at 06:40:32PM +0300, Dmitry Osipenko wrote:
> On 5/11/22 18:29, Daniel Vetter wrote:
> > On Wed, May 11, 2022 at 06:14:00PM +0300, Dmitry Osipenko wrote:
> >> On 5/11/22 17:24, Christian König wrote:
> >>> Am 11.05.22 um 15:00 schrieb Daniel Vetter:
> >>>> On Tue, May 10, 2022 at 04:39:53PM +0300, Dmitry Osipenko wrote:
> >>>>> [SNIP]
> >>>>> Since vmapping implies implicit pinning, we can't use a separate lock in
> >>>>> drm_gem_shmem_vmap() because we need to protect the
> >>>>> drm_gem_shmem_get_pages(), which is invoked by drm_gem_shmem_vmap() to
> >>>>> pin the pages and requires the dma_resv_lock to be locked.
> >>>>>
> >>>>> Hence the problem is:
> >>>>>
> >>>>> 1. If dma-buf importer holds the dma_resv_lock and invokes
> >>>>> dma_buf_vmap() -> drm_gem_shmem_vmap(), then drm_gem_shmem_vmap() shall
> >>>>> not take the dma_resv_lock.
> >>>>>
> >>>>> 2. Since dma-buf locking convention isn't specified, we can't assume
> >>>>> that dma-buf importer holds the dma_resv_lock around dma_buf_vmap().
> >>>>>
> >>>>> The possible solutions are:
> >>>>>
> >>>>> 1. Specify the dma_resv_lock convention for dma-bufs and make all
> >>>>> drivers to follow it.
> >>>>>
> >>>>> 2. Make only DRM drivers to hold dma_resv_lock around dma_buf_vmap().
> >>>>> Other non-DRM drivers will get the lockdep warning.
> >>>>>
> >>>>> 3. Make drm_gem_shmem_vmap() to take the dma_resv_lock and get deadlock
> >>>>> if dma-buf importer holds the lock.
> >>>>>
> >>>>> ...
> >>>> Yeah this is all very annoying.
> >>> Ah, yes that topic again :)
> >>>
> >>> I think we could relatively easily fix that by just defining and
> >>> enforcing that the dma_resv_lock must have be taken by the caller when
> >>> dma_buf_vmap() is called.
> >>>
> >>> A two step approach should work:
> >>> 1. Move the call to dma_resv_lock() into the dma_buf_vmap() function and
> >>> remove all lock taking from the vmap callback implementations.
> >>> 2. Move the call to dma_resv_lock() into the callers of dma_buf_vmap()
> >>> and enforce that the function is called with the lock held.
> >> I've doubts about the need to move out the dma_resv_lock() into the
> >> callers of dma_buf_vmap()..
> >>
> >> I looked through all the dma_buf_vmap() users and neither of them
> >> interacts with dma_resv_lock() at all, i.e. nobody takes the lock
> >> in/outside of dma_buf_vmap(). Hence it's easy and more practical to make
> >> dma_buf_mmap/vmap() to take the dma_resv_lock by themselves.
> > i915_gem_dmabuf_vmap -> i915_gem_object_pin_map_unlocked ->
> >   i915_gem_object_lock -> dma_resv_lock
> > 
> > And all the ttm drivers should work similarly. So there's definitely
> > drivers which grab dma_resv_lock from their vmap callback.
> 
> Grr.. I'll take another look.
> 
> >> It's unclear to me which driver may ever want to do the mapping under
> >> the dma_resv_lock. But if we will ever have such a driver that will need
> >> to map imported buffer under dma_resv_lock, then we could always add the
> >> dma_buf_vmap_locked() variant of the function. In this case the locking
> >> rule will sound like this:
> >>
> >> "All dma-buf importers are responsible for holding the dma-reservation
> >> lock around the dmabuf->ops->mmap/vmap() calls."
> 
> Are you okay with this rule?

Yeah I think long-term it's where we want to be, just trying to find
clever ways to get there.

And I think Christian agrees with that?

> >>> It shouldn't be that hard to clean up. The last time I looked into it my
> >>> main problem was that we didn't had any easy unit test for it.
> >> Do we have any tests for dma-bufs at all? It's unclear to me what you
> >> are going to test in regards to the reservation locks, could you please
> >> clarify?
> > Unfortunately not really :-/ Only way really is to grab a driver which
> > needs vmap (those are mostly display drivers) on an imported buffer, and
> > see what happens.
> > 
> > 2nd best is liberally sprinkling lockdep annotations all over the place
> > and throwing it at intel ci (not sure amd ci is accessible to the public)
> > and then hoping that's good enough. Stuff like might_lock and
> > dma_resv_assert_held.
> 
> Alright

So throwing it at intel-gfx-ci can't hurt I think, but that only covers
i915 so doesn't really help with the bigger issue of catching all the
drivers.

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
