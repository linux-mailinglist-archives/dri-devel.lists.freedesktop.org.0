Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4154A92C4E
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 22:32:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13AF310E3C1;
	Thu, 17 Apr 2025 20:32:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VilTy9rD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 434C610E3C2
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 20:31:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id DAD13A439FE;
 Thu, 17 Apr 2025 20:26:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D35DDC4CEE4;
 Thu, 17 Apr 2025 20:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744921913;
 bh=/Pf9q9FrAgEfkl3TjCu8o/rJ7TAc4S1Kvgr/sn22Vy4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VilTy9rDBzfBNfcfbd7MPK0w0+aWxqJFxPwpkNnPJnL9uB4cdvkgeGAyiW5TeFHgQ
 XkhcGXPlNOhj0xl7vq7RiRSe+lGdV7c1ZF/sYUenFkKvypSBhs7g3/DEcucwUFTCmy
 aHebVBuSsf638tp2OXkDYwxHJVKIxOfP41lqB10WtK319crM9U7C1s8SBNEpDQ3PaY
 1DtQ3KjK4tK2+W77+N0R0F92coLR15vIe1DxC+6DgQnb09xCVRUQQXUC8a2BmYBjyR
 zy3pHg/aDE6stKwNQq68FNW4DlQ3QpGsxd54TxEdk7McEgzr9Yk8aXN9h6ps16pEdz
 /i7ZrKc2NMa3g==
Date: Thu, 17 Apr 2025 22:31:46 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Lyude Paul <lyude@redhat.com>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, lina@asahilina.net,
 daniel.almeida@collabora.com, j@jannau.net, alyssa@rosenzweig.io,
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 7/8] rust: drm: gem: Add GEM object abstraction
Message-ID: <aAFlMmZxa8V-SFn7@cassiopeiae>
References: <20250410235546.43736-1-dakr@kernel.org>
 <20250410235546.43736-8-dakr@kernel.org>
 <1ea450fdef728a5c783738c0770ea38ba6db39f2.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ea450fdef728a5c783738c0770ea38ba6db39f2.camel@redhat.com>
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

On Thu, Apr 17, 2025 at 02:42:24PM -0400, Lyude Paul wrote:
> On Fri, 2025-04-11 at 01:55 +0200, Danilo Krummrich wrote:
> > +/// A base GEM object.
> > +///
> > +/// Invariants
> > +///
> > +/// `self.dev` is always a valid pointer to a `struct drm_device`.
> > +#[repr(C)]
> > +#[pin_data]
> > +pub struct Object<T: DriverObject + Send + Sync> {
> > +    obj: Opaque<bindings::drm_gem_object>,
> > +    dev: ptr::NonNull<bindings::drm_device>,
> 
> Not a huge deal but why don't we just use NonNull<device::Device<T::Driver>>
> here?

Yeah, we could indeed also use NonNull<drm::Device<T::Driver>> instead, but I
think it doesn't really make a difference.

We only need it in Object::dev(), and the unsafe call would change from

	unsafe { drm::Device::as_ref(self.dev.as_ptr()) }

to
	unsafe { &*self.dev.as_ptr() }

I'm fine either way.

> > +// SAFETY: Instances of `Object<T>` are always reference-counted.
> > +unsafe impl<T: DriverObject> crate::types::AlwaysRefCounted for Object<T> {
> > +    fn inc_ref(&self) {
> > +        // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
> > +        unsafe { bindings::drm_gem_object_get(self.as_raw()) };
> > +    }
> > +
> > +    unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
> > +        // SAFETY: `obj` is a valid pointer to an `Object<T>`.
> > +        let obj = unsafe { obj.as_ref() };
> > +
> > +        // SAFETY: The safety requirements guarantee that the refcount is non-zero.
> > +        unsafe { bindings::drm_gem_object_put(obj.as_raw()) }
> > +    }
> > +}
> 
> So - as far as I can tell pretty much every gem object is going to be using
> the same object_get/object_put() functions - so instead of implementing
> AlwaysRefCounted for Object<T> why not handle this the other way around?
> 
> unsafe impl<T: IntoGEMObject> AlwaysRefCounted for T {
>   /* ... */
> }
> 
> That way you can also make IntoGEMObject a super-trait of AlwaysRefCounted, so
> the AlwaysRefCounted trait bound will be implied instead of having to specify
> it manually all over the place.

That is a great idea!

Since the current implementation should be correct, do you want to implement
this improvement in a subsequent patch? :)
