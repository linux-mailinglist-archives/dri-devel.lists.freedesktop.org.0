Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 227A66161D8
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 12:39:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2C7210E47E;
	Wed,  2 Nov 2022 11:39:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D12F10E47C
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Nov 2022 11:39:28 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1oqC5a-0007uC-HW; Wed, 02 Nov 2022 12:39:22 +0100
Message-ID: <4fa4e5d3b1f46e46139bad069cbf5e795e63afa8.camel@pengutronix.de>
Subject: Re: Try to address the DMA-buf coherency problem
From: Lucas Stach <l.stach@pengutronix.de>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 Nicolas Dufresne <nicolas@ndufresne.ca>, Daniel Stone <daniel@fooishbar.org>
Date: Wed, 02 Nov 2022 12:39:20 +0100
In-Reply-To: <b422be59-4b4b-2d0d-8e8c-b19f27c6832e@gmail.com>
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

Hi Christian,

going to reply in more detail when I have some more time, so just some
quick thoughts for now.

Am Mittwoch, dem 02.11.2022 um 12:18 +0100 schrieb Christian König:
> Am 01.11.22 um 22:09 schrieb Nicolas Dufresne:
> > [SNIP]
> > > > But the client is just a video player. It doesn't understand how to
> > > > allocate BOs for Panfrost or AMD or etnaviv. So without a universal
> > > > allocator (again ...), 'just allocate on the GPU' isn't a useful
> > > > response to the client.
> > > Well exactly that's the point I'm raising: The client *must* understand
> > > that!
> > > 
> > > See we need to be able to handle all restrictions here, coherency of the
> > > data is just one of them.
> > > 
> > > For example the much more important question is the location of the data
> > > and for this allocating from the V4L2 device is in most cases just not
> > > going to fly.
> > It feels like this is a generic statement and there is no reason it could not be
> > the other way around.
> 
> And exactly that's my point. You always need to look at both ways to 
> share the buffer and can't assume that one will always work.
> 
> As far as I can see it you guys just allocate a buffer from a V4L2 
> device, fill it with data and send it to Wayland for displaying.
> 
> To be honest I'm really surprised that the Wayland guys hasn't pushed 
> back on this practice already.
> 
> This only works because the Wayland as well as X display pipeline is 
> smart enough to insert an extra copy when it find that an imported 
> buffer can't be used as a framebuffer directly.
> 
With bracketed access you could even make this case work, as the dGPU
would be able to slurp a copy of the dma-buf into LMEM for scanout.
 
> >   I have colleague who integrated PCIe CODEC (Blaize Xplorer
> > X1600P PCIe Accelerator) hosting their own RAM. There was large amount of ways
> > to use it. Of course, in current state of DMABuf, you have to be an exporter to
> > do anything fancy, but it did not have to be like this, its a design choice. I'm
> > not sure in the end what was the final method used, the driver isn't yet
> > upstream, so maybe that is not even final. What I know is that there is various
> > condition you may use the CODEC for which the optimal location will vary. As an
> > example, using the post processor or not, see my next comment for more details.
> 
> Yeah, and stuff like this was already discussed multiple times. Local 
> memory of devices can only be made available by the exporter, not the 
> importer.
> 
> So in the case of separated camera and encoder you run into exactly the 
> same limitation that some device needs the allocation to happen on the 
> camera while others need it on the encoder.
> 
> > > The more common case is that you need to allocate from the GPU and then
> > > import that into the V4L2 device. The background is that all dGPUs I
> > > know of need the data inside local memory (VRAM) to be able to scan out
> > > from it.
> > The reality is that what is common to you, might not be to others. In my work,
> > most ARM SoC have display that just handle direct scannout from cameras and
> > codecs.
> 
> > The only case the commonly fails is whenever we try to display UVC
> > created dmabuf,
> 
> Well, exactly that's not correct! The whole x86 use cases of direct 
> display for dGPUs are broken because media players think they can do the 
> simple thing and offload all the problematic cases to the display server.
> 
> This is absolutely *not* the common use case you describe here, but 
> rather something completely special to ARM.

It the normal case for a lot of ARM SoCs. That world is certainly not
any less big than the x86 dGPU world. A huge number of devices are ARM
based set-top boxes and other video players. Just because it is a
special case for you doesn't mean it's a global special case.

> 
> >   which have dirty CPU write cache and this is the type of thing
> > we'd like to see solved. I think this series was addressing it in principle, but
> > failing the import and the raised point is that this wasn't the optimal way.
> > 
> > There is a community project called LibreELEC, if you aren't aware, they run
> > Khodi with direct scanout of video stream on a wide variety of SoC and they use
> > the CODEC as exporter all the time. They simply don't have cases were the
> > opposite is needed (or any kind of remote RAM to deal with). In fact, FFMPEG
> > does not really offer you any API to reverse the allocation.
> 
> Ok, let me try to explain it once more. It sounds like I wasn't able to 
> get my point through.
> 
> That we haven't heard anybody screaming that x86 doesn't work is just 
> because we handle the case that a buffer isn't directly displayable in 
> X/Wayland anyway, but this is absolutely not the optimal solution.
> 
> The argument that you want to keep the allocation on the codec side is 
> completely false as far as I can see.
> 
> We already had numerous projects where we reported this practice as bugs 
> to the GStreamer and FFMPEG project because it won't work on x86 with dGPUs.
> 
And on a lot of ARM SoCs it's exactly the right thing to do. Many
codecs need contiguous memory there, so importing a scatter-gather
buffer from the GPU via dma-buf will simply not work.

> This is just a software solution which works because of coincident and 
> not because of engineering.

By mandating a software fallback for the cases where you would need
bracketed access to the dma-buf, you simply shift the problem into
userspace. Userspace then creates the bracket by falling back to some
other import option that mostly do a copy and then the appropriate
cache maintenance.

While I understand your sentiment about the DMA-API design being
inconvenient when things are just coherent by system design, the DMA-
API design wasn't done this way due to bad engineering, but due to the
fact that performant DMA access on some systems just require this kind
of bracketing.

Regards,
Lucas

