Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1876B90AD16
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 13:38:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 834FD10E368;
	Mon, 17 Jun 2024 11:38:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="K0JfVnuP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4955010E36D
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 11:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718624299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y0Kc7h87YsT9DHt1tRlY5kGZHCAuCj2NA4WSI3E/cJE=;
 b=K0JfVnuPgsSM0FIWN2X+YKIKWfKoc1aSwLgolaT7ufRkUkDvX4aukFUIK2406fQhuoGI1D
 YGxZhxnZW5DTZXNkY9zITBe4BwSjGlCSgxxyywtDU3WwDCLkEkXLtpfzyMelI+ir4Q8gb6
 DR9BPsBCUix/uOBMAshAS1s+mq1eNjE=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-139-1dllJnTCPneCaq4zcfvAMA-1; Mon, 17 Jun 2024 07:38:16 -0400
X-MC-Unique: 1dllJnTCPneCaq4zcfvAMA-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-52c968340c8so3895314e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 04:38:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718624295; x=1719229095;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=y0Kc7h87YsT9DHt1tRlY5kGZHCAuCj2NA4WSI3E/cJE=;
 b=DnNfp4TfUzNeAklH3bEiFbUng+jEOGn/046Tox2BFhzVZMpKKcPvtWaU2GDCMTRjnA
 NX3neiU8L1I73KTaItU2GPakIfXiQc7leilNBxhoUcK60k6eGFGeElxXEAE38FHS5mT/
 7QZ4Hw4bgwg9L8hZeadN9GNjS9iNhZqUhi4NICZTNOfRj+0JbizbBFlEN5TbfgAvfi1j
 +hhr42VZ/JtGuyQEQK2+AdLvSsnAS+Zk+k0yfLAmzArPxyfid3aOFGsByETvqQgliq7V
 vTB7AsXIxfFeu4onqAOHydwLnriZwWDnX+hMRWYUrFypCkuaGrjDJurcWK1nRje4egh5
 k7qg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1/Kno8S1CBJGyv4kctIecv51M+k3NdFGURrcOTj21Iu/d1gA6ME6VlmiATt/R1VqAHRLQDR4/NWVq/O2HMbvzkC9fl7Cs9BX9AzCmIwY6
X-Gm-Message-State: AOJu0YzkjTsQADE/KQOaXet3JkzGcM2RaAoDFPscnDrpEZepn4UYsuF1
 eoVWXarm/1NFNRxx992pp8miymiWAIZmEEt59goTRz3eMWYF4qqj3GIIPgMbAd6uBVFgCthEDxk
 wgnO4Y0Dq0CATRRs9vAqo2k1kH12EgXD4p5vXqA6Eczme2/GKAi3HAU/JooURozUl9A==
X-Received: by 2002:ac2:5f53:0:b0:52c:9bcc:e177 with SMTP id
 2adb3069b0e04-52ca6e6db3emr6446171e87.34.1718624295401; 
 Mon, 17 Jun 2024 04:38:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8ieLGLkSX25YvxUU73G1pJZDdpLd+LcNUpG3OzlHqw6rNPX8yyM8oB/AHOC5zwwT4lEJRAg==
X-Received: by 2002:ac2:5f53:0:b0:52c:9bcc:e177 with SMTP id
 2adb3069b0e04-52ca6e6db3emr6446167e87.34.1718624295024; 
 Mon, 17 Jun 2024 04:38:15 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e?
 ([2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422ffdc329asm122167725e9.1.2024.06.17.04.38.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 04:38:14 -0700 (PDT)
Message-ID: <7807302b-a501-46f5-8326-2b6394a3ab7c@redhat.com>
Date: Mon, 17 Jun 2024 13:38:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/tidss: Add drm_panic support
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Daniel Vetter
 <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jyri Sarha <jyri.sarha@iki.fi>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
References: <20240615085326.1726262-1-javierm@redhat.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240615085326.1726262-1-javierm@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 15/06/2024 10:53, Javier Martinez Canillas wrote:
> Add support for the drm_panic module, which displays a pretty user
> friendly message on the screen when a Linux kernel panic occurs.

Thanks for enabling drm panic on another hardware.
It looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>


> 
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
> Tested on an AM625 BeaglePlay board by triggering a panic using the
> `echo c > /proc/sysrq-trigger` command.
> 
>   drivers/gpu/drm/tidss/tidss_plane.c | 14 +++++++++++++-
>   1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_plane.c b/drivers/gpu/drm/tidss/tidss_plane.c
> index 68fed531f6a7..a5d86822c9e3 100644
> --- a/drivers/gpu/drm/tidss/tidss_plane.c
> +++ b/drivers/gpu/drm/tidss/tidss_plane.c
> @@ -8,6 +8,7 @@
>   #include <drm/drm_atomic_helper.h>
>   #include <drm/drm_blend.h>
>   #include <drm/drm_crtc.h>
> +#include <drm/drm_fb_dma_helper.h>
>   #include <drm/drm_fourcc.h>
>   #include <drm/drm_framebuffer.h>
>   #include <drm/drm_gem_atomic_helper.h>
> @@ -166,6 +167,14 @@ static const struct drm_plane_helper_funcs tidss_plane_helper_funcs = {
>   	.atomic_disable = tidss_plane_atomic_disable,
>   };
>   
> +static const struct drm_plane_helper_funcs tidss_primary_plane_helper_funcs = {
> +	.atomic_check = tidss_plane_atomic_check,
> +	.atomic_update = tidss_plane_atomic_update,
> +	.atomic_enable = tidss_plane_atomic_enable,
> +	.atomic_disable = tidss_plane_atomic_disable,
> +	.get_scanout_buffer = drm_fb_dma_get_scanout_buffer,
> +};
> +
>   static const struct drm_plane_funcs tidss_plane_funcs = {
>   	.update_plane = drm_atomic_helper_update_plane,
>   	.disable_plane = drm_atomic_helper_disable_plane,
> @@ -211,7 +220,10 @@ struct tidss_plane *tidss_plane_create(struct tidss_device *tidss,
>   	if (ret < 0)
>   		goto err;
>   
> -	drm_plane_helper_add(&tplane->plane, &tidss_plane_helper_funcs);
> +	if (type == DRM_PLANE_TYPE_PRIMARY)
> +		drm_plane_helper_add(&tplane->plane, &tidss_primary_plane_helper_funcs);
> +	else
> +		drm_plane_helper_add(&tplane->plane, &tidss_plane_helper_funcs);
>   
>   	drm_plane_create_zpos_property(&tplane->plane, tidss->num_planes, 0,
>   				       num_planes - 1);

