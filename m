Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BDDAF5F7A
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 19:08:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30A1F10E06B;
	Wed,  2 Jul 2025 17:08:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ne6mhWW5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 170C410E06B
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jul 2025 17:08:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CEEA64483C;
 Wed,  2 Jul 2025 17:08:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08F52C4CEED;
 Wed,  2 Jul 2025 17:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751476097;
 bh=sl+L6c54S4JFvlxl6rBTBhnWpBiz19X6BE8lx/bDcPg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ne6mhWW5/ruaxicHzkogiUibQWjbCGTAI+my3l4pVqB15UOy1fW6nLHm9mZROYlDa
 PzWhevJsY4UJj9sCUNIj6dJJ7cZKFn6XiIecaEgHCVZZwbtgB0ixXgVhMM+ak/sDyy
 Jma4GMusJQ1DbYwp13XD+6jkWW88Cd3y5UhC/Lt/O/nq9DrCRkisDhza0XHFhsRmMB
 WISjBHieLagyhTV5XYWNtUMwUKHYmaTaC4C1Tq2h1MSDUfJAjFu4ZV+t640sDopXwC
 a2HSyzYZk0lBNN1sHlKHp9oM3CybVJvSzzjlpdk7eTclBXjeZ1+qtmcG0pI4kAXxxF
 uukyrWgcQ6IfA==
Date: Wed, 2 Jul 2025 19:08:13 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: =?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clement.legoffic@foss.st.com>
Cc: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 M'boumba Cedric Madianga <cedric.madianga@gmail.com>, 
 Wolfram Sang <wsa@kernel.org>, Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
 linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v3 2/3] i2c: stm32f7: unmap DMA mapped buffer
Message-ID: <zp3pagbojmu67o4sjm65a44ovvui5uvybs32nayvhtewfbm4el@n5lro4v5iq36>
References: <20250630-i2c-upstream-v3-0-7a23ab26683a@foss.st.com>
 <20250630-i2c-upstream-v3-2-7a23ab26683a@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250630-i2c-upstream-v3-2-7a23ab26683a@foss.st.com>
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

Hi Clement,

On Mon, Jun 30, 2025 at 02:55:14PM +0200, Clément Le Goffic wrote:
> Fix an issue where the mapped DMA buffer was not unmapped.

"Fix an issue..." is too generic. Can you be more specific? Where
was it mapped? Where was it left unmapped?

Please, do consider that the user needs to understand what
happens in the patch without needing to look into the patch.

> Fixes: 7ecc8cfde553 ("i2c: i2c-stm32f7: Add DMA support")
> Acked-by: Alain Volmat <alain.volmat@foss.st.com>
> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
> ---
>  drivers/i2c/busses/i2c-stm32f7.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> index e4aaeb2262d0..042386b4cabe 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -1554,6 +1554,8 @@ static irqreturn_t stm32f7_i2c_handle_isr_errs(struct stm32f7_i2c_dev *i2c_dev,
>  	if (i2c_dev->use_dma) {
>  		stm32f7_i2c_disable_dma_req(i2c_dev);
>  		dmaengine_terminate_async(dma->chan_using);
> +		dma_unmap_single(i2c_dev->dev, dma->dma_buf, dma->dma_len,
> +				 dma->dma_data_dir);
>  	}
>  
>  	i2c_dev->master_mode = false;
> @@ -1622,6 +1624,8 @@ static irqreturn_t stm32f7_i2c_isr_event_thread(int irq, void *data)
>  		if (i2c_dev->use_dma) {
>  			stm32f7_i2c_disable_dma_req(i2c_dev);
>  			dmaengine_terminate_async(dma->chan_using);
> +			dma_unmap_single(i2c_dev->dev, dma->dma_buf, dma->dma_len,
> +					 dma->dma_data_dir);
>  		}
>  		f7_msg->result = -ENXIO;
>  	}
> @@ -1642,6 +1646,8 @@ static irqreturn_t stm32f7_i2c_isr_event_thread(int irq, void *data)
>  				dev_dbg(i2c_dev->dev, "<%s>: Timed out\n", __func__);
>  				stm32f7_i2c_disable_dma_req(i2c_dev);
>  				dmaengine_terminate_async(dma->chan_using);
> +				dma_unmap_single(i2c_dev->dev, dma->dma_buf, dma->dma_len,
> +						 dma->dma_data_dir);

Can't we use the dma_callback here, or similar? I see some
similar patterns and I think the code can be improved.

Andi

>  				f7_msg->result = -ETIMEDOUT;
>  			}
>  		}
> 
> -- 
> 2.43.0
> 
