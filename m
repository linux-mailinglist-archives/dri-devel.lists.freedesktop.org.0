Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D379C2261
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 17:47:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01C8310EA18;
	Fri,  8 Nov 2024 16:47:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="U/coJSYM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4B7810EA18
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 16:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731084442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RrzV470lz6jbavS8eY4l7/NKHQXyo2/qM6LC527szQs=;
 b=U/coJSYMxr4fsS9FQNwrgIDRRT6+6VzdUPAkFl4Lws72j6Gw7d/rrS3YGoxoQYvODQ256u
 BR5sBVTPUmaTKk08B9lv1Chzcc/mww6J/AOExd3rR4DzB2zHHuKlRrP7HnEDgKJhh5F6yc
 hZsIUhduLtq8FvVC9MZNRayif83lqZM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-CmosCcu-OQaInsIIoVgFJA-1; Fri, 08 Nov 2024 11:47:19 -0500
X-MC-Unique: CmosCcu-OQaInsIIoVgFJA-1
X-Mimecast-MFC-AGG-ID: CmosCcu-OQaInsIIoVgFJA
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43151e4ef43so16324045e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Nov 2024 08:47:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731084438; x=1731689238;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RrzV470lz6jbavS8eY4l7/NKHQXyo2/qM6LC527szQs=;
 b=aCXBk4fpqO9sPkfB2TLZnQR9+bfM8x6IWXrid49IKW8+N4hhITiKFWGkuLQ0GHLGSE
 gLIco09ywc72VR1M8vwu43R5fK1vgj/NLlp3OeT0cGtcahTSWEqnSvieNHM/pppzOrV6
 QaO3oFyfxSl7CwHicpjj6d9gkaV3grW8/wExyPlJUyt9KnK5qsvi+6IloEXJaifKwn4Z
 iTZs6I2llL4yEmGwHLlJzhS/g2Q7ATUTHTv1cpvFqTndNZbn9Mt1Nrxy380mf1toOaMe
 GkWm12RpOgaDbMyIpI+B5ALWeLb0uTK5WFeRkgEm5VlD1iS9jMzO9rCpk7kCF7x6oUvj
 JTbQ==
X-Gm-Message-State: AOJu0YzkdDapQD1ySadfovhezFsksm+gO9jt74apqKfBU0dKrPfmDnnd
 noVVxkjcsXGPhZX3/PnOF0Vri3A+16II1mvSSc4Fgh2mPg9Aknki/LboJ5fzu2/sc1VFiBHCrMT
 +VoUA5eOUdrv/w8O5gmdmNCFwgQpWANwOndX527TSNfKSTbvs58o4seVV3Hgk9bEt2Q==
X-Received: by 2002:a05:6000:4816:b0:37c:c9ae:23fb with SMTP id
 ffacd0b85a97d-381f183f82cmr3201375f8f.40.1731084438380; 
 Fri, 08 Nov 2024 08:47:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG2sBzBpJqXdphPHxQB/tF/8n+Lov/Qj7dmTobwMJIiKckxC/7gcVrJAZCSB8iIkttCwCIqbA==
X-Received: by 2002:a05:6000:4816:b0:37c:c9ae:23fb with SMTP id
 ffacd0b85a97d-381f183f82cmr3201359f8f.40.1731084438006; 
 Fri, 08 Nov 2024 08:47:18 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432bc469293sm1469925e9.0.2024.11.08.08.47.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Nov 2024 08:47:17 -0800 (PST)
Message-ID: <f1b6dcb4-f20a-43e2-a95a-76665f013c6d@redhat.com>
Date: Fri, 8 Nov 2024 17:47:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/fbdev-client: Unexport drm_fbdev_client_setup()
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20241108154600.126162-1-tzimmermann@suse.de>
 <20241108154600.126162-4-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20241108154600.126162-4-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LXGs-Dd_eM4eY5tlzXbcs7-Ad7UyOds115KzIhM2uE4_1731084438
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

On 08/11/2024 16:42, Thomas Zimmermann wrote:
> DRM drivers invoke drm_client_setup() to set up in-kernel clients.
> No driver should call drm_fbdev_client_setup() directly. Therefore,
> unexport the symbol and move the declaration to the internal header
> drm_client_internal.h.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   .../gpu/drm/clients/drm_client_internal.h                     | 4 ++--
>   drivers/gpu/drm/clients/drm_client_setup.c                    | 3 ++-
>   drivers/gpu/drm/clients/drm_fbdev_client.c                    | 4 ++--
>   3 files changed, 6 insertions(+), 5 deletions(-)
>   rename include/drm/drm_fbdev_client.h => drivers/gpu/drm/clients/drm_client_internal.h (85%)
> 
> diff --git a/include/drm/drm_fbdev_client.h b/drivers/gpu/drm/clients/drm_client_internal.h
> similarity index 85%
> rename from include/drm/drm_fbdev_client.h
> rename to drivers/gpu/drm/clients/drm_client_internal.h
> index e11a5614f127..23258934956a 100644
> --- a/include/drm/drm_fbdev_client.h
> +++ b/drivers/gpu/drm/clients/drm_client_internal.h
> @@ -1,7 +1,7 @@
>   /* SPDX-License-Identifier: MIT */
>   
> -#ifndef DRM_FBDEV_CLIENT_H
> -#define DRM_FBDEV_CLIENT_H
> +#ifndef DRM_CLIENT_INTERNAL_H
> +#define DRM_CLIENT_INTERNAL_H
>   
>   struct drm_device;
>   struct drm_format_info;
> diff --git a/drivers/gpu/drm/clients/drm_client_setup.c b/drivers/gpu/drm/clients/drm_client_setup.c
> index c6a295d5de50..4b211a4812b5 100644
> --- a/drivers/gpu/drm/clients/drm_client_setup.c
> +++ b/drivers/gpu/drm/clients/drm_client_setup.c
> @@ -2,10 +2,11 @@
>   
>   #include <drm/clients/drm_client_setup.h>
>   #include <drm/drm_device.h>
> -#include <drm/drm_fbdev_client.h>
>   #include <drm/drm_fourcc.h>
>   #include <drm/drm_print.h>
>   
> +#include "drm_client_internal.h"
> +
>   /**
>    * drm_client_setup() - Setup in-kernel DRM clients
>    * @dev: DRM device
> diff --git a/drivers/gpu/drm/clients/drm_fbdev_client.c b/drivers/gpu/drm/clients/drm_fbdev_client.c
> index 246fb63ab250..f894ba52bdb5 100644
> --- a/drivers/gpu/drm/clients/drm_fbdev_client.c
> +++ b/drivers/gpu/drm/clients/drm_fbdev_client.c
> @@ -3,11 +3,12 @@
>   #include <drm/drm_client.h>
>   #include <drm/drm_crtc_helper.h>
>   #include <drm/drm_drv.h>
> -#include <drm/drm_fbdev_client.h>
>   #include <drm/drm_fb_helper.h>
>   #include <drm/drm_fourcc.h>
>   #include <drm/drm_print.h>
>   
> +#include "drm_client_internal.h"
> +
>   /*
>    * struct drm_client_funcs
>    */
> @@ -164,4 +165,3 @@ int drm_fbdev_client_setup(struct drm_device *dev, const struct drm_format_info
>   	kfree(fb_helper);
>   	return ret;
>   }
> -EXPORT_SYMBOL(drm_fbdev_client_setup);

