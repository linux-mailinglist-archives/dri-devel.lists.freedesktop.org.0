Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F3E3D3567
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 09:36:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF4476E14F;
	Fri, 23 Jul 2021 07:36:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D978A6E14F
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 07:36:42 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 x14-20020a7bc20e0000b0290249f2904453so3697363wmi.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 00:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=BDP6y/PyI9t+G8qri9LV3YWw91rSCPN3xxcifqBjBk0=;
 b=j5qkWZQCd0z92QdYrtoVNjBFaaiJsUsVwkWkMEgUr5pdE/6M7sqbqN+CurGPyJW7/R
 hBtZ0T2TO4Dip9c7SItNJi0VvSnOWkcLQp/pdKrcDfbCsaP/KZdntokwZrN2X1JeCPim
 mwMpG/jOFYSPfg6tN37gLNsxm5RREaJtfyZgc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=BDP6y/PyI9t+G8qri9LV3YWw91rSCPN3xxcifqBjBk0=;
 b=pfa0uOvO+ie5r7V3zm3eiin2FKJyV4CcGuPTfW0pTSGMTOZFlD6noBLEVY+GIq2yIW
 fTFBjR56ft7Gpy/8dV1A396Owe4t/ZYG42PrntZ5LmN6xYSNCPwrDSYalJuRaLzVKFeg
 AtJG/R9d+GX1+reiN+XFhntFHSzLcvb72tDuV4UOk5YXw1LFMCkPy8TccSL/Ku0F3Bke
 W9h/8fYPSHhBrHTe0J73PE835S2iahxcSbV4o/kS7Xx6E4gKLEMac8VykmigXBFReb+g
 jDXm/lSJZr2EJnaH55qLLN3yRA0ywstl5KKXiyHMZHsCeelBbEbcNzsPrCJMbvfoFmCv
 xWag==
X-Gm-Message-State: AOAM532Kt/vuCVvS+yVl85w/QtuYzGXFOFycLQ1w/pGHPMtYXKDPH+9x
 86wkx6gJY3SEldHViKDNYXAQaw==
X-Google-Smtp-Source: ABdhPJx/zSFvcYXE0LLXS7jG0RpAtMDtVgFHWnb0+xdvPNlh9fEcmrBhhrpWUZ3kiPJpE4FeM1n7yw==
X-Received: by 2002:a05:600c:2107:: with SMTP id
 u7mr10514283wml.52.1627025801445; 
 Fri, 23 Jul 2021 00:36:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b16sm33762629wrs.51.2021.07.23.00.36.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 00:36:40 -0700 (PDT)
Date: Fri, 23 Jul 2021 09:36:39 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 3/4] drm/shmem-helpers: Allocate wc pages on x86
Message-ID: <YPpxh0QhILXESykX@phenom.ffwll.local>
References: <20210713205153.1896059-1-daniel.vetter@ffwll.ch>
 <20210713205153.1896059-4-daniel.vetter@ffwll.ch>
 <0e4eefe0-9282-672c-7678-8d3162de35e3@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0e4eefe0-9282-672c-7678-8d3162de35e3@suse.de>
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
 Daniel Vetter <daniel.vetter@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 22, 2021 at 08:40:56PM +0200, Thomas Zimmermann wrote:
> Hi
> 
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
> 
> Vgem would therefore not work correctly on non-X86 platforms?

Anything using shmem helpers doesn't work correctly on non-x86 platforms.
At least if they use wc.

vgem with intel-gfx-ci is simply running some very nasty tests that catch
the bugs.

I'm kinda hoping that someone from the armsoc world would care enough to
fix this there. But it's a tricky issue.

> > 
> > Unfortunately this doesn't exist on arm, or as a generic feature. For
> > that I think only the dma-api can get at wc memory reliably, so maybe
> > we'd need some kind of GFP_WC flag to do this properly.
> > 
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Christian König <christian.koenig@amd.com>
> > Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
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
> 
> I cannot comment much on the technical details of the caching of various
> architectures. If this patch goes in, there should be a longer comment that
> reflects the discussion in this thread. It's apparently a workaround.
> 
> I think the call itself should be hidden behind a DRM API, which depends on
> CONFIG_X86. Something simple like
> 
> ifdef CONFIG_X86
> drm_set_pages_array_wc()
> {
> 	set_pages_array_wc();
> }
> else
> drm_set_pages_array_wc()
>  {
>  }
> #endif
> 
> Maybe in drm_cache.h?

We do have a bunch of this in drm_cache.h already, and architecture
maintainers hate us for it.

The real fix is to get at the architecture-specific wc allocator, which is
currently not something that's exposed, but hidden within the dma api. I
think having this stick out like this is better than hiding it behind fake
generic code (like we do with drm_clflush, which defacto also only really
works on x86).

Also note that ttm has the exact same ifdef in its page allocator, but it
does fall back to using dma_alloc_coherent on other platforms.
-Daniel

> Best regard
> Thomas
> 
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
> > 
> 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 Nürnberg, Germany
> (HRB 36809, AG Nürnberg)
> Geschäftsführer: Felix Imendörffer
> 




-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
