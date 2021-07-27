Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 944233D7284
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 12:04:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8800897F0;
	Tue, 27 Jul 2021 10:04:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com
 [209.85.217.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABB72897F0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 10:03:59 +0000 (UTC)
Received: by mail-vs1-f45.google.com with SMTP id y18so6841153vsc.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 03:03:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U1Rltp5aC928hhgEXj95boe/DWxuoVxGBX01uUMCHls=;
 b=c8HT5eeU78HF0DT/0zArsskWGvrKFG30wh6widPSEJv09PUAt3AJozNluNU3GoSuN4
 7YwQev0/rCd7NP56i2i8PCsgtTr8KxTDCDFalHRw7SLvpCZfUwSa2nOJsNGigH6XF6ks
 4qQ3Futz5orw+xZhkN7uf18y3SwotrvcZFRXcWf/AJXDNg/KR1ZjumQWpIOdVhXDZ+oq
 5E6x2iY7aau5t7JuqJA9bfPRamwpR6bIWC3H7yCDuTXIYKTokOi41/Js2rFVP8Ked6gd
 mTGc2jqima9UJYeZDcgrToQnZIn/6zLLbuRmaSw3eFDBNuoOyAEqTUJ7puVm2xr13rhN
 8bfQ==
X-Gm-Message-State: AOAM531+uEvPOeL+JadERhwkLsB2PV1m0oUzpuKMhoBlavYbbbodVPnf
 PFRpq55NfZBUhc0aoG6TCeCuGfcR1bJkWUPqWr4=
X-Google-Smtp-Source: ABdhPJxrB7YF93pARYWhq+2Ajrw4bqt9huLpzoSpNbmxJxMepUSMaydScT3Hmera1LH4J+8mRlnO3JUVKm36A07jUaY=
X-Received: by 2002:a05:6102:2828:: with SMTP id
 ba8mr15660407vsb.18.1627380238791; 
 Tue, 27 Jul 2021 03:03:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210727093015.1225107-1-javierm@redhat.com>
In-Reply-To: <20210727093015.1225107-1-javierm@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Jul 2021 12:03:47 +0200
Message-ID: <CAMuHMdXXoHLO=jsjb+xtW7GDQsvu8Zuz=JmbaEXT49w5o4SJ9A@mail.gmail.com>
Subject: Re: [PATCH v2] drivers/firmware: fix SYSFB depends to prevent build
 failures
To: Javier Martinez Canillas <javierm@redhat.com>
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>,
 kernel test robot <lkp@intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Sudeep Holla <sudeep.holla@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Dinh Nguyen <dinguyen@kernel.org>,
 Mark Brown <broonie@kernel.org>, Peter Robinson <pbrobinson@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Colin Ian King <colin.king@canonical.com>, Borislav Petkov <bp@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

On Tue, Jul 27, 2021 at 11:33 AM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> The Generic System Framebuffers support is built when the COMPILE_TEST
> option is enabled. But this wrongly assumes that all the architectures
> declare a struct screen_info.
>
> This is true for most architectures, but at least the following do not:
> arc, m68k, microblaze, openrisc, parisc and s390.
>
> By attempting to make this compile testeable on all architectures, it
> leads to linking errors as reported by the kernel test robot for parisc:
>
>   All errors (new ones prefixed by >>):
>
>      hppa-linux-ld: drivers/firmware/sysfb.o: in function `sysfb_init':
>      (.init.text+0x24): undefined reference to `screen_info'
>   >> hppa-linux-ld: (.init.text+0x28): undefined reference to `screen_info'
>
> To prevent these errors only allow sysfb to be built on systems that are
> going to need it, which are x86 BIOS and EFI.
>
> The EFI Kconfig symbol is used instead of (ARM || ARM64 || RISC) because
> some of these architectures only declare a struct screen_info if EFI is
> enabled. And also, because the SYSFB code is only used for EFI on these
> architectures. For !EFI the "simple-framebuffer" device is registered by
> OF when parsing the Device Tree Blob (if a DT node for this was defined).
>
> Fixes: d391c5827107 ("drivers/firmware: move x86 Generic System Framebuffers support")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

Thanks for your patch!

> --- a/drivers/firmware/Kconfig
> +++ b/drivers/firmware/Kconfig
> @@ -254,7 +254,7 @@ config QCOM_SCM_DOWNLOAD_MODE_DEFAULT
>  config SYSFB
>         bool
>         default y
> -       depends on X86 || ARM || ARM64 || RISCV || COMPILE_TEST
> +       depends on X86 || EFI

Thanks, much better.
Still, now this worm is crawling out of the X86 can, I'm wondering
why this option is so important that it has to default to y?
It is not just a dependency for SYSFB_SIMPLEFB, but also causes the
inclusion of drivers/firmware/sysfb.c.

>
>  config SYSFB_SIMPLEFB
>         bool "Mark VGA/VBE/EFI FB as generic system framebuffer"

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
