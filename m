Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B62546605D9
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 18:44:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEF5510E8A3;
	Fri,  6 Jan 2023 17:44:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay6-1.pub.mailoutpod2-cph3.one.com
 (mailrelay6-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:405::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1844A10E8A3
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 17:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=G0w86SVdIKEzZ4UHE2V7d+15iMluC/fBmg46bCANObM=;
 b=iZWaDcRrgy2o4risdbgBpJCDFPOEAqe7/Luj1nb4NMD1tCwk2bsRbeO1Jl0eu4+3StXTLoa6VPZjV
 iez8/Vu18caxBAVacg1R3JBjFoUR57uyVLr1esorQErZsIKDDpF2xTOvx176o9uYSbV2502X7Sccem
 YjScqctdasIYqwNvUROvJrbzmwCxQ07MZDZxfenHHWa7M//anKJvcCXT/JdmWQ27RqgdudFRkkC4gt
 PKpx0xI5vpC+HG5mq/Ut5K5xleWn7cYlbA/a4iq2Tp8VbjXoh4OoQ2+J3vltIYH4GeYX/xqcI81W5R
 XQOldswESyjF5Ifsj0zn1ut1XeBk2vg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=G0w86SVdIKEzZ4UHE2V7d+15iMluC/fBmg46bCANObM=;
 b=/N/FMm4EniUT7zl+S9u4ArJMo9dii9EnE4ox4HfuvcfcsX2VrgPUXXQ+JNR52JaY0iG93Mcw9Gw/v
 tuQG1wABQ==
X-HalOne-ID: c0d423cf-8de9-11ed-af75-cde5ad41a1dd
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay6 (Halon) with ESMTPSA
 id c0d423cf-8de9-11ed-af75-cde5ad41a1dd;
 Fri, 06 Jan 2023 17:44:24 +0000 (UTC)
Date: Fri, 6 Jan 2023 18:44:23 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Stephen Kitt <steve@sk2.org>
Subject: Re: [PATCH RESEND 1/4] backlight: aat2870: Use backlight helper
Message-ID: <Y7hd91mh91B5bpyv@ravnborg.org>
References: <20230106164856.1453819-2-steve@sk2.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230106164856.1453819-2-steve@sk2.org>
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stephen,

On Fri, Jan 06, 2023 at 05:48:52PM +0100, Stephen Kitt wrote:
> Instead of retrieving the backlight brightness in struct
> backlight_properties manually, and then checking whether the backlight
> should be on at all, use backlight_get_brightness() which does all
> this and insulates this from future changes.
> 
> Signed-off-by: Stephen Kitt <steve@sk2.org>
Nice cleanup.
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/video/backlight/aat2870_bl.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/video/backlight/aat2870_bl.c b/drivers/video/backlight/aat2870_bl.c
> index a7af9adafad6..1cbb303e9c88 100644
> --- a/drivers/video/backlight/aat2870_bl.c
> +++ b/drivers/video/backlight/aat2870_bl.c
> @@ -59,7 +59,7 @@ static int aat2870_bl_update_status(struct backlight_device *bd)
>  	struct aat2870_bl_driver_data *aat2870_bl = bl_get_data(bd);
>  	struct aat2870_data *aat2870 =
>  			dev_get_drvdata(aat2870_bl->pdev->dev.parent);
> -	int brightness = bd->props.brightness;
> +	int brightness = backlight_get_brightness(bd);
>  	int ret;
>  
>  	if ((brightness < 0) || (bd->props.max_brightness < brightness)) {
> @@ -70,11 +70,6 @@ static int aat2870_bl_update_status(struct backlight_device *bd)
>  	dev_dbg(&bd->dev, "brightness=%d, power=%d, state=%d\n",
>  		 bd->props.brightness, bd->props.power, bd->props.state);
>  
> -	if ((bd->props.power != FB_BLANK_UNBLANK) ||
> -			(bd->props.state & BL_CORE_FBBLANK) ||
> -			(bd->props.state & BL_CORE_SUSPENDED))
> -		brightness = 0;
> -
>  	ret = aat2870->write(aat2870, AAT2870_BLM,
>  			     (u8)aat2870_brightness(aat2870_bl, brightness));
>  	if (ret < 0)
> -- 
> 2.30.2
