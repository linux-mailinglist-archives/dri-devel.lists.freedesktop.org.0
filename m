Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D35079C8BB
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 09:55:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E86310E3A6;
	Tue, 12 Sep 2023 07:55:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18B4010E3A6
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 07:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694505325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x6EtKeJ8Fl2CPlsqoDZCiTeQu7RXnApXQXlT1M5EOII=;
 b=J5nmL6V/hmGD0bKhyRfqDeMcmPRAIheD9EPRrWXCz7V95RXjmzszmecTuYaNW+qXAG7Tk2
 qgfC6aT1vmXCFmXGZVYB3HjYj1v/is3AT03VPatbslCmISl5Evbexz/hxJ74rTVNxZko88
 Nj6gvmed23frS8jgNhIDlpW+dqIZhA8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-5-sZKVvoMpPcSJNFaAiZGjQQ-1; Tue, 12 Sep 2023 03:55:23 -0400
X-MC-Unique: sZKVvoMpPcSJNFaAiZGjQQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4020645b2a2so38297365e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 00:55:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694505323; x=1695110123;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x6EtKeJ8Fl2CPlsqoDZCiTeQu7RXnApXQXlT1M5EOII=;
 b=uXbdOV5E6RCcBVLPEl3i79LWk7qwlcRAIB2w+6ycxtljD7YiX+Xii39IG5sbY6PZaE
 Q+43UzQ/aLo/2KO9iq8l/jeu33OhYgVLMecEMWasQDCK/cdtzn8ioZw3lPaRuKphbVE9
 WzbVeyBhp6cobffpzlgHnFwi0sKhix23Na/kkjd0/XMCWIx4ZFSjEtQ7vfHXR/t48VLv
 oPOJvOOpa2TUJ8UDU3ds+5ucJpEavf7mgGNYEMjPtMYOCP8gzWM/rJGpKQUg0gvJC23m
 AgGzRN9I1hqP96e7TXNlHcfPHu2ogVVvdcmnbSyGyWk6XRwdi//EBLA+Ra/3SAMYIOEs
 L+xw==
X-Gm-Message-State: AOJu0YzSo4x2R+cI0lYitFWVC8cT6eh+1KGJlpqZN48RCNV8b2PobtZX
 v0neBbeAVhbNKGElF92XaGFRpyCSz4Z+8TUQfzwPYMjqlANu1fcN4ygB42Kpd368aCM33joqRQE
 mHuqotoeidV633AWh+cIljXEfF5I5
X-Received: by 2002:a05:600c:2946:b0:3f9:c82e:9d87 with SMTP id
 n6-20020a05600c294600b003f9c82e9d87mr10082564wmd.13.1694505322759; 
 Tue, 12 Sep 2023 00:55:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOUg/kbhGPkutoeBzAtzcpRlHWaTol5oRJ7Xvs/ofz8ZLVGBogom5lBgebkgCOX/YfVw74sw==
X-Received: by 2002:a05:600c:2946:b0:3f9:c82e:9d87 with SMTP id
 n6-20020a05600c294600b003f9c82e9d87mr10082545wmd.13.1694505322409; 
 Tue, 12 Sep 2023 00:55:22 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 p11-20020a1c740b000000b003ff013a4fd9sm12173082wmc.7.2023.09.12.00.55.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Sep 2023 00:55:22 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] drm: fix up fbdev Kconfig defaults
In-Reply-To: <aa935abe-2ccf-4889-a717-4efecc13d48b@app.fastmail.com>
References: <20230911205338.2385278-1-arnd@kernel.org>
 <CAMuHMdWizKkuLEcv8sFFOWPib-0e1onCRuQEZm6OhV592VWUKQ@mail.gmail.com>
 <aa935abe-2ccf-4889-a717-4efecc13d48b@app.fastmail.com>
Date: Tue, 12 Sep 2023 09:55:21 +0200
Message-ID: <877cov3jx2.fsf@minerva.mail-host-address-is-not-set>
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
 Sam Ravnborg <sam@ravnborg.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Arthur Grillo <arthurgrillo@riseup.net>, dri-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

"Arnd Bergmann" <arnd@arndb.de> writes:

> On Tue, Sep 12, 2023, at 09:14, Geert Uytterhoeven wrote:
>> On Mon, Sep 11, 2023 at 10:53=E2=80=AFPM Arnd Bergmann <arnd@kernel.org>=
 wrote:

[...]

>
> The only alternative I can think of would be to default-enable
> or force-enable FRAMEBUFFER_CONSOLE for any config that includes
> both VT_CONSOLE and FB_CORE. This would increase defconfig
> builds for systems that currently only want CONFIG_FB for
> either FB_DEVICE or LOGO but don't care about
> FRAMEBUFFER_CONSOLE. I have no idea who uses such a config,
> but I think Javier previously said this was an important
> use case.
>

Yes, IMO that should be a possible combination.

>>> diff --git a/drivers/video/fbdev/core/Kconfig b/drivers/video/fbdev/cor=
e/Kconfig
>>> index 114cb8aa6c8fd..804c2bec9b43c 100644
>>> --- a/drivers/video/fbdev/core/Kconfig
>>> +++ b/drivers/video/fbdev/core/Kconfig
>>> @@ -28,7 +28,7 @@ config FIRMWARE_EDID
>>>  config FB_DEVICE
>>>         bool "Provide legacy /dev/fb* device"
>>>         depends on FB_CORE
>>> -       default y
>>> +       default FB
>>
>> Changing this means possibly causing regressions on systems running
>> an fbdev userspace.
>
> How? FB_DEVICE is a new config that was just split out from
> CONFIG_FB in 6.6-rc1, so nobody should have any defconfig
> that disables CONFIG_FB but relies on the FB_DEVICE default yet.
>

Ah, scratch my previous comment about making this default 'y' then. For
some reasons I thought that FB_DEVICE was added in v6.5 but see now that
commit 701d2054fa31 ("fbdev: Make support for userspace interfaces
configurable") landed in v6.6-rc1:

$ git tag --contains 701d2054fa31 | tail -1
v6.6-rc1

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

