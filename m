Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B48B19183C6
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 16:19:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1D4910E270;
	Wed, 26 Jun 2024 14:19:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fQQwstXZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8057310E8DF
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 14:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719411567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j3+6+X1eVY0Jkg6cNgj0EcYrMDIo+k7L8u8CKTnBBMg=;
 b=fQQwstXZeZNN5B+38+rlCAp64IMlkpQuqJuTnR9JYLiejLvUg4206e1P5G0NJLc1is2fuc
 c8TzdtJ7/yt2riaoMcjIrUkeXrfnlmZNYMdlB/IL+Muc+Zpd8fR3t/GXSTCZ4yE4jJEMJ4
 /LJpfRAyCGetRT/O+/5sjJnsaoWTe9A=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-457-zI645fz0MoufxREKMoQrtQ-1; Wed, 26 Jun 2024 10:19:24 -0400
X-MC-Unique: zI645fz0MoufxREKMoQrtQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-424fb2df2bdso6284115e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 07:19:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719411562; x=1720016362;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=j3+6+X1eVY0Jkg6cNgj0EcYrMDIo+k7L8u8CKTnBBMg=;
 b=iT3Z1bfX4oa29u6EGBDIs/DucZWGwfDbVyfl4eXBl0fSp3C9XbPkZBwdjFK3yMCAJ9
 yWfhlcaWmfJlrY5Zbe3Cc35TbytfPHg8lkcytd+T5mzwDt/ZXJ6ZvS/PlrWs8Oqy1q6f
 He0UGDu+z346rq49DfJK/3fzV15bHadR+AE8cUBgawiDhihJT0v2n0FGXQ0obYqFLiOG
 4Int6SCFUu/WoCIH+aIKWRay4AZOisg2tZFj96n/Bn7khM0L6c+Q7dcwT/1ECkvMC+kK
 /OOd2o8f2m2d6xTATYzhKOmabn4QdKVygBmEmsWhOHy/hLe3OtK/UhKAlkINgw1pdn2W
 Zh9Q==
X-Gm-Message-State: AOJu0YzZvjTYy2nuzZ0/VQs/GDo/fi6P7pMyV006SIQqgHFGcc0CZLb/
 W/Yj29LL+x510WpReM6l5v+hGkHTJDu/UrYVKoa5Nz63zfG6bojbbhd4tKDAEvvPw0N17oDXUhx
 QhBH8mvZqtOiDh1ZlHOW6x0tBrt3cXdoZYe1P2+myqlDlh15ELPvb73+UnX5tob0hMKeb258SgA
 ==
X-Received: by 2002:a05:600c:4790:b0:425:5f12:1cf9 with SMTP id
 5b1f17b1804b1-4255f1238aemr13234835e9.27.1719411562301; 
 Wed, 26 Jun 2024 07:19:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGax9kaCNhOUBP+phnm1HFeZemuLngNNz4bs/QuG7DeUYhJ/v9FE8YtoxfaDOcJ9+RPmKYo0A==
X-Received: by 2002:a05:600c:4790:b0:425:5f12:1cf9 with SMTP id
 5b1f17b1804b1-4255f1238aemr13234675e9.27.1719411561967; 
 Wed, 26 Jun 2024 07:19:21 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e?
 ([2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36638d9b8a8sm15874592f8f.50.2024.06.26.07.19.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jun 2024 07:19:21 -0700 (PDT)
Message-ID: <f647756a-fa9b-4a97-8c33-826f7496821f@redhat.com>
Date: Wed, 26 Jun 2024 16:19:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/panic: Do not select DRM_KMS_HELPER
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <cover.1719391132.git.geert+renesas@glider.be>
 <60155f8c939ed286e324a7c12a1daa69fe49fcf6.1719391132.git.geert+renesas@glider.be>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <60155f8c939ed286e324a7c12a1daa69fe49fcf6.1719391132.git.geert+renesas@glider.be>
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



On 26/06/2024 10:41, Geert Uytterhoeven wrote:
> DRM core code cannot call into DRM helper code, as this would lead to
> circular references in the modular case.  Hence drop the selection of
> DRM_KMS_HELPER.  It was unused anyway, as v10 switched from using
> the DRM format helpers to its own color format conversion, cfr. commit
> 9544309775c334c9 ("drm/panic: Add support for color format
> conversion")).

Thanks a lot for this cleanup,

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Remove the unneeded include of <drm/drm_format_helper.h>.
> 
> Fixes: bf9fb17c6672868d ("drm/panic: Add a drm panic handler")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>   drivers/gpu/drm/Kconfig     | 1 -
>   drivers/gpu/drm/drm_panic.c | 1 -
>   2 files changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index b903a2c0b5e8f95c..ce9bf2b6e9d332d4 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -108,7 +108,6 @@ config DRM_KMS_HELPER
>   config DRM_PANIC
>   	bool "Display a user-friendly message when a kernel panic occurs"
>   	depends on DRM && !(FRAMEBUFFER_CONSOLE && VT_CONSOLE)
> -	select DRM_KMS_HELPER
>   	select FONT_SUPPORT
>   	help
>   	  Enable a drm panic handler, which will display a user-friendly message
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index 8d2eded1fd19ff6c..67f78b5a76b61e3d 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -20,7 +20,6 @@
>   #include <linux/types.h>
>   
>   #include <drm/drm_drv.h>
> -#include <drm/drm_format_helper.h>
>   #include <drm/drm_fourcc.h>
>   #include <drm/drm_framebuffer.h>
>   #include <drm/drm_modeset_helper_vtables.h>

