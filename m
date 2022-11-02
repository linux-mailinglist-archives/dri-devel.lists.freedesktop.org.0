Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70483616A22
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 18:10:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E48E10E053;
	Wed,  2 Nov 2022 17:10:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43B3910E053
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Nov 2022 17:10:53 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1oqHGL-0002oN-7M; Wed, 02 Nov 2022 18:10:49 +0100
Message-ID: <0abc6efddb8dfc1888de15a1bedaaac6688fd078.camel@pengutronix.de>
Subject: Re: Try to address the DMA-buf coherency problem
From: Lucas Stach <l.stach@pengutronix.de>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 Nicolas Dufresne <nicolas@ndufresne.ca>, Daniel Stone <daniel@fooishbar.org>
Date: Wed, 02 Nov 2022 18:10:48 +0100
In-Reply-To: <cc091a11-d012-d998-b7e2-8b3d616867a7@gmail.com>
References: <20221020121316.3946-1-christian.koenig@amd.com>
 <3d7353f3fa5905ce18e5b2d92f758f098189bc5a.camel@pengutronix.de>
 <7f5eff36-6886-bb06-061a-dd4263b61605@gmail.com>
 <f5de84cfe81fee828bbe0d47d379028d28ef6ca6.camel@pengutronix.de>
 <e02cedc2-6741-8813-a7a5-f8769e301745@gmail.com>
 <a53e5df51ec0f2f9d4c2d377c0cc5ba85f2e58ff.camel@ndufresne.ca>
 <9d716641-55c6-1590-26c2-1c3b14a28226@gmail.com>
 <CAPj87rMPkmimR_RJHhxYZokH__TVpPArk0h6drOUSx7Z9+oAHA@mail.gmail.com>
 <11a6f97c-e45f-f24b-8a73-48d5a388a2cc@gmail.com>
 <caf4d6b82843788db97555a58bc9e33915e5b50a.camel@ndufresne.ca>
 <b422be59-4b4b-2d0d-8e8c-b19f27c6832e@gmail.com>
 <4fa4e5d3b1f46e46139bad069cbf5e795e63afa8.camel@pengutronix.de>
 <cc091a11-d012-d998-b7e2-8b3d616867a7@gmail.com>
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
Cc: ppaalanen@gmail.com, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Mittwoch, dem 02.11.2022 um 13:21 +0100 schrieb Christian König:
> Hi Lucas,
> 
> Am 02.11.22 um 12:39 schrieb Lucas Stach:
> > Hi Christian,
> > 
> > going to reply in more detail when I have some more time, so just some
> > quick thoughts for now.
> > 
> > Am Mittwoch, dem 02.11.2022 um 12:18 +0100 schrieb Christian König:
> > > Am 01.11.22 um 22:09 schrieb Nicolas Dufresne:
> > > > [SNIP]
> > > As far as I can see it you guys just allocate a buffer from a V4L2
> > > device, fill it with data and send it to Wayland for displaying.
> > > 
> > > To be honest I'm really surprised that the Wayland guys hasn't pushed
> > > back on this practice already.
> > > 
> > > This only works because the Wayland as well as X display pipeline is
> > > smart enough to insert an extra copy when it find that an imported
> > > buffer can't be used as a framebuffer directly.
> > > 
> > With bracketed access you could even make this case work, as the dGPU
> > would be able to slurp a copy of the dma-buf into LMEM for scanout.
> 
> Well, this copy is what we are trying to avoid here. The codec should 
> pump the data into LMEM in the first place.
> 
That's very use-case specific. If the codec used those frames as
reference frames for further coding operations, allocating them in LMEM
of a remote device doesn't sound like a clever idea. But then I think
this is a whole different discussion on its own.

> > > > The only case the commonly fails is whenever we try to display UVC
> > > > created dmabuf,
> > > Well, exactly that's not correct! The whole x86 use cases of direct
> > > display for dGPUs are broken because media players think they can do the
> > > simple thing and offload all the problematic cases to the display server.
> > > 
> > > This is absolutely *not* the common use case you describe here, but
> > > rather something completely special to ARM.
> > It the normal case for a lot of ARM SoCs.
> 
> Yeah, but it's not the normal case for everybody.
> 
> We had numerous projects where customers wanted to pump video data 
> directly from a decoder into an GPU frame or from a GPU frame into an 
> encoder.
> 
> The fact that media frameworks doesn't support that out of the box is 
> simply a bug.
> 
> > That world is certainly not
> > any less big than the x86 dGPU world. A huge number of devices are ARM
> > based set-top boxes and other video players. Just because it is a
> > special case for you doesn't mean it's a global special case.
> 
> Ok, let's stop with that. This isn't helpful in the technical discussion.
> 
Agreed. I think we should try to understand the fact that there are
very different world-views and use-cases for dma-buf right now and that
breaking one or the other is simply no option. What may be an obscure
special case on x86 may be very common on ARM and vice versa.

> > 
> > > That we haven't heard anybody screaming that x86 doesn't work is just
> > > because we handle the case that a buffer isn't directly displayable in
> > > X/Wayland anyway, but this is absolutely not the optimal solution.
> > > 
> > > The argument that you want to keep the allocation on the codec side is
> > > completely false as far as I can see.
> > > 
> > > We already had numerous projects where we reported this practice as bugs
> > > to the GStreamer and FFMPEG project because it won't work on x86 with dGPUs.
> > > 
> > And on a lot of ARM SoCs it's exactly the right thing to do.
> 
> Yeah and that's fine, it just doesn't seem to work in all cases.
> 
> For both x86 as well as the case here that the CPU cache might be dirty 
> the exporter needs to be the device with the requirements.
> 
> For x86 dGPUs that's the backing store is some local memory. For the 
> non-coherent ARM devices it's that the CPU cache is not dirty.
> 
> For a device driver which solely works with cached system memory 
> inserting cache flush operations is something it would never do for 
> itself. 
> 
It's exactly what a device driver working with cacheable memory buffers
on a architecture with non-coherent DMA masters would do. In fact it's
the main reason why the bracketing with explicit ownership transfer
exists in DMA API: to allow the DMA API implementation to do the
necessary cache maintenance operations on architectures that need them.

> It would just be doing this for the importer and exactly that 
> would be bad design because we then have handling for the display driver 
> outside of the driver.
> 
The driver would have to do those cache maintenance operations if it
directly worked with a non-coherent device. Doing it for the importer
is just doing it for another device, not the one directly managed by
the exporter.

I really don't see the difference to the other dma-buf ops: in
dma_buf_map_attachment the exporter maps the dma-buf on behalf and into
the address space of the importer. Why would cache maintenance be any
different?

> > > This is just a software solution which works because of coincident and
> > > not because of engineering.
> > By mandating a software fallback for the cases where you would need
> > bracketed access to the dma-buf, you simply shift the problem into
> > userspace. Userspace then creates the bracket by falling back to some
> > other import option that mostly do a copy and then the appropriate
> > cache maintenance.
> > 
> > While I understand your sentiment about the DMA-API design being
> > inconvenient when things are just coherent by system design, the DMA-
> > API design wasn't done this way due to bad engineering, but due to the
> > fact that performant DMA access on some systems just require this kind
> > of bracketing.
> 
> Well, this is exactly what I'm criticizing on the DMA-API. Instead of 
> giving you a proper error code when something won't work in a specific 
> way it just tries to hide the requirements inside the DMA layer.
> 
> For example when your device can only access 32bits the DMA-API 
> transparently insert bounce buffers instead of giving you a proper error 
> code that the memory in question can't be accessed.
> 
> This just tries to hide the underlying problem instead of pushing it 
> into the upper layer where it can be handled much more gracefully.

How would you expect the DMA API to behave on a system where the device
driver is operating on cacheable memory, but the device is non-
coherent? Telling the driver that this just doesn't work? It's a use-
case that is working fine today with many devices (e.g. network
adapters) in the ARM world, exactly because the architecture specific
implementation of the DMA API inserts the cache maintenance operations
on buffer ownership transfer.

Regards,
Lucas

