Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 661FAACEFD7
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 15:02:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0805110E27D;
	Thu,  5 Jun 2025 13:02:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="jQBnzzit";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8855110E27D
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 13:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749128571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xg498BWU6yCD+3EXYlmoQ452Swm7wT/w2qqavlOm8pU=;
 b=jQBnzzitZ9fOxanrVar6jUnGWUtm4+yoLU5n6iXLOxuVQ2dPN3zaeJ3HgEKtdI4Ilc1Jly
 oCULvBV2X5zLHUPjuamDdioEjjgeqg34Vbpfh84t6WpiEP4ddCTAW9WnRwymceqrlDhTQv
 k/iR6KxskjK4kAgJGofYC9qtb+o95JE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-570-wBrsYLUfPnOToa2MGJa8Zg-1; Thu, 05 Jun 2025 09:02:50 -0400
X-MC-Unique: wBrsYLUfPnOToa2MGJa8Zg-1
X-Mimecast-MFC-AGG-ID: wBrsYLUfPnOToa2MGJa8Zg_1749128569
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-450db029f2aso4295375e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jun 2025 06:02:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749128569; x=1749733369;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xg498BWU6yCD+3EXYlmoQ452Swm7wT/w2qqavlOm8pU=;
 b=ZnjrRPW2Q2YSU00tm6G3GnSTttCzlwvBUYNAFePhEeUtyU1unpt/pcH98ZVS882xeo
 72oqvP6hr6flfSgFvGuoCSvQJL34nNUxHUyTlCFABz+EWeUaOXLE1OdryybkeYE6dMM3
 F/jg/Na+rbum/IwkJOwsbjiVYjvrOz0STydG5DmHa/JFyqYkbDyv8O1AHBXfNXzmjC5W
 DQM5MLMms7EF2rpNYsy6RyhM7hRrrkvndEWGcqs9gTvsdKIz8F1pZ7bfUuPbs8fwRa1S
 skN1TFWfvH2cAIacXLke0z8tLj/yYchYd0yCGtgKFDZWvgFD4u7ytaS++D6GAHi4nVkS
 eT6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+cuq3GoSr/NeMpwLMMtyGW5HuJceSBx8Lbtvg2DSzlGCuenpVcL1ywxAsUh2Cldcaz9UN1lfoQIE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQFZNHfz76BmviwoLSuYSGEio8JDjRzRVAykzPhZHYYia863hg
 5VnzDR5uINLK0oPSm0kgkVmAty47gF98ZHG7FL6yvs/ro7C1p3H+ZhqjZ7LebEv2q2nkcDFq3K4
 LfTHKmaBB3RAT/HFNBZe52wJGRPm7XB621Ctic8w1WUlI2bJUvU9LjehOCXGfELmE9cHf+pxtBD
 ojFA==
X-Gm-Gg: ASbGncsJhVHuUNRA4WTsqV/KrGgO9R+g+sRFfUoWytvHQxEwhaXQzNsWpqbzj09hD0Y
 NloOUZeV0p2wvGlXwn8GlxinnQWekfr/WV2h6RWIdJCLeV0zFU2okuY/iN3eIAJVs6UKuJ/zs9E
 h/yq9UlbRipQzKQkDtdizzRMQYrfxcextjLQqY+O4Z8fJPD4o4U5taDoW/b7Iyx1j2fzcMAc/y9
 2l9QlDtup0yZOzeWzIoaCiPH+NeJDidPc0Olu+Kja93Wq80c9nfoiLydflsPWV5nxlsLUyHZezs
 0UmZfoRWshPwGx5K7L7KBv7CAsE8+xTuwZH5cvBtAs2xIKobnkg=
X-Received: by 2002:a05:6000:2204:b0:3a1:f564:cd9d with SMTP id
 ffacd0b85a97d-3a51d961c1fmr5842949f8f.36.1749128569248; 
 Thu, 05 Jun 2025 06:02:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLOWcpTWTCDyXBY4w2ZvbieYKYJr5NwdKMUi24PSZUQgwCDHfdsFZ1q9E35GmfdHu/7yFH7g==
X-Received: by 2002:a05:6000:2204:b0:3a1:f564:cd9d with SMTP id
 ffacd0b85a97d-3a51d961c1fmr5842816f8f.36.1749128568020; 
 Thu, 05 Jun 2025 06:02:48 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4f00a13fasm24830979f8f.98.2025.06.05.06.02.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 06:02:47 -0700 (PDT)
Message-ID: <f1927c1b-95b7-4d98-9d95-fcd52bd06766@redhat.com>
Date: Thu, 5 Jun 2025 15:02:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC drm-misc-next v2 1/1] drm/hyperv: Add support for
 drm_panic
To: Ryosuke Yasuoka <ryasuoka@redhat.com>, drawat.floss@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Cc: linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20250526090117.80593-1-ryasuoka@redhat.com>
 <20250526090117.80593-2-ryasuoka@redhat.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250526090117.80593-2-ryasuoka@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hfqoOYyJUGLaIG0HyepAMmy7CVqEdTdGvOZpCki_4lA_1749128569
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

On 26/05/2025 11:01, Ryosuke Yasuoka wrote:
> Add drm_panic module for hyperv drm so that panic screen can be
> displayed on panic.

I've just pushed it to drm-misc-next.

Thanks for your contribution.

-- 

Jocelyn

> 
> Signed-off-by: Ryosuke Yasuoka <ryasuoka@redhat.com>
> ---
>   drivers/gpu/drm/hyperv/hyperv_drm_modeset.c | 36 +++++++++++++++++++++
>   1 file changed, 36 insertions(+)
> 
> diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
> index f7d2e973f79e..945b9482bcb3 100644
> --- a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
> +++ b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
> @@ -17,6 +17,7 @@
>   #include <drm/drm_gem_framebuffer_helper.h>
>   #include <drm/drm_gem_shmem_helper.h>
>   #include <drm/drm_probe_helper.h>
> +#include <drm/drm_panic.h>
>   #include <drm/drm_plane.h>
>   
>   #include "hyperv_drm.h"
> @@ -181,10 +182,45 @@ static void hyperv_plane_atomic_update(struct drm_plane *plane,
>   	}
>   }
>   
> +static int hyperv_plane_get_scanout_buffer(struct drm_plane *plane,
> +					   struct drm_scanout_buffer *sb)
> +{
> +	struct hyperv_drm_device *hv = to_hv(plane->dev);
> +	struct iosys_map map = IOSYS_MAP_INIT_VADDR_IOMEM(hv->vram);
> +
> +	if (plane->state && plane->state->fb) {
> +		sb->format = plane->state->fb->format;
> +		sb->width = plane->state->fb->width;
> +		sb->height = plane->state->fb->height;
> +		sb->pitch[0] = plane->state->fb->pitches[0];
> +		sb->map[0] = map;
> +		return 0;
> +	}
> +	return -ENODEV;
> +}
> +
> +static void hyperv_plane_panic_flush(struct drm_plane *plane)
> +{
> +	struct hyperv_drm_device *hv = to_hv(plane->dev);
> +	struct drm_rect rect;
> +
> +	if (!plane->state || !plane->state->fb)
> +		return;
> +
> +	rect.x1 = 0;
> +	rect.y1 = 0;
> +	rect.x2 = plane->state->fb->width;
> +	rect.y2 = plane->state->fb->height;
> +
> +	hyperv_update_dirt(hv->hdev, &rect);
> +}
> +
>   static const struct drm_plane_helper_funcs hyperv_plane_helper_funcs = {
>   	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
>   	.atomic_check = hyperv_plane_atomic_check,
>   	.atomic_update = hyperv_plane_atomic_update,
> +	.get_scanout_buffer = hyperv_plane_get_scanout_buffer,
> +	.panic_flush = hyperv_plane_panic_flush,
>   };
>   
>   static const struct drm_plane_funcs hyperv_plane_funcs = {

