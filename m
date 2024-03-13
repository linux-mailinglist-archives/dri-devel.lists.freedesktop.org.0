Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE3F87AE97
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 19:03:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFA0510F835;
	Wed, 13 Mar 2024 18:02:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ravnborg.org header.i=@ravnborg.org header.b="H+00MaWs";
	dkim=permerror (0-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b="DPKi7Bcr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay5-1.pub.mailoutpod2-cph3.one.com
 (mailrelay5-1.pub.mailoutpod2-cph3.one.com [46.30.211.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A399110F835
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 18:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=5EHsIVjha4wRSL46vF6lOzFgvJbdU5IeMBGmfbQ427I=;
 b=H+00MaWsTMKg/0cixoKmrC2R9XiLtIxsOcN+V3G2q7XUPbmw57FoaT1ghKvqxdgZAbJbiRTmNdBZi
 xBcz/7sCjHcjqB7Xbe7Da5UpGz/Z647u9lq+T1+kvJuY0hRp1K+66DKYu1CaRnb8zEbyhyK+SdaAPR
 zSgcSlHaO290T3Mrh3r2m7NYayb69R+y2pY+jO3/l0hlLKWrRQCnAp26KOfuRDBT00MSJNK6MRN9h0
 GaTZGpT0Rv0mb+J61YlrCyewiK/D1hFZbZZB0cAgeaZ+KnVeqX0er6Dv5pldYi8hLDFVL56O2IjwaW
 L+hSxAfyuL/cLz3FZAi1CIgvroMPJsQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=5EHsIVjha4wRSL46vF6lOzFgvJbdU5IeMBGmfbQ427I=;
 b=DPKi7BcrVx/Vk9QQ4K5glo9NfxDX3LPaqu49IcLt2Snml2ihPtcN2gA6wlGF2LXHDplnwN/7KywMr
 j3RcGjnAA==
X-HalOne-ID: c66704fa-e163-11ee-9c87-657a30c718c6
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay5.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
 id c66704fa-e163-11ee-9c87-657a30c718c6;
 Wed, 13 Mar 2024 18:01:56 +0000 (UTC)
Date: Wed, 13 Mar 2024 19:01:54 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 deller@gmx.de, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 Robin van der Gracht <robin@protonic.nl>, Miguel Ojeda <ojeda@kernel.org>
Subject: Re: [PATCH 1/6] auxdisplay/ht16k33: Replace use of fb_blank with
 backlight helper
Message-ID: <20240313180154.GC96726@ravnborg.org>
References: <20240313154857.12949-1-tzimmermann@suse.de>
 <20240313154857.12949-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240313154857.12949-2-tzimmermann@suse.de>
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

On Wed, Mar 13, 2024 at 04:45:00PM +0100, Thomas Zimmermann wrote:
> Replace the use of struct backlight_properties.fb_blank with a
> call to backlight_get_brightness(). The helper implement the same
> logic as the driver's function.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Robin van der Gracht <robin@protonic.nl>
> Cc: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/auxdisplay/ht16k33.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/auxdisplay/ht16k33.c b/drivers/auxdisplay/ht16k33.c
> index a90430b7d07ba..83db829b97a5e 100644
> --- a/drivers/auxdisplay/ht16k33.c
> +++ b/drivers/auxdisplay/ht16k33.c
> @@ -314,14 +314,9 @@ static int ht16k33_initialize(struct ht16k33_priv *priv)
>  
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
> -- 
> 2.44.0
