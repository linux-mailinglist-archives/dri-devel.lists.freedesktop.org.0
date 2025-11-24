Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 065B8C81517
	for <lists+dri-devel@lfdr.de>; Mon, 24 Nov 2025 16:25:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5761210E2EE;
	Mon, 24 Nov 2025 15:25:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="Cu2ATwBE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender3-pp-f112.zoho.com (sender3-pp-f112.zoho.com
 [136.143.184.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A88F810E2EE
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 15:25:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1763997941; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=UI1hfli3Q69C3/K6yBopCQ7ESXI2e2Nd7mDdMIRqXoDT5+UJdqOt1EljS9gT6wGIcGNsSUN6j5YpJRlRPw4Cbcccvs7aEfZjRpy8hUxTNGS6rv8tCoiwZ0P5uKsZhgd2kcOJsTK4XCJ5Pm2mpWJkSiwWeDisG2LweuEpRukD5Ts=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1763997941;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=zvAP0rCzyafXkjCBmJbox5x2Ji8oWWUm5n8q37B7Clk=; 
 b=TvehLIeBHZVDTbd+PHqKKfR3oxPO18QbGPVBH8AgQPgAH5HA4z/DGFFH1+9AyRax7ZkSUhHeVZAwM4JDChUzox/GMpv04VjKelzV7LV5hyip3MQuFoOJgB0akjV7n/iLhqY3VEJgJAA18waXkOloUCToFeT+rEu9nWngQ/a0tXk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763997941; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=zvAP0rCzyafXkjCBmJbox5x2Ji8oWWUm5n8q37B7Clk=;
 b=Cu2ATwBEL/ND0jjLi5JELDGDQ54hE8CdVQxodV1a8MfUsXE/Fo2e7g0YEtNrZF/A
 gbf1+zwdZHCQDh3xULF1XutbbaHKbcYeeRt92x5J0tY1syNIP3K3jHmiwr3HYltBW7k
 W2PCzjV9gfLEYSywB+cU8D2UlNN/X7owyxmXD+bA=
Received: by mx.zohomail.com with SMTPS id 1763997939655515.524856708236;
 Mon, 24 Nov 2025 07:25:39 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v5 4/8] rust: gem: Introduce DriverObject::Args
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20251023212540.1141999-5-lyude@redhat.com>
Date: Mon, 24 Nov 2025 12:25:23 -0300
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>,
 linux-kernel@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Asahi Lina <lina+kernel@asahilina.net>,
 Shankari Anand <shankari.ak0208@gmail.com>,
 "open list:DRM DRIVER FOR NVIDIA GPUS [RUST]" <nouveau@lists.freedesktop.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <799528A2-B13E-4F32-9EDE-504CE5D97E63@collabora.com>
References: <20251023212540.1141999-1-lyude@redhat.com>
 <20251023212540.1141999-5-lyude@redhat.com>
To: Lyude Paul <lyude@redhat.com>
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



> On 23 Oct 2025, at 18:22, Lyude Paul <lyude@redhat.com> wrote:
>=20
> This is an associated type that may be used in order to specify a =
data-type
> to pass to gem objects when construction them, allowing for drivers to =
more
> easily initialize their private-data for gem objects.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
>=20
> ---
> V3:
> * s/BaseDriverObject/DriverObject/
> V4:
> * Fix leftover reference to BaseObjectDriver in rustdoc for
>  DriverObject::Args
>=20
> drivers/gpu/drm/nova/gem.rs |  5 +++--
> rust/kernel/drm/gem/mod.rs  | 13 ++++++++++---
> 2 files changed, 13 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nova/gem.rs b/drivers/gpu/drm/nova/gem.rs
> index 2760ba4f3450b..173077eeb2def 100644
> --- a/drivers/gpu/drm/nova/gem.rs
> +++ b/drivers/gpu/drm/nova/gem.rs
> @@ -18,8 +18,9 @@ pub(crate) struct NovaObject {}
>=20
> impl gem::DriverObject for NovaObject {
>     type Driver =3D NovaDriver;
> +    type Args =3D ();
>=20
> -    fn new(_dev: &NovaDevice, _size: usize) -> impl PinInit<Self, =
Error> {
> +    fn new(_dev: &NovaDevice, _size: usize, _args: Self::Args) -> =
impl PinInit<Self, Error> {
>         try_pin_init!(NovaObject {})
>     }
> }
> @@ -33,7 +34,7 @@ pub(crate) fn new(dev: &NovaDevice, size: usize) -> =
Result<ARef<gem::Object<Self
>             return Err(EINVAL);
>         }
>=20
> -        gem::Object::new(dev, aligned_size)
> +        gem::Object::new(dev, aligned_size, ())
>     }
>=20
>     /// Look up a GEM object handle for a `File` and return an =
`ObjectRef` for it.
> diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
> index 67813cfb0db42..d448c65fe5e13 100644
> --- a/rust/kernel/drm/gem/mod.rs
> +++ b/rust/kernel/drm/gem/mod.rs
> @@ -65,8 +65,15 @@ pub trait DriverObject: Sync + Send + Sized {
>     /// Parent `Driver` for this object.
>     type Driver: drm::Driver;
>=20
> +    /// The data type to use for passing arguments to =
[`DriverObject::new`].
> +    type Args;
> +
>     /// Create a new driver data object for a GEM object of a given =
size.
> -    fn new(dev: &drm::Device<Self::Driver>, size: usize) -> impl =
PinInit<Self, Error>;
> +    fn new(
> +        dev: &drm::Device<Self::Driver>,
> +        size: usize,
> +        args: Self::Args,
> +    ) -> impl PinInit<Self, Error>;
>=20
>     /// Open a new handle to an existing object, associated with a =
File.
>     fn open(_obj: &<Self::Driver as drm::Driver>::Object, _file: =
&DriverFile<Self>) -> Result {
> @@ -247,11 +254,11 @@ impl<T: DriverObject> Object<T> {
>     };
>=20
>     /// Create a new GEM object.
> -    pub fn new(dev: &drm::Device<T::Driver>, size: usize) -> =
Result<ARef<Self>> {
> +    pub fn new(dev: &drm::Device<T::Driver>, size: usize, args: =
T::Args) -> Result<ARef<Self>> {
>         let obj: Pin<KBox<Self>> =3D KBox::pin_init(
>             try_pin_init!(Self {
>                 obj: Opaque::new(bindings::drm_gem_object::default()),
> -                data <- T::new(dev, size),
> +                data <- T::new(dev, size, args),
>                 // INVARIANT: The drm subsystem guarantees that the =
`struct drm_device` will live
>                 // as long as the GEM object lives.
>                 dev: dev.into(),
> --=20
> 2.51.0
>=20
>=20

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>=
