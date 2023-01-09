Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D943C662132
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 10:15:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BC6510E386;
	Mon,  9 Jan 2023 09:15:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 646F710E386
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 09:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673255702; x=1704791702;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=8H3hPCFI47nxZtoBbne24d82bPkrwkUNa3C9m/vtPLs=;
 b=anXYq0ABsHPv/O6yvljWBVthLlBaH8dmTJtBkPGywTYP8zcqwN1Sbnri
 ZyktcExmENsz3E14KTTJ2CnWX36HUFrvhyiegbjN/8YESC8RmO45oce8k
 lb16pD/xCq7U/BCkHnvvKnGWI4OF3K7K3IcpT+F1q2TqktdF2kjuiSWXq
 kZNZFUcVHlmxIH0Dg2L+dHRkymZQh0wz+VwcdtM5DNFc86J0c866L6zHG
 CvLbhLyv1azIZpTC0DdBKSiWTfF9wTMm7nJ5MfNmexTmIoiiT+ZtupJm+
 T57yq3H+SmfAAL01N9902ZdU6fLjkaf/2Z6VayC9KMHnrjszWTnAhxnqu A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10584"; a="322904958"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; d="scan'208";a="322904958"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2023 01:15:01 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10584"; a="985334290"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; d="scan'208";a="985334290"
Received: from gtmcgeac-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.11.217])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2023 01:14:55 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Sam Ravnborg via B4 Submission Endpoint
 <devnull+sam.ravnborg.org@kernel.org>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Helge Deller <deller@gmx.de>, Alexandre
 Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
 <claudiu.beznea@microchip.com>, Antonino Daplas <adaplas@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Robin
 van der Gracht <robin@protonic.nl>, Miguel Ojeda <ojeda@kernel.org>, Lee
 Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>
Subject: Re: [PATCH 01/15] video: fbdev: atmel_lcdfb: Rework backlight handling
In-Reply-To: <20230107-sam-video-backlight-drop-fb_blank-v1-1-1bd9bafb351f@ravnborg.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230107-sam-video-backlight-drop-fb_blank-v1-0-1bd9bafb351f@ravnborg.org>
 <20230107-sam-video-backlight-drop-fb_blank-v1-1-1bd9bafb351f@ravnborg.org>
Date: Mon, 09 Jan 2023 11:14:53 +0200
Message-ID: <87a62s2ho2.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-fbdev@vger.kernel.org, Stephen Kitt <steve@sk2.org>,
 linuxppc-dev@lists.ozlabs.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 linux-omap@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 07 Jan 2023, Sam Ravnborg via B4 Submission Endpoint <devnull+sam.ravnborg.org@kernel.org> wrote:
> From: Sam Ravnborg <sam@ravnborg.org>
>
> The atmel_lcdfb had code to save/restore power state.
> This is not needed so drop it.
>
> Introduce backlight_is_brightness() to make logic simpler.

backlight_is_brightness?

BR,
Jani.


>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
> Cc: linux-fbdev@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  drivers/video/fbdev/atmel_lcdfb.c | 24 +++---------------------
>  1 file changed, 3 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/video/fbdev/atmel_lcdfb.c b/drivers/video/fbdev/atmel_lcdfb.c
> index 1fc8de4ecbeb..d297b3892637 100644
> --- a/drivers/video/fbdev/atmel_lcdfb.c
> +++ b/drivers/video/fbdev/atmel_lcdfb.c
> @@ -49,7 +49,6 @@ struct atmel_lcdfb_info {
>  	struct clk		*lcdc_clk;
>  
>  	struct backlight_device	*backlight;
> -	u8			bl_power;
>  	u8			saved_lcdcon;
>  
>  	u32			pseudo_palette[16];
> @@ -109,32 +108,18 @@ static u32 contrast_ctr = ATMEL_LCDC_PS_DIV8
>  static int atmel_bl_update_status(struct backlight_device *bl)
>  {
>  	struct atmel_lcdfb_info *sinfo = bl_get_data(bl);
> -	int			power = sinfo->bl_power;
> -	int			brightness = bl->props.brightness;
> +	int brightness;
>  
> -	/* REVISIT there may be a meaningful difference between
> -	 * fb_blank and power ... there seem to be some cases
> -	 * this doesn't handle correctly.
> -	 */
> -	if (bl->props.fb_blank != sinfo->bl_power)
> -		power = bl->props.fb_blank;
> -	else if (bl->props.power != sinfo->bl_power)
> -		power = bl->props.power;
> -
> -	if (brightness < 0 && power == FB_BLANK_UNBLANK)
> -		brightness = lcdc_readl(sinfo, ATMEL_LCDC_CONTRAST_VAL);
> -	else if (power != FB_BLANK_UNBLANK)
> -		brightness = 0;
> +	brightness = backlight_get_brightness(bl);
>  
>  	lcdc_writel(sinfo, ATMEL_LCDC_CONTRAST_VAL, brightness);
> +
>  	if (contrast_ctr & ATMEL_LCDC_POL_POSITIVE)
>  		lcdc_writel(sinfo, ATMEL_LCDC_CONTRAST_CTR,
>  			brightness ? contrast_ctr : 0);
>  	else
>  		lcdc_writel(sinfo, ATMEL_LCDC_CONTRAST_CTR, contrast_ctr);
>  
> -	bl->props.fb_blank = bl->props.power = sinfo->bl_power = power;
> -
>  	return 0;
>  }
>  
> @@ -155,8 +140,6 @@ static void init_backlight(struct atmel_lcdfb_info *sinfo)
>  	struct backlight_properties props;
>  	struct backlight_device	*bl;
>  
> -	sinfo->bl_power = FB_BLANK_UNBLANK;
> -
>  	if (sinfo->backlight)
>  		return;
>  
> @@ -173,7 +156,6 @@ static void init_backlight(struct atmel_lcdfb_info *sinfo)
>  	sinfo->backlight = bl;
>  
>  	bl->props.power = FB_BLANK_UNBLANK;
> -	bl->props.fb_blank = FB_BLANK_UNBLANK;
>  	bl->props.brightness = atmel_bl_get_brightness(bl);
>  }

-- 
Jani Nikula, Intel Open Source Graphics Center
