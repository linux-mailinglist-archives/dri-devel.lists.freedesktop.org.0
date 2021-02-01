Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D36230A95E
	for <lists+dri-devel@lfdr.de>; Mon,  1 Feb 2021 15:10:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 584DF6E44E;
	Mon,  1 Feb 2021 14:10:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED3AB6E44E
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Feb 2021 14:10:11 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id w8so18890357oie.2
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Feb 2021 06:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1A4LjcU8Wm+KQIpG8ygJhxw/9q2mcR8XhADNs60aGpo=;
 b=QvGkIY3kIIxXCvF9WmThHTl0vA4ltpyiiAiepo9Xn60XY5Vl6X6tDfuNE7zJCcS63l
 988cciblOdIk7ryCsgAUm1zcqrNHZpg8RxJ86eUcDNvetVa0olwSustcmUVAmz3eFvnP
 kqnsGKehu5ssps79I/OsebC/5OFrQqf2dOY9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1A4LjcU8Wm+KQIpG8ygJhxw/9q2mcR8XhADNs60aGpo=;
 b=pDRWnZB5s20D5FUZDzcRmg/NKRWnuppoWbwrn2Oe8YzvCdUWspt9UiYf0B4SyOF0ml
 qHNL9ksU8U8cvnISOcC9GZnESdkAOEjxSWnZr7mkc5/AIF+xvRRuKYlhRPiLotrIstTL
 ZtXrgcEAcFyuUix5Bv3+vtlQI6kfQhToYiXfvAhZzbxhr/eKok5Q+f1L9Wq1X9F8eUoF
 pXUE5wJlxqz5gfghYV9MrPF3EybgIb5rASIC9C0ZBkdsetm4mnEQpXnQxze9I3Hb1diT
 fUzlAaVGD98+g04BgKajCeU92Rdpp4gacG4fBrR2+bpX8Op/CMew2U2L4IW/l2lnArMS
 Rgjg==
X-Gm-Message-State: AOAM533ivW2qJCxOWjdT0UX6qeYatWFR89XVGLtiSLozRgJQtCYxBEar
 2p/zAmG7ZYdpiLOn7WvDSodKNTgAuT7aPZjXMcGQNA==
X-Google-Smtp-Source: ABdhPJy/qir5LfOIB2Xue0CzN0thmGS+0Shc+xOPK5I2WrjqVGrKqoJfrHL6hCCN+ND0CnPDsiljXc95OBHTH1oAX3A=
X-Received: by 2002:aca:ad92:: with SMTP id
 w140mr10932572oie.128.1612188611205; 
 Mon, 01 Feb 2021 06:10:11 -0800 (PST)
MIME-Version: 1.0
References: <1611604622-86968-1-git-send-email-jianxin.xiong@intel.com>
 <1611604622-86968-5-git-send-email-jianxin.xiong@intel.com>
 <137f406b-d3e0-fdeb-18e7-194a2aed927c@amazon.com>
 <20210201061603.GC4593@unreal>
In-Reply-To: <20210201061603.GC4593@unreal>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 1 Feb 2021 15:10:00 +0100
Message-ID: <CAKMK7uE0kSC1si0E9D1Spkn9aW2jFJw_SH3hYC6sZL7mG6pzyg@mail.gmail.com>
Subject: Re: [PATCH rdma-core v7 4/6] pyverbs: Add dma-buf based MR support
To: Leon Romanovsky <leon@kernel.org>
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
Cc: Yishai Hadas <yishaih@nvidia.com>, linux-rdma <linux-rdma@vger.kernel.org>,
 Edward Srouji <edwards@nvidia.com>, Gal Pressman <galpress@amazon.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Doug Ledford <dledford@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Jianxin Xiong <jianxin.xiong@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 1, 2021 at 7:16 AM Leon Romanovsky <leon@kernel.org> wrote:
>
> On Sun, Jan 31, 2021 at 05:31:16PM +0200, Gal Pressman wrote:
> > On 25/01/2021 21:57, Jianxin Xiong wrote:
> > > Define a new sub-class of 'MR' that uses dma-buf object for the memory
> > > region. Define a new class 'DmaBuf' as a wrapper for dma-buf allocation
> > > mechanism implemented in C.
> > >
> > > Update the cmake function for cython modules to allow building modules
> > > with mixed cython and c source files.
> > >
> > > Signed-off-by: Jianxin Xiong <jianxin.xiong@intel.com>
> > > ---
> > >  buildlib/pyverbs_functions.cmake |  78 +++++++----
> > >  pyverbs/CMakeLists.txt           |  11 +-
> > >  pyverbs/dmabuf.pxd               |  15 +++
> > >  pyverbs/dmabuf.pyx               |  73 ++++++++++
> > >  pyverbs/dmabuf_alloc.c           | 278 +++++++++++++++++++++++++++++++++++++++
> > >  pyverbs/dmabuf_alloc.h           |  19 +++
> > >  pyverbs/libibverbs.pxd           |   2 +
> > >  pyverbs/mr.pxd                   |   6 +
> > >  pyverbs/mr.pyx                   | 105 ++++++++++++++-
> > >  9 files changed, 557 insertions(+), 30 deletions(-)
> > >  create mode 100644 pyverbs/dmabuf.pxd
> > >  create mode 100644 pyverbs/dmabuf.pyx
> > >  create mode 100644 pyverbs/dmabuf_alloc.c
> > >  create mode 100644 pyverbs/dmabuf_alloc.h
>
> <...>
>
> > > index 0000000..05eae75
> > > --- /dev/null
> > > +++ b/pyverbs/dmabuf_alloc.c
> > > @@ -0,0 +1,278 @@
> > > +// SPDX-License-Identifier: GPL-2.0 OR Linux-OpenIB
> > > +/*
> > > + * Copyright 2020 Intel Corporation. All rights reserved. See COPYING file
> > > + */
> > > +
> > > +#include <stdio.h>
> > > +#include <stdlib.h>
> > > +#include <stdint.h>
> > > +#include <unistd.h>
> > > +#include <string.h>
> > > +#include <errno.h>
> > > +#include <drm/drm.h>
> > > +#include <drm/i915_drm.h>
> > > +#include <drm/amdgpu_drm.h>
> > > +#include <drm/radeon_drm.h>
> >
> > I assume these should come from the kernel headers package, right?
>
> This is gross, all kernel headers should be placed in kernel-headers/*
> and "update" script needs to be extended to take drm/* files too :(.

drm kernel headers are in the libdrm package. You need that anyway for
doing the ioctls (if you don't hand-roll the restarting yourself).

Also our userspace has gone over to just outright copying the driver
headers. Not the generic headers, but for the rendering side of gpus,
which is the topic here, there's really not much generic stuff.

> Jianxin, are you fixing it?

So fix is either to depend upon libdrm for building, or have copies of
the headers included in the package for the i915/amdgpu/radeon headers
(drm/drm.h probably not so good idea).

Cheers, Daniel
>
> Thanks
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
