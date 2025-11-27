Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3810EC8CE9A
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 07:25:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 597EF10E16A;
	Thu, 27 Nov 2025 06:25:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dVjoN0WF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEC4910E16A;
 Thu, 27 Nov 2025 06:25:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E8C52401EF;
 Thu, 27 Nov 2025 06:25:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F896C4CEF8;
 Thu, 27 Nov 2025 06:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764224704;
 bh=R4j/+SfWFPfTOjJJhvG8UmzZTElqDhpfnL+sCjoX5ro=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dVjoN0WFXDayuYp5cxV3lmaSDCsS8/DR5DXmZxjr9SYfUo89CcCyb9A2VkkqU19Ix
 1Vo+7H73aAIS4dtrRkZXC+Mk1Hp5Kc4We+YumTsTsmsLoJEDy6g5zkpHsUmNrGfh9V
 YCEH90Z8IupSR1i57GG1/6cs/aNl3egSRW/hmZJJjNN7mjwD8c84+PULfyEOwCZZci
 XExXDRNf4g/P9T2Z2OLviian/+3PnoJVBmeNY+2XZz4rN5BkN0lXCJBwSFGHCPdhjv
 Z/GCJFQsCylPBvzz0QV/WQPqFSuEQS9Fju60FfTIxkw4ouRgZHQqOh3NNLKCAGyY50
 v+ubILpjzZjLQ==
Date: Thu, 27 Nov 2025 07:25:01 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
 Shankari Anand <shankari.ak0208@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Arve =?utf-8?B?SGrDuG5uZXbDpWc=?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Christian Brauner <brauner@kernel.org>,
 Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, 
 Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Alexandre Courbot <acourbot@nvidia.com>, 
 "Rafael J . Wysocki" <rafael@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>,
 Igor Korotin <igor.korotin.linux@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-pwm@vger.kernel.org
Subject: Re: [PATCH 06/10] rust: kernel: Update ARef and AlwaysRefCounted
 imports to use sync::aref
Message-ID: <5p3nstyadh6txzo22eoerryjhegzuoeods7mscr663ipo4bi5u@ixpxt25lv5qc>
References: <20251123092438.182251-1-shankari.ak0208@gmail.com>
 <20251123092438.182251-7-shankari.ak0208@gmail.com>
 <44gv3fhqppn4fyg5fnxkhhanlbbxr2slqq7k3kr3owx7frpnxw@idgwxlcv4otn>
 <CGME20251125123134eucas1p230415281df788e787f4b71e4d7b3ac3f@eucas1p2.samsung.com>
 <CANiq72mQ4cu9wehGKxS92EK2H3kcX8XPpRmv2DdYmn6Ve9iDAw@mail.gmail.com>
 <cca5c7e8-d9c4-4e28-8da2-62dd521ceea3@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vfuv755wwcx3lvvj"
Content-Disposition: inline
In-Reply-To: <cca5c7e8-d9c4-4e28-8da2-62dd521ceea3@samsung.com>
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


--vfuv755wwcx3lvvj
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 06/10] rust: kernel: Update ARef and AlwaysRefCounted
 imports to use sync::aref
MIME-Version: 1.0

Hello,

On Wed, Nov 26, 2025 at 12:34:23PM +0100, Michal Wilczynski wrote:
> On 11/25/25 13:31, Miguel Ojeda wrote:
> > On Mon, Nov 24, 2025 at 5:10=E2=80=AFPM Uwe Kleine-K=C3=B6nig
> > <u.kleine-koenig@baylibre.com> wrote:
> >>
> >> having no clue about Rust:
> >>
> >> Can this patch be applied independent of the others via the pwm tree? =
If
> >> I understand correctly it's only patch #10 that depends on the previous
> >> patches, right?
> >>
> >> Is there already a merge plan for this series?
> >=20
> > Yeah, if subsystems pick the independent patches at their own pace,
> > then that is great, so please do!
> >=20
> > Then, after 1 or 2 cycles, we can do the flag day change on the Rust
> > tree (with any last changes needed Ack'd, but ideally there will be
> > none remaining).
> >=20
> > It is what did in similar cases for renaming (or moving across the
> > path hierarchy) things in Rust. For simple things that get Ack'd quick
> > enough by everyone, sometimes we may be able to take everything in the
> > Rust tree.
>=20
> I think code wise it's fine, provided the subject is fixed like Uwe sugge=
sted.
>=20
> Acked-by: Michal Wilczynski <m.wilczynski@samsung.com>

OK, I applied it to

	https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for=
-nexxt

=2E I will rebase this branch to v6.19-rc1 once that's released and then
send it to Linus for v6.20-rc1 (assuming he has so many fingers and toes
to not switch to 7.0 before :-).

If it turns out to go in via the rust tree, tell me, then I'll drop it.
In that case take my

Acked-by: Uwe Kleine-K=C3=B6nig <ukleinek@kernel.org>

Best regards and thanks for the patch and the reviews,
Uwe

--vfuv755wwcx3lvvj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmkn7roACgkQj4D7WH0S
/k6ZHwf+Noz5chJYLoR5w2W8NQkWrDZTPRSGfLRgyvS2Ips8wejkfM7vURYuz3d4
uxK4jTwvI8zJhG3Y6yDSgjZqAjPq1wX5xOy1AGKOJvBUNn+T6P4vgxkhbNOG8o1R
NU5jowT5s1Kg15tbR7yBxCkHUiJlBSgMHHYiRNZyl/i/RtjgUzDKELZq7bF2WyF0
LTdzLQrDUm1MwnMAEjJLOsavVruTRiSuPhx/DeknD56cASrCzieJENj0nrFlYQac
whEs9Yey9+fXN1xV/LJFqQnWKnzBERchqxNNjSA7NuV1eQcNpBO8Oiobtm5nCmR0
G3b2Qc7jMdTphZ2eYtG/GoiFK1RPMA==
=OFiN
-----END PGP SIGNATURE-----

--vfuv755wwcx3lvvj--
