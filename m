Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB78F901564
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jun 2024 11:56:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE19710E17D;
	Sun,  9 Jun 2024 09:55:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Vh4rp+nY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51DC010E17D
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Jun 2024 09:55:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 67215CE0B3E;
 Sun,  9 Jun 2024 09:55:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 331BCC2BD10;
 Sun,  9 Jun 2024 09:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717926953;
 bh=J3+LkAlthj2AJZLov9TBAoYftU77dGSFi6J0sALU0co=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Vh4rp+nYjUUgM1+TcsBri2M5y1fvrGCXzGe1V+fo6MKCK7rJqsTLooYlf65NCjVvt
 Tt9m3WeDWASFpGNXmjb+rs3eHqJn0RbGDc7ct4c1lAnocGLbGO1mNyycpM6DDVfO1A
 JeK4MbJisCPaj+nU3ayutUVe9FG1kyr4Jfd6kKDSUl6zrRjcgj8qK67oEjwmCoxIUK
 1anrNBYEO/rzthGsyH0348ZLzBWlrqQpH7kfnsRkVy+fPsxegcic5G7VnH9hvMGgJu
 K41rX/QAmAH4t2kwexgm09vL3cgBuu/GvkzWZKe4axa5KScy2nlGDfRI7BgaWhqciu
 0MgiMFDAimjQw==
Date: Sun, 9 Jun 2024 10:55:01 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Jonathan Corbet <corbet@lwn.net>, Nuno Sa
 <nuno.sa@analog.com>, linux-iio@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v10 4/6] iio: buffer-dma: Enable support for DMABUFs
Message-ID: <20240609105501.0f836684@jic23-huawei>
In-Reply-To: <20240605110845.86740-5-paul@crapouillou.net>
References: <20240605110845.86740-1-paul@crapouillou.net>
 <20240605110845.86740-5-paul@crapouillou.net>
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

On Wed,  5 Jun 2024 13:08:43 +0200
Paul Cercueil <paul@crapouillou.net> wrote:

> Implement iio_dma_buffer_attach_dmabuf(), iio_dma_buffer_detach_dmabuf()
> and iio_dma_buffer_transfer_dmabuf(), which can then be used by the IIO
> DMA buffer implementations.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Signed-off-by: Nuno Sa <nuno.sa@analog.com>
> 
Same thing on SoB.
Also another missing structure field related docs comment inline.

> diff --git a/include/linux/iio/buffer-dma.h b/include/linux/iio/buffer-dma.h
> index 6e27e47077d5..e54158e53fd6 100644
> --- a/include/linux/iio/buffer-dma.h
> +++ b/include/linux/iio/buffer-dma.h
> @@ -7,6 +7,7 @@
>  #ifndef __INDUSTRIALIO_DMA_BUFFER_H__
>  #define __INDUSTRIALIO_DMA_BUFFER_H__
>  
> +#include <linux/atomic.h>
>  #include <linux/list.h>
>  #include <linux/kref.h>
>  #include <linux/spinlock.h>
> @@ -16,6 +17,9 @@
>  struct iio_dma_buffer_queue;
>  struct iio_dma_buffer_ops;
>  struct device;
> +struct dma_buf_attachment;
> +struct dma_fence;
> +struct sg_table;
>  
>  /**
>   * enum iio_block_state - State of a struct iio_dma_buffer_block
> @@ -41,6 +45,8 @@ enum iio_block_state {
>   * @queue: Parent DMA buffer queue
>   * @kref: kref used to manage the lifetime of block
>   * @state: Current state of the block
> + * @cyclic: True if this is a cyclic buffer
> + * @fileio: True if this buffer is used for fileio mode

kernel doc needs to be complete. So missing attach, sg_table and fence.

>   */
>  struct iio_dma_buffer_block {
>  	/* May only be accessed by the owner of the block */
> @@ -63,6 +69,14 @@ struct iio_dma_buffer_block {
>  	 * queue->list_lock if the block is not owned by the core.
>  	 */
>  	enum iio_block_state state;
> +
> +	bool cyclic;
> +	bool fileio;
> +
> +	struct dma_buf_attachment *attach;
> +	struct sg_table *sg_table;
> +
> +	struct dma_fence *fence;
>  };
