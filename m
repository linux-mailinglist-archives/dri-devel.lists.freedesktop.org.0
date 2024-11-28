Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 043789DB9B7
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2024 15:35:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C6FC10ECAF;
	Thu, 28 Nov 2024 14:35:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="Kt1b3ruF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52EC810ECAF
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2024 14:35:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1732804530; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=G9tOl2c/pmW3qIlBgnDlA1pSbaUb5zTTgttC9vYtERr1Km96bnQQbwSoM98AE9uVqbc4hLDpYR8FeXhJzwbNvH7zHYwY0ixOCE+M+2T98Pps1RgmJTRNX/VkOiWt9GQxtHMyjx0AWsZD2Gboxw/5iSUYOeW+g4NJ8QE5JDbOTek=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1732804530;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=LlQpQrrgOvxBRdlUaMsgHL2POaoCtH3XhZplRdec73s=; 
 b=DIBC+ape4PR1UEW68ES5cMMsO7Yus3P54vWziYQUyGPbPH6HB44EbvjEPTLMverJFySegLFhqK4NRjFXW1kvoW3oaY5q74XYKXvxhd823E7JoKisNtfHTsHS+uvEYkVC1yhaXcACjhVKy1eda06fyKzizPXxt/rKIjYL+9DPyNU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732804530; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=LlQpQrrgOvxBRdlUaMsgHL2POaoCtH3XhZplRdec73s=;
 b=Kt1b3ruFOnsmxlBc5j5Le8Ow7mzcQTxwGvamaxY3f6aqtNyaPalii4w3kITop01P
 Jo5DfEAu86rfy77CyLGzUr4q9/08rqoTwWBRvzERJxQYD2xXZaCFGlQ+3Q0C1p8ojfD
 AEpAiJem+QfgIj9f89Lk10300PiwOlspEkAavoyo=
Received: by mx.zohomail.com with SMTPS id 1732804528673915.0791108851192;
 Thu, 28 Nov 2024 06:35:28 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.200.121\))
Subject: Re: [WIP RFC v2 31/35] rust: drm: Add Device::event_lock()
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20240930233257.1189730-32-lyude@redhat.com>
Date: Thu, 28 Nov 2024 11:35:13 -0300
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
 Danilo Krummrich <dakr@redhat.com>,
 open list <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <03FF521C-1F9D-48A7-9EDC-688157046DAE@collabora.com>
References: <20240930233257.1189730-1-lyude@redhat.com>
 <20240930233257.1189730-32-lyude@redhat.com>
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
> This is just a crate-private helper to use Lock::from_raw() to provide =
an
> immutable reference to the DRM event_lock, so that it can be used like =
a
> normal rust spinlock. We'll need this for adding vblank related =
bindings.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
> rust/kernel/drm/device.rs | 7 +++++++
> 1 file changed, 7 insertions(+)
>=20
> diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
> index d4d6b1185f6a6..207e7ea87cf8f 100644
> --- a/rust/kernel/drm/device.rs
> +++ b/rust/kernel/drm/device.rs
> @@ -15,6 +15,7 @@
>     error::from_err_ptr,
>     error::Result,
>     types::{ARef, AlwaysRefCounted, ForeignOwnable, Opaque},
> +    sync::*,
> };
> use core::{
>     ffi::c_void,
> @@ -159,6 +160,12 @@ pub fn data(&self) -> <T::Data as =
ForeignOwnable>::Borrowed<'_> {
>         unsafe { <T::Data as =
ForeignOwnable>::from_foreign(drm.raw_data()) };
>     }
>=20
> +    /// Returns a reference to the `event` spinlock
> +    pub(crate) fn event_lock(&self) -> &SpinLockIrq<()> {
> +        // SAFETY: `event_lock` is initialized for as long as `self` =
is exposed to users
> +        unsafe { SpinLockIrq::from_raw(&mut =
(*self.as_raw()).event_lock) }
> +    }
> +

I see this depends on your SpinLockIrq series, which I will get to =
later. I will defer any comments
until then.

>     pub(crate) const fn has_kms() -> bool {
>         <T::Kms as KmsImplPrivate>::MODE_CONFIG_OPS.is_some()
>     }
> --=20
> 2.46.1
>=20
>=20

=E2=80=94 Daniel

