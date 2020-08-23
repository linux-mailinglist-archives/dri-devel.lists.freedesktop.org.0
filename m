Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A9B24F2C5
	for <lists+dri-devel@lfdr.de>; Mon, 24 Aug 2020 08:56:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BDCE6EC68;
	Mon, 24 Aug 2020 06:55:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [81.169.146.165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 783376E4FF;
 Sun, 23 Aug 2020 14:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1598192836;
 s=strato-dkim-0002; d=jm0.eu;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=L5o68Mk/gNAJAspEuiz7HlQLfHv/daYWKiogP75tCx4=;
 b=rMJ5bZJJfYLa11zYiRZhTiGaK1tVLQ4SYrOQkk/tS6NbVybqkEz/iBgy9TL57BzGAf
 2KV6IrUWC+X4is+F5kw7nqyHqdPV5z3Ui/VjxnB9XbKbOEGb3IqOWrpaIVUb1MoUqQLq
 VPjukjsEol4+KHSn8rkrJlHm6IcWRA1DRLYN8qo6lA/aDY5Z0BjzPYRWLLRJkKZ71YA8
 /wnWN1xoFYpZOYUJg05DMVVuf1PTdSN8GAw95ay2crRO5/zHNbV9Bmqvu+MrScWG+UrV
 KmdylLt0zTYH8hPn0v5sZOhw3tLMSdlkolHve1uctblSLgOny6EXbbC4uqLXoQ8AYR22
 AKNw==
X-RZG-AUTH: ":JmMXYEHmdv4HaV2cbPh7iS0wbr/uKIfGM0EPXvQCbXgI7t69COvnl6LERsNcX+38fzXJ1XO/JvLGWj59ag=="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain by smtp.strato.de (RZmta 46.10.7 AUTH)
 with ESMTPSA id e0624aw7NER3JRw
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Sun, 23 Aug 2020 16:27:03 +0200 (CEST)
Subject: Re: [PATCH] drm/etnaviv: fix external abort seen on GC600 rev 0x19
To: Christian Gmeiner <christian.gmeiner@gmail.com>,
 linux-kernel@vger.kernel.org
References: <20200821181731.94852-1-christian.gmeiner@gmail.com>
From: "Ing. Josua Mayer" <josua.mayer@jm0.eu>
Autocrypt: addr=josua.mayer@jm0.eu; prefer-encrypt=mutual; keydata=
 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
 Si21CLNeIbliI0CNR5kPUY1ntw1JCOmOjKZm
Message-ID: <4dbee9c7-8a59-9250-ab13-394cbab689a8@jm0.eu>
Date: Sun, 23 Aug 2020 16:27:03 +0200
MIME-Version: 1.0
In-Reply-To: <20200821181731.94852-1-christian.gmeiner@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 24 Aug 2020 06:55:41 +0000
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
Cc: David Airlie <airlied@linux.ie>, etnaviv@lists.freedesktop.org,
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

I have formally tested the patch with 5.7.10 - and it doesn't resolve
the issue - sadly :(

From my testing, the reads on
VIVS_HI_CHIP_PRODUCT_ID
VIVS_HI_CHIP_ECO_ID
need to be conditional - while
VIVS_HI_CHIP_CUSTOMER_ID
seems to be okay.

br
josau Mayer

Am 21.08.20 um 20:17 schrieb Christian Gmeiner:
> It looks like that this GPU core triggers an abort when
> reading VIVS_HI_CHIP_PRODUCT_ID and/or VIVS_HI_CHIP_CUSTOMER_ID.
> 
> I looked at different versions of Vivante's kernel driver and did
> not found anything about this issue or what feature flag can be
> used. So go the simplest route and do not read these two registers
> on the affected GPU core.
> 
> Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
> Reported-by: Josua Mayer <josua.mayer@jm0.eu>
> Fixes: 815e45bbd4d3 ("drm/etnaviv: determine product, customer and eco id")
> Cc: stable@vger.kernel.org
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> index d5a4cd85a0f6..d3906688c2b3 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -337,10 +337,17 @@ static void etnaviv_hw_identify(struct etnaviv_gpu *gpu)
>  
>  		gpu->identity.model = gpu_read(gpu, VIVS_HI_CHIP_MODEL);
>  		gpu->identity.revision = gpu_read(gpu, VIVS_HI_CHIP_REV);
> -		gpu->identity.product_id = gpu_read(gpu, VIVS_HI_CHIP_PRODUCT_ID);
> -		gpu->identity.customer_id = gpu_read(gpu, VIVS_HI_CHIP_CUSTOMER_ID);
>  		gpu->identity.eco_id = gpu_read(gpu, VIVS_HI_CHIP_ECO_ID);
>  
> +		/*
> +		 * Reading these two registers on GC600 rev 0x19 result in a
> +		 * unhandled fault: external abort on non-linefetch
> +		 */
> +		if (!etnaviv_is_model_rev(gpu, GC600, 0x19)) {
> +			gpu->identity.product_id = gpu_read(gpu, VIVS_HI_CHIP_PRODUCT_ID);
> +			gpu->identity.customer_id = gpu_read(gpu, VIVS_HI_CHIP_CUSTOMER_ID);
> +		}
> +
>  		/*
>  		 * !!!! HACK ALERT !!!!
>  		 * Because people change device IDs without letting software
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
