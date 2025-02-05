Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCCCA29684
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 17:43:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBC4310E05D;
	Wed,  5 Feb 2025 16:43:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FNw6AoV4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A03D10E05D
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2025 16:43:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 26F40A43861
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2025 16:41:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CAFDC4CEDD
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2025 16:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738773795;
 bh=LnxzeaNBBEUtj9BXIHK5+BlPkmKrMSnMNW9nlPGze8c=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=FNw6AoV4lbJnUZVo+6+M+z7DuNfCTyGgcMZgQl3xJB5YBxlKKRf8rWDxquB28SIP5
 Vkn3psh0z9/sTwCh6A0bfGkUeuKp/KG85jvzjWvWs9YMT923yNgFNsP5zhiTUy1NDZ
 DEm8S4bAjFGxo9CkeISIv0IvmkQ7rY7bNQmiWFTAzhwE2ekfs1pMsqNuW5P68muvAz
 DE6krs0tkYzDd0W/bbIes0lsXQJgusPYHrhhDjNkleBECtOiV8hmztCeJfCgl05W0z
 mTjDYZpQOrcazV9JqO5B+PbFw+WMlLbAWiksQdf1ol132XY6IGwES5k3185ejw4uQL
 81LUs21fiwugQ==
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-ab7483b9bf7so115966b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Feb 2025 08:43:15 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVtdmc5Nz6zoNT0XgtTmFg9olV21uCCDKtyR8A6+F6yTPBwErHMVThEJuVTQoiocmUAiP2QXL4P1dQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5GqWJBDJ2qO2R5x1KT5D8UqcVFpsZNDAuxHPunoqs1lK2fRy+
 wCAEo9f1au3/XhvKf8d5vNAKNSheMhhTR8CMOvm4oeplz0aIPMwdJmm09/vdhjdAUx7EP5oe5Wq
 Wo0kFf/5+MFoqCZWz4M+P8bpHrA==
X-Google-Smtp-Source: AGHT+IE8RkOzCIGHeIN9KACrRk7cJI9RU88cBKMkL6N/N5/62aH9kSdjTJoESXLsiQ1IJyT2hlNFIjQJmrLmCD/FWkI=
X-Received: by 2002:a17:907:944b:b0:ab3:83c2:755a with SMTP id
 a640c23a62f3a-ab75e33da55mr373475866b.49.1738773794041; Wed, 05 Feb 2025
 08:43:14 -0800 (PST)
MIME-Version: 1.0
References: <20250204232824.3819437-1-robh@kernel.org>
 <a6ecdb6b0a50e1fe7b0293eaaed27880e99a5258.camel@collabora.com>
 <3b8147f56eb0ea1c9815102edaa023d95b2d84f7.camel@collabora.com>
In-Reply-To: <3b8147f56eb0ea1c9815102edaa023d95b2d84f7.camel@collabora.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 5 Feb 2025 10:43:02 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK_6ttLT-u-BzgOrCg=GWtNi4OP_Zw8iivXqKQ=t_ZA3Q@mail.gmail.com>
X-Gm-Features: AWEUYZnA8ntL0J0w-ctVS0DtgfypMmUxEJ-driJVUfwJfvXAvagxzVnH55NZ7jk
Message-ID: <CAL_JsqK_6ttLT-u-BzgOrCg=GWtNi4OP_Zw8iivXqKQ=t_ZA3Q@mail.gmail.com>
Subject: Re: [PATCH] drm/panthor: Convert IOCTL defines to an enum
To: Erik Faye-Lund <erik.faye-lund@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Beata Michalska <beata.michalska@arm.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
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

On Wed, Feb 5, 2025 at 8:17=E2=80=AFAM Erik Faye-Lund
<erik.faye-lund@collabora.com> wrote:
>
> On Wed, 2025-02-05 at 11:53 +0100, Erik Faye-Lund wrote:
> > On Tue, 2025-02-04 at 17:28 -0600, Rob Herring (Arm) wrote:
> > > Use an enum instead of #defines for panthor IOCTLs. This allows the
> > > header to be used with Rust code as bindgen can't handle complex
> > > defines.
> > >
> >
> >
> > Unfortunately, this goes in the opposite direction than what I was
> > asked to do here:
> >
> > https://lore.kernel.org/dri-devel/20241029140125.0607c26f@collabora.com=
/
> >
> > ...I still intend to get around to doing that, because we have
> > problems
> > with C enum and large values. I don't know if we can solve that while
> > making Rust happy without requiring C23 (which allows to specify the
> > underlying type of an enum), unfortunately...
> >
>
> Seems I misunderstood Boris, and he was referring to flags. The enums
> are of course fine to make into real enums.

Maybe we're relying on compiler specific behavior, but that's nothing
new in the kernel. This worked fine for me with both gcc and clang:

#include <stdio.h>

enum foo {
        BAR =3D (1UL << 63),
};

int main(void)
{
        printf("%lx\n", BAR);
        return 0;
}

Rob
