Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D9740F76E
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 14:25:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C1396EC39;
	Fri, 17 Sep 2021 12:25:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34C2F6EC39
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 12:25:24 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id u18so13150055wrg.5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 05:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=B4xbw9gEcqky1hkIaKGJsZCnwDYURbkYMy8wOSBcFZM=;
 b=DBbT+Z73wXFx7Ix5ddCqc9nQajcrsU49nmmjtksdzvj4VIUhu9a12X6mxydVGcyr31
 hkbTnOZYoHZBblsPGhC4cqiN5vTy2EZ/ap7N566BgNdEzkAG+xpa6VwhSk6rstGS1sPD
 4IZWgIghyDL60XFxmzUrIJNR7pW0cc0ak4VI0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=B4xbw9gEcqky1hkIaKGJsZCnwDYURbkYMy8wOSBcFZM=;
 b=gltS9xjed0YmTLiDRqi8ZaWIaILpZEKJ6gXM/Mr76P6LXUQhLv7oRTFlBW1xs+qmCI
 VWTymsqBWQbEGjyGCBveSzC6ACzDYoCRvbWxrKz8U4S8/U51ODfrpjt6ndfbub01B8DY
 x/OrlWKlgIlMdJBOgM8F8oAe65oOET5aR8HrsIi3aPdKZUspthFfso50XKIxjDW5at3v
 EdpIjdaTXuv9ZUPGgTlEB1N7PfqADDDZhIxt4oOeCQMrS59BFwZ9Pu/fWKqiOjuH+C/1
 PZCUuTMnmiQ5abpWyBY71NWIqcJHFp1bhcJDQ3DVJ9I/gIg9M7dqC8P7QLcHdo50b7as
 zlRg==
X-Gm-Message-State: AOAM532PVQINbyYTx/FrQ/eHRZeWfv9IVXgexowVQAXm6Us9fSFd2Ggl
 +BiQoDcQK9omXEJE0G74FTpg+A==
X-Google-Smtp-Source: ABdhPJyMTcWyIQ8nzIGUt+EPkzWzvWClhn2Q1W8KmqNiWLuXSRA7doL/03EbIbn3t2AAXB96e7Moyg==
X-Received: by 2002:adf:f084:: with SMTP id n4mr12033899wro.362.1631881522631; 
 Fri, 17 Sep 2021 05:25:22 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m18sm6529557wrn.85.2021.09.17.05.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 05:25:21 -0700 (PDT)
Date: Fri, 17 Sep 2021 14:25:19 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Oded Gabbay <ogabbay@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Gal Pressman <galpress@amazon.com>, Yossi Leybovich <sleybo@amazon.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 linux-rdma <linux-rdma@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Doug Ledford <dledford@redhat.com>, Dave Airlie <airlied@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Leon Romanovsky <leonro@nvidia.com>, Christoph Hellwig <hch@lst.de>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>
Subject: Re: [PATCH v6 0/2] Add p2p via dmabuf to habanalabs
Message-ID: <YUSJL9ml1MljOwzB@phenom.ffwll.local>
Mail-Followup-To: Oded Gabbay <ogabbay@kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Gal Pressman <galpress@amazon.com>,
 Yossi Leybovich <sleybo@amazon.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 linux-rdma <linux-rdma@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Doug Ledford <dledford@redhat.com>, Dave Airlie <airlied@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Leon Romanovsky <leonro@nvidia.com>, Christoph Hellwig <hch@lst.de>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>
References: <20210912165309.98695-1-ogabbay@kernel.org>
 <YUCvNzpyC091KeaJ@phenom.ffwll.local>
 <20210914161218.GF3544071@ziepe.ca>
 <CAFCwf13322953Txr3Afa_MomuD148vnfpEog0xzW7FPWH9=6fg@mail.gmail.com>
 <YUM5JoMMK7gceuKZ@phenom.ffwll.local>
 <CAFCwf10MnK5KPBaeWar4tALGz9n8+-B8toXnqurcebZ8Y_Jjpw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFCwf10MnK5KPBaeWar4tALGz9n8+-B8toXnqurcebZ8Y_Jjpw@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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

On Thu, Sep 16, 2021 at 03:44:25PM +0300, Oded Gabbay wrote:
> On Thu, Sep 16, 2021 at 3:31 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Wed, Sep 15, 2021 at 10:45:36AM +0300, Oded Gabbay wrote:
> > > On Tue, Sep 14, 2021 at 7:12 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > > >
> > > > On Tue, Sep 14, 2021 at 04:18:31PM +0200, Daniel Vetter wrote:
> > > > > On Sun, Sep 12, 2021 at 07:53:07PM +0300, Oded Gabbay wrote:
> > > > > > Hi,
> > > > > > Re-sending this patch-set following the release of our user-space TPC
> > > > > > compiler and runtime library.
> > > > > >
> > > > > > I would appreciate a review on this.
> > > > >
> > > > > I think the big open we have is the entire revoke discussions. Having the
> > > > > option to let dma-buf hang around which map to random local memory ranges,
> > > > > without clear ownership link and a way to kill it sounds bad to me.
> > > > >
> > > > > I think there's a few options:
> > > > > - We require revoke support. But I've heard rdma really doesn't like that,
> > > > >   I guess because taking out an MR while holding the dma_resv_lock would
> > > > >   be an inversion, so can't be done. Jason, can you recap what exactly the
> > > > >   hold-up was again that makes this a no-go?
> > > >
> > > > RDMA HW can't do revoke.
> >
> > Like why? I'm assuming when the final open handle or whatever for that MR
> > is closed, you do clean up everything? Or does that MR still stick around
> > forever too?
> >
> > > > So we have to exclude almost all the HW and several interesting use
> > > > cases to enable a revoke operation.
> > > >
> > > > >   - For non-revokable things like these dma-buf we'd keep a drm_master
> > > > >     reference around. This would prevent the next open to acquire
> > > > >     ownership rights, which at least prevents all the nasty potential
> > > > >     problems.
> > > >
> > > > This is what I generally would expect, the DMABUF FD and its DMA
> > > > memory just floats about until the unrevokable user releases it, which
> > > > happens when the FD that is driving the import eventually gets closed.
> > > This is exactly what we are doing in the driver. We make sure
> > > everything is valid until the unrevokable user releases it and that
> > > happens only when the dmabuf fd gets closed.
> > > And the user can't close it's fd of the device until he performs the
> > > above, so there is no leakage between users.
> >
> > Maybe I got the device security model all wrong, but I thought Guadi is
> > single user, and the only thing it protects is the system against the
> > Gaudi device trhough iommu/device gart. So roughly the following can
> > happen:
> >
> > 1. User A opens gaudi device, sets up dma-buf export
> >
> > 2. User A registers that with RDMA, or anything else that doesn't support
> > revoke.
> >
> > 3. User A closes gaudi device
> This can not happen without User A closing the FD of the dma-buf it exported.
> We prevent User A from closing the device because when it exported the
> dma-buf, the driver's code took a refcnt of the user's private
> structure. You can see that in export_dmabuf_common() in the 2nd
> patch. There is a call there to hl_ctx_get.
> So even if User A calls close(device_fd), the driver won't let any
> other user open the device until User A closes the fd of the dma-buf
> object.
> 
> Moreover, once User A will close the dma-buf fd and the device is
> released, the driver will scrub the device memory (this is optional
> for systems who care about security).
> 
> And AFAIK, User A can't close the dma-buf fd once it registered it
> with RDMA, without doing unregister.
> This can be seen in ib_umem_dmabuf_get() which calls dma_buf_get()
> which does fget(fd)

Yeah that's essentially what I was looking for. This is defacto
hand-rolling the drm_master owner tracking stuff. As long as we have
something like this in place it should be fine I think.
-Daniel

> > 4. User B opens gaudi device, assumes that it has full control over the
> > device and uploads some secrets, which happen to end up in the dma-buf
> > region user A set up
> >
> > 5. User B extracts secrets.
> >
> > > > I still don't think any of the complexity is needed, pinnable memory
> > > > is a thing in Linux, just account for it in mlocked and that is
> > > > enough.
> >
> > It's not mlocked memory, it's mlocked memory and I can exfiltrate it.
> > Mlock is fine, exfiltration not so much. It's mlock, but a global pool and
> > if you didn't munlock then the next mlock from a completely different user
> > will alias with your stuff.
> >
> > Or is there something that prevents that? Oded at least explain that gaudi
> > works like a gpu from 20 years ago, single user, no security at all within
> > the device.
> > -Daniel
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
