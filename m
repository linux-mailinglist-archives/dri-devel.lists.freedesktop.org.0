Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7848F119232
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 21:37:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4EAF6E92D;
	Tue, 10 Dec 2019 20:37:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B0576E92D
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 20:37:20 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 3FF1320066;
 Tue, 10 Dec 2019 21:37:18 +0100 (CET)
Date: Tue, 10 Dec 2019 21:37:16 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [PATCH 3/5] mfd: atmel-hlcdc: return in case of error
Message-ID: <20191210203716.GC24756@ravnborg.org>
References: <1575984287-26787-1-git-send-email-claudiu.beznea@microchip.com>
 <1575984287-26787-4-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1575984287-26787-4-git-send-email-claudiu.beznea@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=XYAwZIGsAAAA:8
 a=kaM4bpze9TPPYBSW8_oA:9 a=CjuIK1q_8ugA:10 a=E8ToXWR_bxluHZ7gmE-Z:22
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
Cc: alexandre.belloni@bootlin.com, bbrezillon@kernel.org, airlied@linux.ie,
 nicolas.ferre@microchip.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, ludovic.desroches@microchip.com,
 lee.jones@linaro.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Claudiu.

On Tue, Dec 10, 2019 at 03:24:45PM +0200, Claudiu Beznea wrote:
> For HLCDC timing engine configurations bit ATMEL_HLCDC_SIP of
> ATMEL_HLCDC_SR needs to checked if it is equal with zero before applying
> new configuration to timing engine. In case of timeout there is no
> indicator about this, so, return with error in case of timeout in
> regmap_atmel_hlcdc_reg_write() and also print a message about this.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>  drivers/mfd/atmel-hlcdc.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mfd/atmel-hlcdc.c b/drivers/mfd/atmel-hlcdc.c
> index 64013c57a920..19f1dbeb8bcd 100644
> --- a/drivers/mfd/atmel-hlcdc.c
> +++ b/drivers/mfd/atmel-hlcdc.c
> @@ -39,10 +39,16 @@ static int regmap_atmel_hlcdc_reg_write(void *context, unsigned int reg,
>  
>  	if (reg <= ATMEL_HLCDC_DIS) {
>  		u32 status;
> -
> -		readl_poll_timeout_atomic(hregmap->regs + ATMEL_HLCDC_SR,
> -					  status, !(status & ATMEL_HLCDC_SIP),
> -					  1, 100);
> +		int ret;
> +
> +		ret = readl_poll_timeout_atomic(hregmap->regs + ATMEL_HLCDC_SR,
> +						status,
> +						!(status & ATMEL_HLCDC_SIP),
> +						1, 100);
> +		if (ret) {
> +			pr_err("Timeout waiting for ATMEL_HLCDC_SIP\n");
> +			return ret;
Consider adding device * to atmel_hlcdc_regmap - so you can use
dev_err() here. This makes it obvious what device this comes from.

	Sam

> +		}
>  	}
>  
>  	writel(val, hregmap->regs + reg);
> -- 
> 2.7.4
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
