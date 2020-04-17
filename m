Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E391F1AE050
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 17:00:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 127506EC2A;
	Fri, 17 Apr 2020 15:00:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49A9B6E83A
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 15:00:18 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id t14so3357666wrw.12
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 08:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=+pLzXV2uoWONcvIXLG60QmJnpF6qpxalQJEJVAlU5ZU=;
 b=SJlFo73fheabH5hiH/RJ37KRFeF6vcj+J3TT+NQ5Qiwt4UY2A/7hQayUJEKsxeJqiz
 W6eqjB1ojrsvckINI7UM64sPHV2ixzU9iDWbpnLaZ5Xi/8osCdcnlRDz4ZKgGfjR6ct/
 24JhjZMz3V23pEJ7WWIDMpIpFcUhNftInHJYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=+pLzXV2uoWONcvIXLG60QmJnpF6qpxalQJEJVAlU5ZU=;
 b=e6hhBML6jFEP+KDuRx7g5W/c2dki+4akMoJpVczvFMlZY9lQScgFwYQ88RMgMkfNfC
 3gp5vvJF66WU+dzbonxFdS/tzXqL3pKnqLlnGcbsLI9Bs3jVZ0V9zA+VVsxx6hxpR4ej
 oL1aRJyShFMXA0s/UnY0UJWNHOCjiqNRxWiBEFtuzNOIVOyRZDNmKiWdZSLP4UVwfSm0
 BACpG5MOcyyst3U7/K6bDAUnGpMoMEG/svkiHS6OcyuB3BOFLz6sszzb53UY54A3fFIl
 lxAv/pDQwC0gm15ZN0374ssYSkvqE5Hf0tRHy5khRZ7Lx+AsiJZjkFO27VzOyjYmhf4Y
 hy3g==
X-Gm-Message-State: AGi0Puar+p4Bcwl+22kqsKN/tts/FKtkXjA4c7QkumrRU9XauXz3fOvj
 NoGPr6DRQaepmBB5QbZukDUGTg==
X-Google-Smtp-Source: APiQypI+XqYbgKYVQ6aVc9PEFMJyQDjicsm1whYiSRv3ZukR4N/x6YDtB22FRHpXAK0g1o+ga1mJiw==
X-Received: by 2002:adf:f8cd:: with SMTP id f13mr4216226wrq.119.1587135616818; 
 Fri, 17 Apr 2020 08:00:16 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g186sm8077661wme.7.2020.04.17.08.00.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 08:00:16 -0700 (PDT)
Date: Fri, 17 Apr 2020 17:00:13 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] staging: android: ion: Skip sync if not mapped
Message-ID: <20200417150013.GN3456981@phenom.ffwll.local>
Mail-Followup-To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 John Stultz <john.stultz@linaro.org>,
 driverdevel <devel@driverdev.osuosl.org>, nd <nd@arm.com>,
 Todd Kjos <tkjos@android.com>,
 Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Arnd Bergmann <arnd@arndb.de>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
 Anders Pedersen <anders.pedersen@arm.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 "Darren Hart (VMware)" <dvhart@infradead.org>,
 =?iso-8859-1?Q?=D8rjan?= Eide <orjan.eide@arm.com>,
 Laura Abbott <labbott@redhat.com>,
 Martijn Coenen <maco@android.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian Brauner <christian@brauner.io>,
 linux-media@vger.kernel.org
References: <20200414134629.54567-1-orjan.eide@arm.com>
 <20200414141849.55654-1-orjan.eide@arm.com>
 <20200414142810.GA958163@kroah.com>
 <CALAqxLX-SUhHPH6ewt-s9cEMc8DtMTgXem=JruAkLofuJf1syg@mail.gmail.com>
 <20200416102508.GA820251@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200416102508.GA820251@kroah.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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

On Thu, Apr 16, 2020 at 12:25:08PM +0200, Greg Kroah-Hartman wrote:
> On Tue, Apr 14, 2020 at 09:41:31PM -0700, John Stultz wrote:
> > On Tue, Apr 14, 2020 at 7:28 AM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Tue, Apr 14, 2020 at 04:18:47PM +0200, =D8rjan Eide wrote:
> > > > Only sync the sg-list of an Ion dma-buf attachment when the attachm=
ent
> > > > is actually mapped on the device.
> > > >
> > > > dma-bufs may be synced at any time. It can be reached from user spa=
ce
> > > > via DMA_BUF_IOCTL_SYNC, so there are no guarantees from callers on =
when
> > > > syncs may be attempted, and dma_buf_end_cpu_access() and
> > > > dma_buf_begin_cpu_access() may not be paired.
> > > >
> > > > Since the sg_list's dma_address isn't set up until the buffer is us=
ed
> > > > on the device, and dma_map_sg() is called on it, the dma_address wi=
ll be
> > > > NULL if sync is attempted on the dma-buf before it's mapped on a de=
vice.
> > > >
> > > > Before v5.0 (commit 55897af63091 ("dma-direct: merge swiotlb_dma_ops
> > > > into the dma_direct code")) this was a problem as the dma-api (at l=
east
> > > > the swiotlb_dma_ops on arm64) would use the potentially invalid
> > > > dma_address. How that failed depended on how the device handled phy=
sical
> > > > address 0. If 0 was a valid address to physical ram, that page woul=
d get
> > > > flushed a lot, while the actual pages in the buffer would not get s=
ynced
> > > > correctly. While if 0 is an invalid physical address it may cause a
> > > > fault and trigger a crash.
> > > >
> > > > In v5.0 this was incidentally fixed by commit 55897af63091 ("dma-di=
rect:
> > > > merge swiotlb_dma_ops into the dma_direct code"), as this moved the
> > > > dma-api to use the page pointer in the sg_list, and (for Ion buffer=
s at
> > > > least) this will always be valid if the sg_list exists at all.
> > > >
> > > > But, this issue is re-introduced in v5.3 with
> > > > commit 449fa54d6815 ("dma-direct: correct the physical addr in
> > > > dma_direct_sync_sg_for_cpu/device") moves the dma-api back to the o=
ld
> > > > behaviour and picks the dma_address that may be invalid.
> > > >
> > > > dma-buf core doesn't ensure that the buffer is mapped on the device=
, and
> > > > thus have a valid sg_list, before calling the exporter's
> > > > begin_cpu_access.
> > > >
> > > > Signed-off-by: =D8rjan Eide <orjan.eide@arm.com>
> > > > ---
> > > >  drivers/staging/android/ion/ion.c | 12 ++++++++++++
> > > >  1 file changed, 12 insertions(+)
> > > >
> > > > Resubmit without disclaimer, sorry about that.
> > > >
> > > > This seems to be part of a bigger issue where dma-buf exporters ass=
ume
> > > > that their dma-buf begin_cpu_access and end_cpu_access callbacks ha=
ve a
> > > > certain guaranteed behavior, which isn't ensured by dma-buf core.
> > > >
> > > > This patch fixes this in ion only, but it also needs to be fixed for
> > > > other exporters, either handled like this in each exporter, or in
> > > > dma-buf core before calling into the exporters.
> > > >
> > > > diff --git a/drivers/staging/android/ion/ion.c b/drivers/staging/an=
droid/ion/ion.c
> > > > index 38b51eace4f9..7b752ba0cb6d 100644
> > > > --- a/drivers/staging/android/ion/ion.c
> > > > +++ b/drivers/staging/android/ion/ion.c
> > >
> > > Now that we have the dma-buff stuff in the tree, do we even need the
> > > ion code in the kernel anymore?  Can't we delete it now?
> > >
> > =

> > I agree that we shouldn't be taking further (non-security/cleanup)
> > patches to the ION code.
> > =

> > I'd like to give developers a little bit of a transition period (I was
> > thinking a year, but really just one LTS release that has both would
> > do) where they can move their ION heaps over to dmabuf heaps and test
> > both against the same tree.
> > =

> > But I do think we can mark it as deprecated and let folks know that
> > around the end of the year it will be deleted.
> =

> No one ever notices "depreciated" things, they only notice if the code
> is no longer there :)
> =

> So I'm all for just deleting it and seeing who even notices...

+1 on just deleting ion and watching if anyone notices. In case you're
typing that patch, here's my:

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

-Daniel
-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
