Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6945B9DADDA
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 20:31:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8C9D10E27C;
	Wed, 27 Nov 2024 19:31:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="ZnkUFkVW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8009A10E27C
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2024 19:31:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1732735865; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=HlSAK+vbChOESf6CajiRJQzPO42oC6fQF8pUfas81XKOr+xR5fLMG/omzasec3da//DwPZUJYv+29U4qBpY8kwxtsMEfkAuk85rHfDI0//3ZrpMqc5503elUf7bQYhVYwByYq+Er1CgVBYLoHOXNSGfCeENutMAmzh29h2akmHQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1732735865;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=puooQMdPcEt9xW6FRzJ4TgjZrgpqYcoxpKKozms2RUw=; 
 b=W0zxjR6y+Y4Vmge8IC2KrZCujeb8ZOPcJJ9NtvX87PZjjuX6xGvwzQkgnzlmJ5tfmH67qXOYcBokRwwLdybYXj8gwXbjkVLWqCw4IeJHtCd4F4ItE05xne2KaECZdX0dL7rqb8mu7MeZj2nU4dtwtbHaDxHLw9N5q1GKtuYDXDY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732735865; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=puooQMdPcEt9xW6FRzJ4TgjZrgpqYcoxpKKozms2RUw=;
 b=ZnkUFkVWDHoRYWqTDiEHh//Sa20UD/qIMEaKaqlGh7/j1VeCrmV6f5CzQbIkUoC9
 xs+RzZbz3vLfIPThxdyZUG3oXdYogWXrA75WzEeMS6kccRYw2kxDa8mBNR5Zf0r5AI3
 TpcWC6SImF93XY766EB8npTueOhymHNdRkG3nnDE=
Received: by mx.zohomail.com with SMTPS id 1732735864391797.9845788869264;
 Wed, 27 Nov 2024 11:31:04 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.200.121\))
Subject: Re: [WIP RFC v2 18/35] rust: drm/kms: Add RawPlane and RawPlaneState
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20240930233257.1189730-19-lyude@redhat.com>
Date: Wed, 27 Nov 2024 16:30:49 -0300
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
Message-Id: <FC63978F-BAC0-4294-999E-9BA31FA39490@collabora.com>
References: <20240930233257.1189730-1-lyude@redhat.com>
 <20240930233257.1189730-19-lyude@redhat.com>
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

Hi Lyude

> On 30 Sep 2024, at 20:10, Lyude Paul <lyude@redhat.com> wrote:
>=20
> Same thing as RawCrtc and RawCrtcState, but for DRM planes now
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
> rust/kernel/drm/kms/plane.rs | 35 +++++++++++++++++++++++++++++++++++
> 1 file changed, 35 insertions(+)
>=20
> diff --git a/rust/kernel/drm/kms/plane.rs =
b/rust/kernel/drm/kms/plane.rs
> index 3ace487316d46..1c151ae3b3dcc 100644
> --- a/rust/kernel/drm/kms/plane.rs
> +++ b/rust/kernel/drm/kms/plane.rs
> @@ -312,6 +312,27 @@ unsafe impl<T: DriverPlane> Send for Plane<T> {}
> // SAFETY: Our interface is thread-safe.
> unsafe impl<T: DriverPlane> Sync for Plane<T> {}
>=20
> +/// Common methods available on any type which implements =
[`AsRawPlane`].
> +///
> +/// This is implemented internally by DRM, and provides many of the =
basic methods for working with
> +/// planes.
> +pub trait RawPlane: AsRawPlane {
> +    /// Return the index of this DRM plane
> +    #[inline]
> +    fn index(&self) -> u32 {
> +        // SAFETY: The index is initialized by the time we expose =
`Plane` objects to users, and is
> +        // invariant throughout the lifetime of the `Plane`
> +        unsafe { (*self.as_raw()).index }
> +    }
> +
> +    /// Return the index of this DRM plane in the form of a bitmask
> +    #[inline]
> +    fn mask(&self) -> u32 {
> +        1 << self.index()
> +    }
> +}
> +impl<T: AsRawPlane> RawPlane for T {}
> +
> /// A [`struct drm_plane`] without a known [`DriverPlane`] =
implementation.
> ///
> /// This is mainly for situations where our bindings can't infer the =
[`DriverPlane`] implementation
> @@ -426,6 +447,20 @@ pub trait FromRawPlaneState: AsRawPlaneState {
>     unsafe fn from_raw_mut<'a>(ptr: *mut bindings::drm_plane_state) -> =
&'a mut Self;
> }
>=20
> +/// Common methods available on any type which implements =
[`AsRawPlane`].
> +///
> +/// This is implemented internally by DRM, and provides many of the =
basic methods for working with
> +/// the atomic state of [`Plane`]s.
> +pub trait RawPlaneState: AsRawPlaneState {
> +    /// Return the plane that this plane state belongs to.
> +    fn plane(&self) -> &Self::Plane {
> +        // SAFETY: The index is initialized by the time we expose =
Plane objects to users, and is
> +        // invariant throughout the lifetime of the Plane
> +        unsafe { Self::Plane::from_raw(self.as_raw().plane) }
> +    }
> +}
> +impl<T: AsRawPlaneState + ?Sized> RawPlaneState for T {}
> +
> /// The main interface for a [`struct drm_plane_state`].
> ///
> /// This type is the main interface for dealing with the atomic state =
of DRM planes. In addition, it
> --=20
> 2.46.1
>=20

LGTM

=E2=80=94 Daniel

