Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4DD7272B5
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 01:07:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B193B10E566;
	Wed,  7 Jun 2023 23:07:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5A9210E566
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 23:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686179270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NeyeiJwB2YnwAcLQJHG8HFbbrzLzOPay5XEB/Mwx9Ig=;
 b=Q7O/eetuouvy2gcuYezYcIyngXM2mQ4eZrYBbUwpgGo5p5GGU3SjzXY4fqYFJudu6IuOGm
 DkNrJXl5VyDTdgbzDyjoQqnOinuKPwxSz3BB1iWpj82QY22y3e3Ze4LEUw3pzuTSga1uh6
 8vfD+63UrPYuONpAFQb40/xaJh6p6jo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-75-i65hBqhtMUSEftYBSDBBHA-1; Wed, 07 Jun 2023 19:07:49 -0400
X-MC-Unique: i65hBqhtMUSEftYBSDBBHA-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f7f52c99baso2851935e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jun 2023 16:07:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686179268; x=1688771268;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CzPJdjd02VNeNLl14O4tReNjsYBGUu/pZADGgCv1i2o=;
 b=LtuVtyLHL1sKzazAJvu7wdyofA8tKBq34gDcNYNkBZ05oglvbmK6xEFdN+46j+6qZs
 5h2drQSFRPnlDXhuzP5WFzStjc7t+Qjw3BGXeWUXIWTyHBdf1ctFnPXRBx1NFNWJLwPJ
 +ogyCwZ9f1VSmS4Sm8Hmft5/o4cI12LH+wu4lLxw+6u438YH7v5LR1c53zon+6c8S/Fj
 mAvaY+MLsb3O0cxXt7I4A/YZWYuRP6xPEBWLLB79VHiyUuLlGCSWc6paFpy7C+ldv1J6
 FasBBfPxll2lwiZRhxYOuZppA8Lop1mqVsNcH3ikp93A2Ucw+yS/gbnCpWBnN3vr/nhT
 69aw==
X-Gm-Message-State: AC+VfDzcTksci4ZLj5w/BUaOMUH5cd3zAIGHTht21yRpuENFcIYxm5MX
 isXv35c4IfWCmUM0uEwZNRUSYF6+UE0oLveUf6OGB5fLGfW5r7T93GOJB3wSW8HXGwyLr4Z4jXY
 cF00h7RrA9RFLWrXSqRep2EO1yZqU
X-Received: by 2002:a05:600c:287:b0:3f6:f7c:b3fa with SMTP id
 7-20020a05600c028700b003f60f7cb3famr5617448wmk.31.1686179268612; 
 Wed, 07 Jun 2023 16:07:48 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7yuzlNYlFd9At+efr6s7V++AJjpo4wp6t37d3PBdQ42FjEQ40JOh3bqJjvNUUJHF19hKrWRw==
X-Received: by 2002:a05:600c:287:b0:3f6:f7c:b3fa with SMTP id
 7-20020a05600c028700b003f60f7cb3famr5617443wmk.31.1686179268312; 
 Wed, 07 Jun 2023 16:07:48 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 l8-20020a7bc448000000b003f42328b5d9sm96487wmi.39.2023.06.07.16.07.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jun 2023 16:07:47 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Thomas Zimmermann
 <tzimmermann@suse.de>
Subject: Re: [PATCH 30/30] fbdev: Make support for userspace interfaces
 configurable
In-Reply-To: <CAMuHMdWBUKTgfCD9VLDFh_Tm1J-NJQHpxODs-TuYM7V-dtmGjA@mail.gmail.com>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-31-tzimmermann@suse.de>
 <CAMuHMdVP2hrgXaZvASnHJ4M+VXaTCtfbeVXrq2dsEJqcs3G6ZA@mail.gmail.com>
 <e5d88ca8-66fe-b5ee-cb6b-2dc8f3a3fb26@suse.de>
 <CAMuHMdWBUKTgfCD9VLDFh_Tm1J-NJQHpxODs-TuYM7V-dtmGjA@mail.gmail.com>
Date: Thu, 08 Jun 2023 01:07:47 +0200
Message-ID: <873532eurg.fsf@minerva.mail-host-address-is-not-set>
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
Cc: daniel.thompson@linaro.org, lee@kernel.org, linux-sh@vger.kernel.org,
 jingoohan1@gmail.com, deller@gmx.de, linux-staging@lists.linux.dev,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-omap@vger.kernel.org, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

Hello Geert and Thomas,

> Hi Thomas,
>
> On Wed, Jun 7, 2023 at 5:15=E2=80=AFPM Thomas Zimmermann <tzimmermann@sus=
e.de> wrote:
>> Am 07.06.23 um 10:48 schrieb Geert Uytterhoeven:
>> > On Mon, Jun 5, 2023 at 4:48=E2=80=AFPM Thomas Zimmermann <tzimmermann@=
suse.de> wrote:
>> >> --- a/drivers/video/fbdev/Kconfig
>> >> +++ b/drivers/video/fbdev/Kconfig
>> >> @@ -57,6 +57,15 @@ config FIRMWARE_EDID
>> >>            combination with certain motherboards and monitors are kno=
wn to
>> >>            suffer from this problem.
>> >>
>> >> +config FB_DEVICE
>> >> +        bool "Provide legacy /dev/fb* device"
>> >
>> > Perhaps "default y if !DRM", although that does not help for a
>> > mixed drm/fbdev kernel build?
>>
>> We could simply set it to "default y".  But OTOH is it worth making it a
>> default? Distributions will set it to the value they need/want. The very
>> few people that build their own kernels to get certain fbdev drivers
>> will certainly be able to enable the option by hand as well.
>
> Defaulting to "n" (the default) means causing regressions when these
> few people use an existing defconfig.
>

Having "dfault y if !DRM" makes sense to me. I guess is a corner case but
at least it won't silently be disabled for users that only want fbdev as
Geert mentioned.

I wouldn't call it a regression though, because AFAIK the Kconfig options
are not a stable API ?

>> > Or reserve "FB" for real fbdev drivers, and introduce a new FB_CORE,
>> > to be selected by both FB and DRM_FBDEV_EMULATION?
>> > Then FB_DEVICE can depend on FB_CORE, and default to y if FB.

Funny that you mention because it's exactly what I attempted in the past:

https://lore.kernel.org/all/20210827100531.1578604-1-javierm@redhat.com/T/#=
u

>>
>> That wouldn't work. In Tumbleweed, we still have efifb and vesafb
>> enabled under certain conditions; merely for the kernel console. We'd
>> have to enable CONFIG_FB, which would bring back the device.
>
> "Default y" does not mean that you cannot disable FB_DEVICE, so
> you are not forced to bring back the device?
>

I think we can have both to make the kernel more configurable:

1) Allow to only disable fbdev user-space APIs (/dev/fb?, /proc/fb, etc),
   which is what the series is doing with the new FB_DEVICE config symbol.

2) Allow to disable all "native" fbdev drivers and only keep the DRM fbdev
   emulation layer. That's what my series attempted to do with the FB_CORE
   Kconfig symbol.

I believe that there are use cases for both, for example as Thomas' said
many distros are disabling all the fbdev drivers and their user-space only
requires DRM/KMS, so makes sense to not expose any fbdev uAPI at all.

But may be that other users want the opposite, they have an old user-space
that requires fbdev, but is running on newer hardware that only have a DRM
driver. So they will want DRM fbdev emulation but none fbdev driver at all.

That's why I think that FB_DEVICE and FB_CORE are complementary and we can
support any combination of the two, if you agree there are uses for either.

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

