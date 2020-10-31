Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7092A13EE
	for <lists+dri-devel@lfdr.de>; Sat, 31 Oct 2020 08:19:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DF9D6E162;
	Sat, 31 Oct 2020 07:19:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 820AB6E162
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Oct 2020 07:19:43 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id D1C0B20020;
 Sat, 31 Oct 2020 08:19:37 +0100 (CET)
Date: Sat, 31 Oct 2020 08:19:36 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH] drm/bridge: tpd12s015: Fix irq registering in
 tpd12s015_probe
Message-ID: <20201031071936.GA1044557@ravnborg.org>
References: <20201031031648.42368-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201031031648.42368-1-yuehaibing@huawei.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VbvZwmh9 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=i0EeH86SAAAA:8 a=gztNg7IbQklwsPNN-i8A:9
 a=CjuIK1q_8ugA:10
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
Cc: jernej.skrabec@siol.net, jonas@kwiboo.se, airlied@linux.ie,
 narmstrong@baylibre.com, sebastian.reichel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 a.hajda@samsung.com, tomi.valkeinen@ti.com, Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi YueHaibing

Thanks for the fix. Appreciated but please update as per comments below.

On Sat, Oct 31, 2020 at 11:16:48AM +0800, YueHaibing wrote:
> gpiod_to_irq() return negative value in case of error,
> the existing code handle negative error codes wrongly.
> 
> Fixes: cff5e6f7e83f ("drm/bridge: Add driver for the TI TPD12S015 HDMI level shifter")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/gpu/drm/bridge/ti-tpd12s015.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-tpd12s015.c b/drivers/gpu/drm/bridge/ti-tpd12s015.c
> index 514cbf0eac75..a18d5197c16c 100644
> --- a/drivers/gpu/drm/bridge/ti-tpd12s015.c
> +++ b/drivers/gpu/drm/bridge/ti-tpd12s015.c
> @@ -160,7 +160,7 @@ static int tpd12s015_probe(struct platform_device *pdev)
>  
>  	/* Register the IRQ if the HPD GPIO is IRQ-capable. */
>  	tpd->hpd_irq = gpiod_to_irq(tpd->hpd_gpio);
> -	if (tpd->hpd_irq) {
> +	if (tpd->hpd_irq > 0) {
>  		ret = devm_request_threaded_irq(&pdev->dev, tpd->hpd_irq, NULL,
>  						tpd12s015_hpd_isr,
>  						IRQF_TRIGGER_RISING |

The current implmentation will skip devm_request_threaded_irq() in case
or error - but continue with the rest of the function. So the
driver fails to return an error code.

In case of error (negative value) then return early with that error
value. If gpiod_to_irq() returns 0 assume this is a valid irq and let
the code continue.

Please fix and re-submit - or tell me if I am mistaken.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
