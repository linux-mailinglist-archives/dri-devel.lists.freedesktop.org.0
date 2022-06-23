Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDF8557616
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 10:58:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB47B11A5A4;
	Thu, 23 Jun 2022 08:58:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26FB611A5B3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 08:58:32 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1o4IfT-0001Zu-Cc; Thu, 23 Jun 2022 10:58:27 +0200
Message-ID: <fbb228cd78e9bebd7e7921c19e0c4c09d0891f23.camel@pengutronix.de>
Subject: Re: DMA-buf and uncached system memory
From: Lucas Stach <l.stach@pengutronix.de>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Pekka
 Paalanen <ppaalanen@gmail.com>
Date: Thu, 23 Jun 2022 10:58:26 +0200
In-Reply-To: <adc626ec-ff5a-5c06-44ce-09111be450cd@amd.com>
References: <91ff0bbb-ea3a-2663-3453-dea96ccd6dd8@amd.com>
 <YCuPhOT4GhY3RR/6@phenom.ffwll.local>
 <9178e19f5c0e141772b61b759abaa0d176f902b6.camel@ndufresne.ca>
 <CAPj87rPYQNkgVEdHECQcHcYe2nCpgF3RYQKk_=wwhvJSxwHXCg@mail.gmail.com>
 <c6e65ee1-531e-d72c-a6a6-da7149e34f18@amd.com>
 <20220623101326.18beeab3@eldfell>
 <954d0a9b-29ef-52ef-f6ca-22d7e6aa3f4d@amd.com>
 <4b69f9f542d6efde2190b73c87096e87fa24d8ef.camel@pengutronix.de>
 <adc626ec-ff5a-5c06-44ce-09111be450cd@amd.com>
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

Am Donnerstag, dem 23.06.2022 um 10:14 +0200 schrieb Christian König:
> Am 23.06.22 um 10:04 schrieb Lucas Stach:
> > Am Donnerstag, dem 23.06.2022 um 09:26 +0200 schrieb Christian König:
> > > Am 23.06.22 um 09:13 schrieb Pekka Paalanen:
> > > > On Thu, 23 Jun 2022 08:59:41 +0200
> > > > Christian König <christian.koenig@amd.com> wrote:
> > > > 
> > > > > The exporter isn't doing anything wrong here. DMA-buf are supposed to be
> > > > > CPU cached and can also be cache hot.
> > > > Hi,
> > > > 
> > > > what is that statement based on?
> > > On the design documentation of DMA-buf and the actual driver
> > > implementations.
> > > 
> > > Coherency and snooping of the CPU cache is mandatory for devices and
> > > root complexes in the PCI specification. Incoherent access is just an
> > > extension.
> > > 
> > > We inherited that by basing DMA-buf on the Linux kernel DMA-API which in
> > > turn is largely based on the PCI specification.
> > > 
> > > > Were the (mandatory for CPU access) cpu_access_begin/end functions &
> > > > ioctls not supposed to ensure that CPU cache is up-to-date / CPU cache
> > > > is fully flushed out?
> > > No, those functions are to inform the exporter that the importer has
> > > started and finished accessing the buffer using the CPU.
> > > 
> > > There is no signaling in the other direction. In other words the
> > > exporter doesn't inform the importer about CPU accesses because it is
> > > the owner of the buffer.
> > > 
> > > It's the responsibility of the importer to make sure that it can
> > > actually access the data in the buffer. If it can't guarantee that the
> > > importer shouldn't import the buffer in the first place.
> > This is not really correct. DMA-buf inherited the the map/unmap part
> > from the DMA API, which on cache coherent architecture is mostly a no-
> > op or ties into the IOMMU implementation to set up the pagetables for
> > the translation. On non cache coherent architectures this is the point
> > where any any necessary cache maintenance happens. DRM breaks this
> > model by caching the DMA-buf mapping for performance reasons.
> 
> That's not only because of performance reasons, but also because of 
> correctness.
> 
> At least the Vulkan API and a bunch of OpenGL extensions make it 
> mandatory for the buffer to be cache coherent. The kernel is simply not 
> informed about domain transfers.
> 
> For example you can just do a CPU copy to a ring buffer and the 
> expectation is that an already running shader sees that.

Yes, that one is not really an issue as you know that at buffer
creation time and can make sure to map those buffers uncached on non
coherent arches. If there are no explicit domain transfer points non
coherent must bite the bullet and bypass the CPU caches, running
performance into the ground.

> 
> > In the DMA API keeping things mapped is also a valid use-case, but then
> > you need to do explicit domain transfers via the dma_sync_* family,
> > which DMA-buf has not inherited. Again those sync are no-ops on cache
> > coherent architectures, but do any necessary cache maintenance on non
> > coherent arches.
> 
> Correct, yes. Coherency is mandatory for DMA-buf, you can't use 
> dma_sync_* on it when you are the importer.
> 
> The exporter could of course make use of that because he is the owner of 
> the buffer.

In the example given here with UVC video, you don't know that the
buffer will be exported and needs to be coherent without
synchronization points, due to the mapping cache at the DRM side. So
V4L2 naturally allocates the buffers from CPU cached memory. If the
expectation is that those buffers are device coherent without relying
on the map/unmap_attachment calls, then V4L2 needs to always
synchronize caches on DQBUF when the  buffer is allocated from CPU
cached memory and a single DMA-buf attachment exists. And while writing
this I realize that this is probably exactly what V4L2 should do...

Regards,
Lucas

