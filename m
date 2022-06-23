Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E65275578B2
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 13:29:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1C1B10E163;
	Thu, 23 Jun 2022 11:29:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3417410E163
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 11:29:40 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1o4L1j-0004KC-6N; Thu, 23 Jun 2022 13:29:35 +0200
Message-ID: <f3c32cdd2ab4e76546c549b0cebba8e1d19d1cb0.camel@pengutronix.de>
Subject: Re: DMA-buf and uncached system memory
From: Lucas Stach <l.stach@pengutronix.de>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Pekka
 Paalanen <ppaalanen@gmail.com>
Date: Thu, 23 Jun 2022 13:29:34 +0200
In-Reply-To: <6287f5f8-d9af-e03d-a2c8-ea8ddcbdc0d8@amd.com>
References: <91ff0bbb-ea3a-2663-3453-dea96ccd6dd8@amd.com>
 <YCuPhOT4GhY3RR/6@phenom.ffwll.local>
 <9178e19f5c0e141772b61b759abaa0d176f902b6.camel@ndufresne.ca>
 <CAPj87rPYQNkgVEdHECQcHcYe2nCpgF3RYQKk_=wwhvJSxwHXCg@mail.gmail.com>
 <c6e65ee1-531e-d72c-a6a6-da7149e34f18@amd.com>
 <20220623101326.18beeab3@eldfell>
 <954d0a9b-29ef-52ef-f6ca-22d7e6aa3f4d@amd.com>
 <4b69f9f542d6efde2190b73c87096e87fa24d8ef.camel@pengutronix.de>
 <adc626ec-ff5a-5c06-44ce-09111be450cd@amd.com>
 <fbb228cd78e9bebd7e7921c19e0c4c09d0891f23.camel@pengutronix.de>
 <e691bccc-171d-f674-2817-13a945970f4a@amd.com>
 <95cca943bbfda6af07339fb8d2dc7f4da3aa0280.camel@pengutronix.de>
 <05814ddb-4f3e-99d8-025a-c31db7b2c46b@amd.com>
 <708e27755317a7650ca08ba2e4c14691ac0d6ba2.camel@pengutronix.de>
 <6287f5f8-d9af-e03d-a2c8-ea8ddcbdc0d8@amd.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: "Sharma, Shashank" <Shashank.Sharma@amd.com>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>, linaro-mm-sig@lists.linaro.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Donnerstag, dem 23.06.2022 um 13:10 +0200 schrieb Christian König:
> Am 23.06.22 um 12:13 schrieb Lucas Stach:
> > [SNIP]
> > > > On most of the multimedia
> > > > targeted ARM SoCs being unable to snoop the cache is the norm, not an
> > > > exception.
> > > > 
> > > > > See for example on AMD/Intel hardware most of the engines can perfectly
> > > > > deal with cache coherent memory accesses. Only the display engines can't.
> > > > > 
> > > > > So on import time we can't even say if the access can be coherent and
> > > > > snoop the CPU cache or not because we don't know how the imported
> > > > > DMA-buf will be used later on.
> > > > > 
> > > > So for those mixed use cases, wouldn't it help to have something
> > > > similar to the dma_sync in the DMA-buf API, so your scanout usage can
> > > > tell the exporter that it's going to do non-snoop access and any dirty
> > > > cache lines must be cleaned? Signaling this to the exporter would allow
> > > > to skip the cache maintenance if the buffer is in CPU uncached memory,
> > > > which again is a default case for the ARM SoC world.
> > > Well for the AMD and Intel use cases we at least have the opportunity to
> > > signal cache flushing, but I'm not sure if that counts for everybody.
> > > 
> > Sure, all the non-coherent arches have some way to do the cache
> > maintenance in some explicit way. Non coherent and no cache maintenance
> > instruction would be a recipe for desaster. ;)
> > 
> > > What we would rather do for those use cases is an indicator on the
> > > DMA-buf if the underlying backing store is CPU cached or not. The
> > > importer can then cleanly reject the use cases where it can't support
> > > CPU cache snooping.
> > > 
> > > This then results in the normal fallback paths which we have anyway for
> > > those use cases because DMA-buf sharing is not always possible.
> > > 
> > That's a very x86 centric world view you have there. 99% of DMA-buf
> > uses on those cheap ARM SoCs is non-snooping. We can not do any
> > fallbacks here, as the whole graphics world on those SoCs with their
> > different IP cores mixed together depends on DMA-buf sharing working
> > efficiently even when the SoC is mostly non coherent.
> > 
> > In fact DMA-buf sharing works fine on most of those SoCs because
> > everyone just assumes that all the accelerators don't snoop, so the
> > memory shared via DMA-buf is mostly CPU uncached. It only falls apart
> > for uses like the UVC cameras, where the shared buffer ends up being
> > CPU cached.
> 
> Well then the existing DMA-buf framework is not what you want to use for 
> this.
> 
Sorry, but this is just ignoring reality. You try to flag 8+ years of
DMA-buf usage on non-coherent arches as "you shouldn't do this". At
this point there are probably a lot more users (drivers) of DMA-buf in
the kernel for devices, which are used on non-coherent arches, than
there are on coherent arches.

> > Non-coherent without explicit domain transfer points is just not going
> > to work. So why can't we solve the issue for DMA-buf in the same way as
> > the DMA API already solved it years ago: by adding the equivalent of
> > the dma_sync calls that do cache maintenance when necessary? On x86 (or
> > any system where things are mostly coherent) you could still no-op them
> > for the common case and only trigger cache cleaning if the importer
> > explicitly says that is going to do a non-snooping access.
> 
> Because DMA-buf is a framework for buffer sharing between cache coherent 
> devices which don't signal transitions.
> 
> We intentionally didn't implemented any of the dma_sync_* functions 
> because that would break the intended use case.
> 
Non coherent access, including your non-snoop scanout, and no domain
transition signal just doesn't go together when you want to solve
things in a generic way.

Remember that in a fully (not only IO) coherent system the CPU isn't
the only agent that may cache the content you are trying to access
here. The dirty cacheline could reasonably still be sitting in a GPU or
VPU cache, so you need some way to clean those cachelines, which isn't
a magic "importer knows how to call CPU cache clean instructions".

> You can of course use DMA-buf in an incoherent environment, but then you 
> can't expect that this works all the time.
> 
> This is documented behavior and so far we have bluntly rejected any of 
> the complains that it doesn't work on most ARM SoCs and I don't really 
> see a way to do this differently.

Can you point me to that part of the documentation? A quick grep for
"coherent" didn't immediately turn something up within the DMA-buf
dirs.

Regards,
Lucas

