Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9500B42DA83
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 15:33:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49A216E0F4;
	Thu, 14 Oct 2021 13:33:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1084C6E0F4
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 13:33:33 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id y12so25010214eda.4
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 06:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=tDsYb2O9ylqW7Ss2K5s9nrfev8gLYMTY+dJxMjCccFQ=;
 b=kDNfZGo2NEt0QtAc/c+G2Ufi9IuL17iXy14SOD4Vl+e7OceIH4hUBbvmmr5xT1Jl18
 xG2KL5bQJnW+Ts1+JNU42S3cgcMO7yog2LsFBK8WzKDkFugPJWSvBKCAq8JqwNgQx532
 zvYY+6/ylC+N55pdevszAUfOhm41sr7Ud+X1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tDsYb2O9ylqW7Ss2K5s9nrfev8gLYMTY+dJxMjCccFQ=;
 b=t6glolNYt2FciRZ4cIW3NrKntP60emFXC9QosWD7KR5ZXtslQXORQFnGQzl0aM9US+
 /XgiluvT7F2IBHfLiJ/BzHHXm+RFZ6a3PPqkr2lNBa/stU2fBU/LbE+2lv7MwJeyXyAF
 y6o1f0E93dm13lfPhlv+yKG0hK0z/KASjEQmJPvU1cJAD9I35w6e0kyzW7hMOrkoHeCd
 etI9Lt772Df7DsgBImpPu0aGLZaYMwk50u6uKCZpe8PcP4u7PQmnU6Lbckii2QkJDVka
 fyoN4iLkf0/e+Br8elHJ6LYT6B+5zw7k5FIQhFnTCK4UlbeQKPqNsxxYIaRNdhJjpeGN
 SM5w==
X-Gm-Message-State: AOAM531B5VmTnEo1Mt6Segf7Om1cNP2do1z0/ueUMxB/y2mLMDGbB+Fw
 r7GHj9eW8cVp2ypFcVjuKPW9+A==
X-Google-Smtp-Source: ABdhPJwXNnfZWYWi6Hjvai8ksKalaS/LTYSmEW6CB192bNoUPnhJ+orKQtU+9qqEf30Brzn83f67DA==
X-Received: by 2002:a17:907:628d:: with SMTP id
 nd13mr4004601ejc.7.1634218410796; 
 Thu, 14 Oct 2021 06:33:30 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id e7sm2703638edz.95.2021.10.14.06.33.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 06:33:30 -0700 (PDT)
Date: Thu, 14 Oct 2021 15:33:28 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Auld <matthew.auld@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, Ramalingam C <ramalingam.c@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, CQ Tang <cq.tang@intel.com>,
 Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 03/14] drm/i915/xehpsdv: enforce min GTT alignment
Message-ID: <YWgxqGYS8Ps3JtqD@phenom.ffwll.local>
References: <20211011161155.6397-1-ramalingam.c@intel.com>
 <20211011161155.6397-4-ramalingam.c@intel.com>
 <YWbhYrNaT0TS1D3a@phenom.ffwll.local>
 <50362606-46a1-0a41-8063-5dca5ac99b98@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50362606-46a1-0a41-8063-5dca5ac99b98@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 13, 2021 at 03:13:33PM +0100, Matthew Auld wrote:
> On 13/10/2021 14:38, Daniel Vetter wrote:
> > On Mon, Oct 11, 2021 at 09:41:44PM +0530, Ramalingam C wrote:
> > > From: Matthew Auld <matthew.auld@intel.com>
> > > 
> > > For local-memory objects we need to align the GTT addresses to 64K, both
> > > for the ppgtt and ggtt.
> > > 
> > > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > > Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> > > Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> > > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > 
> > Do we still need this with relocations removed? Userspace is picking all
> > the addresses for us, so all we have to check is whether userspace got it
> > right.
> 
> Yeah, for OFFSET_FIXED this just validates that the provided address is
> correctly aligned to 64K, while for the in-kernel insertion stuff we still
> need to allocate an address that is aligned to 64K. Setting the alignment
> here handles both cases.

Can't we just teach any in-kernel allocators to align to 2M and call it a
day? Ofc the code can still validate we don't have bugs (always good to
check your work). Ofc if the benefits is "no code can be removed anyway
since we still need to check" then ofc no point :-)

Just want to make sure we're not carrying complexity around for nothing,
since this predates the relocation removal.
-Daniel

> 
> > -Daniel
> > 
> > 
> > > ---
> > >   drivers/gpu/drm/i915/i915_vma.c | 9 +++++++--
> > >   1 file changed, 7 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
> > > index 4b7fc4647e46..1ea1fa08efdf 100644
> > > --- a/drivers/gpu/drm/i915/i915_vma.c
> > > +++ b/drivers/gpu/drm/i915/i915_vma.c
> > > @@ -670,8 +670,13 @@ i915_vma_insert(struct i915_vma *vma, u64 size, u64 alignment, u64 flags)
> > >   	}
> > >   	color = 0;
> > > -	if (vma->obj && i915_vm_has_cache_coloring(vma->vm))
> > > -		color = vma->obj->cache_level;
> > > +	if (vma->obj) {
> > > +		if (HAS_64K_PAGES(vma->vm->i915) && i915_gem_object_is_lmem(vma->obj))
> > > +			alignment = max(alignment, I915_GTT_PAGE_SIZE_64K);
> > > +
> > > +		if (i915_vm_has_cache_coloring(vma->vm))
> > > +			color = vma->obj->cache_level;
> > > +	}
> > >   	if (flags & PIN_OFFSET_FIXED) {
> > >   		u64 offset = flags & PIN_OFFSET_MASK;
> > > -- 
> > > 2.20.1
> > > 
> > 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
