Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0ADB743BC8
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 14:22:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19E1D10E0EF;
	Fri, 30 Jun 2023 12:22:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A71B10E0EF
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 12:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688127728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UjBHzznZRAO5b+oTZ+HRqFaAiumM5bRIl1sq2uXKgNA=;
 b=Dh40Fi9UKlKArt0q5p4e4nZt1aqJ1VHbNh6BOgfX6jTh/LkM+AS9x8T7+gCvpvpQ/90jvK
 lqnn8qrVzdDarn56bFIIlAqFaKs3nt3f4ocOxnz8Ckh92+inkQAZkrwStOAq9z0UQz5Elj
 VlMh/veFfu5yJt+1a6mweWbfWYJ36Bs=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-tBua74t1N32eW6COtxomGg-1; Fri, 30 Jun 2023 08:22:07 -0400
X-MC-Unique: tBua74t1N32eW6COtxomGg-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-4fb76659cacso2065208e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 05:22:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688127726; x=1690719726;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UjBHzznZRAO5b+oTZ+HRqFaAiumM5bRIl1sq2uXKgNA=;
 b=ENp0ZPLkKdMFLshqED0fIny3605BNLPSUITZenOfXjB0A3iRcvK7W2ow5p0pi3Pr9J
 nVcZ04UBU+ZaoUu4fPXY0+5gSEwlFVRhHJTOZ5X7jduqlF2fBNXEM6yXeKOIVO8qP42c
 rE4e+iZJUIhealJaBMmcedQHVibZgcuNac9FUJJxSh25bH+OO4nxmFHlwNuklJlVwzUb
 2lvXN+QtzB+9+1EhOLjdKsEuoXOMqO89wmJR/UPnmbl1HgbxuvXMBDcC5/axS/UqoOQN
 o88Y/Yh3Fh2j2ViYl8FQ8fiqDkDxKgjlcxjL74y7pGpt3HdTgv7tgERnlIckZes80Q2S
 ZJwQ==
X-Gm-Message-State: ABy/qLZsci+nbCt7rnR5zpZjXfHZK7m2YnWxzZ0XJffCfxnxrSxE/rzg
 qaWkFL72Fw+KSoPIqQRXskGy0hdF9Y4ADYrOL0NIA4YBi78hatyrs0L+mBXn8ucL0UbdtivDmIF
 VWdfLGiZbjMJo1dsz0IS0IEnsiBZv
X-Received: by 2002:a05:6512:3b9c:b0:4f9:5c04:af07 with SMTP id
 g28-20020a0565123b9c00b004f95c04af07mr2686248lfv.26.1688127725931; 
 Fri, 30 Jun 2023 05:22:05 -0700 (PDT)
X-Google-Smtp-Source: APBJJlH3XoUQ9KpkX8QPf4PFTTLP+ewfN6G9JWZef+8cWWP/TixtMSBIlwlTByP+dlOaRwnayEZVCA==
X-Received: by 2002:a05:6512:3b9c:b0:4f9:5c04:af07 with SMTP id
 g28-20020a0565123b9c00b004f95c04af07mr2686214lfv.26.1688127725530; 
 Fri, 30 Jun 2023 05:22:05 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 t24-20020a7bc3d8000000b003fba94c9e18sm9022049wmj.4.2023.06.30.05.22.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jun 2023 05:22:05 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] fbdev: Split frame buffer support in FB and FB_CORE
 symbols
In-Reply-To: <ea049651-32c5-42d7-96a0-fc236680a714@app.fastmail.com>
References: <20230629225113.297512-1-javierm@redhat.com>
 <20230629225113.297512-2-javierm@redhat.com>
 <723a3c51-7997-46d0-9262-68f33384a9e7@app.fastmail.com>
 <87h6qpdy04.fsf@minerva.mail-host-address-is-not-set>
 <ea049651-32c5-42d7-96a0-fc236680a714@app.fastmail.com>
Date: Fri, 30 Jun 2023 14:22:04 +0200
Message-ID: <87edltdtsj.fsf@minerva.mail-host-address-is-not-set>
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

> On Fri, Jun 30, 2023, at 12:51, Javier Martinez Canillas wrote:
>> "Arnd Bergmann" <arnd@arndb.de> writes:
>>
>>>> @@ -59,7 +71,7 @@ config FIRMWARE_EDID
>>>> 
>>>>  config FB_DEVICE
>>>>  	bool "Provide legacy /dev/fb* device"
>>>> -	depends on FB
>>>> +	depends on FB_CORE
>>>>  	default y
>>>>  	help
>>>>  	  Say Y here if you want the legacy /dev/fb* device file and
>>>
>>> I don't see this symbol in linux-next yet, what tree are you using
>>> as a base?
>>>
>>
>> It's now in the drm-misc/drm-misc-next branch [1]. It's not in -next yet
>> because it just landed a few days ago [2].
>>
>> [1]: https://cgit.freedesktop.org/drm/drm-misc/log/?h=drm-misc-next
>> [2]: https://cgit.freedesktop.org/drm/drm-misc/commit/?id=701d2054fa3
>>
>> In fact, that's the reason why I rebased my previous attempt [0].
>
> Ok.
>
> I wonder if it would make sense to also make FB_DEVICE depend on FB
> instead of FB_CORE then. I don't think there is any actual dependency

No, because that wouldn't allow to have /dev/fb* devices when using the
DRM fbdev emulation layer. It could be the case that users have an old
fbdev user-space but the platform only has a DRM driver, in that case we
want to disable all native fbdev drivers (CONFIG_FB not set) but still
have FB_CORE, FB_DEVICE and DRM_FBDEV_EMULATION options enabled.

> between the two, but as I understand we want modern distros to use
> neither FB nor FB_DEVICE, so tying them together with a dependency
> may be desirable anyway.
>

As said, modern distros would want to disable both FB and FB_DEVICE, but
we want to allow for these two options to be {en,dis}abled independently.

>
>>>>  config FB_BACKLIGHT
>>>>  	tristate
>>>> -	depends on FB
>>>> +	depends on FB_CORE
>>>>  	select BACKLIGHT_CLASS_DEVICE
>>>
>>> Separating this one from FB_CORE would help avoid circular dependencies,
>>> this one keeps causing issues.
>>>
>>
>> You mean separating from FB or should I keep the existing depends on FB?
>>
>> It seems this is only used by fbdev drivers so probably the latter?
>
> Right, I meant keeping the dependency on FB. Ideally we'd
> turn this all into a set of 'depends on' instead of 'select',
> but that is a completely separate topic.
>

Ok.

>     Arnd
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

