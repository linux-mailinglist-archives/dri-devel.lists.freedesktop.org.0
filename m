Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C3A21846C
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 11:54:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85AA16E16D;
	Wed,  8 Jul 2020 09:54:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60FE16E16D
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 09:54:09 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id 17so2267673wmo.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jul 2020 02:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=LbLNxsSbeWREl0yBoJLRXGqeH1E1h9FOLLT3QNVqTPc=;
 b=Zl4Yf/UjB/Lz61XGd2bLSxSa7860AQqR2jV3dcvjuzdAxXRUjq9EZ0R16EakVbJfYr
 y6GFtT0MP+1seqWTEzavpUiaMXDubVyE43n/5NhOSNdNa1/crU2f5g6bSYGIh1yTRUMu
 LaC1ow+W2bmLAOUUYqCw5DNOtwaRBbp7nnvKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=LbLNxsSbeWREl0yBoJLRXGqeH1E1h9FOLLT3QNVqTPc=;
 b=Wm4JBRKH7nfudaex/u1wCX0ly2pqElu7nEeZEr+EnMaxgq9HAOVm3rACj722nWZ5mT
 wyazdf9uSQQVMyBdPaYKBP8TuyQPhAiemfk4R7lXuzoZSeAFAL3WHbs4DzZmJnPwrrE0
 Nqzw3LwkSZq5vOlgjuTx2d75cSfoanykL2NPL66NSdgURtCmCuqvOZN8luJhFPDhEgbq
 AMQ6IezgCKeoWra1cQWBIlYD7IqUt4i6I7Lk5p73cO1FibrT8LjrwAFNeKfIAW05B2EJ
 YtZNk8pMW6FxHi1/6qGqhNVPE9S6Guryk/9g1Ctlr4CJ3izYxYoFVyokWK9jdSxBkV9t
 Vbog==
X-Gm-Message-State: AOAM533LDk2ueITWVFhtstk+cOjf6idszl/e7TEvyYlYAWpWiWH/buCV
 UJzC/MJMh2Ejjk6PNkBmL7WJgA==
X-Google-Smtp-Source: ABdhPJzBvpM9KlB7v2OXNMg/ZgFTVoiSkcMGhYd4QZ8lHvMxqL1hn0HqTG7iup/lXE5OtKZKiM/kyg==
X-Received: by 2002:a1c:1d46:: with SMTP id d67mr9140891wmd.152.1594202047984; 
 Wed, 08 Jul 2020 02:54:07 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g13sm5174280wro.84.2020.07.08.02.54.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jul 2020 02:54:07 -0700 (PDT)
Date: Wed, 8 Jul 2020 11:54:05 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 1/2] drm/vgem: Do not allocate backing shmemfs file for
 an import dmabuf object
Message-ID: <20200708095405.GJ3278063@phenom.ffwll.local>
References: <20200707160012.1299338-1-chris@chris-wilson.co.uk>
 <CALqoU4y61Yc5ndaLSO3WoGSPxGm1nJJufk3U=uxhZe3sT1Xyzg@mail.gmail.com>
 <159414243217.17526.6453360763938648186@build.alporthouse.com>
 <CALqoU4ypBqcAo+xH2usVRffKzR6AkgGdJBmQ0vWe9MZ1kTHCqw@mail.gmail.com>
 <159414692385.17526.10068675168880429917@build.alporthouse.com>
 <b8e6d844-f096-8efc-1252-ef430069d080@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b8e6d844-f096-8efc-1252-ef430069d080@amd.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 lepton <ytht.net@gmail.com>, "# v4.10+" <stable@vger.kernel.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas_os@shipmail.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 08, 2020 at 11:22:00AM +0200, Christian K=F6nig wrote:
> Am 07.07.20 um 20:35 schrieb Chris Wilson:
> > Quoting lepton (2020-07-07 19:17:51)
> > > On Tue, Jul 7, 2020 at 10:20 AM Chris Wilson <chris@chris-wilson.co.u=
k> wrote:
> > > > Quoting lepton (2020-07-07 18:05:21)
> > > > > On Tue, Jul 7, 2020 at 9:00 AM Chris Wilson <chris@chris-wilson.c=
o.uk> wrote:
> > > > > > If we assign obj->filp, we believe that the create vgem bo is n=
ative and
> > > > > > allow direct operations like mmap() assuming it behaves as back=
ed by a
> > > > > > shmemfs inode. When imported from a dmabuf, the obj->pages are
> > > > > > not always meaningful and the shmemfs backing store misleading.
> > > > > > =

> > > > > > Note, that regular mmap access to a vgem bo is via the dumb buf=
fer API,
> > > > > > and that rejects attempts to mmap an imported dmabuf,
> > > > > What do you mean by "regular mmap access" here?  It looks like vg=
em is
> > > > > using vgem_gem_dumb_map as .dumb_map_offset callback then it does=
n't call
> > > > > drm_gem_dumb_map_offset
> > > > As I too found out, and so had to correct my story telling.
> > > > =

> > > > By regular mmap() access I mean mmap on the vgem bo [via the dumb b=
uffer
> > > > API] as opposed to mmap() via an exported dma-buf fd. I had to look=
 at
> > > > igt to see how it was being used.
> > > Now it seems your fix is to disable "regular mmap" on imported dma buf
> > > for vgem. I am not really a graphic guy, but then the api looks like:
> > > for a gem handle, user space has to guess to find out the way to mmap
> > > it. If user space guess wrong, then it will fail to mmap. Is this the
> > > expected way
> > > for people to handle gpu buffer?
> > You either have a dumb buffer handle, or a dma-buf fd. If you have the
> > handle, you have to use the dumb buffer API, there's no other way to
> > mmap it. If you have the dma-buf fd, you should mmap it directly. Those
> > two are clear.
> > =

> > It's when you import the dma-buf into vgem and create a handle out of
> > it, that's when the handle is no longer first class and certain uAPI
> > [the dumb buffer API in particular] fail.
> > =

> > It's not brilliant, as you say, it requires the user to remember the
> > difference between the handles, but at the same time it does prevent
> > them falling into coherency traps by forcing them to use the right
> > driver to handle the object, and have to consider the additional ioctls
> > that go along with that access.
> =

> Yes, Chris is right. Mapping DMA-buf through the mmap() APIs of an import=
er
> is illegal.
> =

> What we could maybe try to do is to redirect this mmap() API call on the
> importer to the exporter, but I'm pretty sure that the fs layer wouldn't
> like that without changes.

We already do that, there's a full helper-ified path from I think shmem
helpers through prime helpers to forward this all. Including handling
buffer offsets and all the other lolz back&forth.

Of course there's still the problem that many drivers don't forward the
cache coherency calls for begin/end cpu access, so in a bunch of cases
you'll cache cacheline dirt soup. But that's kinda standard procedure for
dma-buf :-P

But yeah trying to handle the mmap as an importer, bypassing the export:
nope. The one exception is if you have some kind of fancy gart with
cpu-visible pci bar (like at least integrated intel gpus have). But in
that case the mmap very much looks&acts like device access in every way.

Cheers, Daniel

> Regards,
> Christian.
> =

> =

> > -Chris
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
