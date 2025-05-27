Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF29AC49F0
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 10:12:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 076B210E417;
	Tue, 27 May 2025 08:12:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="NNsFmdYb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F22010E3F5
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 08:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748333518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uc8SBIaKuW9hd4Ztl1l2JfCcfjBxitXGrH2FjSYGyBI=;
 b=NNsFmdYb/3EMnEg7Q4FvBPT3G5hD9fWBM2f/V/o+P2Do+GBy9QBv0dmEb/F4+PsG19l+R9
 +t/5J82+IeUeCor8XtZoOH14p5H18unmcrA4OKT78Scp9Ai6+YuX4kGFjYxkBvp/eHnog4
 B1K5Xd6z+hWvi+l4ZNIGWmbzM/qCWn0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-53-lZNbZSkCN6KhSHnvCMP6Qg-1; Tue, 27 May 2025 04:11:53 -0400
X-MC-Unique: lZNbZSkCN6KhSHnvCMP6Qg-1
X-Mimecast-MFC-AGG-ID: lZNbZSkCN6KhSHnvCMP6Qg_1748333512
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-442ffaa7dbeso22556165e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 01:11:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748333512; x=1748938312;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Uc8SBIaKuW9hd4Ztl1l2JfCcfjBxitXGrH2FjSYGyBI=;
 b=Cs12taXTRwlv14moD8IBoT53ZaIrsP9AkPCGCOXRjOxUYPLW99M65HjO/HYRY52z71
 vlcF0LyJo+ID3g/Nk9sLkj6miCswF+d/XV+Mtpt9OUq2aJN5ViIwSHctYRhvnzilJBjA
 Jzf6d/fiROKQH9JOU2nGoRt4fcPcYujzW3elXBnQJaXWcWJYMrzNiPChndhQw/aZ96yI
 vTpvoBa54Vu/8Ubp/1CAECfJXYqDrciRCcpvR08kqU1Cx337GSOcwJGAdPsnAV0qSVm+
 9oTbV6sUgQkGZoEtvZp8eH1sgaZ/7IuH12fkuh9Fso+mDS1RPfRf+hNStkhPG3Gszgjn
 9ZMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkPqo3rh+apOEgq6YQDDTQqgJDJmTTnJUGYdNeW4u1K+7I37BP6Oks6ZtahiZGu+jLTKE8sjl20g4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvrWuwBWf9m45TKy0QOeYr4xI43hUOx+P5buYBFN1KyT8CkFiv
 s/SZAZoIivBgYROJPErJa1YirDdGfAep2bP9vc+S1mQ/yKphigwm83hg79fu0yVR1ID/q5vR6aI
 YY3/yvGlnuMPJvbQkCkw4k3YxyRHeBD1z1EFnhUJnYHHKHCeJF7huGHSec+4kvzBAgqCXfA==
X-Gm-Gg: ASbGnct+Py6T2bbzullkTDJg3Eak4+uoFzGb9itmqHsenQKccFSbTjTa9gcCeiv8ZWM
 7+HZzhgIJf2gFU2Q/HQSjp44Sdkiu1TVS3KE0GL2tNFNftvmwuRPu4sH8rwe5EaVkyvjU3kUw9B
 sFTiZzpOMrTcYZkRyHywGZfg2xHWewa6M96nFSc7yh5CJkhPhENgAQN7ZaukAsyTZw9ll6mLsRZ
 93Myh1bzQSkW6byF1Xe1oaJJrLrfxWjSY5Hksl0JLwoda3HcG2qS738NcuSGdt5vWboZ10RQrqt
 gNO45eGXp+zY/Ty1atodGmEkrBFS/r9D+QbJ8oI3RYFitKWtbQA=
X-Received: by 2002:a05:600c:64c5:b0:43c:fbbf:7bf1 with SMTP id
 5b1f17b1804b1-44c935dbb26mr120963415e9.30.1748333512423; 
 Tue, 27 May 2025 01:11:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYAtk9413NqBo2PajYHvgPjwcpaG+eT7N4Q6fyVV+Lil0t7i7dtNFpt991DzyOflFbKn4oJA==
X-Received: by 2002:a05:600c:64c5:b0:43c:fbbf:7bf1 with SMTP id
 5b1f17b1804b1-44c935dbb26mr120963055e9.30.1748333511996; 
 Tue, 27 May 2025 01:11:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f7d975f4sm258858665e9.39.2025.05.27.01.11.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 May 2025 01:11:50 -0700 (PDT)
Message-ID: <8bfce982-b22a-4ef3-b79e-5e22a3364c5a@redhat.com>
Date: Tue, 27 May 2025 10:11:49 +0200
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
X-Mimecast-MFC-PROC-ID: NUJ_Axn8Vz_57yaS5eAyG7QGubFv15cOwyKLYFx8Sfg_1748333512
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

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
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

