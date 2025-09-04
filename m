Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AD8B44276
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 18:16:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AF1410E071;
	Thu,  4 Sep 2025 16:16:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="YnoKmLxf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E21C810E071
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 16:16:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1757002602; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=VHMYafhZFE2pstJbX0WhsvQVHtyyyFgCvVKQ3nO5Ilwy5s9+qiXR6/NDUee9kV/Xvm0I0whyov8yvtNAyNJtZBFfrbljwKTBHvYRJv3xvNzenqQ8WXYCgfbqJN/DDbVWqT9QFwCQ2d62Dwx1/Q6DJ8G5s2NyruqN9vF/JHoFzVg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1757002602;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=FIqcoPZSc1O3/JVIvRpHNLeM+xtMfjWtg6IHGtGPB9M=; 
 b=VktHaoNE3ghG/Rp38dGH3zb2IAwEqWaLlhG9Cc6g9zkJfXNJj95tMUg7FHJRCFY+SH7OENHpmRFDAZJgFFKIP9XttaBJz+872H2rok1RlPOhRhZnfEf8ZVhPFOyja9qStx3i7rDOEeoFYI4WCUbxnw3tVr3EmrMDwaAQiM3Zwv8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757002602; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=FIqcoPZSc1O3/JVIvRpHNLeM+xtMfjWtg6IHGtGPB9M=;
 b=YnoKmLxfdFea7bkc4g6zROBrQB6TPG/6gccwAfRJBqq63fbKnvn+XO0mwnkkEg0n
 nY9dly0GuhXtCrUhHj6SY1h4DSldODjdCbAFLnKuIitBP8/W8owMowpz3NyiZ1mrhXn
 rtxgaCn8cuE0HX6vquorJXulozUSTbc9dnxekLhg=
Received: by mx.zohomail.com with SMTPS id 1757002600009698.7115522639169;
 Thu, 4 Sep 2025 09:16:40 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v3 12/14] rust: Add dma_buf stub bindings
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250829224116.477990-13-lyude@redhat.com>
Date: Thu, 4 Sep 2025 13:16:22 -0300
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Tamir Duberstein <tamird@gmail.com>,
	Xiangfei Ding <dingxiangfei2009@gmail.com>,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	"open list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b <linux-media"@vger.kernel.org (ope>),
	"moderated list:DMA BUFFER SHARING  FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b <linaro-mm-sig"@lists.linaro.org (mod>)
Content-Transfer-Encoding: quoted-printable
Message-Id: <88013821-0710-4B52-B622-3BAB429A6254@collabora.com>
References: <20250829224116.477990-1-lyude@redhat.com>
 <20250829224116.477990-13-lyude@redhat.com>
To: Lyude Paul <lyude@redhat.com>
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



> On 29 Aug 2025, at 19:35, Lyude Paul <lyude@redhat.com> wrote:
>=20
> In order to implement the gem export callback, we need a type to =
represent
> struct dma_buf. So - this commit introduces a set of stub bindings for
> dma_buf. These bindings provide a ref-counted DmaBuf object, but don't
> currently implement any functionality for using the DmaBuf.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
>=20
> ---
> V3:
> * Rename as_ref() to from_raw()
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
> rust/kernel/dma_buf.rs | 40 ++++++++++++++++++++++++++++++++++++++++
> rust/kernel/lib.rs     |  1 +
> 2 files changed, 41 insertions(+)
> create mode 100644 rust/kernel/dma_buf.rs
>=20
> diff --git a/rust/kernel/dma_buf.rs b/rust/kernel/dma_buf.rs
> new file mode 100644
> index 0000000000000..a66829afcd129
> --- /dev/null
> +++ b/rust/kernel/dma_buf.rs
> @@ -0,0 +1,40 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! DMA buffer API

Missing period?

> +//!
> +//! C header: =
[`include/linux/dma-buf.h`](srctree/include/linux/dma-buf.h)
> +
> +use bindings;
> +use kernel::types::*;
> +
> +/// A DMA buffer object.
> +///
> +/// # Invariants
> +///
> +/// The data layout of this type is equivalent to that of `struct =
dma_buf`.
> +#[repr(transparent)]
> +pub struct DmaBuf(Opaque<bindings::dma_buf>);
> +
> +// SAFETY: `struct dma_buf` is thread-safe
> +unsafe impl Send for DmaBuf {}
> +// SAFETY: `struct dma_buf` is thread-safe
> +unsafe impl Sync for DmaBuf {}
> +
> +#[expect(unused)]
> +impl DmaBuf {
> +    /// Convert from a `*mut bindings::dma_buf` to a [`DmaBuf`].
> +    ///
> +    /// # Safety
> +    ///
> +    /// The caller guarantees that `self_ptr` points to a valid =
initialized `struct dma_buf` for the
> +    /// duration of the lifetime of `'a`, and promises to not violate =
rust's data aliasing rules
> +    /// using the reference provided by this function.
> +    pub(crate) unsafe fn from_raw<'a>(self_ptr: *mut =
bindings::dma_buf) -> &'a Self {
> +        // SAFETY: Our data layout is equivalent to `dma_buf` .
> +        unsafe { &*self_ptr.cast() }
> +    }
> +
> +    pub(crate) fn as_raw(&self) -> *mut bindings::dma_buf {
> +        self.0.get()
> +    }
> +}
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index fcffc3988a903..59242d83efe21 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -81,6 +81,7 @@
> pub mod device_id;
> pub mod devres;
> pub mod dma;
> +pub mod dma_buf;
> pub mod driver;
> #[cfg(CONFIG_DRM =3D "y")]
> pub mod drm;
> --=20
> 2.50.0
>=20

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

