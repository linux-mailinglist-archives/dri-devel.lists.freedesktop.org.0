Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8575578D676
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 16:19:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBA67895B9;
	Wed, 30 Aug 2023 14:19:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C211E895B9
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 14:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693405176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GV/8QzaCRMszcMvgwKB+jPm2RB1o5GXV7tIF+sEGovU=;
 b=irJ9KyFgKaOyy+5yyRFp3KbEW2Qu4Kmgb4rDuqWYJlME5zBfoeQ09EiidD9g+ktndTXbYZ
 Cl1SrPseaeKJGELTiK1o7t5PSMg4j4xTRKhCCVMvFsupx8RgxZwQWggxXXwA1XjGFVrqw/
 r/vE38Mb/U0MO1eOEdUCpNLidsPmajw=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-Fz_SLBGdN9-Sx6Knt8_wtw-1; Wed, 30 Aug 2023 10:19:35 -0400
X-MC-Unique: Fz_SLBGdN9-Sx6Knt8_wtw-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-9a21e030751so61810866b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 07:19:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693405174; x=1694009974;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GV/8QzaCRMszcMvgwKB+jPm2RB1o5GXV7tIF+sEGovU=;
 b=S/pvCuwrDr6YCH2SnoH8QabPB8/zcT9MaSkJvvsoQFwhALRFBQEWBf0TJC9SJjaZah
 ddWgavsfNZ5mH8VlmxPw+Wko6q7JxL1BFJtmE7qYFOo1h5IWW2Zb4Gn5NiNewG5Jp6ga
 YbIjwUPBaBy9jNuy1GOl5AIvxdPiyOIytZ/eZPvIBADd8gTNtTlGsUq6HMQxd7fu86uG
 7vVgRgzlobcig9yDNTHiQ2Hd4TsCIda3S0tIfghO8CZxlMMbvr+OxmO9ZmR6pVh78GUl
 63DWI2Wjyo125NfjiLORk67zLR8jlvIHaIncA97x1R7aY4bLydFPZvzIh4TwWqK4QZt1
 eDsA==
X-Gm-Message-State: AOJu0Yyzoy54r34zXlo65mj2LOlFr4/EGB95RYu/xHPwrSstXLeEVLhb
 t0VUxu6X/6RgI5WpUvO68Urwf/lXFB7P059Irbe+iM9r4pOEVazSeclumzb3sDqbuko89v6lYVR
 au3nRQHtzbpe7NneXEZLnlWWgL7rG
X-Received: by 2002:a17:906:739c:b0:9a1:c951:19f3 with SMTP id
 f28-20020a170906739c00b009a1c95119f3mr1414678ejl.0.1693405174419; 
 Wed, 30 Aug 2023 07:19:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzgX4N7o6LrqPe58Ba+4el88eUYu7+fOIk9nSYCp19l8FNrUVkg7t2XIL0g9pv34yH61rp8Q==
X-Received: by 2002:a17:906:739c:b0:9a1:c951:19f3 with SMTP id
 f28-20020a170906739c00b009a1c95119f3mr1414658ejl.0.1693405174044; 
 Wed, 30 Aug 2023 07:19:34 -0700 (PDT)
Received: from ?IPv6:2001:9e8:32e4:1500:aa40:e745:b6c9:7081?
 ([2001:9e8:32e4:1500:aa40:e745:b6c9:7081])
 by smtp.gmail.com with ESMTPSA id
 ck17-20020a170906c45100b009a1a5a7ebacsm7182791ejb.201.2023.08.30.07.19.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Aug 2023 07:19:33 -0700 (PDT)
Message-ID: <721a70c347d82931d12e5b75b19d132f82ee5ed2.camel@redhat.com>
Subject: Re: [PATCH 1/5] string.h: add array-wrappers for (v)memdup_user()
From: pstanner@redhat.com
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 30 Aug 2023 16:19:32 +0200
In-Reply-To: <CAHp75VfkzV-=XuEZwipYzfHNu4EXuwzbu6vfEKh1Uueseo2=wA@mail.gmail.com>
References: <cover.1693386602.git.pstanner@redhat.com>
 <46f667e154393a930a97d2218d8e90286d93a062.1693386602.git.pstanner@redhat.com>
 <CAHp75VfkzV-=XuEZwipYzfHNu4EXuwzbu6vfEKh1Uueseo2=wA@mail.gmail.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Andy Shevchenko <andy@kernel.org>, Christian Brauner <brauner@kernel.org>,
 Siddh Raman Pant <code@siddh.me>, Kees Cook <keescook@chromium.org>,
 kexec@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 linux-hardening@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 Eric Biederman <ebiederm@xmission.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@redhat.com>,
 David Disseldorp <ddiss@suse.de>, Nick Alcock <nick.alcock@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2023-08-30 at 17:11 +0300, Andy Shevchenko wrote:
> On Wed, Aug 30, 2023 at 4:46=E2=80=AFPM Philipp Stanner <pstanner@redhat.=
com>
> wrote:
> >=20
> > Currently, user array duplications are sometimes done without an
> > overflow check. Sometimes the checks are done manually; sometimes
> > the
> > array size is calculated with array_size() and sometimes by
> > calculating
> > n * size directly in code.
> >=20
> > Introduce wrappers for arrays for memdup_user() and vmemdup_user()
> > to
> > provide a standardized and safe way for duplicating user arrays.
> >=20
> > This is both for new code as well as replacing usage of
> > (v)memdup_user()
> > in existing code that uses, e.g., n * size to calculate array
> > sizes.
>=20
> ...
>=20
> > --- a/include/linux/string.h
> > +++ b/include/linux/string.h
>=20
> I'm wondering if this has no side-effects as string.h/string.c IIRC
> is
> used also for early stages where some of the APIs are not available.
>=20
> > @@ -6,6 +6,8 @@
> > =C2=A0#include <linux/types.h>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* f=
or size_t */
> > =C2=A0#include <linux/stddef.h>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* for NU=
LL */
> > =C2=A0#include <linux/errno.h>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* f=
or E2BIG */
> > +#include <linux/overflow.h>=C2=A0=C2=A0=C2=A0 /* for check_mul_overflo=
w() */
> > +#include <linux/err.h>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 /* for ERR_PTR() */
>=20
> Can we preserve order (to some extent)?

Sure. I just put it there so the comments build a congruent block.
Which order would you prefer?

>=20
> > =C2=A0#include <linux/stdarg.h>
> > =C2=A0#include <uapi/linux/string.h>
>=20
> ...
>=20
> > +/**
> > + * memdup_array_user - duplicate array from user space
>=20
> > + *
>=20
> Do we need this blank line?

I more or less directly copied the docstring format from the original
functions (v)memdup_user() in mm/util.c
I guess this is common style?

>=20
> > + * @src: source address in user space
> > + * @n: number of array members to copy
> > + * @size: size of one array member
> > + *
> > + * Return: an ERR_PTR() on failure.=C2=A0 Result is physically
> > + * contiguous, to be freed by kfree().
> > + */
>=20
> ...
>=20
> > +/**
> > + * vmemdup_array_user - duplicate array from user space
>=20
> > + *
>=20
> Redundant?

No, there are two functions:
 * memdup_array_user()
 * vmemdup_array_user()

On the deeper layers they utilize kmalloc() or kvmalloc(),
respectively.


Greetings,
P.

>=20
> > + * @src: source address in user space
> > + * @n: number of array members to copy
> > + * @size: size of one array member
> > + *
> > + * Return: an ERR_PTR() on failure.=C2=A0 Result may be not
> > + * physically contiguous.=C2=A0 Use kvfree() to free.
> > + */
>=20

