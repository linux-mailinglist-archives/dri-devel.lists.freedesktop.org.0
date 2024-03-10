Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FF687769F
	for <lists+dri-devel@lfdr.de>; Sun, 10 Mar 2024 13:42:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8731110E12C;
	Sun, 10 Mar 2024 12:41:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Hn884P6N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68A2810E12C
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Mar 2024 12:41:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 564F8CE0ACC;
 Sun, 10 Mar 2024 12:41:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DD6CC433F1;
 Sun, 10 Mar 2024 12:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710074510;
 bh=T2hnsj3TXxdQauhbrydhvVMlAp4FlGMF27ltKRC1xko=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Hn884P6NYCntbYCwhViso8xYitvz/SDSeAYZDfK/+/NNFWBfgkkuxX3gzjYVAT4X2
 75YA8TLBgLTHDzXhVe9CfMjGsat0po8S88pq9OfxKLhWElwY7q8w398qcNRr7wwN5g
 L5w8HVcrSrqFvtdBU1pSnG4cz71f0xxJMCuP9M5TjxD/GmmO3G4A3kP2ex7IuhABAK
 uY76WFjb0LdEG8cy+J2DWRuRgFQhs8QF02ONHzFh4Uhfm5xBQ569mHBp6as4id/fWy
 eCUPv+d/UamjMG0dqiKxynXZjHK2WenzLrZnNFt0PLWrVd3K/mhz/nx/8KLipkUqLE
 tljcQNovP1rgw==
Date: Sun, 10 Mar 2024 12:41:33 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Jonathan
 Corbet <corbet@lwn.net>, Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul
 <vkoul@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, Nuno Sa
 <nuno.sa@analog.com>, Michael Hennerich <michael.hennerich@analog.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v8 0/6] iio: new DMABUF based API
Message-ID: <20240310124133.683e8853@jic23-huawei>
In-Reply-To: <20240308170046.92899-1-paul@crapouillou.net>
References: <20240308170046.92899-1-paul@crapouillou.net>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri,  8 Mar 2024 18:00:40 +0100
Paul Cercueil <paul@crapouillou.net> wrote:

> Hi Jonathan,
> 
> Here's the final(tm) version of the IIO DMABUF patchset.
> 
> This v8 fixes the remaining few issues that Christian reported.
> 
> I also updated the documentation patch as there has been changes to
> index.rst.
> 
> This was based on next-20240308.
> 
> Changelog:
> 
> - [3/6]:
>     - Fix swapped fence direction
>     - Simplify fence wait mechanism
>     - Remove "Buffer closed with active transfers" print, as it was dead
>       code
>     - Un-export iio_buffer_dmabuf_{get,put}. They are not used anywhere
>       else so they can even be static.
>     - Prevent attaching already-attached DMABUFs
> - [6/6]:
>     Renamed dmabuf_api.rst -> iio_dmabuf_api.rst, and updated index.rst
>     whose format changed in iio/togreg.
> 
> Cheers,
> -Paul
Given nature of the build bug issues reported, I'm guessing you never
built this as a module :(  Not sure how one instance of a missing 
user marking got through but also easy to fix.

Anyhow, no need to wait before sending a v9 with those sorted.

0-day does it's job again - even better is that it's whilst it's
still your problem and not mine :)

Jonathan

> 
> Paul Cercueil (6):
>   dmaengine: Add API function dmaengine_prep_peripheral_dma_vec()
>   dmaengine: dma-axi-dmac: Implement device_prep_peripheral_dma_vec
>   iio: core: Add new DMABUF interface infrastructure
>   iio: buffer-dma: Enable support for DMABUFs
>   iio: buffer-dmaengine: Support new DMABUF based userspace API
>   Documentation: iio: Document high-speed DMABUF based API
> 
>  Documentation/iio/iio_dmabuf_api.rst          |  54 ++
>  Documentation/iio/index.rst                   |   1 +
>  drivers/dma/dma-axi-dmac.c                    |  40 ++
>  drivers/iio/buffer/industrialio-buffer-dma.c  | 181 ++++++-
>  .../buffer/industrialio-buffer-dmaengine.c    |  59 ++-
>  drivers/iio/industrialio-buffer.c             | 462 ++++++++++++++++++
>  include/linux/dmaengine.h                     |  27 +
>  include/linux/iio/buffer-dma.h                |  31 ++
>  include/linux/iio/buffer_impl.h               |  30 ++
>  include/uapi/linux/iio/buffer.h               |  22 +
>  10 files changed, 890 insertions(+), 17 deletions(-)
>  create mode 100644 Documentation/iio/iio_dmabuf_api.rst
> 

