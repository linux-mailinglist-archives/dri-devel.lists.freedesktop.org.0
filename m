Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A03E34583E7
	for <lists+dri-devel@lfdr.de>; Sun, 21 Nov 2021 14:53:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80A48892E0;
	Sun, 21 Nov 2021 13:53:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5386B6E8E2
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Nov 2021 13:53:04 +0000 (UTC)
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3F99F603E8;
 Sun, 21 Nov 2021 13:53:01 +0000 (UTC)
Date: Sun, 21 Nov 2021 13:57:55 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 00/15] iio: buffer-dma: write() and new DMABUF based API
Message-ID: <20211121135755.3c012b24@jic23-huawei>
In-Reply-To: <20211115141925.60164-1-paul@crapouillou.net>
References: <20211115141925.60164-1-paul@crapouillou.net>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Alexandru Ardelean <ardeleanalex@gmail.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 15 Nov 2021 14:19:10 +0000
Paul Cercueil <paul@crapouillou.net> wrote:

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

I'm going to defer to others for the discussion of whether dmabuf is
the right way to do this. I look forwards to some conclusions.
Much like yourselves, I want to see 'a' way of doing this but I'm
not knowledgeable enough about the quirks and corner cases of the
different options to offer a strong opinion.

Either way, it's great to get that discussion going and it would never
have happened without having actual code so thanks for doing this!

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

Given it reflects a sign off given back then I think it's fine to
leave them as analog.com but maybe he can give an Acked-by: on a different
email address to reflect that he is happy for these to go forwards.

It's far from unusual to have out of date email addresses in sign offs
given often code is coming out of trees many years after someone
originally wrote it for a vendor tree or similar.  Whilst not a lawyer
I don't think that's a problem.

Jonathan

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

