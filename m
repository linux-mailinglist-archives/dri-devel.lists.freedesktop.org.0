Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6748CF4DD9
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 18:00:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22C4F10E2C9;
	Mon,  5 Jan 2026 17:00:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="T5PFf2mC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com
 [74.125.224.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A6A210E2C9
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 17:00:46 +0000 (UTC)
Received: by mail-yx1-f42.google.com with SMTP id
 956f58d0204a3-6455a60c11fso97823d50.2
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jan 2026 09:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767632445; x=1768237245; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G8NZXgPadPZEkwzWUBQYb5my2Ym2kpL3eDcs25dhOFE=;
 b=T5PFf2mCeaLyBGwBSgMGoBxSuXOo7wvMvRFCQOTdAu1NJ/aARpK1SiY7XpibK6hq2U
 zxaNT5Lh+SFQMQchpwBKDGVPG3lbAfomQ//2RkIDEgaqzQeUZEqTEIIW/5KwKRy+yyCz
 8vDmOOW36/1fAe2Uzg5ZC3we7O0WyTM+bQsnrkUzRuxJMF+M1aYqXsGMeBuzwQTFcWzB
 4e4R9jyL7ys+gln+LoH6Rcn9O6+DWF5c+I68h/iOZvnKRX4NeNhl9YCMj3OvR0B7F1dr
 kCKe82EHTDJCMh03l2GO/EJfN7PBZK+VeIrx77hPNzaD3NfcsIm6qpMGV7/G5rKeDMTx
 NnCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767632445; x=1768237245;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=G8NZXgPadPZEkwzWUBQYb5my2Ym2kpL3eDcs25dhOFE=;
 b=v70Uwm806k2A5pfmfibUcRW4hmdRtQ+lg3K4j3WsqlaECZlS2mUtrtll/uFnjHEUKM
 k51cc8ncvKtcz64m7u5OTkg5ZiwMNZsyUzkPf3h+UjePdpCv7MiTR5LXtE6+N7rlP1LK
 DPBEgsfh6sRZzdZv5emctJa1pSGryVpZdJcUw0NTSd6Pmpx2cw5tgK5qHElI/2HWMRFt
 HAFgtWSufDImWgO9Nf7x2v41Bi5w1yzkxRb1OxmVRLPp8IkitSi75BrK93O+1q0TpRsF
 0dWzjzGKX9ug3aiUzv98QVCGI/gUwn8n5a2RpUSb0Ok72OlSEem65X4q/tvlqIjVVAd4
 u43Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV52IRqKzPKsZbTOTjBIYERQJw0lhefRlh/b5wEEHv20sOOdFUx5PlQPKQN+OT3Ceh6kthZ9RKKim0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzcvl5KNTqA38ad7rq+TUYiIgEqTu5L3MnC4ga5fytpTsAQiF+x
 jRxeSX5l6PrqILnLlwmhC0Cvhk8HxHB0tXS/siA340FHadeoqzzfKrycHAAIKwEvQBaUn2k7d7D
 3A5XMsbipQ+tmv7jk3RTVb+B6Qc1is6zCF5cGzdbIhA==
X-Gm-Gg: AY/fxX5aTci8uUks1ErwvEXia5cxEN9oOFQXsUOEHdeQ25J+824wt/LvMIpBBmezS99
 KpiDrjZAPA48maFJ+bh7EqjDryJind8YM+uSrePHMKWmQDtt4BHG415/zrNjpC50zYBKeTP9Mjf
 ClC+NaPrYlBa7BGFaKEO5OKccXJHF27FdpFnD1qdmfkhWNckPLQ1x4WvxFPlzOdcLeqN53F6bR3
 11ehKJk4qNQI1HWQGAiL+JcwxoMyEWStrJ/i8C1A/WqIJNiY9bhH0Da2QLerZ/sISxtG6z8vEjK
X-Google-Smtp-Source: AGHT+IHIximRz2m2jGs8u0bx0xjsp8Um2C8mOpJTpVvJQsdOx3gGxbnLnp3w4IfsQ+GKL6y/oDU2erq+6ANxO3S6ECE=
X-Received: by 2002:a05:690e:23c6:b0:644:2e1b:c8bb with SMTP id
 956f58d0204a3-6470c8e2d3amr131608d50.59.1767632445026; Mon, 05 Jan 2026
 09:00:45 -0800 (PST)
MIME-Version: 1.0
References: <20260104110638.532615-1-sun.jian.kdev@gmail.com>
 <20260104110638.532615-2-sun.jian.kdev@gmail.com>
 <aVvmr2qOrFvoEKGV@smile.fi.intel.com>
In-Reply-To: <aVvmr2qOrFvoEKGV@smile.fi.intel.com>
From: sun jian <sun.jian.kdev@gmail.com>
Date: Tue, 6 Jan 2026 01:00:33 +0800
X-Gm-Features: AQt7F2ph6P0Bf8OBdam7XZpIqbRkmM7c3K-cx7qIKWaHmSFeDtSuMjBbQmYOqkw
Message-ID: <CABFUUZFeO51MW5n1uDp0tcwJeJvgxDRxY3rDqkj2Z-6cO23TwA@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] staging: fbtft: core: avoid large stack usage in
 DT init parsing
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 linux-staging@lists.linux.dev, linux-fbdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andy,

Thanks for the feedback.

You are right: changing the DT init path from write_register() to
fbtft_write_buf_dc() implicitly assumes "cmd byte + payload bytes" and
does not preserve the generic write_register() semantics (e.g. regwidth /
bus-specific handling).I only have clang/arm64 build coverage (no
access to the actual panels),
so I can=E2=80=99t provide runtime validation yet. For the remaining 3 driv=
er-local
patches, all affected drivers have .regwidth =3D 8 and the sequences are
=E2=80=9C1-byte command + N bytes data=E2=80=9D (gamma/LUT). The intent was=
 to avoid the
huge write_reg() varargs call that triggers -Wframe-larger-than=3D1024.

Given the lack of hardware, would you prefer one of the following?

1. Drop the driver changes and instead bump -Wframe-larger-than for these
   specific objects in the Makefile as an exception; or

2. Keep the driver changes but I should provide a detailed test pattern /
   list of tested devices =E2=80=94 if so, what level of detail would be ac=
ceptable
   (exact panel model + wiring/bus type + expected output), and is =E2=80=
=9Cbuild-only=E2=80=9D
   ever sufficient for warning-only changes in fbtft?

Happy to follow the approach you think is appropriate for this staging driv=
er.

Best regards,
Sun Jian

On Tue, Jan 6, 2026 at 12:28=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Sun, Jan 04, 2026 at 07:06:35PM +0800, Sun Jian wrote:
> > Clang reports a large stack frame for fbtft_init_display_from_property(=
)
> > (-Wframe-larger-than=3D1024) when the init sequence is emitted through =
a
> > fixed 64-argument write_register() call.
> >
> > write_reg()/write_register() relies on NUMARGS((int[]){...}) and large
> > varargs which inflates stack usage. Switch the DT "init" path to send t=
he
> > command byte and the payload via fbtft_write_buf_dc() instead.
> >
> > No functional change intended: the same register values are sent in the
> > same order, only the transport is changed.
>
> How did you test this?
>
> ...
>
> >       struct device *dev =3D par->info->device;
> > -     int buf[64], count, index, i, j, ret;
> > +     u8 buf[64];
> > +     int count, index, i, j, ret;
>
> Please, try to preserve reversed xmas tree order.
>
> >       u32 *values;
> >       u32 val;
> >
>
> ...
>
> > -                             buf[i++] =3D val;
> > +                             buf[i++] =3D val & 0xFF;
>
> Unneeded change, I suppose.
>
> ...
>
> > -                     par->fbtftops.write_register(par, i,
> > -                             buf[0], buf[1], buf[2], buf[3],
> > -                             buf[4], buf[5], buf[6], buf[7],
> > -                             buf[8], buf[9], buf[10], buf[11],
> > -                             buf[12], buf[13], buf[14], buf[15],
> > -                             buf[16], buf[17], buf[18], buf[19],
> > -                             buf[20], buf[21], buf[22], buf[23],
> > -                             buf[24], buf[25], buf[26], buf[27],
> > -                             buf[28], buf[29], buf[30], buf[31],
> > -                             buf[32], buf[33], buf[34], buf[35],
> > -                             buf[36], buf[37], buf[38], buf[39],
> > -                             buf[40], buf[41], buf[42], buf[43],
> > -                             buf[44], buf[45], buf[46], buf[47],
> > -                             buf[48], buf[49], buf[50], buf[51],
> > -                             buf[52], buf[53], buf[54], buf[55],
> > -                             buf[56], buf[57], buf[58], buf[59],
> > -                             buf[60], buf[61], buf[62], buf[63]);
> > +                     /* buf[0] is command, buf[1..i-1] is data */
> > +                     ret =3D fbtft_write_buf_dc(par, &buf[0], 1, 0);
> > +                     if (ret < 0)
> > +                             goto out_free;
> > +
> > +                     if (i > 1) {
> > +                             ret =3D fbtft_write_buf_dc(par, &buf[1], =
i - 1, 1);
> > +                             if (ret < 0)
> > +                                     goto out_free;
> > +                     }
>
> I believe this is incorrect change and has not to be applied. write !=3D
> write_register. Without any evidence of testing, definite NAK to it.
> Otherwise, please provide detailed testing pattern and which devices were
> tested.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
