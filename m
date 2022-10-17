Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C955600F5D
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 14:45:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A834F10ED72;
	Mon, 17 Oct 2022 12:45:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CAEB10ED72
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 12:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666010698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cs82XH4sXgUSZOtjS6i0wK6ZOT3oI0tbNQspXF+f2h4=;
 b=i3SPtcVhQCRngfrfoM/vw3aGzxVqHRs/BfHvmc4ixljT49JCt4WCBtQsRCF0NkGqF35hGG
 5JcvT+KCZ842m7ACb1oheeRelWHzaqHpsf68JO+MpSShPx3k2mhKyewmlQo+Rowchvd4cE
 bPMDAy4dhFzo/5vauYQTDlqkeco1pnw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-569-LKdHvC9FMq2yaRa02dSbgA-1; Mon, 17 Oct 2022 08:44:57 -0400
X-MC-Unique: LKdHvC9FMq2yaRa02dSbgA-1
Received: by mail-wr1-f71.google.com with SMTP id
 p7-20020adfba87000000b0022cc6f805b1so3687175wrg.21
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 05:44:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Cs82XH4sXgUSZOtjS6i0wK6ZOT3oI0tbNQspXF+f2h4=;
 b=8HFTWafbikb4jZRWWzM08QamMZqMg3OEivAZyfvqWsJG5m+DI+NtXrzn1fmkt/Mu5V
 OlstNpBxdOPbSErY6NZECswQZMrZmkSVXk9nfzMKQzojafw6ez2gJCHzhfZ2G/dcsuOQ
 HKQrtdnlkEG8NlAujBkPdrK63/5w7QWW6IrEoClkJB6dVwKGFbreF/NzbrqXdpDQO5+4
 5cEnAQ0a1gaQUwQ02jwrjidrDWuxjuUatta5CV4Xe3YABgY4XKwub9m4AZN40bR23JF3
 tkJpbs1e0fJQponMMGxLOl5KfGhP34Oge36bMhCX7Ta+k4zQGZnn8VCwcodOu8ZDZmVw
 vJAA==
X-Gm-Message-State: ACrzQf3qWtU0hPo+kIpmYjobEJuTJNwPff12RbhbCxGfYnbx/tLZRriy
 Z0Far6woDuwv5KczNjFJiJj/tUV6ggqlFmZ2FFivh7X1a+R07e9LwNgyvEsGr09nbqKGz13tOYr
 ZWO2qifn4UGb7FvnY6r5f3GAJLAlu
X-Received: by 2002:adf:e6cc:0:b0:22c:e0b9:ef60 with SMTP id
 y12-20020adfe6cc000000b0022ce0b9ef60mr6315304wrm.404.1666010696618; 
 Mon, 17 Oct 2022 05:44:56 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7dBX4p6a+d/R+TMjwAl+9ubkWKIjgNBU9XtpT9ayHmSmmWHF7UnFuL6PjWIgTTk87uH0KCuw==
X-Received: by 2002:adf:e6cc:0:b0:22c:e0b9:ef60 with SMTP id
 y12-20020adfe6cc000000b0022ce0b9ef60mr6315276wrm.404.1666010696333; 
 Mon, 17 Oct 2022 05:44:56 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 q2-20020adff502000000b0022cc0a2cbecsm8457041wro.15.2022.10.17.05.44.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Oct 2022 05:44:54 -0700 (PDT)
Message-ID: <23d24724-7338-9d52-faa6-702792d25cac@redhat.com>
Date: Mon, 17 Oct 2022 14:44:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 3/5] drm/gem: Handle drm_gem_{begin,end}_cpu_access() in
 shadow-plane helpers
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 hdegoede@redhat.com, noralf@tronnes.org, david@lechnology.com,
 airlied@redhat.com, sean@poorly.run
References: <20221017111510.20818-1-tzimmermann@suse.de>
 <20221017111510.20818-4-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221017111510.20818-4-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On 10/17/22 13:15, Thomas Zimmermann wrote:
> Handle drm_gem_{begin,end}_cpu_access() in shadow-plane helpers during
> a commit. The functions synchronizes imported dma-buf objects with the
> exporter's state. If this fail (as signalled by an error code), atomic-
> commit helpers can now still abort the commit.
> 
> Several drivers already reserved CPU access in their atomic update
> handlers. Remove the respective calls, as they are no longer required.
> All other drivers with shadow planes that never bothered with these
> functions now correctly reserve CPU access to the framebuffer memory.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

[...]

> diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
> index f2795f90ea693..51e06eb76c613 100644
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
>  	ssd130x_update_rect(ssd130x, buf, rect);
>  
> -out_free:
>  	kfree(buf);
>  
> -	return ret;
> +	return 0;
>  }
>  

For ssd130x, 

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

