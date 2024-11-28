Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 972939DB99C
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2024 15:29:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E29E10EC80;
	Thu, 28 Nov 2024 14:29:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="ddJZZXHs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EF3F10EC80
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2024 14:29:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1732804175; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=W5/xYku4emSx1qcpNWsy12LZbkUfN+GMf9rKQE+Dzporw3Ajo35wC0MT9FJUM6wyZ7ZuNu0KL5QrB2ERh96EBSCPMDbxmhcEwMNnW0b71sRXD1IQ8KIlVMYLoTawYWmxtQdG7QhowSs2HONpHmN/qJhwMDGMa8c6Li3RoJLnOD0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1732804175;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=ESdq7+vJq5NINh85EeRXpbCJuG9FayiFw/PgAnZgLEs=; 
 b=VIkRBhotgG0ZJKVPfUIUglytu4eNDSGs8a7xtuVmCVRl4O2gpMdvDyDET1o2ztYG9n/7hK87m6PrfDV3j/rUku6yikstwYFWnIqGB4xV13bjO2Vvwg+5gzoBxvPiogmzQ92V9gCldZy2RUPJMFjN3MtgEBgtauEVB1Cy3OMnLuQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732804175; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=ESdq7+vJq5NINh85EeRXpbCJuG9FayiFw/PgAnZgLEs=;
 b=ddJZZXHspf6q0EUBidd2iL/XwYOY+h2oUpyfDfQ+Vaxrrad88ea00chA04etnd5F
 gcnB5B4oSBH8iVrpqVHq5cRvfSpU6MlcjHTDRHxfKmgg7BaDZ13MOGdJBSeMdKEFmKZ
 +aJeai6WpCcHYsNYjmvHlyfV8b108UdnEHfdoqtY=
Received: by mx.zohomail.com with SMTPS id 1732804173824507.02096353782724;
 Thu, 28 Nov 2024 06:29:33 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.200.121\))
Subject: Re: [WIP RFC v2 28/35] rust: drm/kms: Add RawPlane::framebuffer()
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20240930233257.1189730-29-lyude@redhat.com>
Date: Thu, 28 Nov 2024 11:29:18 -0300
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
Message-Id: <ABEE04BD-5136-4F83-A46D-62595D1D3B9B@collabora.com>
References: <20240930233257.1189730-1-lyude@redhat.com>
 <20240930233257.1189730-29-lyude@redhat.com>
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
> Returns the Framebuffer currently assigned in an atomic plane state.

A bit unrelated to this patch, but can you have more than one =
framebuffer active?=20

i.e.: for things like overlays, etc

>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
> rust/kernel/drm/kms/plane.rs | 8 ++++++++
> 1 file changed, 8 insertions(+)
>=20
> diff --git a/rust/kernel/drm/kms/plane.rs =
b/rust/kernel/drm/kms/plane.rs
> index cd5167e6441f1..15efa53fda8d3 100644
> --- a/rust/kernel/drm/kms/plane.rs
> +++ b/rust/kernel/drm/kms/plane.rs
> @@ -31,6 +31,7 @@
>     StaticModeObject,
>     atomic::*,
>     crtc::*,
> +    framebuffer::*,
> };
>=20
> /// The main trait for implementing the [`struct drm_plane`] API for =
[`Plane`]
> @@ -521,6 +522,13 @@ fn atomic_helper_check<S>(
>             )
>         })
>     }
> +
> +    /// Return the framebuffer currently set for this plane state
> +    #[inline]
> +    fn framebuffer(&self) -> Option<&Framebuffer<<Self::Plane as =
ModeObject>::Driver>> {
> +        // SAFETY: The layout of Framebuffer<T> is identical to `fb`
> +        unsafe { self.as_raw().fb.as_ref().map(|fb| =
Framebuffer::from_raw(fb)) }
> +    }
> }
> impl<T: AsRawPlaneState + ?Sized> RawPlaneState for T {}
>=20
> --=20
> 2.46.1
>=20
>=20

LGTM

=E2=80=94 Daniel

