Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19844BD7E33
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 09:29:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE6C810E55C;
	Tue, 14 Oct 2025 07:29:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="UUliR8ml";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A625C10E55C
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 07:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760426940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RksJCWcE518u9BgQ05Pnya764wbR3ztonK23iFG2Arc=;
 b=UUliR8ml7Z9+85UFn2Yu//vQLQC0CBPSsVvrPNl3xbKRVxthzIElem0zeV5+vTqXPPEBWY
 8oXVs3Y8AXJAm3221SQAl9BJ6WyM20sBQAYEY1QuJ2GKNLPmvLm1hZwTfvxBiO8D6Woqfs
 elAJcWNRF323MeFzer6mvfkYPxU8pnM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-153-Hr8wIYn7OXSpQ9SFFKeDuQ-1; Tue, 14 Oct 2025 03:28:59 -0400
X-MC-Unique: Hr8wIYn7OXSpQ9SFFKeDuQ-1
X-Mimecast-MFC-AGG-ID: Hr8wIYn7OXSpQ9SFFKeDuQ_1760426938
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-46e4c8fa2b1so21007345e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 00:28:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760426938; x=1761031738;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RksJCWcE518u9BgQ05Pnya764wbR3ztonK23iFG2Arc=;
 b=aGZXv7LWst7Vdk2I8Z9X3Ip9o1LRfhWEwYy76djlG4oaQfF0bwJ9bXNUFi/taJxdFP
 rXf2LXVTyZtXTDOCPz82ynEWFLCjLBV6czb0KDSBWxrOwjYnBM4mQMpRYLDhJ4vNG3Ym
 d90T32JnmS86YVRYw9Vlj+UUpjt582ljbBWFALJ6yZFyxeQL4Bp8+RQjyvVVURXtUTCF
 /M6Yqp2eYRdJx4YgEF457KNS2dJe29FGVfaUA06Y6lk41kGe3j/bPkua22aR6oniknA4
 Jj9Zc/BnxM1rkusmLTVC251wLnXsqgvWi1M+lfCGsU3gRTOb+b4BVp/4r81k2qgVg5iC
 Y0Vw==
X-Gm-Message-State: AOJu0YyuoodcnaCGFcb8wXjNgId1zWekTqVfUpvmgcvMOZ68hSYQIS+N
 i5CvOWIL3E+Qr1fzdZ3sp9kmLnhmTRxxBo+f9/r92HxzP8FIxhoySuYfxoHf1Lbj2zM6kiZJTza
 53LpEcGZS7N7E6oyTGZ/u+XKDkDfXljdvx3MpwWG8Crkp2fhQx3xaO69Ic/tfGn+WoQVe3A==
X-Gm-Gg: ASbGncuhmq1fpCyIGSPuqVOhDIzPRsGGUjU5wEIOsLsTJzZf0W9iu1M9D43okLYd4Xb
 B0jzIS+xPOVAIH+pQwLSL3+jpLJfTQfob9OGPOCp7KrHZELsOvDxUQ6KpIHsLCUodqWSq1h8Unw
 kQ85aHo+JkgZsg8fDj3b3xW9ec1QnHbxsEkvT1D6PMDWdJWcc4FnrdGExYoi+LBtxq+RIRpVX8M
 NMuMYNZsG4ZxMBmx7zS97GQdESDIeznnoVabijrtCl08cQy5aF8pVcYaKe/CL4dVN+fQ3h5gXKv
 N8WedJmmPYXz9xIlwtX3enkXmsx1Gjo/zThVDqlsj2EtO9jmDUBzZXbt+ymb3ACWKOnFEX5AptY
 uakD7
X-Received: by 2002:a05:600c:4506:b0:45b:8a0e:cda9 with SMTP id
 5b1f17b1804b1-46fa9a8638dmr171107405e9.2.1760426938080; 
 Tue, 14 Oct 2025 00:28:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPr+Tuwu+hIBP/9A/MtGnkGPTpr2HNYr7jhZYylqwePWeGRerNFPNHp1Rv8vI/VkWXky412w==
X-Received: by 2002:a05:600c:4506:b0:45b:8a0e:cda9 with SMTP id
 5b1f17b1804b1-46fa9a8638dmr171107285e9.2.1760426937724; 
 Tue, 14 Oct 2025 00:28:57 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fc57530b3sm107980145e9.12.2025.10.14.00.28.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Oct 2025 00:28:57 -0700 (PDT)
Message-ID: <95cc648b-ebec-479a-ba8f-b663f39bc516@redhat.com>
Date: Tue, 14 Oct 2025 09:28:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/draw: fix color truncation in drm_draw_fill24
To: Francesco Valla <francesco@valla.it>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251003-drm_draw_fill24_fix-v1-1-8fb7c1c2a893@valla.it>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20251003-drm_draw_fill24_fix-v1-1-8fb7c1c2a893@valla.it>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Jo1SwdFFDQCgB7Vhx1IlLJP187HmqGVuP5n4JlyEhYQ_1760426938
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

On 03/10/2025 12:33, Francesco Valla wrote:
> The color parameter passed to drm_draw_fill24() was truncated to 16
> bits, leading to an incorrect color drawn to the target iosys_map.
> Fix this behavior, widening the parameter to 32 bits.

Merged to drm-misc-fixes.

Thanks for your contribution.

-- 

Jocelyn

> 
> Fixes: 31fa2c1ca0b2 ("drm/panic: Move drawing functions to drm_draw")
> 
> Signed-off-by: Francesco Valla <francesco@valla.it>
> ---
>   drivers/gpu/drm/drm_draw.c          | 2 +-
>   drivers/gpu/drm/drm_draw_internal.h | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_draw.c b/drivers/gpu/drm/drm_draw.c
> index 9dc0408fbbeadbe8282a2d6b210e0bfb0672967f..5b956229c82fb6e232e3342705a226c8e14c8568 100644
> --- a/drivers/gpu/drm/drm_draw.c
> +++ b/drivers/gpu/drm/drm_draw.c
> @@ -127,7 +127,7 @@ EXPORT_SYMBOL(drm_draw_fill16);
>   
>   void drm_draw_fill24(struct iosys_map *dmap, unsigned int dpitch,
>   		     unsigned int height, unsigned int width,
> -		     u16 color)
> +		     u32 color)
>   {
>   	unsigned int y, x;
>   
> diff --git a/drivers/gpu/drm/drm_draw_internal.h b/drivers/gpu/drm/drm_draw_internal.h
> index f121ee7339dc11537f677c833f0ee94fe0e799cd..20cb404e23ea6263b535ea2b81b25f84c37be8a2 100644
> --- a/drivers/gpu/drm/drm_draw_internal.h
> +++ b/drivers/gpu/drm/drm_draw_internal.h
> @@ -47,7 +47,7 @@ void drm_draw_fill16(struct iosys_map *dmap, unsigned int dpitch,
>   
>   void drm_draw_fill24(struct iosys_map *dmap, unsigned int dpitch,
>   		     unsigned int height, unsigned int width,
> -		     u16 color);
> +		     u32 color);
>   
>   void drm_draw_fill32(struct iosys_map *dmap, unsigned int dpitch,
>   		     unsigned int height, unsigned int width,
> 
> ---
> base-commit: e406d57be7bd2a4e73ea512c1ae36a40a44e499e
> change-id: 20251003-drm_draw_fill24_fix-ea52d32a933d
> 
> Best regards,


