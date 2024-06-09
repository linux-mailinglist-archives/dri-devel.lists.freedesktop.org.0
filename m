Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 744A090156A
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jun 2024 11:59:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ECCF10E099;
	Sun,  9 Jun 2024 09:59:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SUsxWfKD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B643C10E099
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Jun 2024 09:59:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 87C3761E2D;
 Sun,  9 Jun 2024 09:59:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8389C2BD10;
 Sun,  9 Jun 2024 09:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717927176;
 bh=ZTNgbFcLomcG6cpe2haGjWOTw7BlkgzB0g3ZWexUBPg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SUsxWfKDwq9uaDBZLEK9BO1+qDdiuCsJlTzwxXZUZzuY1WK9NlYBeiOT7909A+4bQ
 0QzRcgCBUPMCOGlp26CgYVY5HcN1KUJTpY6oRcoqr2Ti9I8GXv1fvbSEtYDmvIStvA
 u9QV3W4AGxsPvXV8LqptOQEFbzp79cNu/ZaR/3GjPKvoO0cK+0rnU8WyJJCFT02eS+
 rSKMLjfSd2BKtI1VE221Kg0oaFofgCQNznOvbHzgJjoRr3a5PLrG9uqGYy/zC9Rf4R
 X6Ch6wAd8uOaXMOt4YgPs9Xz3snZhuu0undsBf8oDtnyz7llZGasXvqnFZjPvbZJri
 xtcFMxxSpbOSg==
Date: Sun, 9 Jun 2024 10:58:53 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Jonathan Corbet <corbet@lwn.net>, Nuno Sa
 <nuno.sa@analog.com>, linux-iio@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v10 0/6] iio: new DMABUF based API v10
Message-ID: <20240609105853.54d01475@jic23-huawei>
In-Reply-To: <20240605110845.86740-1-paul@crapouillou.net>
References: <20240605110845.86740-1-paul@crapouillou.net>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.42; x86_64-pc-linux-gnu)
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

On Wed,  5 Jun 2024 13:08:39 +0200
Paul Cercueil <paul@crapouillou.net> wrote:

> Hi Jonathan,
> 
> Here is a revised (and hopefully final?) version of my DMABUF patchset.

Fingers crossed it's just docs changes for v11.

So on to the details of how to merge this...
For the DMAEngine maintainers:
Given IIO changes dominate this series it makes sense for me to pick it up
through IIO.

Do you want an immutable branch with the first patch on it, or is this
unlikely to cause merge conflicts with any other ongoing work in dmabuffer
land?

I'm fine either way and if I don't hear back on this will do an immutable
branch and announce it when I apply v11 (I hope!)

Jonathan

> 
> This v10 removes the extra "flags" parameter of
> dmaengine_prep_peripheral_dma_vec(), and adds kernel doc to the function
> as Vinod requested.
> 
> As Nuno upstreamed support for output buffers, I (slightly) modified
> patch 5/6 and now output buffers are supported with the DMABUF API.
> All I did was remove a "fail if output" check really.
> 
> This was based on next-20240605.
> 
> Changelog:
> - [1/6]:
>   - Add kernel doc to dmaengine_prep_peripheral_dma_vec()
>   - Remove extra flags parameter
> - [2/6]:
>   - Use the new function prototype (without the extra prep_flags).
> - [5/6]:
>   - Remove extra flags parameter to dmaengine_prep_peripheral_dma_vec()
>   - Add support for TX transfers
> 
> Cheers,
> -Paul
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
>  drivers/iio/Kconfig                           |   1 +
>  drivers/iio/buffer/industrialio-buffer-dma.c  | 180 ++++++-
>  .../buffer/industrialio-buffer-dmaengine.c    |  62 ++-
>  drivers/iio/industrialio-buffer.c             | 462 ++++++++++++++++++
>  include/linux/dmaengine.h                     |  33 ++
>  include/linux/iio/buffer-dma.h                |  31 ++
>  include/linux/iio/buffer_impl.h               |  30 ++
>  include/uapi/linux/iio/buffer.h               |  22 +
>  11 files changed, 896 insertions(+), 20 deletions(-)
>  create mode 100644 Documentation/iio/iio_dmabuf_api.rst
> 

