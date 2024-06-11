Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E14A9042E0
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 19:56:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 258BB10E6F8;
	Tue, 11 Jun 2024 17:56:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ravnborg.org header.i=@ravnborg.org header.b="MGUJ9Lse";
	dkim=permerror (0-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b="gUDBqNT9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay4-1.pub.mailoutpod3-cph3.one.com
 (mailrelay4-1.pub.mailoutpod3-cph3.one.com [46.30.211.243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A183B10E6F8
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 17:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=g9WKV73/vX/yRKi/hglFtmBSXNmDuF7jx1LSMWu23v8=;
 b=MGUJ9LseT3f5lZBW0OKxinuyoP4Ccabuc75xhvpP21vgQEyTqiVTs4Fg1RT9IdF8tTLhJBJKs53DG
 aD3n4oKlEvWVRlRYDi10iHhL7J1lFyvbR4vIoTIomca43ATnqv+Z/NCR92hPtsikZKhlO8ItWGgxg1
 4YuvdjlA2N/E6Zg3k2emqVqcNu4RNvyBYvCI3W1WOKotRcB1YpG2MWaZ4xvwTtOVOGaN8E/WwfzlwA
 gOZOSciUXJNWLRHPt6oxwzcjCfkZShwRyr4YoMkmmM+sC+Yp0OfmoH7PYdlMPo9+qPG06FIdr81BjM
 FdbLkkUDCMyp0E5urejZivADmsWGsSQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=g9WKV73/vX/yRKi/hglFtmBSXNmDuF7jx1LSMWu23v8=;
 b=gUDBqNT9P/28PpP+1HZVetLC/b5nS0VWr4onj3XTH81Z/oW76YeBdXPCjeM+olZqxVc/T6ZDdKKNy
 aYJ+AdoAg==
X-HalOne-ID: d271771c-281b-11ef-802b-591fce59e039
Received: from ravnborg.org (2-105-16-150-cable.dk.customer.tdc.net
 [2.105.16.150])
 by mailrelay4.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
 id d271771c-281b-11ef-802b-591fce59e039;
 Tue, 11 Jun 2024 17:55:45 +0000 (UTC)
Date: Tue, 11 Jun 2024 19:55:44 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 deller@gmx.de, linus.walleij@linaro.org, f.suligoi@asem.it,
 ukleinek@kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: Re: [PATCH 01/17] backlight: Add BL_CORE_ constants for power states
Message-ID: <20240611175544.GC545417@ravnborg.org>
References: <20240611125321.6927-1-tzimmermann@suse.de>
 <20240611125321.6927-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240611125321.6927-2-tzimmermann@suse.de>
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

Hi Thomas.

On Tue, Jun 11, 2024 at 02:41:56PM +0200, Thomas Zimmermann wrote:
> Duplicate FB_BLANK_ constants as BL_CORE_ constants in the backlight
> header file. Allows backlight drivers to avoid including the fbdev
> header file and removes a compile-time dependency between the two
> subsystems.
Good to remove this dependency.
> 
> The new BL_CORE constants have the same values as their FB_BLANK_
> counterparts. Hence UAPI and internal semantics do not change. The
> backlight drivers can be converted one by one.
This seems like the right approach.

> 
> Backlight code or drivers do not use FB_BLANK_VSYNC_SUSPEND and
> FB_BLANK_HSYNC_SUSPEND, so no new constants for these are being
> added.
> 
> The semantics of FB_BLANK_NORMAL appear inconsistent. In fbdev,
> NORMAL means display off with sync enabled. In backlight code,
> this translates to turn the backlight off, but some drivers
> interpret it as backlight on. So we keep the current code as is,
> but mark BL_CORE_NORMAL as deprecated. Drivers should be fixed
> and the constant removed. This affects ams369fg06 and a few DRM
> panel drivers.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  Documentation/ABI/stable/sysfs-class-backlight |  7 ++++---
>  include/linux/backlight.h                      | 16 ++++++++++------
>  2 files changed, 14 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/ABI/stable/sysfs-class-backlight b/Documentation/ABI/stable/sysfs-class-backlight
> index 023fb52645f8b..6102d6bebdf9a 100644
> --- a/Documentation/ABI/stable/sysfs-class-backlight
> +++ b/Documentation/ABI/stable/sysfs-class-backlight
> @@ -3,10 +3,11 @@ Date:		April 2005
>  KernelVersion:	2.6.12
>  Contact:	Richard Purdie <rpurdie@rpsys.net>
>  Description:
> -		Control BACKLIGHT power, values are FB_BLANK_* from fb.h
> +		Control BACKLIGHT power, values are compatible with
> +		FB_BLANK_* from fb.h
>  
> -		 - FB_BLANK_UNBLANK (0)   : power on.
> -		 - FB_BLANK_POWERDOWN (4) : power off
> +		 - 0 (FB_BLANK_UNBLANK)   : power on.
> +		 - 4 (FB_BLANK_POWERDOWN) : power off
>  Users:		HAL
>  
>  What:		/sys/class/backlight/<backlight>/brightness
> diff --git a/include/linux/backlight.h b/include/linux/backlight.h
> index 19a1c0e22629d..e0cfd89ffadd2 100644
> --- a/include/linux/backlight.h
> +++ b/include/linux/backlight.h
> @@ -210,14 +210,18 @@ struct backlight_properties {
>  	 * When the power property is updated update_status() is called.
>  	 *
>  	 * The possible values are: (0: full on, 1 to 3: power saving
> -	 * modes; 4: full off), see FB_BLANK_XXX.
> +	 * modes; 4: full off), see BL_CORE_XXX constants.
>  	 *
>  	 * When the backlight device is enabled @power is set
> -	 * to FB_BLANK_UNBLANK. When the backlight device is disabled
> -	 * @power is set to FB_BLANK_POWERDOWN.
> +	 * to BL_CORE_UNBLANK. When the backlight device is disabled
> +	 * @power is set to BL_CORE_POWERDOWN.
>  	 */
>  	int power;
>  
> +#define BL_CORE_UNBLANK		(0)
> +#define BL_CORE_NORMAL		(1) // deprecated; don't use in new code
> +#define BL_CORE_POWERDOWN	(4)

When introducing backlight specific constants then it would be good to
get away from the ackward fbdev naming and use something that is more
obvious.

Something like:

#define BACKLIGHT_POWER_ON	0
#define BACKLIGHT_POWER_OFF	4
#define BACKLIGHT_POWER_NORMAL	1	// deprecated; don't use in new code

This will make the code more obvious to read / understand - at least
IMO.

The proposal did not use the BL_CORE_ naming, lets keep this for
suspend/resume stuff.

On top of this - many users of the power states could benefit using the
backlight_enable()/backlight_disable() helpers, but that's another story.

	Sam
