Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 381846551AC
	for <lists+dri-devel@lfdr.de>; Fri, 23 Dec 2022 15:54:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5112110E1AD;
	Fri, 23 Dec 2022 14:54:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8575910E1AD
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Dec 2022 14:54:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9FE0C61031;
 Fri, 23 Dec 2022 14:54:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70414C433EF;
 Fri, 23 Dec 2022 14:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1671807280;
 bh=cSy0mW+JcTGb7wHmP//5AEf5hO9OkLMlS2Uwg9AqFDc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gX5Y35IKQGdNunDgzb61X+D8dOY93c74L5LknWjdD5pCpgadFrpFyVtU4rvB0RlrQ
 ZnZNwY2E1QprEiZCKqBLfE5KtLSI+rfB2HzIreroor7O2mDD4qFaXHOcvIMDqJGRwL
 FErdqywfeKrilpUbIcjoopCPLFlOle5jGZXefO5s=
Date: Fri, 23 Dec 2022 15:54:37 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Subject: Re: [PATCH v3] usb: gadget: aspeed_udc: Add check for
 dma_alloc_coherent
Message-ID: <Y6XBLcTGUp/2ta9i@kroah.com>
References: <20221215123112.20553-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221215123112.20553-1-jiasheng@iscas.ac.cn>
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
Cc: linux-aspeed@lists.ozlabs.org, andrew@aj.id.au, neal_liu@aspeedtech.com,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, sumit.semwal@linaro.org,
 linaro-mm-sig@lists.linaro.org, joel@jms.id.au, christian.koenig@amd.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 15, 2022 at 08:31:12PM +0800, Jiasheng Jiang wrote:
> Add the check for the return value of dma_alloc_coherent in order to
> avoid NULL pointer dereference.
> 
> This flaw was found using an experimental static analysis tool we are
> developing, APP-Miner, which has not been disclosed.
> 
> The allyesconfig build using GCC 9.3.0 shows no new warning. As we
> don't have a UDC device to test with, no runtime testing was able to
> be performed.
> 
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> ---
> Changelog:
> 
> v2 -> v3:
> 
> 1. Add information of finding tool and tests to commit message.
> 
> v1 -> v2:
> 
> 1. Add "goto err;" when allocation fails.
> ---
>  drivers/usb/gadget/udc/aspeed_udc.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/gadget/udc/aspeed_udc.c b/drivers/usb/gadget/udc/aspeed_udc.c
> index 01968e2167f9..7dc2457c7460 100644
> --- a/drivers/usb/gadget/udc/aspeed_udc.c
> +++ b/drivers/usb/gadget/udc/aspeed_udc.c
> @@ -1516,6 +1516,10 @@ static int ast_udc_probe(struct platform_device *pdev)
>  					  AST_UDC_EP_DMA_SIZE *
>  					  AST_UDC_NUM_ENDPOINTS,
>  					  &udc->ep0_buf_dma, GFP_KERNEL);
> +	if (!udc->ep0_buf) {
> +		rc = -ENOMEM;
> +		goto err;
> +	}
>  
>  	udc->gadget.speed = USB_SPEED_UNKNOWN;
>  	udc->gadget.max_speed = USB_SPEED_HIGH;
> -- 
> 2.25.1
> 

Why is this just a duplicate of the patch previously submitted here:
	https://lore.kernel.org/r/20221125092833.74822-1-yuancan@huawei.com

confused,

greg k-h
