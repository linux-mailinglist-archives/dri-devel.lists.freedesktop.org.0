Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EEDC980EF
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 16:31:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDA9110E3FA;
	Mon,  1 Dec 2025 15:31:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="UIBVZiu9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CC7610E3FA
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 15:31:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1764603084; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Xuy+zrayxriwhuYfV/lVGssZKZ+Bjy7aYphus6QJ/hBrv939HE61Ad745hTjCtzVc5kx4WT9ABt8vM9ekMcBIK1zJVpxgEclYdCLoePwiPQkm7wAqnSofQWudJdg+L61dnNzPqFj3xr47S0vxMksduM+fAitX1b3WenFPZw6t0s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1764603084;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=3HbneU3qyka+xS+SgyzTpdhrl3NagdrNaKT2I4JJmeg=; 
 b=fyY2x3hqyXc+eLlSejazJ4GEzzUSn6ZRpeCrTY+/AV5qDOock5KTgQPt1pO+EO/kp6u3hlxOfhcpFFr4P8Re6Hph16nZ76FlL9qrPqrQFsCczyLdD+HLk54xxsqzlY6M1FIluDxHRVhm1CsmT9mSzi4p90M5G/4zTps8cxQvJCU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764603084; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=3HbneU3qyka+xS+SgyzTpdhrl3NagdrNaKT2I4JJmeg=;
 b=UIBVZiu9rxK3BZWr6HrP6U+QllaOJuwYNqVOggn6MYMG2I0i7qRSylEGzDSG78Zx
 V3gwwUKPTl/1t5Qf+3RA9xmbBnhWIml8CbpDyEZJFttuv1yfxEKxxydFy33Paw7hYzu
 bc0tDMOa5uirnHDAkatQcM+721cH5zFiiJfPZczs=
Received: by mx.zohomail.com with SMTPS id 1764603079634801.5377747252071;
 Mon, 1 Dec 2025 07:31:19 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v2] rust: drm: use `pin_init::zeroed()` for file
 operations initialization
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20251201152759.16429-1-atharvd440@gmail.com>
Date: Mon, 1 Dec 2025 12:31:04 -0300
Cc: Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Lyude Paul <lyude@redhat.com>,
 Shankari Anand <shankari.ak0208@gmail.com>,
 Asahi Lina <lina+kernel@asahilina.net>, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <6DE296DC-45BA-4915-8FB7-78A6A7339A66@collabora.com>
References: <20251201152759.16429-1-atharvd440@gmail.com>
To: Atharv Dubey <atharvd440@gmail.com>
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

Hi Atharv,

> On 1 Dec 2025, at 12:27, Atharv Dubey <atharvd440@gmail.com> wrote:
>=20
> Replace the manual `unsafe { core::mem::zeroed() }` initialization of
> `bindings::file_operations` with `pin_init::zeroed()`. This removes =
the
> explicit unsafe
>=20
> Signed-off-by: Atharv Dubey <atharvd440@gmail.com>
> ---
> rust/kernel/drm/gem/mod.rs | 4 +---
> 1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
> index 30c853988b94..f9fd98dc102b 100644
> --- a/rust/kernel/drm/gem/mod.rs
> +++ b/rust/kernel/drm/gem/mod.rs
> @@ -298,9 +298,7 @@ impl<T: DriverObject> AllocImpl for Object<T> {
> }
>=20
> pub(super) const fn create_fops() -> bindings::file_operations {
> -    // SAFETY: As by the type invariant, it is safe to initialize =
`bindings::file_operations`
> -    // zeroed.
> -    let mut fops: bindings::file_operations =3D unsafe { =
core::mem::zeroed() };
> +    let mut fops: bindings::file_operations =3D pin_init::zeroed();
>=20
>     fops.owner =3D core::ptr::null_mut();
>     fops.open =3D Some(bindings::drm_open);
> --=20
> 2.43.0
>=20
>=20

I wonder if this should be part of a larger series that implements this =
change
throughout the tree?

=E2=80=94 Daniel=
