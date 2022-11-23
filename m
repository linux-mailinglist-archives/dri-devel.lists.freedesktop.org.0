Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C891B635252
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 09:23:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21B2810E514;
	Wed, 23 Nov 2022 08:23:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD96710E513
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 08:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669191758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UCXMFJWj4hYCmptCXHzBdfC/T+r6M4pxBZeQd74/cE8=;
 b=etejlga4SbSHe/TRhurIzUw+5eTpJ11/TAK268aM2kq3Ot2b5hhYRD65+2UQoH5yEXbT1/
 GKtaeFInYlEx3b1zylYVsYvZFK2owT1fiTL8wzxMAppPXDcB8AaPfyZH7ydB8mGq+ioSty
 zSFA+CI+YZr7jim2jBl5RG3Rvy6LMXo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-223-ENpWRLB2PZCllkbue_P-lg-1; Wed, 23 Nov 2022 03:22:36 -0500
X-MC-Unique: ENpWRLB2PZCllkbue_P-lg-1
Received: by mail-wm1-f71.google.com with SMTP id
 m34-20020a05600c3b2200b003cf549cb32bso745614wms.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 00:22:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UCXMFJWj4hYCmptCXHzBdfC/T+r6M4pxBZeQd74/cE8=;
 b=YGtICD9WP/LmfH2CerIqQ9UCRSmAQZSAGO2d0yKoOPNR2+MNhVxMEZAMu9a/VGLWXQ
 FNcPcsQ/W29kg8RvrtIfh5d8MmQ7f0VeLFSfs6ldVOJyfqw0envuGEiHGVFjDq2acV5i
 T3E0kKEgl8rgTTMILi04yp9w64nidNz8OlDxOMlOSHItVtM085XZb1VXYuvOG4d1xcTQ
 bUhB/+S/G3CpcrlOCTeJ/K5rXEw1t1tZUD4TQ9OlS2tgvDgbYgc+AzGa4/xrSo5tctYb
 zTIvQrz7qq641m/vEipGTTV9ZNuHs3SkboZBpFjGt3V2hZwy7ltxdHUvZJWPog0MiW+s
 xxew==
X-Gm-Message-State: ANoB5plyB3PfUMMA6Al0bQE6uLcZdMofA0OriZamJfDUuDVEcp0AL+IU
 cp3hiXJB/6Gtd2AhBRiUBwaR7lqlm65gM4BG0OT9DJSBV0Ji6pYj9IiikOGFdFLr1ODIoEUBfH0
 B1zObLpdT7jhqPd8P41t2TbYxkbjt
X-Received: by 2002:adf:aa9b:0:b0:241:d17a:3fde with SMTP id
 h27-20020adfaa9b000000b00241d17a3fdemr9255387wrc.138.1669191755396; 
 Wed, 23 Nov 2022 00:22:35 -0800 (PST)
X-Google-Smtp-Source: AA0mqf64HKioW3RrRn4smu0y59HYkcgnMoImj1ZLnZS5XifXpdL0uwnLj2KFW12g1jIDLgmF8W8TuQ==
X-Received: by 2002:adf:aa9b:0:b0:241:d17a:3fde with SMTP id
 h27-20020adfaa9b000000b00241d17a3fdemr9255378wrc.138.1669191755151; 
 Wed, 23 Nov 2022 00:22:35 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 r11-20020a05600c35cb00b003a84375d0d1sm1428052wmq.44.2022.11.23.00.22.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Nov 2022 00:22:34 -0800 (PST)
Message-ID: <79b39092-7f0d-5651-ac4f-f10d72411e34@redhat.com>
Date: Wed, 23 Nov 2022 09:22:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 1/6] drm/gem: shadow_fb_access: Prepare imported buffers
 for CPU access
To: noralf@tronnes.org, Thomas Zimmermann <tzimmermann@suse.de>,
 stable@kernel.org, Dave Airlie <airlied@redhat.com>,
 dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Maxime Ripard <mripard@kernel.org>
References: <20221122-gud-shadow-plane-v1-0-9de3afa3383e@tronnes.org>
 <20221122-gud-shadow-plane-v1-1-9de3afa3383e@tronnes.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221122-gud-shadow-plane-v1-1-9de3afa3383e@tronnes.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Hello Noralf,

On 11/22/22 21:58, Noralf Trønnes via B4 Submission Endpoint wrote:
> From: Noralf Trønnes <noralf@tronnes.org>
> 
> Complete the shadow fb access functions by also preparing imported buffers
> for CPU access. Update the affected drivers that currently use
> drm_gem_fb_begin_cpu_access().
>
> Through this change the following SHMEM drivers will now also make sure
> their imported buffers are prepared for CPU access: cirrus, hyperv,
> mgag200, vkms
> 

[...]

> @@ -378,11 +379,20 @@ int drm_gem_begin_shadow_fb_access(struct drm_plane *plane, struct drm_plane_sta
>  {
>  	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
>  	struct drm_framebuffer *fb = plane_state->fb;
> +	int ret;
>  
>  	if (!fb)
>  		return 0;
>  
> -	return drm_gem_fb_vmap(fb, shadow_plane_state->map, shadow_plane_state->data);
> +	ret = drm_gem_fb_vmap(fb, shadow_plane_state->map, shadow_plane_state->data);
> +	if (ret)
> +		return ret;
> +
> +	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
> +	if (ret)
> +		drm_gem_fb_vunmap(fb, shadow_plane_state->map);
> +
> +	return ret;

Makes sense to me to have the CPU access prepare here too.

> diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
> index 53464afc2b9a..58a2f0113f24 100644
> --- a/drivers/gpu/drm/solomon/ssd130x.c
> +++ b/drivers/gpu/drm/solomon/ssd130x.c
> @@ -544,7 +544,6 @@ static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb, const struct iosys_m
>  	struct ssd130x_device *ssd130x = drm_to_ssd130x(fb->dev);
>  	struct iosys_map dst;
>  	unsigned int dst_pitch;
> -	int ret = 0;
>  	u8 *buf = NULL;
>  
>  	/* Align y to display page boundaries */
> @@ -556,21 +555,14 @@ static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb, const struct iosys_m
>  	if (!buf)
>  		return -ENOMEM;
>  
> -	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
> -	if (ret)
> -		goto out_free;
> -
>  	iosys_map_set_vaddr(&dst, buf);
>  	drm_fb_xrgb8888_to_mono(&dst, &dst_pitch, vmap, fb, rect);
>  
> -	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
> -

The only thing I'm not sure about is that drivers used to call the begin/end
CPU access only during the window while the BO data was accessed but now the
windows will be slightly bigger if that happens in .{begin,end}_fb_access.

If that's not an issue then, I agree with your patch since it simplifies the
logic in the drivers and gets rid of duplicated code.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

