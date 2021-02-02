Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 870FC30C38E
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 16:24:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF4646E8E1;
	Tue,  2 Feb 2021 15:24:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E6DC6E8E1
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 15:24:49 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id c4so18180126wru.9
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Feb 2021 07:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=TwF/FQN0ANtWNheBXZd1Sn+c5kPviTuWw/RIN59Nwfs=;
 b=lJBTkJdB/OLoTTId2yYfjrdTeDwxFPSQBNAzhziVAbfI9FPuFPC1178rWHaPemTlM6
 tv8VkCwzTP5pBJanRoRte5MpvBkzRaAMHblweJLVh3RzWLU7xuHKE7PlOwE7XNuD47ST
 i+8aJVUWGpYBWTXe9T26NSO4HErv60/gfdiR4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TwF/FQN0ANtWNheBXZd1Sn+c5kPviTuWw/RIN59Nwfs=;
 b=cH+NMmZNo9bINWAtOAzl7B0UWKgZO1i99R6E8RydMrJCruNe9F1rZPAqSbW0W1bvEN
 /he4nqNmGSiJI6u1Syd0795oGoR3GlIo8AO8tm6T7ggkw/dxt9tFNPQu7wMjTiaR60mn
 gC6MXXiprwq+FQinTv+2ffxxkRqeEN/ncqZMwkhEyirBfNF+eVhRhpQINC/ENZHxldHx
 P9ptwJ+c+Baz53uT6mdmbKBDS4Jba0xny9WabBR0lXPzawvbOwPUpoVK2ieuVjiGWetr
 XFE8BLvz1528XRcij6MBLoKtbqNMGOwASshTT5GTWwXSj8dFm4bVhrVOtU3SU+hY/r5h
 FY9Q==
X-Gm-Message-State: AOAM531OvUf089YTXc0MR8AbUy6UNq2SnJZC/Ala/+D39Bebe8FFUmHW
 svfXCHB/s5mNFDvlbqmTZbYfmQ==
X-Google-Smtp-Source: ABdhPJwBF5AMzAudV1juYLGxdLGduE9kr/xSnz8exq5VsaT6rVF/Uv2wR3lLDVdkrXcVwEAiCPeyNg==
X-Received: by 2002:adf:a2ca:: with SMTP id t10mr24029895wra.370.1612279487922; 
 Tue, 02 Feb 2021 07:24:47 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j17sm3535169wmc.28.2021.02.02.07.24.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 07:24:47 -0800 (PST)
Date: Tue, 2 Feb 2021 16:24:45 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: "Xiong, Jianxin" <jianxin.xiong@intel.com>
Subject: Re: [PATCH rdma-core v7 4/6] pyverbs: Add dma-buf based MR support
Message-ID: <YBluvZn1orYl7L9/@phenom.ffwll.local>
References: <1611604622-86968-1-git-send-email-jianxin.xiong@intel.com>
 <1611604622-86968-5-git-send-email-jianxin.xiong@intel.com>
 <137f406b-d3e0-fdeb-18e7-194a2aed927c@amazon.com>
 <20210201061603.GC4593@unreal>
 <CAKMK7uE0kSC1si0E9D1Spkn9aW2jFJw_SH3hYC6sZL7mG6pzyg@mail.gmail.com>
 <20210201152922.GC4718@ziepe.ca>
 <MW3PR11MB455569DF7B795272687669BFE5B69@MW3PR11MB4555.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MW3PR11MB455569DF7B795272687669BFE5B69@MW3PR11MB4555.namprd11.prod.outlook.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
 dri-devel <dri-devel@lists.freedesktop.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Doug Ledford <dledford@redhat.com>, "Vetter, Daniel" <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 01, 2021 at 05:03:44PM +0000, Xiong, Jianxin wrote:
> > -----Original Message-----
> > From: Jason Gunthorpe <jgg@ziepe.ca>
> > Sent: Monday, February 01, 2021 7:29 AM
> > To: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Leon Romanovsky <leon@kernel.org>; Gal Pressman <galpress@amazon.com>; Xiong, Jianxin <jianxin.xiong@intel.com>; Yishai Hadas
> > <yishaih@nvidia.com>; linux-rdma <linux-rdma@vger.kernel.org>; Edward Srouji <edwards@nvidia.com>; dri-devel <dri-
> > devel@lists.freedesktop.org>; Christian Koenig <christian.koenig@amd.com>; Doug Ledford <dledford@redhat.com>; Vetter, Daniel
> > <daniel.vetter@intel.com>
> > Subject: Re: [PATCH rdma-core v7 4/6] pyverbs: Add dma-buf based MR support
> > 
> > On Mon, Feb 01, 2021 at 03:10:00PM +0100, Daniel Vetter wrote:
> > > On Mon, Feb 1, 2021 at 7:16 AM Leon Romanovsky <leon@kernel.org> wrote:
> > > >
> > > > On Sun, Jan 31, 2021 at 05:31:16PM +0200, Gal Pressman wrote:
> > > > > On 25/01/2021 21:57, Jianxin Xiong wrote:
> > > > > > Define a new sub-class of 'MR' that uses dma-buf object for the
> > > > > > memory region. Define a new class 'DmaBuf' as a wrapper for
> > > > > > dma-buf allocation mechanism implemented in C.
> > > > > >
> > > > > > Update the cmake function for cython modules to allow building
> > > > > > modules with mixed cython and c source files.
> > > > > >
> > > > > > Signed-off-by: Jianxin Xiong <jianxin.xiong@intel.com>
> > > > > > buildlib/pyverbs_functions.cmake |  78 +++++++----
> > > > > >  pyverbs/CMakeLists.txt           |  11 +-
> > > > > >  pyverbs/dmabuf.pxd               |  15 +++
> > > > > >  pyverbs/dmabuf.pyx               |  73 ++++++++++
> > > > > >  pyverbs/dmabuf_alloc.c           | 278 +++++++++++++++++++++++++++++++++++++++
> > > > > >  pyverbs/dmabuf_alloc.h           |  19 +++
> > > > > >  pyverbs/libibverbs.pxd           |   2 +
> > > > > >  pyverbs/mr.pxd                   |   6 +
> > > > > >  pyverbs/mr.pyx                   | 105 ++++++++++++++-
> > > > > >  9 files changed, 557 insertions(+), 30 deletions(-)  create
> > > > > > mode 100644 pyverbs/dmabuf.pxd  create mode 100644
> > > > > > pyverbs/dmabuf.pyx  create mode 100644 pyverbs/dmabuf_alloc.c
> > > > > > create mode 100644 pyverbs/dmabuf_alloc.h
> > > >
> > > > <...>
> > > >
> > > > > > index 0000000..05eae75
> > > > > > +++ b/pyverbs/dmabuf_alloc.c
> > > > > > @@ -0,0 +1,278 @@
> > > > > > +// SPDX-License-Identifier: GPL-2.0 OR Linux-OpenIB
> > > > > > +/*
> > > > > > + * Copyright 2020 Intel Corporation. All rights reserved. See
> > > > > > +COPYING file  */
> > > > > > +
> > > > > > +#include <stdio.h>
> > > > > > +#include <stdlib.h>
> > > > > > +#include <stdint.h>
> > > > > > +#include <unistd.h>
> > > > > > +#include <string.h>
> > > > > > +#include <errno.h>
> > > > > > +#include <drm/drm.h>
> > > > > > +#include <drm/i915_drm.h>
> > > > > > +#include <drm/amdgpu_drm.h>
> > > > > > +#include <drm/radeon_drm.h>
> > > > >
> > > > > I assume these should come from the kernel headers package, right?
> > > >
> > > > This is gross, all kernel headers should be placed in
> > > > kernel-headers/* and "update" script needs to be extended to take drm/* files too :(.
> > >
> > > drm kernel headers are in the libdrm package. You need that anyway for
> > > doing the ioctls (if you don't hand-roll the restarting yourself).
> > >
> > > Also our userspace has gone over to just outright copying the driver
> > > headers. Not the generic headers, but for the rendering side of gpus,
> > > which is the topic here, there's really not much generic stuff.
> > >
> > > > Jianxin, are you fixing it?
> > >
> > > So fix is either to depend upon libdrm for building, or have copies of
> > > the headers included in the package for the i915/amdgpu/radeon headers
> > > (drm/drm.h probably not so good idea).
> > 
> > We should have a cmake test to not build the drm parts if it can't be built, and pyverbs should skip the tests.
> > 
> 
> Yes, I will add a test for that. Also, on SLES, the headers could be under /usr/include/libdrm instead of /usr/include/drm. The make test should check that and use proper path. 

Please use pkgconfig for this, libdrm installs a .pc file to make sure you
can find the right headers.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
