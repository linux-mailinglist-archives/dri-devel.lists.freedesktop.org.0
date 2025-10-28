Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8D3C153CC
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 15:49:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5291110E5CE;
	Tue, 28 Oct 2025 14:49:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gcrFYb5g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D926510E5D5
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 14:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761662956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cPvmOeVhkHAnwj7Q/oXxXeAaQ8I6z2++3HgCvuEBIAA=;
 b=gcrFYb5guO5KTnmWi826K5fxSYCSnjiCkKlXWGC2cN0Wnq5WumPDGDTI68jBWA4olbAHNE
 pGdqciG2qn9U1QaR/a338I9LBB0ri5Aph+mY08zhrYsfwIeqQTHbLmdz3Nq27FvVzaW6io
 iI9GcteLKbwUrO38mmaBb8eXASlMKPQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-168-o-nD5BcFMqeLg5COuSvNmw-1; Tue, 28 Oct 2025 10:49:13 -0400
X-MC-Unique: o-nD5BcFMqeLg5COuSvNmw-1
X-Mimecast-MFC-AGG-ID: o-nD5BcFMqeLg5COuSvNmw_1761662952
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-47496b3c1dcso45986185e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 07:49:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761662952; x=1762267752;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cPvmOeVhkHAnwj7Q/oXxXeAaQ8I6z2++3HgCvuEBIAA=;
 b=t6sxBzQrofYfRNZE5NbjuZlCJsgX+lRcgIvXljpGXPplRnwzIG8+yvwLuutysDIJOo
 +VEtq0rVaVnZ3NtR/R1+zzEM4gfJvGQRyJLQcT57xFdcBnbEJLG+M3HZf1s2YTlQBqm4
 VTcy9KCDN3hZmzg5bBcsx1faZO1d75+ibuPlyCeYEQon48CFJoL6RvXO4evZoVrcBE7c
 Os3nIjg63Eyzjk47YwMnTVumsIyxgA/X+P8qFB3m5Ugw1eGH2TJZhIfRggSADLemy4jX
 CUoiVNuttma5NDj86+YloVQYnscXpdn3XoZaFgMTh7GGH8qF3uqnxMWdggGWFZWMM++1
 rtYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXg5saH417UcVHNCQIfIbPfJ4SYCrBELL5XsNBRfKfKczrlsOjF5fUlBVhQR+VTZNilQgySBG7gUTU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxmYJ68A06uevnGyumyVkwXqNqJ7hC9SZOr+LY8oLZcln2bGMVV
 VQknKxmnmvE/vYHXGor79OGLHl6k+vezhzRFRhckmuUMHd7ZOo6mWfTF4wxXfixF8Tkl+raN6yl
 4TcdLSo0AGaxa6yeTeDWQTKqvfdw3fLvlr5QG80ySb/J4QmpvscH4/6vpS4VvZZjptxX8IA==
X-Gm-Gg: ASbGncs5jCq+xUpesIs+vTGIH9E4Ij9wIrNUkSnoiqVC6mW52DczRYfva9k6wownm6a
 tRF90zq3GhwjzNVJLEN7t1a8CWoCaYNSQRWUjSvhszaXbws0cAW9XY9spDHsFuBqUeXzK983gGz
 6Lg2bzmwpICn/DCqcyjGxp5k7RSvlny7757T3zCppZi/3M3qLfNEjIkUtqelDoKAybsq4N0Ve1G
 dfLEzvuia8miq3b/CUPSW9VvY8Uw624iV1K7/utBQLPNe9QpPUofcZB2DY2uBserLlhftlzdClj
 rrmo5khFNFAm/SZ4OF1bQaJsOj9w0F+Y1kFaMWGeImZHNM9SORAnyH4UIwHfJC1nDFkf+o6bnHt
 /DGPj2rHRZCgNj9Nmlzxx4aPjMMZcPEEppg4+QeU=
X-Received: by 2002:a05:600c:3b26:b0:477:b93:a7b8 with SMTP id
 5b1f17b1804b1-47717df985bmr39835775e9.8.1761662951772; 
 Tue, 28 Oct 2025 07:49:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrbZPGMFUl9VEJIiaQu4K+uFXaq96LqtBBpG6BENUlJYjae8XIuMNubDbEl7j4aP/oVXCFMg==
X-Received: by 2002:a05:600c:3b26:b0:477:b93:a7b8 with SMTP id
 5b1f17b1804b1-47717df985bmr39835545e9.8.1761662951389; 
 Tue, 28 Oct 2025 07:49:11 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:d252:5640:545:41db?
 ([2a01:e0a:d5:a000:d252:5640:545:41db])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd489e6dsm196225545e9.6.2025.10.28.07.49.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Oct 2025 07:49:11 -0700 (PDT)
Message-ID: <99f8a5f0-c650-485c-aef6-e8f1a89598fe@redhat.com>
Date: Tue, 28 Oct 2025 15:49:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ast: Handle framebuffer from dma-buf
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Dave Airlie <airlied@redhat.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
References: <20251028144226.171593-1-jfalempe@redhat.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20251028144226.171593-1-jfalempe@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CH5QSciwvj4ku1gPpnpydfi0vT7ub3r0o0gQrb9KvI4_1761662952
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

On 28/10/2025 15:42, Jocelyn Falempe wrote:
> In the atomic update callback, ast should call
> drm_gem_fb_begin_cpu_access() to make sure it can read the
> framebuffer from the CPU, otherwise the data might not be there due
> to cache, and synchronization.
> 
> Tested on a Lenovo SE100, while rendering on the ArrowLake GPU with
> i915 driver, and using ast for display.

I sent this patch a bit too fast, my mistake below:>
> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>   drivers/gpu/drm/ast/ast_mode.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index 9ce874dba69c..68da4544d92d 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -556,11 +556,17 @@ static void ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
>   		ast_set_vbios_color_reg(ast, fb->format, ast_crtc_state->vmode);
>   	}
>   
> +	/* if the buffer comes from another device */
> +	if (!drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE))
> +		return;
> +

Sorry, there is a typo here, it should be:

if (drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE))
	return;

>   	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
>   	drm_atomic_for_each_plane_damage(&iter, &damage) {
>   		ast_handle_damage(ast_plane, shadow_plane_state->data, fb, &damage);
>   	}
>   
> +	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
> +
>   	/*
>   	 * Some BMCs stop scanning out the video signal after the driver
>   	 * reprogrammed the offset. This stalls display output for several
> 
> base-commit: 4f9ffd2c80a2fa09dcc8dfa0482cb7e0fb6fcf6c

