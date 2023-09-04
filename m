Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6898579119F
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 08:50:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75B4610E29A;
	Mon,  4 Sep 2023 06:50:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65ED410E29A
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 06:50:12 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-58cd9d9dbf5so15252407b3.0
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Sep 2023 23:50:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693810211; x=1694415011;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3rK9iNlhM9qm2dLN2U9ruHBYs+JWxgylVxpO0f1W8IM=;
 b=Br0cjDkTo8Fv7kjPjT/+1e3IW8gX8lZ6p8azU5QNNHUKLPB14gMAAd2hcntwjR8BF/
 cgQD6OsgwNMHcNxhiERSO0WarapTl2KCzte1+9oi4UjZ8tB89BOEw1/ZafmWm227+rc1
 u6jYo+Y3KZD2lZOG05Ba13dIxMz21Xz5GDBEzsn9iRZKV0LgSkqSBzC2ztetfJUMuLB4
 Q7wvG2QwOGJPP3mApbFmFR1jxXMkMo1pXFUQ6y95ZRqHuHmUPOUdVl9tL1RihuX9Rt0q
 HTv7+wqyOSpVJgF3EoVplUF63AV5pA8Yu5I0IVXt5HJRrs8Rv2jn0UsRmR3MPEV5+UBy
 Lu/w==
X-Gm-Message-State: AOJu0YyW5GLJYI0580q2NmBDy4xrGKT8srlhwVzpTgILsaPP9UfrTa51
 SZPGE6XcbVmpJDkOB2l0kyt3HXvU/aHifA==
X-Google-Smtp-Source: AGHT+IHDWj8uPyQabRCgC2hw4zA5QcI4BYI9glYqfUmt0VOXFOUmbTH//GPa1xwBymqgD+IOOs2nRg==
X-Received: by 2002:a81:a013:0:b0:592:975b:376a with SMTP id
 x19-20020a81a013000000b00592975b376amr12819308ywg.0.1693810211294; 
 Sun, 03 Sep 2023 23:50:11 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com.
 [209.85.128.181]) by smtp.gmail.com with ESMTPSA id
 b11-20020a0dd90b000000b0058419c57c66sm2529134ywe.4.2023.09.03.23.50.09
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Sep 2023 23:50:11 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-58d41109351so27038327b3.1
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Sep 2023 23:50:09 -0700 (PDT)
X-Received: by 2002:a25:a1a9:0:b0:d7b:a78e:6b2d with SMTP id
 a38-20020a25a1a9000000b00d7ba78e6b2dmr12488603ybi.20.1693810209384; Sun, 03
 Sep 2023 23:50:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230901142659.31787-1-tzimmermann@suse.de>
 <20230901142659.31787-5-tzimmermann@suse.de>
In-Reply-To: <20230901142659.31787-5-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 4 Sep 2023 08:49:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV+0P40QpPcLeuSAd0HJ_Z2uPpmhyBKXnxoOQibtGAVFg@mail.gmail.com>
Message-ID: <CAMuHMdV+0P40QpPcLeuSAd0HJ_Z2uPpmhyBKXnxoOQibtGAVFg@mail.gmail.com>
Subject: Re: [PATCH 4/4] fbdev: Replace fb_pgprotect() with fb_pgprot_device()
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

On Sat, Sep 2, 2023 at 11:13=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
> Rename the fbdev mmap helper fb_pgprotect() to fb_pgprot_device().
> The helper sets VMA page-access flags for framebuffers in device I/O
> memory. The new name follows pgprot_device(), which does the same for
> arbitrary devices.
>
> Also clean up the helper's parameters and return value. Instead of
> the VMA instance, pass the individial parameters separately: existing
> page-access flags, the VMAs start and end addresses and the offset
> in the underlying device memory rsp file. Return the new page-access
> flags. These changes align fb_pgprot_device() closer with pgprot_device.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

>  arch/m68k/include/asm/fb.h           | 19 ++++++++++---------

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>


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
