Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E23CBA568E8
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 14:27:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B79F48826D;
	Fri,  7 Mar 2025 13:27:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Gd6ot5mL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BAAA8826D;
 Fri,  7 Mar 2025 13:27:48 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-390e3b3d3f4so953379f8f.2; 
 Fri, 07 Mar 2025 05:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741354066; x=1741958866; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=85pEC8KCcI89C4WR+hGbDu9vRGoE5Gebzb+PlByP0LU=;
 b=Gd6ot5mLYp9ZYF33Ury7FcLxMZeNWq5gKw5C6A/gMw5VA7XTxA9gPhdsTJu7i0CuUx
 wh2mOf8uig9oLNK1R4bkIbbawO5fUWhHKpRoJGwkAcig4nGq+Ccv7tz8PjLeZsE1xcSW
 Tqn6zf3WHdOx5AzOhB1yH6um9kGWCFUZFde36SDThWpOlW4zY8lI4+06DkVRMfdMh4Md
 gjp9X6dxH70f/ggIoA/IPbkJ8s9Aj5zv3ha1tvrlm3ErPxv7K0KAH9H1kOYDfr7C+Qx5
 nYAhTNzCuQrtohWQl7bqM0LSBvxaxy9npz1bQCh4PEbgJtzKzmifBy7rte2vXeIQHSsC
 ivWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741354066; x=1741958866;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=85pEC8KCcI89C4WR+hGbDu9vRGoE5Gebzb+PlByP0LU=;
 b=eSfjKwYe51QdypegSlt57+HzWw+DBVDwNTaw4zR3NoNW79lJMnuyGk776VROc/LXRF
 9sbwIYfAgKsgPVLqbWU0wrN/QZpq1o0xpJflQxQCCSoyVH87hP8pr7tNeMmULM6VjMPC
 r3J6pwynAXv2jpV4/VvRkN9KmnS+A0tra3qCUTpBGQtq0TXMVEmf9OE2fg3sXKHgxXXG
 n3BFUEJHOiU7Gul+RPBM+5D+5wHKx5a1unFaVB0OTnVIhovJcMA6qZHf6H1uYCfBHJ38
 H3gwWBwhxcjGm28qqL6UY0W0C0d1NK3MUhxim1rmsAUoAbYF9h5VDTcCo+yUK8BPL0ZO
 cn0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpKaCDWF7lbMl5bCTdXYcW+EQjaWZmgAMEPPenYOkjr5wOHUapd4txe2Q5jEFursk8HpkxHNkiAbg+@lists.freedesktop.org,
 AJvYcCXyOA6abWZJnu1871h9vYUDeSjKD7RoAM8Dn1RONLFgHuxM68AGswh0LFxTVyh0B8qHAY4aYsAI6hk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzCbjlvMEMruNbbpXEAY0MkOZkyEarXIHWy9mN3BYTH0qemcq+f
 wteFAlRZ1I/pUdyQLl4DyTHylapGvwU23MG7VpC9F2Oex9l2W/7t
X-Gm-Gg: ASbGncv/N4jpjfXIXDzcTHZ/P2lbdDd31uQTm3kcuQUZ9D/JKPxJmqkGirB5mlINFO4
 1IBlxJww4plEuDQyN00Y167ySxleAnW8oulHqB2nhh4ERlHAQckcrUS49hmgLcQfMM+fsD9k5lP
 L/PR8Wu+gaHGlnKAJPMtPKXo8IS5libIhXwGufMX/A0MOfNGbkiM2SgA/AxDbDpVz9En2DK+6MX
 uZ1oFIBeBHzBGmmwUK7wpcVtpTE33fx8gC+QMfffIS4VEZroGKkaxvQRqM76HF6uOaihA1ky0/8
 ZJh2I6d8IjXnRGDBNrGCP6YXtDJ4+3e8y7d0MhYEOlHl9mb220SCT4v35RTlAP/nOOsm2+ux7Vi
 P12aWRRg=
X-Google-Smtp-Source: AGHT+IFrmws0QRJibrAQb0TzahsD1hhkLY5E++lh2fAWSvEQc4XtAQW0XxSrln4LJs/Uja5JO15rng==
X-Received: by 2002:a05:6000:4103:b0:391:3988:1c7c with SMTP id
 ffacd0b85a97d-39139881e97mr198214f8f.24.1741354066257; 
 Fri, 07 Mar 2025 05:27:46 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bd4352fa3sm80977135e9.30.2025.03.07.05.27.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 05:27:45 -0800 (PST)
Date: Fri, 7 Mar 2025 13:27:42 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: Yury Norov <yury.norov@gmail.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 David Laight <David.Laight@ACULAB.COM>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v5 1/7] bits: split the definition of the asm and
 non-asm GENMASK()
Message-ID: <20250307132742.150a3a77@pumpkin>
In-Reply-To: <bdce7d99-7f02-4667-acda-9ffc62c92af2@wanadoo.fr>
References: <20250306-fixed-type-genmasks-v5-0-b443e9dcba63@wanadoo.fr>
 <20250306-fixed-type-genmasks-v5-1-b443e9dcba63@wanadoo.fr>
 <20250306192331.2701a029@pumpkin>
 <bdce7d99-7f02-4667-acda-9ffc62c92af2@wanadoo.fr>
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

On Fri, 7 Mar 2025 18:58:08 +0900
Vincent Mailhol <mailhol.vincent@wanadoo.fr> wrote:

> On 07/03/2025 at 04:23, David Laight wrote:
> > On Thu, 06 Mar 2025 20:29:52 +0900
> > Vincent Mailhol via B4 Relay <devnull+mailhol.vincent.wanadoo.fr@kernel=
.org> wrote:
> >  =20
> >> From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> >>
> >> In an upcoming change, GENMASK() and its friends will indirectly
> >> depend on sizeof() which is not available in asm.
> >>
> >> Instead of adding further complexity to __GENMASK() to make it work
> >> for both asm and non asm, just split the definition of the two
> >> variants. =20
> > ... =20
> >> +#else /* defined(__ASSEMBLY__) */
> >> +
> >> +#define GENMASK(h, l)		__GENMASK(h, l)
> >> +#define GENMASK_ULL(h, l)	__GENMASK_ULL(h, l) =20
> >=20
> > What do those actually expand to now?
> > As I've said a few times both UL(0) and ULL(0) are just (0) for __ASSEM=
BLY__
> > so the expansions of __GENMASK() and __GENMASK_ULL() contained the
> > same numeric constants. =20
>=20
> Indeed, in asm, the UL(0) and ULL(0) expands to the same thing: 0.
>=20
> But the two macros still expand to something different on 32 bits
> architectures:
>=20
>   * __GENMASK:
>=20
>       (((~(0)) << (l)) & (~(0) >> (32 - 1 - (h))))
>=20
>   * __GENMASK_ULL:
>=20
>       (((~(0)) << (l)) & (~(0) >> (64 - 1 - (h))))
>=20
> On 64 bits architecture these are the same.

If the assembler is naive and uses the cpu shift instruction for the >>
then a lot of cpu (including all x86 since the 286) mask off the high bits.
So __GENMASK_ULL() may well generate the expected pattern - provided it
is 32bits wide.

>=20
> > This means they should be generating the same values.
> > I don't know the correct 'sizeof (int_type)' for the shift right of ~0.
> > My suspicion is that a 32bit assembler used 32bit signed integers and a
> > 64bit one 64bit signed integers (but a 32bit asm on a 64bit host might
> > be 64bit).
> > So the asm versions need to avoid the right shift and only do left shif=
ts.
> >=20
> > Which probably means they need to be enirely separate from the C versio=
ns.
> > And then the C ones can have all the ULL() removed. =20
>=20
> In this v5, I already have the ULL() removed from the non-uapi C
> version. And we are left with two distinct variants:
>=20
>   - the uapi C & asm
>   - the non-uapi C (including fix width)
>=20
> For the uapi ones, I do not think we can modify it without a risk of
> breaking some random userland. At least, this is not a risk I=C2=A0will t=
ake.
> And if we have to keep the __GENMASK() and __GENMASK_ULL(), then I would
> rather just reuse these for the asm variant instead of splitting further
> more and finding ourselves with three variants:
>=20
>   - the uapi C
>   - the asm
>   - the non-uapi C (including fix width)
>=20
> If __GENMASK() and __GENMASK_ULL() were not in the uapi, I would have
> agreed with you.
>=20
> If you believe that the risk of modifying the uapi GENMASK*() is low
> enough, then you can submit a patch. But I will definitely not touch
> these myself.

I don't think you'll break userspace by stopping the uapi .h working
for asm files (with __ASSEMBLER__ defined).

But someone else might have a different opinion.

>=20
>=20
> Yours sincerely,
> Vincent Mailhol
>=20

