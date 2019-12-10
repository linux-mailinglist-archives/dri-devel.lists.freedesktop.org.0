Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 186E01191B8
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 21:18:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0595A6E927;
	Tue, 10 Dec 2019 20:18:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9E8A6E927
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 20:18:49 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 25A422008B;
 Tue, 10 Dec 2019 21:18:46 +0100 (CET)
Date: Tue, 10 Dec 2019 21:18:45 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [PATCH 2/5] drm: atmel-hlcdc: enable clock before configuring
 timing engine
Message-ID: <20191210201845.GA24756@ravnborg.org>
References: <1575984287-26787-1-git-send-email-claudiu.beznea@microchip.com>
 <1575984287-26787-3-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1575984287-26787-3-git-send-email-claudiu.beznea@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=XYAwZIGsAAAA:8
 a=3T0gCXIu3ADAjCj7PMoA:9 a=CjuIK1q_8ugA:10 a=E8ToXWR_bxluHZ7gmE-Z:22
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

On Tue, Dec 10, 2019 at 03:24:44PM +0200, Claudiu Beznea wrote:
> Changing pixel clock source without having this clock source enabled
> will block the timing engine and the next operations after (in this case
> setting ATMEL_HLCDC_CFG(5) settings in atmel_hlcdc_crtc_mode_set_nofb()
> will fail). It is recomended (although in datasheet this is not present)
> to actually enabled pixel clock source before doing any changes on timing
> enginge (only SAM9X60 datasheet specifies that the peripheral clock and
> pixel clock must be enabled before using LCD controller).
> 
> Fixes: 1a396789f65a ("drm: add Atmel HLCDC Display Controller support")
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>

We already had a remotely similar fix.
See 262d67e73f9a920a20bd75278761400404a82de0
("drm: atmel-hlcdc: enable sys_clk during initalization.")

In this patch sys_clk is only enabled if we have a fixed_clk.
Maybe we should do this unconditionally in
atmel_hlcdc_dc_load()?

Then we do not need this enable(disable in the mode_set_nofb
implementation.

Have you considered this way to fix it?

	Sam

> ---
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> index 5040ed8d0871..721fa88bf71d 100644
> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> @@ -73,7 +73,11 @@ static void atmel_hlcdc_crtc_mode_set_nofb(struct drm_crtc *c)
>  	unsigned long prate;
>  	unsigned int mask = ATMEL_HLCDC_CLKDIV_MASK | ATMEL_HLCDC_CLKPOL;
>  	unsigned int cfg = 0;
> -	int div;
> +	int div, ret;
> +
> +	ret = clk_prepare_enable(crtc->dc->hlcdc->sys_clk);
> +	if (ret)
> +		return;
>  
>  	vm.vfront_porch = adj->crtc_vsync_start - adj->crtc_vdisplay;
>  	vm.vback_porch = adj->crtc_vtotal - adj->crtc_vsync_end;
> @@ -147,6 +151,8 @@ static void atmel_hlcdc_crtc_mode_set_nofb(struct drm_crtc *c)
>  			   ATMEL_HLCDC_VSPSU | ATMEL_HLCDC_VSPHO |
>  			   ATMEL_HLCDC_GUARDTIME_MASK | ATMEL_HLCDC_MODE_MASK,
>  			   cfg);
> +
> +	clk_disable_unprepare(crtc->dc->hlcdc->sys_clk);
>  }
>  
>  static enum drm_mode_status
> -- 
> 2.7.4
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
