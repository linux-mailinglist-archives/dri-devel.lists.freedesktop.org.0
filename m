Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2544AF1A0
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 13:30:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5272D10E3F1;
	Wed,  9 Feb 2022 12:30:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 031C310E3F1
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 12:29:58 +0000 (UTC)
Received: by mail-qv1-xf36.google.com with SMTP id k4so1591063qvt.6
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 04:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=JpFYQSMAVe6I09BHQOjAX13imKhzUaXlc2+fdsD9V6E=;
 b=Z4Eu786ojGcRgS8Eos4sLr66z2Uqqmgi/bDj6/Y33EEsvVWVKeCNJioyDR9vfy9xaY
 yz3EOxCOZS/4g/fgKsh1/TNwzJVTuJBYxARJaHsw7OoHQBYA7L/O3QtbTl8+Tpf3u32c
 Go3MoLTkH16938QXNFcpZV2qsCQ+/yOIxJO8+ooqAbmuC9zUdvg0Bg4KHC7DQZrRu5Pr
 MEV4AdWysZ66pZX4YRzJgy6PJ/mfwT6AapS6FtqHr95tVUvZ/ng6ysJBJp+d6N+bSxfV
 V5qGUskZ4AiQdRAYVMO4Llk3dzOmsNqH1liuPvseANE5HTBFUWXt5H7TVNAa03BHV8C3
 wh9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JpFYQSMAVe6I09BHQOjAX13imKhzUaXlc2+fdsD9V6E=;
 b=d8sez69msLRhGns6R+F6+/4lPZ6ZG+71pcgS5nnfFv/JiZhT41MjXdV/0KZxOPXbiU
 SiAAd0v+JtY5X0IsDIrLT1+BICxGlsBk7sRb0GsngrhwpTG+8vPqVwvF8/niyNeD960K
 3ZY49jUzPYHeUjo2LE88KgzdsNyQc+ECMeg0m5cFsn2THMW+miNy6mW5m+Zb5v26DeyH
 32hU1gqVhsReQvqAbc0tqNUiQp9NpLH5Kz6y39d3ewLltd7P3ara9Efdn28BtT9tT4GE
 Q0jaBwUAtaUxHP8ZJ/SmKKG6N1o6VHfNjwarA1v9oKwKhj8sYCa8ITHbTFdYzNqGWnnq
 2T1g==
X-Gm-Message-State: AOAM530DeJBhp1+EVkAmFyxt2siTtLlwsMt0FQcShnYicyM2triQsMky
 JXdf2scw85v1OHMaPH/YxUyxQw==
X-Google-Smtp-Source: ABdhPJwf9mdnK2ldlbFJ89Gp7ICZZlJoeyugDA0YNF0idT1dfs12KR4knXDFD3wj+Sh7mIvt9ShqvQ==
X-Received: by 2002:a05:6214:21ac:: with SMTP id
 t12mr1263884qvc.123.1644409797997; 
 Wed, 09 Feb 2022 04:29:57 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.129])
 by smtp.gmail.com with ESMTPSA id w13sm8052274qkb.106.2022.02.09.04.29.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 04:29:57 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1nHm6e-001DJi-6l; Wed, 09 Feb 2022 08:29:56 -0400
Date: Wed, 9 Feb 2022 08:29:56 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 7/8] mm: remove the extra ZONE_DEVICE struct page refcount
Message-ID: <20220209122956.GI49147@ziepe.ca>
References: <20220207063249.1833066-1-hch@lst.de>
 <20220207063249.1833066-8-hch@lst.de>
 <CAPcyv4h_axDTmkZ35KFfCdzMoOp8V3dc6btYGq6gCj1OmLXM=g@mail.gmail.com>
 <20220209062345.GB7739@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220209062345.GB7739@lst.de>
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
Cc: Linux NVDIMM <nvdimm@lists.linux.dev>,
 Ralph Campbell <rcampbell@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org,
 Felix Kuehling <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Linux MM <linux-mm@kvack.org>, Ben Skeggs <bskeggs@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Dan Williams <dan.j.williams@intel.com>, Logan Gunthorpe <logang@deltatee.com>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 09, 2022 at 07:23:45AM +0100, Christoph Hellwig wrote:
> On Tue, Feb 08, 2022 at 07:30:11PM -0800, Dan Williams wrote:
> > Interesting. I had expected that to really fix the refcount problem
> > that fs/dax.c would need to start taking real page references as pages
> > were added to a mapping, just like page cache.
> 
> I think we should do that eventually.  But I think this series that
> just attacks the device private type and extends to the device coherent
> and p2p enhacements is a good first step to stop the proliferation of
> the one off refcount and to allow to deal with the fsdax pages in another
> more focuessed series.

It is nice, but the other series are still impacted by the fsdax mess
- they still stuff pages into ptes without proper refcounts and have
to carry nonsense to dance around this problem.

I certainly would be unhappy if the amd driver, for instance, gained
the fsdax problem as well and started pushing 4k pages into PMDs.

Jason
