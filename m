Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D711D9DB993
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2024 15:27:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 825D210EC8D;
	Thu, 28 Nov 2024 14:27:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="WhBbX/RH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7183410EC8D
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2024 14:27:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1732804018; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=M1I+R5hdGrfBQtFpfqbuU9AcQm+ENDw21pA+ztFM8QVYrMKPTTjU4xFMqv5SAjP9UhUdGsxoE82RpM1V0cs1QdzdrFRo7nv6Z8sTlhs6JtgNv8RLfKa/qA4Q2TgJTpARSUXAztOLirzCvqUrlSds7ZSkEynMMch4uoHD4kc5i7E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1732804018;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=BTc+58swVCnQAxbgfn+nct2bnJo2uB0XZdEQl2ZEf2M=; 
 b=Eo8cbIH8dHJjqNQlICxpQkOkTdnidKvqbgrM1xWzgSNl+ekciRrvYyL3s+7ksM2qLiknyXh1bYy0Sc0rlrcNCbJwU+xrZS1MYY5MpC46xnij0FnWPAZdXIy9WKEHY2rhg6m2dfcVWi2lvRh0a8kLztNsB2cN1CsdLhkKyktFG7I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732804018; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=BTc+58swVCnQAxbgfn+nct2bnJo2uB0XZdEQl2ZEf2M=;
 b=WhBbX/RHlGsMUlVCUkI7AWGgbzJ3A4XYZWSDfsmieBVjFnZ1igdCdtoIH9oa/8B9
 cEJzleDGMMT8z/gBrVwXsAq0TVF16CPDFgIW2bp7/aVo3ez8F1EmYcTRM4m64986hTJ
 Ym0WnFuEn9Z8t76w3POfeWogTN4b6iFArENutINw=
Received: by mx.zohomail.com with SMTPS id 1732804017539591.382249497848;
 Thu, 28 Nov 2024 06:26:57 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.200.121\))
Subject: Re: [WIP RFC v2 27/35] rust: drm/kms: Add drm_framebuffer bindings
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20240930233257.1189730-28-lyude@redhat.com>
Date: Thu, 28 Nov 2024 11:26:42 -0300
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
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <B9ADBAF1-7A13-4756-8787-C05CF36DC2BD@collabora.com>
References: <20240930233257.1189730-1-lyude@redhat.com>
 <20240930233257.1189730-28-lyude@redhat.com>
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



> On 30 Sep 2024, at 20:10, Lyude Paul <lyude@redhat.com> wrote:
>=20
> This adds some very simple bindings for drm_framebuffer. We don't use =
them
> much yet, but we'll eventually be using them when rvkms eventually =
gets CRC
> and writeback support. Just like Connector objects, these use =
RcModeObject.

Yeah, for the non-KMS devs like me, a brief explanation on CRC and =
writeback support
would be helpful

>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
> rust/bindings/bindings_helper.h    |  1 +
> rust/kernel/drm/kms.rs             |  1 +
> rust/kernel/drm/kms/framebuffer.rs | 58 ++++++++++++++++++++++++++++++
> 3 files changed, 60 insertions(+)
> create mode 100644 rust/kernel/drm/kms/framebuffer.rs
>=20
> diff --git a/rust/bindings/bindings_helper.h =
b/rust/bindings/bindings_helper.h
> index 7695f11f4363c..7c324003c3885 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -15,6 +15,7 @@
> #include <drm/drm_fourcc.h>
> #include <drm/drm_fbdev_dma.h>
> #include <drm/drm_fbdev_shmem.h>
> +#include <drm/drm_framebuffer.h>
> #include <drm/drm_gem.h>
> #include <drm/drm_gem_framebuffer_helper.h>
> #include <drm/drm_gem_shmem_helper.h>
> diff --git a/rust/kernel/drm/kms.rs b/rust/kernel/drm/kms.rs
> index 4ab039d67352e..3edd90bc0025a 100644
> --- a/rust/kernel/drm/kms.rs
> +++ b/rust/kernel/drm/kms.rs
> @@ -7,6 +7,7 @@
> pub mod crtc;
> pub mod encoder;
> pub mod fbdev;
> +pub mod framebuffer;
> pub mod plane;
>=20
> use crate::{
> diff --git a/rust/kernel/drm/kms/framebuffer.rs =
b/rust/kernel/drm/kms/framebuffer.rs
> new file mode 100644
> index 0000000000000..bbe408c187670
> --- /dev/null
> +++ b/rust/kernel/drm/kms/framebuffer.rs
> @@ -0,0 +1,58 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +//! DRM Framebuffer related bindings
> +
> +use crate::{
> +    drm::{
> +        device::Device,
> +        fourcc::*,
> +    },
> +    types::*,
> +    prelude::*,
> +};
> +use bindings;
> +use core::{
> +    marker::*,
> +    slice,
> +};
> +use super::{ModeObject, RcModeObject, KmsDriver};
> +
> +/// The main interface for [`struct drm_framebuffer`].
> +///
> +/// [`struct drm_framebuffer`]: srctree/include/drm/drm_framebuffer.h
> +#[repr(transparent)]
> +pub struct Framebuffer<T: KmsDriver> {
> +    inner: Opaque<bindings::drm_framebuffer>,
> +    _p: PhantomData<T>,
> +}
> +
> +impl<T: KmsDriver> ModeObject for Framebuffer<T> {
> +    type Driver =3D T;
> +
> +    fn drm_dev(&self) -> &Device<Self::Driver> {
> +        unsafe { Device::borrow((*self.inner.get()).dev) }
> +    }
> +
> +    fn raw_mode_obj(&self) -> *mut bindings::drm_mode_object {
> +        // SAFETY: We don't expose Framebuffer<T> to users before =
it's initialized, so `base` is
> +        // always initialized
> +        unsafe { &mut (*self.inner.get()).base }
> +    }
> +}
> +
> +// SAFETY: Framebuffers are refcounted mode objects.
> +unsafe impl<T: KmsDriver> RcModeObject for Framebuffer<T> {}
> +
> +// SAFETY: References to framebuffers are safe to be accessed from =
any thread
> +unsafe impl<T: KmsDriver> Send for Framebuffer<T> {}
> +// SAFETY: References to framebuffers are safe to be accessed from =
any thread
> +unsafe impl<T: KmsDriver> Sync for Framebuffer<T> {}
> +
> +impl<T: KmsDriver> crate::private::Sealed for Framebuffer<T> {}

A brief comment on why you=E2=80=99re implementing Sealed would also be =
good :)

> +
> +impl<T: KmsDriver> Framebuffer<T> {
> +    #[inline]
> +    pub(super) unsafe fn from_raw<'a>(ptr: *const =
bindings::drm_framebuffer) -> &'a Self {
> +        // SAFETY: Our data layout is identical to drm_framebuffer
> +        unsafe { &*ptr.cast() }
> +    }
> +}
> --=20
> 2.46.1
>=20

This LGTM.

=E2=80=94 Daniel

