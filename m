Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DABE7F3F5D
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 08:59:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC3F310E5C1;
	Wed, 22 Nov 2023 07:59:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 963 seconds by postgrey-1.36 at gabe;
 Wed, 22 Nov 2023 07:59:04 UTC
Received: from smtp28.bhosted.nl (smtp28.bhosted.nl [IPv6:2a02:9e0:8000::40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5106D10E5C1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 07:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonic.nl; s=202111;
 h=message-id:references:in-reply-to:reply-to:subject:cc:to:from:date:
 content-transfer-encoding:content-type:mime-version:from;
 bh=SC0Nw0my4KjFTp1RacZCDCq2iioSI8JO41AN2e4nWTY=;
 b=VF5AqAqqnjRkem47thuhhInpkmmmxgG7odln5T5AkNXvm1TP8Q4p9OflI7MFxN79WsXgeFj8FLpR0
 1Px4GtAvbH9I1n4mgnI89TidxsqnvShDMljdpTIcJIJxk+zRyXT86oqhCZ1SfUUXTtqriUayBvGrkF
 grRvewyPVP2aM3iKlenteSYJQWhzohl+Gd8YTVHCLcW4zUxbHXTWbLAU5oG3jaKC2lOjwtn4ZDGRci
 9tZQ4hYrJhUI3eghqgcA84E7vx159IIvJHpi8qoutHtSrvwdgyr0lt0k19qAmcMtd2Pwi9Dpcoso88
 xHpN81P9EgYThVmsNWYmAMcDIXUL2AQ==
X-MSG-ID: c1304799-890a-11ee-893f-0050568164d1
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 22 Nov 2023 08:42:57 +0100
From: Robin van der Gracht <robin@protonic.nl>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 09/32] auxdisplay/ht16k33: Set FBINFO_VIRTFB flag
Organization: Protonic Holland
Mail-Reply-To: robin@protonic.nl
In-Reply-To: <20231115102954.7102-10-tzimmermann@suse.de>
References: <20231115102954.7102-1-tzimmermann@suse.de>
 <20231115102954.7102-10-tzimmermann@suse.de>
Message-ID: <6eacca1f78abb718ed1b5bb8b37b6e95@protonic.nl>
X-Sender: robin@protonic.nl
User-Agent: Roundcube Webmail/1.3.1 
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
Reply-To: robin@protonic.nl
Cc: dri-devel@lists.freedesktop.org, Miguel Ojeda <ojeda@kernel.org>,
 deller@gmx.de, javierm@redhat.com, linux-fbdev@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-11-15 11:19, Thomas Zimmermann wrote:
> The ht16k33 driver operates on system memory. Mark the framebuffer
> accordingly. Helpers operating on the framebuffer memory will test
> for the presence of this flag.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Miguel Ojeda <ojeda@kernel.org>
> Cc: Robin van der Gracht <robin@protonic.nl>
> ---
>  drivers/auxdisplay/ht16k33.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/auxdisplay/ht16k33.c 
> b/drivers/auxdisplay/ht16k33.c
> index 3a2d883872249..f1716e3ce6a92 100644
> --- a/drivers/auxdisplay/ht16k33.c
> +++ b/drivers/auxdisplay/ht16k33.c
> @@ -640,6 +640,7 @@ static int ht16k33_fbdev_probe(struct device *dev,
> struct ht16k33_priv *priv,
> 
>  	INIT_DELAYED_WORK(&priv->work, ht16k33_fb_update);
>  	fbdev->info->fbops = &ht16k33_fb_ops;
> +	fbdev->info->flags |= FBINFO_VIRTFB;
>  	fbdev->info->screen_buffer = fbdev->buffer;
>  	fbdev->info->screen_size = HT16K33_FB_SIZE;
>  	fbdev->info->fix = ht16k33_fb_fix;

Acked-by: Robin van der Gracht <robin@protonic.nl>
