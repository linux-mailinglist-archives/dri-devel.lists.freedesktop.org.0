Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 173C89DB920
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2024 14:58:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CB6D10ECB6;
	Thu, 28 Nov 2024 13:58:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="GkGG+V9w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E8FA10ECB6
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2024 13:58:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1732802313; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=RMdE7mM2qiejOI1lbSo+nyF3NrGI7fNwM3TTML5ARa3jWXJlFkZ53MwiCRopD48xhZmFuKcoz7WTkxeW2PSegyMTWwfsjoZy6OtIztQFN8A+06LRkkDzoMzs61wg2jfdK24DqizTFgyUFZ9kJYY84WY5xdn4H6wdj2o1OK4w6ik=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1732802313;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Tt9ERNCWFTTUro7NQp6qivOCXvGBaE2mYaaalPs9eos=; 
 b=VojIgLTiM4eF8oB4vUzeLvpR7BGbHtPU/2sYikWIDzPQPFwPhgjIxNrH1wTT4i5IvDv3Fj4IuH31dsAICjpgbf9lzbxTUKljzjbnrtzQLYytLoTRC1aa2yap9VIPsgmht8+JJuKeKtHHenz3Tw2FhJjgW5NhpbO1prgM1NTu9uM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732802313; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=Tt9ERNCWFTTUro7NQp6qivOCXvGBaE2mYaaalPs9eos=;
 b=GkGG+V9wannGRIS72w0/jKWcJod8Jg0O/tQa0/RzHg+H6fUzm4MT2cO8yLopziyi
 RLvzUifxHpkhsLnXO6twFclBAYzbRv8RUc1Rxjlyt4g0nH20daS6RsyiLiOZb4JH3iA
 KJG9RrMw7D0DmGKdeBRldQDkDwyIvfSxoufoqByE=
Received: by mx.zohomail.com with SMTPS id 1732802312932749.2521541577697;
 Thu, 28 Nov 2024 05:58:32 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.200.121\))
Subject: Re: [WIP RFC v2 25/35] rust: drm/kms: Add RawPlaneState::crtc()
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20240930233257.1189730-26-lyude@redhat.com>
Date: Thu, 28 Nov 2024 10:58:18 -0300
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
Message-Id: <B3203AF9-C4D0-4CBE-B418-5A45EBBA65DB@collabora.com>
References: <20240930233257.1189730-1-lyude@redhat.com>
 <20240930233257.1189730-26-lyude@redhat.com>
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
> Add a binding for checking drm_plane_state.crtc. Note that we don't =
have a
> way of knowing what DriverCrtc implementation would be used here (and =
want
> to make this function also available on OpaquePlaneState types), so we
> return an OpaqueCrtc.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
> rust/kernel/drm/kms/plane.rs | 7 +++++++
> 1 file changed, 7 insertions(+)
>=20
> diff --git a/rust/kernel/drm/kms/plane.rs =
b/rust/kernel/drm/kms/plane.rs
> index 04f1bdfbb1ea2..4d16d53179fca 100644
> --- a/rust/kernel/drm/kms/plane.rs
> +++ b/rust/kernel/drm/kms/plane.rs
> @@ -30,6 +30,7 @@
>     ModeObject,
>     StaticModeObject,
>     atomic::*,
> +    crtc::*,
> };
>=20
> /// The main trait for implementing the [`struct drm_plane`] API for =
[`Plane`]
> @@ -489,6 +490,12 @@ fn plane(&self) -> &Self::Plane {
>         // invariant throughout the lifetime of the Plane
>         unsafe { Self::Plane::from_raw(self.as_raw().plane) }
>     }
> +
> +    /// Return the current [`OpaqueCrtc`] assigned to this plane, if =
there is one.
> +    fn crtc<'a, 'b: 'a>(&'a self) -> Option<&'b =
OpaqueCrtc<<Self::Plane as ModeObject>::Driver>> {
> +        // SAFETY: This cast is guaranteed safe by `OpaqueCrtc`s =
invariants.
> +        NonNull::new(self.as_raw().crtc).map(|c| unsafe { =
OpaqueCrtc::from_raw(c.as_ptr()) })
> +    }
> }
> impl<T: AsRawPlaneState + ?Sized> RawPlaneState for T {}
>=20
> --=20
> 2.46.1
>=20
>=20

LGTM,

=E2=80=94 Daniel

