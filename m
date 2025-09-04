Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 102C9B43C2B
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 14:55:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DFE110EA20;
	Thu,  4 Sep 2025 12:55:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="BII/ePzk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56D3910EA24
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 12:55:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1756990551; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Ol/OxM4mp3DvaV5G8Oz2RkBldtrtCDfPwxGRyWQvSW417obvnAHslBBLEenHdNqeKHRCaqmBHM4xitqVV+aN3+zwDsrhhd1YAcWM1MnnJ6FlIZqQ+/UbhHE7beDm5NWyyR5GyzB0vx9ox0awcgDjvYTi+dZXQRQJlJ5RAg0gMv8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1756990551;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=4yQXcYDvDkWrXuTPgSfbG55Fo5/awg+Dvlk2c39nTQc=; 
 b=jE/9ASCAC5cm3vBRjWPE9ycgDNDjX6GGV+XfZ3OrfnQrnZnF2yJddB1Fc9MAc+P4lQZ5lvpmkFb9AK3hPKHNMuv+mja5OYsZAFM7959goLqkOtlCRxHzYNFF0VdtMnT0DEKVVjFxIfHvfrzfILf0Y6bJ/uHfJb+v9wtD+4l1LdA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756990551; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=4yQXcYDvDkWrXuTPgSfbG55Fo5/awg+Dvlk2c39nTQc=;
 b=BII/ePzk4ZuTOuSqHJxN5z0IMwtmpB+vcfs1mIJIRiLyZVBmGwCvTxSporJ1bfnm
 yMxiXPhW4aoAwy+RRgEcZZxnnA5kparef/DjjHMLEeuxC5kiId29Dq4/MYdae9Wj0om
 IqaSM45h59bp+8drZhSIUilh+H44dFXi86skHNyM=
Received: by mx.zohomail.com with SMTPS id 1756990548664140.47824642979833;
 Thu, 4 Sep 2025 05:55:48 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v3 06/14] rust: drm: gem: Add raw_dma_resv() function
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250829224116.477990-7-lyude@redhat.com>
Date: Thu, 4 Sep 2025 09:55:30 -0300
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
	Asahi Lina <lina+kernel@asahilina.net>, linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	"open list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b <linux-media"@vger.kernel.org (ope>),
	"moderated list:DMA BUFFER SHARING  FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b <linaro-mm-sig"@lists.linaro.org (mod>)
Content-Transfer-Encoding: quoted-printable
Message-Id: <4E13112B-6379-4466-8924-417AA6ACB228@collabora.com>
References: <20250829224116.477990-1-lyude@redhat.com>
 <20250829224116.477990-7-lyude@redhat.com>
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
> For retrieving a pointer to the struct dma_resv for a given GEM =
object. We
> also introduce it in a new trait, BaseObjectPrivate, which we =
automatically
> implement for all gem objects and don't expose to users outside of the
> crate.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
> rust/kernel/drm/gem/mod.rs | 12 ++++++++++++
> 1 file changed, 12 insertions(+)
>=20
> diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
> index ec36cd9ea69ed..f901d4263ee87 100644
> --- a/rust/kernel/drm/gem/mod.rs
> +++ b/rust/kernel/drm/gem/mod.rs
> @@ -186,6 +186,18 @@ fn create_mmap_offset(&self) -> Result<u64> {
>=20
> impl<T: IntoGEMObject> BaseObject for T {}
>=20
> +/// Crate-private base operations shared by all GEM object classes.
> +#[expect(unused)]
> +pub(crate) trait BaseObjectPrivate: IntoGEMObject {
> +    /// Return a pointer to this object's dma_resv.
> +    fn raw_dma_resv(&self) -> *mut bindings::dma_resv {
> +        // SAFETY: `as_gem_obj()` always returns a valid pointer to =
the base DRM gem object

This apparently does not match the actual function call below anymore.

> +        unsafe { (*self.as_raw()).resv }
> +    }
> +}
> +
> +impl<T: IntoGEMObject> BaseObjectPrivate for T {}
> +
> /// A base GEM object.
> ///
> /// Invariants
> --=20
> 2.50.0
>=20

