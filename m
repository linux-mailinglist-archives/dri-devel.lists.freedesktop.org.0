Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D5ACF4501
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 16:10:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B97B610E390;
	Mon,  5 Jan 2026 15:10:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gUKtOBmv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 573B010E390
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 15:10:04 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-78e6dc6d6d7so435927b3.3
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jan 2026 07:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767625803; x=1768230603; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BjgKkI960mta53SMy3Cx/puUXrH0qsBk8eh+vG4/oMQ=;
 b=gUKtOBmvDH/HVmTF1lQerA3YeBvVOq7KFMAH2nSuIhsgmQvEf9XBiURA6Yoxd5hAqi
 5uGd5bXp3BYVuDKB6rGbDaSCayyM82aEQ8BXwqR5rKwqGwPei8X3uIjIM81SHYtE8RQf
 HufRZSgcpSFixRJq6/VyUTIRkbXfa4QcVH54PE03fN6kybPVaM2xnolh5vPwfsK2jL/g
 6tDtre+oISR3/NBs52JivpyXtjRDbW8wSPAOqhFbaJ2+PK4mqPsJqaYvRdGCjyS0iHMK
 d2t76AMVTqOK1HQtTxaEdzThNqBzIFpaluxJ/WQGSt+8DzhUg9DafyH98wzRa+tBF9W3
 fHVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767625803; x=1768230603;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BjgKkI960mta53SMy3Cx/puUXrH0qsBk8eh+vG4/oMQ=;
 b=EqODz/a7/cDUXM8UO0CMVsWmkYvVJw2+uRxfwnZuNEk2nMMfi78OsvGbvHFaOKQDax
 CBoAZK9eg+7U+xse8U6VByIwwxBxiPp/Zz0uSbe6WZXokscXW/V+M2bpVC9stcyBnoIj
 2PVuxr9I1XlcxEICJUbh/RSI0DX6KpbFI+w1Yl6SS1nJRybFZInI+1/Z+B9A+lurhd1Q
 L4PM+K+kJ58Tsd186BQopm5T5xqIBLfeFr7pgUhUACM/RyBcmPY2sHF3DIdAHmg6m0cz
 CLle5YvB0YHfWI/z79I+xMyycUzRPjmCRIoBGfckCCxOw5SzYkvuaKiEiOU59yI+91Kb
 MEIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGsSLSGEWn2SYyZD+2F2zAbX9WaJLljhI5ZYoDQMkiXZwvGEfEQ7gsgL4B08KIBl2QRPuBS4bSBeE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzrNvNo0icohppfuJ+qFgv5ngrrBXAhPIspyNJLa4K9/6PgP//M
 6+3Rw7XcfvljGabYHn2PvaQBPj8NZkOmPEPP5gxBW15QP/lGrzpQMRd/Jik6qNX7jErgaM6WVvH
 0J9nfQzP2E7lHx0r5JpLZr9VnhnXm3n0=
X-Gm-Gg: AY/fxX5UE3q5mjKO37o2yihcxDUJ3/Oz11oOLRWT7llwFKQlqNEzQkvmWJz4fiiuJZg
 u+80zo22+QZybigIc4NCmAu4e0g5/vwVOZgEL8386F+ObShtyZNmY2+zjgEFYjKMAsVla+lzUqZ
 t9j6MEJbxZkP6RnUEkRMLOkr/BzzFxx5ppXkn6FW/jz6EhExeNOGgI/EyqbJkEeXe8u2OTPtl+j
 8vw/oRMD5+TLAqlbBqpBypGGIqIe3dcU9Xn7wjPhnALTQK/A4/257fkYXMQ11VMXmERK0zYMhDI
X-Google-Smtp-Source: AGHT+IEd4FoOYeV2bi6QTaTAdIjXmnqph1DvLN+wvfaAUUzyAym8Y4JISBI1VyDvskcD09yI/QPbCHBE8WjooHM5BLQ=
X-Received: by 2002:a05:690c:7484:b0:78f:984b:4bb9 with SMTP id
 00721157ae682-78fb405d23cmr421841917b3.56.1767625801687; Mon, 05 Jan 2026
 07:10:01 -0800 (PST)
MIME-Version: 1.0
References: <20260104110638.532615-1-sun.jian.kdev@gmail.com>
 <20260104110638.532615-3-sun.jian.kdev@gmail.com>
 <aVvNJV93mprLcZwy@stanley.mountain>
In-Reply-To: <aVvNJV93mprLcZwy@stanley.mountain>
From: sun jian <sun.jian.kdev@gmail.com>
Date: Mon, 5 Jan 2026 23:09:50 +0800
X-Gm-Features: AQt7F2pZF6GavYIHt7cH5Iy0vK4sqA7M4pPH0NYIVOmEsaNlJo1jShKyDDs3_nw
Message-ID: <CABFUUZErGq8tApjtDadG_gMnouJ0WTHXe10WyRHRAy5EWutijw@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] staging: fbtft: ssd1351: send gamma table via
 fbtft_write_buf_dc()
To: Dan Carpenter <dan.carpenter@linaro.org>
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

Hi Dan,

Thanks. Agreed.

For v2 I=E2=80=99ll keep this patch minimal: only switch from write_reg() v=
arargs
to fbtft_write_buf_dc() and reduce the stack usage, without other changes.

Any follow-up cleanups (if needed) will be sent as a separate patch.

Thanks,
Sun Jian

On Mon, Jan 5, 2026 at 10:39=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> On Sun, Jan 04, 2026 at 07:06:36PM +0800, Sun Jian wrote:
> > Clang reports a large stack frame in set_gamma() (-Wframe-larger-than=
=3D1024)
> > due to the large write_reg() call emitting 63 gamma bytes via varargs.
> >
> > Send the command byte (0xB8) and the gamma payload using
> > fbtft_write_buf_dc() to avoid the varargs/NUMARGS stack blow-up.
> >
> > No functional change intended.
> >
> > Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
> > ---
> >  drivers/staging/fbtft/fb_ssd1351.c | 35 +++++++++++++-----------------
> >  1 file changed, 15 insertions(+), 20 deletions(-)
> >
> > diff --git a/drivers/staging/fbtft/fb_ssd1351.c b/drivers/staging/fbtft=
/fb_ssd1351.c
> > index 6736b09b2f45..b4ab2c81e528 100644
> > --- a/drivers/staging/fbtft/fb_ssd1351.c
> > +++ b/drivers/staging/fbtft/fb_ssd1351.c
> > @@ -119,43 +119,38 @@ static int set_var(struct fbtft_par *par)
> >   */
> >  static int set_gamma(struct fbtft_par *par, u32 *curves)
> >  {
> > -     unsigned long tmp[GAMMA_NUM * GAMMA_LEN];
> > +     u8 data[GAMMA_LEN];
>
> Ugh...  GAMMA_NUM is 1 so this is an annoying calculation.  So what
> this does is it changes the type from unsigned long to u8 and renames
> the variable.  I am fine with renaming the variable it's unrelated and
> makes the review harder.
>
> > +     u8 cmd =3D 0xB8;
> >       int i, acc =3D 0;
> > +     int ret;
> >
> > -     for (i =3D 0; i < 63; i++) {
> > +     for (i =3D 0; i < GAMMA_LEN; i++) {
>
> GAMMA_LEN is 63.  So this looks like a change, but it's an unrelated
> cleanup.
>
> >               if (i > 0 && curves[i] < 2) {
> >                       dev_err(par->info->device,
> >                               "Illegal value in Grayscale Lookup Table =
at index %d : %d. Must be greater than 1\n",
> >                               i, curves[i]);
> >                       return -EINVAL;
> >               }
> > +
>
> This is an unrelated white space change.
>
> >               acc +=3D curves[i];
> > -             tmp[i] =3D acc;
> > +
> >               if (acc > 180) {
> >                       dev_err(par->info->device,
> >                               "Illegal value(s) in Grayscale Lookup Tab=
le. At index=3D%d : %d, the accumulated value has exceeded 180\n",
> >                               i, acc);
> >                       return -EINVAL;
> >               }
> > +
> > +             data[i] =3D acc;
>
> Here we move the acc assignment after the sanity check, but it's just
> an unrelated cleanup.
>
> >       }
> >
> > -     write_reg(par, 0xB8,
> > -               tmp[0],  tmp[1],  tmp[2],  tmp[3],
> > -               tmp[4],  tmp[5],  tmp[6],  tmp[7],
> > -               tmp[8],  tmp[9],  tmp[10], tmp[11],
> > -               tmp[12], tmp[13], tmp[14], tmp[15],
> > -               tmp[16], tmp[17], tmp[18], tmp[19],
> > -               tmp[20], tmp[21], tmp[22], tmp[23],
> > -               tmp[24], tmp[25], tmp[26], tmp[27],
> > -               tmp[28], tmp[29], tmp[30], tmp[31],
> > -               tmp[32], tmp[33], tmp[34], tmp[35],
> > -               tmp[36], tmp[37], tmp[38], tmp[39],
> > -               tmp[40], tmp[41], tmp[42], tmp[43],
> > -               tmp[44], tmp[45], tmp[46], tmp[47],
> > -               tmp[48], tmp[49], tmp[50], tmp[51],
> > -               tmp[52], tmp[53], tmp[54], tmp[55],
> > -               tmp[56], tmp[57], tmp[58], tmp[59],
> > -               tmp[60], tmp[61], tmp[62]);
> > +     ret =3D fbtft_write_buf_dc(par, &cmd, 1, 0);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     ret =3D fbtft_write_buf_dc(par, data, sizeof(data), 1);
> > +     if (ret < 0)
> > +             return ret;
>
> These are good changes.  Just change the type from unsigned long to u8
> and use fbtft_write_buf_dc() instead of write_reg().  Then do the other
> changes in a separate patch.
>
> Same for the other patches.
>
> regards,
> dan carpenter
>
> >
> >       return 0;
> >  }
> > --
> > 2.43.0
> >
