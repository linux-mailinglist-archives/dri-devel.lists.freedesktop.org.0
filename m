Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7083F2385
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 01:06:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDC0F6E90C;
	Thu, 19 Aug 2021 23:06:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 767146E90C
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 23:06:04 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id az7so9008685qkb.5
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 16:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=lUX7epF7foRJPnJW8zAvGrpG9sbsCy+8eUVnLXUioaw=;
 b=k/GgjG+KGvsRHDTaR/VlVvRNrfg9uPX5JU23M6lnlFazEhBaLpFG2yLgIA5DjuqITc
 ZtITYZTtiD4QoA9YVBs+h0X1AVz3p2dPiahcKu4x64AcrhVQXiJIob4kXZsFDqfHLPEH
 MDAy0kMdT7vfNS453Pn3keQ8XOV6pBw+XrZ9JH3zS6LTaGidh2NOFMUyf6POnFxjJjMV
 dteg7esI3k4ovVAkSAOQhtzZ0/kyjPmh1I1TnfpWjWVKuXx7m8P9gtlyRFtfWMupn+rj
 +p4DvEIaviEiwP7Tg+vxG/hXWAG9QrvF2o7GcnaIaJ8USAjvXaOGmBneEWy8U7uYSyyp
 KRiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lUX7epF7foRJPnJW8zAvGrpG9sbsCy+8eUVnLXUioaw=;
 b=ENPQ2MO724gu9S0sNxHCCp/l/xq42Jolv8uK0m81TY3bP2tKYM/+L9m3CoXXMoTvfe
 HHdz7Yc7thfJo2yWFXKvJk35KMbsCAv2i+9f3COsIuNSNqquMuCOL968tif3ChdfwYMO
 Eld2Dx+Zm+WwWLQTeL+qhzs63wSX71+OHhUG2NYmsble6xJ1Y/UX4+ITZw1+OR70ExRp
 +YpVTS/YYEgHnkhmDTkayYCQNjUzzDCxG4N5QeeSlCPqtpPpHcixrncxzVsbAZ+7PoP+
 kp7AjBFcUzPz3gH+gWHfEjRWix7IWjdYe2F+L0oil2qxO1a85x2eIP0xC5kA/FnwAVrF
 Q5sw==
X-Gm-Message-State: AOAM5311oyx6O0MP7F1Ks01me1O86VSOdMB5M3s4mLSCbkc1RK9Y+6/x
 +5tW9RSOK8cEzCfdSy0alqntrA==
X-Google-Smtp-Source: ABdhPJy/ltQJWz3bEvwivJHVegVN2SJG5oJXKMzn032Cjp7qnG0C8JFFt9RanDCCQRXqWfZ4YPIPmA==
X-Received: by 2002:a37:2753:: with SMTP id n80mr5973504qkn.223.1629414363407; 
 Thu, 19 Aug 2021 16:06:03 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.129])
 by smtp.gmail.com with ESMTPSA id n20sm2401213qkk.135.2021.08.19.16.06.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 16:06:02 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1mGr6o-001dOi-8m; Thu, 19 Aug 2021 20:06:02 -0300
Date: Thu, 19 Aug 2021 20:06:02 -0300
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
Message-ID: <20210819230602.GU543798@ziepe.ca>
References: <20210818074352.29950-1-galpress@amazon.com>
 <CAKMK7uGZ_eX+XfYJU6EkKEOVrHz3q6QMxaEbyyD3_1iqj9YSjw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uGZ_eX+XfYJU6EkKEOVrHz3q6QMxaEbyyD3_1iqj9YSjw@mail.gmail.com>
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

On Wed, Aug 18, 2021 at 11:34:51AM +0200, Daniel Vetter wrote:
> On Wed, Aug 18, 2021 at 9:45 AM Gal Pressman <galpress@amazon.com> wrote:
> >
> > Hey all,
> >
> > Currently, the RDMA subsystem can only work with dynamic dmabuf
> > attachments, which requires the RDMA device to support on-demand-paging
> > (ODP) which is not common on most devices (only supported by mlx5).
> >
> > While the dynamic requirement makes sense for certain GPUs, some devices
> > (such as habanalabs) have device memory that is always "pinned" and do
> > not need/use the move_notify operation.
> >
> > The motivation of this RFC is to use habanalabs as the dmabuf exporter,
> > and EFA as the importer to allow for peer2peer access through libibverbs.
> >
> > This draft patch changes the dmabuf driver to differentiate between
> > static/dynamic attachments by looking at the move_notify op instead of
> > the importer_ops struct, and allowing the peer2peer flag to be enabled
> > in case of a static exporter.
> >
> > Thanks
> >
> > Signed-off-by: Gal Pressman <galpress@amazon.com>
> 
> Given that habanalabs dma-buf support is very firmly in limbo (at
> least it's not yet in linux-next or anywhere else) I think you want to
> solve that problem first before we tackle the additional issue of
> making p2p work without dynamic dma-buf. Without that it just doesn't
> make a lot of sense really to talk about solutions here.

I have been thinking about adding a dmabuf exporter to VFIO, for
basically the same reason habana labs wants to do it.

In that situation we'd want to see an approach similar to this as well
to have a broad usability.

The GPU drivers also want this for certain sophisticated scenarios
with RDMA, the intree drivers just haven't quite got there yet.

So, I think it is worthwhile to start thinking about this regardless
of habana labs.

Jason
