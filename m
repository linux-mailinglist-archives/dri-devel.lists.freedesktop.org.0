Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9071D40DAC2
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 15:10:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59E366EDB2;
	Thu, 16 Sep 2021 13:10:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B90436EDB3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 13:10:17 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id x5so5366795qtq.13
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 06:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=J1aPRVnPtvaDDmo3fez14oc8rYGiEsDWBCXDH/Wat7k=;
 b=SCLGmpBOIX1LyEWjCtTQu5NsbhW1Y4X5/DmQl1XQ9jzusvOLM7zvEkOwz6LOAv+Yok
 sIWQ6uZy+RXJ3cFeYjVefKkQH0Bt0fEt6Hxm02pQYIdfhNmnfHNX2wDQS3f9HxEUckLT
 uEUNakxQ26CbdQlN/sagwI+fXugp4FI45KUk2U0+TghLUrgqPs4hSAaLgC+UJKOxxT4E
 Mc+H12o6j9K7ZldUlePbIj3QazJSlLYL+zG9bxUEh82jSSu4c3hLfm8TlsPXKZBK8Vfn
 QyTQKfWMizwsKJYk7EULgbEvpNxSTjzFuIhJlbPIm2aqRKQQZUDbcvQh309a66LJBzjd
 rwyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=J1aPRVnPtvaDDmo3fez14oc8rYGiEsDWBCXDH/Wat7k=;
 b=ozYe6JMjxxtHLgsAP+Gv07YhirAcmp9lFV4qhtrKjkwIrDN3eueLjyDkllNXlKqlTG
 8Olqt+D4LjB2x/IHDfG9o0cCzuqfCxoEd9UGfgoBYX9mjg2+0ETGbeUJIXGkUSNINjoe
 aPjRidlaXjcj0UytyfK+k5qv46154PzmLpumGAnfYY+1HZ4W3ls8xJlA2F0AfbMVNxSb
 mEiL5hzNhBYP3KhdeeB2fkw80zxRpaECdiKgm+9Ms5MoCp6VqWovIkow7MI2J4ez5d4+
 6Ry4cq/S5YDpRlXj1K3qD4DG00S99LkTHCxhh5xOq9BcQRL7Vr9G7huefqXiVmfavq/7
 GEcA==
X-Gm-Message-State: AOAM5304zbGfMtDRVimCuj6tl7dJf9wyL3WlI2daYgQ53nbu7uazQ5tu
 rwskjlYdnCHxno3MePidDLpoeg==
X-Google-Smtp-Source: ABdhPJwoUHOat0GVnmJtcI3QwOrvQdDqw4k+r1J+CwosMJhqmF7+hz2G8rRCHLhPrxcT6+12hGdkXg==
X-Received: by 2002:ac8:7d42:: with SMTP id h2mr4861309qtb.220.1631797816616; 
 Thu, 16 Sep 2021 06:10:16 -0700 (PDT)
Received: from ziepe.ca ([206.223.160.26])
 by smtp.gmail.com with ESMTPSA id r23sm1992140qtp.60.2021.09.16.06.10.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 06:10:15 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1mQr9a-001MiL-Tq; Thu, 16 Sep 2021 10:10:14 -0300
Date: Thu, 16 Sep 2021 10:10:14 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Oded Gabbay <ogabbay@kernel.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
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
Message-ID: <20210916131014.GK3544071@ziepe.ca>
References: <20210912165309.98695-1-ogabbay@kernel.org>
 <YUCvNzpyC091KeaJ@phenom.ffwll.local>
 <20210914161218.GF3544071@ziepe.ca>
 <CAFCwf13322953Txr3Afa_MomuD148vnfpEog0xzW7FPWH9=6fg@mail.gmail.com>
 <YUM5JoMMK7gceuKZ@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YUM5JoMMK7gceuKZ@phenom.ffwll.local>
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

On Thu, Sep 16, 2021 at 02:31:34PM +0200, Daniel Vetter wrote:
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

It is a combination of uAPI and HW specification.

revoke here means you take a MR object and tell it to stop doing DMA
without causing the MR object to be destructed.

All the drivers can of course destruct the MR, but doing such a
destruction without explicit synchronization with user space opens
things up to a serious use-after potential that could be a security
issue.

When the open handle closes the userspace is synchronized with the
kernel and we can destruct the HW objects safely.

So, the special HW feature required is 'stop doing DMA but keep the
object in an error state' which isn't really implemented, and doesn't
extend very well to other object types beyond simple MRs.

> 1. User A opens gaudi device, sets up dma-buf export
> 
> 2. User A registers that with RDMA, or anything else that doesn't support
> revoke.
> 
> 3. User A closes gaudi device
> 
> 4. User B opens gaudi device, assumes that it has full control over the
> device and uploads some secrets, which happen to end up in the dma-buf
> region user A set up

I would expect this is blocked so long as the DMABUF exists - eg the
DMABUF will hold a fget on the FD of #1 until the DMABUF is closed, so
that #3 can't actually happen.

> It's not mlocked memory, it's mlocked memory and I can exfiltrate
> it.

That's just bug, don't make buggy drivers :)

Jason
