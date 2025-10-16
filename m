Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EBEBE53F4
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 21:34:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EBE610EA7B;
	Thu, 16 Oct 2025 19:34:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AebdPreP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 887E610EA73;
 Thu, 16 Oct 2025 19:34:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DA55140ABE;
 Thu, 16 Oct 2025 19:34:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F1AEC4CEF1;
 Thu, 16 Oct 2025 19:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760643267;
 bh=Ycrn/j9Kon4c9DFe551NNz1Nv86a4G0sRaGbsU+C6uU=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=AebdPrePcVSwCDSuoRiSUySIPfIGs43vgdy/7bSw5aV/IQbHqWxDi5Q7mb18sHB6o
 p7IyQMPNjsOicZ/ZW+H+L6FI7sC4NbjREdAqVLhpBPKxUQZcLPQIY6gq9k2hK7STdF
 VlJqfvh/CMyBZQ5fDXOF70rSomOvOVbl6WM8nmO8o9lG/9buXpcFrnu8NZKEbsTAu8
 kV0f1tXk1CNCnLNiUeAsmDfylaVz9hf5PyfQBVp7vCm9zUILMcBZVsBgdkfRxKRcv7
 3I0rXPevdMsHYpt3BWEfeMe5v+n0epIxS+xv3+NcCRsGyTgDpKmKndJWL8WnVYn8Y3
 o3l/lU2i4Twtw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Oct 2025 21:34:20 +0200
Message-Id: <DDJZY40SO5EF.2066SEKKQ4U8I@kernel.org>
Subject: Re: [PATCH v7.1 2/4] gpu: nova-core: bitfield: Move
 bitfield-specific code from register! into new macro
Cc: "Yury Norov" <yury.norov@gmail.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "John
 Hubbard" <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "joel@joelfernandes.org" <joel@joelfernandes.org>, "Elle Rhumsaa"
 <elle@weathered-steel.dev>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "Edwin Peer" <epeer@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251016151323.1201196-1-joelagnelf@nvidia.com>
 <20251016151323.1201196-3-joelagnelf@nvidia.com> <aPEv_UO4vViOcOvN@yury>
 <2CF462DB-D2C8-473F-9D70-522E6AFEDCE4@nvidia.com>
In-Reply-To: <2CF462DB-D2C8-473F-9D70-522E6AFEDCE4@nvidia.com>
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

On Thu Oct 16, 2025 at 9:28 PM CEST, Joel Fernandes wrote:
>> On Oct 16, 2025, at 1:48=E2=80=AFPM, Yury Norov <yury.norov@gmail.com> w=
rote:
>> =EF=BB=BFOn Thu, Oct 16, 2025 at 11:13:21AM -0400, Joel Fernandes wrote:
>>> +///
>>> +/// bitfield! {
>>> +///     struct ControlReg {
>>> +///         3:0 mode as u8 ?=3D> Mode;
>>> +///         7:7 state as bool =3D> State;
>>> +///     }
>>> +/// }
>>=20
>> This notation is really unwelcome this days. It may be OK for a random
>> macro in some local driver, but doesn't really work for a global basic
>> data type:
>>=20
>> https://lore.kernel.org/all/CAHk-=3DwhoOUsqPKb7OQwhQf9H_3=3D5sXGPJrDbfQf=
wLB3Bi13tcQ@mail.gmail.com/
>>=20
>> I've already shared this link with you, and shared my concern.
>>=20
>> I realize that rust/bitfield derives the GENMASK(hi, lo) notation here,
>> and GENMASK() derives verilog or hardware specs popular notations. But
>> software people prefer lo:hi. I'm probably OK if you choose C-style
>> start:nbits, if you prefer. But let's stop this hi:lo early, please.
>>=20
>> Let me quote Linus from the link above:
>>=20
>>  It does "high, low", which is often very unintuitive, and in fact the
>>  very commit that introduced this thing from hell had to convert the
>>  sane "low,high" cases to the other way around.
>
> I agree with Linus but I disagree with comparing it with these macros.
> I agree with Linus it is oddly unreadable when used as function parameter=
s.
> But that is a different syntax. Over here we are using colons with suffic=
ient whitespace around hi:lo.

I agree with Joel here.

While I'm not super opinionated for general bitfields, for the register!()
infrastructure I very much prefer the hi:lo notation, as this is the common
notation in datasheets and TRMs.

However, if we use hi:lo, we should use it decending, i.e.:

	bitfield! {
	    struct ControlReg {
	        7:5 state as u8 =3D> State;
	        3:0 mode as u8 ?=3D> Mode;
	    }
	}

- Danilo
