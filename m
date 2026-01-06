Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D62D5CF864A
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 13:56:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE06910E3A2;
	Tue,  6 Jan 2026 12:56:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kFxA1Exw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66A7710E3A2;
 Tue,  6 Jan 2026 12:56:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 25AD64389E;
 Tue,  6 Jan 2026 12:56:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF333C116C6;
 Tue,  6 Jan 2026 12:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767704174;
 bh=sWtryoRLOPWT/n5m9Ko/0M389f3WZbdEwizETVLZoPU=;
 h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
 b=kFxA1ExwcPNw3IMSn2w193OfntXYYyMSr0GwCLycNwWYfb5vqfHqWQ5QjMAGJjR+5
 u2GooWBFoCibpcmx4lU24poJSS/skuiTv37yCrFLPgXjg6o9X3ApdLj85lkVowjOKE
 Zr9ti6o9kJUbI4AnBpIrVmhNfX2QrmUPLXdXLVwoH8V8hZdu4S9rez6jl1kYSUl+4J
 wBWhOQ3vksXlfCcF+onw60g78azpOLAl1CP/Rb/dgTwO7WqYjkluCfGGKdU06KIQw5
 sO4caRN+tnDbTk7N84CRz+48nLyitpZdpu9qbQBM+xTgDe8MFdmcbTbsBJMbHwJl6l
 eXI//XxsrhCbg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 06 Jan 2026 13:56:09 +0100
Message-Id: <DFHITWGSEB4E.QV5DTPS816XI@kernel.org>
Cc: "Gary Guo" <gary@garyguo.net>, <aliceryhl@google.com>,
 <acourbot@nvidia.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <ojeda@kernel.org>, <boqun.feng@gmail.com>,
 <bjorn3_gh@protonmail.com>, <a.hindborg@kernel.org>, <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] rust: macros: Add derive Display for enums
From: "Benno Lossin" <lossin@kernel.org>
To: "Maurice Hieronymus" <mhi@mailbox.org>, "Danilo Krummrich"
 <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260104200733.190494-1-mhi@mailbox.org>
 <20260104200733.190494-2-mhi@mailbox.org>
 <DFGJ8UBULO54.NRW84R2DTHIK@kernel.org>
 <DFGL2QTNH7FE.93EN71L7BXFM@kernel.org>
 <20260105161110.5d1ab548.gary@garyguo.net>
 <cd9d7dd56e8191eb2d61dce1c3fd88ccffcff690.camel@mailbox.org>
 <DFGZUHLJ3ALF.EZDC85ZEFJA9@kernel.org>
 <90fac786f019f06765edb7c362e96f1a19801f26.camel@mailbox.org>
In-Reply-To: <90fac786f019f06765edb7c362e96f1a19801f26.camel@mailbox.org>
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

On Tue Jan 6, 2026 at 6:56 AM CET, Maurice Hieronymus wrote:
> On Mon, 2026-01-05 at 23:03 +0100, Danilo Krummrich wrote:
>> On Mon Jan 5, 2026 at 10:11 PM CET, Maurice Hieronymus wrote:
>> > Before I start implementing, I want to reach common ground.
>> >=20
>> > In my opinion a derive macro which implements Display would be
>> > perfectly fine, as long as the name suggests what it does. So for
>> > example #[derive(DisplayEnumVariant)]. This would communicate the
>> > intent clearly to the user.
>> >=20
>> > Benno, would you be okay with that? If not, Gary and Danilo, are

I'd prefer if we stay a bit more cautious about directly deriving
`Display`. The trait with the variant name sounds like a very sensible
idea.

We can talk about this in the team in our weekly meeting, they might
change my mind :)

>> > you
>> > fine with the proposed trait implementation (e.g. the variant_name
>> > function)?
>>=20
>> Actually, it might even be reasonable to have both. In the Nova
>> driver we have
>> the case that we want to print the enum variant exactly as it is
>> defined in the
>> code and a lowercase version of the enum variant.
>>=20
>> > Are there any common use-cases where one wants to change the case
>> > of
>> > the enum variants? If not, I would not implement an argument and
>> > rather
>> > name the macro accordingly, so the intent is clear.
>>=20
>> As mentioned above, we do have a case in Nova where we also want a
>> lowercase
>> representation to construct a firmware path with.
>
> So there would be the need to have two derive macros:
>
> 1. #[derive(DisplayEnumVariant)]
> Implements Display for all enum variants as they are (original case).
>
> 2. #[derive(ImplementVariantName(Case::Lowercase))]
> Implements the mentioned trait. Case could be an Enum where one could
> choose between Case::Lowercase and Case::Original.

You'll need to use a helper attribute, something like:

    #[derive(VariantName)]
    #[variant_name(case =3D "lowercase")]

Cheers,
Benno
