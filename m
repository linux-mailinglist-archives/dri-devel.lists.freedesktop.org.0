Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72010A50E2C
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 22:50:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD19910E06C;
	Wed,  5 Mar 2025 21:50:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hR+pRBQ/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FF6B10E06C;
 Wed,  5 Mar 2025 21:50:31 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-43bc638686eso8624175e9.1; 
 Wed, 05 Mar 2025 13:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741211430; x=1741816230; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6sXlsk07FZxhY/T3MpoCtJCcVQMm9u5T5zif23+8N4I=;
 b=hR+pRBQ/NHvUclBY7UFMgqssdj2FgRKoI1rSh8tIjBYX//9NPuJag5e/Wx8RElVHr8
 qoBL8vLVUNxKtYc3hUWaKJEiXGPX3RlUEe7iuKl2LguU2XD9hgYUH+yQtfpuIDlIOPuo
 WIshOEusDI23D+bTun7leJsCB4Py9q6gKXcoeNOC3AbQf2ttGsZqFvlCOjycH3L6c1cx
 LMwdgSM9iLFBFzn0n9HAOrOqRTOU6WrMTfeU7iJqCacRnoHdG+J9/5S8rPpf4eCkm4pM
 sBxQcj5mYrT9mp0AA7wPm+KyUQ1uB+jSKMDiUnv5etdllfLL6b+L2JVfNhz2hmqt5UAR
 e4Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741211430; x=1741816230;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6sXlsk07FZxhY/T3MpoCtJCcVQMm9u5T5zif23+8N4I=;
 b=lx+OqhaEYm7juI5TNsobu6V4L4r6lYUCeFNwNYQqX4Tx/oDC9JvPj5kcRVVX5fCWFG
 gvK8R80bXj1tTVLbD99xOCO11dp0SXCNVy7Bx4ZhlfMJgnQl+NkYe4freh88bvN+A6Ud
 t0VnOeOKzbUVOWoJeRt6M/KYLKcT+OubWBGI/q5dwBHVcHBgMgadgC5K6bAmGeA92pjI
 G3JHtbO5kqywwamTIN6GtgJTYa3tDUN2YsOEszFZD4JZrvGZiQ+yMa/tZJTSGKdnaUId
 E2+yuBF/yFvzmgrB+GrSp9+rLgyyhKsI2gldWNAJ7vbrzwXDHJMIV6Ah+Trj0XWYqmCU
 pdYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCULu+SEnzG0Qqdz9fLiD/ELok83r2xVOPWuXU1NZQ9FgSbRhNmIEf3ok3sp34JiDfM/6+d9XGmetbr1@lists.freedesktop.org,
 AJvYcCX6eyXyAUHbk7+NjECx091rtYLIL1u+0P3fdKvywv7AmK8gALTGMmEKxSGKTGZkpwGhI9va0Zm+VnA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXc2w1qu3JupyOhv7rpH3dFAsGj+H7m2sTG6Sar3ZBxP7SvZ13
 8Pn2j553YLkW9WVm131krb62GmF1k/icgDZeQknw+Zqv9fiGzfUl
X-Gm-Gg: ASbGncsBPKq6PXSi70xAUF2eBmTGDqbH3KddQ8lc6haL4tDvd+hOidGosaItsWbEnSw
 wTqeeBXW7+485a+h5tLjYjiPUbVuXFUm38gF+ILcjSpJVGHnyoLcPoisCivl7sDJPIdKf7UoZvv
 vteEoBEp/VMovhiYgVVuKlc8hzkboYc89diJd76okJkCHiNjeGXtN+djn1REHE7iKQ56vxt0NUf
 5Yl/x8+6oxBflJDdVFheiNT6T93f2uEKiAGQUYLOWTTij7BjpHX51Nas6Gf1i+Ja/h73qeoDkVb
 0b+/LyQ/GSdZl/OD2n7rDo7VM1Y8OfTwx7XKrr9I12uewvSFsXTxujKfbUoZKrqJ4/ninnKXuos
 IC/Q6he0=
X-Google-Smtp-Source: AGHT+IG71FMGRyiv4mH56x2l3ar2LR8avIi/yv9IH3AmHHF/clful2q3Uy7KDSjam8AZJ3mZxK8wvg==
X-Received: by 2002:a05:600c:3657:b0:43b:baf7:76e4 with SMTP id
 5b1f17b1804b1-43bdb368d0emr7700425e9.1.1741211429755; 
 Wed, 05 Mar 2025 13:50:29 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bd4310779sm29158675e9.37.2025.03.05.13.50.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 13:50:28 -0800 (PST)
Date: Wed, 5 Mar 2025 21:50:27 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Vincent Mailhol <mailhol.vincent@wanadoo.fr>, Yury Norov
 <yury.norov@gmail.com>, Lucas De Marchi <lucas.demarchi@intel.com>, Rasmus
 Villemoes <linux@rasmusvillemoes.dk>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 David Laight <David.Laight@aculab.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v4 4/8] bits: introduce fixed-type BIT
Message-ID: <20250305215027.5d9be1fa@pumpkin>
In-Reply-To: <Z8isZodEqhZw5p7-@smile.fi.intel.com>
References: <20250305-fixed-type-genmasks-v4-0-1873dcdf6723@wanadoo.fr>
 <20250305-fixed-type-genmasks-v4-4-1873dcdf6723@wanadoo.fr>
 <Z8hgqOB5Ym-GGykS@smile.fi.intel.com>
 <d7f3150d-0167-44be-90b2-17f8a050687c@wanadoo.fr>
 <Z8hyNXVZxLzhEzNy@smile.fi.intel.com>
 <824dc1d1-14f0-433e-aa3f-679527b87077@wanadoo.fr>
 <Z8isZodEqhZw5p7-@smile.fi.intel.com>
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

On Wed, 5 Mar 2025 21:56:22 +0200
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Thu, Mar 06, 2025 at 02:17:18AM +0900, Vincent Mailhol wrote:
> > On 06/03/2025 at 00:48, Andy Shevchenko wrote: =20
> > > On Wed, Mar 05, 2025 at 11:48:10PM +0900, Vincent Mailhol wrote: =20
> > >> On 05/03/2025 at 23:33, Andy Shevchenko wrote: =20
> > >>> On Wed, Mar 05, 2025 at 10:00:16PM +0900, Vincent Mailhol via B4 Re=
lay wrote: =20
>=20
> ...
>=20
> > >>>> +#define BIT_U8(b) (BIT_INPUT_CHECK(u8, b) + (unsigned int)BIT(b))
> > >>>> +#define BIT_U16(b) (BIT_INPUT_CHECK(u16, b) + (unsigned int)BIT(b=
)) =20
> > >>>
> > >>> Why not u8 and u16? This inconsistency needs to be well justified. =
=20
> > >>
> > >> Because of the C integer promotion rules, if casted to u8 or u16, the
> > >> expression will immediately become a signed integer as soon as it is=
 get
> > >> used. For example, if casted to u8
> > >>
> > >>   BIT_U8(0) + BIT_U8(1)
> > >>
> > >> would be a signed integer. And that may surprise people. =20
> > >=20
> > > Yes, but wouldn't be better to put it more explicitly like
> > >=20
> > > #define BIT_U8(b)	(BIT_INPUT_CHECK(u8, b) + (u8)BIT(b) + 0 + UL(0)) /=
/ + ULL(0) ? =20
> >=20
> > OK, the final result would be unsigned. But, I do not follow how this is
> > more explicit.
> >=20
> > Also, why doing:
> >=20
> >   (u8)BIT(b) + 0 + UL(0)
> >=20
> > and not just:
> >=20
> >   (u8)BIT(b) + UL(0)
> >=20
> > ?
> >=20
> > What is that intermediary '+ 0' for?
> >=20
> > I am sorry, but I=C2=A0am having a hard time understanding how casting =
to u8
> > and then doing an addition with an unsigned long is more explicit than
> > directly doing a cast to the desired type. =20
>=20
> Reading this again, I think we don't need it at all. u8, aka unsigned cha=
r,
> will be promoted to int, but it will be int with a value < 256, can't be =
signed
> as far as I understand this correctly.

The value can't be negative, but the type will be a signed one.
Anything comparing types (and there are a few) will treat it as signed.
It really is bad practise to even pretend you can have an expression
(rather that a variable) that has a type smaller than 'int'.
It wouldn't surprise me if even an 'a =3D b' assignment promotes 'b' to int.

So it is even questionable whether BIT8() and BIT16() should even exist at =
all.
There can be reasons to return 'unsigned int' rather than 'unsigned long'.
But with the type definitions that Linux uses (and can't really be changed)
you can have BIT32() that is 'unsigned int' and BIT64() that is 'unsigned l=
ong
long'. These are then the same on 32bit and 64bit.

	David=20

