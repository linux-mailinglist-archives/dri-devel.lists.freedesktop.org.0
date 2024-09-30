Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9856398A11B
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 13:49:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1426010E3FB;
	Mon, 30 Sep 2024 11:49:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="iMDs7fC0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C539A10E3FB
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 11:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1727696987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hRHusF2u13MvXHMTKgH6gtL/plFCBlz+aey7QHJzopk=;
 b=iMDs7fC0nd5oK2id//Y7BoLLvBJdy2YG8pWhG4+Yt0hmm8ZPdtjyCN82F1YGfUOADGhq8i
 o5kBDwNyUA7pgwXZF05/swrAm0h1O0hqcAEUbktYdffzha+y4cOoLpriSZY/GhWdx5+ksi
 qYxBGFI6pKMNISP4CePIyB7oK1ElThk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-pzgUTLYXPE6ldo5L7rpa2Q-1; Mon, 30 Sep 2024 07:49:46 -0400
X-MC-Unique: pzgUTLYXPE6ldo5L7rpa2Q-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-37cd2044558so1806098f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 04:49:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727696985; x=1728301785;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hRHusF2u13MvXHMTKgH6gtL/plFCBlz+aey7QHJzopk=;
 b=pmZHqoxzsyuF5T4pOhZRk3PzlcI5mYsbb9pWbjkedMFtzkuxFXR1Bt70wsejXaWvk2
 ultt00xYz5sFJbYtq6vsO5JxFLBpMADDwVYH1p6hnzNOb+xd7R9Nwmlqb7r5er1J6k2v
 RvEUcsmoz0o+pb6QFoqRtqnklFLQ3g2mH+JELZVwfPCh9lxNqj2q9RsviT1gcQ5sZQYL
 0Fj3pexMOQmtoBBNtgeUlZ76sbmH7KKpEfOsqC8RYXqurrnrdZA6EO0Jm31u5usBrsr2
 /IcaLHc9BtEk8mtFWRJyzB2N+LbvX/NwV5xS1bGkcsuAY/6WxnCzoXDdU5Hqrb50z1rK
 wTcA==
X-Gm-Message-State: AOJu0YxCJpco0oq6l5XfW9HFOhNG6e3aa6bQrg2x3TdvLWjRB/lXpGVo
 22eFDba4NhgCzCUOQdeHQi62igXbf+OcEyoJGODXX5rZ1cxzzhSkv3X354t5CgzJRLxm786rmna
 iFy0Smumy+YD4Ab3q/8Jvn++7N/wGTbCZFgKQSUNhjrRkx4vb47uoW2HVqjdzp25rPg==
X-Received: by 2002:adf:e44c:0:b0:37c:d225:6d33 with SMTP id
 ffacd0b85a97d-37cd5b10603mr7648024f8f.55.1727696985234; 
 Mon, 30 Sep 2024 04:49:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRSGiGfEDOq94l9bERm0mGRovZs/S+44uf5VGWQUgGYf4IhIky78bVci0l0GCqb8jHV0O02A==
X-Received: by 2002:adf:e44c:0:b0:37c:d225:6d33 with SMTP id
 ffacd0b85a97d-37cd5b10603mr7648003f8f.55.1727696984799; 
 Mon, 30 Sep 2024 04:49:44 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37cd56e6596sm8910891f8f.63.2024.09.30.04.49.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Sep 2024 04:49:44 -0700 (PDT)
Message-ID: <50d1f4d1-538c-4e4d-83eb-4b85f7642eb7@redhat.com>
Date: Mon, 30 Sep 2024 13:49:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] drm: Select fbdev helpers for modules that require
 them
To: Thomas Zimmermann <tzimmermann@suse.de>, simona@ffwll.ch,
 airlied@gmail.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
References: <20240927144252.31813-1-tzimmermann@suse.de>
 <20240927144252.31813-5-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240927144252.31813-5-tzimmermann@suse.de>
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

On 27/09/2024 16:37, Thomas Zimmermann wrote:
> Fbdev emulation for SHMEM and TTM requires helpers from the fbdev
> subsystem. Select them from the modules that use them instead of the
> core DRM module.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/Kconfig | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 1df4e627e3d3..88b2ba55fe16 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -11,7 +11,6 @@ menuconfig DRM
>   	select DRM_PANEL_ORIENTATION_QUIRKS
>   	select DRM_KMS_HELPER if DRM_FBDEV_EMULATION
>   	select FB_CORE if DRM_FBDEV_EMULATION
> -	select FB_SYSMEM_HELPERS_DEFERRED if DRM_FBDEV_EMULATION
>   	select HDMI
>   	select I2C
>   	select DMA_SHARED_BUFFER
> @@ -332,6 +331,7 @@ config DRM_TTM_HELPER
>   	tristate
>   	depends on DRM
>   	select DRM_TTM
> +	select FB_SYSMEM_HELPERS_DEFERRED if DRM_FBDEV_EMULATION
>   	help
>   	  Helpers for ttm-based gem objects
>   
> @@ -345,6 +345,7 @@ config DRM_GEM_DMA_HELPER
>   config DRM_GEM_SHMEM_HELPER
>   	tristate
>   	depends on DRM && MMU
> +	select FB_SYSMEM_HELPERS_DEFERRED if DRM_FBDEV_EMULATION
>   	help
>   	  Choose this if you need the GEM shmem helper functions
>   

