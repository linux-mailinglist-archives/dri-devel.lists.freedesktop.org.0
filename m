Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F32D6610BEC
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 10:10:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB94610E79D;
	Fri, 28 Oct 2022 08:10:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 436A910E79D
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 08:09:59 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1ooKRA-0007ju-0q; Fri, 28 Oct 2022 10:09:56 +0200
Message-ID: <3d7353f3fa5905ce18e5b2d92f758f098189bc5a.camel@pengutronix.de>
Subject: Re: Try to address the DMA-buf coherency problem
From: Lucas Stach <l.stach@pengutronix.de>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 nicolas@ndufresne.ca, ppaalanen@gmail.com, sumit.semwal@linaro.org, 
 daniel@ffwll.ch, robdclark@gmail.com, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
Date: Fri, 28 Oct 2022 10:09:54 +0200
In-Reply-To: <20221020121316.3946-1-christian.koenig@amd.com>
References: <20221020121316.3946-1-christian.koenig@amd.com>
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

Hi Christian,

Am Donnerstag, dem 20.10.2022 um 14:13 +0200 schrieb Christian König:
> Hi guys,
> 
> after finding that we essentially have two separate worlds for coherent sharing
> of buffer through DMA-buf I thought I will tackle that problem a bit and at
> least allow the framework to reject attachments which won't work.
> 
> So those patches here add a new dma_coherent flag to each DMA-buf object
> telling the framework that dev_is_dma_coherent() needs to return true for an
> importing device to be able to attach. Since we should always have a fallback
> path this should give userspace the chance to still keep the use case working,
> either by doing a CPU copy instead or reversing the roles of exporter and
> importer.
> 
The fallback would likely be a CPU copy with the appropriate cache
flushes done by the device driver, which would be a massiv performance
issue.

> For DRM and most V4L2 devices I then fill in the dma_coherent flag based on the
> return value of dev_is_dma_coherent(). Exporting drivers are allowed to clear
> the flag for their buffers if special handling like the USWC flag in amdgpu or
> the uncached allocations for radeon/nouveau are in use.
> 
I don't think the V4L2 part works for most ARM systems. The default
there is for devices to be noncoherent unless explicitly marked
otherwise. I don't think any of the "devices" writing the video buffers
in cached memory with the CPU do this. While we could probably mark
them as coherent, I don't think this is moving in the right direction.

> Additional to that importers can also check the flag if they have some
> non-snooping operations like the special scanout case for amdgpu for example.
> 
> The patches are only smoke tested and the solution isn't ideal, but as far as
> I can see should at least keep things working.
> 
I would like to see this solved properly. Where I think properly means
we make things work on systems with mixed coherent/noncoherent masters
in the same way the DMA API does on such systems: by inserting the
proper cache maintenance operations.

I also think that we should keep in mind that the world is moving into
a direction where DMA masters may not only snoop the CPU caches (what
is the definition of cache coherent on x86), but actually take part in
the system coherence and are able to have writeback caches for shared
data on their own. I can only speculate, as I haven't seen the amdgpu
side yet, but I think this proposal is moving in the other direction by
assuming a central system cache, where the importer has some magic way
to clean this central cache.

Since I have a vested interest in seeing V4L2 UVC and non-coherent GPU
dma-buf sharing work on ARM systems and seem to hold some strong
opinions on how this should work, I guess I need to make some time
available to type it up, so we can discuss over coder rather than
abstract ideas. If I come up with something that works for my use-cases
would you be up for taking a shot at a amdgpu implementation?

Regards,
Lucas

