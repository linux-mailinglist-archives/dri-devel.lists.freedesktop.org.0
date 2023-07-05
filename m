Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D6C747F7E
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 10:23:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0288010E147;
	Wed,  5 Jul 2023 08:23:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D04D010E147
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 08:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688545388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TdhQb+Syo7axqoDqvE+d+9JDiCWJ3NaRZrNyouSZxA4=;
 b=BQ53SPYW6e9ueCxnezioiP3wCksnsweCDsB/IbYD6gDEAvYCyaK6WUFGYFI/7GMp3UBwsI
 F9Q/kKWlmZnxoEZTfaO++Z9FHhjNuNDRhal76ehQmLwSrzenP3LItNGF9+HGHO3hEJFlTh
 frnnsv2xpsN8XDwpP9h5HDSsa0iB71k=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-196-MVfVVdC2Mn6WyrU6BYRbeQ-1; Wed, 05 Jul 2023 04:23:07 -0400
X-MC-Unique: MVfVVdC2Mn6WyrU6BYRbeQ-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-4fb748a83b4so6191612e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jul 2023 01:23:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688545385; x=1691137385;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TdhQb+Syo7axqoDqvE+d+9JDiCWJ3NaRZrNyouSZxA4=;
 b=HFiDp9kmQuYalhSAeS2J4Kf6pNutG419j1Bu2MO3KHibNHXNqj098VbRaQhMEmX6zu
 kZdygLm5JG76YCTAORA7opR3WaGgv4yaOJ8FOtn13pGL/a9O+aZMkFWTDWxGzAdeHOqv
 LqQu/cAY9r+7Koj/4l+JuoP9DwKdoWdI70H4jKPWiWcF/cJH0jnc2vB1qeBQ8Rc5jT5r
 3njypjVW9iFZI41qXeHRTW/EJ8gxgfUzYr4jl2ogXBDCycDKquCEP3QEMaQcj6rMlEYI
 PWkM4NWwc4r4XGCFhwoe06EOu9b5+8p5ktvZH/d/tTpMjAM/F3WsbvxEaVzk0C2dEqKH
 5hSQ==
X-Gm-Message-State: ABy/qLYt607o2iO5z/Hl7FiAM7smhUYHT1z4WbhyQfSt1d06OMI1fudq
 ldDK5DmArDlOkmMU1IfDDvGoFLYJVOcj4ETAkNJSbaP8KW0wd9JQ9LZLZwZRm8zSe6Ou73L0YkB
 rfqrsTOCHo1lW8UBDOp1229nWY5vu
X-Received: by 2002:a2e:8095:0:b0:2b6:a344:29cf with SMTP id
 i21-20020a2e8095000000b002b6a34429cfmr10093144ljg.17.1688545385617; 
 Wed, 05 Jul 2023 01:23:05 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGDvUCFfme/Nn/ZdctOdvEvefSFNX7STUaOhlHec73G4bbSvs9bTxRZM7iY07V1SqMwOI36OA==
X-Received: by 2002:a2e:8095:0:b0:2b6:a344:29cf with SMTP id
 i21-20020a2e8095000000b002b6a34429cfmr10093130ljg.17.1688545385203; 
 Wed, 05 Jul 2023 01:23:05 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 r13-20020a05600c458d00b003fa9a00d74csm1422474wmo.3.2023.07.05.01.23.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jul 2023 01:23:04 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: Re: [PATCH 01/10] fbdev: Add fb_ops init macros for framebuffers in
 DMA-able memory
In-Reply-To: <20230704160133.20261-2-tzimmermann@suse.de>
References: <20230704160133.20261-1-tzimmermann@suse.de>
 <20230704160133.20261-2-tzimmermann@suse.de>
Date: Wed, 05 Jul 2023 10:23:03 +0200
Message-ID: <875y6ysr6g.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Add initializer macros for struct fb_ops for framebuffers in DMA-able
> memory areas. Also add a corresponding Kconfig token. As of now, this
> is equivalent to system framebuffers and mostly useful for labeling
> drivers correctly.
>
> A later patch may add a generic DMA-specific mmap operation. Linux
> offers a number of dma_mmap_*() helpers for different use cases.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Helge Deller <deller@gmx.de>
> ---
>  drivers/video/fbdev/Kconfig |  8 ++++++++
>  include/linux/fb.h          | 13 +++++++++++++
>  2 files changed, 21 insertions(+)
>
> diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
> index cecf15418632..f14229757311 100644
> --- a/drivers/video/fbdev/Kconfig
> +++ b/drivers/video/fbdev/Kconfig
> @@ -168,6 +168,14 @@ config FB_DEFERRED_IO
>  	bool
>  	depends on FB
>  
> +config FB_DMA_HELPERS
> +	bool
> +	depends on FB
> +	select FB_SYS_COPYAREA
> +	select FB_SYS_FILLRECT
> +	select FB_SYS_FOPS
> +	select FB_SYS_IMAGEBLIT
> +
>  config FB_IO_HELPERS
>  	bool
>  	depends on FB
> diff --git a/include/linux/fb.h b/include/linux/fb.h
> index 1d5c13f34b09..1191a78c5289 100644
> --- a/include/linux/fb.h
> +++ b/include/linux/fb.h
> @@ -594,6 +594,19 @@ extern ssize_t fb_sys_write(struct fb_info *info, const char __user *buf,
>  	__FB_DEFAULT_SYS_OPS_DRAW, \
>  	__FB_DEFAULT_SYS_OPS_MMAP
>  
> +/*
> + * Helpers for framebuffers in DMA-able memory
> + */
> +

The comment for I/O memory helpers says:

/*
 * Initializes struct fb_ops for framebuffers in I/O memory.
 */

I think that would be good to have consistency between these two,
so something like:

/*
 * Initializes struct fb_ops for framebuffers in DMA-able memory.
 */

> +#define __FB_DEFAULT_DMA_OPS_RDWR \
> +	.fb_read	= fb_sys_read, \
> +	.fb_write	= fb_sys_write
> +
> +#define __FB_DEFAULT_DMA_OPS_DRAW \
> +	.fb_fillrect	= sys_fillrect, \
> +	.fb_copyarea	= sys_copyarea, \
> +	.fb_imageblit	= sys_imageblit
> +

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

