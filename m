Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A77C450731
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 15:37:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E86D6EAC7;
	Mon, 15 Nov 2021 14:37:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B24156EAC7
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 14:37:20 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id m20so27070216edc.5
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 06:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=XiioWyqrq1D1dF9ZTugSJzsFvT/FPXCXiHcWrTggW1A=;
 b=FLdgxwJMdDUlwR0XKZUGvkuM2MNDSQ4GskVPXHQWieDno5xyhAkQ/RY6avWmujJ9BR
 OjFK/wuJ5u0TGea1y4NcILj+0ZBLckYJFooRvADUDIPpG12CBSoYlD1JXYloPbk/zK4c
 OX1wlFQSE1qbbROjeihgOQJAJ/lfWJLFcbRGw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=XiioWyqrq1D1dF9ZTugSJzsFvT/FPXCXiHcWrTggW1A=;
 b=mJwH89OhGhJDsIEOCygy5FJGlbKRH1G7fCIe0eKa9eXmithUPsjgXarikQfgQkZDNf
 aLhvlSbqCLzcQOqLpPQ5JJlMKR3k3B5ojY52GjR7YW1UjL6rYVF0f20ABIvMQFFe6FS9
 BJQzgaMMUzm2n4sUzXcasGX/T6iCSGb7v2uo+SjsODW489muBxTvc1/dMHAHWeenrOK+
 tWEfm1UkJV/aQK9gW7ezr7yxgnJns55Mc7ghCFmhHub8ZZIEqD8CZ/PkHVywFOFtCUfa
 AujApa/rJktBHpukEDWvYtQpeVLY+2NNJXJxL11WYoXWWnEYwqhGX0RNzIcRujCLOReH
 /UBg==
X-Gm-Message-State: AOAM530LWEDSVAgn+vxwKjI5iAhiCMGRvZU1juu5ZZpSHBQTiJiOHjB3
 yFLFbAlvetdIKdSEVtWKnwJ30W54Z/3MBA==
X-Google-Smtp-Source: ABdhPJxXT/JTqH/P5/5MlVaHqEvS+WUgUgsUsgOfhK+nTHEXsPIZlCeVRsLARxXY95P+DTZWZPXr6g==
X-Received: by 2002:aa7:c155:: with SMTP id r21mr21275479edp.124.1636987039311; 
 Mon, 15 Nov 2021 06:37:19 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id kw10sm6507786ejc.71.2021.11.15.06.37.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 06:37:18 -0800 (PST)
Date: Mon, 15 Nov 2021 15:37:16 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 00/15] iio: buffer-dma: write() and new DMABUF based API
Message-ID: <YZJwnPbgCOdeKq6S@phenom.ffwll.local>
Mail-Followup-To: Paul Cercueil <paul@crapouillou.net>,
 Jonathan Cameron <jic23@kernel.org>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org,
 Alexandru Ardelean <ardeleanalex@gmail.com>,
 linux-media@vger.kernel.org
References: <20211115141925.60164-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211115141925.60164-1-paul@crapouillou.net>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Michael Hennerich <Michael.Hennerich@analog.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Alexandru Ardelean <ardeleanalex@gmail.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Jonathan Cameron <jic23@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 15, 2021 at 02:19:10PM +0000, Paul Cercueil wrote:
> Hi Jonathan,
> 
> This patchset introduces a new userspace interface based on DMABUF
> objects, to complement the existing fileio based API.
> 
> The advantage of this DMABUF based interface vs. the fileio
> interface, is that it avoids an extra copy of the data between the
> kernel and userspace. This is particularly userful for high-speed
> devices which produce several megabytes or even gigabytes of data per
> second.
> 
> The first few patches [01/15] to [03/15] are not really related, but
> allow to reduce the size of the patches that introduce the new API.
> 
> Patch [04/15] to [06/15] enables write() support to the buffer-dma
> implementation of the buffer API, to continue the work done by
> Mihail Chindris.
> 
> Patches [07/15] to [12/15] introduce the new DMABUF based API.
> 
> Patches [13/15] and [14/15] add support for cyclic buffers, only through
> the new API. A cyclic buffer will be repeated on the output until the
> buffer is disabled.
> 
> Patch [15/15] adds documentation about the new API.
> 
> For now, the API allows you to alloc DMABUF objects and mmap() them to
> read or write the samples. It does not yet allow to import DMABUFs
> parented to other subsystems, but that should eventually be possible
> once it's wired.
> 
> This patchset is inspired by the "mmap interface" that was previously
> submitted by Alexandru Ardelean and Lars-Peter Clausen, so it would be
> great if I could get a review from you guys. Alexandru's commit was
> signed with his @analog.com address but he doesn't work at ADI anymore,
> so I believe I'll need him to sign with a new email.

Why dma-buf? dma-buf looks like something super generic and useful, until
you realize that there's a metric ton of gpu/accelerator bagage piled in.
So unless buffer sharing with a gpu/video/accel/whatever device is the
goal here, and it's just for a convenient way to get at buffer handles,
this doesn't sound like a good idea.

Also if the idea is to this with gpus/accelerators then I'd really like to
see the full thing, since most likely at that point you also want
dma_fence. And once we talk dma_fence things get truly horrible from a
locking pov :-( Or well, just highly constrained and I get to review what
iio is doing with these buffers to make sure it all fits.

Cheers, Daniel

> 
> Cheers,
> -Paul
> 
> Alexandru Ardelean (1):
>   iio: buffer-dma: split iio_dma_buffer_fileio_free() function
> 
> Paul Cercueil (14):
>   iio: buffer-dma: Get rid of incoming/outgoing queues
>   iio: buffer-dma: Remove unused iio_buffer_block struct
>   iio: buffer-dma: Use round_down() instead of rounddown()
>   iio: buffer-dma: Enable buffer write support
>   iio: buffer-dmaengine: Support specifying buffer direction
>   iio: buffer-dmaengine: Enable write support
>   iio: core: Add new DMABUF interface infrastructure
>   iio: buffer-dma: Use DMABUFs instead of custom solution
>   iio: buffer-dma: Implement new DMABUF based userspace API
>   iio: buffer-dma: Boost performance using write-combine cache setting
>   iio: buffer-dmaengine: Support new DMABUF based userspace API
>   iio: core: Add support for cyclic buffers
>   iio: buffer-dmaengine: Add support for cyclic buffers
>   Documentation: iio: Document high-speed DMABUF based API
> 
>  Documentation/driver-api/dma-buf.rst          |   2 +
>  Documentation/iio/dmabuf_api.rst              |  94 +++
>  Documentation/iio/index.rst                   |   2 +
>  drivers/iio/adc/adi-axi-adc.c                 |   3 +-
>  drivers/iio/buffer/industrialio-buffer-dma.c  | 670 ++++++++++++++----
>  .../buffer/industrialio-buffer-dmaengine.c    |  42 +-
>  drivers/iio/industrialio-buffer.c             |  49 ++
>  include/linux/iio/buffer-dma.h                |  43 +-
>  include/linux/iio/buffer-dmaengine.h          |   5 +-
>  include/linux/iio/buffer_impl.h               |   8 +
>  include/uapi/linux/iio/buffer.h               |  30 +
>  11 files changed, 783 insertions(+), 165 deletions(-)
>  create mode 100644 Documentation/iio/dmabuf_api.rst
> 
> -- 
> 2.33.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
