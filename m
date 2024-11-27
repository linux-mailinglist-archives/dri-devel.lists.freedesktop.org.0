Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A91EB9DAB0C
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 16:51:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B99A10E1E9;
	Wed, 27 Nov 2024 15:51:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="TmQLfqeM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DC0510E1E9
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2024 15:51:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1732722686; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=YceCFUfleDVLVuVqNZaZSf4R9oAGEkV/c1LdoG7KsstEbGT0KCBZ9LxGPOif5sZFna0RA8/e+TYrgXy2tA9/qLcVtCMC5OfOWYb9rtZLtppHICU0J5KwB9w0poAvWJv7jwVg3jU/mCLk4np+BK2PgtJoTIwkvx6top3R0MZvuBY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1732722686;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=7q+DFe+ccil4UuLk4eXxWFKTqHPcG7ZDXacnhP9DcqQ=; 
 b=moipWZypw3Chzg6E+Os0IPFmC5cVHlWHUodtVWA3tQMECz8Otp6F40btCcd8pTRHcXQgkVZ34K/O8f5IPRHYp/3WkHXXJhxx5+KlsmO8l5LCAyRorkpIRIdCr3RccQ780RcuMOB9VKfRMjiAxQAIrRQrX8DqqMoCz+EOdgDhFw0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732722686; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=7q+DFe+ccil4UuLk4eXxWFKTqHPcG7ZDXacnhP9DcqQ=;
 b=TmQLfqeM4z6PcWvRm5xeqmXGdaJtX0rtwtMnLS6SyU/DBAocjrtGO4Z5KKyWSya2
 g7pez23mGKThBR3ALGUjVPdcyGVc1a/Ox+dRrC2X/cnwvxiDh8YJvRIuWGnfvZEvGOH
 wvkxc3UcBlIXVxONrXUwFQFgu0aSIt+wPD1YWJSA=
Received: by mx.zohomail.com with SMTPS id 1732722684393678.2520263607371;
 Wed, 27 Nov 2024 07:51:24 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.200.121\))
Subject: Re: [WIP RFC v2 13/35] WIP: rust: drm/kms: Add OpaqueConnector and
 OpaqueConnectorState
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20240930233257.1189730-14-lyude@redhat.com>
Date: Wed, 27 Nov 2024 12:51:08 -0300
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Asahi Lina <lina@asahilina.net>, Danilo Krummrich <dakr@kernel.org>,
 mcanal@igalia.com, airlied@redhat.com, zhiw@nvidia.com, cjia@nvidia.com,
 jhubbard@nvidia.com, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 open list <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <C75763C3-A2A4-410F-934D-582B44A3B550@collabora.com>
References: <20240930233257.1189730-1-lyude@redhat.com>
 <20240930233257.1189730-14-lyude@redhat.com>
To: Lyude Paul <lyude@redhat.com>
X-Mailer: Apple Mail (2.3826.200.121)
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

Hi Lyude,

> On 30 Sep 2024, at 20:09, Lyude Paul <lyude@redhat.com> wrote:
>=20
> Since we allow drivers to have multiple implementations of =
DriverConnector
> and DriverConnectorState (in C, the equivalent of this is having =
multiple
> structs which embed drm_connector) - there are some situations we will =
run
> into where it's not possible for us to know the corresponding
> DriverConnector or DriverConnectorState for a given connector. The =
most
> obvious one is iterating through all connectors on a KMS device.
>=20
> So, take advantage of the various connector traits we added to =
introduce
> OpaqueConnector<> and OpaqueConnectorState<> which both can be used as =
a
> DRM connector and connector state respectively without needing to know =
the
> corresponding traits.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
>=20
> ---
>=20
> TODO:
> * Add upcast functions for these types
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
> rust/kernel/drm/kms/connector.rs | 108 +++++++++++++++++++++++++++++++
> 1 file changed, 108 insertions(+)
>=20
> diff --git a/rust/kernel/drm/kms/connector.rs =
b/rust/kernel/drm/kms/connector.rs
> index ec842ebc111ae..98ac7fb781d4e 100644
> --- a/rust/kernel/drm/kms/connector.rs
> +++ b/rust/kernel/drm/kms/connector.rs
> @@ -359,6 +359,64 @@ unsafe fn from_raw<'a>(ptr: *mut =
bindings::drm_connector) -> &'a Self {
>     T::get_modes(connector.guard(&guard), &guard)
> }
>=20
> +/// A [`struct drm_connector`] without a known [`DriverConnector`] =
implementation.
> +///
> +/// This is mainly for situations where our bindings can't infer the =
[`DriverConnector`]
> +/// implementation for a [`struct drm_connector`] automatically. It =
is identical to [`Connector`],
> +/// except that it does not provide access to the driver's private =
data.
> +///
> +/// TODO: Add upcast methods for this

You mean a way to go from OpaqueConnector to Connector?

> +///
> +/// # Invariants
> +///
> +/// - `connector` is initialized for as long as this object is =
exposed to users.
> +/// - The data layout of this type is equivalent to [`struct =
drm_connector`].
> +///
> +/// [`struct drm_connector`]: srctree/include/drm/drm_connector.h
> +#[repr(transparent)]
> +pub struct OpaqueConnector<T: KmsDriver> {
> +    connector: Opaque<bindings::drm_connector>,
> +    _p: PhantomData<T>
> +}
> +
> +impl<T: KmsDriver> Sealed for OpaqueConnector<T> {}
> +
> +impl<T: KmsDriver> AsRawConnector for OpaqueConnector<T> {
> +    type Driver =3D T;
> +    type State =3D OpaqueConnectorState<T>;
> +
> +    fn as_raw(&self) -> *mut bindings::drm_connector {
> +        self.connector.get()
> +    }
> +
> +    unsafe fn from_raw<'a>(ptr: *mut bindings::drm_connector) -> &'a =
Self {
> +        // SAFETY: Our data layout is identical to =
`bindings::drm_connector`
> +        unsafe { &*ptr.cast() }
> +    }
> +}
> +
> +impl<T: KmsDriver> ModeObject for OpaqueConnector<T> {
> +    type Driver =3D T;
> +
> +    fn drm_dev(&self) -> &Device<Self::Driver> {
> +        // SAFETY: The parent device for a DRM connector will never =
outlive the connector, and this
> +        // pointer is invariant through the lifetime of the connector
> +        unsafe { Device::borrow((*self.as_raw()).dev) }
> +    }
> +
> +    fn raw_mode_obj(&self) -> *mut bindings::drm_mode_object {
> +        // SAFETY: We don't expose DRM connectors to users before =
`base` is initialized
> +        unsafe { &mut (*self.as_raw()).base }
> +    }
> +}
> +
> +// SAFETY: Connectors are reference counted mode objects
> +unsafe impl<T: KmsDriver> RcModeObject for OpaqueConnector<T> {}
> +
> +// SAFETY: Our connector interfaces are guaranteed to be thread-safe
> +unsafe impl<T: KmsDriver> Send for OpaqueConnector<T> {}
> +unsafe impl<T: KmsDriver> Sync for OpaqueConnector<T> {}
> +
> /// A privileged [`Connector`] obtained while holding a =
[`ModeConfigGuard`].
> ///
> /// This provides access to various methods for [`Connector`] that =
must happen under lock, such as
> @@ -537,6 +595,56 @@ unsafe fn from_raw_mut<'a>(ptr: *mut =
bindings::drm_connector_state) -> &'a mut S
>     }
> }
>=20
> +/// A [`struct drm_connector_state`] without a known =
[`DriverConnectorState`] implementation.
> +///
> +/// This is mainly for situations where our bindings can't infer the =
[`DriverConnectorState`]
> +/// implementation for a [`struct drm_connector_state`] =
automatically. It is identical to
> +/// [`Connector`], except that it does not provide access to the =
driver's private data.
> +///
> +/// TODO: Add upcast functions
> +///
> +/// # Invariants
> +///
> +/// - `state` is initialized for as long as this object is exposed to =
users.
> +/// - The data layout of this type is identical to [`struct =
drm_connector_state`].
> +/// - The DRM C API and our interface guarantees that only the user =
has mutable access to `state`,
> +///   up until [`drm_atomic_helper_commit_hw_done`] is called. =
Therefore, `connector` follows rust's
> +///   data aliasing rules and does not need to be behind an =
[`Opaque`] type.

By the way, as you did in a previous commit, I wonder whether it would =
be better to have the invariants
in a single place, since I=E2=80=99ve noticed that most of them are =
quite similar.

Something like =E2=80=9CThe invariants for this type are the same as the =
ones for Foo=E2=80=9D

This way, if you need to update your design, these will not get out of =
sync that easily.

> +///
> +/// [`struct drm_connector_state`]: =
srctree/include/drm/drm_connector.h
> +/// [`drm_atomic_helper_commit_hw_done`]: =
srctree/include/drm/drm_atomic_helper.h
> +#[repr(transparent)]
> +pub struct OpaqueConnectorState<T: KmsDriver> {
> +    state: bindings::drm_connector_state,
> +    _p: PhantomData<T>
> +}
> +
> +impl<T: KmsDriver> AsRawConnectorState for OpaqueConnectorState<T> {
> +    type Connector =3D OpaqueConnector<T>;
> +}
> +
> +impl<T: KmsDriver> private::AsRawConnectorState for =
OpaqueConnectorState<T> {
> +    fn as_raw(&self) -> &bindings::drm_connector_state {
> +        &self.state
> +    }
> +
> +    unsafe fn as_raw_mut(&mut self) -> &mut =
bindings::drm_connector_state {
> +        &mut self.state
> +    }
> +}
> +
> +impl<T: KmsDriver> FromRawConnectorState for OpaqueConnectorState<T> =
{
> +    unsafe fn from_raw<'a>(ptr: *const bindings::drm_connector_state) =
-> &'a Self {
> +        // SAFETY: Our data layout is identical to =
`bindings::drm_connector_state`
> +        unsafe { &*ptr.cast() }
> +    }
> +
> +    unsafe fn from_raw_mut<'a>(ptr: *mut =
bindings::drm_connector_state) -> &'a mut Self {
> +        // SAFETY: Our data layout is identical to =
`bindings::drm_connector_state`
> +        unsafe { &mut *ptr.cast() }
> +    }
> +}
> +
> unsafe extern "C" fn atomic_duplicate_state_callback<T: =
DriverConnectorState>(
>     connector: *mut bindings::drm_connector
> ) -> *mut bindings::drm_connector_state
> --=20
> 2.46.1
>=20

This LGTM overall.

=E2=80=94 Daniel

