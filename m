Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1669DB92E
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2024 15:06:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BC7810ECC2;
	Thu, 28 Nov 2024 14:06:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="a+xmRzSf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9B5E10ECC3
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2024 14:06:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1732802758; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=oB//s39QD9RHwyTMru2LK6OxjrFwNKSF7XbsDQVNF8392OY9K2eEVYsZFCcYCLlMldp6NRHc2oKeNApeeqficbEXbYLlZA8twmf77SDF5WZcSM9Kgt4KKSNySSXFePa+MG7pXITXMEp2H65L3BVRMYYzJa4bFm6LmY+hkrrcZuU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1732802758;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=5zUEiPJ5HRZWwfzDbLTtNuHqL6gztak6PTx5iUX6B3s=; 
 b=ERj6d3tFnh8OpeA/3lAMDt3AFLLJRk8JAEEGjD4SjdgdzwWO5ZYV07VbS8zFo1TeTEivwz4TBCIFv5sLBNAWySriBRl64BnipT31jetZCo7FPQesIIiAlZ5sW+Lmuw4dByPtGVQxIpBF+1cUaGgKQGwFj/dedVhgevVCtw1vGuM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732802758; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=5zUEiPJ5HRZWwfzDbLTtNuHqL6gztak6PTx5iUX6B3s=;
 b=a+xmRzSfuV9rujTdieN91apxAv1xzj3RnZT7+Y1E6LekhFWgLwd3AqBhcmUU0prr
 5VmLTeMm+SoPzY+LMP9Tg5Lp59BryLh7tSSz+PcoMr8jcrYh6PSMkGkv6qqTFXtp5+H
 4Y0hvVXiGH86ZMpzR1kzJrGGSo+HeSQfzyk+lRFE=
Received: by mx.zohomail.com with SMTPS id 1732802756921356.23851212628585;
 Thu, 28 Nov 2024 06:05:56 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.200.121\))
Subject: Re: [WIP RFC v2 26/35] WIP: rust: drm/kms: Add
 RawPlaneState::atomic_helper_check()
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20240930233257.1189730-27-lyude@redhat.com>
Date: Thu, 28 Nov 2024 11:04:24 -0300
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
Message-Id: <7148C7F5-6412-44CB-B92A-4ABAE4A4D5C3@collabora.com>
References: <20240930233257.1189730-1-lyude@redhat.com>
 <20240930233257.1189730-27-lyude@redhat.com>
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
> Add a binding for drm_atomic_helper_check_plane_state(). Since we want =
to
> make sure that the user is passing in the new state for a Crtc instead =
of
> an old state, we explicitly ask for a reference to a =
BorrowedCrtcState.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
>=20
> ---
>=20
> TODO:
> * Add support for scaling options

Can / should this be a separate commit? This would allow this one to go =
in earlier.

>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
> rust/kernel/drm/kms/plane.rs | 25 +++++++++++++++++++++++++
> 1 file changed, 25 insertions(+)
>=20
> diff --git a/rust/kernel/drm/kms/plane.rs =
b/rust/kernel/drm/kms/plane.rs
> index 4d16d53179fca..cd5167e6441f1 100644
> --- a/rust/kernel/drm/kms/plane.rs
> +++ b/rust/kernel/drm/kms/plane.rs
> @@ -496,6 +496,31 @@ fn crtc<'a, 'b: 'a>(&'a self) -> Option<&'b =
OpaqueCrtc<<Self::Plane as ModeObjec
>         // SAFETY: This cast is guaranteed safe by `OpaqueCrtc`s =
invariants.
>         NonNull::new(self.as_raw().crtc).map(|c| unsafe { =
OpaqueCrtc::from_raw(c.as_ptr()) })
>     }
> +
> +    /// Run the atomic check helper for this plane and the given CRTC =
state
> +    fn atomic_helper_check<S>(
> +        &mut self,
> +        crtc_state: &BorrowedCrtcState<'_, S>,
> +        can_position: bool,
> +        can_update_disabled: bool
> +    ) -> Result

Some docs on the arguments would be nice IMHO. Things like =
`can_position` and `can_update_disabled`
seem a bit opaque.

> +    where
> +        S: FromRawCrtcState,
> +        S::Crtc: AsRawCrtc<Driver =3D <Self::Plane as =
ModeObject>::Driver>
> +    {
> +        // SAFETY: We're passing the mutable reference from =
`self.as_raw_mut()` directly to DRM,
> +        // which is safe.
> +        to_result(unsafe {
> +            bindings::drm_atomic_helper_check_plane_state(
> +                self.as_raw_mut(),
> +                crtc_state.as_raw(),
> +                bindings::DRM_PLANE_NO_SCALING as _, // TODO: add =
parameters for scaling
> +                bindings::DRM_PLANE_NO_SCALING as _,

No scaling means that you can only select the display=E2=80=99s highest =
resolution?

> +                can_position,
> +                can_update_disabled
> +            )
> +        })
> +    }
> }
> impl<T: AsRawPlaneState + ?Sized> RawPlaneState for T {}
>=20
> --=20
> 2.46.1
>=20

Barring the comment above about the docs, this looks good.

=E2=80=94 Daniel

