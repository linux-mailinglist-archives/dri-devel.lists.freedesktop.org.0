Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CF7CF431A
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 15:43:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A29A10E284;
	Mon,  5 Jan 2026 14:42:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tqZuT1CF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4D5910E284;
 Mon,  5 Jan 2026 14:42:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2C59860010;
 Mon,  5 Jan 2026 14:42:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3D77C116D0;
 Mon,  5 Jan 2026 14:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767624175;
 bh=6+8f2BT3Z4bZnc2ROvMYTb+LPX7mFTDLfErvycYF72o=;
 h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
 b=tqZuT1CFfHbPqkdofgWoAvVTM9Y9mwz2Manjn2sjc5klHUPgD5zKtW9tepNdXObTE
 lj5zcF5jCiAY/gFx+xhfP4EfRXuo8tYtKXcYtKr0aOx+zh9LPGRtyeJ5mdC0JEpWz+
 OnO4sXQINU+07aXMSjgNxUGDU/yfqxNLMlWwPLcSUPhqGp5QTOa70m6yfyU1FgB5V3
 KXminCeHSMOsPzTS8IHAqbTDk4lZ2fnffQXsWLhCpmfmedeywpDSIiJRbIM92aBPf9
 7EMb+2QjfFZ7HpifIJIOAR+aDgiZpQsB3yWCxvnpRGmcFZI4YPm9OjhxKK07LKMglq
 CWICg+IlM1R4g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 05 Jan 2026 15:42:50 +0100
Message-Id: <DFGQH1FOS007.3IG8XIBOBWTZI@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "Maurice Hieronymus" <mhi@mailbox.org>, <aliceryhl@google.com>,
 <acourbot@nvidia.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <ojeda@kernel.org>, <boqun.feng@gmail.com>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <a.hindborg@kernel.org>,
 <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] rust: macros: Add derive Display for enums
From: "Benno Lossin" <lossin@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260104200733.190494-1-mhi@mailbox.org>
 <20260104200733.190494-2-mhi@mailbox.org>
 <DFGJ8UBULO54.NRW84R2DTHIK@kernel.org>
 <DFGL2QTNH7FE.93EN71L7BXFM@kernel.org>
In-Reply-To: <DFGL2QTNH7FE.93EN71L7BXFM@kernel.org>
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

On Mon Jan 5, 2026 at 11:29 AM CET, Danilo Krummrich wrote:
> On Mon Jan 5, 2026 at 10:02 AM CET, Benno Lossin wrote:
>> On Sun Jan 4, 2026 at 9:07 PM CET, Maurice Hieronymus wrote:
>>> Add a derive macro that implements kernel::fmt::Display for enums.
>>> The macro outputs the exact variant name as written, preserving case.
>>>
>>> This supports all enum variant types: unit, tuple, and struct variants.
>>> For variants with data, only the variant name is displayed.
>>
>> I don't think we should be adding this. Display is designed for
>> user-facing output and so it should always be carefully designed and no
>> automation should exist for it.
>
> In general I agree, but simple stringification of an enum variant for a D=
isplay
> implementation is a very common use-case and it seems pretty unfortunate =
to have
> to fall back to either do the below (especially if there are a lot of enu=
m
> variants) or having to go the declarative path of doing something as in [=
1].
>
> Especially in combination with things like FromPrimitive and ToPrimitive =
it gets
> us rid of the cases where we need such declarative macro mess.
>
> Eventually, drivers will most likely implement their own proc macro for t=
his or
> repeat the declarative macro pattern over and over again.

When the definition already uses declarative macros, adding the Display
impl there is the correct way to do it IMO. If it is just a normal
definition, then a match is annoying when you have many variants.

> Maybe we should just pick a more specific name for such a derive macro th=
an
> macros::Display.
>
> Maybe something along the lines of macros::EnumVariantDisplay? We could a=
lso
> have an optional argument indicating whether it should be converted to lo=
wer /
> upper case.

I'm still skeptical about having a derive macro for `Display`. What
about adding & deriving the following trait instead:

    pub trait EnumVariantName {
        fn variant_name(&self) -> &'static str;
    }

To print this, you of course need to call the function, but it is much
more self-descriptive than printing the `Chipset` directly.

Cheers,
Benno
