Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D89758FBF
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 09:57:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12F5710E413;
	Wed, 19 Jul 2023 07:57:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9788810E413
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 07:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689753427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0LSXzH9KgQuNIJHrVFvJ9YD/ZmxqwFC+Ci2ZGBbMwGk=;
 b=R/bSZ5mtXvrl69m0j2LPjtqiFDM2BSu5VOtMCs3305nuxWSEevRP1VvhXKuouidC+3A43t
 ACls23rYvAb3pbmab44FxRi02bzkfInG2Vp74Wp+RMyK9taDKcyza5CLaVAFhFpakZu//d
 1BqaJGu1ejaybMFF38L4/Gy6UJLRFWE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-374-GUEfzSV0Nemvhrc2uDeqpw-1; Wed, 19 Jul 2023 03:57:06 -0400
X-MC-Unique: GUEfzSV0Nemvhrc2uDeqpw-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3faabd8fd33so35537275e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 00:57:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689753425; x=1690358225;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0LSXzH9KgQuNIJHrVFvJ9YD/ZmxqwFC+Ci2ZGBbMwGk=;
 b=gmLC9CE6ABpQ3mZXqaW6Vx/Aq3+BGW27QS/abjst8fdJCaPjlf1dmV8u3mNAY98oRz
 q/3IdX/nYbQ4FyG5IbhfstLfDU9UbBvOwLOW3ezdk5hidd9s52MHoS7eL2g7lNmsnDjN
 ZUogOQTgR4SBHsqO4yjI/0jnRWuF6oOcs13CrwruHRrbOpCw9jVg3jiMDCDV2koL1ycU
 V4ya/+EpQctlUv3059DycB7Rr6tN9INZPZWd8QPxWmOyxPacJw1Y20OkLFTMB5smJo0h
 J7Hca5+/MQy7mQBp/UbhXYPZzZMvZEzYDDFpYw+MWoV23p4faCRxurelcWkS1q7fuWru
 Yzfw==
X-Gm-Message-State: ABy/qLbHIbMVYwduxBoOZpysFJlEGMAJvaeqjxvjYW80MfgsaKvJk6Co
 blMpSc9dLh4zRc7ozl/iEx97hdGjrW/i7FPJV6b0aaHKsRC/qsNjAQHG/XRzy7r2SEGq7fIhrnt
 QS3G49zxZrYIcvMhtHtUW/0ZrGRpn
X-Received: by 2002:a05:600c:cd:b0:3f7:f884:7be3 with SMTP id
 u13-20020a05600c00cd00b003f7f8847be3mr1334653wmm.4.1689753425237; 
 Wed, 19 Jul 2023 00:57:05 -0700 (PDT)
X-Google-Smtp-Source: APBJJlH74UgMTjLsFyK1xbqZGPblld9XHaIy+slQtfM8QvANl8wo4fumWmYeLIfxy+UY4GY0/K0oJw==
X-Received: by 2002:a05:600c:cd:b0:3f7:f884:7be3 with SMTP id
 u13-20020a05600c00cd00b003f7f8847be3mr1334641wmm.4.1689753424896; 
 Wed, 19 Jul 2023 00:57:04 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 x15-20020a05600c21cf00b003fbbe41fd78sm1046275wmj.10.2023.07.19.00.57.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jul 2023 00:57:04 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/4] fbdev: Split frame buffer support in FB and
 FB_CORE symbols
In-Reply-To: <91486e8b-49ca-4a8a-8dd6-e9a2c6ed63ee@app.fastmail.com>
References: <20230714171642.91185-1-javierm@redhat.com>
 <20230714171642.91185-4-javierm@redhat.com>
 <91486e8b-49ca-4a8a-8dd6-e9a2c6ed63ee@app.fastmail.com>
Date: Wed, 19 Jul 2023 09:57:03 +0200
Message-ID: <87o7k8ibao.fsf@minerva.mail-host-address-is-not-set>
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
Cc: x86@kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Lee Jones <lee@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jingoo Han <jingoohan1@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Randy Dunlap <rdunlap@infradead.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

"Arnd Bergmann" <arnd@arndb.de> writes:

> On Fri, Jul 14, 2023, at 19:16, Javier Martinez Canillas wrote:
>> Currently the CONFIG_FB option has to be enabled even if no legacy fbdev
>> drivers are needed (e.g: only to have support for framebuffer consoles).
>>
>> The DRM subsystem has a fbdev emulation layer, but depends on CONFIG_FB
>> and so it can only be enabled if that dependency is enabled as well.
>>
>> That means fbdev drivers have to be explicitly disabled if users want to
>> enable CONFIG_FB, only to use fbcon and/or the DRM fbdev emulation layer.
>>
>> This patch introduces a non-visible CONFIG_FB_CORE symbol that could be
>> enabled just to have core support needed for CONFIG_DRM_FBDEV_EMULATION,
>> allowing CONFIG_FB to be disabled (and automatically disabling all the
>> fbdev drivers).
>>
>> Nothing from fb_backlight.o and fbmon.o is used by the DRM fbdev emulation
>> layer so these two objects can be compiled out when CONFIG_FB is disabled.
>
> I gave this a spin in my randconfig build setup and found one small
> mistake:
>

Thanks for testing!

>> diff --git a/drivers/video/fbdev/core/Makefile 
>> b/drivers/video/fbdev/core/Makefile
>> index 9150bafd9e89..2cd213716c12 100644
>> --- a/drivers/video/fbdev/core/Makefile
>> +++ b/drivers/video/fbdev/core/Makefile
>> @@ -1,10 +1,10 @@
>>  # SPDX-License-Identifier: GPL-2.0
>>  obj-$(CONFIG_FB_NOTIFY)           += fb_notify.o
>> -obj-$(CONFIG_FB)                  += fb.o
>> -fb-y                              := fb_backlight.o \
>> -                                     fb_info.o \
>> -                                     fbmem.o fbmon.o fbcmap.o \
>> +obj-$(CONFIG_FB_CORE)             += fb.o
>> +fb-y                              := fb_info.o \
>> +                                     fbmem.o fbcmap.o \
>>                                       modedb.o fbcvt.o fb_cmdline.o 
>> fb_io_fops.o
>> +fb-$(CONFIG_FB)                   += fb_backlight.o fbmon.o
>
> With CONFIG_FB_CORE=y and CONFIG_FB=m, Kbuild does not include
> the fb_backlight.o and fbmon.o files in fb.ko because they are not
> set to =y, causing link failures for fbdev drivers later:
>
> ERROR: modpost: "of_get_fb_videomode" [drivers/video/fbdev/clps711x-fb.ko] undefined!
> ERROR: modpost: "fb_videomode_from_videomode" [drivers/video/fbdev/atmel_lcdfb.ko] undefined!
> ERROR: modpost: "of_get_fb_videomode" [drivers/video/fbdev/imxfb.ko] undefined!
> ERROR: modpost: "fb_destroy_modedb" [drivers/video/fbdev/udlfb.ko] undefined!
> ERROR: modpost: "fb_edid_to_monspecs" [drivers/video/fbdev/udlfb.ko] undefined!
> ERROR: modpost: "fb_destroy_modedb" [drivers/video/fbdev/smscufx.ko] undefined!
> ERROR: modpost: "fb_edid_to_monspecs" [drivers/video/fbdev/smscufx.ko] undefined!
> ERROR: modpost: "fb_destroy_modedb" [drivers/video/fbdev/uvesafb.ko] undefined!
> ERROR: modpost: "fb_validate_mode" [drivers/video/fbdev/uvesafb.ko] undefined!
> ERROR: modpost: "fb_get_mode" [drivers/video/fbdev/uvesafb.ko] undefined!
>

Right, sorry for missing that combination.

>
> Folding this fixup into the patch makes it work:
>
> diff --git a/drivers/video/fbdev/core/Makefile b/drivers/video/fbdev/core/Makefile
> index 2cd213716c12f..84ddc5d308b58 100644
> --- a/drivers/video/fbdev/core/Makefile
> +++ b/drivers/video/fbdev/core/Makefile
> @@ -4,7 +4,9 @@ obj-$(CONFIG_FB_CORE)             += fb.o
>  fb-y                              := fb_info.o \
>                                       fbmem.o fbcmap.o \
>                                       modedb.o fbcvt.o fb_cmdline.o fb_io_fops.o
> -fb-$(CONFIG_FB)                   += fb_backlight.o fbmon.o
> +ifdef CONFIG_FB
> +fb-y		                   += fb_backlight.o fbmon.o
> +endif
>  fb-$(CONFIG_FB_DEFERRED_IO)       += fb_defio.o
>  fb-$(CONFIG_FB_DEVICE)            += fb_chrdev.o \
>                                       fb_procfs.o \
>

Perfect, I'll squash your fix in v6. Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

