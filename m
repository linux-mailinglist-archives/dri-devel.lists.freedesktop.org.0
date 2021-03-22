Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E487343A89
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 08:26:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3B536E3CE;
	Mon, 22 Mar 2021 07:26:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCE3A6E3CE
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 07:26:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AF1D260295;
 Mon, 22 Mar 2021 07:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616398012;
 bh=7ZZ16k2IQrPSZWmtn+IDkZglcyLIqxtZ8LynJyOxnAI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=GavvwMsZOqyYXx2TYUVFtfYpBgn0KxveSIZ1Ynq9vG2WsufcR9JkDlqsaJRkE7CAN
 cbGqtcsYBl+8LAKpJZEzZPZlVY8RcwlcYkMd768Y2vX6/JWQPoqHtWm4U1HWQEkLmt
 SQC3pRm4ORGv8RlRl2L1xIjFJ/s81nQyTC+4yrNd0sJJx1ynljFcOHKKguhmRToFVk
 eD9OSpzu7ZUAYP9Pa+wLb0fSrQdTgYnsKXxaQxVkshZ+l7HKSVGlfQmkP3uszCvb0f
 qjxoFmJczBElazis7AwZgV+HKDIKq3DycacSDdJvgll5Y026hpQ5i6CRvuGFHHROqg
 gTysvdOwO8doA==
Subject: Re: [PATCH v2 3/3] drm/tilcdc: fix pixel clock setting warning message
To: Dario Binacchi <dariobin@libero.it>, linux-kernel@vger.kernel.org
References: <20210321083153.2810-1-dariobin@libero.it>
 <20210321083153.2810-4-dariobin@libero.it>
From: Tomi Valkeinen <tomba@kernel.org>
Message-ID: <0d8770b6-755d-8fc7-4e52-2d745971876d@kernel.org>
Date: Mon, 22 Mar 2021 09:26:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210321083153.2810-4-dariobin@libero.it>
Content-Language: en-US
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
Cc: David Airlie <airlied@linux.ie>, Jyri Sarha <jyri.sarha@iki.fi>,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/03/2021 10:31, Dario Binacchi wrote:
> The warning message did not printed the LCD pixel clock rate but the LCD
> clock divisor input rate. As a consequence, the required and real pixel
> clock rates are now passed to the tilcdc_pclk_diff().
> 
> Signed-off-by: Dario Binacchi <dariobin@libero.it>
> 
> ---
> 
> Changes in v2:
> - The patch has been added in version 2.
> 
>   drivers/gpu/drm/tilcdc/tilcdc_crtc.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
> index ac6228cb04d9..c0792c52dc02 100644
> --- a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
> +++ b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
> @@ -203,7 +203,7 @@ static void tilcdc_crtc_set_clk(struct drm_crtc *crtc)
>   	struct drm_device *dev = crtc->dev;
>   	struct tilcdc_drm_private *priv = dev->dev_private;
>   	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
> -	unsigned long clk_rate, real_rate, real_pclk_rate, pclk_rate;
> +	unsigned long clk_rate, real_pclk_rate, pclk_rate;
>   	unsigned int clkdiv;
>   	int ret;
>   
> @@ -239,12 +239,12 @@ static void tilcdc_crtc_set_clk(struct drm_crtc *crtc)
>   		 * 5% is an arbitrary value - LCDs are usually quite tolerant
>   		 * about pixel clock rates.
>   		 */
> -		real_rate = clkdiv * pclk_rate;
> +		real_pclk_rate = clk_rate / clkdiv;
>   
> -		if (tilcdc_pclk_diff(clk_rate, real_rate) > 5) {
> +		if (tilcdc_pclk_diff(pclk_rate, real_pclk_rate) > 5) {
>   			dev_warn(dev->dev,
>   				 "effective pixel clock rate (%luHz) differs from the calculated rate (%luHz)\n",
> -				 clk_rate, real_rate);
> +				 pclk_rate, real_pclk_rate);

Aren't these backwards? "Effective" is the real one in the HW. I'm not 
sure what "calculated" means here, I guess it should be "requested".

  Tomi
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
