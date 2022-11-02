Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B117D616DF8
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 20:48:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 141ED10E5E1;
	Wed,  2 Nov 2022 19:48:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E409A10E5E1
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Nov 2022 19:48:22 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1oqJil-0008B1-IR; Wed, 02 Nov 2022 20:48:19 +0100
Message-ID: <6473d6f106ce8d786c216f12ff70eec98a9265fa.camel@pengutronix.de>
Subject: Re: Try to address the DMA-buf coherency problem
From: Lucas Stach <l.stach@pengutronix.de>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 Nicolas Dufresne <nicolas@ndufresne.ca>, Daniel Stone <daniel@fooishbar.org>
Date: Wed, 02 Nov 2022 20:48:17 +0100
In-Reply-To: <1e2a6750-9849-e9ee-69d6-e4bfdcfb64f3@gmail.com>
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
 <0abc6efddb8dfc1888de15a1bedaaac6688fd078.camel@pengutronix.de>
 <1e2a6750-9849-e9ee-69d6-e4bfdcfb64f3@gmail.com>
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

Am Mittwoch, dem 02.11.2022 um 20:13 +0100 schrieb Christian König:
> Am 02.11.22 um 18:10 schrieb Lucas Stach:
> > Am Mittwoch, dem 02.11.2022 um 13:21 +0100 schrieb Christian König:
> > [SNIP]
> > > It would just be doing this for the importer and exactly that
> > > would be bad design because we then have handling for the display driver
> > > outside of the driver.
> > > 
> > The driver would have to do those cache maintenance operations if it
> > directly worked with a non-coherent device. Doing it for the importer
> > is just doing it for another device, not the one directly managed by
> > the exporter.
> > 
> > I really don't see the difference to the other dma-buf ops: in
> > dma_buf_map_attachment the exporter maps the dma-buf on behalf and into
> > the address space of the importer. Why would cache maintenance be any
> > different?
> 
> The issue here is the explicit ownership transfer.
> 
> We intentionally decided against that because it breaks tons of use 
> cases and is at least by me and a couple of others seen as generally 
> design failure of the Linux DMA-API.
> 
> DMA-Buf let's the exporter setup the DMA addresses the importer uses to 
> be able to directly decided where a certain operation should go. E.g. we 
> have cases where for example a P2P write doesn't even go to memory, but 
> rather a doorbell BAR to trigger another operation. Throwing in CPU 
> round trips for explicit ownership transfer completely breaks that concept.

I'm not sure where you see the CPU in that scenario. A explicit
ownership transfer could also trigger things like a cache invalidate on
the receiving end of a P2P transfer. A CPU cache invalidate/flush is
just one possible use-case of the ownership transfer.

And sure, some uses will just not work when a explicit ownership
transfer is required, as the usage model and/or API doesn't allow for
it. But lots of uses will work with explicit ownership transfer,
actually there is no other way to properly deal with systems where the
sharing masters may be non-coherent, which is norm rather than the
exception in lots of embedded uses, regardless of the inconvenience
this might cause for some other areas.

> 
> Additional to that a very basic concept of DMA-buf is that the exporter 
> provides the buffer as it is and just double checks if the importer can 
> access it. For example we have XGMI links which makes memory accessible 
> to other devices on the same bus, but not to PCIe device and not even to 
> the CPU. Otherwise you wouldn't be able to implement things like secure 
> decoding where the data isn't even accessible outside the device to 
> device link.
> 
> So if a device driver uses cached system memory on an architecture which 
> devices which can't access it the right approach is clearly to reject 
> the access.
> 
> What we can do is to reverse the role of the exporter and importer and 
> let the device which needs uncached memory take control. This way this 
> device can insert operations as needed, e.g. flush read caches or 
> invalidate write caches.
> 
And that will only solve one aspect of the allocation restriction maze,
namely the cacheable attribute, but it might as well break things like
contiguous requirements.

> This is what we have already done in DMA-buf and what already works 
> perfectly fine with use cases which are even more complicated than a 
> simple write cache invalidation.
> 
> > > > > This is just a software solution which works because of coincident and
> > > > > not because of engineering.
> > > > By mandating a software fallback for the cases where you would need
> > > > bracketed access to the dma-buf, you simply shift the problem into
> > > > userspace. Userspace then creates the bracket by falling back to some
> > > > other import option that mostly do a copy and then the appropriate
> > > > cache maintenance.
> > > > 
> > > > While I understand your sentiment about the DMA-API design being
> > > > inconvenient when things are just coherent by system design, the DMA-
> > > > API design wasn't done this way due to bad engineering, but due to the
> > > > fact that performant DMA access on some systems just require this kind
> > > > of bracketing.
> > > Well, this is exactly what I'm criticizing on the DMA-API. Instead of
> > > giving you a proper error code when something won't work in a specific
> > > way it just tries to hide the requirements inside the DMA layer.
> > > 
> > > For example when your device can only access 32bits the DMA-API
> > > transparently insert bounce buffers instead of giving you a proper error
> > > code that the memory in question can't be accessed.
> > > 
> > > This just tries to hide the underlying problem instead of pushing it
> > > into the upper layer where it can be handled much more gracefully.
> > How would you expect the DMA API to behave on a system where the device
> > driver is operating on cacheable memory, but the device is non-
> > coherent? Telling the driver that this just doesn't work?
> 
> Yes, exactly that.
> 
> It's the job of the higher level to prepare the buffer a device work 
> with, not the one of the lower level.
> 
> In other words in a proper design the higher level would prepare the 
> memory in a way the device driver can work with it, not the other way 
> around.
> 
> When a device driver gets memory it can't work with the correct response 
> is to throw an error and bubble that up into a layer where it can be 
> handled gracefully.
> 
How would this situation be handled more gracefully than a cache
flush/invalidate. Certainly the solution wouldn't be to make the Linux
network stack operate on non-cacheable memory? To be clear: that's a
rhetorical question, as unaligned access, which is quite common in many
network uses, to non-cacheable memory is also not allowed on most
system designs, so this isn't even an option.

> For example instead of using bounce buffers under the hood the DMA layer 
> the MM should make sure that when you call read() with O_DIRECT that the 
> pages in question are accessible by the device.
> 
> > It's a use-case that is working fine today with many devices (e.g. network
> > adapters) in the ARM world, exactly because the architecture specific
> > implementation of the DMA API inserts the cache maintenance operations
> > on buffer ownership transfer.
> 
> Yeah, I'm perfectly aware of that. The problem is that exactly that 
> design totally breaks GPUs on Xen DOM0 for example.
> 
> And Xen is just one example, I can certainly say from experience that 
> this design was a really really bad idea because it favors just one use 
> case while making other use cases practically impossible if not really 
> hard to implement.

So maybe we should agree that we both have uses in mind which are
practically impossible to implement when restricting dma-buf to one
world view? You are thinking about uses that need full coherence
without any bracketing and I'm thinking about uses that won't ever work
with usable performance without bracketing.

So maybe we should circle back to daniels suggestion to have a flag to
keep both worlds apart? Reject the import as you do in this series when
the "must not use bracketing" flag is set and allow explicit ownership
transfers otherwise seems like a workable solution to me.

Regards,
Lucas

