Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 897037439DE
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 12:51:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C5D110E16A;
	Fri, 30 Jun 2023 10:51:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1687710E16A
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 10:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688122271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uyqtfh/uO+c59eeqAPwfK8ApK34k3U13F7I83iFK+cU=;
 b=CRBf8E0Qxr9ZIqedptmeoMzbFl6R08GUGH6R39whIwuWfhHEjmd963xa+0d1cTPCrpFZrg
 4yONJLN8Ps31Gpfi5hpZI6FHWAAqv6VrFFxwphbN0wV3NPfgIXF8wauGT+ZqMKQ9hvPyNh
 IMou0UJ9uXMpQSBImvJVTM2Hzq94uUQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-480-mV-ZYFymNyiKFASDco8Z3g-1; Fri, 30 Jun 2023 06:51:10 -0400
X-MC-Unique: mV-ZYFymNyiKFASDco8Z3g-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3fb40d0623bso8367005e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 03:51:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688122269; x=1690714269;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uyqtfh/uO+c59eeqAPwfK8ApK34k3U13F7I83iFK+cU=;
 b=NiVfpRge4s2+wYPHQYd4v/zPNsfC7Wt/v7zyw1D7LXwuI+WAnIoqb4dKgEG6rYYthe
 1OnS17GvD4TDC2oFKdiP8D1AiZ6l+e7uOUzATvwJCLLIymBtzm8hANZEqzfYysgAKb/e
 0WOIZvXT1o0dkqUQQG/t6A/c8NgZhvy7BiKSuLUqGutO9g493XsOwlw/ZfWH8ZWKMxkL
 ZIHvyQ/ZBHTUz/UEZTWKHUEAygpqTMLE9JGYlOlnedlnZwyY+2VPsk2RGBJP+E/A1U/L
 ska51SeDbqxTjrm100RIdZ0YFqNs5FeBG4ZJT7dCSsUC0ulC+IHZ3l8vXrAWrEjuGLw5
 P+uQ==
X-Gm-Message-State: AC+VfDzWO6mhcQjscix8j+ZDskUaiHS+JmoWIqW34jZLmGMpaXhQnXIq
 XXOHXjb9CZVUaQRneobFc6DAMbpipWde0SpMQ3khvPY60Xem4DwnFXZArOt8w+emG+L9MmQlnGZ
 ZN0GDh17aYjgL5JZ7XINDFbpXVmBJ
X-Received: by 2002:a05:600c:2259:b0:3f7:aee8:c23a with SMTP id
 a25-20020a05600c225900b003f7aee8c23amr6742594wmm.19.1688122269271; 
 Fri, 30 Jun 2023 03:51:09 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4ar/tTtvUE+lxD/WKHTgCoVCq4pBAcO5fMERH2qhCP0DM6uF+75yi5jYVG8xRfdHUuTfLWAQ==
X-Received: by 2002:a05:600c:2259:b0:3f7:aee8:c23a with SMTP id
 a25-20020a05600c225900b003f7aee8c23amr6742572wmm.19.1688122268942; 
 Fri, 30 Jun 2023 03:51:08 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 a10-20020a05600c224a00b003faef96ee78sm12491386wmm.33.2023.06.30.03.51.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jun 2023 03:51:08 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] fbdev: Split frame buffer support in FB and FB_CORE
 symbols
In-Reply-To: <723a3c51-7997-46d0-9262-68f33384a9e7@app.fastmail.com>
References: <20230629225113.297512-1-javierm@redhat.com>
 <20230629225113.297512-2-javierm@redhat.com>
 <723a3c51-7997-46d0-9262-68f33384a9e7@app.fastmail.com>
Date: Fri, 30 Jun 2023 12:51:07 +0200
Message-ID: <87h6qpdy04.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 dri-devel@lists.freedesktop.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

"Arnd Bergmann" <arnd@arndb.de> writes:

Hello Arnd,

Thanks for your review!

> On Fri, Jun 30, 2023, at 00:51, Javier Martinez Canillas wrote:
>> Currently the CONFIG_FB option has to be enabled even if no legacy fbdev
>> drivers are needed (e.g: only to have support for framebuffer consoles).
>>
>> The DRM subsystem has a fbdev emulation layer, but depends on CONFIG_FB
>> and so it can only be enabled if that dependency is enabled as well.
>>
>> That means fbdev drivers have to be explicitly disabled if users want to
>> enable CONFIG_FB, only to use fbcon and/or the DRM fbdev emulation layer.
>>
>> This patch introduces a CONFIG_FB_CORE option that could be enabled just
>> to have the core support needed for CONFIG_DRM_FBDEV_EMULATION, allowing
>> CONFIG_FB to be disabled (and automatically disabling all fbdev drivers).
>>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>> ---
>
> This looks really nice!
>
> I tried to do something like this a few years ago, but failed as

Yes, I also tried to do this before some time ago [0]:

[0]: https://lore.kernel.org/lkml/20210827100027.1577561-1-javierm@redhat.com/t/#mc8bb6cda8c2d795673618049b6c834b34bf86162

and at the time required some code refactoring but now thanks to all the
cleanups that Thomas has been doing over, I could just do it with Kconfig.

> I did too much at once by attempting to cut out msot of the fb core
> support that is not actually used by DRM at the same time.
>
> Doing just the Kconfig bits as you do here is probably better
> anyway, cutting out unneeded bits into separate modules or #ifdef
> sections can come later.
>

Exactly, that was my thought too. Glad that you agree with the approach.

>> @@ -59,7 +71,7 @@ config FIRMWARE_EDID
>> 
>>  config FB_DEVICE
>>  	bool "Provide legacy /dev/fb* device"
>> -	depends on FB
>> +	depends on FB_CORE
>>  	default y
>>  	help
>>  	  Say Y here if you want the legacy /dev/fb* device file and
>
> I don't see this symbol in linux-next yet, what tree are you using
> as a base?
>

It's now in the drm-misc/drm-misc-next branch [1]. It's not in -next yet
because it just landed a few days ago [2].

[1]: https://cgit.freedesktop.org/drm/drm-misc/log/?h=drm-misc-next
[2]: https://cgit.freedesktop.org/drm/drm-misc/commit/?id=701d2054fa3

In fact, that's the reason why I rebased my previous attempt [0].

>> @@ -69,13 +81,13 @@ config FB_DEVICE
>> 
>>  config FB_DDC
>>  	tristate
>> -	depends on FB
>> +	depends on FB_CORE
>>  	select I2C_ALGOBIT
>>  	select I2C
>
> This seems to only be used by actual fbdev drivers, so maybe
> don't change the dependency here.
>

Indeed.

>> @@ -162,22 +174,22 @@ endchoice
>> 
>>  config FB_SYS_FOPS
>>  	tristate
>> -	depends on FB
>> +	depends on FB_CORE
>
> Same for this one
>

Ok.

>>  config FB_HECUBA
>>  	tristate
>> -	depends on FB
>> +	depends on FB_CORE
>>  	depends on FB_DEFERRED_IO
>> 
>>  config FB_SVGALIB
>>  	tristate
>> -	depends on FB
>> +	depends on FB_CORE
>>  	help
>>  	  Common utility functions useful to fbdev drivers of VGA-based
>>  	  cards.
>>  config FB_MACMODES
>>  	tristate
>> -	depends on FB
>> +	depends on FB_CORE
>> 
>
> These three seem to actually be part of fbdev drivers rather
> than the core, and it may be best to move them into
> drviers/video/fbdev/ as standalone modules. That would be a
> separate patch of course.
>

Agreed. I'll then also don't change the dependency on these ones.

>>  config FB_BACKLIGHT
>>  	tristate
>> -	depends on FB
>> +	depends on FB_CORE
>>  	select BACKLIGHT_CLASS_DEVICE
>
> Separating this one from FB_CORE would help avoid circular dependencies,
> this one keeps causing issues.
>

You mean separating from FB or should I keep the existing depends on FB?

It seems this is only used by fbdev drivers so probably the latter?

>> @@ -1,22 +1,22 @@
>>  # SPDX-License-Identifier: GPL-2.0
>>  obj-$(CONFIG_FB_NOTIFY)           += fb_notify.o
>> -obj-$(CONFIG_FB)                  += fb.o
>> -fb-y                              := fb_backlight.o \
>> +obj-$(CONFIG_FB_CORE)             += fb_core.o
>> +fb_core-y                         := fb_backlight.o \
>>                                       fb_info.o \
>>                                       fbmem.o fbmon.o fbcmap.o \
>>                                       modedb.o fbcvt.o fb_cmdline.o 
>
> I would not bother renaming the module itself here, that
> might cause problems if anything relies on loading the
> module by name or a named module parameter.
>

I was actually not sure about this, but then thought that someone could
had complained that the Kconfig symbol and module name wouldn't match :)

I'll just keep the existing module name then and drop the rename.

>       Arnd
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

