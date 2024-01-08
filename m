Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E94827672
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 18:41:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41FE710E28D;
	Mon,  8 Jan 2024 17:41:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69C2110E28D
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 17:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704735712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4Cc6o/r7V7THIXz7aSYkP1CbgO44iRjJZbOTNyl9Eck=;
 b=VL0/rx0sBbjd1Jm2zmv5Kc3McSRJBG74Dsu9ptaH+gMODwjLLjm5ruPkB7e1Ny1uEXQR+c
 5+lUXsBARw4crDiacaR3tOdMp+19udQVa0GkgY7Y8xLIK1UlaeklOuI/BjqDbytOkEqwI5
 obSLIqp4CNez+ev1FCmEcL0pU8EWSd4=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-150-omymYTOLOiqC3kbqQ7tVTw-1; Mon, 08 Jan 2024 12:41:51 -0500
X-MC-Unique: omymYTOLOiqC3kbqQ7tVTw-1
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7831aaa797aso268563985a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jan 2024 09:41:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704735711; x=1705340511;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4Cc6o/r7V7THIXz7aSYkP1CbgO44iRjJZbOTNyl9Eck=;
 b=fK8ElGZeQw1DfO55+xr0wfpQeMBRywvfLm0YPD1LTDOWUu4/STT8wIstVzrMDIcMeY
 t/V2KvuHRo744ZzeTbVUdw5NHozkF/kvfMbD5lnUD4h1Kie8dmHYMQe9YtKOlsDLsBUc
 AFnPwayG93xXMiFa5Jl+8uHy80tdWeFg5iM5p0Qd449HaqwnsVn9iFgPz2PxA1zvu4qn
 ZPwdqsK5gcLBOZvLViud2KJ+9GzHMmgT+sS6XqyM6cvzI5uUS7abIQfXtesrVeBDl7Jv
 i00yek00a3E90fI407/L6xEUG9lfRG4YmsiqHPxPC1ip1IKPwXteCFg1jEOZyxzrTKwT
 QyoQ==
X-Gm-Message-State: AOJu0Yw/2+4NstcsTltXwCxADj6nA4ejK3hCx3y8IU9JA6kg5rVmVQXZ
 esYX3hj/nJ+VtPrdA7OmKF/funX4D9ofr9N1VMVonce5QIDrZvq6r7f12gPdM8QoXRpZQwqE8eD
 5JtPdABDDG5S4QPYJdxQkIcMcnB6/xf9Tx8Wi
X-Received: by 2002:a05:620a:2495:b0:783:2408:b546 with SMTP id
 i21-20020a05620a249500b007832408b546mr208502qkn.37.1704735710927; 
 Mon, 08 Jan 2024 09:41:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEi1cNkajQ03cO87hYrOZRH5WctfJOBHkDNumVftm6BT+1/26AYiKg1TD144u21NlOQqM6zMA==
X-Received: by 2002:a05:620a:2495:b0:783:2408:b546 with SMTP id
 i21-20020a05620a249500b007832408b546mr208489qkn.37.1704735710712; 
 Mon, 08 Jan 2024 09:41:50 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a0ceda5000000b00680b34d52f8sm148827qvr.13.2024.01.08.09.41.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jan 2024 09:41:50 -0800 (PST)
Message-ID: <7d70d892-6b72-4460-b036-ed9d3f555b1b@redhat.com>
Date: Mon, 8 Jan 2024 18:41:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/nouveau/disp: don't misuse kernel-doc comments
To: Randy Dunlap <rdunlap@infradead.org>
References: <20231231233633.6596-1-rdunlap@infradead.org>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20231231233633.6596-1-rdunlap@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/1/24 00:36, Randy Dunlap wrote:
> Change kernel-doc "/**" comments to common "/*" comments to prevent
> kernel-doc warnings:
> 
> crtc.c:453: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>   * Sets up registers for the given mode/adjusted_mode pair.
> crtc.c:453: warning: missing initial short description on line:
>   * Sets up registers for the given mode/adjusted_mode pair.
> crtc.c:629: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>   * Sets up registers for the given mode/adjusted_mode pair.
> crtc.c:629: warning: missing initial short description on line:
>   * Sets up registers for the given mode/adjusted_mode pair.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: nouveau@lists.freedesktop.org
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>

Series applied to drm-misc-next, thanks!

> ---
>   drivers/gpu/drm/nouveau/dispnv04/crtc.c |    4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff -- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> --- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> +++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> @@ -449,7 +449,7 @@ nv_crtc_mode_set_vga(struct drm_crtc *cr
>   	regp->Attribute[NV_CIO_AR_CSEL_INDEX] = 0x00;
>   }
>   
> -/**
> +/*
>    * Sets up registers for the given mode/adjusted_mode pair.
>    *
>    * The clocks, CRTCs and outputs attached to this CRTC must be off.
> @@ -625,7 +625,7 @@ nv_crtc_swap_fbs(struct drm_crtc *crtc,
>   	return ret;
>   }
>   
> -/**
> +/*
>    * Sets up registers for the given mode/adjusted_mode pair.
>    *
>    * The clocks, CRTCs and outputs attached to this CRTC must be off.
> 

