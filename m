Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF8CCD215C
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 23:11:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D4FF10F0E0;
	Fri, 19 Dec 2025 22:11:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="QS3XMMwh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC5FD10F0E0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 22:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1766182275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xeq1/IF7ERfBMCtWHAumuoI2dJyv3hwKaBPQOg1Zfc0=;
 b=QS3XMMwhz1fMPWtob5I5UBUg/cG/gIGSNXYTY0dRe04wNxlP3oop3O2pBb48ZSHeWQEj7i
 xSG5Z6k56TEj4NjHqCAl2cJ+JvKIFy45mwS+4Bp1tyqLXHZYLCrkHfQr1jRbX5Y6D6DX/M
 hEYzsBxRrSLNdiEhSDK2UnDLyeZUz3k=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-486--f9plkzEMGSg-7KrGe4wbw-1; Fri, 19 Dec 2025 17:11:14 -0500
X-MC-Unique: -f9plkzEMGSg-7KrGe4wbw-1
X-Mimecast-MFC-AGG-ID: -f9plkzEMGSg-7KrGe4wbw_1766182273
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-4310062d97bso1024441f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 14:11:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766182273; x=1766787073;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xeq1/IF7ERfBMCtWHAumuoI2dJyv3hwKaBPQOg1Zfc0=;
 b=fyI8lXIsoT+AZLqrhnAAJfOHP49XQRBtBeVbGCnVrv3wTtQ/gSn3UUW6SibbLwFbMh
 thWROky/BZIpSzRFOAUpuAYq6MrCzmPpw4D+ge5QtWFKJGhbsiVB/QXJkEq57bqnKIAB
 ijGbAgw36jVL2RfZlI5jmboP25lU/7uXXvHRlo0fiY1o3DObhbkVP60hbANh6X34BY01
 15njhyYChjI94GFgrPPrTzeORQMO5J86y3VzbfhIqjkEpOSFXkR7zfysvbAAp586cs7O
 6yKJIPWl2nnEvniNulepeb4JgboF5zzKRmNHc6Eegf8rBhrzVCIOt2m21JJsokRHZL70
 ymAw==
X-Gm-Message-State: AOJu0Yxnjsc0NCymCLmhH8iu+pMmtUjfbYXYGCmUzVaRHIdIT+zd5AA5
 uf6LZE8JnnAwWNOpJF7LCsMU3ZemcaTBIgpHZAQQNQUVT6II5ZKwzjfYW2gDMA+gAXgaeXjD+3Y
 nch5QDmvTuG/L5zl7DQrC4XqnXgCO2YMvMjCJepAIhis1Kniny7B27SjPpg2t2VkA9/kmXQ==
X-Gm-Gg: AY/fxX7H1HZgPapSdK+4Nr+wY4fKmIZ9ebP2oqkQV74lMyqiEWAhbDCwE5DyD3GHKuT
 Hqun5a53MHNWlPHm6kSSgTF7+M8LZTYJ18Vbe8dasjy2629sjgFn1h5pgTjQFx3FqoevY9TysRR
 EoXECS5BS3zZOuvjLZa8hl2nipyRNFMm9OGdTsLM873CNF83aa9hG5v4GTG+dFc+FOjqiY5z3f2
 PlF2MlDF2dkl2L/riCREosASUcE6BPXopLt7ftvp40DOWAYckz4G9WZTV8LjO5+sJScv4yyfuqx
 9GOf/qJF/rRyEGKRn2Ryy6arC2L6N5kJJYUaD51ZhM2WmnEbu+jKjhRzwCZ5/jUEqiBgsS48Wwr
 LyG1+8NPyaKnzM3Hf2I1tkhNxP6C2/3JS+Ta2jEPISVuQqUqP7g==
X-Received: by 2002:a05:6000:4008:b0:431:2cb:d335 with SMTP id
 ffacd0b85a97d-4324e4fab82mr4094406f8f.34.1766182272902; 
 Fri, 19 Dec 2025 14:11:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG8wPlMCZ5iSNXRyZ4+dTA5mKREk3z7NwuNUYWvqt0zk7xcaGVDV/7ijCAKo11FDwT1cbFJVQ==
X-Received: by 2002:a05:6000:4008:b0:431:2cb:d335 with SMTP id
 ffacd0b85a97d-4324e4fab82mr4094389f8f.34.1766182272491; 
 Fri, 19 Dec 2025 14:11:12 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324ea830fesm7158642f8f.20.2025.12.19.14.11.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Dec 2025 14:11:12 -0800 (PST)
Message-ID: <1ff8c562-2d1a-4e77-85d6-62d9f85a4a31@redhat.com>
Date: Fri, 19 Dec 2025 23:11:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] drm/draw: add check API to avoid spurious WARN
To: Francesco Valla <francesco@valla.it>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251217-drm_draw_conv_check-v3-0-15b6f8bc1cbc@valla.it>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20251217-drm_draw_conv_check-v3-0-15b6f8bc1cbc@valla.it>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yhDW7yCZ4Y7gtZ1JcEpxwa6SZTppa2QWGs3EMUrWYXU_1766182273
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

On 17/12/2025 09:06, Francesco Valla wrote:
> When using the DRM draw support, the only way to check if a color can be
> converted from XRGB8888 to a target format is currently to attempt an
> actual conversion using drm_draw_color_from_xrgb8888(). This function
> however will print a WARN the first time a conversion cannot be
> performed, leading to two potential issues:
> 
>   - a WARN is emitted without a real reason if the caller is only
>     attempting a conversion to check if a format can be supported (which
>     is the case for two of the current user of this API);
>   - a failing call following the first one is not emitting a WARN, but a
>     "valid" color value (0x00000000) is returned nevertheless.
> 
> The first issue was observed while using drm_log on a Beagleplay, which
> lists AR12 as the first format for its HDMI modesets.
> 
> The target of this patch set is to improve this situation; the first
> patch introduces a new API devoted only to check if a conversion from
> XRGB8888 to the specified format can be performed, while the other two
> substitute drm_draw_color_from_xrgb8888() with this new API in the
> current users (drm_panic and drm_log) where relevant.

I just pushed it to drm-misc/drm-misc-next

Thanks for your contribution.

-- 

Jocelyn

> 
> Signed-off-by: Francesco Valla <francesco@valla.it>
> ---
> Changes in v3:
> - Collected R-b tags from Jocelyn (thank you!)
> - Link to v2: https://lore.kernel.org/r/20251014-drm_draw_conv_check-v2-0-05bef3eb06fb@valla.it
> 
> Changes in v2:
> - Moved to dedicated switch cases in separate functions instead of
>    single one inside common function.
> - Fix copy-paste error in commit message.
> 
> Link to v1: https://lore.kernel.org/r/20251005-drm_draw_conv_check-v1-0-9c814d9362f6@valla.it
> 
> ---
> Francesco Valla (3):
>        drm/draw: add drm_draw_can_convert_from_xrgb8888
>        drm/log: avoid WARN when searching for usable format
>        drm/panic: avoid WARN when checking format support
> 
>   drivers/gpu/drm/clients/drm_log.c   |  2 +-
>   drivers/gpu/drm/drm_draw.c          | 29 +++++++++++++++++++++++++++++
>   drivers/gpu/drm/drm_draw_internal.h |  2 ++
>   drivers/gpu/drm/drm_panic.c         |  2 +-
>   4 files changed, 33 insertions(+), 2 deletions(-)
> ---
> base-commit: ea1013c1539270e372fc99854bc6e4d94eaeff66
> change-id: 20251003-drm_draw_conv_check-9cc3050ebd57
> 
> Best regards,

