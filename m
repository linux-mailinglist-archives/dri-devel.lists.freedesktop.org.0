Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7DBA92C2E
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 22:20:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E30DB10E3B9;
	Thu, 17 Apr 2025 20:20:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="m3Eae7CV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23DCB10E3B9
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 20:20:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 961905C0477;
 Thu, 17 Apr 2025 20:17:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1507EC4CEE4;
 Thu, 17 Apr 2025 20:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744921214;
 bh=BQR63fIYU7Hvg0pLeH3+AIk9Z8ZmOCFlDxnTQjiJsIc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m3Eae7CVP6SklxSvECPc5VW5G4XlHlenMQGvsZWpLtsSPt8NhdBGVL3MHUQBUY4GX
 92NdkP/0El4Ylv81nFDFyXD51muHPTpxHn2xv2rRz0kNw3qQJmlc97L+VmhxMSsBAm
 7fVwkXigySuLZJf58Mx6tOrWQ7q/IMSXULbMu6tU1bApKrAXnlS1Wk2wi4P04CwlwM
 qCl4GDtkfBqwe+P94M2WqqTisHjie1xFQwXUx23M8cMNHBbajdMFIRxtqA8HokDS8K
 tXoJwUkK4FCuSZTN+hiWUGqh0NiLsBQmHbx9r5a8Mzq4Tt1GOO1BLV38aGyHmFmvgK
 zoszaaLuzpHaQ==
Date: Thu, 17 Apr 2025 22:20:07 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Lyude Paul <lyude@redhat.com>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, lina@asahilina.net,
 daniel.almeida@collabora.com, j@jannau.net, alyssa@rosenzweig.io,
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 4/8] rust: drm: add device abstraction
Message-ID: <aAFidyQbGQmgnk5D@cassiopeiae>
References: <20250410235546.43736-1-dakr@kernel.org>
 <20250410235546.43736-5-dakr@kernel.org>
 <2e17276392566ed009a80bfd9bccaed3792b9f66.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2e17276392566ed009a80bfd9bccaed3792b9f66.camel@redhat.com>
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

On Thu, Apr 17, 2025 at 02:53:33PM -0400, Lyude Paul wrote:
> On Fri, 2025-04-11 at 01:55 +0200, Danilo Krummrich wrote:
> > +    /// Not intended to be called externally, except via declare_drm_ioctls!()
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// Callers must ensure that `ptr` is valid, non-null, and has a non-zero reference count,
> > +    /// i.e. it must be ensured that the reference count of the C `struct drm_device` `ptr` points
> > +    /// to can't drop to zero, for the duration of this function call and the entire duration when
> > +    /// the returned reference exists.
> > +    ///
> > +    /// Additionally, callers must ensure that the `struct device`, `ptr` is pointing to, is
> > +    /// embedded in `Self`.
> > +    #[doc(hidden)]
> > +    pub unsafe fn as_ref<'a>(ptr: *const bindings::drm_device) -> &'a Self {
> > +        // SAFETY: By the safety requirements of this function `ptr` is a valid pointer to a
> > +        // `struct drm_device` embedded in `Self`.
> > +        let ptr = unsafe { Self::from_drm_device(ptr) };
> > +
> > +        // SAFETY: `ptr` is valid by the safety requirements of this function.
> > +        unsafe { &*ptr.cast() }
> > +    }
> > +}
> 
> Hm. Are we sure that `as_ref()` is really the function name we want here? We
> already have AsRef<kernel::device::Device> implemented for DRM devices, I'm
> not sure if this function would cause a naming conflict since it doesn't use
> self but at the very least it does seem a little bit confusing.
> 
> Why not call it either from_raw(), or (depending on what RFL people think)
> from_c()?

I chose as_ref() for consistency. Wherever we convert from some pointer type to
&Self, we use as_ref(); when we convert from some pointer type to Self we use
from_raw() (from_c() isn't really a thing). Hence I'd like to keep it as_ref().
