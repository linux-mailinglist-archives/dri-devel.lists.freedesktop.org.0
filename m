Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BAF297D95
	for <lists+dri-devel@lfdr.de>; Sat, 24 Oct 2020 19:05:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 809916E8F5;
	Sat, 24 Oct 2020 17:05:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21A196E33F
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 18:20:08 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id m65so1655993qte.11
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 11:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=d/+MlewygeiienB2mRVhuu6CHgxoRL3d5SyiUrYkbUk=;
 b=P4s3di/PHximFnEKCWi0KnwrrxyUpqpcmCQy2Nth1PVvkNCVxwt8YTbQ+cWCzJ+rnD
 f5u7no5HH802n8lLR852ZUhFFg0kr2kfshpdHDx1axKHrq58MWe8ZN93rEE/Dhi4yduP
 +lWucSf+1tTgEBWpz9UaUW9nYQXFF0grtVVrH19T4mCRSk6URpMvHyVqPBsiQK5IJ7Qi
 BTlV57OclczClDMZu+PXRkkPJmwtdeJaX4kTqMOGVWlzaWL8V+y7I7BDKV/C3C3VckhR
 ai8VK0aBvsufYBiH7tqeJHT+Q1RpyA+lNbgwb8D9agAm9SxQHuzaNf8S6fnpZmRb4p5I
 tI8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=d/+MlewygeiienB2mRVhuu6CHgxoRL3d5SyiUrYkbUk=;
 b=sUb1FB8VZ2HGWMIIiJZp5oi9toiS/Nn/XBG+CNgKYC+w9adKSsydt6kCWoM+3QqNiS
 /XCkFvyzKm7Udl9SI2QuNaUgojc6kHz8OiZYRH8Qy92kChyCfScOgsgN4VW4es/KTtZG
 sIXRuCJ73tjtafTEd2HCRX/VVX2rZPg8djp+Af+zTGqSVoPqme6crp6B5LCotowiHyug
 T5+CVWJE4Y+Mfmh332794NUH3eI0Y7aSaJrN2iTMcsdLu105ePRNaM3mQwqJS3szV5eU
 XpFNXygB/RQrioYur4AEgat7zXSk7Fg67Adu8MHW0dHE2FXgLvttG1BZQKHgwKE/UkqE
 LCdA==
X-Gm-Message-State: AOAM531SAbXwP801F8nDevp3fdCFnWd+zHD+tZsVLgmWzz2q2PP+le79
 VXlPLPH9o5OZ3eJYmlLE7aqETw==
X-Google-Smtp-Source: ABdhPJzEK0E5cN3UuD9k/y/M+Nvpt4LbYO1AelIkz6dEQYGwBH4YhcUAmfE4fNEeUt7dggHiEbURCg==
X-Received: by 2002:ac8:13c9:: with SMTP id i9mr3275402qtj.89.1603477207177;
 Fri, 23 Oct 2020 11:20:07 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id v5sm1242273qkv.89.2020.10.23.11.20.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 11:20:06 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kW1fZ-006OVO-L8; Fri, 23 Oct 2020 15:20:05 -0300
Date: Fri, 23 Oct 2020 15:20:05 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v6 1/4] RDMA/umem: Support importing dma-buf as user
 memory region
Message-ID: <20201023182005.GP36674@ziepe.ca>
References: <1603471201-32588-1-git-send-email-jianxin.xiong@intel.com>
 <1603471201-32588-2-git-send-email-jianxin.xiong@intel.com>
 <20201023164911.GF401619@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201023164911.GF401619@phenom.ffwll.local>
X-Mailman-Approved-At: Sat, 24 Oct 2020 17:05:18 +0000
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
Cc: Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Doug Ledford <dledford@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Jianxin Xiong <jianxin.xiong@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 23, 2020 at 06:49:11PM +0200, Daniel Vetter wrote:
> > +struct ib_umem *ib_umem_dmabuf_get(struct ib_device *device,
> > +				   unsigned long offset, size_t size,
> > +				   int fd, int access,
> > +				   const struct dma_buf_attach_ops *ops)
> > +{
> > +	struct dma_buf *dmabuf;
> > +	struct ib_umem_dmabuf *umem_dmabuf;
> > +	struct ib_umem *umem;
> > +	unsigned long end;
> > +	long ret;
> > +
> > +	if (check_add_overflow(offset, (unsigned long)size, &end))
> > +		return ERR_PTR(-EINVAL);
> > +
> > +	if (unlikely(PAGE_ALIGN(end) < PAGE_SIZE))
> > +		return ERR_PTR(-EINVAL);
> > +
> > +	if (unlikely(!ops || !ops->move_notify))
> > +		return ERR_PTR(-EINVAL);
> > +
> > +#ifdef CONFIG_DMA_VIRT_OPS
> > +	if (device->dma_device->dma_ops == &dma_virt_ops)
> > +		return ERR_PTR(-EINVAL);
> > +#endif
> 
> Maybe I'm confused, but should we have this check in dma_buf_attach, or at
> least in dma_buf_dynamic_attach? The p2pdma functions use that too, and I
> can't imagine how zerocopy should work (which is like the entire point of
> dma-buf) when we have dma_virt_ops.

The problem is we have RDMA drivers that assume SGL's have a valid
struct page, and these hacky/wrong P2P sgls that DMABUF creates cannot
be passed into those drivers.

But maybe this is just a 'drivers are using it wrong' if they call
this function and expect struct pages..

The check in the p2p stuff was done to avoid this too, but it was on a
different flow.

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
