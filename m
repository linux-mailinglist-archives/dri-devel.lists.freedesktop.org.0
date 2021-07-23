Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A78023D36D4
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 10:34:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D7256ECE9;
	Fri, 23 Jul 2021 08:34:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A8C56ECE9
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 08:34:18 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id b7so782521edu.3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 01:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=oa9LsULNSF8G3grb64t/9N62g6dzTVHbnQnaT/3ZVD0=;
 b=Uhj8q1dcnNzwe65TtgST0YcC9OKdf9lILHYSD7nmVihjSfs3a7m0h2yQFQiVTSDq7Y
 U+0Gc4NNr5HkH8u8AwarHjkKOD/uvbOFs41i7wLPIeFYS2W359jAaSyTYyG9idPPEZ/Q
 LNKILc2lKAM+RR3tSwFgGH8pFtok1WgagMABk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=oa9LsULNSF8G3grb64t/9N62g6dzTVHbnQnaT/3ZVD0=;
 b=FwAaR72sXmI0nWO4IyLblneyBFhbG6qxtDgTfR7fFRbnUGMtiZN5TpDJy4d9o968If
 bubh1nwYAJL2QL4VS43z83iTPeDkt63SUtSqFF0KPH6uw9RZSOSyzf6En6KSU4IrU7+9
 NUlDxD7VBfPvWm5n7D7KMACkh5iF3+rkRnbENzMjl8uuoiTckVXmQTlelcKWTB9wbbx/
 e8aXA+LcMiCZbDMof6JySedovUTY3ogDo3CaukBy/ambBxfs8+w/b0LTwksozeoeIXq0
 1nI4vDgUisRXlBd3pccM5ee1kab4YU2FyPP9KgSb/oJFY13/fjIItcNYCMvOB2GMho4Q
 QbtQ==
X-Gm-Message-State: AOAM532ZMrAGPeirkhvy+0gJF5rCJV80ZUmGHRsNTOX1fobNSmXxqGnO
 Md/RBiUYsfcRZgSqJs7eJLqzVA==
X-Google-Smtp-Source: ABdhPJwAIhi5U4YXs77s+0AJfvT2vvqtnpViuUbw9uCDnytuItqpaveRhwpze8KIjFZtcLeLfzihSQ==
X-Received: by 2002:aa7:cd03:: with SMTP id b3mr4288127edw.112.1627029256573; 
 Fri, 23 Jul 2021 01:34:16 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id jg9sm10185723ejc.6.2021.07.23.01.34.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 01:34:15 -0700 (PDT)
Date: Fri, 23 Jul 2021 10:34:14 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH v4 3/4] drm/shmem-helpers: Allocate wc pages on x86
Message-ID: <YPp/BlD8zrM98+6C@phenom.ffwll.local>
References: <20210713205153.1896059-1-daniel.vetter@ffwll.ch>
 <20210713205153.1896059-4-daniel.vetter@ffwll.ch>
 <0e4eefe0-9282-672c-7678-8d3162de35e3@suse.de>
 <YPpxh0QhILXESykX@phenom.ffwll.local>
 <be56fbe8-5151-ef8d-13cb-0b8a71f4d1e0@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <be56fbe8-5151-ef8d-13cb-0b8a71f4d1e0@amd.com>
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

On Fri, Jul 23, 2021 at 10:02:39AM +0200, Christian König wrote:
> Am 23.07.21 um 09:36 schrieb Daniel Vetter:
> > On Thu, Jul 22, 2021 at 08:40:56PM +0200, Thomas Zimmermann wrote:
> > > Hi
> > > 
> > > Am 13.07.21 um 22:51 schrieb Daniel Vetter:
> > > [SNIP]
> > > > +#ifdef CONFIG_X86
> > > > +	if (shmem->map_wc)
> > > > +		set_pages_array_wc(pages, obj->size >> PAGE_SHIFT);
> > > > +#endif
> > > I cannot comment much on the technical details of the caching of various
> > > architectures. If this patch goes in, there should be a longer comment that
> > > reflects the discussion in this thread. It's apparently a workaround.
> > > 
> > > I think the call itself should be hidden behind a DRM API, which depends on
> > > CONFIG_X86. Something simple like
> > > 
> > > ifdef CONFIG_X86
> > > drm_set_pages_array_wc()
> > > {
> > > 	set_pages_array_wc();
> > > }
> > > else
> > > drm_set_pages_array_wc()
> > >   {
> > >   }
> > > #endif
> > > 
> > > Maybe in drm_cache.h?
> > We do have a bunch of this in drm_cache.h already, and architecture
> > maintainers hate us for it.
> 
> Yeah, for good reasons :)
> 
> > The real fix is to get at the architecture-specific wc allocator, which is
> > currently not something that's exposed, but hidden within the dma api. I
> > think having this stick out like this is better than hiding it behind fake
> > generic code (like we do with drm_clflush, which defacto also only really
> > works on x86).
> 
> The DMA API also doesn't really touch that stuff as far as I know.
> 
> What we rather do on other architectures is to set the appropriate caching
> flags on the CPU mappings, see function ttm_prot_from_caching().

This alone doesn't do cache flushes. And at least on some arm cpus having
inconsistent mappings can lead to interconnect hangs, so you have to at
least punch out the kernel linear map. Which on some arms isn't possible
(because the kernel map is a special linear map and not done with
pagetables). Which means you need to carve this out at boot and treat them
as GFP_HIGHMEM.

Afaik dma-api has that allocator somewhere which dtrt for
dma_alloc_coherent.

Also shmem helpers already set the caching pgprot.

> > Also note that ttm has the exact same ifdef in its page allocator, but it
> > does fall back to using dma_alloc_coherent on other platforms.
> 
> This works surprisingly well on non x86 architectures as well. We just don't
> necessary update the kernel mappings everywhere which limits the kmap usage.
> 
> In other words radeon and nouveau still work on PowerPC AGP systems as far
> as I know for example.

The thing is, on most cpus you get away with just pgprot set to wc, and on
many others it's only an issue while there's still some cpu dirt hanging
around because they don't prefetch badly enough. It's very few were it's a
persistent problem.

Really the only reason I've even caught this was because some of the
i915+vgem buffer sharing tests we have are very nasty and intentionally
try to provoke the worst case :-)

Anyway, since you're looking, can you pls review this and the previous
patch for shmem helpers?

The first one to make VM_PFNMAP standard for all dma-buf isn't ready yet,
because I need to audit all the driver still. And at least i915 dma-buf
mmap is still using gup-able memory too. So more work to do here.
-Danel

> 
> Christian.
> 
> > -Daniel
> > 
> > > Best regard
> > > Thomas
> > > 
> > > > +
> > > >    	shmem->pages = pages;
> > > >    	return 0;
> > > > @@ -203,6 +212,11 @@ static void drm_gem_shmem_put_pages_locked(struct drm_gem_shmem_object *shmem)
> > > >    	if (--shmem->pages_use_count > 0)
> > > >    		return;
> > > > +#ifdef CONFIG_X86
> > > > +	if (shmem->map_wc)
> > > > +		set_pages_array_wb(shmem->pages, obj->size >> PAGE_SHIFT);
> > > > +#endif
> > > > +
> > > >    	drm_gem_put_pages(obj, shmem->pages,
> > > >    			  shmem->pages_mark_dirty_on_put,
> > > >    			  shmem->pages_mark_accessed_on_put);
> > > > 
> > > -- 
> > > Thomas Zimmermann
> > > Graphics Driver Developer
> > > SUSE Software Solutions Germany GmbH
> > > Maxfeldstr. 5, 90409 Nürnberg, Germany
> > > (HRB 36809, AG Nürnberg)
> > > Geschäftsführer: Felix Imendörffer
> > > 
> > 
> > 
> > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
