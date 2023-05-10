Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E2A6FE061
	for <lists+dri-devel@lfdr.de>; Wed, 10 May 2023 16:34:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BC8A10E4B8;
	Wed, 10 May 2023 14:34:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E288610E4B8
 for <dri-devel@lists.freedesktop.org>; Wed, 10 May 2023 14:34:49 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-559e53d1195so105820617b3.2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 May 2023 07:34:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683729288; x=1686321288;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ozQA/cDvPs2H88bJoE4ZEXy4NN+hc65oP+0zn7oNwKg=;
 b=WHfjjJjIZRPi9PW0kHLk3cJYLIPCSVxzf8vSG4RNtm0/TKc9qDOvP7FybLZ1QgBaFc
 NyWCNOlD0Y1dvQxJd0OO5I/cyVvh8XYDa6r9/1JthwZwQVKyTBbVcnMV0BAUvfGY4kdk
 2yzN7Em2fNXRVmHtYQQyf2bW3ha63cG8eemaLD7XIKZRKBesy6kQygleJYbWmd2LS/ro
 cpfonufUw6x3TpnzRjuJVRErh4f2wDtL9oV/WXoseSaXqJkGqSUu0ZYHLe4wNss7GagV
 jkOv5zTHmyZyYGp3UYjF8Qprbugp0wR3GR4ilWsOi26NJPkhRU0/zL/MsL/8hbi+NUrm
 EcKw==
X-Gm-Message-State: AC+VfDwxXvbP3aShbbQYs+uY+OifT/2eTe2m9v/jOEO0WA4gHtmCGg5f
 3TEE/b+unBED0yCXmR6I8DRy5WQC2lYpGQ==
X-Google-Smtp-Source: ACHHUZ4O/MK4JosxtRJ0n+LdQs4btX3QctQqgcQcJU11NBx4sGK7paU6SozO8+YnF4v/7OCbjBkrpA==
X-Received: by 2002:a0d:e207:0:b0:55a:37bf:6a2e with SMTP id
 l7-20020a0de207000000b0055a37bf6a2emr22059658ywe.26.1683729288243; 
 Wed, 10 May 2023 07:34:48 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com.
 [209.85.219.170]) by smtp.gmail.com with ESMTPSA id
 v190-20020a0dd3c7000000b00560df23d30csm429341ywd.117.2023.05.10.07.34.46
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 07:34:47 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-b9d881ad689so9313561276.2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 May 2023 07:34:46 -0700 (PDT)
X-Received: by 2002:a05:6902:18c6:b0:b99:5707:4e6f with SMTP id
 ck6-20020a05690218c600b00b9957074e6fmr23871358ybb.32.1683729286388; Wed, 10
 May 2023 07:34:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230510110557.14343-1-tzimmermann@suse.de>
 <20230510110557.14343-6-tzimmermann@suse.de>
 <CAMuHMdVV-MQV3C_o6JxPj23h3zo0kMmsn9ZEWJxsrzr6YpKmyg@mail.gmail.com>
 <487ff03b-d753-972f-7a06-a1d5efda917d@suse.de>
In-Reply-To: <487ff03b-d753-972f-7a06-a1d5efda917d@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 10 May 2023 16:34:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWQLF6QZi4j5Yg3oiy8dMbuApk+r=5c2tSLvYxvAaudMA@mail.gmail.com>
Message-ID: <CAMuHMdWQLF6QZi4j5Yg3oiy8dMbuApk+r=5c2tSLvYxvAaudMA@mail.gmail.com>
Subject: Re: [PATCH v6 5/6] fbdev: Move framebuffer I/O helpers into <asm/fb.h>
To: Thomas Zimmermann <tzimmermann@suse.de>
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
 suijingfeng@loongson.cn, arnd@arndb.de, linux-m68k@lists.linux-m68k.org,
 loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
 davem@davemloft.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Wed, May 10, 2023 at 4:20=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
> Am 10.05.23 um 14:34 schrieb Geert Uytterhoeven:
> > On Wed, May 10, 2023 at 1:06=E2=80=AFPM Thomas Zimmermann <tzimmermann@=
suse.de> wrote:
> >> Implement framebuffer I/O helpers, such as fb_read*() and fb_write*(),
> >> in the architecture's <asm/fb.h> header file or the generic one.
> >>
> >> The common case has been the use of regular I/O functions, such as
> >> __raw_readb() or memset_io(). A few architectures used plain system-
> >> memory reads and writes. Sparc used helpers for its SBus.
> >>
> >> The architectures that used special cases provide the same code in
> >> their __raw_*() I/O helpers. So the patch replaces this code with the
> >> __raw_*() functions and moves it to <asm-generic/fb.h> for all
> >> architectures.
> >>
> >> v6:
> >>          * fix fb_readq()/fb_writeq() on 64-bit mips (kernel test robo=
t)
> >> v5:
> >>          * include <linux/io.h> in <asm-generic/fb>; fix s390 build
> >> v4:
> >>          * ia64, loongarch, sparc64: add fb_mem*() to arch headers
> >>            to keep current semantics (Arnd)
> >> v3:
> >>          * implement all architectures with generic helpers
> >>          * support reordering and native byte order (Geert, Arnd)
> >>
> >> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >> Tested-by: Sui Jingfeng <suijingfeng@loongson.cn>
> >> Reviewed-by: Arnd Bergmann <arnd@arndb.de>

> >> --- a/arch/mips/include/asm/fb.h
> >> +++ b/arch/mips/include/asm/fb.h
> >> @@ -12,6 +12,28 @@ static inline void fb_pgprotect(struct file *file, =
struct vm_area_struct *vma,
> >>   }
> >>   #define fb_pgprotect fb_pgprotect
> >>
> >> +/*
> >> + * MIPS doesn't define __raw_ I/O macros, so the helpers
> >> + * in <asm-generic/fb.h> don't generate fb_readq() and
> >> + * fb_write(). We have to provide them here.
> >
> > MIPS does not include <asm-generic/io.h>,  nor define its own
>
> I know, that's why the TODO says to convert it to generic I/O.
>
> > __raw_readq() and __raw_writeq()...
>
> It doesn't define those macros, but it generates function calls of the
> same names. Follow the macros at
>
>
> https://elixir.bootlin.com/linux/latest/source/arch/mips/include/asm/io.h=
#L357
>
> It expands to a variety of helpers, including __raw_*().

Thanks, I forgot MIPS is using these grep-unfriendly factories...

> >> + *
> >> + * TODO: Convert MIPS to generic I/O. The helpers below can
> >> + *       then be removed.
> >> + */
> >> +#ifdef CONFIG_64BIT
> >> +static inline u64 fb_readq(const volatile void __iomem *addr)
> >> +{
> >> +       return __raw_readq(addr);
> >
> > ... so how can this call work?
>
> On 64-bit builds, there's __raw_readq() and __raw_writeq().
>
> At first, I tried to do the right thing and convert MIPS to work with
> <asm-generic/io.h>. But that created a ton of follow-up errors in other
> headers. So for now, it's better to handle this problem in asm/fb.h.

So isn't just adding

    #define __raw_readq __raw_readq
    #define __raw_writeq __raw_writeq

to arch/mips/include/asm/io.h sufficient to make <asm-generic/fb.h>
do the right thing?

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
