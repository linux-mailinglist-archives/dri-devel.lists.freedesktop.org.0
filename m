Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A30EE40DA3E
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 14:44:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68F206EB76;
	Thu, 16 Sep 2021 12:44:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A3A36EB76;
 Thu, 16 Sep 2021 12:44:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 058B56113E;
 Thu, 16 Sep 2021 12:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631796293;
 bh=KLzBiW3VVJ+O27eDAUHuH818CfcF0FIggjnNJ955TqI=;
 h=References:In-Reply-To:From:Date:Subject:To:From;
 b=Ufylq44NB1rynFax2+iP0pEyc1lFGZxtmemt4XTmxqqQXVkOF9rYMFRXt5I6zC1jY
 2eYV6JOxKPkcQUuAeumz6QOIM6NJBa8ziT9lFeDqMlyL1Ycvtyb3U9GmCbHBkhpZMx
 EXB5Eq7occlceD/WiPQ2kPhoTBl7twxT+nFovEAE9QE4/pAtCmwA33rUowdoPMCI+F
 ZeVevgvTXw21w3Eo3TslI1jqLMAoybOMV2ihcZGyKgbOimzwSYxuy+4RYMOTE5g/t2
 c/Tx7icnJShaG/sQHI8DazpmhP0/GIoOMYQSGAkyVNOLb7f7f/iu9071Hqjmd5RpK6
 so0eXkmFZge8w==
Received: by mail-ot1-f50.google.com with SMTP id
 k12-20020a056830150c00b0051abe7f680bso8159228otp.1; 
 Thu, 16 Sep 2021 05:44:52 -0700 (PDT)
X-Gm-Message-State: AOAM532Pvvf0eshTfnulB9pHw5L4RS9yxBmTGn/C9MpgYE5NP4uEhF0N
 09xlJDXPTEuVr06hbk1o8vUOT2pzDfbqAYHKxH0=
X-Google-Smtp-Source: ABdhPJzYLUSJZsh0jo8CcdLUrWa60FoaIm/wgPz4w5rfGXbsO/CMqYBIPFe4um0VFr4rFpmdHQF7TW4xUd8HJFD8LqY=
X-Received: by 2002:a05:6830:12d7:: with SMTP id
 a23mr4519312otq.102.1631796292308; 
 Thu, 16 Sep 2021 05:44:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210912165309.98695-1-ogabbay@kernel.org>
 <YUCvNzpyC091KeaJ@phenom.ffwll.local>
 <20210914161218.GF3544071@ziepe.ca>
 <CAFCwf13322953Txr3Afa_MomuD148vnfpEog0xzW7FPWH9=6fg@mail.gmail.com>
 <YUM5JoMMK7gceuKZ@phenom.ffwll.local>
In-Reply-To: <YUM5JoMMK7gceuKZ@phenom.ffwll.local>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Thu, 16 Sep 2021 15:44:25 +0300
X-Gmail-Original-Message-ID: <CAFCwf10MnK5KPBaeWar4tALGz9n8+-B8toXnqurcebZ8Y_Jjpw@mail.gmail.com>
Message-ID: <CAFCwf10MnK5KPBaeWar4tALGz9n8+-B8toXnqurcebZ8Y_Jjpw@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] Add p2p via dmabuf to habanalabs
To: Oded Gabbay <ogabbay@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, 
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

On Thu, Sep 16, 2021 at 3:31 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Wed, Sep 15, 2021 at 10:45:36AM +0300, Oded Gabbay wrote:
> > On Tue, Sep 14, 2021 at 7:12 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > >
> > > On Tue, Sep 14, 2021 at 04:18:31PM +0200, Daniel Vetter wrote:
> > > > On Sun, Sep 12, 2021 at 07:53:07PM +0300, Oded Gabbay wrote:
> > > > > Hi,
> > > > > Re-sending this patch-set following the release of our user-space TPC
> > > > > compiler and runtime library.
> > > > >
> > > > > I would appreciate a review on this.
> > > >
> > > > I think the big open we have is the entire revoke discussions. Having the
> > > > option to let dma-buf hang around which map to random local memory ranges,
> > > > without clear ownership link and a way to kill it sounds bad to me.
> > > >
> > > > I think there's a few options:
> > > > - We require revoke support. But I've heard rdma really doesn't like that,
> > > >   I guess because taking out an MR while holding the dma_resv_lock would
> > > >   be an inversion, so can't be done. Jason, can you recap what exactly the
> > > >   hold-up was again that makes this a no-go?
> > >
> > > RDMA HW can't do revoke.
>
> Like why? I'm assuming when the final open handle or whatever for that MR
> is closed, you do clean up everything? Or does that MR still stick around
> forever too?
>
> > > So we have to exclude almost all the HW and several interesting use
> > > cases to enable a revoke operation.
> > >
> > > >   - For non-revokable things like these dma-buf we'd keep a drm_master
> > > >     reference around. This would prevent the next open to acquire
> > > >     ownership rights, which at least prevents all the nasty potential
> > > >     problems.
> > >
> > > This is what I generally would expect, the DMABUF FD and its DMA
> > > memory just floats about until the unrevokable user releases it, which
> > > happens when the FD that is driving the import eventually gets closed.
> > This is exactly what we are doing in the driver. We make sure
> > everything is valid until the unrevokable user releases it and that
> > happens only when the dmabuf fd gets closed.
> > And the user can't close it's fd of the device until he performs the
> > above, so there is no leakage between users.
>
> Maybe I got the device security model all wrong, but I thought Guadi is
> single user, and the only thing it protects is the system against the
> Gaudi device trhough iommu/device gart. So roughly the following can
> happen:
>
> 1. User A opens gaudi device, sets up dma-buf export
>
> 2. User A registers that with RDMA, or anything else that doesn't support
> revoke.
>
> 3. User A closes gaudi device
This can not happen without User A closing the FD of the dma-buf it exported.
We prevent User A from closing the device because when it exported the
dma-buf, the driver's code took a refcnt of the user's private
structure. You can see that in export_dmabuf_common() in the 2nd
patch. There is a call there to hl_ctx_get.
So even if User A calls close(device_fd), the driver won't let any
other user open the device until User A closes the fd of the dma-buf
object.

Moreover, once User A will close the dma-buf fd and the device is
released, the driver will scrub the device memory (this is optional
for systems who care about security).

And AFAIK, User A can't close the dma-buf fd once it registered it
with RDMA, without doing unregister.
This can be seen in ib_umem_dmabuf_get() which calls dma_buf_get()
which does fget(fd)


>
> 4. User B opens gaudi device, assumes that it has full control over the
> device and uploads some secrets, which happen to end up in the dma-buf
> region user A set up
>
> 5. User B extracts secrets.
>
> > > I still don't think any of the complexity is needed, pinnable memory
> > > is a thing in Linux, just account for it in mlocked and that is
> > > enough.
>
> It's not mlocked memory, it's mlocked memory and I can exfiltrate it.
> Mlock is fine, exfiltration not so much. It's mlock, but a global pool and
> if you didn't munlock then the next mlock from a completely different user
> will alias with your stuff.
>
> Or is there something that prevents that? Oded at least explain that gaudi
> works like a gpu from 20 years ago, single user, no security at all within
> the device.
> -Daniel
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
