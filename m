Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A21743BED
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 14:33:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A451210E163;
	Fri, 30 Jun 2023 12:33:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 707EC10E163
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 12:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688128418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g8RTn9EqhVA4WoU3sjJyfFdw9WjQDdZ+q4iTAZZl7DE=;
 b=ZdQOLFnsaECiT4lnTx29amUr5gjgubhKt4kd4Oowi2vAN3+9Iakx4J+cEZm+wSHY3DnoVD
 Ax+QV9p8G52WrkGZCwivAxLIjR/zQ6AB/OrxL6iIJxQde0wINoD0c2fO64KmqkA+qSGECE
 LJhfQZZN1v+tUL5xJzWdX28K+kYWyDY=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-101-VmqDHV9KMpCGJpE7uzl5tQ-1; Fri, 30 Jun 2023 08:33:33 -0400
X-MC-Unique: VmqDHV9KMpCGJpE7uzl5tQ-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2b620465d0eso17522371fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 05:33:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688128412; x=1690720412;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g8RTn9EqhVA4WoU3sjJyfFdw9WjQDdZ+q4iTAZZl7DE=;
 b=H81lq0bD54pxH4BhkpO8zEY6ELsIr+UQsSfA/pvhJ7tUwn2P/p4sC1A9DRdGXecmKm
 zqc3/FMEyBuI5Jc/139Y4U/dxE5sj6K1w17APnsGLU2KrEbHcYcEN1qQYrLqhOJu4PuJ
 kLX8zcUZcly6jhJ720FMPru4IpTPwC9HTapQFHCjanmxqaF6OqH6eqWZVfLBoRGatj9Z
 tAJoFAiN0ES4vAjMFIrMkRBsvWGEbBFj5Yo4azzrw+NHp9ot0xiB96elH3fhpqzyQ8Fs
 /69nsolWhk9XdJho4PlzDHV5uyfSoMJJIc3bcediqieHoFgKMAJax4Jl+MTO089Evpcr
 0oVA==
X-Gm-Message-State: ABy/qLaOe01xjziVyGgTqG1ID8OEqtJNhB32bo/GO96S9u6qVq0oZasp
 /7oC1hfTGD0RQjw+QYLQN5amFcsW0c/7Mx+qAMhtEs1kwN2JSEz76R7MR/ASaARNRR8u5qTz9y2
 KR4KK4zvYXeXD84vCnFGTSwSYGtRN
X-Received: by 2002:a19:e01d:0:b0:4fb:7592:cc7a with SMTP id
 x29-20020a19e01d000000b004fb7592cc7amr1864465lfg.20.1688128412055; 
 Fri, 30 Jun 2023 05:33:32 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEPcKIsx1PFyrX6glb99eed7uOYj0G9AORD207eHckxnKyQzVkzS+r7LJmJCOj1yiVBtwnBmg==
X-Received: by 2002:a19:e01d:0:b0:4fb:7592:cc7a with SMTP id
 x29-20020a19e01d000000b004fb7592cc7amr1864445lfg.20.1688128411633; 
 Fri, 30 Jun 2023 05:33:31 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 21-20020a05600c22d500b003f9cb3c8958sm22023924wmg.3.2023.06.30.05.33.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jun 2023 05:33:31 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Allow disabling all native fbdev drivers and only
 keeping DRM emulation
In-Reply-To: <d231d0fe-c5f5-073a-3b8c-9441e1674c24@suse.de>
References: <20230629225113.297512-1-javierm@redhat.com>
 <d231d0fe-c5f5-073a-3b8c-9441e1674c24@suse.de>
Date: Fri, 30 Jun 2023 14:33:30 +0200
Message-ID: <87bkgxdt9h.fsf@minerva.mail-host-address-is-not-set>
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
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helge Deller <deller@gmx.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, Maxime Ripard <mripard@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, dri-devel@lists.freedesktop.org,
 "H. Peter Anvin" <hpa@zytor.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

Thanks a lot for your review.

> Hi Javier
>
> Am 30.06.23 um 00:51 schrieb Javier Martinez Canillas:
>> This patch series splits the fbdev core support in two different Kconfig
>> symbols: FB and FB_CORE. The motivation for this is to allow CONFIG_FB to
>> be disabled, while still having the the core fbdev support needed for the
>> CONFIG_DRM_FBDEV_EMULATION to be enabled. The motivation is automatically
>> disabling all fbdev drivers instead of having to be disabled individually.
>> 
>> The reason for doing this is that now with simpledrm, there's no need for
>> the legacy fbdev (e.g: efifb or vesafb) drivers anymore and many distros
>> now disable them. But it would simplify the config a lot fo have a single
>> Kconfig symbol to disable all fbdev drivers.
>
> I still don't get the point of this change. We've disabled the fbdev 
> drivers once. And they are off now and remain off.
>

Yes, but doing that means you have a bunch of these in your kernel config:

#
# Frame buffer hardware drivers
#
# CONFIG_FB_CIRRUS is not set
# CONFIG_FB_PM2 is not set
# CONFIG_FB_ARMCLCD is not set
...

I don't know how the kernel configuration management for the OpenSUSE
kernel package works, but at least in Fedora this translates to needing to
have a lot of explicit disable configurations in the form of:

$ cat redhat/configs/common/generic/CONFIG_FB_CIRRUS 
# CONFIG_FB_CIRRUS is not set

$ ls redhat/configs/common/generic/CONFIG_FB_* | wc -l
61

I want to get rid of all those and the goal of this series is to reduce
that configuration to only:

$ cat redhat/configs/common/generic/CONFIG_FB
# CONFIG_FB is not set

$ cat redhat/configs/common/generic/CONFIG_FB_CORE
CONFIG_FB_CORE=y

> The patchset now introduces FB_CORE, which just adds more options. But 
> you're not reducing the code or compile time or any thing similar.
>

No need for any redhat/configs/common/generic/CONFIG_FB_* because those
don't need to be explicitly disabled anymore since CONFIG_FB isn't set.

And the "Frame buffer hardware drivers" section in the .config goes away.

So it is a configuration simplification even when you can achieve the same
with the existing Kconfig symbols.

> I'd like to suggest a change to these patches: rather then making FB and 
> DRM_FBDEV_EMULATION depend on FB_CORE, make them select FB_CORE. That 
> will allow the DRM subsystem to enable framebuffer emulation 
> independently from framebuffer devices. If either has been set, the 
> fbdev core will be selected.
>

Yes, I guess that making it a non user-visible option makes sense. I'm
just wary of using select because I've bitten in the past by circular
dependencies when other symbol depends on it.

But I'm OK with that change and will do in v2.

> Best regards
> Thomas
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

