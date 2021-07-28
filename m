Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 472823D89EB
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 10:39:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 130E16E02F;
	Wed, 28 Jul 2021 08:39:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com
 [209.85.217.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4535A6E02F
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 08:39:13 +0000 (UTC)
Received: by mail-vs1-f48.google.com with SMTP id o12so984264vst.3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 01:39:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yVmhrRbJkvgpIhHEAfbGhWQBI7I0jYe3w6v9jo77iwE=;
 b=bNmyOFxRdKg8xB8HEvqOT8ReWwzKLgw/ai+CQB2RA2OvEdCCO7jfNH94aj7KLCMUBm
 NnOAtCEys9+W5HKrKE+uDMKXr80xZAQi1hZLw+GTDpcGwYkGt5xMtdo/E4+GOlqq78n6
 AZ/K/eXqg59k83UM1QORLCRTxdBhz4PYKzhs9VbB9wc5B76VW5mgIZSdkRaCjo7xxcsr
 oO7EoFZDIcu4IhygqLp63C8AW00Wi6UB9H2cT4CiKl8N3jgOWV/pr78KuKDaPuOZyRcH
 7k+Hb51bEamnAiI/AkaZJWClS3y6qOLSf5C3xGxjjPrpxWXZ98qpiuvRcEpO7hwl1vfm
 QXrA==
X-Gm-Message-State: AOAM5328yE7eRFQEqLF1AgwRbqoL3RRO4muTsRQMZCHUtk8BzFe1YrCX
 FQxCRmU8Aipr9UAJa8Pd6luaY5c9/g04cRX+2GA=
X-Google-Smtp-Source: ABdhPJxBvXkiNS/OAZjMRCgmqbqSWehnUkEclqwsoSHvLr0T9EfEWNQPPBEhYZvfHmNNmJI9lZ0l29OGsFVNYdIokAI=
X-Received: by 2002:a05:6102:2828:: with SMTP id
 ba8mr20835288vsb.18.1627461552305; 
 Wed, 28 Jul 2021 01:39:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210727050447.7339-1-rdunlap@infradead.org>
In-Reply-To: <20210727050447.7339-1-rdunlap@infradead.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 Jul 2021 10:39:00 +0200
Message-ID: <CAMuHMdXrDLvPRNMy_pEtu1u=7ML8GT3mpKLba8vRnHU3iF8U+w@mail.gmail.com>
Subject: Re: [PATCH] efi: sysfb_efi: fix build when EFI is not set
To: Randy Dunlap <rdunlap@infradead.org>
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
Cc: linux-efi <linux-efi@vger.kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Linux-Next <linux-next@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Ard Biesheuvel <ardb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Randy,

On Tue, Jul 27, 2021 at 7:06 AM Randy Dunlap <rdunlap@infradead.org> wrote:
> When # CONFIG_EFI is not set, there are 2 definitions of
> sysfb_apply_efi_quirks(). The stub from sysfb.h should be used
> and the __init function from sysfb_efi.c should not be used.
>
> ../drivers/firmware/efi/sysfb_efi.c:337:13: error: redefinition of =E2=80=
=98sysfb_apply_efi_quirks=E2=80=99
>  __init void sysfb_apply_efi_quirks(struct platform_device *pd)
>              ^~~~~~~~~~~~~~~~~~~~~~
> In file included from ../drivers/firmware/efi/sysfb_efi.c:26:0:
> ../include/linux/sysfb.h:65:20: note: previous definition of =E2=80=98sys=
fb_apply_efi_quirks=E2=80=99 was here
>  static inline void sysfb_apply_efi_quirks(struct platform_device *pd)
>                     ^~~~~~~~~~~~~~~~~~~~~~
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Thanks for your patch!

> --- linext-20210726.orig/drivers/firmware/efi/sysfb_efi.c
> +++ linext-20210726/drivers/firmware/efi/sysfb_efi.c
> @@ -332,6 +332,7 @@ static const struct fwnode_operations ef
>         .add_links =3D efifb_add_links,
>  };
>
> +#ifdef CONFIG_EFI
>  static struct fwnode_handle efifb_fwnode;
>
>  __init void sysfb_apply_efi_quirks(struct platform_device *pd)
> @@ -354,3 +355,4 @@ __init void sysfb_apply_efi_quirks(struc
>                 pd->dev.fwnode =3D &efifb_fwnode;
>         }
>  }
> +#endif

How come you enter drivers/firmware/efi/ without CONFIG_EFI?

Oh:

drivers/firmware/Makefile:obj-$(CONFIG_EFI)             +=3D efi/
drivers/firmware/Makefile:obj-$(CONFIG_UEFI_CPER)               +=3D efi/

Looks like UEFI_CPER is not related to EFI at all (it's not set in
my arm64 config which has CONFIG_EFI=3Dy). Perhaps it should be moved
to drivers/acpi/ instead?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
