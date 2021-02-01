Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC0930B9A6
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 09:27:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F12F6E8F1;
	Tue,  2 Feb 2021 08:27:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4378A6E2D1
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Feb 2021 15:29:24 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id a7so16522400qkb.13
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Feb 2021 07:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=B0GXOS7+mzX0TE2Qp//hk/lkiASVs1Lp79Aq1a9Ju4Q=;
 b=mwF+XQ/bR5R0UQ9p0VaLGKM4TPdAZunLBWP0ELnamkGJSw/WlbsR1nYHB6TfIEBhYi
 ZSvN6GabuLRKT56OF32/wI/6FoSUHDcCgqxVUc7Wlydca+0K9v/FDXjN2T6i/Ffl1zO8
 LzC8fV8EJou3u3t9ik5C4/+xtCj315QjRncjt2qIIYAU5IWE4lAoskVp4QqbqwEanbiM
 geB0Rnxcb5505U6rtrun/MmO9+cSSqeoEPDYZAoAElwkSYLKUODFCKrBXwYLx/O/7Xwa
 RCAA2gpGL+7nu0pbiXRYXp2wspIXjXiNXa8ll8EDco4AdtMe+trpQsKfj4eo4rJqdFvz
 /Kpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=B0GXOS7+mzX0TE2Qp//hk/lkiASVs1Lp79Aq1a9Ju4Q=;
 b=A8OBN8FTSeEXDjWhcLoTWIj2qGZQD45P7Wg56WOn9fnF7Ilg62VqPXbqqOWMtVQDIj
 DeSZAGQJ7N6u3m162kiocpBJ+EHqGY3yrV1pitqXNOIyy+A9l4YiyIAhtc8SMn5IYDZA
 nI6MQyn5VLIMocize9IipE6s+4hfjkBtyg+aCgJd6epoeF0YJPb556P+3b3HbbTH8tgQ
 CMOFw+RfDW1hwIfHp/cln50qAhgSjhdKVAOrSnrFrt4MlyTDM/syyaMgz+vpspX84pOm
 FuhD+lfifevXHw44ug1TmDTSryUOWkrRH4ujciVBtzxHOki5Cj3AfvEQAAdWQ0joFQDC
 blcg==
X-Gm-Message-State: AOAM533ukS/n+aBzBThjMFoj01xcZg6dv1gDv025CHhG4eoA/4NAn+HS
 jw3xBgnMAVqkLh8el4zd75g7WQ==
X-Google-Smtp-Source: ABdhPJyFiHY5UuFhaM6bf0XGVV7w/DUR8CFB09e/cP4Pk3MvJpFZLWaEf1gyRO830JqfHK/1qE9TOw==
X-Received: by 2002:a37:c0c:: with SMTP id 12mr17069709qkm.314.1612193363350; 
 Mon, 01 Feb 2021 07:29:23 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-115-133.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.115.133])
 by smtp.gmail.com with ESMTPSA id p22sm14302462qkk.128.2021.02.01.07.29.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 07:29:22 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1l6b8k-002Ea0-14; Mon, 01 Feb 2021 11:29:22 -0400
Date: Mon, 1 Feb 2021 11:29:22 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH rdma-core v7 4/6] pyverbs: Add dma-buf based MR support
Message-ID: <20210201152922.GC4718@ziepe.ca>
References: <1611604622-86968-1-git-send-email-jianxin.xiong@intel.com>
 <1611604622-86968-5-git-send-email-jianxin.xiong@intel.com>
 <137f406b-d3e0-fdeb-18e7-194a2aed927c@amazon.com>
 <20210201061603.GC4593@unreal>
 <CAKMK7uE0kSC1si0E9D1Spkn9aW2jFJw_SH3hYC6sZL7mG6pzyg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uE0kSC1si0E9D1Spkn9aW2jFJw_SH3hYC6sZL7mG6pzyg@mail.gmail.com>
X-Mailman-Approved-At: Tue, 02 Feb 2021 08:27:00 +0000
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
Cc: Yishai Hadas <yishaih@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>, Edward Srouji <edwards@nvidia.com>,
 Gal Pressman <galpress@amazon.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Doug Ledford <dledford@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Jianxin Xiong <jianxin.xiong@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 01, 2021 at 03:10:00PM +0100, Daniel Vetter wrote:
> On Mon, Feb 1, 2021 at 7:16 AM Leon Romanovsky <leon@kernel.org> wrote:
> >
> > On Sun, Jan 31, 2021 at 05:31:16PM +0200, Gal Pressman wrote:
> > > On 25/01/2021 21:57, Jianxin Xiong wrote:
> > > > Define a new sub-class of 'MR' that uses dma-buf object for the memory
> > > > region. Define a new class 'DmaBuf' as a wrapper for dma-buf allocation
> > > > mechanism implemented in C.
> > > >
> > > > Update the cmake function for cython modules to allow building modules
> > > > with mixed cython and c source files.
> > > >
> > > > Signed-off-by: Jianxin Xiong <jianxin.xiong@intel.com>
> > > >  buildlib/pyverbs_functions.cmake |  78 +++++++----
> > > >  pyverbs/CMakeLists.txt           |  11 +-
> > > >  pyverbs/dmabuf.pxd               |  15 +++
> > > >  pyverbs/dmabuf.pyx               |  73 ++++++++++
> > > >  pyverbs/dmabuf_alloc.c           | 278 +++++++++++++++++++++++++++++++++++++++
> > > >  pyverbs/dmabuf_alloc.h           |  19 +++
> > > >  pyverbs/libibverbs.pxd           |   2 +
> > > >  pyverbs/mr.pxd                   |   6 +
> > > >  pyverbs/mr.pyx                   | 105 ++++++++++++++-
> > > >  9 files changed, 557 insertions(+), 30 deletions(-)
> > > >  create mode 100644 pyverbs/dmabuf.pxd
> > > >  create mode 100644 pyverbs/dmabuf.pyx
> > > >  create mode 100644 pyverbs/dmabuf_alloc.c
> > > >  create mode 100644 pyverbs/dmabuf_alloc.h
> >
> > <...>
> >
> > > > index 0000000..05eae75
> > > > +++ b/pyverbs/dmabuf_alloc.c
> > > > @@ -0,0 +1,278 @@
> > > > +// SPDX-License-Identifier: GPL-2.0 OR Linux-OpenIB
> > > > +/*
> > > > + * Copyright 2020 Intel Corporation. All rights reserved. See COPYING file
> > > > + */
> > > > +
> > > > +#include <stdio.h>
> > > > +#include <stdlib.h>
> > > > +#include <stdint.h>
> > > > +#include <unistd.h>
> > > > +#include <string.h>
> > > > +#include <errno.h>
> > > > +#include <drm/drm.h>
> > > > +#include <drm/i915_drm.h>
> > > > +#include <drm/amdgpu_drm.h>
> > > > +#include <drm/radeon_drm.h>
> > >
> > > I assume these should come from the kernel headers package, right?
> >
> > This is gross, all kernel headers should be placed in kernel-headers/*
> > and "update" script needs to be extended to take drm/* files too :(.
> 
> drm kernel headers are in the libdrm package. You need that anyway for
> doing the ioctls (if you don't hand-roll the restarting yourself).
> 
> Also our userspace has gone over to just outright copying the driver
> headers. Not the generic headers, but for the rendering side of gpus,
> which is the topic here, there's really not much generic stuff.
> 
> > Jianxin, are you fixing it?
> 
> So fix is either to depend upon libdrm for building, or have copies of
> the headers included in the package for the i915/amdgpu/radeon headers
> (drm/drm.h probably not so good idea).

We should have a cmake test to not build the drm parts if it can't be
built, and pyverbs should skip the tests.

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
