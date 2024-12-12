Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F389EF164
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 17:38:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B585810E141;
	Thu, 12 Dec 2024 16:37:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Tnuq0kSq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D08B410E141
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 16:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1734021476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2/JWnOJW6U543Vpbg6PAvnRfuu/1KbMmqtG+gC1ifEE=;
 b=Tnuq0kSqlKJYJPYHA9ITM4siziibV9w9r+gFhjTiDbh08W/32tik6xY+qizdHO6/H6MV6j
 K5pHALM3b1Z42N+QMZ4k/dVmgT1lppqnYHIcxcRYqexJdhMVzh5B3oX2koXtOaJbVmj79M
 D28bH2NcTxmJIuugwNDFKl96AFifHaM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-16-KQiD1RBHNW-SqegBY6_o-g-1; Thu, 12 Dec 2024 11:37:54 -0500
X-MC-Unique: KQiD1RBHNW-SqegBY6_o-g-1
X-Mimecast-MFC-AGG-ID: KQiD1RBHNW-SqegBY6_o-g
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-385ed79291eso1103225f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 08:37:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734021473; x=1734626273;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2/JWnOJW6U543Vpbg6PAvnRfuu/1KbMmqtG+gC1ifEE=;
 b=qX18gqc3Nv4rLA34WLeKx9FjXa1km8PCBGKBCVJAkDKMHJhYy95QfVy++S3DmSzp3E
 qZD8GHWzkQQEQ87yITRinWYchqf6nWUDtybjymOtOAsihegoPcPqiZsTWNb3lig03100
 xZCVMGC8JqwxL7XKOTk8bA5CakawFD3JvyS30N+mm576Pjd5hX3uMW+UDkxgNaUQd/SN
 u+SZ3neoQDAhHNGSepZ1NN+pb4AZT5GFCfYIMM6T4RUYeWj4TNaRzfyTYvwuvZdTkUqa
 4Zb9anAhhx4ms3JbxY4pWaCXqQLCzeSGyhUVhLFeW+VicwojXLclxC3O6oBIaV2UlRH+
 AsGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOE+Ol6tkWq1QzGP/4FbP74uuwlB7kTPk5pCrJ2DmtunzcZ2RE/JYh9rrpYRjhivS9zIfr4W6cC3w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyquQcQJf8KVeNf9KGLkaYvmm+mQX5cXnfuDUmuXgnDr4Qk0iY1
 +UO7kP+NuBzOwPoB/7nJ9TNBmHT9iKl78dKGwvvfpsPucBjQWpqLkJleQqx41bsX6c+Vy6FNIVC
 JCYgCOeapEL4bYI/SjympCSGUH0v9VY6mp+kCuw/iotMfUVvQWuDZUHSkAnBQ4o28aQ==
X-Gm-Gg: ASbGnctFyxY62qRhu0dM7Y3l+EXLpsHypXR0l6QmCcnCprrYBKTwJDA6pDux3Pt1hmz
 ZuujgcLQLZFOzcJOCx7OM6PBcanlRdLYsiu5Jy2x8UnDdy78VXAJPrJlvWKg/ioKxuKjq2PlMFq
 FnY+SMI+Q4wVzsHTAYocIQoR5oGcB+Cpp7sBYUXVxjfGdvbPdSdAZp8hSrKtoj9XaHrrJPgGMVT
 52pSUaAradg8gWsYS2g8I7qXHU+Gcj1H3TseCleol957KEHXKyLXqelZzGTlTTMrMTJW+E8SXML
 fHpC2Qno/i4NXx9CH1Gd
X-Received: by 2002:a5d:4249:0:b0:386:4a16:dadb with SMTP id
 ffacd0b85a97d-387887df18amr2620130f8f.11.1734021472712; 
 Thu, 12 Dec 2024 08:37:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGCqlzDJSGcOyDg622o0aLIqYnr1Qin7+BQ7+u2XkYPDbcqPlEzDuaHUAQTIOSWuZs3wfMVew==
X-Received: by 2002:a5d:4249:0:b0:386:4a16:dadb with SMTP id
 ffacd0b85a97d-387887df18amr2620105f8f.11.1734021472309; 
 Thu, 12 Dec 2024 08:37:52 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4362571776asm20890445e9.40.2024.12.12.08.37.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Dec 2024 08:37:51 -0800 (PST)
Message-ID: <eaffbf5e-ecb0-4aa3-8d05-da090494f8c3@redhat.com>
Date: Thu, 12 Dec 2024 17:37:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/log: select CONFIG_FONT_SUPPORT
To: Arnd Bergmann <arnd@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 John Ogness <john.ogness@linutronix.de>
Cc: Arnd Bergmann <arnd@arndb.de>, Andreas Larsson <andreas@gaisler.com>,
 "Dr. David Alan Gilbert" <linux@treblig.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20241212154003.1313437-1-arnd@kernel.org>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20241212154003.1313437-1-arnd@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3I5Jp8I_cglcpXhezYwZCeRnKWBiiU8leZD1WPWwjX8_1734021473
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

On 12/12/2024 16:39, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Without fonts, this fails to link:
> 
> drivers/gpu/drm/clients/drm_log.o: in function `drm_log_init_client':
> drm_log.c:(.text+0x3d4): undefined reference to `get_default_font'
> 
> Select this, like the other users do.

Thanks for the fix, I'm sorry I missed that dependency.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Fixes: f7b42442c4ac ("drm/log: Introduce a new boot logger to draw the kmsg on the screen")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/gpu/drm/clients/Kconfig | 1 +
>   lib/fonts/Kconfig               | 2 +-
>   2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/clients/Kconfig b/drivers/gpu/drm/clients/Kconfig
> index c18decc90200..7b81fd0f4cae 100644
> --- a/drivers/gpu/drm/clients/Kconfig
> +++ b/drivers/gpu/drm/clients/Kconfig
> @@ -77,6 +77,7 @@ config DRM_CLIENT_LOG
>   	select DRM_CLIENT
>   	select DRM_CLIENT_SETUP
>   	select DRM_DRAW
> +	select FONT_SUPPORT
>   	help
>   	  This enable a drm logger, that will print the kernel messages to the
>   	  screen until the userspace is ready to take over.
> diff --git a/lib/fonts/Kconfig b/lib/fonts/Kconfig
> index 3ac26bdbc3ff..ae59b5b4e225 100644
> --- a/lib/fonts/Kconfig
> +++ b/lib/fonts/Kconfig
> @@ -10,7 +10,7 @@ if FONT_SUPPORT
>   
>   config FONTS
>   	bool "Select compiled-in fonts"
> -	depends on FRAMEBUFFER_CONSOLE || STI_CONSOLE || DRM_PANIC
> +	depends on FRAMEBUFFER_CONSOLE || STI_CONSOLE || DRM_PANIC || DRM_CLIENT_LOG
>   	help
>   	  Say Y here if you would like to use fonts other than the default
>   	  your frame buffer console usually use.

