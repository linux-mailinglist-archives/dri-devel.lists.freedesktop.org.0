Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E04ECAFF430
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 23:58:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE97A10E111;
	Wed,  9 Jul 2025 21:58:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HF7v+HHj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 761B710E0DF;
 Wed,  9 Jul 2025 21:58:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1514746198;
 Wed,  9 Jul 2025 21:58:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74C68C4CEEF;
 Wed,  9 Jul 2025 21:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752098308;
 bh=zjFlENAgBdh7xP1fuuUD0RuYSpO5zOXpYVPNVEcU4zg=;
 h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
 b=HF7v+HHj1/uWYrZ1jHPBmeinlOFXd700YJB/0ji8rRD5yDDGO2vc4Zmp3mIQ1eZrJ
 dp32A945DkIzZftJkqzV/nrGFQPURiSIYC3nwMmCaWYInptJZsU9hjWMZTg+ay6gXe
 P7m1scf30QQMKycBWbPTIpa4yEGP9Zu/McyS3TIIgvBJTmi9TMYJtnyo9iREx4G/LD
 0qNjId+h+yzw3HhhgiXqsCKYA0O6XamG+OuGd2KI+D3jI3n8aHE9/hRLnryDnnBg84
 zdQ0kiNXyPfZyNIyJPLJUlKCkSoc4ivbeUTyBJITG+QmdoSnpRXn/WztQ1n8dEf4SD
 QndKJGpaSnYXA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Jul 2025 23:58:22 +0200
Message-Id: <DB7V0GL2HVMV.BR1JSWQPDMC3@kernel.org>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Jens Axboe" <axboe@kernel.dk>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Brendan Higgins" <brendan.higgins@linux.dev>, "David
 Gow" <davidgow@google.com>, "Rae Moar" <rmoar@google.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-block@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <kunit-dev@googlegroups.com>
Subject: Re: [PATCH 7/9] rust: pin-init: use `kernel::{fmt,prelude::fmt!}`
From: "Benno Lossin" <lossin@kernel.org>
To: "Tamir Duberstein" <tamird@gmail.com>
X-Mailer: aerc 0.20.1
References: <20250709-core-cstr-fanout-1-v1-0-64308e7203fc@gmail.com>
 <20250709-core-cstr-fanout-1-v1-7-64308e7203fc@gmail.com>
 <DB7SVTBZ46QB.31WTHFLWDHPZY@kernel.org>
 <CAJ-ks9nNc_pThtb+gHUcjEnvR6V0RAEG0tkv+_DHYYjXs1N7=A@mail.gmail.com>
In-Reply-To: <CAJ-ks9nNc_pThtb+gHUcjEnvR6V0RAEG0tkv+_DHYYjXs1N7=A@mail.gmail.com>
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

On Wed Jul 9, 2025 at 11:01 PM CEST, Tamir Duberstein wrote:
> On Wed, Jul 9, 2025 at 4:18=E2=80=AFPM Benno Lossin <lossin@kernel.org> w=
rote:
>>
>> On Wed Jul 9, 2025 at 10:00 PM CEST, Tamir Duberstein wrote:
>> > Reduce coupling to implementation details of the formatting machinery =
by
>> > avoiding direct use for `core`'s formatting traits and macros.
>> >
>> > Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
>> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
>> > ---
>> >  rust/kernel/init.rs | 4 ++--
>> >  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> I usually prefix patches to init.rs with `rust: init`. I'll fix it up
>> when picking the patch or Miguel can do it if he takes it:
>>
>> Acked-by: Benno Lossin <lossin@kernel.org>
>
> Actually, squinting at this patch more closely now, I think this isn't
> what you had in mind. The comment says "Dummy error that can be
> constructed outside the `kernel` crate." but the error now comes from
> the kernel crate :(

It's a re-export, so the comment still holds.

> Perhaps you could suggest a different modification that would both
> meet the original intent and allow references to core::fmt to
> disappear?

The code comes from a time when `Error::from_errno` was `pub(crate)`,
but that was changed some time ago... Now we can just remove the
`FromErrno` trait entirely from that example. Feel free to do that in
this series or as a standalone patch.

---
Cheers,
Benno
