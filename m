Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 902124E9D54
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 19:20:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C09410E22F;
	Mon, 28 Mar 2022 17:20:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A38610E22F
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 17:20:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0CE4660A14;
 Mon, 28 Mar 2022 17:20:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8814FC340F0;
 Mon, 28 Mar 2022 17:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648488033;
 bh=A1cAETogMKE4ByDJveM04ydwDhQNcj7ZVpXQPOMQvQs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Xo72ByilWB92HDWNLTtqY4spp9AeXbHk/lIMpcKvTCxuvJxK1agcIrDcJBMcU6ONQ
 OrLQiIJfvQPszkZlORSVD3EBxVv/cFKt8DY6Ecuol75mzJVFKWimAm1a15lLoiZaGX
 +c9kaiRQumyv3W7d3B9qxnUKyUYK2Pq8MWmO7I7G+pizhBkaIuGU0zxdvKFUPRKwj6
 ENJmUDd4XO5Dt8OmtPJKEbWa+i5oe/81Ztqx4H2JJv9JcoHbyMpl4mBXkagDw2e+AM
 gYKHLx3m8AUjySN4AstB8l57w4Yw5yLC1QvgB4DBODe4Oe77EmR0B05aYzPT9v4MTN
 39NFS0/Be9MIQ==
Date: Mon, 28 Mar 2022 18:28:08 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 04/12] iio: buffer-dmaengine: Enable write support
Message-ID: <20220328182808.48e51432@jic23-huawei>
In-Reply-To: <20220207125933.81634-5-paul@crapouillou.net>
References: <20220207125933.81634-1-paul@crapouillou.net>
 <20220207125933.81634-5-paul@crapouillou.net>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
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
Cc: Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-iio@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org, Alexandru Ardelean <ardeleanalex@gmail.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon,  7 Feb 2022 12:59:25 +0000
Paul Cercueil <paul@crapouillou.net> wrote:

> Use the iio_dma_buffer_write() and iio_dma_buffer_space_available()
> functions provided by the buffer-dma core, to enable write support in
> the buffer-dmaengine code.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Reviewed-by: Alexandru Ardelean <ardeleanalex@gmail.com>
This (and previous) look fine to me. Just that question of a user for
the new functionality...

Jonathan

> ---
>  drivers/iio/buffer/industrialio-buffer-dmaengine.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/iio/buffer/industrialio-buffer-dmaengine.c b/drivers/iio/buffer/industrialio-buffer-dmaengine.c
> index ac26b04aa4a9..5cde8fd81c7f 100644
> --- a/drivers/iio/buffer/industrialio-buffer-dmaengine.c
> +++ b/drivers/iio/buffer/industrialio-buffer-dmaengine.c
> @@ -123,12 +123,14 @@ static void iio_dmaengine_buffer_release(struct iio_buffer *buf)
>  
>  static const struct iio_buffer_access_funcs iio_dmaengine_buffer_ops = {
>  	.read = iio_dma_buffer_read,
> +	.write = iio_dma_buffer_write,
>  	.set_bytes_per_datum = iio_dma_buffer_set_bytes_per_datum,
>  	.set_length = iio_dma_buffer_set_length,
>  	.request_update = iio_dma_buffer_request_update,
>  	.enable = iio_dma_buffer_enable,
>  	.disable = iio_dma_buffer_disable,
>  	.data_available = iio_dma_buffer_data_available,
> +	.space_available = iio_dma_buffer_space_available,
>  	.release = iio_dmaengine_buffer_release,
>  
>  	.modes = INDIO_BUFFER_HARDWARE,

