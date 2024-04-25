Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B6C8B2595
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 17:48:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D635311A587;
	Thu, 25 Apr 2024 15:48:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=proton.me header.i=@proton.me header.b="c+vZktst";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4327.protonmail.ch (mail-4327.protonmail.ch [185.70.43.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99A3211A587
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 15:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=protonmail; t=1714059734; x=1714318934;
 bh=Wyk9bt4qzmsPvR7NHjsvjFtMkQK/718z5azMohImAFw=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=c+vZktstzqmumilwh4SmQsmw/94/34SJn1O2b/KVRNNeStAWCQdZkIrpRdbjHsHwv
 5vzX+Q3MOcdFLGkA5zjOSjrAihARVkLEaNf/ugG9lvbNiIBDmm7/CVnwQGGLXGdR5v
 fxqxjZVPSjOaMp2GlviQN5yg4n94c/XywjFe6jXI1tzV9AYxzfQdVPV9TUGBmbr0e4
 BOZOCUrY1WXBXq6QDW4yru+c0X/Ul2TIN6DYc9RgyZGC23Dyv9h6CNX0j+od1OOtA2
 lpbmqI3Jpa8+BDhPELNuhT1jIATFHcXQyRdetphKhCj2pLJa5nAFgJVgXTFw8Xy0yx
 e96rVEXYBFKyw==
Date: Thu, 25 Apr 2024 15:42:06 +0000
To: Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org
From: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>,
 Asahi Lina <lina@asahilina.net>,
 Martin Rodriguez Reboredo <yakoyoku@gmail.com>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Danilo Krummrich <dakr@redhat.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 1/4] WIP: rust: Add basic KMS bindings
Message-ID: <c28a17d4-ea8e-4d35-9c7a-3b796ef7409d@proton.me>
In-Reply-To: <9fd1fea40f5d053e371bd076d9cb095ba3d77d93.camel@redhat.com>
References: <20240322221305.1403600-1-lyude@redhat.com>
 <20240322221305.1403600-2-lyude@redhat.com>
 <0785452f-7714-4384-838b-879e0b224c3c@proton.me>
 <9fd1fea40f5d053e371bd076d9cb095ba3d77d93.camel@redhat.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 1e089611015051b5d61a372ac5af4555d099dc5c
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

On 22.04.24 03:47, Lyude Paul wrote:
> On Wed, 2024-03-27 at 20:50 +0000, Benno Lossin wrote:
>> Hi,
>>
>> I just took a quick look and commented on the things that stuck
>> out to me. Some general things:
>> - several `unsafe` blocks have missing SAFETY comments,
>> - missing documentation and examples.
>=20
> This is really early on - so I had wanted to post a WIP before I
> actually wrote up everything to make sure I'm going in the right
> direction (I'm certainly not planning on leaving things undocumented
> when this is actually ready for submission :).

No worries, I just wanted to point out everything that I found.

One thing that I missed was your "RFC WIP" in your cover letter. I think
that it's a good idea to put "RFC" onto every patch, that way people
without context immediately know that it is not yet ready.

--=20
Cheers,
Benno

