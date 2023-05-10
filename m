Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA386FDDDC
	for <lists+dri-devel@lfdr.de>; Wed, 10 May 2023 14:34:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D90A10E48C;
	Wed, 10 May 2023 12:34:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D04410E48C
 for <dri-devel@lists.freedesktop.org>; Wed, 10 May 2023 12:34:49 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-559e53d1195so103599267b3.2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 May 2023 05:34:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683722088; x=1686314088;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kGY/0htSfGIvsVgPn7bx+ykp3agguIOsAu0irnl44Xg=;
 b=PfwY4OWbYmNenkGHh0qbjHhxvQgd8xlrKIxwLIconVvDwMCZsKV04L64fjOfIxdHgJ
 92uv3YWw1XxeJ1XL1jsFtxh0VLqHSsHKeu5HA40BFOTEOTFk8ybWTajDLzXqSUA/AJHb
 vcZAmalIL29+9Nf6ke39Jmtl9D0z4NIz3DnPHJ2VNw03rhIB4XIzy8dS6gsfKl+kPCts
 8JHq0mNDiwGvsOGET3Bgz7N851LQzW17p2UKBPqKg487SJg2Oo4hOVeiUYkHDVqwOYfw
 xhC2zORNeh9ZSHX/v5WSWXLI5tWmqsCpRugc7nLpbqNNzok3F9Qqu/hSYWxY/DIyeH/p
 UXXw==
X-Gm-Message-State: AC+VfDxJVsB6+lP1UZQ5es114WOwqRGSS57msnla/T6bd8Bzfo/J92qN
 wq2NERG6hqEPxZ/O2mOq29bEv2gX3yMP6w==
X-Google-Smtp-Source: ACHHUZ7Dsbchuk2gBgFRfyyqEqmPS0IhQHcUrEvaOBDkM2HLRGw7oM9NnDniL0tDUv1cB78Ac6SrQA==
X-Received: by 2002:a81:524b:0:b0:559:fe9d:eb24 with SMTP id
 g72-20020a81524b000000b00559fe9deb24mr21187546ywb.25.1683722087709; 
 Wed, 10 May 2023 05:34:47 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com.
 [209.85.128.176]) by smtp.gmail.com with ESMTPSA id
 l10-20020a0de20a000000b00545a08184e9sm4033489ywe.121.2023.05.10.05.34.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 05:34:45 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-55a10577911so103717817b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 May 2023 05:34:45 -0700 (PDT)
X-Received: by 2002:a0d:ead7:0:b0:55a:ae08:163f with SMTP id
 t206-20020a0dead7000000b0055aae08163fmr22367018ywe.32.1683722085095; Wed, 10
 May 2023 05:34:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230510110557.14343-1-tzimmermann@suse.de>
 <20230510110557.14343-6-tzimmermann@suse.de>
In-Reply-To: <20230510110557.14343-6-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 10 May 2023 14:34:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVV-MQV3C_o6JxPj23h3zo0kMmsn9ZEWJxsrzr6YpKmyg@mail.gmail.com>
Message-ID: <CAMuHMdVV-MQV3C_o6JxPj23h3zo0kMmsn9ZEWJxsrzr6YpKmyg@mail.gmail.com>
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

On Wed, May 10, 2023 at 1:06=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
> Implement framebuffer I/O helpers, such as fb_read*() and fb_write*(),
> in the architecture's <asm/fb.h> header file or the generic one.
>
> The common case has been the use of regular I/O functions, such as
> __raw_readb() or memset_io(). A few architectures used plain system-
> memory reads and writes. Sparc used helpers for its SBus.
>
> The architectures that used special cases provide the same code in
> their __raw_*() I/O helpers. So the patch replaces this code with the
> __raw_*() functions and moves it to <asm-generic/fb.h> for all
> architectures.
>
> v6:
>         * fix fb_readq()/fb_writeq() on 64-bit mips (kernel test robot)
> v5:
>         * include <linux/io.h> in <asm-generic/fb>; fix s390 build
> v4:
>         * ia64, loongarch, sparc64: add fb_mem*() to arch headers
>           to keep current semantics (Arnd)
> v3:
>         * implement all architectures with generic helpers
>         * support reordering and native byte order (Geert, Arnd)
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Tested-by: Sui Jingfeng <suijingfeng@loongson.cn>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
>
> add mips fb_q()

> --- a/arch/mips/include/asm/fb.h
> +++ b/arch/mips/include/asm/fb.h
> @@ -12,6 +12,28 @@ static inline void fb_pgprotect(struct file *file, str=
uct vm_area_struct *vma,
>  }
>  #define fb_pgprotect fb_pgprotect
>
> +/*
> + * MIPS doesn't define __raw_ I/O macros, so the helpers
> + * in <asm-generic/fb.h> don't generate fb_readq() and
> + * fb_write(). We have to provide them here.

MIPS does not include <asm-generic/io.h>,  nor define its own
__raw_readq() and __raw_writeq()...

> + *
> + * TODO: Convert MIPS to generic I/O. The helpers below can
> + *       then be removed.
> + */
> +#ifdef CONFIG_64BIT
> +static inline u64 fb_readq(const volatile void __iomem *addr)
> +{
> +       return __raw_readq(addr);

... so how can this call work?

> +}
> +#define fb_readq fb_readq
> +
> +static inline void fb_writeq(u64 b, volatile void __iomem *addr)
> +{
> +       __raw_writeq(b, addr);
> +}
> +#define fb_writeq fb_writeq
> +#endif
> +
>  #include <asm-generic/fb.h>

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
