Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD732994BA
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 19:01:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 242956EA4B;
	Mon, 26 Oct 2020 18:01:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF72A6EA08
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 12:26:41 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id q199so8030754qke.10
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 05:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=sFAWCcExMHTOHRRV6PN8qO5lJJu/poaIEUM21VQxEeo=;
 b=ZpyWLyYtOxl9708I/3m316/fIsDBjoAhyxwdOJlxJsIQp89vrJ1psU80YjbboMJ7f+
 tjkXsGPp1n/tjrS7CO8YSh0BHMKyUL63RtYRbvtww00icDvInnKVld+7oqUZ9+TGlc6F
 fDw882W6OHcN4/prlG8d1si+B4vfUksndF/RKBd79O6i+A4Kk0TDArWp84D8tONbHwUO
 mjzsEQIK9YKqjijoHPI8dDym7XkPY3mjwJHpu56witca+ty26WsTaDlk50Tz3FaSzx+y
 iFM/9NSMb8xonezq2xpKJPKvrRGrNpyEg6Oc7kGTBlfyP5WaH+WvPUOYZYZL+VsZPtau
 HvBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sFAWCcExMHTOHRRV6PN8qO5lJJu/poaIEUM21VQxEeo=;
 b=QU0zOwMNVSTaqwBKHh1EYV+LE8SvjDsqpSnRFOfWCfoBk0C/ZysH/3uKzWeqmremiJ
 u0nVA326uRbVtc2uA2ZImezFy44g5agQCJzoi4lCkAdF4e96OIZtYmKecWF9wgoGq3mp
 Vn0cK6kgEbjfyp+t9YoOXxHT4JAepJAAIg+lOrRGHggPEyC/wcS2XU7bBT9coQw00S/0
 quypAmcgzdbK6K+9p4fFUHCBOUfKhn1WPGXLNVLYpKDDLYU9GINOL11ej03pTqDkE/4t
 nij6AWt/kgZPzI9noPKZQa5ue9NrLOi6tJrKmECNVlQ/GZy7PpCD7MvRWpaDZBt9T/vr
 pEZg==
X-Gm-Message-State: AOAM533ucJaNH9RNnZ/VUlSGmCLLA+6e2Ml8Jfu8JOZeATLZlckz7zxk
 1ZLKhPqXMYWfYQjiVejchR7fVQ==
X-Google-Smtp-Source: ABdhPJwVw9RhhXxLcuyakL72UDPW4hT0r1fAS1TYVYmudNNMnoyPoutHDAwVmODEJzlfT62CHDCqmw==
X-Received: by 2002:a05:620a:214b:: with SMTP id
 m11mr16914254qkm.6.1603715200851; 
 Mon, 26 Oct 2020 05:26:40 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id y125sm6145331qkb.114.2020.10.26.05.26.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 05:26:38 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kX1a9-007zcj-SH; Mon, 26 Oct 2020 09:26:37 -0300
Date: Mon, 26 Oct 2020 09:26:37 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v6 1/4] RDMA/umem: Support importing dma-buf as user
 memory region
Message-ID: <20201026122637.GQ36674@ziepe.ca>
References: <1603471201-32588-1-git-send-email-jianxin.xiong@intel.com>
 <1603471201-32588-2-git-send-email-jianxin.xiong@intel.com>
 <20201023164911.GF401619@phenom.ffwll.local>
 <20201023182005.GP36674@ziepe.ca>
 <20201024074807.GA3112@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201024074807.GA3112@infradead.org>
X-Mailman-Approved-At: Mon, 26 Oct 2020 18:01:45 +0000
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

On Sat, Oct 24, 2020 at 08:48:07AM +0100, Christoph Hellwig wrote:
> On Fri, Oct 23, 2020 at 03:20:05PM -0300, Jason Gunthorpe wrote:
> > The problem is we have RDMA drivers that assume SGL's have a valid
> > struct page, and these hacky/wrong P2P sgls that DMABUF creates cannot
> > be passed into those drivers.
> 
> RDMA drivers do not assume scatterlist have a valid struct page,
> scatterlists are defined to have a valid struct page.  Any scatterlist
> without a struct page is completely buggy.

It is not just having the struct page, it needs to be a CPU accessible
one for memcpy/etc. They aren't correct with the
MEMORY_DEVICE_PCI_P2PDMA SGLs either.

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
