Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C49B4C47673
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 16:06:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F35F10E3FB;
	Mon, 10 Nov 2025 15:05:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="cfm7eJis";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42DCA10E3EA
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 15:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762787154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zxxqsp5CSrF/DPUtp49nItcveiatkly6l68CsLPSukQ=;
 b=cfm7eJisqrGu+zDYt3XRMUoOQ5rCag4P7/qSpqPKDZO+06Q9FEXd5fFO4r7KXI5u/v4cye
 i1RYEspqRG3aOwkshWMpyPFhC1Hyx7XL/HgJiBUOOuSkguSoPrpkLC5I6FRgeKyUySXfZ3
 O5SBXUUeSwYDhq7D2ok0MODuW4QYBv8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-61-hkh5fqsANguDKzNKm59h5Q-1; Mon, 10 Nov 2025 10:05:51 -0500
X-MC-Unique: hkh5fqsANguDKzNKm59h5Q-1
X-Mimecast-MFC-AGG-ID: hkh5fqsANguDKzNKm59h5Q_1762787149
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-429c521cf2aso2119720f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 07:05:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762787149; x=1763391949;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zxxqsp5CSrF/DPUtp49nItcveiatkly6l68CsLPSukQ=;
 b=d2roBB96Yzi6HJn3FB/3cdEsLyHXaDoOMmGJrFh4xAptwBXy1yAMSYmutL8vke6oO/
 EZYIXIWzyD37UfdNYAe5vgI7MWSiOb03a1vOp9y45Nipa5uLp1icEqQ95hhYlWsGAGfs
 0Z+yxPTLWUGejZzHFUTueOWDDPetusB58PwNbXXxZPWcyBn7yYCM2JU3CXUHHiRqIS+0
 BHehXsMW1gk10kFqnPaXHaznfc/KawrzdsgOkWgrXm7Xhq1O/FXqbRqzotwhN8KwWUtL
 yUbeViSYnBNVWXB0QaA9Yl6W6B2Jd6dY4Us6Uw5NdDji3j8q1RnTWxQs6CXBb3cMPGo2
 mtOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9Lr8s7ExOxWVZI1jOS51NHOKXm4oYgkstLQ0oRk0XAcdcGoE2957OZBc6a9zg5FrrcYVvMWYZLis=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxyTnO+eQmfudsT4Tm+2vPjxC9ajq11JSl0OvDhFwZG7b4S3f4D
 nQp/W40nnR0/76VAsyXnToS1clYGyk+8GCO15MW35luXM9sDyNLxiVcYuPgvUDcGYucwqAMnfBf
 /+T6sJEcNBbU6H8xlfKK2lD6IqqCVAZ6LHbKNzctK2zzaBazr4a5CnWQvWvF2/ICzmrmy5A==
X-Gm-Gg: ASbGncsa8bJ0j09wVQxz3yXCt9WSbx0GEHZRkWoiXqkmdgT6myJPfmI81A8DgEljuk8
 2wXujRsOoX0pqTSrCLwC8CxRRXO76DB/NOzL/YXskszvWQWmhu4U+fQEnuSLtvmbbvtBaSxbcQD
 1U8HNnTbmCTe0Hdn7rHf5ZLAJVoajqDYrT9Zv83WX3nX3ofq88rEZLXSqsf4WZVQMYfNymPUrcf
 3lA38ucfr7mkgEm9eOzh16HA/ZEXR7B1sCyA/cNqUc3i5YDHU5Qxd5Aj0cygtURR6uK5p3h5+hz
 IPdQGXb1XCJOG8CHLu/xNlfzbgNd6y0m8qL1ht3mNI8GPENONnKYTfCf+chnAj63vDtYVor6wiP
 O3KKpici2tXBVqYwQsiQ9OjO1H2JPPy9nvhiEO00=
X-Received: by 2002:a05:6000:2109:b0:42b:39ee:2858 with SMTP id
 ffacd0b85a97d-42b39ee2af5mr3255348f8f.42.1762787149069; 
 Mon, 10 Nov 2025 07:05:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHY1lWTxLjbaQ1lrgFJa7MobnbJWROcqF9w2RM3/ldYltcOJSlTAv17f74Kw0IgcP9g2graNA==
X-Received: by 2002:a05:6000:2109:b0:42b:39ee:2858 with SMTP id
 ffacd0b85a97d-42b39ee2af5mr3255329f8f.42.1762787148597; 
 Mon, 10 Nov 2025 07:05:48 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b2e052f32sm15903026f8f.17.2025.11.10.07.05.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Nov 2025 07:05:48 -0800 (PST)
Message-ID: <154398cc-f1d1-4657-b8f6-e9e2d248f61b@redhat.com>
Date: Mon, 10 Nov 2025 16:05:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/ast: Handle framebuffer from dma-buf
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Dave Airlie <airlied@redhat.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
References: <20251030091627.340780-1-jfalempe@redhat.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20251030091627.340780-1-jfalempe@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: r90NzJKIc8TaenprS77WAGiuPOiJ40KB-caP0SSuYkI_1762787149
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

On 30/10/2025 10:14, Jocelyn Falempe wrote:
> In the atomic update callback, ast should call
> drm_gem_fb_begin_cpu_access() to make sure it can read the
> framebuffer from the CPU, otherwise the data might not be there due
> to cache, and synchronization.
> 
> Tested on a Lenovo SE100, while rendering on the ArrowLake GPU with
> i915 driver, and using ast for display.

Pushed to drm-misc-next, thanks.

-- 

Jocelyn

> 
> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
> 
> v2:
>   * If begin_cpu_access() failed, skip the damage copy, but update the
>     pitch register (Thomas Zimmermann)
> 
>   drivers/gpu/drm/ast/ast_mode.c | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index 9ce874dba69c..77d6c2dcfc40 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -556,9 +556,14 @@ static void ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
>   		ast_set_vbios_color_reg(ast, fb->format, ast_crtc_state->vmode);
>   	}
>   
> -	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
> -	drm_atomic_for_each_plane_damage(&iter, &damage) {
> -		ast_handle_damage(ast_plane, shadow_plane_state->data, fb, &damage);
> +	/* if the buffer comes from another device */
> +	if (drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE) == 0) {
> +		drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
> +		drm_atomic_for_each_plane_damage(&iter, &damage) {
> +			ast_handle_damage(ast_plane, shadow_plane_state->data, fb, &damage);
> +		}
> +
> +		drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
>   	}
>   
>   	/*
> 
> base-commit: 4f9ffd2c80a2fa09dcc8dfa0482cb7e0fb6fcf6c

