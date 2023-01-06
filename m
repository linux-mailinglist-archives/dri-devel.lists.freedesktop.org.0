Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F42E6605DB
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 18:44:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6F5510E8A9;
	Fri,  6 Jan 2023 17:44:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay5-1.pub.mailoutpod2-cph3.one.com
 (mailrelay5-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:404::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA5F410E8A8
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 17:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=FSqXexJzCRVeHRIZREcKXEAPwBfY3fDmKI9BXOUKmLs=;
 b=TyFpN28itepy0w/qodgA7k58SxSGO2oVol439ZxYDGmDVyMPXI8eCAEmNR3GSNDDa3N5KR1pFTpqL
 0fxVWS+IoZR8n2b0vFH0bUl9J7XjOGWprjTylXOM0vdPcR7j7hVg5bWy6UhFhTT/Yi0VgaD/xkrX2N
 I3DvWsZTAmFqBnDkU9eVNJ/S0MhaMpL5KVWVnSjrwlw9t1sEk5QHG0hpqlC4kkkRwoiQPHg6howi9L
 W7aEGiM30DK1V2/6Q6uHFAoxEW9mau9Jm83ZSWD/LExt2k2iqO0MCP6a1MYo5iIhnDdshOYfy7rhM9
 VBjCjfF++NwMSmRf8BB+j9ccQj0NYcQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=FSqXexJzCRVeHRIZREcKXEAPwBfY3fDmKI9BXOUKmLs=;
 b=VdqY98AJKtj0j1G6CDmNlGEHh0seMeKpXOOv835nCu+xHeTIwx+sgbs5s1jaaIFnx5HxD1+HlbnES
 eQQxSUrAw==
X-HalOne-ID: d04ebfe6-8de9-11ed-9e86-7703b0afff57
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay5 (Halon) with ESMTPSA
 id d04ebfe6-8de9-11ed-9e86-7703b0afff57;
 Fri, 06 Jan 2023 17:44:50 +0000 (UTC)
Date: Fri, 6 Jan 2023 18:44:49 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Stephen Kitt <steve@sk2.org>
Subject: Re: [PATCH RESEND 2/4] backlight: arcxcnn: Use backlight helper
Message-ID: <Y7heER7NIHVFQY8a@ravnborg.org>
References: <20230106164856.1453819-3-steve@sk2.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230106164856.1453819-3-steve@sk2.org>
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

On Fri, Jan 06, 2023 at 05:48:53PM +0100, Stephen Kitt wrote:
> Instead of retrieving the backlight brightness in struct
> backlight_properties manually, and then checking whether the backlight
> should be on at all, use backlight_get_brightness() which does all
> this and insulates this from future changes.
> 
> Signed-off-by: Stephen Kitt <steve@sk2.org>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/video/backlight/arcxcnn_bl.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/video/backlight/arcxcnn_bl.c b/drivers/video/backlight/arcxcnn_bl.c
> index 555b036643fb..e610d7a1d13d 100644
> --- a/drivers/video/backlight/arcxcnn_bl.c
> +++ b/drivers/video/backlight/arcxcnn_bl.c
> @@ -130,12 +130,9 @@ static int arcxcnn_set_brightness(struct arcxcnn *lp, u32 brightness)
>  static int arcxcnn_bl_update_status(struct backlight_device *bl)
>  {
>  	struct arcxcnn *lp = bl_get_data(bl);
> -	u32 brightness = bl->props.brightness;
> +	u32 brightness = backlight_get_brightness(bl);
>  	int ret;
>  
> -	if (bl->props.state & (BL_CORE_SUSPENDED | BL_CORE_FBBLANK))
> -		brightness = 0;
> -
>  	ret = arcxcnn_set_brightness(lp, brightness);
>  	if (ret)
>  		return ret;
> -- 
> 2.30.2
