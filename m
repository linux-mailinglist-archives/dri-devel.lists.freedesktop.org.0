Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8066BAA8F
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 09:17:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F12F610E942;
	Wed, 15 Mar 2023 08:17:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 190F910E942
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 08:17:05 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id 97so2413475qvb.6
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 01:17:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678868223;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0V0QfuKISCsuOFNxrXLROjtKcqlhxKao9KY/kU4MtCE=;
 b=Dn+5sDh5FJUeH+HHGlgUDft1B7ENvFe1OsaLzWbkgoZZzrRw6dNzROg/sBPVZOMoUE
 oc5z6z0yXgJIBSnn3Xcwph63d77tCfSP7KGXw1oYMpH9pHXIkOwuWq/A5YAAwDPaLRP+
 Zv7YWyj/KhuV7oh9SNKxYdI0VA5Wo/uHhpDz92hR21WPc+7J5QklQ17j9pQZtsW57fxf
 gWisOp8EjWxn3sxpKqbH2kepZIBIHeAVERZY7+6/QVe1/UYPPXHp5AU4WCvJYWtq0NUt
 XYfzv6JE4tsvNe7DjxUNIcxPUkYHeaxSLW9oTqXdzNa3GQEt/YDLomTwoLQ9q1mRzs5t
 DGaQ==
X-Gm-Message-State: AO0yUKU6JCd9KgF5tMy5Fi1FGfe8yCZATbhh8q8sJERI06rthNbI/qDd
 rG/sssugRRSPJDsIv2iTxhfP6zyLhDc39aoi
X-Google-Smtp-Source: AK7set84KqNNRJ3kBp7z4Vg6Q4xTS/UtVk25OcgzyHfQn5vcZ2DwbP6SgJgR+xOUTzlaLIonuO7+bA==
X-Received: by 2002:a05:6214:acc:b0:56e:8a00:f3a with SMTP id
 g12-20020a0562140acc00b0056e8a000f3amr26906524qvi.32.1678868223512; 
 Wed, 15 Mar 2023 01:17:03 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com.
 [209.85.128.181]) by smtp.gmail.com with ESMTPSA id
 de21-20020a05620a371500b0074235745fdasm3372703qkb.58.2023.03.15.01.17.02
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Mar 2023 01:17:02 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-5445009c26bso127763247b3.8
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 01:17:02 -0700 (PDT)
X-Received: by 2002:a81:ae5e:0:b0:541:a17f:c779 with SMTP id
 g30-20020a81ae5e000000b00541a17fc779mr6894792ywk.4.1678868221967; Wed, 15 Mar
 2023 01:17:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230314121216.413434-1-schnelle@linux.ibm.com>
 <20230314121216.413434-36-schnelle@linux.ibm.com>
In-Reply-To: <20230314121216.413434-36-schnelle@linux.ibm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Mar 2023 09:16:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW4f8GJ-kFDPg6Ao=g3ZAXq79u9nUZ_dW1LonHu+vxk8Q@mail.gmail.com>
Message-ID: <CAMuHMdW4f8GJ-kFDPg6Ao=g3ZAXq79u9nUZ_dW1LonHu+vxk8Q@mail.gmail.com>
Subject: Re: [PATCH v3 35/38] video: handle HAS_IOPORT dependencies
To: Niklas Schnelle <schnelle@linux.ibm.com>
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
Cc: linux-arch@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>,
 linux-fbdev@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Alan Stern <stern@rowland.harvard.edu>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Bjorn Helgaas <bhelgaas@google.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Niklas,

On Tue, Mar 14, 2023 at 1:13=E2=80=AFPM Niklas Schnelle <schnelle@linux.ibm=
.com> wrote:
> In a future patch HAS_IOPORT=3Dn will result in inb()/outb() and friends
> not being declared. We thus need to add HAS_IOPORT as dependency for
> those drivers using them and guard inline code in headers.
>
> Co-developed-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>

Thanks for your patch!

> --- a/drivers/video/fbdev/Kconfig
> +++ b/drivers/video/fbdev/Kconfig

> @@ -1284,7 +1285,7 @@ config FB_ATY128_BACKLIGHT
>
>  config FB_ATY
>         tristate "ATI Mach64 display support" if PCI || ATARI
> -       depends on FB && !SPARC32
> +       depends on FB && HAS_IOPORT && !SPARC32

On Atari, this works without ATARI_ROM_ISA, hence it must not depend
on HAS_IOPORT.
The only call to inb() is inside a section protected by #ifdef
CONFIG_PCI. So:

    depends on FB && !SPARC32
    depends on ATARI || HAS_IOPORT

>         select FB_CFB_FILLRECT
>         select FB_CFB_COPYAREA
>         select FB_CFB_IMAGEBLIT

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
