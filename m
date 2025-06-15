Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADE8ADA3F0
	for <lists+dri-devel@lfdr.de>; Sun, 15 Jun 2025 22:57:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C65A10E248;
	Sun, 15 Jun 2025 20:57:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WsFipkWG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D40EF10E244
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Jun 2025 20:57:39 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-3a503d9ef59so3378215f8f.3
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Jun 2025 13:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750021058; x=1750625858; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T2aI5ojTa0fVOmRjpVaA+YiywY9TgSfTBgCLyg00I5Q=;
 b=WsFipkWGlntKg2ucH9Q+R2Q2E3/KzKJEjlumm/3LYpq8a0paVFE6hiI//oyDTGn6mw
 iKxWouD7wbI6NPzgHU1Fx0eeqcmTgBTeGoua11I+fYHfixYnoyNOaJJzrRxVpR99iCfM
 b8GZ4pPMHQ0e4CTsJBvG/cMRoIMNRSSn3OIqO5cm2yTztADoItqWBEapXZSrl2rnMhSP
 cRG/vBqoghVAGPuYdEfbzzRSjo5HsT/3AzARXjcrx6v9Neo94z0qoJpN8uYGIoT5yBcH
 XVR/79A6szRr5HxTTSXXNi/Y01CJR1oGVGAN4Hnjca34M6WTc0AvK2FCKjtXxaeWJvEc
 Y8ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750021058; x=1750625858;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T2aI5ojTa0fVOmRjpVaA+YiywY9TgSfTBgCLyg00I5Q=;
 b=nnViDhiNElUjM7fev12bnCGlryVvbBnGj71Z5NOCmbiQc4vkOaIXjGxQHK4v1rshfr
 5NDWVvweayUGHiyghdGloOvgCmHookakuelJP5MqJwJFhNAvaXbLl6a4Fjmp9l7Rb/Hd
 9K+l54EvCNxdIsTw3sm1n+M/0KFg34EcAw9AeZRokqZZAEhSkrPMeI+FgM92n8wYbW7P
 BCm4fG/j2j2338NWKMU1XmIiS0tW2K0gsIlizF2MDXj2Hq5ab5aSE/tpoxMKRp3xMvFB
 U3A0+QtWq/cuB2FWmZts0kwrjBYs7/o5cORFfxTrfsJfpyxPyuZi7pH4ZUlAxTf/KfAw
 am6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCViVArZlBeBaWDzwqyqTMtBO04bAjWngVQuEQACngiT61+yQOoynvq/gcD1NAJf3FKWsl6TskWlvto=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+xPKdhliQ0znKew8dapDfzluDhHmUe1IJnDD741VW8Xr6SMIP
 WUgGrA8b85yphYsY79Uk/6CNq0qAtZdS2F17urKsvj/HTmZALdqX9Xq03uQxlg==
X-Gm-Gg: ASbGncuLqG7X+XvurwyU8BKqA+M9M0ODF06b1s1kFwoC/XFbYel0On2cXIlgNteiZHG
 E6rsK8KfCPHF66v1k8m744+YNJR784KSU5hdkitOGxZhhFzYFJZpdQpr1uED1dlUJ2iNB9RZttu
 SN4/Bun3H8+QWSTv5MWMT+WgQmTI5+xxqZIPeuHIXlnFokjVN+V1UJQ5QKsNK58h3n4ozoJvnAo
 JJftTQNey9+r8b8llaYJtNf96xPafcLqmOsdOhuMChp8o/KniD/WwSc6jDctU06JaoMAwJZiM5p
 hFahYf1VFsudA/3A/TsESDHaVZyEGxw2Qq41JMtPJ1Yfhr34KSGrOemcYdDHHSBAIeHgXAVdU8R
 lhzTdwPvFEUk1r/YtYYrRFzaQ
X-Google-Smtp-Source: AGHT+IGHopTKMDLrNy91dcBwnlGeBYYk8YgDhfPG4599R3YYx5c7CIxOz1VmF8L04MqVsJlAZiVs2A==
X-Received: by 2002:a05:6000:2404:b0:3a3:652d:1640 with SMTP id
 ffacd0b85a97d-3a57238b3dbmr6086391f8f.2.1750021057845; 
 Sun, 15 Jun 2025 13:57:37 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a568a547d2sm8947987f8f.19.2025.06.15.13.57.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Jun 2025 13:57:37 -0700 (PDT)
Date: Sun, 15 Jun 2025 21:57:36 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Jin D <alexguo1023@gmail.com>
Cc: deller@gmx.de, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fbdev: i740: Fix potential divide by zero
Message-ID: <20250615215736.3d850bdd@pumpkin>
In-Reply-To: <CAAi4Z-fDFw1gD2MbqucWRMN0DvKf5mk6B+GDD95x9o23G8iK6w@mail.gmail.com>
References: <20250614051837.3544959-1-alexguo1023@gmail.com>
 <20250615093003.6e524fa9@pumpkin>
 <CAAi4Z-fDFw1gD2MbqucWRMN0DvKf5mk6B+GDD95x9o23G8iK6w@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

On Sun, 15 Jun 2025 16:43:58 -0400
Jin D <alexguo1023@gmail.com> wrote:

> >       bpp =3D var->bits_per_pixel;
> > +     if (!var->pixclock){
> > +             dev_err(info->device, "pixclock must not be zero\n");
> > +             return -EINVAL;
> > +     }
> >       switch (bpp) {
> >       case 1 ... 8:
> >               bpp =3D 8; =20
>=20
> The value used in the switch condition is var->bits_per_pixel. I can not
> find a deterministic relationship between var->bits_per_pixel and
> var->pixclock.

Brain-fade ...

>=20
> On Sun, Jun 15, 2025 at 4:30=E2=80=AFAM David Laight <david.laight.linux@=
gmail.com>
> wrote:
>=20
> > On Sat, 14 Jun 2025 01:18:37 -0400
> > Alex Guo <alexguo1023@gmail.com> wrote:
> > =20
> > > Variable var->pixclock can be set by user. In case it equals to
> > > zero, divide by zero would occur in 4 switch branches in
> > > i740fb_decode_var.
> > > Similar crashes have happened in other fbdev drivers. We fix this
> > > by checking whether 'pixclock' is zero. =20
> >
> > Doesn't it already hit the 'default' clause of the switch statement?
> >
> >         David
> > =20
> > >
> > > Similar commit: commit 16844e58704 ("video: fbdev: tridentfb:
> > > Error out if 'pixclock' equals zero")
> > >
> > > Signed-off-by: Alex Guo <alexguo1023@gmail.com>
> > > ---
> > >  drivers/video/fbdev/i740fb.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/drivers/video/fbdev/i740fb.c b/drivers/video/fbdev/i740f=
b.c
> > > index 9b74dae71472..861e9e397b4e 100644
> > > --- a/drivers/video/fbdev/i740fb.c
> > > +++ b/drivers/video/fbdev/i740fb.c
> > > @@ -419,6 +419,10 @@ static int i740fb_decode_var(const struct =20
> > fb_var_screeninfo *var, =20
> > >
> > >
> > >       bpp =3D var->bits_per_pixel;
> > > +     if (!var->pixclock){
> > > +             dev_err(info->device, "pixclock must not be zero\n");
> > > +             return -EINVAL;
> > > +     }
> > >       switch (bpp) {
> > >       case 1 ... 8:
> > >               bpp =3D 8; =20
> >
> > =20

