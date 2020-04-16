Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1FA1ABDCA
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 12:25:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 481ED6EB36;
	Thu, 16 Apr 2020 10:25:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31FEF6EB36
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 10:25:12 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 457552192A;
 Thu, 16 Apr 2020 10:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587032711;
 bh=lKwbnEdUTTba3AJVKzmuvKJ2X9FO6D210s3WkJT/zZQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W2uMPyIU+mZIh4oNdYX1OAnVqWzjphWKBN2GBWPvfUx+i38L7tiemQkppi+gxHlZW
 JlF2YNYah1X+HwUMB3yZOQ35X0ro+n9Y78fNlVj/EfyxfoZZsOyB5MYhQSYl8R4ERW
 H/AbdIG7irc1sh8ffKpw66MvAQ+0sft+pvgi+fyg=
Date: Thu, 16 Apr 2020 12:25:08 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH] staging: android: ion: Skip sync if not mapped
Message-ID: <20200416102508.GA820251@kroah.com>
References: <20200414134629.54567-1-orjan.eide@arm.com>
 <20200414141849.55654-1-orjan.eide@arm.com>
 <20200414142810.GA958163@kroah.com>
 <CALAqxLX-SUhHPH6ewt-s9cEMc8DtMTgXem=JruAkLofuJf1syg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALAqxLX-SUhHPH6ewt-s9cEMc8DtMTgXem=JruAkLofuJf1syg@mail.gmail.com>
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
Cc: driverdevel <devel@driverdev.osuosl.org>, Laura Abbott <labbott@redhat.com>,
 Todd Kjos <tkjos@android.com>, Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
 Anders Pedersen <anders.pedersen@arm.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 "Darren Hart \(VMware\)" <dvhart@infradead.org>,
 =?iso-8859-1?Q?=D8rjan?= Eide <orjan.eide@arm.com>, nd <nd@arm.com>,
 Martijn Coenen <maco@android.com>, Christian Brauner <christian@brauner.io>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 14, 2020 at 09:41:31PM -0700, John Stultz wrote:
> On Tue, Apr 14, 2020 at 7:28 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Tue, Apr 14, 2020 at 04:18:47PM +0200, =D8rjan Eide wrote:
> > > Only sync the sg-list of an Ion dma-buf attachment when the attachment
> > > is actually mapped on the device.
> > >
> > > dma-bufs may be synced at any time. It can be reached from user space
> > > via DMA_BUF_IOCTL_SYNC, so there are no guarantees from callers on wh=
en
> > > syncs may be attempted, and dma_buf_end_cpu_access() and
> > > dma_buf_begin_cpu_access() may not be paired.
> > >
> > > Since the sg_list's dma_address isn't set up until the buffer is used
> > > on the device, and dma_map_sg() is called on it, the dma_address will=
 be
> > > NULL if sync is attempted on the dma-buf before it's mapped on a devi=
ce.
> > >
> > > Before v5.0 (commit 55897af63091 ("dma-direct: merge swiotlb_dma_ops
> > > into the dma_direct code")) this was a problem as the dma-api (at lea=
st
> > > the swiotlb_dma_ops on arm64) would use the potentially invalid
> > > dma_address. How that failed depended on how the device handled physi=
cal
> > > address 0. If 0 was a valid address to physical ram, that page would =
get
> > > flushed a lot, while the actual pages in the buffer would not get syn=
ced
> > > correctly. While if 0 is an invalid physical address it may cause a
> > > fault and trigger a crash.
> > >
> > > In v5.0 this was incidentally fixed by commit 55897af63091 ("dma-dire=
ct:
> > > merge swiotlb_dma_ops into the dma_direct code"), as this moved the
> > > dma-api to use the page pointer in the sg_list, and (for Ion buffers =
at
> > > least) this will always be valid if the sg_list exists at all.
> > >
> > > But, this issue is re-introduced in v5.3 with
> > > commit 449fa54d6815 ("dma-direct: correct the physical addr in
> > > dma_direct_sync_sg_for_cpu/device") moves the dma-api back to the old
> > > behaviour and picks the dma_address that may be invalid.
> > >
> > > dma-buf core doesn't ensure that the buffer is mapped on the device, =
and
> > > thus have a valid sg_list, before calling the exporter's
> > > begin_cpu_access.
> > >
> > > Signed-off-by: =D8rjan Eide <orjan.eide@arm.com>
> > > ---
> > >  drivers/staging/android/ion/ion.c | 12 ++++++++++++
> > >  1 file changed, 12 insertions(+)
> > >
> > > Resubmit without disclaimer, sorry about that.
> > >
> > > This seems to be part of a bigger issue where dma-buf exporters assume
> > > that their dma-buf begin_cpu_access and end_cpu_access callbacks have=
 a
> > > certain guaranteed behavior, which isn't ensured by dma-buf core.
> > >
> > > This patch fixes this in ion only, but it also needs to be fixed for
> > > other exporters, either handled like this in each exporter, or in
> > > dma-buf core before calling into the exporters.
> > >
> > > diff --git a/drivers/staging/android/ion/ion.c b/drivers/staging/andr=
oid/ion/ion.c
> > > index 38b51eace4f9..7b752ba0cb6d 100644
> > > --- a/drivers/staging/android/ion/ion.c
> > > +++ b/drivers/staging/android/ion/ion.c
> >
> > Now that we have the dma-buff stuff in the tree, do we even need the
> > ion code in the kernel anymore?  Can't we delete it now?
> >
> =

> I agree that we shouldn't be taking further (non-security/cleanup)
> patches to the ION code.
> =

> I'd like to give developers a little bit of a transition period (I was
> thinking a year, but really just one LTS release that has both would
> do) where they can move their ION heaps over to dmabuf heaps and test
> both against the same tree.
> =

> But I do think we can mark it as deprecated and let folks know that
> around the end of the year it will be deleted.

No one ever notices "depreciated" things, they only notice if the code
is no longer there :)

So I'm all for just deleting it and seeing who even notices...

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
