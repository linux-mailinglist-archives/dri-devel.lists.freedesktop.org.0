Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D43610FE8
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 13:42:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16C7C10E806;
	Fri, 28 Oct 2022 11:42:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E06E10E80D
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 11:42:09 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1ooNkT-0004mr-Ut; Fri, 28 Oct 2022 13:42:06 +0200
Message-ID: <f5de84cfe81fee828bbe0d47d379028d28ef6ca6.camel@pengutronix.de>
Subject: Re: Try to address the DMA-buf coherency problem
From: Lucas Stach <l.stach@pengutronix.de>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 nicolas@ndufresne.ca, ppaalanen@gmail.com, sumit.semwal@linaro.org, 
 daniel@ffwll.ch, robdclark@gmail.com, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
Date: Fri, 28 Oct 2022 13:42:04 +0200
In-Reply-To: <7f5eff36-6886-bb06-061a-dd4263b61605@gmail.com>
References: <20221020121316.3946-1-christian.koenig@amd.com>
 <3d7353f3fa5905ce18e5b2d92f758f098189bc5a.camel@pengutronix.de>
 <7f5eff36-6886-bb06-061a-dd4263b61605@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Freitag, dem 28.10.2022 um 10:40 +0200 schrieb Christian König:
> Hi Lucas,
> 
> Am 28.10.22 um 10:09 schrieb Lucas Stach:
> > Hi Christian,
> > 
> > Am Donnerstag, dem 20.10.2022 um 14:13 +0200 schrieb Christian König:
> > > Hi guys,
> > > 
> > > after finding that we essentially have two separate worlds for coherent sharing
> > > of buffer through DMA-buf I thought I will tackle that problem a bit and at
> > > least allow the framework to reject attachments which won't work.
> > > 
> > > So those patches here add a new dma_coherent flag to each DMA-buf object
> > > telling the framework that dev_is_dma_coherent() needs to return true for an
> > > importing device to be able to attach. Since we should always have a fallback
> > > path this should give userspace the chance to still keep the use case working,
> > > either by doing a CPU copy instead or reversing the roles of exporter and
> > > importer.
> > > 
> > The fallback would likely be a CPU copy with the appropriate cache
> > flushes done by the device driver, which would be a massiv performance
> > issue.
> 
> But essentially the right thing to do. The only alternative I can see is 
> to reverse the role of exporter and importer.
> 
I don't think that would work generally either, as buffer exporter and
importer isn't always a 1:1 thing. As soon as any attached importer has
a different coherency behavior than the others, things fall apart.

> > > For DRM and most V4L2 devices I then fill in the dma_coherent flag based on the
> > > return value of dev_is_dma_coherent(). Exporting drivers are allowed to clear
> > > the flag for their buffers if special handling like the USWC flag in amdgpu or
> > > the uncached allocations for radeon/nouveau are in use.
> > > 
> > I don't think the V4L2 part works for most ARM systems. The default
> > there is for devices to be noncoherent unless explicitly marked
> > otherwise. I don't think any of the "devices" writing the video buffers
> > in cached memory with the CPU do this. While we could probably mark
> > them as coherent, I don't think this is moving in the right direction.
> 
> Well why not? Those devices are coherent in the sense of the DMA API 
> that they don't need an extra CPU copy on sync_to_cpu/sync_to_device.
> 
> We could come up with a better name for coherency, e.g. snooping for 
> example. But that is just an documentation detail.
> 
I agree that those devices copying data into a CPU cacheable buffer
should be marked as coherent, just not sure right now if other things
like DMA mappings are done on that device, which would require the
cache maintenance.

> > > Additional to that importers can also check the flag if they have some
> > > non-snooping operations like the special scanout case for amdgpu for example.
> > > 
> > > The patches are only smoke tested and the solution isn't ideal, but as far as
> > > I can see should at least keep things working.
> > > 
> > I would like to see this solved properly. Where I think properly means
> > we make things work on systems with mixed coherent/noncoherent masters
> > in the same way the DMA API does on such systems: by inserting the
> > proper cache maintenance operations.
> 
> And this the exact wrong approach as far as I can see. As Daniel noted 
> as well we absolutely need some kind of coherency between exporter and 
> importer.
> 
I think it's important that we are very specific about the thing we are
talking about here: I guess when you say coherency you mean hardware
enforced coherency on cacheable memory, which is the default on
x86/PCI.

The other way to enforce coherency is to either insert cache
maintenance operations, or make sure that the buffer is not cacheable
by any device taking part in the sharing, including the CPU.

> This can either be provided by the PCI specification which makes it 
> mandatory for device to snoop the caches or by platform devices agreeing 
> that they only work on uncached memory.

What you disregard here is the fact that there are many systems out
there with mixed topologies, where some masters are part of the
coherency domain and some are not.

We have two options here: either mandate that coherency for dma-bufs
need to be established by hardware, which is the option that you
strongly prefer, which means forcing all buffers to be uncacheable in a
system with masters that are not coherent, or allowing some form of
bracketed DMA access with cache maintenance ops.

> 
> Explicit cache flush operations are simple not part of the design of 
> DMA-buf because they are not part of the design of the higher level APIs 
> like Vulkan and OpenGL.

I'm aware that some graphics APIs have been living in a universe
blissfully unaware of systems without hardware enforced coherency. But
that isn't the only use for dma-bufs.

I totally agree that some higher level API primitives aren't possible
without coherency at the hardware level and for those uses we should
require either HW enforced coherency or uncachable memory. But I don't
think we should make things slow deliberately on systems that allow to
optimize things with the help of bracketed access.

If I understood things right your amdgpu use-case even falls into this
category: normally you would want to use cacheable memory for
everything, but just make sure to clean the caches before using the
buffer with the non-coherent display engine.

> 
> Adding this to DMA-buf for the rather special use case would completely 
> break that and make live much more complicated for everybody.
> 
> > I also think that we should keep in mind that the world is moving into
> > a direction where DMA masters may not only snoop the CPU caches (what
> > is the definition of cache coherent on x86), but actually take part in
> > the system coherence and are able to have writeback caches for shared
> > data on their own. I can only speculate, as I haven't seen the amdgpu
> > side yet, but I think this proposal is moving in the other direction by
> > assuming a central system cache, where the importer has some magic way
> > to clean this central cache.
> 
> What you mean is CXL: https://en.wikipedia.org/wiki/Compute_Express_Link

Or ARM AMBA CHI.
> 
> And yes we support that in a bunch of configurations and also have 
> worked with that and amdgpu with DMA-buf based shared.
> 
> This should not be a problem with this approach.

It works as long as all masters sharing the buffer are accessing the
buffer through the HW cache coherence facilities provided by CXL. As
soon as a master wants to bypass it (like your nosnoop scanout) you
need some way to force all other masters sharing access to the buffer
to clean their caches.

> 
> > Since I have a vested interest in seeing V4L2 UVC and non-coherent GPU
> > dma-buf sharing work on ARM systems and seem to hold some strong
> > opinions on how this should work, I guess I need to make some time
> > available to type it up, so we can discuss over coder rather than
> > abstract ideas. If I come up with something that works for my use-cases
> > would you be up for taking a shot at a amdgpu implementation?
> 
> Well, not really. As I said I see what you have in mind here as 
> completely wrong approach we will certainly not support in any GPU driver.
> 
> What we can do is to request the use case which won't work and this is 
> exactly what the patch here does.
> 
Did you mean to write "prevent the use case which won't work" here?

Regards,
Lucas

