Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B973E3D4570
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jul 2021 08:55:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E2696F8B1;
	Sat, 24 Jul 2021 06:55:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 216296F8B1;
 Sat, 24 Jul 2021 06:55:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B4CAA60E9C;
 Sat, 24 Jul 2021 06:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627109748;
 bh=B80hoZZe2OO2rx4q7PEXznNCfVJkARWnoc3HG9wphzQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=TPKBM4kCRjp6Dl8ERLme76Rqlot6iiRhwW3z4TPWOVwJ2+9Fs7xi3Zn1wR65TDQzs
 +ShXgwh64Rr4gLPIR4VuUZkIz0OY9RiIfMRMXzp7UfbQ4TYAxMB/6h+FkH5YixH7Mt
 lrpas+gEwhRV+I2mWemvQGFGlFEwDMXGatnDxi6EAfXWE4PiZJCSn0skFbJHbX35Xl
 /gaXVW99pnGOl9cTVxwf+iOWbIy6bs8vzvD3ASuwS+WbTB4SaclRIJXThFKv8svHYe
 6WcRzdgCguxxYdkGK98bznKXi0tNj6T25JyB7YFOlFtiVg89XECJFR7br5nvLe+etP
 MBb+1mV8DeOnQ==
Received: by mail-wm1-f51.google.com with SMTP id
 a80-20020a1c98530000b0290245467f26a4so2943898wme.0; 
 Fri, 23 Jul 2021 23:55:48 -0700 (PDT)
X-Gm-Message-State: AOAM530uWyeAA9JzLAyAAi7C0idhgv+inbOPkn8+5cIq9UZ8nxDrdoFq
 3gNDRBcB41QQAAcTUMeLOPNKapgAvZnh5ugvVdg=
X-Google-Smtp-Source: ABdhPJyR72GsEjxAav2mThfrkDdq7Q7rsOokZHAxvRhxua1hNtotzPz//554fpJOxQYtC+mHVkp1i/zd0EA29NRxVbU=
X-Received: by 2002:a7b:c385:: with SMTP id s5mr7491845wmj.43.1627109747390;
 Fri, 23 Jul 2021 23:55:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210723224617.3088886-1-kherbst@redhat.com>
In-Reply-To: <20210723224617.3088886-1-kherbst@redhat.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Sat, 24 Jul 2021 08:55:31 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3u_jsxQW4dPXtsdKkw1mjKXL-h=qN1SGHytvUMPf3fPw@mail.gmail.com>
Message-ID: <CAK8P3a3u_jsxQW4dPXtsdKkw1mjKXL-h=qN1SGHytvUMPf3fPw@mail.gmail.com>
Subject: Re: [PATCH] nouveau: make backlight support non optional
To: Karol Herbst <kherbst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: ML nouveau <nouveau@lists.freedesktop.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jul 24, 2021 at 12:47 AM Karol Herbst <kherbst@redhat.com> wrote:
>
> In the past this only led to compilation issues. Also the small amount of
> extra .text shouldn't really matter compared to the entire nouveau driver
> anyway.
>

>         select DRM_TTM_HELPER
> -       select BACKLIGHT_CLASS_DEVICE if DRM_NOUVEAU_BACKLIGHT
> -       select ACPI_VIDEO if ACPI && X86 && BACKLIGHT_CLASS_DEVICE && INPUT
> +       select BACKLIGHT_CLASS_DEVICE
> +       select ACPI_VIDEO if ACPI && X86 && INPUT
>         select X86_PLATFORM_DEVICES if ACPI && X86
>         select ACPI_WMI if ACPI && X86

I think the logic needs to be the reverse: instead of 'select
BACKLIGHT_CLASS_DEVICE',
this should be 'depends on BACKLIGHT_CLASS_DEVICE', and the same for ACPI_VIDEO.

We may want to add 'default DRM || FB' to BACKLIGHT_CLASS_DEVICE in the
process so we don't lose it for users doing 'make oldconfig' or 'make defconfig'

The rest of the patch looks good to me.

       Arnd
