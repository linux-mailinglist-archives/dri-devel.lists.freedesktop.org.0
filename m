Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8B9860FDC
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 11:53:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 481B510E03F;
	Fri, 23 Feb 2024 10:53:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="asVzxH/4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B686210EBA6
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 10:53:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 95BE7633B5;
 Fri, 23 Feb 2024 10:53:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B544C433C7;
 Fri, 23 Feb 2024 10:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708685630;
 bh=2HhxQDG0pdqR6ubl6Be6PMVKag9x1iu7wWGmuYxToWs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=asVzxH/4vCF1ZFdPsyIBQrGcT3tEF9Opv5l0Jjz3DQ+pja6oLJAloDSFaJ5zEACDf
 DJPVKnmj+4o4hmbDuTe0tbxR9wO6vD33QZKYp+dFr04v8kpxYLPn917xLU/QSUQ65i
 9BIcQ3Kqfc5SC7xw1w5uLhdoUO+U7Arkvfl4nJvsBlVQRr3vKLldDcqjsj86CCo7rs
 cqdcoqugHEYXnp3Zer4JW2whuEINRHdBZsaJd49bbV+voU0vUdqyoG4oTotKCf8hPv
 r0FxZb2inolr8Qwj0nNVl0FWfXiWYqLbxeSbyAXPMsYR8K037/2qDlt1iG1YBBq6/2
 iBNmDsWv0UrnQ==
Date: Fri, 23 Feb 2024 10:53:45 +0000
From: Lee Jones <lee@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: daniel.thompson@linaro.org, jingoohan1@gmail.com, deller@gmx.de,
 andy@kernel.org, robin@protonic.nl, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-input@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: Re: [PATCH v2 01/10] backlight: Match backlight device against
 struct fb_info.bl_dev
Message-ID: <20240223105345.GS10170@google.com>
References: <20240221094324.27436-1-tzimmermann@suse.de>
 <20240221094324.27436-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240221094324.27436-2-tzimmermann@suse.de>
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

On Wed, 21 Feb 2024, Thomas Zimmermann wrote:

> Framebuffer drivers for devices with dedicated backlight are supposed
> to set struct fb_info.bl_dev to the backlight's respective device. Use
> the value to match backlight and framebuffer in the backlight core code.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
>  drivers/video/backlight/backlight.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
> index 86e1cdc8e3697..48844a4f28ad3 100644
> --- a/drivers/video/backlight/backlight.c
> +++ b/drivers/video/backlight/backlight.c
> @@ -98,7 +98,8 @@ static int fb_notifier_callback(struct notifier_block *self,
>  {
>  	struct backlight_device *bd;
>  	struct fb_event *evdata = data;
> -	int node = evdata->info->node;
> +	struct fb_info *info = evdata->info;
> +	int node = info->node;
>  	int fb_blank = 0;
>  
>  	/* If we aren't interested in this event, skip it immediately ... */
> @@ -110,8 +111,12 @@ static int fb_notifier_callback(struct notifier_block *self,
>  
>  	if (!bd->ops)
>  		goto out;
> -	if (bd->ops->check_fb && !bd->ops->check_fb(bd, evdata->info))
> +	else if (bd->ops->check_fb && !bd->ops->check_fb(bd, info))
>  		goto out;
> +#if IS_ENABLED(CONFIG_FB_BACKLIGHT)

I don't want #ifery in C files.

Please find another way.

> +	else if (info->bl_dev && info->bl_dev != bd)
> +		goto out;
> +#endif
>  
>  	fb_blank = *(int *)evdata->data;
>  	if (fb_blank == FB_BLANK_UNBLANK && !bd->fb_bl_on[node]) {
> -- 
> 2.43.0
> 

-- 
Lee Jones [李琼斯]
