Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2167949DD30
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 10:02:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B958410EE37;
	Thu, 27 Jan 2022 09:02:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 177DB10EE23
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 09:02:22 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 c190-20020a1c9ac7000000b0035081bc722dso1389396wme.5
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 01:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=2eUp5BPA7UfOIln4xH7CwxT1Ma80FeWymOHUn7zCIP4=;
 b=dyrPXO7cE4gGhdr62w9NB2LQs7tCfPqXlS9wZhcNJ3LBFuWW5npKrGGN8Cazq8NJot
 BxyCmogAv1xf8upzj44O4tbQ1nXye5DqAz4KDKa+WFj0vpjF4FS5UUA4i8UW94oJvPyC
 l+syOL5kJlAvG+sdasXA5o4s4EboxOAc+MtoQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=2eUp5BPA7UfOIln4xH7CwxT1Ma80FeWymOHUn7zCIP4=;
 b=CLbOmy2INO9e1rYKt+JS7kSMrA8ep39xfZSYs05jcqWC6VlYA8nQ4rnS4+/rJ2znMc
 Kc2yWT2A59ISuTJA7lxQK9/oZtK26pWm9TtpGVm4dB1c0mH5Oxv75aTie9Net/ows/Px
 Pwtq5BUiWBe6067vTQWHBcV/ZA6BjIgBnppGYGcAx2xprtMFMBkWDBdckoGJU4UDI6SF
 wkq6lSlP/uUhGRSz+VYEOtg/JQb/rWUVgSxoZN8EnNGn96K29Bv/LjHFLrVAxgOmTwgN
 kg/acdV0aWw1EEVAXK80N6UuJlygkQqjx/o+g8tibmMDc9ZSDwZkhkOF5Gm3rrwUcE5P
 5byA==
X-Gm-Message-State: AOAM530VJScpjjMcTxWzZRPdamKqX94oiifRed9sKLxlwYVC/OKGVcQ2
 ET1x5tfy6BxdJ8YOKdpHVX/HNQ==
X-Google-Smtp-Source: ABdhPJx7pri2h0SYfqbY/4LaK5La7Uq+0ogxt1MTcUVnBBIqjx46Tng5d79ruBwDVjMRf43CzcKvZw==
X-Received: by 2002:a05:600c:1994:: with SMTP id
 t20mr5336216wmq.124.1643274140526; 
 Thu, 27 Jan 2022 01:02:20 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r8sm1595758wrx.2.2022.01.27.01.02.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 01:02:19 -0800 (PST)
Date: Thu, 27 Jan 2022 10:02:18 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [Intel-gfx] [PATCH 01/19] dma-buf-map: Add read/write helpers
Message-ID: <YfJfmitYfbqIgqqC@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, 
 Matthew Brost <matthew.brost@intel.com>,
 intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
References: <20220126203702.1784589-1-lucas.demarchi@intel.com>
 <20220126203702.1784589-2-lucas.demarchi@intel.com>
 <91bfa9d4-99fc-767e-5ba2-a2643cf585f5@amd.com>
 <20220127073637.GA17282@jons-linux-dev-box>
 <0f948558-6f31-fd81-5349-38ab21379f86@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0f948558-6f31-fd81-5349-38ab21379f86@amd.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 27, 2022 at 08:59:36AM +0100, Christian König wrote:
> Am 27.01.22 um 08:36 schrieb Matthew Brost:
> > [SNIP]
> > > >    /**
> > > >     * dma_buf_map_memcpy_to - Memcpy into dma-buf mapping
> > > >     * @dst:	The dma-buf mapping structure
> > > > @@ -263,4 +304,44 @@ static inline void dma_buf_map_incr(struct dma_buf_map *map, size_t incr)
> > > >    		map->vaddr += incr;
> > > >    }
> > > > +/**
> > > > + * dma_buf_map_read_field - Read struct member from dma-buf mapping with
> > > > + * arbitrary size and handling un-aligned accesses
> > > > + *
> > > > + * @map__:	The dma-buf mapping structure
> > > > + * @type__:	The struct to be used containing the field to read
> > > > + * @field__:	Member from struct we want to read
> > > > + *
> > > > + * Read a value from dma-buf mapping calculating the offset and size: this assumes
> > > > + * the dma-buf mapping is aligned with a a struct type__. A single u8, u16, u32
> > > > + * or u64 can be read, based on the offset and size of type__.field__.
> > > > + */
> > > > +#define dma_buf_map_read_field(map__, type__, field__) ({				\
> > > > +	type__ *t__;									\
> > > > +	typeof(t__->field__) val__;							\
> > > > +	dma_buf_map_memcpy_from_offset(&val__, map__, offsetof(type__, field__),	\
> > > > +				       sizeof(t__->field__));				\
> > > > +	val__;										\
> > > > +})
> > > > +
> > > > +/**
> > > > + * dma_buf_map_write_field - Write struct member to the dma-buf mapping with
> > > > + * arbitrary size and handling un-aligned accesses
> > > > + *
> > > > + * @map__:	The dma-buf mapping structure
> > > > + * @type__:	The struct to be used containing the field to write
> > > > + * @field__:	Member from struct we want to write
> > > > + * @val__:	Value to be written
> > > > + *
> > > > + * Write a value to the dma-buf mapping calculating the offset and size.
> > > > + * A single u8, u16, u32 or u64 can be written based on the offset and size of
> > > > + * type__.field__.
> > > > + */
> > > > +#define dma_buf_map_write_field(map__, type__, field__, val__) ({			\
> > > > +	type__ *t__;									\
> > > > +	typeof(t__->field__) val____ = val__;						\
> > > > +	dma_buf_map_memcpy_to_offset(map__, offsetof(type__, field__),			\
> > > > +				     &val____, sizeof(t__->field__));			\
> > > > +})
> > > > +
> > > Uff well that absolutely looks like overkill to me.
> > > 
> > Hold on...
> > 
> > > That's a rather special use case as far as I can see and I think we should
> > > only have this in the common framework if more than one driver is using it.
> > > 
> > I disagree, this is rather elegant.
> > 
> > The i915 can't be the *only* driver that defines a struct which
> > describes the layout of a dma_buf object.
> 
> That's not the problem, amdgpu as well as nouveau are doing that as well.
> The problem is DMA-buf is a buffer sharing framework between drivers.
> 
> In other words which importer is supposed to use this with a DMA-buf
> exported by another device?
> 
> > IMO this base macro allows *all* other drivers to build on this write
> > directly to fields in structures those drivers have defined.
> 
> Exactly that's the point. This is something drivers should absolutely *NOT*
> do.
> 
> That are driver internals and it is extremely questionable to move this into
> the common framework.

See my other reply.

This is about struct dma_buf_map, which is just a tagged pointer.

Which happens to be used by the dma_buf cross-driver interface, but it's
also used plenty internally in buffer allocation helpers, fbdev,
everything else. And it was _meant_ to be used like that - this thing is
my idea, I know :-)

I guess we could move/rename it, but like I said I really don't have any
good ideas. Got some?
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
