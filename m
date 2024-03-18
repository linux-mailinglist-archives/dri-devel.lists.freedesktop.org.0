Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3079887E564
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 10:07:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D273610F408;
	Mon, 18 Mar 2024 09:07:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=protonic.nl header.i=@protonic.nl header.b="ewu7LAl9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp16.bhosted.nl (smtp16.bhosted.nl [94.124.121.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6159310F408
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 09:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonic.nl; s=202111;
 h=content-transfer-encoding:content-type:mime-version:references:in-reply-to:
 message-id:subject:cc:to:from:date:from;
 bh=FoIRlkqO1ctp4s2PeetRomEn5bkVsq7p5O2sYKCStY8=;
 b=ewu7LAl9hGfWHdB4/VRMy3TXUslfNg2HFaTeTI2PpqE4C6Vo6H1vDt6RgKLSk4gFkU50Aj2pHYtSy
 hakOwv5p2GKUeqGCNHQbPc7vXUflHZcdfZPFxoqwMUlXuHZc3kwQAW2gk+7DrEI2C9wz945QAuB8eF
 mPTCZdHoghSPfCPM6KQ0OpjaQJGiUVzhFJQxM/5MIA4XE8h60OTQAfsAzsDlDjRqRL5Yms7+xTOBgp
 NJJWXq0D03AESW53VuSlkTSZgfe3442wnffO1Rm9d9RdBPAuIvDxKwC9l7axcI1i3bKgtnwXpgGGfz
 td9ho0wYr2rrtHhv521NtOvbzXbiSpA==
X-MSG-ID: d02c6a3a-e506-11ee-844c-005056817704
Date: Mon, 18 Mar 2024 10:06:31 +0100
From: Robin van der Gracht <robin@protonic.nl>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 deller@gmx.de, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, Miguel Ojeda
 <ojeda@kernel.org>
Subject: Re: [PATCH 1/6] auxdisplay/ht16k33: Replace use of fb_blank with
 backlight helper
Message-ID: <20240318100631.253b2d8e@erd007.prtnl>
In-Reply-To: <20240313154857.12949-2-tzimmermann@suse.de>
References: <20240313154857.12949-1-tzimmermann@suse.de>
 <20240313154857.12949-2-tzimmermann@suse.de>
Organization: Protonic Holland
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

Hi Thomas,

Thank you for submitting your patch, it looks fine to me.

Reviewed-by: Robin van der Gracht <robin@protonic.nl>

On Wed, 13 Mar 2024 16:45:00 +0100
Thomas Zimmermann <tzimmermann@suse.de> wrote:

> Replace the use of struct backlight_properties.fb_blank with a
> call to backlight_get_brightness(). The helper implement the same
> logic as the driver's function.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Robin van der Gracht <robin@protonic.nl>
> Cc: Miguel Ojeda <ojeda@kernel.org>
> ---
>  drivers/auxdisplay/ht16k33.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/auxdisplay/ht16k33.c
> b/drivers/auxdisplay/ht16k33.c index a90430b7d07ba..83db829b97a5e
> 100644 --- a/drivers/auxdisplay/ht16k33.c
> +++ b/drivers/auxdisplay/ht16k33.c
> @@ -314,14 +314,9 @@ static int ht16k33_initialize(struct
> ht16k33_priv *priv) 
>  static int ht16k33_bl_update_status(struct backlight_device *bl)
>  {
> -	int brightness = bl->props.brightness;
> +	int brightness = backlight_get_brightness(bl);
>  	struct ht16k33_priv *priv = bl_get_data(bl);
>  
> -	if (bl->props.power != FB_BLANK_UNBLANK ||
> -	    bl->props.fb_blank != FB_BLANK_UNBLANK ||
> -	    bl->props.state & BL_CORE_FBBLANK)
> -		brightness = 0;
> -
>  	return ht16k33_brightness_set(priv, brightness);
>  }
>  
