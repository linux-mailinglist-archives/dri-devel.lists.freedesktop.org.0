Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1041CD65DA
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 15:28:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B53B410E6AF;
	Mon, 22 Dec 2025 14:28:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="YoIALPLq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 953E310E6AF;
 Mon, 22 Dec 2025 14:28:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1766413713; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=KmoK9aOCbcgZrCXEi89MPC/gIpCxlQBUXKQYwTtJCAlnQvIByFgwTRxateT/aIUtEg9fHcaTeGCkbuC1DkOHTFYEGqiVRLC3Dfv71OyQPpSKy8EMhwnpw8uy/czWQQKiE0z7fjPqdyCWUK2iMUt+ssRHpAUE3fXxn4ICOVDFh3s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1766413713;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=1IHzftE6pqH7b16lrsnXTjD+Dbu+oz0HhOml5yDROoM=; 
 b=RWmEgkZWEow31F8vknRJpc9m6UuQWvYHZlY3DGkf+XJ1vpFhfKhe6yuPZSNFWlAgfeF7dDb9Ov5TIaiRHkKZ58qKeI3ghANZfGQJ4gNbrjj/TqwcjhDewGgQtqxrMO1Y619axojK2wr2T8b1VkiFk1yL4TruO5WoX+h2XtCEhAU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766413713; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=1IHzftE6pqH7b16lrsnXTjD+Dbu+oz0HhOml5yDROoM=;
 b=YoIALPLq+wbCnQ4N2DbH+pQfQLM4GxpojNfXYQYNgCz0AklbpBBfOL5+j48834p7
 H95HlUgc5W+NlloCm+B+1HXcx3165HvtMFgNlz86+ikg2u2o2ideb7Ite00NSAa8aJX
 fXhgHHdTVx5jq++BtjbB3qQGgloH58aBCfIDLWRU=
Received: by mx.zohomail.com with SMTPS id 1766413712508187.41210361032677;
 Mon, 22 Dec 2025 06:28:32 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH] gpu: nova-core: replace `kernel::c_str!` with C-Strings
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20251222-cstr-nova-v1-1-0e2353d5debe@gmail.com>
Date: Mon, 22 Dec 2025 11:28:15 -0300
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Tamir Duberstein <tamird@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <AF29924C-81D0-4478-908B-204C3071EF0A@collabora.com>
References: <20251222-cstr-nova-v1-1-0e2353d5debe@gmail.com>
To: Tamir Duberstein <tamird@kernel.org>
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



> On 22 Dec 2025, at 09:20, Tamir Duberstein <tamird@kernel.org> wrote:
>=20
> From: Tamir Duberstein <tamird@gmail.com>
>=20
> C-String literals were added in Rust 1.77. Replace instances of
> `kernel::c_str!` with C-String literals where possible.
>=20
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Benno Lossin <lossin@kernel.org>
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
> drivers/gpu/drm/nova/driver.rs  | 12 +++++-------
> drivers/gpu/nova-core/driver.rs |  5 ++---
> 2 files changed, 7 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nova/driver.rs =
b/drivers/gpu/drm/nova/driver.rs
> index 2246d8e104e0..d24ade17f7a0 100644
> --- a/drivers/gpu/drm/nova/driver.rs
> +++ b/drivers/gpu/drm/nova/driver.rs
> @@ -1,8 +1,6 @@
> // SPDX-License-Identifier: GPL-2.0
>=20
> -use kernel::{
> -    auxiliary, c_str, device::Core, drm, drm::gem, drm::ioctl, =
prelude::*, sync::aref::ARef,
> -};
> +use kernel::{auxiliary, device::Core, drm, drm::gem, drm::ioctl, =
prelude::*, sync::aref::ARef};
>=20
> use crate::file::File;
> use crate::gem::NovaObject;
> @@ -24,12 +22,12 @@ pub(crate) struct NovaData {
>     major: 0,
>     minor: 0,
>     patchlevel: 0,
> -    name: c_str!("nova"),
> -    desc: c_str!("Nvidia Graphics"),
> +    name: c"nova",
> +    desc: c"Nvidia Graphics",
> };
>=20
> -const NOVA_CORE_MODULE_NAME: &CStr =3D c_str!("NovaCore");
> -const AUXILIARY_NAME: &CStr =3D c_str!("nova-drm");
> +const NOVA_CORE_MODULE_NAME: &CStr =3D c"NovaCore";
> +const AUXILIARY_NAME: &CStr =3D c"nova-drm";
>=20
> kernel::auxiliary_device_table!(
>     AUX_TABLE,
> diff --git a/drivers/gpu/nova-core/driver.rs =
b/drivers/gpu/nova-core/driver.rs
> index b8b0cc0f2d93..5a4cc047bcfc 100644
> --- a/drivers/gpu/nova-core/driver.rs
> +++ b/drivers/gpu/nova-core/driver.rs
> @@ -2,7 +2,6 @@
>=20
> use kernel::{
>     auxiliary,
> -    c_str,
>     device::Core,
>     devres::Devres,
>     dma::Device,
> @@ -82,7 +81,7 @@ fn probe(pdev: &pci::Device<Core>, _info: =
&Self::IdInfo) -> impl PinInit<Self, E
>             unsafe { =
pdev.dma_set_mask_and_coherent(DmaMask::new::<GPU_DMA_BITS>())? };
>=20
>             let bar =3D Arc::pin_init(
> -                pdev.iomap_region_sized::<BAR0_SIZE>(0, =
c_str!("nova-core/bar0")),
> +                pdev.iomap_region_sized::<BAR0_SIZE>(0, =
c"nova-core/bar0"),
>                 GFP_KERNEL,
>             )?;
>=20
> @@ -90,7 +89,7 @@ fn probe(pdev: &pci::Device<Core>, _info: =
&Self::IdInfo) -> impl PinInit<Self, E
>                 gpu <- Gpu::new(pdev, bar.clone(), =
bar.access(pdev.as_ref())?),
>                 _reg <- auxiliary::Registration::new(
>                     pdev.as_ref(),
> -                    c_str!("nova-drm"),
> +                    c"nova-drm",
>                     0, // TODO[XARR]: Once it lands, use XArray; for =
now we don't use the ID.
>                     crate::MODULE_NAME
>                 ),
>=20
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20251222-cstr-nova-c13a8ec1d068
>=20
> Best regards,
> -- =20
> Tamir Duberstein <tamird@gmail.com>
>=20
>=20

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>=
