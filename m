Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE20759CCB
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 19:49:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 902D810E108;
	Wed, 19 Jul 2023 17:49:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7186010E108
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 17:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689788964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XYue51ytI6NDHPfrk6nzrr+J7lvDM0nrv78I+/fXUNw=;
 b=R2kObZgY4hhHWw9fQleV5Wj7fC05dZF3J2LskRwlYgw2RuAGp7EydMSxr5QLmQjS3Cji7j
 hS/YW9Y+NKIpLS0jhTg9Tttf+leDkH6Gy1sUlk0e5Cesh2U6Td+ryyJeyc/jbYkjBx4I1c
 5NkLsPm86FbG99O0kDzd9Dsa2FNtMvs=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-213-P6mhU_IFORaykr5QNTDYZA-1; Wed, 19 Jul 2023 13:49:20 -0400
X-MC-Unique: P6mhU_IFORaykr5QNTDYZA-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2b707829eb9so66949161fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 10:49:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689788959; x=1690393759;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XYue51ytI6NDHPfrk6nzrr+J7lvDM0nrv78I+/fXUNw=;
 b=c6qrQz4RnOzuTTgHuHEKK177NdggvGHY9XIPYInBYVNyYU4BZJtoVPUK/KizgZyLKB
 RqMH5BDJUU3JT0nWIaN8cTG3XASA4oLC8siQYoy8qUHjuzuu+m87b/4+KHcKifq632pL
 E7lY7VAL6Nmt2U/f/45qjM5mmVBbU8ypFgC+5pfgAspu6FJF+7IHdVYugU1xgO6IqxdW
 ZBv3J3PrcsSfjYq2JoLSWTRMZgh8TDHWcI89xXLdHyuhHSg8iVR1mm3gRvOIWkCpS+1s
 yITXgBXtlZi2xw5eU1qE5HDKupuFak1iqta3DJtlTnjzdb/x2uaD4Yb8lXwSsZvmSI9s
 RZDg==
X-Gm-Message-State: ABy/qLaOdbbv03iTjQqVXLSq/3nADpxerK7wxgKCW063MO6i6Fn9UfNx
 13rSd1PcN05H5PA7rbGNqxaTOxm6mOZJaE+mRDdMm91Tup3kaHpSbAwo5OTCNEjephBXqzgASbQ
 9bXeuXGs7+qXPWYfXMgzQF0dsJTC+
X-Received: by 2002:a2e:b60a:0:b0:2b6:c8e8:915f with SMTP id
 r10-20020a2eb60a000000b002b6c8e8915fmr525318ljn.22.1689788959378; 
 Wed, 19 Jul 2023 10:49:19 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHGcoA3ayLgHeAmqmqFqjnQ7AOt3SyqJk7AsijJMopV3od5+bU+++6SyugmvMMgSvDsgJiIRg==
X-Received: by 2002:a2e:b60a:0:b0:2b6:c8e8:915f with SMTP id
 r10-20020a2eb60a000000b002b6c8e8915fmr525282ljn.22.1689788958986; 
 Wed, 19 Jul 2023 10:49:18 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 t13-20020a7bc3cd000000b003fc05b89e5bsm2165158wmj.34.2023.07.19.10.49.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jul 2023 10:49:18 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/4] Allow disabling all native fbdev drivers and
 only keeping DRM emulation
In-Reply-To: <46d933f5-38e4-b46a-f94b-0e9a6e3b2e31@gmx.de>
References: <20230719081544.741051-1-javierm@redhat.com>
 <46d933f5-38e4-b46a-f94b-0e9a6e3b2e31@gmx.de>
Date: Wed, 19 Jul 2023 19:49:17 +0200
Message-ID: <877cqvkd0i.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, x86@kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 "H.
 Peter Anvin" <hpa@zytor.com>, Daniel Thompson <daniel.thompson@linaro.org>,
 Nipun Gupta <nipun.gupta@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 Lee Jones <lee@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Pieter Jansen van Vuuren <pieter.jansen-van-vuuren@amd.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Arnd Bergmann <arnd@arndb.de>, Maxime Ripard <mripard@kernel.org>,
 Borislav Petkov <bp@alien8.de>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jingoo Han <jingoohan1@gmail.com>, Oded Gabbay <ogabbay@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Helge Deller <deller@gmx.de> writes:

Hello Helge,

> Hi Javier,
>
> On 7/19/23 10:15, Javier Martinez Canillas wrote:
>> This patch series splits the fbdev core support in two different Kconfig
>> symbols: FB and FB_CORE. The motivation for this is to allow CONFIG_FB to
>> be disabled, while still having the the core fbdev support needed for the
>
> One "the" too much.
> (correcting just because this is a cover letter)
>
>> CONFIG_DRM_FBDEV_EMULATION to be enabled. The motivation is automatically
>> disabling all fbdev drivers instead of having to be disabled individually.
>>
>> The reason for doing this is that now with simpledrm, there's no need for
>> the legacy fbdev (e.g: efifb or vesafb) drivers anymore and many distros
>> now disable them. > But it would simplify the config a lot fo have a single
>> Kconfig symbol to disable all fbdev drivers.
>
> I suggest to rephrase this, e.g.:
> The reason for doing this is that with simpledrm, mainstream Linux distributions
> like Fedora, SUSE or Ubuntu can then more easily enable the DRM drivers only
> by switching off legacy fbdev drivers with one Kconfig option (e.g. for efifb or
> vesafb).
>
> (note: there are quite many other distributions, e.g. debian and the derivates,
> which still need the fbdev drivers for the various other architectures)
>

Right, I meant that there is no need anymore for the remaining fbdev
drivers that many distributions used to enable only to have fallback
fbcon/VT (like vesafb, efifb, simplefb, etc). But I'm OK with your
rephrasing and agree that's more accurate to cover all the distros.

>> I've built tested with possible combinations of CONFIG_FB, CONFIG_FB_CORE,
>> CONFIG_DRM_FBDEV_EMULATION and CONFIG_FB_DEVICE symbols set to 'y' or 'n'.
>>
>> Patch #1 moves the auxdisplay drivers to "Graphics support" Kconfig menu,
>> patch #2 moves the core fbdev Kconfig symbols to a separate Kconfig file,
>> patch #3 does the FB symbol split and introduces the FB_CORE symbol and
>> finally patch #4 makes the DRM symbol to select FB_CORE if the DRM fbdev
>> emualtion support was enabled.
>>
>> Since this series touches three subsystems (auxdisplay, fbdev and DRM),
>> I would like to merge it through DRM with the acks of these maintainers.
>
> Sure. Ack from me.
>
> The patch series look good otherwise. You may add:
> Acked-by: Helge Deller <deller@gmx.de>
>

Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

