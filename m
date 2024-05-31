Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 736B98D5E55
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 11:33:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6784C10E9DD;
	Fri, 31 May 2024 09:33:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="TFpVCl49";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69B1D10E2A5
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 09:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717147973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=daMc8fu8sqYoSXDKE0q2sVY1dHTtpbwHNRZkb+fMfsE=;
 b=TFpVCl492j88DqoPTgLNX2+DQtpbRmbVUwV+WAwyO/8cq/V1nWsdsnWvLtWEYySKwuYu/J
 dWeK9xsXIMvHtEFtg+PTCHFOK+yL79yMd0YMyyCxcclhYSf6dCDLoa8pc+1lPixmFCGg93
 yNTmvLsOkJn7a5ItT28HJgOVVvf3zT0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-88-T2AQWDPpOcG6CGTd_g_tgw-1; Fri, 31 May 2024 05:32:49 -0400
X-MC-Unique: T2AQWDPpOcG6CGTd_g_tgw-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4212a20c447so8083745e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 02:32:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717147968; x=1717752768;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=daMc8fu8sqYoSXDKE0q2sVY1dHTtpbwHNRZkb+fMfsE=;
 b=DaHS0uU934KiW/aUYSlt6XoUF/cITUYO897PA+Aqzxt4lOdHVw6TJUMdFxYIb1dg2Q
 Fi/fIdYG3VrdUe3mCBsIH2lPgRljjnuahSoN70C7vSHTcBxUBDPP3sggxB6lSur7+vGR
 aRTZTLLZkObG6eb26BlMb7O+4g0vLy3yfnu/RInLAkrLIY+BcegbwPzoy5ICq6lPzFTA
 ZfEHJHEwRRwM8Yh39/OvM9BYtwCpguW0WQaDBS9NkiyFI3wuWw0nEKxvSn7/1Uoa2AkO
 TvCrqxLjG/1vd7IG8AxPV3FELcAsH8vsLdARal+lmsepju7vl1i0nVVB5aQAcjTKkHIb
 Eerg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+qMWZbkDeICzrDvxsdYOHYrXTlXE7A065QtacNGwHCxtWvivzQC79OCKF56DtczKejsUad73G8sv2s+Q2NeRqQJ0pmsHdC9bVVFHh+LcF
X-Gm-Message-State: AOJu0YyCPK4FrIA4ml9Cr3rbQfVDByya+B3zJKSfiGNNI4xjjlrY983u
 UammFS8/ZUmlzdpLsaUYOmsmtvQgPcGjwuQohomC042lxmP97a4PP/RFsi4/MCOD3FuTmPlzHTd
 ipto/LAGpuJRg+86xKYhuVvqdM1Z4UOPrigo2uhkWCB2vc4zLt5/aqZswm4r/bxUqNA==
X-Received: by 2002:a05:600c:4704:b0:41f:e098:53e with SMTP id
 5b1f17b1804b1-4212e05ec5bmr13350595e9.17.1717147968315; 
 Fri, 31 May 2024 02:32:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRsBFHw/ietlhwEpCQ4ZkdjjJp5uuzBsLdNRGNbf/5T+sO4bemWBkwqMJcMYSRSkLyljw0hw==
X-Received: by 2002:a05:600c:4704:b0:41f:e098:53e with SMTP id
 5b1f17b1804b1-4212e05ec5bmr13350375e9.17.1717147967761; 
 Fri, 31 May 2024 02:32:47 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4212b83cda8sm19603825e9.7.2024.05.31.02.32.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 May 2024 02:32:47 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH 3/3] drm/panic: Add a kmsg dump screen
In-Reply-To: <20240531080750.765982-4-jfalempe@redhat.com>
References: <20240531080750.765982-1-jfalempe@redhat.com>
 <20240531080750.765982-4-jfalempe@redhat.com>
Date: Fri, 31 May 2024 11:32:46 +0200
Message-ID: <87a5k61g3l.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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

Jocelyn Falempe <jfalempe@redhat.com> writes:

> Add a kmsg dump option, which will display the last lines of kmsg,
> and should be similar to fbcon.
> Add a Kconfig choice for the panic screen, so that the user can
> choose between this new kmsg dump, or the userfriendly option.
>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>  drivers/gpu/drm/Kconfig     |  21 +++++
>  drivers/gpu/drm/drm_panic.c | 151 +++++++++++++++++++++++++++---------
>  2 files changed, 136 insertions(+), 36 deletions(-)
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 9703429de6b9..78d401b55102 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -137,6 +137,27 @@ config DRM_PANIC_DEBUG
>  	  This is unsafe and should not be enabled on a production build.
>  	  If in doubt, say "N".
>  
> +choice
> +	prompt "Panic screen formater"
> +	default DRM_PANIC_SCREEN_USERFRIENDLY
> +	depends on DRM_PANIC
> +	help
> +	  This option enable to choose what will be displayed when a kernel
> +	  panic occurs.
> +
> +	config DRM_PANIC_SCREEN_USERFRIENDLY
> +		bool "Default user friendly message"
> +		help
> +		  Only a short message telling the user to reboot the system.
> +
> +	config DRM_PANIC_SCREEN_KMSG
> +		bool "Display the last lines of kmsg"
> +		help
> +		  Display kmsg last lines on panic.
> +		  Enable if you are a kernel developer, and want to debug a
> +		  kernel panic.
> +endchoice

Why having it as a compile time option and not a runtime option ? AFAICT
this could be a drm.panic_format= kernel command line parameter instead.

[...]
  
> -/*
> - * Draw the panic message at the center of the screen
> - */
> +#if defined(CONFIG_DRM_PANIC_SCREEN_USERFRIENDLY)
> +

And that could avoid ifdefery in the C file.

[...]

> +#elif defined(CONFIG_DRM_PANIC_SCREEN_KMSG)
> +
> +#include <linux/kmsg_dump.h>
> +#include <linux/printk.h>
> +

I would add these even if guarded by DRM_PANIC_SCREEN_KMSG, to the
start of the C file where are the other headers include directives.

The patch looks good to me though, so if you prefer to keep it as a
build time option:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

