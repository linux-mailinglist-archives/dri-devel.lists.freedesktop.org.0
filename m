Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B104D3C84A8
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 14:48:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7C4289BDB;
	Wed, 14 Jul 2021 12:48:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF6C989D00
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 12:48:43 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 l8-20020a05600c1d08b02902333d79327aso728304wms.3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 05:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=AAfCA3aLaRsoPqCayCx/WTToaiMlWxWnrNj9V3mt6Yo=;
 b=MBZxzg2Vmf1zieozp807kfgrrWYb9fKD65NkbV+TCTobCBqsRAiCIREixYHAMFnhWy
 4mI0DyL6BNV87phfhbzrELu0SKZuZKwaPGauwHhIiWUK1Y/4sGLsEywj3E55Q9eznqTF
 HwgQRiEiO+7ZB+basCdfN3ylPOMl7SygFueO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=AAfCA3aLaRsoPqCayCx/WTToaiMlWxWnrNj9V3mt6Yo=;
 b=eU/dvdRsG6jLKsQfpNHw1Shu6XcF5RAmwIZ9uf0VAx9dTnu+k8uA6ibTeDBxW0ODw0
 m/+rh833+I4S7puEEEzCFsw/d0wwjos88xjNA0dnpSSVK8SIrLE8Xn5L5JhAsVOkWziO
 6bA/dXwra+nOdEBv234KZwXnKXg1VCpyNP+uxyaJqXQeYzAj/eyDcE8FHYIpQh4BJQdc
 L0fI1LAi8/AHsfrvytmOL5ixFrFOhnSyl0+Y41v5bNmY5YmjrJ9wrDzuiSllzQOypCrs
 X0j1hm2zbRyjNVLcvKZrGX6iOpMpZb7jU+JBQjhREYHtFUT7mdUdXBYMIk5xNhh+eUIB
 yKqg==
X-Gm-Message-State: AOAM533jf+2HWFTAbTQVDYqxzwEackcbrqL82hc/cwmAIOeDTn6MkSEQ
 XmhIxdzyFHAEMTT03cWgAv3VvQ==
X-Google-Smtp-Source: ABdhPJyBQn4P6X3i1mOVrATPa+1dmy9M3DG+L+wk/eVLK2HHxN4x9hKEZl+E1AFUpFQ87alHdJAhoQ==
X-Received: by 2002:a7b:cb1a:: with SMTP id u26mr3861494wmj.125.1626266922565; 
 Wed, 14 Jul 2021 05:48:42 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u16sm2886495wrw.36.2021.07.14.05.48.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 05:48:41 -0700 (PDT)
Date: Wed, 14 Jul 2021 14:48:40 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH v4 3/4] drm/shmem-helpers: Allocate wc pages on x86
Message-ID: <YO7dKP2l9n0rLjDV@phenom.ffwll.local>
References: <20210713205153.1896059-1-daniel.vetter@ffwll.ch>
 <20210713205153.1896059-4-daniel.vetter@ffwll.ch>
 <4626a7d7-95ca-104c-753a-07a9d83b0b28@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4626a7d7-95ca-104c-753a-07a9d83b0b28@amd.com>
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
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 14, 2021 at 01:54:50PM +0200, Christian König wrote:
> Am 13.07.21 um 22:51 schrieb Daniel Vetter:
> > intel-gfx-ci realized that something is not quite coherent anymore on
> > some platforms for our i915+vgem tests, when I tried to switch vgem
> > over to shmem helpers.
> > 
> > After lots of head-scratching I realized that I've removed calls to
> > drm_clflush. And we need those. To make this a bit cleaner use the
> > same page allocation tooling as ttm, which does internally clflush
> > (and more, as neeeded on any platform instead of just the intel x86
> > cpus i915 can be combined with).
> > 
> > Unfortunately this doesn't exist on arm, or as a generic feature. For
> > that I think only the dma-api can get at wc memory reliably, so maybe
> > we'd need some kind of GFP_WC flag to do this properly.
> 
> The problem is that this stuff is extremely architecture specific. So GFP_WC
> and GFP_UNCACHED are really what we should aim for in the long term.
> 
> And as far as I know we have at least the following possibilities how it is
> implemented:
> 
> * A fixed amount of registers which tells the CPU the caching behavior for a
> memory region, e.g. MTRR.
> * Some bits of the memory pointers used, e.g. you see the same memory at
> different locations with different caching attributes.
> * Some bits in the CPUs page table.
> * Some bits in a separate page table.
> 
> On top of that there is the PCIe specification which defines non-cache
> snooping access as an extension.

Yeah dma-buf is extremely ill-defined even on x86 if you combine these
all. We just play a game of whack-a-mole with the cacheline dirt until
it's gone.

That's the other piece here, how do you even make sure that the page is
properly flushed and ready for wc access:
- easy case is x86 with clflush available pretty much everywhere (since
  10+ years at least)
- next are cpus which have some cache flush instructions, but it's highly
  cpu model specific
- next up is the same, but you absolutely have to make sure there's no
  other mapping around anymore or the coherency fabric just dies
- and I'm pretty sure there's worse stuff where you defacto can only
  allocate wc memory that's set aside at boot-up and that's all you ever
  get.

Cheers, Daniel

> Mixing that with the CPU caching behavior gets you some really nice ways to
> break a driver. In general x86 seems to be rather graceful, but arm and
> PowerPC are easily pissed if you mess that up.
> 
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Christian König <christian.koenig@amd.com>
> > Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> 
> Acked-by: Christian könig <christian.koenig@amd.com>
> 
> Regards,
> Christian.
> 
> > ---
> >   drivers/gpu/drm/drm_gem_shmem_helper.c | 14 ++++++++++++++
> >   1 file changed, 14 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> > index 296ab1b7c07f..657d2490aaa5 100644
> > --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> > +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> > @@ -10,6 +10,10 @@
> >   #include <linux/slab.h>
> >   #include <linux/vmalloc.h>
> > +#ifdef CONFIG_X86
> > +#include <asm/set_memory.h>
> > +#endif
> > +
> >   #include <drm/drm.h>
> >   #include <drm/drm_device.h>
> >   #include <drm/drm_drv.h>
> > @@ -162,6 +166,11 @@ static int drm_gem_shmem_get_pages_locked(struct drm_gem_shmem_object *shmem)
> >   		return PTR_ERR(pages);
> >   	}
> > +#ifdef CONFIG_X86
> > +	if (shmem->map_wc)
> > +		set_pages_array_wc(pages, obj->size >> PAGE_SHIFT);
> > +#endif
> > +
> >   	shmem->pages = pages;
> >   	return 0;
> > @@ -203,6 +212,11 @@ static void drm_gem_shmem_put_pages_locked(struct drm_gem_shmem_object *shmem)
> >   	if (--shmem->pages_use_count > 0)
> >   		return;
> > +#ifdef CONFIG_X86
> > +	if (shmem->map_wc)
> > +		set_pages_array_wb(shmem->pages, obj->size >> PAGE_SHIFT);
> > +#endif
> > +
> >   	drm_gem_put_pages(obj, shmem->pages,
> >   			  shmem->pages_mark_dirty_on_put,
> >   			  shmem->pages_mark_accessed_on_put);
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
