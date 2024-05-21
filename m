Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BCF8CADDB
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 14:06:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FDEC10EB14;
	Tue, 21 May 2024 12:06:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="li0EM0KW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52E8110EB14
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 12:06:26 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a599b74fd49so49038366b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 05:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1716293184; x=1716897984; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mJYdzH0pAsynv7wKO0qk2byjZJ72J8K30m6YCIFuLT4=;
 b=li0EM0KWidfs7b70vk8VRs5taC6ibe8QU0n4/YSbWCTJa+C5dRes3pt1sOZfUWBL9k
 /mLpzfnaog/bGNMUL8qLMzxnFshUgu1IVHEktd3ED0cAKcEVPBi1XMBR+nYCqxTBt4sR
 oDB+g3oZkCZoF//MY1arm0ynTm5UaBaM/tNPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716293184; x=1716897984;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mJYdzH0pAsynv7wKO0qk2byjZJ72J8K30m6YCIFuLT4=;
 b=CzVZ66XYyQu3DX+tOEBZqBdwPWmpZIv9QXVcDvRmPOZhD0tH17i26FeprLuBLxIRNs
 8gj+BSt7VZEuS+pP3YPucy0ED1Rp7Fn0lXZWnyAPjGUeArorWaO4HbPc9gUpDtJ2jKcu
 W7tcuX1mrngmkuVzUTTyGE0RUuIe8HgIzfOchL9nTOse7x9Tu7Ma9ffMMW0ZR3+RzA8l
 o09KAOgTePTZoPPBk5S4sst44mTmlsu+20UawL/flJo0OHDvYFMlqwlc8DLtZkqJca3h
 FIB2z/OYtGKArxTiFtt696sCeTXBX+AXQ6I1Ji/+Mau9M3LwEMs2g7vtXz2sUvYNxC8Y
 k+NA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEUWFEvPR2Mz7U6BYgMVnit7GvUQXNhOZuwOwdXmBdTgSZKG5FBzef04SMlxFLreQl9MzOK+Ha/7+BtZqs4duYceHoDZiq94pcKTP8b/oA
X-Gm-Message-State: AOJu0YyJmEu+7eHubjtAYime/B/KjdnWsNCxJwwaFnfcw/6pJ05BDniE
 rRJ5SoSfLjHOZmDD49UgJEr+VuV2qNRXWDb1HSqYXZXqU4MAgDsWoaRloA5brfg=
X-Google-Smtp-Source: AGHT+IGfWNF191WRUe0dOT+wxuFScDgLI5Opi7mIPWI0KL0XH3aj2MmoNzb6yDiPo3DHO/ZyoC6pQg==
X-Received: by 2002:a17:906:3553:b0:a5a:893a:ad3d with SMTP id
 a640c23a62f3a-a5a893aae74mr1306089766b.7.1716293184252; 
 Tue, 21 May 2024 05:06:24 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a179c7d14sm1605454566b.130.2024.05.21.05.06.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 May 2024 05:06:21 -0700 (PDT)
Date: Tue, 21 May 2024 14:06:19 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: John Stultz <jstultz@google.com>
Cc: Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 0/8] dma-buf: heaps: Support carved-out heaps and ECC
 related-flags
Message-ID: <ZkyOOwpM57HIiO3v@phenom.ffwll.local>
Mail-Followup-To: John Stultz <jstultz@google.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20240515-dma-buf-ecc-heap-v1-0-54cbbd049511@kernel.org>
 <CANDhNCoOKwtpstFE2VDcUvzdXUWkZ-Zx+fz6xrdPWTyciVXMXQ@mail.gmail.com>
 <ZkXmWwmdPsqAo7VU@phenom.ffwll.local>
 <CANDhNCo5hSC-sLwdkBi3e-Ja-MzdqcGGbn-4G3XNYwCzZUwscw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANDhNCo5hSC-sLwdkBi3e-Ja-MzdqcGGbn-4G3XNYwCzZUwscw@mail.gmail.com>
X-Operating-System: Linux phenom 6.8.9-amd64 
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

On Thu, May 16, 2024 at 09:51:35AM -0700, John Stultz wrote:
> On Thu, May 16, 2024 at 3:56 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > On Wed, May 15, 2024 at 11:42:58AM -0700, John Stultz wrote:
> > > But it makes me a little nervous to add a new generic allocation flag
> > > for a feature most hardware doesn't support (yet, at least). So it's
> > > hard to weigh how common the actual usage will be across all the
> > > heaps.
> > >
> > > I apologize as my worry is mostly born out of seeing vendors really
> > > push opaque feature flags in their old ion heaps, so in providing a
> > > flags argument, it was mostly intended as an escape hatch for
> > > obviously common attributes. So having the first be something that
> > > seems reasonable, but isn't actually that common makes me fret some.
> > >
> > > So again, not an objection, just something for folks to stew on to
> > > make sure this is really the right approach.
> >
> > Another good reason to go with full heap names instead of opaque flags on
> > existing heaps is that with the former we can use symlinks in sysfs to
> > specify heaps, with the latter we need a new idea. We haven't yet gotten
> > around to implement this anywhere, but it's been in the dma-buf/heap todo
> > since forever, and I like it as a design approach. So would be a good idea
> > to not toss it. With that display would have symlinks to cma-ecc and cma,
> > and rendering maybe cma-ecc, shmem, cma heaps (in priority order) for a
> > SoC where the display needs contig memory for scanout.
> 
> So indeed that is a good point to keep in mind, but I also think it
> might re-inforce the choice of having ECC as a flag here.
> 
> Since my understanding of the sysfs symlinks to heaps idea is about
> being able to figure out a common heap from a collection of devices,
> it's really about the ability for the driver to access the type of
> memory. If ECC is just an attribute of the type of memory (as in this
> patch series), it being on or off won't necessarily affect
> compatibility of the buffer with the device.  Similarly "uncached"
> seems more of an attribute of memory type and not a type itself.
> Hardware that can access non-contiguous "system" buffers can access
> uncached system buffers.

Yeah, but in graphics there's a wide band where "shit performance" is
defacto "not useable (as intended at least)".

So if we limit the symlink idea to just making sure zero-copy access is
possible, then we might not actually solve the real world problem we need
to solve. And so the symlinks become somewhat useless, and we need to
somewhere encode which flags you need to use with each symlink.

But I also see the argument that there's a bit a combinatorial explosion
possible. So I guess the question is where we want to handle it ...

Also wondering whether we should get the symlink/allocator idea off the
ground first, but given that that hasn't moved in a decade it might be too
much. But then the question is, what userspace are we going to use for all
these new heaps (or heaps with new flags)?

Cheers, Sima

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
