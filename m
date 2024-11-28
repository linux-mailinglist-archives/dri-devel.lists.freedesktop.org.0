Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5089DB9AC
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2024 15:32:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C77710ECA4;
	Thu, 28 Nov 2024 14:32:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="CdD7NmTl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B75D10ECA4
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2024 14:32:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1732804333; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=lPOzg+dQ6Ut7xQnwqFaF0fc0bWMILyYV97VxkZs/MryZi/w5hi+oN07trvEXYRNml3sTu1+dfsdOLSMQNa8InZlzOqENHN+j37skhY01mO5O8VRepcSyQuViPbiTWBhivSlzdc8UkfigZ7PueHzd4iZYR+1riqiZHQFI/EB1Kvc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1732804333;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=/Taw2CQT9QcMUAy17zboa+dBaCxiBOPrIgOOMmxKd7M=; 
 b=F9WPVqZ8O7qEpV88yI+X2K3HrYPVmJZ0aBAS2z9y12Y3OibVvRXO6oYJassA/icx7mO15o+Wffnr5WRX6vmGsgy6N6/T6CmwKSI7Jibyl0br78UFa536kmhH0tjWnmlRK8lvJAvu8U6XKYqvPPpoqAQ1HaoBvK2K7ie0SwxuVFw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732804333; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=/Taw2CQT9QcMUAy17zboa+dBaCxiBOPrIgOOMmxKd7M=;
 b=CdD7NmTlUQ/CSJ+wXfMv7ZaMFrpISTQlqkIu+7X0mS06fcMksc59dnSWn1G2BxbT
 BQ0xMwbkzFxD/ilkrVQjYsTCWJrQwVjEdInw0cFtkJDnZeBxy1LDQ8O6bL97f61kSWx
 t58r8ngvyC+QjFXTgKG0RvBxL858bjYQ49jT+hIY=
Received: by mx.zohomail.com with SMTPS id 1732804332353252.4456748863455;
 Thu, 28 Nov 2024 06:32:12 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.200.121\))
Subject: Re: [WIP RFC v2 29/35] rust: drm/kms: Add DriverCrtc::atomic_begin()
 and atomic_flush()
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20240930233257.1189730-30-lyude@redhat.com>
Date: Thu, 28 Nov 2024 11:31:57 -0300
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
Message-Id: <A58F7EA7-355A-4001-93EA-653989BE02C1@collabora.com>
References: <20240930233257.1189730-1-lyude@redhat.com>
 <20240930233257.1189730-30-lyude@redhat.com>
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
> Optional trait methods for implementing the atomic_begin and =
atomic_flush
> callbacks for a CRTC.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
> rust/kernel/drm/kms/crtc.rs | 78 ++++++++++++++++++++++++++++++++++++-
> 1 file changed, 76 insertions(+), 2 deletions(-)
>=20
> diff --git a/rust/kernel/drm/kms/crtc.rs b/rust/kernel/drm/kms/crtc.rs
> index ec9b58763dcca..a4e955364bd8c 100644
> --- a/rust/kernel/drm/kms/crtc.rs
> +++ b/rust/kernel/drm/kms/crtc.rs
> @@ -90,8 +90,8 @@ pub trait DriverCrtc: Send + Sync + Sized {
>             mode_set: None,
>             mode_valid: None,
>             mode_fixup: None,
> -            atomic_begin: None,
> -            atomic_flush: None,
> +            atomic_begin: if Self::HAS_ATOMIC_BEGIN { =
Some(atomic_begin_callback::<Self>) } else { None },
> +            atomic_flush: if Self::HAS_ATOMIC_FLUSH { =
Some(atomic_flush_callback::<Self>) } else { None },
>             mode_set_nofb: None,
>             mode_set_base: None,
>             mode_set_base_atomic: None,
> @@ -132,6 +132,36 @@ fn atomic_check(
>     ) -> Result {
>         build_error::build_error("This should not be reachable")
>     }
> +
> +    /// The optional [`drm_crtc_helper_funcs.atomic_begin`] hook.
> +    ///
> +    /// This hook will be called before a set of [`Plane`] updates =
are performed for the given
> +    /// [`Crtc`].
> +    ///
> +    /// [`drm_crtc_helper_funcs.atomic_begin`]: =
srctree/include/drm/drm_modeset_helper_vtables.h
> +    fn atomic_begin(
> +        crtc: &Crtc<Self>,
> +        old_state: &CrtcState<Self::State>,
> +        new_state: BorrowedCrtcState<'_, CrtcState<Self::State>>,
> +        state: &AtomicStateMutator<Self::Driver>
> +    ) {
> +        build_error::build_error("This should not be reachable")
> +    }
> +
> +    /// The optional [`drm_crtc_helper_funcs.atomic_flush`] hook.
> +    ///
> +    /// This hook will be called after a set of [`Plane`] updates are =
performed for the given
> +    /// [`Crtc`].
> +    ///
> +    /// [`drm_crtc_helper_funcs.atomic_flush`]: =
srctree/include/drm/drm_modeset_helper_vtables.h
> +    fn atomic_flush(
> +        crtc: &Crtc<Self>,
> +        old_state: &CrtcState<Self::State>,
> +        new_state: BorrowedCrtcState<'_, CrtcState<Self::State>>,
> +        state: &AtomicStateMutator<Self::Driver>
> +    ) {
> +        build_error::build_error("This should never be reachable")
> +    }
> }

Same comment here as in the previous patches, i.e.: if this is optional, =
why do we have a
default implementation with build_error?

>=20
> /// The generated C vtable for a [`DriverCrtc`].
> @@ -776,3 +806,47 @@ fn as_raw(&self) -> *mut bindings::drm_crtc_state =
{
>         Ok(0)
>     })
> }
> +
> +unsafe extern "C" fn atomic_begin_callback<T: DriverCrtc>(
> +    crtc: *mut bindings::drm_crtc,
> +    state: *mut bindings::drm_atomic_state,
> +) {
> +    // SAFETY:
> +    // * We're guaranteed `crtc` is of type `Crtc<T>` via type =
invariants.
> +    // * We're guaranteed by DRM that `crtc` is pointing to a valid =
initialized state.
> +    let crtc =3D unsafe { Crtc::from_raw(crtc) };
> +
> +    // SAFETY: We're guaranteed by DRM that `state` points to a valid =
instance of `drm_atomic_state`
> +    let state =3D unsafe { =
AtomicStateMutator::new(NonNull::new_unchecked(state)) };
> +
> +    // SAFETY: We're guaranteed by DRM that both the old and new =
atomic state are present within
> +    // this `drm_atomic_state`
> +    let (old_state, new_state) =3D unsafe {(
> +        state.get_old_crtc_state(crtc).unwrap_unchecked(),
> +        state.get_new_crtc_state(crtc).unwrap_unchecked(),
> +    )};
> +
> +    T::atomic_begin(crtc, old_state, new_state, &state);
> +}
> +
> +unsafe extern "C" fn atomic_flush_callback<T: DriverCrtc>(
> +    crtc: *mut bindings::drm_crtc,
> +    state: *mut bindings::drm_atomic_state,
> +) {
> +    // SAFETY:
> +    // * We're guaranteed `crtc` is of type `Crtc<T>` via type =
invariants.
> +    // * We're guaranteed by DRM that `crtc` is pointing to a valid =
initialized state.
> +    let crtc =3D unsafe { Crtc::from_raw(crtc) };
> +
> +    // SAFETY: We're guaranteed by DRM that `state` points to a valid =
instance of `drm_atomic_state`
> +    let state =3D unsafe { =
AtomicStateMutator::new(NonNull::new_unchecked(state)) };
> +
> +    // SAFETY: We're in an atomic flush callback, so we know that =
both the new and old state are
> +    // present
> +    let (old_state, new_state) =3D unsafe {(
> +        state.get_old_crtc_state(crtc).unwrap_unchecked(),
> +        state.get_new_crtc_state(crtc).unwrap_unchecked(),
> +    )};
> +
> +    T::atomic_flush(crtc, old_state, new_state, &state);
> +}
> --=20
> 2.46.1
>=20
>=20


=E2=80=94 Daniel

