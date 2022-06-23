Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1A05574D3
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 10:05:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9535113C59;
	Thu, 23 Jun 2022 08:04:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 460F1113C3E
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 08:04:56 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1o4Hpc-00035t-7h; Thu, 23 Jun 2022 10:04:52 +0200
Message-ID: <4b69f9f542d6efde2190b73c87096e87fa24d8ef.camel@pengutronix.de>
Subject: Re: DMA-buf and uncached system memory
From: Lucas Stach <l.stach@pengutronix.de>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Pekka
 Paalanen <ppaalanen@gmail.com>
Date: Thu, 23 Jun 2022 10:04:49 +0200
In-Reply-To: <954d0a9b-29ef-52ef-f6ca-22d7e6aa3f4d@amd.com>
References: <91ff0bbb-ea3a-2663-3453-dea96ccd6dd8@amd.com>
 <YCuPhOT4GhY3RR/6@phenom.ffwll.local>
 <9178e19f5c0e141772b61b759abaa0d176f902b6.camel@ndufresne.ca>
 <CAPj87rPYQNkgVEdHECQcHcYe2nCpgF3RYQKk_=wwhvJSxwHXCg@mail.gmail.com>
 <c6e65ee1-531e-d72c-a6a6-da7149e34f18@amd.com>
 <20220623101326.18beeab3@eldfell>
 <954d0a9b-29ef-52ef-f6ca-22d7e6aa3f4d@amd.com>
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

Am Donnerstag, dem 23.06.2022 um 09:26 +0200 schrieb Christian König:
> Am 23.06.22 um 09:13 schrieb Pekka Paalanen:
> > On Thu, 23 Jun 2022 08:59:41 +0200
> > Christian König <christian.koenig@amd.com> wrote:
> > 
> > > The exporter isn't doing anything wrong here. DMA-buf are supposed to be
> > > CPU cached and can also be cache hot.
> > Hi,
> > 
> > what is that statement based on?
> 
> On the design documentation of DMA-buf and the actual driver 
> implementations.
> 
> Coherency and snooping of the CPU cache is mandatory for devices and 
> root complexes in the PCI specification. Incoherent access is just an 
> extension.
> 
> We inherited that by basing DMA-buf on the Linux kernel DMA-API which in 
> turn is largely based on the PCI specification.
> 
> > Were the (mandatory for CPU access) cpu_access_begin/end functions &
> > ioctls not supposed to ensure that CPU cache is up-to-date / CPU cache
> > is fully flushed out?
> 
> No, those functions are to inform the exporter that the importer has 
> started and finished accessing the buffer using the CPU.
> 
> There is no signaling in the other direction. In other words the 
> exporter doesn't inform the importer about CPU accesses because it is 
> the owner of the buffer.
> 
> It's the responsibility of the importer to make sure that it can 
> actually access the data in the buffer. If it can't guarantee that the 
> importer shouldn't import the buffer in the first place.

This is not really correct. DMA-buf inherited the the map/unmap part
from the DMA API, which on cache coherent architecture is mostly a no-
op or ties into the IOMMU implementation to set up the pagetables for
the translation. On non cache coherent architectures this is the point
where any any necessary cache maintenance happens. DRM breaks this
model by caching the DMA-buf mapping for performance reasons.

In the DMA API keeping things mapped is also a valid use-case, but then
you need to do explicit domain transfers via the dma_sync_* family,
which DMA-buf has not inherited. Again those sync are no-ops on cache
coherent architectures, but do any necessary cache maintenance on non
coherent arches.

Regards,
Lucas

