Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B020F98FDAC
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 09:14:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5CD410E257;
	Fri,  4 Oct 2024 07:14:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Xz8lIaMC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E29A610E257
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2024 07:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1728026051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hBtwnr0LZruEJbvlzvyuk1+vZcUV6rsB3LNlgkW3ppA=;
 b=Xz8lIaMCGdSjd6MC/L6xu23krO2Twlt5boqi/vp+M7oY+tMSzWtizv18bFnnmdLisje5Cz
 zQz0vwKGT+KMnMEvGLGEIoy2y2Vhuif5alhjIbOBGABD2DOUF51HSICsXfa+p7ZBpWIc61
 0IE/LjeD/v2u4V0TFJrnN1RRsxjZhpA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-Rt_amQnlOh-HC0l9f827FQ-1; Fri, 04 Oct 2024 03:14:10 -0400
X-MC-Unique: Rt_amQnlOh-HC0l9f827FQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-37ccd0cf138so1217539f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Oct 2024 00:14:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728026049; x=1728630849;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hBtwnr0LZruEJbvlzvyuk1+vZcUV6rsB3LNlgkW3ppA=;
 b=BtAnhMU4mXOHzIUYGW7o1zcuxlDUdC3RVMezZBRgffEoYo32Pabk571qqZ+rRsHM4H
 sTb4Yc19eWchyoTPw++3JOR8PkoMO7H5NmhAKixv1RTU88x9KaodtYnC8UicdFHo6AU8
 Iazy2kEkNU6IZKnxVVGQksA36hdM760f/btaB1X1Rde57cUL23ko27SLS8p59nLqjl4/
 Y3CStpiisjsWkMddEd044j/TtLzstJe8RlrQJofTrWSMZ2daiRo0ONgrAsode9LlpdLr
 g8/olXd3bYgoHIvK9rrckKE1lRDgcK4jZJs+kS/Wqx+t435OUEOwgjumnbAii4gKHmnw
 16Gw==
X-Gm-Message-State: AOJu0YwtX2ubNMvo5+9pK4/XoLX1Xwp3OgsyJOOtgg1fIa8zuL24sMNn
 rxKpjjhGZeOxsIhON2AOke37GCUwnTGeWiLuclwQSa38zpwyCn5GJv4t3Ce+uJacXR9m+vr0w0T
 FifznyQgSyBEDD4jO+gVIxIaVSSy0BjTBzrcB0MQ3j2C+3eKW9t/nkDkrOD5W9DoNsQ==
X-Received: by 2002:a5d:5f54:0:b0:37c:cfdc:19ba with SMTP id
 ffacd0b85a97d-37d0e751784mr2002742f8f.28.1728026048950; 
 Fri, 04 Oct 2024 00:14:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5EgGjYY0JfV/z7iaa59W+QZpz8ppmjKMbpPUYbcvmPnVnctrVU3GxGrg0lDO74dDBrAfR4w==
X-Received: by 2002:a5d:5f54:0:b0:37c:cfdc:19ba with SMTP id
 ffacd0b85a97d-37d0e751784mr2002722f8f.28.1728026048613; 
 Fri, 04 Oct 2024 00:14:08 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d0822995fsm2673066f8f.38.2024.10.04.00.14.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Oct 2024 00:14:08 -0700 (PDT)
Message-ID: <609cf7e5-0fd6-4636-b5b1-b63fe319db28@redhat.com>
Date: Fri, 4 Oct 2024 09:14:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panic: Select ZLIB_DEFLATE for
 DRM_PANIC_SCREEN_QR_CODE
To: Miguel Ojeda <ojeda@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 patches@lists.linux.dev
References: <20241003230734.653717-1-ojeda@kernel.org>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20241003230734.653717-1-ojeda@kernel.org>
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

On 04/10/2024 01:07, Miguel Ojeda wrote:
> Under `CONFIG_DRM_PANIC_SCREEN_QR_CODE=y`, zlib is used:
> 
>      ld.lld: error: undefined symbol: zlib_deflate_workspacesize
>      >>> referenced by drm_panic.c
>      >>>               drivers/gpu/drm/drm_panic.o:(drm_panic_qr_init) in archive vmlinux.a
> 
> Thus select `CONFIG_ZLIB_DEFLATE`.

Hi, good catch, yes it should select the zlib deflate.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

Best regards,

-- 

Jocelyn

> 
> Fixes: cb5164ac43d0 ("drm/panic: Add a QR code panic screen")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>   drivers/gpu/drm/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 1cb5a4f19293..cf5bc77e2362 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -152,6 +152,7 @@ config DRM_PANIC_SCREEN
>   config DRM_PANIC_SCREEN_QR_CODE
>   	bool "Add a panic screen with a QR code"
>   	depends on DRM_PANIC && RUST
> +	select ZLIB_DEFLATE
>   	help
>   	  This option adds a QR code generator, and a panic screen with a QR
>   	  code. The QR code will contain the last lines of kmsg and other debug
> --
> 2.46.2
> 

