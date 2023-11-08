Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E15367E5FA0
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 22:07:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F253E10E85F;
	Wed,  8 Nov 2023 21:07:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DE0910E85B
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 21:07:06 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-d9a6399cf78so206632276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Nov 2023 13:07:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699477625; x=1700082425;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sL/n+QudcGCkNuxCd3XtrLBrT7hbO9/4Gzcez5s8RY8=;
 b=gef/QNnmC4RP7PFQpYA0YSpeKQJCL7Nc7n7F9O/VOk1UB5VUB8NS4s5CqlhStQJ5JE
 MAqsNJja3gJUJ8WxtXNbqAcF0UKnYqyTt72ON9GJ1tU7xbT5ITLxJEWhwWkt1TSx2gRa
 mpfwoLxzjzSq+E0mQoYistFBCYlZ3jxibc03Crt0wmiZKUVt7CvUJj0VCcshURJ/XFyN
 Ed9RdT/6BuE7MzlO+TtHZ2c75fpDAewaNn+1U9g9SvkX184u6Om6zr1Og201vFTcvFYl
 uXT4Y4GnQ88PSy8NL16a8sFLIpoSNvKK/Vc/c/kJQIimivDHSm/NXxd93gv8mnPjmbIh
 +0wQ==
X-Gm-Message-State: AOJu0Yy7/bdp/eCFsnwbPcXPveLPYdQowEWzdjbSHHn9cx1Lveumxmvp
 w89CjxI2FMOqTVCZkkiuMYqp78bGUHjUBA==
X-Google-Smtp-Source: AGHT+IHpoZbkVjicQZdYMDrZchazQjtdzHBIMXfxPAEu09v42VmkMmYGUNVSIGR/cPDGJZr/WfZEMA==
X-Received: by 2002:a25:2501:0:b0:da0:3ec1:f3f with SMTP id
 l1-20020a252501000000b00da03ec10f3fmr2204017ybl.3.1699477625039; 
 Wed, 08 Nov 2023 13:07:05 -0800 (PST)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com.
 [209.85.128.175]) by smtp.gmail.com with ESMTPSA id
 b141-20020a253493000000b00da02a2ef6afsm6933314yba.30.2023.11.08.13.07.04
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Nov 2023 13:07:04 -0800 (PST)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-5a8628e54d4so2056117b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Nov 2023 13:07:04 -0800 (PST)
X-Received: by 2002:a81:4954:0:b0:5a7:b914:34c1 with SMTP id
 w81-20020a814954000000b005a7b91434c1mr5194330ywa.18.1699477624084; Wed, 08
 Nov 2023 13:07:04 -0800 (PST)
MIME-Version: 1.0
References: <20231107091740.3924258-1-u.kleine-koenig@pengutronix.de>
 <20231107091740.3924258-2-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20231107091740.3924258-2-u.kleine-koenig@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Nov 2023 22:06:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVaaH_ZJT+jAyxZxnVYT3L=b4B-LEMTP4PqQH2TE0nH6g@mail.gmail.com>
Message-ID: <CAMuHMdVaaH_ZJT+jAyxZxnVYT3L=b4B-LEMTP4PqQH2TE0nH6g@mail.gmail.com>
Subject: Re: [PATCH 01/22] fb: amifb: Stop using platform_driver_probe()
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-fbdev@vger.kernel.org, kernel@pengutronix.de,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Atul Raut <rauji.raut@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Uwe,

On Tue, Nov 7, 2023 at 10:20=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> On today's platforms the benefit of platform_driver_probe() isn't that
> relevant any more. It allows to drop some code after booting (or module
> loading) for .probe() and discard the .remove() function completely if
> the driver is built-in. This typically saves a few 100k.

Which is a lot on platforms with only a few MiBs of RAM...

> The downside of platform_driver_probe() is that the driver cannot be
> bound and unbound at runtime which is ancient and also slightly
> complicates testing. There are also thoughts to deprecate
> platform_driver_probe() because it adds some complexity in the driver
> core for little gain. Also many drivers don't use it correctly. This
> driver for example misses to mark the driver struct with __refdata which
> is needed to suppress a (W=3D1) modpost warning:
>
>         WARNING: modpost: drivers/video/fbdev/amifb: section mismatch in =
reference: amifb_driver+0x4 (section: .data) -> amifb_remove (section: .exi=
t.text)
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Thanks for your patch!

> --- a/drivers/video/fbdev/amifb.c
> +++ b/drivers/video/fbdev/amifb.c
> @@ -3530,7 +3530,7 @@ static inline void chipfree(void)
>          * Initialisation
>          */
>
> -static int __init amifb_probe(struct platform_device *pdev)
> +static int amifb_probe(struct platform_device *pdev)

noreply@ellerman.id.au reported the following build failure for
e.g. m68k-defconfig in next-20231108:

WARNING: modpost: vmlinux: section mismatch in reference:
amifb_probe+0x15c (section: .text) -> ami_modedb (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference:
amifb_probe+0x17a (section: .text) -> amifb_hfmin (section:
.init.data)
WARNING: modpost: vmlinux: section mismatch in reference:
amifb_probe+0x188 (section: .text) -> amifb_hfmax (section:
.init.data)
WARNING: modpost: vmlinux: section mismatch in reference:
amifb_probe+0x190 (section: .text) -> amifb_vfmin (section:
.init.data)
WARNING: modpost: vmlinux: section mismatch in reference:
amifb_probe+0x198 (section: .text) -> amifb_vfmax (section:
.init.data)
WARNING: modpost: vmlinux: section mismatch in reference:
amifb_probe+0x1ba (section: .text) -> ami_modedb (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference:
amifb_probe+0x1c4 (section: .text) -> ami_modedb (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference:
amifb_probe+0x1ca (section: .text) -> mode_option (section:
.init.data)
WARNING: modpost: vmlinux: section mismatch in reference:
amifb_probe+0x1ee (section: .text) -> ami_modedb (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference:
amifb_probe+0x398 (section: .text) -> amifb_hfmin (section:
.init.data)
WARNING: modpost: vmlinux: section mismatch in reference:
amifb_probe+0x39e (section: .text) -> amifb_hfmax (section:
.init.data)
WARNING: modpost: vmlinux: section mismatch in reference:
amifb_probe+0x3a4 (section: .text) -> amifb_vfmin (section:
.init.data)
WARNING: modpost: vmlinux: section mismatch in reference:
amifb_probe+0x3aa (section: .text) -> amifb_vfmax (section:
.init.data)
WARNING: modpost: vmlinux: section mismatch in reference:
amifb_probe+0x3f0 (section: .text) -> mode_option (section:
.init.data)
ERROR: modpost: Section mismatches detected.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
