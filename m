Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FD19DADD4
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 20:29:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEE0210E194;
	Wed, 27 Nov 2024 19:29:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="FrytVa7f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B37710E194
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2024 19:29:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1732735765; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=GriRJ1xdHZFLkctlvO4XhwWFIDLndwwr2MGf94Bsn4Jbz4To7fHvRvl04ZyGywRg3WxfcvbycRr0zPHNWswc/G+pW6S4/peIPgUe+9pWqXWJsE/ShEk0q2mn19VpEGHYfWkCWpTAUtp1W+eeRoL8670J85ckrkWq0PXg2F6LcvI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1732735765;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Ak+gBc+35/hHEaAOo/7Un1XUOAZ0r5oTfzhi1UAXVwY=; 
 b=iOp4rmjqEr+/ufhH45skIHzCsBuDt/Xuf7ZsVva4TEeal6p1iIIhb69Z9+RkD31C5RiRRMpF/WDA7+aFaRBu2xWx9GfVelidAVR+UHfOFXnxcenvG0aP+sjLZWTZyhRdik7rR/lI1ge9CU4pWBjBu9gOUWfePjghgG6qBwsvpQ8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732735765; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=Ak+gBc+35/hHEaAOo/7Un1XUOAZ0r5oTfzhi1UAXVwY=;
 b=FrytVa7f9OymR1fiwJjdEcOKapklxPauvCDUFF7MfeN9rWD2OA8C9zt99wANHzbm
 KACxPJuqtott/O8Um8HbrFEPS/gWBZaLY1spCxP+GtJi1JAOFrGXLlGcWE7+VH9p6ck
 ptTYcvfDDjUbWZB3QkvNbSPNuBC+2hfsHgPEpbkQ=
Received: by mx.zohomail.com with SMTPS id 1732735764632249.39737414229216;
 Wed, 27 Nov 2024 11:29:24 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.200.121\))
Subject: Re: [WIP RFC v2 17/35] rust: drm/kms: Add RawCrtc and RawCrtcState
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20240930233257.1189730-18-lyude@redhat.com>
Date: Wed, 27 Nov 2024 16:29:09 -0300
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
Message-Id: <6F230886-172E-4F2E-9107-9C6D11C39CB6@collabora.com>
References: <20240930233257.1189730-1-lyude@redhat.com>
 <20240930233257.1189730-18-lyude@redhat.com>
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
> Same thing as RawConnector and RawConnectorState, just for CRTCs now.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
> rust/kernel/drm/kms/crtc.rs | 25 +++++++++++++++++++++++--
> 1 file changed, 23 insertions(+), 2 deletions(-)
>=20
> diff --git a/rust/kernel/drm/kms/crtc.rs b/rust/kernel/drm/kms/crtc.rs
> index 1a3c9c448afcc..246d15a15c14d 100644
> --- a/rust/kernel/drm/kms/crtc.rs
> +++ b/rust/kernel/drm/kms/crtc.rs
> @@ -302,6 +302,25 @@ unsafe fn from_raw<'a>(ptr: *mut =
bindings::drm_crtc) -> &'a Self {
>     }
> }
>=20
> +/// Common methods available on any type which implements =
[`AsRawCrtc`].
> +///
> +/// This is implemented internally by DRM, and provides many of the =
basic methods for working with
> +/// CRTCs.
> +pub trait RawCrtc: AsRawCrtc {
> +    /// Return the index of this CRTC.
> +    fn index(&self) -> u32 {
> +        // SAFETY: The index is initialized by the time we expose =
Crtc objects to users, and is
> +        // invariant throughout the lifetime of the Crtc
> +        unsafe { (*self.as_raw()).index }
> +    }
> +
> +    /// Return the index of this DRM CRTC in the form of a bitmask.
> +    fn mask(&self) -> u32 {
> +        1 << self.index()
> +    }
> +}
> +impl<T: AsRawCrtc> RawCrtc for T {}
> +
> /// A [`struct drm_crtc`] without a known [`DriverCrtc`] =
implementation.
> ///
> /// This is mainly for situations where our bindings can't infer the =
[`DriverCrtc`] implementation
> @@ -447,8 +466,10 @@ pub trait AsRawCrtcState {
>=20
> pub(super) use private::AsRawCrtcState as AsRawCrtcStatePrivate;
>=20
> -/// A trait for providing common methods which can be used on any =
type that can be used as an atomic
> -/// CRTC state.
> +/// Common methods available on any type which implements =
[`AsRawCrtcState`].
> +///
> +/// This is implemented internally by DRM, and provides many of the =
basic methods for working with
> +/// the atomic state of [`Crtc`]s.
> pub trait RawCrtcState: AsRawCrtcState {
>     /// Return the CRTC that owns this state.
>     fn crtc(&self) -> &Self::Crtc {
> --=20
> 2.46.1

This also looks good.

=E2=80=94 Daniel

