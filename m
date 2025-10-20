Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 785BABF226D
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 17:40:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9638410E472;
	Mon, 20 Oct 2025 15:40:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="KBL/eZfM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D73010E472
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 15:40:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1760974820; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Ai6yEfvevnlicRnC6hUZILro9Xj58jvdixOTEejaTJAezMeYe2ReXvP5lgDe/WINSHWappBOFgEKq2//QLzV3b+ybSJd1N53dm9QBOeZUyqBWjfDkjkemswx40u7RhWcRhpjoxq72o2qvG8MdqeHNz7E7o1wMCgC4ipN2l4sh+s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1760974820;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=md/pBzoYcFzUHz80KevulIkZ5BiZWUg/YH97ioL+0fI=; 
 b=HdM+49AnxQEKmoKUYQiZRIpVoAcA/DC0xlvRuxm8uf3W/fbDEia6nOs7GWoOtzoYE/UGda73iO9UBeIe/TCmPXDp0tkYKHbb1X3UKJZ0s7dPQMKxEWoXpALSm1wZ6mM2D4paCoug77yh/yogs5AUlLFDy+Dezq7mT6gkz4+RGiQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1760974820; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=md/pBzoYcFzUHz80KevulIkZ5BiZWUg/YH97ioL+0fI=;
 b=KBL/eZfMEc9QO++XN/8UsD5kyy7gAS7vSEROcPEP17Q3eWx1vZVA4+k0asFa5R0J
 sTiiTblJtBEBMOtWvm98i8Kz/P/1W/M+5ncofRvrtjwyn46hZcH0B0AclLDJgq63STK
 5Y/3Su2IZ1it6kk4ifqtXzfZAmYnm6mnjyTd48zQ=
Received: by mx.zohomail.com with SMTPS id 1760974819040413.8982192024972;
 Mon, 20 Oct 2025 08:40:19 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [RESEND PATCH v18 13/16] rust: regulator: use `CStr::as_char_ptr`
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20251018-cstr-core-v18-13-9378a54385f8@gmail.com>
Date: Mon, 20 Oct 2025 12:39:52 -0300
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 =?utf-8?Q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Christian Brauner <brauner@kernel.org>,
 Carlos Llamas <cmllamas@google.com>,
 Suren Baghdasaryan <surenb@google.com>, Jens Axboe <axboe@kernel.dk>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Uladzislau Rezki <urezki@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 =?utf-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Breno Leitao <leitao@debian.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org,
 llvm@lists.linux.dev, Tamir Duberstein <tamird@gmail.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <C487CA8E-E8B6-4294-8081-D629DDD80253@collabora.com>
References: <20251018-cstr-core-v18-0-9378a54385f8@gmail.com>
 <20251018-cstr-core-v18-13-9378a54385f8@gmail.com>
To: Tamir Duberstein <tamird@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External
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



> On 18 Oct 2025, at 16:16, Tamir Duberstein <tamird@kernel.org> wrote:
>=20
> From: Tamir Duberstein <tamird@gmail.com>
>=20
> Replace the use of `as_ptr` which works through `<CStr as
> Deref<Target=3D&[u8]>::deref()` in preparation for replacing
> `kernel::str::CStr` with `core::ffi::CStr` as the latter does not
> implement `Deref<Target=3D&[u8]>`.
>=20
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
> rust/kernel/regulator.rs | 9 ++++++---
> 1 file changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/rust/kernel/regulator.rs b/rust/kernel/regulator.rs
> index b55a201e5029..65a4eb096cae 100644
> --- a/rust/kernel/regulator.rs
> +++ b/rust/kernel/regulator.rs
> @@ -84,7 +84,7 @@ pub struct Error<State: RegulatorState> {
> pub fn devm_enable(dev: &Device<Bound>, name: &CStr) -> Result {
>     // SAFETY: `dev` is a valid and bound device, while `name` is a =
valid C
>     // string.
> -    to_result(unsafe { =
bindings::devm_regulator_get_enable(dev.as_raw(), name.as_ptr()) })
> +    to_result(unsafe { =
bindings::devm_regulator_get_enable(dev.as_raw(), name.as_char_ptr()) })
> }
>=20
> /// Same as [`devm_enable`], but calls =
`devm_regulator_get_enable_optional`
> @@ -102,7 +102,9 @@ pub fn devm_enable(dev: &Device<Bound>, name: =
&CStr) -> Result {
> pub fn devm_enable_optional(dev: &Device<Bound>, name: &CStr) -> =
Result {
>     // SAFETY: `dev` is a valid and bound device, while `name` is a =
valid C
>     // string.
> -    to_result(unsafe { =
bindings::devm_regulator_get_enable_optional(dev.as_raw(), =
name.as_ptr()) })
> +    to_result(unsafe {
> +        bindings::devm_regulator_get_enable_optional(dev.as_raw(), =
name.as_char_ptr())
> +    })
> }
>=20
> /// A `struct regulator` abstraction.
> @@ -268,7 +270,8 @@ pub fn get_voltage(&self) -> Result<Voltage> {
>     fn get_internal(dev: &Device, name: &CStr) -> Result<Regulator<T>> =
{
>         // SAFETY: It is safe to call `regulator_get()`, on a device =
pointer
>         // received from the C code.
> -        let inner =3D from_err_ptr(unsafe { =
bindings::regulator_get(dev.as_raw(), name.as_ptr()) })?;
> +        let inner =3D
> +            from_err_ptr(unsafe { =
bindings::regulator_get(dev.as_raw(), name.as_char_ptr()) })?;
>=20
>         // SAFETY: We can safely trust `inner` to be a pointer to a =
valid
>         // regulator if `ERR_PTR` was not returned.
>=20
> --=20
> 2.51.1
>=20
>=20

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

