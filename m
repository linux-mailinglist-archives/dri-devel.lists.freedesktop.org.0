Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 689929DB8EB
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2024 14:38:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1C8D10E26D;
	Thu, 28 Nov 2024 13:38:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="e3XtsTit";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF3C510E26D
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2024 13:38:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1732801133; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=PIf59cW+Sas0TJFgqiA1Gqd4l01sMigk8oWrPjVwhJtE44Bhzak3qa6G3NeiBj4Qq/Xa8CogrJXcWYANts66SX5TifPEaiiCmHSYQ2zk48tICoORGzcrJNeZ7z3GUgjWZ23ONnKwjlLeek9QpYFIOsliYpdWfy3yE9yE6ZJCa1A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1732801133;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=EsxzMZa25WfDL+pgn4fFAhwPmv5kUt6UME3E/AmO0pc=; 
 b=VaQVKGlZB2ApfrqBvIHeAijPQlGBmTJI7R7hbskrVSm9G/pWU6Mq6b2SMFNg57/U8DiyUJ2n6bqxCEchYJLXxEv0G58frknEGao08hIJ3BknN+ua21ssho6NpDKVb8fuzBvh2hWs0lFry6zKd/yskDPG1p+TObxMbvssxCxUiOY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732801133; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=EsxzMZa25WfDL+pgn4fFAhwPmv5kUt6UME3E/AmO0pc=;
 b=e3XtsTit+wD3FqtPfGio/zA0Jz33pnuOzojOx40wQ0Kzj6Cp4OYT0JWy5iKs7AAf
 WusFk1C+mFQalgugw1nC0SgO+txV698xz8SP8+g2n7K+EPCHjPLz77CnAUZV6tHCVL/
 1Tb3fJvH7PD0n5g3efm+MYes8hBk5CiDpqZ+WV30=
Received: by mx.zohomail.com with SMTPS id 17328011321711013.0878817486588;
 Thu, 28 Nov 2024 05:38:52 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.200.121\))
Subject: Re: [WIP RFC v2 22/35] rust: drm/kms: Add DriverPlane::atomic_update()
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20240930233257.1189730-23-lyude@redhat.com>
Date: Thu, 28 Nov 2024 10:38:36 -0300
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
Message-Id: <65D59594-7E60-4407-835A-991B2D7C2203@collabora.com>
References: <20240930233257.1189730-1-lyude@redhat.com>
 <20240930233257.1189730-23-lyude@redhat.com>
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

> On 30 Sep 2024, at 20:10, Lyude Paul <lyude@redhat.com> wrote:
>=20
> A mandatory trait method used for implementing DRM's atomic plane =
update
> callback.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
> rust/kernel/drm/kms/plane.rs | 39 +++++++++++++++++++++++++++++++++++-
> 1 file changed, 38 insertions(+), 1 deletion(-)
>=20
> diff --git a/rust/kernel/drm/kms/plane.rs =
b/rust/kernel/drm/kms/plane.rs
> index d6e11a65cc101..506ed5ced1270 100644
> --- a/rust/kernel/drm/kms/plane.rs
> +++ b/rust/kernel/drm/kms/plane.rs
> @@ -75,7 +75,7 @@ pub trait DriverPlane: Send + Sync + Sized {
>             begin_fb_access: None, // TODO: someday?
>             end_fb_access: None, // TODO: someday?
>             atomic_check: None,
> -            atomic_update: None,
> +            atomic_update: if Self::HAS_ATOMIC_UPDATE { =
Some(atomic_update_callback::<Self>) } else { None },
>             atomic_enable: None, // TODO
>             atomic_disable: None, // TODO
>             atomic_async_check: None, // TODO
> @@ -103,6 +103,21 @@ pub trait DriverPlane: Send + Sync + Sized {
>     ///
>     /// Drivers may use this to instantiate their [`DriverPlane`] =
object.
>     fn new(device: &Device<Self::Driver>, args: Self::Args) -> impl =
PinInit<Self, Error>;
> +
> +    /// The optional [`drm_plane_helper_funcs.atomic_update`] hook =
for this plane.
> +    ///
> +    /// Drivers may use this to customize the atomic update phase of =
their [`Plane`] objects. If not
> +    /// specified, this function is a no-op.
> +    ///
> +    /// [`drm_plane_helper_funcs.atomic_update`]: =
srctree/include/drm/drm_modeset_helper_vtables.h
> +    fn atomic_update(
> +        plane: &Plane<Self>,
> +        new_state: BorrowedPlaneState<'_, PlaneState<Self::State>>,
> +        old_state: &PlaneState<Self::State>,
> +        state: &AtomicStateMutator<Self::Driver>
> +    ) {
> +        build_error::build_error("This should not be reachable")
> +    }

Same comment as the last patch.

> }
>=20
> /// The generated C vtable for a [`DriverPlane`].
> @@ -757,3 +772,25 @@ fn deref_mut(&mut self) -> &mut Self::Target {
>     // - The cast to `drm_plane_state` is safe via `PlaneState`s type =
invariants.
>     unsafe { bindings::__drm_atomic_helper_plane_reset(plane, =
Box::into_raw(new).cast()) };
> }
> +
> +unsafe extern "C" fn atomic_update_callback<T: DriverPlane>(
> +    plane: *mut bindings::drm_plane,
> +    state: *mut bindings::drm_atomic_state,
> +) {
> +    // SAFETY:
> +    // * We're guaranteed `plane` is of type `Plane<T>` via type =
invariants.
> +    // * We're guaranteed by DRM that `plane` is pointing to a valid =
initialized state.
> +    let plane =3D unsafe { Plane::from_raw(plane) };
> +
> +    // SAFETY: DRM guarantees `state` points to a valid =
`drm_atomic_state`
> +    let state =3D unsafe { =
AtomicStateMutator::new(NonNull::new_unchecked(state)) };

No ManuallyDrop here?

> +
> +    // SAFETY: Since we are in the atomic update callback, we're =
guaranteed by DRM that both the old
> +    // and new atomic state are present within `state`
> +    let (old_state, new_state) =3D unsafe {(
> +        state.get_old_plane_state(plane).unwrap_unchecked(),
> +        state.get_new_plane_state(plane).unwrap_unchecked(),
> +    )};
> +
> +    T::atomic_update(plane, new_state, old_state, &state);
> +}
> --=20
> 2.46.1
>=20

=E2=80=94 Daniel

