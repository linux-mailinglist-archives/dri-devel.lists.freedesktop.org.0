Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EDD410534
	for <lists+dri-devel@lfdr.de>; Sat, 18 Sep 2021 10:39:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2BB06E105;
	Sat, 18 Sep 2021 08:39:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C43426E105;
 Sat, 18 Sep 2021 08:39:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7B5E761251;
 Sat, 18 Sep 2021 08:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631954351;
 bh=I3OXBH6Jsft3MeFXXif2KAYrH0PL5mHvHWDLsrpF3p0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=a9hjTcoDC0ygV/THN5MB4kBvc1nnulxFRN2ENZlTd88T2ditC8k61LEK7nro1pcKy
 58YoRM/lwtdqh8GyJ8qXWBf/3Vx0F85rmORFagsAOyvTiRfGxdRnqMcvWAcFYC1YKF
 375MnAbUtdYufFWtwtFjnlbzHb6ShWIbS2AWBWorMK1G9X3G85uL7vshrzItTf70VH
 KTqdnkocRfkn3jy+f8FEJabg3VvC7uH3Jng6O9C4dPMmbmv18gCNn/jpIMEJRH7Dyi
 MKcdnMDQZoWAMPe1dUw+5D79OrlymmveofL+SMizg3O59N3058HbTxrnBCSp1x6q3B
 G5psP8Km2jW+A==
Received: by mail-oo1-f44.google.com with SMTP id
 m14-20020a4ad50e000000b002912a944a47so3999705oos.12; 
 Sat, 18 Sep 2021 01:39:11 -0700 (PDT)
X-Gm-Message-State: AOAM532cA5f4rO01/aaI4hI5Im5k94R1SXFNgipX7r7FlwYtF46Zc/E1
 K+Djimv3doFLAxEjiTrbjkEIlVsc8msX4sKlZ6E=
X-Google-Smtp-Source: ABdhPJwhjcwUIBun9pdQA2AKk6/UkuNunTe3+nY6kMyQMkX2egUVkh/hJR0L43iF+/kZGTei1N8EB2+UDKBIhXdrDvg=
X-Received: by 2002:a05:6820:1049:: with SMTP id
 x9mr4953726oot.40.1631954350758; 
 Sat, 18 Sep 2021 01:39:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210912165309.98695-1-ogabbay@kernel.org>
 <YUCvNzpyC091KeaJ@phenom.ffwll.local>
 <20210914161218.GF3544071@ziepe.ca>
 <CAFCwf13322953Txr3Afa_MomuD148vnfpEog0xzW7FPWH9=6fg@mail.gmail.com>
 <YUM5JoMMK7gceuKZ@phenom.ffwll.local> <20210916131014.GK3544071@ziepe.ca>
 <YUSKSHBC9uI49wZZ@phenom.ffwll.local>
In-Reply-To: <YUSKSHBC9uI49wZZ@phenom.ffwll.local>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Sat, 18 Sep 2021 11:38:42 +0300
X-Gmail-Original-Message-ID: <CAFCwf12o-+wtbk8J8k8hP4_k0a8Lco4m9f4s1vBobkQwNtn39w@mail.gmail.com>
Message-ID: <CAFCwf12o-+wtbk8J8k8hP4_k0a8Lco4m9f4s1vBobkQwNtn39w@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] Add p2p via dmabuf to habanalabs
To: Jason Gunthorpe <jgg@ziepe.ca>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Gal Pressman <galpress@amazon.com>, Yossi Leybovich <sleybo@amazon.com>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 linux-rdma <linux-rdma@vger.kernel.org>, 
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Doug Ledford <dledford@redhat.com>, 
 Dave Airlie <airlied@gmail.com>, Alex Deucher <alexander.deucher@amd.com>, 
 Leon Romanovsky <leonro@nvidia.com>, Christoph Hellwig <hch@lst.de>, 
 amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"
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

On Fri, Sep 17, 2021 at 3:30 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Thu, Sep 16, 2021 at 10:10:14AM -0300, Jason Gunthorpe wrote:
> > On Thu, Sep 16, 2021 at 02:31:34PM +0200, Daniel Vetter wrote:
> > > On Wed, Sep 15, 2021 at 10:45:36AM +0300, Oded Gabbay wrote:
> > > > On Tue, Sep 14, 2021 at 7:12 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > > > >
> > > > > On Tue, Sep 14, 2021 at 04:18:31PM +0200, Daniel Vetter wrote:
> > > > > > On Sun, Sep 12, 2021 at 07:53:07PM +0300, Oded Gabbay wrote:
> > > > > > > Hi,
> > > > > > > Re-sending this patch-set following the release of our user-space TPC
> > > > > > > compiler and runtime library.
> > > > > > >
> > > > > > > I would appreciate a review on this.
> > > > > >
> > > > > > I think the big open we have is the entire revoke discussions. Having the
> > > > > > option to let dma-buf hang around which map to random local memory ranges,
> > > > > > without clear ownership link and a way to kill it sounds bad to me.
> > > > > >
> > > > > > I think there's a few options:
> > > > > > - We require revoke support. But I've heard rdma really doesn't like that,
> > > > > >   I guess because taking out an MR while holding the dma_resv_lock would
> > > > > >   be an inversion, so can't be done. Jason, can you recap what exactly the
> > > > > >   hold-up was again that makes this a no-go?
> > > > >
> > > > > RDMA HW can't do revoke.
> > >
> > > Like why? I'm assuming when the final open handle or whatever for that MR
> > > is closed, you do clean up everything? Or does that MR still stick around
> > > forever too?
> >
> > It is a combination of uAPI and HW specification.
> >
> > revoke here means you take a MR object and tell it to stop doing DMA
> > without causing the MR object to be destructed.
> >
> > All the drivers can of course destruct the MR, but doing such a
> > destruction without explicit synchronization with user space opens
> > things up to a serious use-after potential that could be a security
> > issue.
> >
> > When the open handle closes the userspace is synchronized with the
> > kernel and we can destruct the HW objects safely.
> >
> > So, the special HW feature required is 'stop doing DMA but keep the
> > object in an error state' which isn't really implemented, and doesn't
> > extend very well to other object types beyond simple MRs.
>
> Yeah revoke without destroying the MR doesn't work, and it sounds like
> revoke by destroying the MR just moves the can of worms around to another
> place.
>
> > > 1. User A opens gaudi device, sets up dma-buf export
> > >
> > > 2. User A registers that with RDMA, or anything else that doesn't support
> > > revoke.
> > >
> > > 3. User A closes gaudi device
> > >
> > > 4. User B opens gaudi device, assumes that it has full control over the
> > > device and uploads some secrets, which happen to end up in the dma-buf
> > > region user A set up
> >
> > I would expect this is blocked so long as the DMABUF exists - eg the
> > DMABUF will hold a fget on the FD of #1 until the DMABUF is closed, so
> > that #3 can't actually happen.
> >
> > > It's not mlocked memory, it's mlocked memory and I can exfiltrate
> > > it.
> >
> > That's just bug, don't make buggy drivers :)
>
> Well yeah, but given that habanalabs hand rolled this I can't just check
> for the usual things we have to enforce this in drm. And generally you can
> just open chardevs arbitrarily, and multiple users fighting over each
> another. The troubles only start when you have private state or memory
> allocations of some kind attached to the struct file (instead of the
> underlying device), or something else that requires device exclusivity.
> There's no standard way to do that.
>
> Plus in many cases you really want revoke on top (can't get that here
> unfortunately it seems), and the attempts to get towards a generic
> revoke() just never went anywhere. So again it's all hand-rolled
> per-subsystem. *insert lament about us not having done this through a
> proper subsystem*
>
> Anyway it sounds like the code takes care of that.
> -Daniel

Daniel, Jason,
Thanks for reviewing this code.

Can I get an R-B / A-B from you for this patch-set ?

Thanks,
Oded
