Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0C6AB1EA0
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 23:00:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 697C210EADB;
	Fri,  9 May 2025 20:59:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="eQHiEkGZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD4EA10EADB
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 20:59:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1746824377; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=iS4EoERGufg4h9g1Sl1xcp5SS6+dZUsOL6e90+pg9roc9bEMF02fh9+RWXuw1iITvuXyGlbVERga2E5LSSLiysGfbjxsaxuved3wdDmhi/JsO0LljNvVNBRXlID0ymB4LUbdIfMxgGX8ToBqI4vc1doBQLXmtTee7jcr9Rhinwk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1746824377;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=FQ4domWWSYQmkqX0C80/xhZ4Ifn039lPDyM32omypxc=; 
 b=oF/tqNJc0cERpTkZ/UuyieL9WmvqufoRELL45cgQIRogmv04WwKbARRano3m6uDa+M49/jVWD05wajeoibuuXCo7r7VYtUpZQtvMsNSye5+hGU7bCFPGaD9IeiYK1cUEWYtcceY2bkoqwDIoojskvkAn4oKNonY+xYtGudu9/N4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746824377; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=FQ4domWWSYQmkqX0C80/xhZ4Ifn039lPDyM32omypxc=;
 b=eQHiEkGZzH0NUVAy8D3N9US0q6Xgz5EDYqMHJsNaDyZSW6BZC7YUGG8jenJaG+g9
 Upqp/xnhpi0Ca+ptCtyz+ofY+d9citpmp8ik1iL2jZ5HVDkbGTCZioHAx5Mrd2sOfOW
 KuSucLXi+VVvrHevjwcK9FtBG9zQjM7BL5dBRQXo=
Received: by mx.zohomail.com with SMTPS id 1746824374242956.6494512089765;
 Fri, 9 May 2025 13:59:34 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.500.181.1.5\))
Subject: Re: [PATCH 1/4] rust: drm: gem: Use NonNull for Object::dev
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250501183717.2058109-2-lyude@redhat.com>
Date: Fri, 9 May 2025 17:59:15 -0300
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Asahi Lina <lina@asahilina.net>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
Content-Transfer-Encoding: quoted-printable
Message-Id: <6066097F-3A5C-4756-8772-300B27D2DF3A@collabora.com>
References: <20250501183717.2058109-1-lyude@redhat.com>
 <20250501183717.2058109-2-lyude@redhat.com>
To: Lyude Paul <lyude@redhat.com>
X-Mailer: Apple Mail (2.3826.500.181.1.5)
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

> On 1 May 2025, at 15:33, Lyude Paul <lyude@redhat.com> wrote:
>=20
> There is usually not much of a reason to use a raw pointer in a data
> struct, so move this to NonNull instead.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
> rust/kernel/drm/gem/mod.rs | 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
> index 0cafa4a424206..df8f9fdae5c22 100644
> --- a/rust/kernel/drm/gem/mod.rs
> +++ b/rust/kernel/drm/gem/mod.rs
> @@ -177,7 +177,7 @@ impl<T> BaseObject for T where Self: =
crate::types::AlwaysRefCounted + IntoGEMObj
> #[pin_data]
> pub struct Object<T: DriverObject + Send + Sync> {
>     obj: Opaque<bindings::drm_gem_object>,
> -    dev: *const drm::Device<T::Driver>,
> +    dev: NonNull<drm::Device<T::Driver>>,
>     #[pin]
>     data: T,
> }
> @@ -212,7 +212,7 @@ pub fn new(dev: &drm::Device<T::Driver>, size: =
usize) -> Result<ARef<Self>> {
>                 data <- T::new(dev, size),
>                 // INVARIANT: The drm subsystem guarantees that the =
`struct drm_device` will live
>                 // as long as the GEM object lives.
> -                dev,
> +                dev: dev.into(),
>             }),
>             GFP_KERNEL,
>         )?;
> @@ -237,7 +237,7 @@ pub fn new(dev: &drm::Device<T::Driver>, size: =
usize) -> Result<ARef<Self>> {
>     pub fn dev(&self) -> &drm::Device<T::Driver> {
>         // SAFETY: The DRM subsystem guarantees that the `struct =
drm_device` will live as long as
>         // the GEM object lives, hence the pointer must be valid.
> -        unsafe { &*self.dev }
> +        unsafe { self.dev.as_ref() }
>     }
>=20
>     fn as_raw(&self) -> *mut bindings::drm_gem_object {
> --=20
> 2.48.1
>=20
>=20

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

