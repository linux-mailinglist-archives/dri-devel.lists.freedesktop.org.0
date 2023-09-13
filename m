Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CE179E198
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 10:09:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 507B510E475;
	Wed, 13 Sep 2023 08:09:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3B6310E475
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 08:09:24 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-59231a1ca9eso67833087b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 01:09:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694592563; x=1695197363;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uCz1YqPLlml0me4QSAkCQsY8FV1Cudx91zoZbXBVMOA=;
 b=byKE2aQ5E2tMHsoFGxTXVi89pvGXdHdL4OrXYcpm5YgvvRmRN7k+DkU+xrkAmnXkKu
 Yoqhzb/6nzIjG/mZiXB3NnnCC+E9s4dVayGqIrhD6nXJ6as2HgQPzOaEXclbUP9H9UrQ
 mIgvVnSvk0uMx+Xh2nmNHecvMAByqtTTJCXdcReRumdzeY4XNok7T8ewduEFskdYvFGY
 AjytyyDMQ0TRHstemcV+uwx9NaPzdd9I9lK6HB0MN9ORTW3gAAQplKZslL5aQA2ZZ7lz
 C1YGhz5jXL7YKaM58rgUxOG2MqttFjf1RsJPfXzpak6ahsXqW5xLNCRd+N5j65H9Pzyf
 8j7A==
X-Gm-Message-State: AOJu0YwLcrURy/DFW7JDm+xPjsrx0AYXqnFD+Rsru/bVzk6fimmCimtz
 0mvkMfycC8cfjuuxloMLNSV8v1MAKwDAmQ==
X-Google-Smtp-Source: AGHT+IGp90eoNwCCg0wq6j1oCTz0IUUqHg8HosASVJEN6km3CorPuDrWhReVs0BhVj1Hs0AQk3gmWQ==
X-Received: by 2002:a0d:d4cb:0:b0:58e:fa3c:9401 with SMTP id
 w194-20020a0dd4cb000000b0058efa3c9401mr1865530ywd.12.1694592563281; 
 Wed, 13 Sep 2023 01:09:23 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com.
 [209.85.219.182]) by smtp.gmail.com with ESMTPSA id
 h62-20020a0dde41000000b0057a918d6644sm2987978ywe.128.2023.09.13.01.09.22
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Sep 2023 01:09:22 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-d7ba4c5f581so5683400276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 01:09:22 -0700 (PDT)
X-Received: by 2002:a25:9844:0:b0:d81:4e98:4f5c with SMTP id
 k4-20020a259844000000b00d814e984f5cmr1178332ybo.47.1694592562230; Wed, 13 Sep
 2023 01:09:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230912135050.17155-1-tzimmermann@suse.de>
 <20230912135050.17155-3-tzimmermann@suse.de>
In-Reply-To: <20230912135050.17155-3-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 Sep 2023 10:09:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU66MLdWM9Qjk-2qmHUZA6F8L-W1iAoc73-HvSB1n-drg@mail.gmail.com>
Message-ID: <CAMuHMdU66MLdWM9Qjk-2qmHUZA6F8L-W1iAoc73-HvSB1n-drg@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] fbdev: Replace fb_pgprotect() with
 pgprot_framebuffer()
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
Cc: linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-ia64@vger.kernel.org, dri-devel@lists.freedesktop.org, arnd@arndb.de,
 mpe@ellerman.id.au, deller@gmx.de, linux-mips@vger.kernel.org,
 christophe.leroy@csgroup.eu, linux-m68k@lists.linux-m68k.org,
 npiggin@gmail.com, sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Tue, Sep 12, 2023 at 5:32=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
> Rename the fbdev mmap helper fb_pgprotect() to pgprot_framebuffer(
> The helper sets VMA page-access flags for framebuffers in device I/O
> memory.
>
> Also clean up the helper's parameters and return value. Instead of
> the VMA instance, pass the individial parameters separately: existing
> page-access flags, the VMAs start and end addresses and the offset
> in the underlying device memory rsp file. Return the new page-access
> flags. These changes align pgprot_framebuffer() with other pgprot_()
> functions.
>
> v4:
>         * fix commit message (Christophe)
> v3:
>         * rename fb_pgprotect() to pgprot_framebuffer() (Arnd)
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks for your patch!

>  arch/m68k/include/asm/fb.h           | 19 ++++++++++---------

Looks like you forgot to apply my
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
given on v1.

I didn't notice before, as I never received v2 and v3 due to the
gmail/vger email issues.

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
