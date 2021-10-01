Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 927F041F000
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 16:52:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D353C6E527;
	Fri,  1 Oct 2021 14:52:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 619C26E527
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 14:52:11 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id d207so9435388qkg.0
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Oct 2021 07:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=RI3Un3whqlEWtr4aJFgQHeUC54CuvGWs6w3DnHGUv/4=;
 b=K55qbiVvd5XkUgYdEETZqf6R/YzC/428DzaLW2tQ1ko0WgHk0e5GqeISXC4mTcYwqh
 UFd6C9JUxe2nybzAsP25tvptN+Y6RaQ+NCnffnNO49sqE1hLj3z5Uw6w0YQFAd4nbEea
 oDOyJIqrPZDj/AC1nGV8aCIYfqOCBF3JErO6HP47SyFJ//VI1Q0Yoi9wz8NCz/yiN6Be
 spTum4L76krjx74lLmNv4MalFbk7YAYa1C9jH8DSsl59JyqT0d0nhZ9R8+D2ubHV7LUG
 7FtkXFWhqpEw2sHwMKMtp3v2vxCejLHIGS9AO5iY+0yD9mrJkQIINWWsLKd+4B7HFvWX
 xDvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RI3Un3whqlEWtr4aJFgQHeUC54CuvGWs6w3DnHGUv/4=;
 b=NY4+Z6wwr1Lp6sO1FnmbjQnUQvKHh6jyh3KHidZPYDDisClNMGmcbEC6YLkjVeMZvX
 co98Hm9U09wJYVCHPZksT+dsYRI73TExvz7t42EhEEmTM3UE4lXtwoc6nAKntjCwGutL
 95GqW8jyMbQNuoRJTc8T+JWXDLMWwBBMguE7LDVkBEUTbTcbAw4giBgehX+mypoMpaTs
 AqaOiH6gg1y4wP09efZttjMfhJJ9IjeKCCF321v6HvTvp0BLiXL1ZV+dVePAYwGoJTNk
 J8NW8IMuUTDOhOssMIz7ZXXUiXcLUjO1VKvgvvd2hQKtIJe1/+x3z5bEcob14UcOiwef
 7ARw==
X-Gm-Message-State: AOAM533aSF3URHh48iIVcRaDHsho49DNv/KJpnv6+8ezs9R9p/33A1XF
 mhzXP/nAZnbMrhIrIfOMMGQDFw==
X-Google-Smtp-Source: ABdhPJzm/G5kJIBn6QfIwm7CMo9R8IxodH1fBoPXgsTIw67OxVDlKvoB7FSYpgEZCvPs9m2+kSO18w==
X-Received: by 2002:a37:a391:: with SMTP id m139mr9826820qke.186.1633099930416; 
 Fri, 01 Oct 2021 07:52:10 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.129])
 by smtp.gmail.com with ESMTPSA id q14sm3633839qtw.82.2021.10.01.07.52.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 07:52:10 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1mWJtR-008cux-FC; Fri, 01 Oct 2021 11:52:09 -0300
Date: Fri, 1 Oct 2021 11:52:09 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Oded Gabbay <ogabbay@kernel.org>
Cc: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Gal Pressman <galpress@amazon.com>,
 Yossi Leybovich <sleybo@amazon.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 linux-rdma <linux-rdma@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Doug Ledford <dledford@redhat.com>, Dave Airlie <airlied@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Leon Romanovsky <leonro@nvidia.com>, Christoph Hellwig <hch@lst.de>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Tomer Tayar <ttayar@habana.ai>
Subject: Re: [PATCH v6 2/2] habanalabs: add support for dma-buf exporter
Message-ID: <20211001145209.GP3544071@ziepe.ca>
References: <20210912165309.98695-1-ogabbay@kernel.org>
 <20210912165309.98695-3-ogabbay@kernel.org>
 <20210928173621.GG3544071@ziepe.ca>
 <CAFCwf10z-baRm8c-UD_=jcZYD0VAGrMiNo7Q5Fm-2txYmVWGcQ@mail.gmail.com>
 <CAFCwf110SPfqpjKO7e2W-MSs6iSdecCwS6CwKx4cL-DjqriT2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFCwf110SPfqpjKO7e2W-MSs6iSdecCwS6CwKx4cL-DjqriT2Q@mail.gmail.com>
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

On Thu, Sep 30, 2021 at 03:46:35PM +0300, Oded Gabbay wrote:

> After reading the kernel iommu code, I think this is not relevant
> here, and I'll add a comment appropriately but I'll also write it
> here, and please correct me if my understanding is wrong.
> 
> The memory behind this specific dma-buf has *always* resided on the
> device itself, i.e. it lives only in the 'device' domain (after all,
> it maps a PCI bar address which points to the device memory).
> Therefore, it was never in the 'CPU' domain and hence, there is no
> need to perform a sync of the memory to the CPU's cache, as it was
> never inside that cache to begin with.
> 
> This is not the same case as with regular memory which is dma-mapped
> and then copied into the device using a dma engine. In that case,
> the memory started in the 'CPU' domain and moved to the 'device'
> domain. When it is unmapped it will indeed be recycled to be used
> for another purpose and therefore we need to sync the CPU cache.
> 
> Is my understanding correct ?

It makes sense to me

Jason
