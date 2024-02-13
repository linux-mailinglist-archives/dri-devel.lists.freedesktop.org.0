Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 313C6853202
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 14:33:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C27610E0B4;
	Tue, 13 Feb 2024 13:33:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=protonic.nl header.i=@protonic.nl header.b="SYASL+WP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 963 seconds by postgrey-1.36 at gabe;
 Tue, 13 Feb 2024 13:33:33 UTC
Received: from smtp28.bhosted.nl (smtp28.bhosted.nl [94.124.121.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8593A10E0B4
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 13:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonic.nl; s=202111;
 h=content-transfer-encoding:content-type:mime-version:references:in-reply-to:
 message-id:subject:cc:to:from:date:from;
 bh=3SqP4dG1tq+TGDU5Zf/cjAiZPv2I7xysnRYtNRsJZg8=;
 b=SYASL+WPVjjWM85nIJ3YyBPVcxZkjRdNZbuZQmNeduW+QOqL+VHR7nSWt4euxWt92KyJwIZdZwWTq
 eaeLYlwX22GWEYsdFAwVYuNXeDYH+ri2KQnfboya8D4QggmEqaz+nXX+bJH3LPIiL+AB8dk3DZ+CXg
 QIVBtfApRikahNSjJ1+zSyk8OCHO11bL2jYbeqnEycYtKL/Iulq2kWdjazmHjRi2FSYxh62/zNCl/P
 /ZnBHGu2tpcVF23ifZPzfuc/nCBG/zsuUM6kiJX5n/1hIlIidHY57q8q/WqXkUK6HD3x4qA0DjqEHk
 dXd0zgDF37DvKGPmmYbQY78i+WHGjPw==
X-MSG-ID: 38c347f3-ca72-11ee-ba6d-0050568164d1
Date: Tue, 13 Feb 2024 14:17:21 +0100
From: Robin van der Gracht <robin@protonic.nl>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 deller@gmx.de, javierm@redhat.com, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-input@vger.kernel.org,
 linux-pwm@vger.kernel.org
Subject: Re: [PATCH 02/10] auxdisplay/ht16k33: Remove struct
 backlight_ops.check_fb
Message-ID: <20240213141721.29eb6ce0@ERD993>
In-Reply-To: <20240212162645.5661-3-tzimmermann@suse.de>
References: <20240212162645.5661-1-tzimmermann@suse.de>
 <20240212162645.5661-3-tzimmermann@suse.de>
Organization: Protonic Holland
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
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

On Mon, 12 Feb 2024 17:16:35 +0100
Thomas Zimmermann <tzimmermann@suse.de> wrote:

> The driver sets struct fb_info.bl_dev to the correct backlight
> device. Thus rely on the backlight core code to match backlight
> and framebuffer devices, and remove the extra check_fb function
> from struct backlight_ops.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Robin van der Gracht <robin@protonic.nl>
> ---
>  drivers/auxdisplay/ht16k33.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/auxdisplay/ht16k33.c b/drivers/auxdisplay/ht16k33.c
> index a90430b7d07ba..0a858db32486b 100644
> --- a/drivers/auxdisplay/ht16k33.c
> +++ b/drivers/auxdisplay/ht16k33.c
> @@ -325,16 +325,8 @@ static int ht16k33_bl_update_status(struct backlight_device *bl)
>  	return ht16k33_brightness_set(priv, brightness);
>  }
>  
> -static int ht16k33_bl_check_fb(struct backlight_device *bl, struct fb_info *fi)
> -{
> -	struct ht16k33_priv *priv = bl_get_data(bl);
> -
> -	return (fi == NULL) || (fi->par == priv);
> -}
> -
>  static const struct backlight_ops ht16k33_bl_ops = {
>  	.update_status	= ht16k33_bl_update_status,
> -	.check_fb	= ht16k33_bl_check_fb,
>  };

When combined with the previous patch:
[01/10] backlight: Match backlight device against struct fb_info.bl_dev

(I wasn't in the CC)

Acked-By: Robin van der Gracht <robin@protonic.nl>


