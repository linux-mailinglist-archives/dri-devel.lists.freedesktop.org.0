Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 824E06F180C
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 14:33:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B4E310ED29;
	Fri, 28 Apr 2023 12:33:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com
 [209.85.166.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 737DC10ED25
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 12:33:02 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id
 e9e14a558f8ab-32b1c8ff598so73975295ab.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 05:33:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682685181; x=1685277181;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XDsEdn6WDxg314v0qLuVGHvJOHZvS1YLN0vYRrRrPEc=;
 b=UJiz18BqFtevdkcxj1H5+BrLUUPkrapk3oeM0UQus2YXpJ24BD9wsf5QV4ciRrEsbk
 6W7tBqzVSa7b1a9eiYObHX8ss0K9tT3jeLaseh6iGCkGx42sNjxk1R9ON4CnFL4Dhcjp
 8vYEiYLwboOULkIC74OnQiOVbf31DpNEP9cPgGOzHd/EMz9pvM/0JqRDsWg1gQQT5agg
 L90WGFPow5bsGeSUgL5VoedZ5BXyHowpVIbC/ZtndKXwiVxGnde0/pUVxl5TC8bHwrB4
 KrghbqqH1VtL4uL55UERlIIzXfdd9wCk96Whu4SXrzcppXYHkE0GSCmcYHMvXMYftVHz
 P5xQ==
X-Gm-Message-State: AC+VfDxhzs1Jq+tHz1VBqsz9E/rHMHQiEEJ6/5W87l23dex2PSwPyP0D
 WQhTAW5lOSYY1W7dzU7eRbvboCUkfUy7Vg==
X-Google-Smtp-Source: ACHHUZ6c7n0TktVXxn92U1SXQKPiVLMp/csfkG4bPlCefrn/SfLETdUfSKxpxG1eGWFUHNlYkmwDnA==
X-Received: by 2002:a92:d4d0:0:b0:329:3eb7:7ef1 with SMTP id
 o16-20020a92d4d0000000b003293eb77ef1mr3309108ilm.32.1682685181146; 
 Fri, 28 Apr 2023 05:33:01 -0700 (PDT)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com.
 [209.85.166.171]) by smtp.gmail.com with ESMTPSA id
 a6-20020a029406000000b0040bbb88f308sm6351085jai.17.2023.04.28.05.33.00
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Apr 2023 05:33:00 -0700 (PDT)
Received: by mail-il1-f171.google.com with SMTP id
 e9e14a558f8ab-32ac0743030so74182295ab.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 05:33:00 -0700 (PDT)
X-Received: by 2002:a81:8a01:0:b0:544:69f5:fadc with SMTP id
 a1-20020a818a01000000b0054469f5fadcmr3593096ywg.6.1682684839491; Fri, 28 Apr
 2023 05:27:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230428092711.406-1-tzimmermann@suse.de>
 <20230428092711.406-6-tzimmermann@suse.de>
 <430c73f0-45f4-f81e-6506-bc8cc955d936@arm.com>
In-Reply-To: <430c73f0-45f4-f81e-6506-bc8cc955d936@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 28 Apr 2023 14:27:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUGjtiAR37L4_e0_p8ee2=gxoUj7+e7rqMLTBK+vpV4yw@mail.gmail.com>
Message-ID: <CAMuHMdUGjtiAR37L4_e0_p8ee2=gxoUj7+e7rqMLTBK+vpV4yw@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] fbdev: Define framebuffer I/O from Linux' I/O
 functions
To: Robin Murphy <robin.murphy@arm.com>
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
Cc: linux-fbdev@vger.kernel.org, linux-ia64@vger.kernel.org,
 dri-devel@lists.freedesktop.org, James.Bottomley@hansenpartnership.com,
 sparclinux@vger.kernel.org, kernel@xen0n.name, sam@ravnborg.org,
 linux-arch@vger.kernel.org, deller@gmx.de, chenhuacai@kernel.org,
 javierm@redhat.com, vgupta@kernel.org, linux-snps-arc@lists.infradead.org,
 arnd@arndb.de, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 davem@davemloft.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 28, 2023 at 2:18=E2=80=AFPM Robin Murphy <robin.murphy@arm.com>=
 wrote:
> On 2023-04-28 10:27, Thomas Zimmermann wrote:
> > Implement framebuffer I/O helpers, such as fb_read*() and fb_write*()
> > with Linux' regular I/O functions. Remove all ifdef cases for the
> > various architectures.
> >
> > Most of the supported architectures use __raw_() I/O functions or treat
> > framebuffer memory like regular memory. This is also implemented by the
> > architectures' I/O function, so we can use them instead.
> >
> > Sparc uses SBus to connect to framebuffer devices. It provides respecti=
ve
> > implementations of the framebuffer I/O helpers. The involved sbus_()
> > I/O helpers map to the same code as Sparc's regular I/O functions. As
> > with other platforms, we can use those instead.
> >
> > We leave a TODO item to replace all fb_() functions with their regular
> > I/O counterparts throughout the fbdev drivers.
> >
> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > ---
> >   include/linux/fb.h | 63 +++++++++++----------------------------------=
-
> >   1 file changed, 15 insertions(+), 48 deletions(-)
> >
> > diff --git a/include/linux/fb.h b/include/linux/fb.h
> > index 08cb47da71f8..4aa9e90edd17 100644
> > --- a/include/linux/fb.h
> > +++ b/include/linux/fb.h
> > @@ -15,7 +15,6 @@
> >   #include <linux/list.h>
> >   #include <linux/backlight.h>
> >   #include <linux/slab.h>
> > -#include <asm/io.h>
> >
> >   struct vm_area_struct;
> >   struct fb_info;
> > @@ -511,58 +510,26 @@ struct fb_info {
> >    */
> >   #define STUPID_ACCELF_TEXT_SHIT
> >
> > -// This will go away
> > -#if defined(__sparc__)
> > -
> > -/* We map all of our framebuffers such that big-endian accesses
> > - * are what we want, so the following is sufficient.
> > +/*
> > + * TODO: Update fbdev drivers to call the I/O helpers directly and
> > + *       remove the fb_() tokens.
> >    */
> > -
> > -// This will go away
> > -#define fb_readb sbus_readb
> > -#define fb_readw sbus_readw
> > -#define fb_readl sbus_readl
> > -#define fb_readq sbus_readq
> > -#define fb_writeb sbus_writeb
> > -#define fb_writew sbus_writew
> > -#define fb_writel sbus_writel
> > -#define fb_writeq sbus_writeq
> > -#define fb_memset sbus_memset_io
> > -#define fb_memcpy_fromfb sbus_memcpy_fromio
> > -#define fb_memcpy_tofb sbus_memcpy_toio
> > -
> > -#elif defined(__i386__) || defined(__alpha__) || defined(__x86_64__) |=
|      \
> > -     defined(__hppa__) || defined(__sh__) || defined(__powerpc__) || \
> > -     defined(__arm__) || defined(__aarch64__) || defined(__mips__)
> > -
> > -#define fb_readb __raw_readb
> > -#define fb_readw __raw_readw
> > -#define fb_readl __raw_readl
> > -#define fb_readq __raw_readq
> > -#define fb_writeb __raw_writeb
> > -#define fb_writew __raw_writew
> > -#define fb_writel __raw_writel
> > -#define fb_writeq __raw_writeq
>
> Note that on at least some architectures, the __raw variants are
> native-endian, whereas the regular accessors are explicitly
> little-endian, so there is a slight risk of inadvertently changing
> behaviour on big-endian systems (MIPS most likely, but a few old ARM
> platforms run BE as well).

Also on m68k, when ISA or PCI are enabled.

In addition, the non-raw variants may do some extras to guarantee
ordering, which you do not need on a frame buffer.

So I'd go for the __raw_*() variants everywhere.

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
