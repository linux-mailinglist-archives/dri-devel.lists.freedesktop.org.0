Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 190FC297A35
	for <lists+dri-devel@lfdr.de>; Sat, 24 Oct 2020 03:45:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA6126E155;
	Sat, 24 Oct 2020 01:45:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 036806E155
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Oct 2020 01:45:21 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id k3so2570742otp.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 18:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rGsi5YcxzQ7stG6G1DguJ+xZk2RUvzGBT2tUgkec1Ic=;
 b=FW8l6rNcPlkkHIxYAmxn2I5AzqFraX97UvSo6j5QaiD9JXDr9IgTqtrzGcVywpJMDS
 LUJn1/A1JOpYsDnjZG/w6zhkz6kqFQM84bEoADT/E2GPcuaDij8HZqkWlMO7VFktz7hl
 GAV2MM0PnpX7OmivnkLoLLZP2ZffvuNGVt47E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rGsi5YcxzQ7stG6G1DguJ+xZk2RUvzGBT2tUgkec1Ic=;
 b=elDgoiu3YFxFmJdbXu1FwV2s5qDX+PEmb+kw1+NvuAZKqlucACzmbkddimpOOZL4ki
 E1bFioKAAparfYt3GdICDxiFkO0wtQogWGO4aVbgmayBYo3kRW+q8zX7J2XtUeTF9p1R
 11JlmX37VRBJxary+bzmQXpjAF+2k70PWLmQ7KASKvdqMtT5Kylq1tzK6ZKSRH9gPYb7
 jqB/jdGR/iXV1dfJCfwlTRFlBcdO39VsshpHPlO7vTXw523CjrfkAs5IAuLx1ZYDcYpC
 0vqtvcd5cUQ4+mw/6/Q+a1LiWoUQrgFvi4xjXvC/KY7ZJV2oECydkd85UsJrfOXKBPx8
 q53Q==
X-Gm-Message-State: AOAM531vUU4Zo+9Zuru50XFSgqcikAAYxtjkm4TzMgtVLd5EGVc2qtdc
 hvoJ8ToR+//ez0ceZ7c2hXYu8lcqFRcLfBBBHX6AOg==
X-Google-Smtp-Source: ABdhPJxFEVvckOn8TMXbpUybEsH7El0kXpT+Js80avNLpe6rV/n5sIRCcmCgObpEiyOiSTQf0HfPhdVAvC4QMJ8TNC0=
X-Received: by 2002:a05:6830:1647:: with SMTP id
 h7mr4466267otr.281.1603503920944; 
 Fri, 23 Oct 2020 18:45:20 -0700 (PDT)
MIME-Version: 1.0
References: <1603471201-32588-1-git-send-email-jianxin.xiong@intel.com>
 <1603471201-32588-2-git-send-email-jianxin.xiong@intel.com>
 <20201023164911.GF401619@phenom.ffwll.local> <20201023182005.GP36674@ziepe.ca>
In-Reply-To: <20201023182005.GP36674@ziepe.ca>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Sat, 24 Oct 2020 03:45:09 +0200
Message-ID: <CAKMK7uEZYdtwHKchNwiFjuYJDjA+F+qDgw64TNkchjp4uYUr6g@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] RDMA/umem: Support importing dma-buf as user
 memory region
To: Jason Gunthorpe <jgg@ziepe.ca>
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
 dri-devel <dri-devel@lists.freedesktop.org>,
 Doug Ledford <dledford@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Jianxin Xiong <jianxin.xiong@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 23, 2020 at 8:20 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Fri, Oct 23, 2020 at 06:49:11PM +0200, Daniel Vetter wrote:
> > > +struct ib_umem *ib_umem_dmabuf_get(struct ib_device *device,
> > > +                              unsigned long offset, size_t size,
> > > +                              int fd, int access,
> > > +                              const struct dma_buf_attach_ops *ops)
> > > +{
> > > +   struct dma_buf *dmabuf;
> > > +   struct ib_umem_dmabuf *umem_dmabuf;
> > > +   struct ib_umem *umem;
> > > +   unsigned long end;
> > > +   long ret;
> > > +
> > > +   if (check_add_overflow(offset, (unsigned long)size, &end))
> > > +           return ERR_PTR(-EINVAL);
> > > +
> > > +   if (unlikely(PAGE_ALIGN(end) < PAGE_SIZE))
> > > +           return ERR_PTR(-EINVAL);
> > > +
> > > +   if (unlikely(!ops || !ops->move_notify))
> > > +           return ERR_PTR(-EINVAL);
> > > +
> > > +#ifdef CONFIG_DMA_VIRT_OPS
> > > +   if (device->dma_device->dma_ops == &dma_virt_ops)
> > > +           return ERR_PTR(-EINVAL);
> > > +#endif
> >
> > Maybe I'm confused, but should we have this check in dma_buf_attach, or at
> > least in dma_buf_dynamic_attach? The p2pdma functions use that too, and I
> > can't imagine how zerocopy should work (which is like the entire point of
> > dma-buf) when we have dma_virt_ops.
>
> The problem is we have RDMA drivers that assume SGL's have a valid
> struct page, and these hacky/wrong P2P sgls that DMABUF creates cannot
> be passed into those drivers.
>
> But maybe this is just a 'drivers are using it wrong' if they call
> this function and expect struct pages..
>
> The check in the p2p stuff was done to avoid this too, but it was on a
> different flow.

Yeah definitely don't call dma_buf_map_attachment and expect a page
back. In practice you'll get a page back fairly often, but I don't
think we want to bake that in, maybe we eventually get to non-hacky
dma_addr_t only sgl.

What I'm wondering is whether dma_buf_attach shouldn't reject such
devices directly, instead of each importer having to do that.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
