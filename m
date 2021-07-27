Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFC63D6FF2
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 09:06:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A20473292;
	Tue, 27 Jul 2021 07:06:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9B0C73292
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 07:06:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E333B611C6
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 07:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627369566;
 bh=1TC/Az3GWgRQRVEMAdi/3rlrGgY9/Gln3X8vwmTmv+g=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Kf0CgEFAFD5eHcru5zdUr5AqAPaHBljFtcSLYGJ+TW/8cgnjiYVrmTBvK2lBuadHq
 jebthDf33Ei8gX032KHzAyeR99QPyPx+V1WeOapJxOunEXnBCNeznnqJ1rw7g/15//
 n+twPmVSIuADYs/SIsOnI9A6fNb60WpnNvj0dsQJGGekE3nIkphJ9lXdKIKzcp5a5i
 8ybDLr+QmW4TmByVBbncxXLTGNVesy2+5v4S02EUI7U4sCQOphhM+7U2wveFjm6onq
 v+rokWiJuuT/Z8l8RtHxapq3dte33jsqGcjIfuZEK+7K4F19FRMSe1DUzVTrYzjb2z
 le3c5qWU1VX6Q==
Received: by mail-ot1-f54.google.com with SMTP id
 f20-20020a9d6c140000b02904bb9756274cso12561596otq.6
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 00:06:06 -0700 (PDT)
X-Gm-Message-State: AOAM530OkvtG99Nzm904CaQ6QsxuXV6r7E32LdBclLizHWVqqj8/lj2W
 qoB9tfo7l2PaFzR3JaSjKjO1xjTTDAUw+BP3K30=
X-Google-Smtp-Source: ABdhPJyeFgKOXhjrhvnFpEn730k8SbaVAr5F9/F0Cu8OnIZQ5j5sVRC5iYB6Y0/6aKl/ASZH0k9HGhADS98rRGUq0Bk=
X-Received: by 2002:a05:6830:34a6:: with SMTP id
 c38mr14149146otu.108.1627369566333; 
 Tue, 27 Jul 2021 00:06:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210727050447.7339-1-rdunlap@infradead.org>
In-Reply-To: <20210727050447.7339-1-rdunlap@infradead.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 27 Jul 2021 09:05:55 +0200
X-Gmail-Original-Message-ID: <CAMj1kXE--e+XYVMR=i0_hWQ8TZD7a+OshxsuHbbAf6UZwH4=XA@mail.gmail.com>
Message-ID: <CAMj1kXE--e+XYVMR=i0_hWQ8TZD7a+OshxsuHbbAf6UZwH4=XA@mail.gmail.com>
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>, Mark Brown <broonie@kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 27 Jul 2021 at 07:05, Randy Dunlap <rdunlap@infradead.org> wrote:
>
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
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: linux-efi@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: linux-next@vger.kernel.org

Acked-by: Ard Biesheuvel <ardb@kernel.org>

> ---
>  drivers/firmware/efi/sysfb_efi.c |    2 ++
>  1 file changed, 2 insertions(+)
>
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
