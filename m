Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C11879C885
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 09:48:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8650E10E042;
	Tue, 12 Sep 2023 07:48:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED3B910E042
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 07:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694504895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a+gOdhSF4o6EKWTmDRFivLfAyb8HdVlHUDHb0/rf+sI=;
 b=KgkfLUx94QzaNBsfcppC4x86m8MctgxA8Y2Gct7irNGLloaHcT94PGCMS3qWNqyXtqAnlk
 PV77Tt5i3aTSI66s9Vsr/r/WRC++m7qb82zx9XC22a67hB9rkzerfWW0+pC7p1dpKuT9TB
 hsNdBv9hNr257Qxp+ddvaBohrD0e/V0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-209-wPkoVSMEMyC2tQUHVrAnPw-1; Tue, 12 Sep 2023 03:48:11 -0400
X-MC-Unique: wPkoVSMEMyC2tQUHVrAnPw-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-401c4f03b00so42199205e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 00:48:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694504890; x=1695109690;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2B0WC8PzLNLdGRasGQ/ag9W7qGL3oBFmynvW1yiJ2zE=;
 b=VvIWjnuXUQoEzmWWorqNGS9V08BNIMg8cgSnlVZXH1pIi+Iu+MoHTmKDGgmGhMM2Oa
 P/uEJRuMzWktcCZV5q+nX5HPhjsa1w+Xf3NEvoEpLi1TEsVGDcAnR10D5s6h1asBZ4qt
 KXroU0rL3um4mMw+VLoT+90Tjr6338Og04htK9WwQXRJcWrXQp/TjLAZMZWjua0K3aWp
 rxCRZY0VALIMx/WreW/tjyblq5P9TKC7BUNslyO914YHKQcCgRs4KBwkL7BZ0atJhKdP
 oOeFAxw2E/nbDkTAkgxkB+Hec06BreF9vH2NDuTZQp3uOwdN4xI/xqcLnbQX6uq16Gkf
 iBfg==
X-Gm-Message-State: AOJu0Yyr7v6Y8XVS2jP4DACFxaazAFIuHhDymc+4RmLnQdAW4tU3AlyS
 TX+CcWLYKD7nb8NlNuMUnK9496Ut67MAd73WyTQ3P3QJP3bFtXz2F7w0awOEJn0FDGLOfyNlQUG
 S/O0Tx6m42C5EuNjzTpximtx4zpTu
X-Received: by 2002:a1c:7508:0:b0:3fe:1f93:8cf4 with SMTP id
 o8-20020a1c7508000000b003fe1f938cf4mr9447290wmc.8.1694504890542; 
 Tue, 12 Sep 2023 00:48:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+rSaX2GVdThWkFlifttXlbzNXae8MOoKXkiRAt9ShgN0wMc6R6A+/mp5KLadFPQ6BmDhQJQ==
X-Received: by 2002:a1c:7508:0:b0:3fe:1f93:8cf4 with SMTP id
 o8-20020a1c7508000000b003fe1f938cf4mr9447271wmc.8.1694504890238; 
 Tue, 12 Sep 2023 00:48:10 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 g17-20020a7bc4d1000000b003fc02e8ea68sm15255183wmk.13.2023.09.12.00.48.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Sep 2023 00:48:10 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] drm: fix up fbdev Kconfig defaults
In-Reply-To: <CAMuHMdWizKkuLEcv8sFFOWPib-0e1onCRuQEZm6OhV592VWUKQ@mail.gmail.com>
References: <20230911205338.2385278-1-arnd@kernel.org>
 <CAMuHMdWizKkuLEcv8sFFOWPib-0e1onCRuQEZm6OhV592VWUKQ@mail.gmail.com>
Date: Tue, 12 Sep 2023 09:48:09 +0200
Message-ID: <87a5tr3k92.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Arthur Grillo <arthurgrillo@riseup.net>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

Hello Geert,

> Hi Arnd,
>
> On Mon, Sep 11, 2023 at 10:53=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> =
wrote:

[...]

>> --- a/drivers/gpu/drm/Kconfig
>> +++ b/drivers/gpu/drm/Kconfig
>> @@ -135,7 +135,7 @@ config DRM_FBDEV_EMULATION
>>         bool "Enable legacy fbdev support for your modesetting driver"
>>         depends on DRM
>>         select FRAMEBUFFER_CONSOLE_DETECT_PRIMARY if FRAMEBUFFER_CONSOLE
>> -       default y
>> +       default FB
>
> While this is true for existing configs, it is no longer true in general,
> as DRM_FBDEV_EMULATION is no longer related to FB.
>

Maybe default y if (FB_DEVICE || FRAMEBUFFER_CONSOLE) ?

>>         help
>>           Choose this option if you have a need for the legacy fbdev
>>           support. Note that this support also provides the linux consol=
e
>> diff --git a/drivers/video/console/Kconfig b/drivers/video/console/Kconf=
ig
>> index b575cf54174af..83c2d7329ca58 100644
>> --- a/drivers/video/console/Kconfig
>> +++ b/drivers/video/console/Kconfig
>> @@ -74,6 +74,7 @@ config DUMMY_CONSOLE_ROWS
>>  config FRAMEBUFFER_CONSOLE
>>         bool "Framebuffer Console support"
>>         depends on FB_CORE && !UML
>> +       default DRM_FBDEV_EMULATION
>
> Sounds good to me, although it looks a bit strange at first sight
> (FRAMEBUFFER_CONSOLE defaults to n on a system with real fbdev, but
> y on emulated fbdev?).

And there Maybe default y if (FB || DRM_FBDEV_EMULATION) ?

> So this is the fix for commit a5ae331edb02b ("drm: Drop select
> FRAMEBUFFER_CONSOLE for DRM_FBDEV_EMULATION").
>
>>         select VT_HW_CONSOLE_BINDING
>>         select CRC32
>>         select FONT_SUPPORT
>> diff --git a/drivers/video/fbdev/core/Kconfig b/drivers/video/fbdev/core=
/Kconfig
>> index 114cb8aa6c8fd..804c2bec9b43c 100644
>> --- a/drivers/video/fbdev/core/Kconfig
>> +++ b/drivers/video/fbdev/core/Kconfig
>> @@ -28,7 +28,7 @@ config FIRMWARE_EDID
>>  config FB_DEVICE
>>         bool "Provide legacy /dev/fb* device"
>>         depends on FB_CORE
>> -       default y
>> +       default FB
>
> Changing this means possibly causing regressions on systems running
> an fbdev userspace.
>

Right, specially if using DRM fbdev emulation since then the default will
be different between v6.5 and v6.6 (that's what this patch tries to avoid).

So probably we could keept that default as 'y'.

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

