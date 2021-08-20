Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9473F2C24
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 14:33:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCAB06EA77;
	Fri, 20 Aug 2021 12:33:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C8BA6EA77
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 12:33:18 +0000 (UTC)
Received: by mail-qt1-x830.google.com with SMTP id x5so7283680qtq.13
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 05:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=WeQmd5+0vxDa5m6jnZ3knC4/DcXKbYH1w7mE5S3oKFc=;
 b=EmixaAS+anbfR20Pxi+he04PHrXHQozzeVwOkECBp43bQMSJrCajuRzjIPkPrgPDjx
 zl9jUbk0xDHwyqqTUkqMjtn3fYhvvWIlUVIyXZlT5bEj6DnpytFMZwI82abS2Gr3URni
 ZbmTi3v+O/OZ4rafrzDZ+O2BrbV+uARvR2UJJ4TP5dqWJBCHOn8WvoGPiypRRpV3Q1O3
 6BPFzPT0PXqyaAj7SnZ2ZgjaoI+tvWldLGjbXUn2FSEN4JrdFZXjkbkQ2FhJm9/ZVxMW
 iu7vGS4SxP9v2VZPwGpWMwyCIuZDriXLGP7GfFcjuZQdrIyVN/IGB88ogyCHoimSNfQn
 tJZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WeQmd5+0vxDa5m6jnZ3knC4/DcXKbYH1w7mE5S3oKFc=;
 b=fAyMamvxdX811U3JBoRQuA09yftcb1+D/1URXCG8+yCcPbHJpMt9c8u2af0hgglLqB
 nRVYhFmW7jTyi9tT/GytTGDnHqWYm5Se/Meb5E64In/Rl4cWQPeASCOLXX/taT6btxtP
 42kF4lW1OaVVv7DzC/EBGzoPiOySnmMLrnA9X7wBsrmGBPgcsNwHxQbXPu32R45r4rBo
 HigjsiUeH1F7xaEUNptr65ZLEO84Z65er8wPgPnGJnP0eOZS2hY/wy+WD0loITPonSO6
 ksRkIi924jjFh0koXqCqhejTRt9rCI6MOg0AO31HlCtcWNpjzBmCEB4Kcm8LLeRZgRb2
 V6CQ==
X-Gm-Message-State: AOAM530DP0h0Gx8IUC0Qsp8K1t+zXSeFmjC2cSOU6WXxHcyj/l1n0zqW
 bI599IjExnUr0+HAqZkUV6wRfQ==
X-Google-Smtp-Source: ABdhPJwIAuUBrmaZFFxnu48qE+FFaT8r4GG8K+az1bBag/91CfhTyRBKB9CHeMJzovJUnVC3j452HA==
X-Received: by 2002:a05:622a:1aaa:: with SMTP id
 s42mr17497328qtc.122.1629462797984; 
 Fri, 20 Aug 2021 05:33:17 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.129])
 by smtp.gmail.com with ESMTPSA id j26sm2632446qki.26.2021.08.20.05.33.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 05:33:17 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1mH3i0-001pzx-AP; Fri, 20 Aug 2021 09:33:16 -0300
Date: Fri, 20 Aug 2021 09:33:16 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Gal Pressman <galpress@amazon.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Doug Ledford <dledford@redhat.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>,
 Oded Gabbay <ogabbay@habana.ai>, Tomer Tayar <ttayar@habana.ai>,
 Yossi Leybovich <sleybo@amazon.com>,
 Alexander Matushevsky <matua@amazon.com>,
 Leon Romanovsky <leonro@nvidia.com>,
 Jianxin Xiong <jianxin.xiong@intel.com>, John Hubbard <jhubbard@nvidia.com>
Subject: Re: [RFC] Make use of non-dynamic dmabuf in RDMA
Message-ID: <20210820123316.GV543798@ziepe.ca>
References: <20210818074352.29950-1-galpress@amazon.com>
 <CAKMK7uGZ_eX+XfYJU6EkKEOVrHz3q6QMxaEbyyD3_1iqj9YSjw@mail.gmail.com>
 <20210819230602.GU543798@ziepe.ca>
 <CAKMK7uGgQWcs4Va6TGN9akHSSkmTs1i0Kx+6WpeiXWhJKpasLA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uGgQWcs4Va6TGN9akHSSkmTs1i0Kx+6WpeiXWhJKpasLA@mail.gmail.com>
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

On Fri, Aug 20, 2021 at 09:25:30AM +0200, Daniel Vetter wrote:
> On Fri, Aug 20, 2021 at 1:06 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > On Wed, Aug 18, 2021 at 11:34:51AM +0200, Daniel Vetter wrote:
> > > On Wed, Aug 18, 2021 at 9:45 AM Gal Pressman <galpress@amazon.com> wrote:
> > > >
> > > > Hey all,
> > > >
> > > > Currently, the RDMA subsystem can only work with dynamic dmabuf
> > > > attachments, which requires the RDMA device to support on-demand-paging
> > > > (ODP) which is not common on most devices (only supported by mlx5).
> > > >
> > > > While the dynamic requirement makes sense for certain GPUs, some devices
> > > > (such as habanalabs) have device memory that is always "pinned" and do
> > > > not need/use the move_notify operation.
> > > >
> > > > The motivation of this RFC is to use habanalabs as the dmabuf exporter,
> > > > and EFA as the importer to allow for peer2peer access through libibverbs.
> > > >
> > > > This draft patch changes the dmabuf driver to differentiate between
> > > > static/dynamic attachments by looking at the move_notify op instead of
> > > > the importer_ops struct, and allowing the peer2peer flag to be enabled
> > > > in case of a static exporter.
> > > >
> > > > Thanks
> > > >
> > > > Signed-off-by: Gal Pressman <galpress@amazon.com>
> > >
> > > Given that habanalabs dma-buf support is very firmly in limbo (at
> > > least it's not yet in linux-next or anywhere else) I think you want to
> > > solve that problem first before we tackle the additional issue of
> > > making p2p work without dynamic dma-buf. Without that it just doesn't
> > > make a lot of sense really to talk about solutions here.
> >
> > I have been thinking about adding a dmabuf exporter to VFIO, for
> > basically the same reason habana labs wants to do it.
> >
> > In that situation we'd want to see an approach similar to this as well
> > to have a broad usability.
> >
> > The GPU drivers also want this for certain sophisticated scenarios
> > with RDMA, the intree drivers just haven't quite got there yet.
> >
> > So, I think it is worthwhile to start thinking about this regardless
> > of habana labs.
> 
> Oh sure, I've been having these for a while. I think there's two options:
> - some kind of soft-pin, where the contract is that we only revoke
> when absolutely necessary, and it's expected to be catastrophic on the
> importer's side. 

Honestly, I'm not very keen on this. We don't really have HW support
in several RDMA scenarios for even catastrophic unpin.

Gal, can EFA even do this for a MR? You basically have to resize the
rkey/lkey to zero length (or invalidate it like a FMR) under the
catstrophic revoke. The rkey/lkey cannot just be destroyed as that
opens a security problem with rkey/lkey re-use.

I think I saw EFA's current out of tree implementations had this bug.

> to do is mmap revoke), and I think that model of exclusive device
> ownership with the option to revoke fits pretty well for at least some
> of the accelerators floating around. In that case importers would
> never get a move_notify (maybe we should call this revoke_notify to
> make it clear it's a bit different) callback, except when the entire
> thing has been yanked. I think that would fit pretty well for VFIO,
> and I think we should be able to make it work for rdma too as some
> kind of auto-deregister. The locking might be fun with both of these
> since I expect some inversions compared to the register path, we'll
> have to figure these out.

It fits semantically nicely, VFIO also has a revoke semantic for BAR
mappings.

The challenge is the RDMA side which doesn't have a 'dma disabled
error state' for objects as part of the spec.

Some HW, like mlx5, can implement this for MR objects (see revoke_mr),
but I don't know if anything else can, and even mlx5 currently can't
do a revoke for any other object type.

I don't know how useful it would be, need to check on some of the use
cases.

The locking is tricky as we have to issue a device command, but that
device command cannot run concurrently with destruction or the tail
part of creation.

Jason
