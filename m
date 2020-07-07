Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 493E32176D9
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 20:35:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DEDC89E69;
	Tue,  7 Jul 2020 18:35:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7E0889E69;
 Tue,  7 Jul 2020 18:35:40 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 21744729-1500050 for multiple; Tue, 07 Jul 2020 19:35:25 +0100
MIME-Version: 1.0
In-Reply-To: <CALqoU4ypBqcAo+xH2usVRffKzR6AkgGdJBmQ0vWe9MZ1kTHCqw@mail.gmail.com>
References: <20200707160012.1299338-1-chris@chris-wilson.co.uk>
 <CALqoU4y61Yc5ndaLSO3WoGSPxGm1nJJufk3U=uxhZe3sT1Xyzg@mail.gmail.com>
 <159414243217.17526.6453360763938648186@build.alporthouse.com>
 <CALqoU4ypBqcAo+xH2usVRffKzR6AkgGdJBmQ0vWe9MZ1kTHCqw@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/vgem: Do not allocate backing shmemfs file for an
 import dmabuf object
From: Chris Wilson <chris@chris-wilson.co.uk>
To: lepton <ytht.net@gmail.com>
Date: Tue, 07 Jul 2020 19:35:23 +0100
Message-ID: <159414692385.17526.10068675168880429917@build.alporthouse.com>
User-Agent: alot/0.9
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
Cc: Thomas Hellström <thomas_os@shipmail.org>, "# v4 . 10+" <stable@vger.kernel.org>, Christian König <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting lepton (2020-07-07 19:17:51)
> On Tue, Jul 7, 2020 at 10:20 AM Chris Wilson <chris@chris-wilson.co.uk> wrote:
> >
> > Quoting lepton (2020-07-07 18:05:21)
> > > On Tue, Jul 7, 2020 at 9:00 AM Chris Wilson <chris@chris-wilson.co.uk> wrote:
> > > >
> > > > If we assign obj->filp, we believe that the create vgem bo is native and
> > > > allow direct operations like mmap() assuming it behaves as backed by a
> > > > shmemfs inode. When imported from a dmabuf, the obj->pages are
> > > > not always meaningful and the shmemfs backing store misleading.
> > > >
> > > > Note, that regular mmap access to a vgem bo is via the dumb buffer API,
> > > > and that rejects attempts to mmap an imported dmabuf,
> > > What do you mean by "regular mmap access" here?  It looks like vgem is
> > > using vgem_gem_dumb_map as .dumb_map_offset callback then it doesn't call
> > > drm_gem_dumb_map_offset
> >
> > As I too found out, and so had to correct my story telling.
> >
> > By regular mmap() access I mean mmap on the vgem bo [via the dumb buffer
> > API] as opposed to mmap() via an exported dma-buf fd. I had to look at
> > igt to see how it was being used.
> Now it seems your fix is to disable "regular mmap" on imported dma buf
> for vgem. I am not really a graphic guy, but then the api looks like:
> for a gem handle, user space has to guess to find out the way to mmap
> it. If user space guess wrong, then it will fail to mmap. Is this the
> expected way
> for people to handle gpu buffer?

You either have a dumb buffer handle, or a dma-buf fd. If you have the
handle, you have to use the dumb buffer API, there's no other way to
mmap it. If you have the dma-buf fd, you should mmap it directly. Those
two are clear.

It's when you import the dma-buf into vgem and create a handle out of
it, that's when the handle is no longer first class and certain uAPI
[the dumb buffer API in particular] fail.

It's not brilliant, as you say, it requires the user to remember the
difference between the handles, but at the same time it does prevent
them falling into coherency traps by forcing them to use the right
driver to handle the object, and have to consider the additional ioctls
that go along with that access.
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
