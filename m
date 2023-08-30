Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE05978DEA1
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 21:15:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 063BB10E504;
	Wed, 30 Aug 2023 19:15:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4AD010E504
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 19:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693422932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yTsZyqKXCjKhOJ70mLm50QiCTy9IG31Ajtx/kBK1zM0=;
 b=RWtSWqXy2UVwIZwdcKsmS2uPukc/q5MEIyokUeaNkLcUVUOrmUQcWoCDZw5TfgN/KaC1fs
 gUbqsffgDD/lEoRLE1hBcEYN+nxxPtIeD610SpnH6wJpSLKea9Y2wo1UmesB+urZkIfSlY
 MJcIPgAmukINO7z2BhIv8s5PiZ5E3rY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-89cDEw0EPzWYzFD2Y2E8pg-1; Wed, 30 Aug 2023 15:15:31 -0400
X-MC-Unique: 89cDEw0EPzWYzFD2Y2E8pg-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-9a1be1e2b63so98312566b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 12:15:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693422930; x=1694027730;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iBV0HnyI31Hv2AWMsxadgPSfaYJpOZDq2RNuu2t2Z+8=;
 b=c+Uu8Abi4cwR72L45GFy0OILT0Zujuv7NO8GrRxZrENt1CwYxbv0vLMA1dI1rADhY9
 8uodgmMcCh9GYTEMx0DU4NUxDxf5PIVsMiT4LyetlUJFBlTSLOz9p27BjAys9iJHiuQv
 PsCUNT4rbMN2SwlUWz/+gN9DOfrKS/JdAWeJg+87SwERRJgWFJQ/n+viOuDDl16BJOXT
 JLVBnyY+LuiKvqXXuu9hJ33QT8Es6jjQM0RxUK4i67L8BlXF0rd525tkJds+HcBVVDBh
 iF5yo+NUbBEZdpDnFvQKg8BejtUR/aX/q57tkXDdCwCTH75XDGusRprOi+LZrwfoNwe8
 kXXA==
X-Gm-Message-State: AOJu0Yy4uK2aksDUKavgn9X1G5g1Sia3jt8+YU+/h8/nw00A+gtwjY1w
 qdsb/2hCwfRrdsw0q5YnU8j+8Gufg70+F8U1Npv4lrJWGiizZShbEeexeN98HvHEW/jbSx+W4fd
 4qLDEDGz7Wm7kc+NTeY9DNJ8XcjKf
X-Received: by 2002:a05:6402:51c8:b0:523:37cf:6f37 with SMTP id
 r8-20020a05640251c800b0052337cf6f37mr2290545edd.4.1693422930299; 
 Wed, 30 Aug 2023 12:15:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjUvAuvkykbuXvqA8bQi1z8q8Gj4+iVBJgsW7l3Dh0c5JlqxFhMaKRno+cvmE8+cDwXXn9mg==
X-Received: by 2002:a05:6402:51c8:b0:523:37cf:6f37 with SMTP id
 r8-20020a05640251c800b0052337cf6f37mr2290516edd.4.1693422929985; 
 Wed, 30 Aug 2023 12:15:29 -0700 (PDT)
Received: from ?IPv6:2001:9e8:32e4:1500:aa40:e745:b6c9:7081?
 ([2001:9e8:32e4:1500:aa40:e745:b6c9:7081])
 by smtp.gmail.com with ESMTPSA id
 i9-20020aa7c709000000b0052a198d8a4dsm7116533edq.52.2023.08.30.12.15.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Aug 2023 12:15:29 -0700 (PDT)
Message-ID: <a4ba0493965ad32fcf95cd6e2439096668a9ed46.camel@redhat.com>
Subject: Re: [PATCH 1/5] string.h: add array-wrappers for (v)memdup_user()
From: pstanner@redhat.com
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 30 Aug 2023 21:15:28 +0200
In-Reply-To: <CAHp75VdS=kSWnz8FzHcdrZPaeZKsQNbzjE9mNN7BDvZA_nQpaA@mail.gmail.com>
References: <cover.1693386602.git.pstanner@redhat.com>
 <46f667e154393a930a97d2218d8e90286d93a062.1693386602.git.pstanner@redhat.com>
 <CAHp75VfkzV-=XuEZwipYzfHNu4EXuwzbu6vfEKh1Uueseo2=wA@mail.gmail.com>
 <721a70c347d82931d12e5b75b19d132f82ee5ed2.camel@redhat.com>
 <CAHp75VdS=kSWnz8FzHcdrZPaeZKsQNbzjE9mNN7BDvZA_nQpaA@mail.gmail.com>
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

On Wed, 2023-08-30 at 17:29 +0300, Andy Shevchenko wrote:
> On Wed, Aug 30, 2023 at 5:19=E2=80=AFPM <pstanner@redhat.com> wrote:
> > On Wed, 2023-08-30 at 17:11 +0300, Andy Shevchenko wrote:
> > > On Wed, Aug 30, 2023 at 4:46=E2=80=AFPM Philipp Stanner
> > > <pstanner@redhat.com>
> > > wrote:
>=20
> > > > --- a/include/linux/string.h
> > > > +++ b/include/linux/string.h
> > >=20
> > > I'm wondering if this has no side-effects as string.h/string.c
> > > IIRC
> > > is
> > > used also for early stages where some of the APIs are not
> > > available.
> > >=20
> > > > @@ -6,6 +6,8 @@
> > > > =C2=A0#include <linux/types.h>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
/* for size_t */
> > > > =C2=A0#include <linux/stddef.h>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* fo=
r NULL */
> > > > =C2=A0#include <linux/errno.h>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
/* for E2BIG */
> > > > +#include <linux/overflow.h>=C2=A0=C2=A0=C2=A0 /* for check_mul_ove=
rflow() */
> > > > +#include <linux/err.h>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 /* for ERR_PTR() */
> > >=20
> > > Can we preserve order (to some extent)?
> >=20
> > Sure. I just put it there so the comments build a congruent block.
> > Which order would you prefer?
>=20
> Alphabetical.
>=20
> compiler.h
> err.h
> overflow.h
> ...the rest that is a bit unordered...
>=20
> > > > =C2=A0#include <linux/stdarg.h>
> > > > =C2=A0#include <uapi/linux/string.h>
>=20
> ...

I mean I could include my own in a sorted manner =E2=80=93 but the existing
ones are not sorted:

/* SPDX-License-Identifier: GPL-2.0 */
#ifndef _LINUX_STRING_H_
#define _LINUX_STRING_H_

#include <linux/compiler.h>=09/* for inline */
#include <linux/types.h>=09/* for size_t */
#include <linux/stddef.h>=09/* for NULL */
#include <linux/errno.h>=09/* for E2BIG */
#include <linux/stdarg.h>
#include <uapi/linux/string.h>

extern char *strndup_user(const char __user *, long);

We could sort them all, but I'd prefer to do that in a separate patch
so that this commit does not make the impression of doing anything else
than including the two new headers

Such a separate patch could also unify the docstring style, see below

>=20
> > > > +/**
> > > > + * memdup_array_user - duplicate array from user space
> > >=20
> > > > + *
> > >=20
> > > Do we need this blank line?
> >=20
> > I more or less directly copied the docstring format from the
> > original
> > functions (v)memdup_user() in mm/util.c
> > I guess this is common style?
>=20
> I think it's not. But you may grep kernel source tree and tell which
> one occurs more often with or without this (unneeded) blank line.


It seems to be very much mixed. string.h itself is mixed.
When you look at the bottom of string.h, you'll find functions such as
kbasename() that have the extra line.

That's not really a super decisive point for me, though. We can remove
the line I guess


P.


>=20
> > > > + * @src: source address in user space
> > > > + * @n: number of array members to copy
> > > > + * @size: size of one array member
> > > > + *
> > > > + * Return: an ERR_PTR() on failure.=C2=A0 Result is physically
> > > > + * contiguous, to be freed by kfree().
> > > > + */
>=20
> ...
>=20
> > > > +/**
> > > > + * vmemdup_array_user - duplicate array from user space
> > >=20
> > > > + *
> > >=20
> > > Redundant?
> >=20
> > No, there are two functions:
> > =C2=A0* memdup_array_user()
> > =C2=A0* vmemdup_array_user()
> >=20
> > On the deeper layers they utilize kmalloc() or kvmalloc(),
> > respectively.
>=20
> I guess you misunderstood my comment. I was talking about kernel doc
> (as in the previous function).
>=20
> > > > + * @src: source address in user space
> > > > + * @n: number of array members to copy
> > > > + * @size: size of one array member
> > > > + *
> > > > + * Return: an ERR_PTR() on failure.=C2=A0 Result may be not
> > > > + * physically contiguous.=C2=A0 Use kvfree() to free.
> > > > + */
>=20
>=20

