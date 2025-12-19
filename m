Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1C4CCEE11
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 09:05:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D9C910EAE5;
	Fri, 19 Dec 2025 08:05:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="HIOYsbTs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99D4210EAE5
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 08:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1766131518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hdOk7vDtGRSaLNKWE0lO0qkTVd58h7TvAR6pyplYZkc=;
 b=HIOYsbTsCJsQ9IChHUQfvGfaw+GXNeOsSl+8/1uPUERcDe/k57UnUekClgFzqPxVhDkmi/
 HupH6woZdSEBip8Cl/qIW+0+aWRbKjkuG/3QTDd2PHc8arZHFrJISEwNj6MU2nTpULiTLg
 nNxCuP/R3T5Z4EGz/khXD4iZfGGVJzA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-434-55vjC7p2OEq-d2Ilhw58RQ-1; Fri, 19 Dec 2025 03:05:16 -0500
X-MC-Unique: 55vjC7p2OEq-d2Ilhw58RQ-1
X-Mimecast-MFC-AGG-ID: 55vjC7p2OEq-d2Ilhw58RQ_1766131516
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4788112ec09so13753095e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 00:05:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766131515; x=1766736315;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hdOk7vDtGRSaLNKWE0lO0qkTVd58h7TvAR6pyplYZkc=;
 b=KuuIlbxV1r0ehXTGqkD6vcd4L+Uf9tMBDNl4MU2piF5W7GebCuBjIwK71udCktFLmx
 JKWir5tjUQzbQB8qdkZUWU96hjId+jup7pu2hxH4lgDAZRWRljXH2208PGhfHlyD5Xlr
 D56P87LDiA6LKM4zmD14Ihj5UYbuAHF1T3pSZ2rxTLFKkSJyQOsXAynhDIJp42BeFw/q
 5H8WjRAzVh0NnmUzXlUsj5Iy7dZ458AxkgY0pTDF/eUvxrh2rSMsFLwoTemklbU9Ur2j
 TEuRM+IGqGiHOoQsiJraHirXhBIc2HSsEzivK3KzqXZaiJS67jJ7/VqKHNGdXdRYyab+
 hWYQ==
X-Gm-Message-State: AOJu0YywSN5e2Q4fV+Lix+4YZyU60GcbNCbNvaxyf7jecI6rcMX4kG6G
 YcCNhJs0+jXsc+ROIHZl66a9VcBcIXFJLayutt+5XtO0tGhO+mTcnyMGpU31Utp7B841yQQwBcw
 snsyMmO3pihzkM72CT9pLSoX9Ghb4LqK5vzRg88Gmn5f2iuyPcIR0fn3qRW5HNjbWqlukoQ==
X-Gm-Gg: AY/fxX79Pfn3tJFz3zmzqWaT3FTO4/sDI4+Nqe4HcVpDT7K+bDDppqGmNb0b61YRv6o
 il9wYuJY61MUWI3jxpn8MpJntH0YCsZZh7zrz8pA9JiK7JESMhiufKkCVw9JIykT73UH6wvURiO
 kEaOk/h+H5JnsbfGfiSuoghIbdeEUntNGHM6OOAc2DGGbLm8Wf6oyhE/nuCPM1jE9cXsBmy5HeY
 Kr6eq7homADjENlhWrLzPN3VvJOT25KgQ53fWM5ul148odaEtnmbhg63zCftstFtu4irb22JjIX
 m4sHi1Ga4dva38wlcieiFtWXMG2EX9AhTAa4r3aEU47Q1P10N6w/1p9W3SjwCPbBlESLRX+VzaJ
 J2vdR7fqmaBwAEHSSeI7FKHafLBj2j8YqsbYKW578Hy2PHO4b+g==
X-Received: by 2002:a05:600c:348f:b0:477:7925:f7fb with SMTP id
 5b1f17b1804b1-47d1954a710mr18004915e9.10.1766131515637; 
 Fri, 19 Dec 2025 00:05:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFSR49Ko4AL5QzboiX/5MOQe6phBCVtU3Qiucp/1hT0zKe/DU+ql3J1wDyHHLXfa9gvtCnrlA==
X-Received: by 2002:a05:600c:348f:b0:477:7925:f7fb with SMTP id
 5b1f17b1804b1-47d1954a710mr18004525e9.10.1766131515256; 
 Fri, 19 Dec 2025 00:05:15 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324eab33f5sm3526617f8f.41.2025.12.19.00.05.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Dec 2025 00:05:14 -0800 (PST)
Message-ID: <66d2643e-7549-4bb6-b435-f8f3cad3d749@redhat.com>
Date: Fri, 19 Dec 2025 09:05:12 +0100
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
X-Mimecast-MFC-PROC-ID: HPo8FgfD5lTCnECiUzCeeBJSRaBT-DXBwhGvNa7qeh0_1766131516
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

Hi Francesco,

Thanks for this patch. If you can't push it to drm-misc-next, let me 
know, and I will push it for you.

Best regards,

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

