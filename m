Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3182A51B9
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 21:43:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 568EA6E8EF;
	Tue,  3 Nov 2020 20:43:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc43.google.com (mail-oo1-xc43.google.com
 [IPv6:2607:f8b0:4864:20::c43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 992D46E8EF
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 20:43:29 +0000 (UTC)
Received: by mail-oo1-xc43.google.com with SMTP id q1so79055oot.4
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Nov 2020 12:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kSY0DxD+eau5mAS1+HBkE5F6ICipfBymbriKN2JUq/U=;
 b=I7iIgaEHbf7T/nZIBZPQbHGIsASyGTgNJhgmmpCVSh2o6SezpHc6emio1VjkNo9XzX
 Kp/uui+y6Ua1deq7MMK4v5gOKcRDAxoF/fd+Ey7PlSoyRQnOonrzRcZT2kGWBiQsM4jO
 d3BHLvpWjotWnYqtZp6MqJXSa4wekIehPXysc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kSY0DxD+eau5mAS1+HBkE5F6ICipfBymbriKN2JUq/U=;
 b=L7tFy3LbBExjhfchvLbVbJCHgSgvOAShmsMrQKEBQlS3VSZ6Q5qCJ+u01+DofyRk/D
 vQ1Rtjqe9+QuIQLPA/6qXj2EmkHVGpebanaK3uw6RKCpl49k2NMbi/fcclItFgX/Wz1W
 WXd6COnvE0CRiBWrQhExSefI+qu94jXqUHAZzPWTyQSvfr9kuhb6pbTz/2DyUDate+wS
 Nbk9GPlkx8PcTQ1V34qujKz/YFmf/kvxdkJ5xsTlZvbDHkk4e3wygotPmFJcQ2w3asdT
 cI+6NkLrMtIJXKsGgu4P3hcQhMbO+G3dtWPrkZKpvZhJyMQ5fC1PTMOaMCplBuD4MYe4
 DW1g==
X-Gm-Message-State: AOAM530tVebuObvGLhp746syo3vn+KS/x0wFBo/xWS+0RNZe3yFxJT5+
 LyxacWIIHlw0Gx06CygphxvAmCS/SYh1feTzE0plbQ==
X-Google-Smtp-Source: ABdhPJxsFGFffuy6LR33Wih708OKY57tO/nDe7YQYylAyHFJdbFno8SE6ErEvHNen00gQ1lQz1ZUJvIuwf+5S9gqq9o=
X-Received: by 2002:a4a:b503:: with SMTP id r3mr16491239ooo.28.1604436208859; 
 Tue, 03 Nov 2020 12:43:28 -0800 (PST)
MIME-Version: 1.0
References: <1603471201-32588-1-git-send-email-jianxin.xiong@intel.com>
 <1603471201-32588-2-git-send-email-jianxin.xiong@intel.com>
 <20201023164911.GF401619@phenom.ffwll.local> <20201023182005.GP36674@ziepe.ca>
 <CAKMK7uEZYdtwHKchNwiFjuYJDjA+F+qDgw64TNkchjp4uYUr6g@mail.gmail.com>
 <MW3PR11MB45553600E8A141CCDE52FABDE5110@MW3PR11MB4555.namprd11.prod.outlook.com>
In-Reply-To: <MW3PR11MB45553600E8A141CCDE52FABDE5110@MW3PR11MB4555.namprd11.prod.outlook.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 3 Nov 2020 21:43:17 +0100
Message-ID: <CAKMK7uFMAiv27oRi98nAvx15M6jniUEb+hhe3mrY3mdYtzsmLg@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] RDMA/umem: Support importing dma-buf as user
 memory region
To: "Xiong, Jianxin" <jianxin.xiong@intel.com>
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
Cc: Leon Romanovsky <leon@kernel.org>, linux-rdma <linux-rdma@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Doug Ledford <dledford@redhat.com>, "Vetter, Daniel" <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 3, 2020 at 6:36 PM Xiong, Jianxin <jianxin.xiong@intel.com> wrote:
>
>
> > -----Original Message-----
> > From: Daniel Vetter <daniel@ffwll.ch>
> > Sent: Friday, October 23, 2020 6:45 PM
> > To: Jason Gunthorpe <jgg@ziepe.ca>
> > Cc: Xiong, Jianxin <jianxin.xiong@intel.com>; linux-rdma <linux-rdma@vger.kernel.org>; dri-devel <dri-devel@lists.freedesktop.org>; Leon
> > Romanovsky <leon@kernel.org>; Doug Ledford <dledford@redhat.com>; Vetter, Daniel <daniel.vetter@intel.com>; Christian Koenig
> > <christian.koenig@amd.com>
> > Subject: Re: [PATCH v6 1/4] RDMA/umem: Support importing dma-buf as user memory region
> >
> > > > > +
> > > > > +#ifdef CONFIG_DMA_VIRT_OPS
> > > > > +   if (device->dma_device->dma_ops == &dma_virt_ops)
> > > > > +           return ERR_PTR(-EINVAL); #endif
> > > >
> > > > Maybe I'm confused, but should we have this check in dma_buf_attach,
> > > > or at least in dma_buf_dynamic_attach? The p2pdma functions use that
> > > > too, and I can't imagine how zerocopy should work (which is like the
> > > > entire point of
> > > > dma-buf) when we have dma_virt_ops.
> > >
> > > The problem is we have RDMA drivers that assume SGL's have a valid
> > > struct page, and these hacky/wrong P2P sgls that DMABUF creates cannot
> > > be passed into those drivers.
> > >
> > > But maybe this is just a 'drivers are using it wrong' if they call
> > > this function and expect struct pages..
> > >
> > > The check in the p2p stuff was done to avoid this too, but it was on a
> > > different flow.
> >
> > Yeah definitely don't call dma_buf_map_attachment and expect a page back. In practice you'll get a page back fairly often, but I don't think
> > we want to bake that in, maybe we eventually get to non-hacky dma_addr_t only sgl.
> >
> > What I'm wondering is whether dma_buf_attach shouldn't reject such devices directly, instead of each importer having to do that.
>
> Come back here to see if consensus can be reached on who should do the check. My
> thinking is that it could be over restrictive for dma_buf_attach to always reject
> dma_virt_ops. According to dma-buf documentation the back storage would be
> moved to system area upon mapping unless p2p is requested and can be supported
> by the exporter. The sg_list for system memory would have struct page present.

So I'm not clear on what this dma_virt_ops stuff is for, but if it's
an entirely virtual device with cpu access, then you shouldn't do
dma_buf_map_attachment, and then peek at the struct page in the sgl.
Instead you need to use dma_buf_vmap/vunmap and
dma_buf_begin/end_cpu_access. Otherwise the coherency managed is all
potentially busted. Also note that cpu access from the kernel to
dma-buf is a rather niche feature (only some usb device drivers use
it), so expect warts.

If this is the case, then I think dma_buf_attach should check for this
and reject such imports, since that's an importer bug.

If it's otoh something rdma specific, then I guess rdma checking for this is ok.

As a third option, if it's something about the connectivity between
the importing and exporting device, then this should be checked in the
->attach callback the exporter can provide, like the p2p check. The
idea here is that for device specific remapping units (mostly found
ond SoC, and not something like a standard iommu managed by the
dma-api), some of which can even do funny stuff like rotation of 2d
images, can be access by some, but not other. And only the exporter is
aware of these restrictions.

Now I dunno which case this one here is.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
