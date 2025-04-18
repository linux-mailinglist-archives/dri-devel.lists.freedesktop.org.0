Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7F0A9319E
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 07:38:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2E4D10E1EF;
	Fri, 18 Apr 2025 05:31:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jR0JTqnR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B19E510E1EF
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 05:31:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 51320A4B1FA;
 Fri, 18 Apr 2025 05:26:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE1FCC4CEEC;
 Fri, 18 Apr 2025 05:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744954288;
 bh=t78eeW8rpooSOC50VO4f2MXEiuTp2tAMO7oBbagNQcI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jR0JTqnRvpzp0ou+ooTqySeFI/Z9lxQPYcoWxAExNdoosFOLJUf0WMlKl16ItjgQ5
 Y7xLhXCNP1aSoueO1VUVtO3kzILlF2vF0cbS7IMKHMSXW9r9LAtiVOIVkEhS0PdmYS
 nAKzROQHn+2c8z2nMI1ZIhZDF0GB1V7vIu23UO4yGz6auhcwWIbEG2STyX1SPdxroK
 eQSi3zu0xrYJliFEO3VbsH97W2qQez1s/2FD5zvhvZzjjTjvIrDvuhLsvfBABVbMD4
 N15aTj2g0TUpugDAKOfRNnuU74ervycefMhKWkdoXrkTIAt1L+HKgrmfBkBCu+3Ox1
 wtz/pZUP1QPqw==
Date: Fri, 18 Apr 2025 07:31:21 +0200
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
Message-ID: <aAHjqSfCBXID7rOu@pollux>
References: <20250410235546.43736-1-dakr@kernel.org>
 <20250410235546.43736-8-dakr@kernel.org>
 <1ea450fdef728a5c783738c0770ea38ba6db39f2.camel@redhat.com>
 <aAFlMmZxa8V-SFn7@cassiopeiae>
 <587c41634c36043e84d8d653dc3f4584979089f3.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <587c41634c36043e84d8d653dc3f4584979089f3.camel@redhat.com>
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

On Thu, Apr 17, 2025 at 06:33:24PM -0400, Lyude Paul wrote:
> On Thu, 2025-04-17 at 22:31 +0200, Danilo Krummrich wrote:
> > On Thu, Apr 17, 2025 at 02:42:24PM -0400, Lyude Paul wrote:
> > > On Fri, 2025-04-11 at 01:55 +0200, Danilo Krummrich wrote:
> > > > +/// A base GEM object.
> > > > +///
> > > > +/// Invariants
> > > > +///
> > > > +/// `self.dev` is always a valid pointer to a `struct drm_device`.
> > > > +#[repr(C)]
> > > > +#[pin_data]
> > > > +pub struct Object<T: DriverObject + Send + Sync> {
> > > > +    obj: Opaque<bindings::drm_gem_object>,
> > > > +    dev: ptr::NonNull<bindings::drm_device>,
> > > 
> > > Not a huge deal but why don't we just use NonNull<device::Device<T::Driver>>
> > > here?
> > 
> > Yeah, we could indeed also use NonNull<drm::Device<T::Driver>> instead, but I
> > think it doesn't really make a difference.
> > 
> > We only need it in Object::dev(), and the unsafe call would change from
> > 
> > 	unsafe { drm::Device::as_ref(self.dev.as_ptr()) }
> > 
> > to
> > 	unsafe { &*self.dev.as_ptr() }
> > 
> > I'm fine either way.
> 
> If it doesn't make a difference then yeah, personally I would prefer the rust
> type over mixing the C type in. I think my preference just comes from the fact
> it feels more natural to use the rust-defined wrapper type wherever possible
> especially since it will give a bit more of a helpful documentation blurb for
> the type when using rust-analyzer. This can be done in a follow-up patch if
> you want as well

I will change it accordingly.
