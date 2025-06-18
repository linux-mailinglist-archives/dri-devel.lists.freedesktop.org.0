Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BCCADE72B
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 11:38:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8109910E05B;
	Wed, 18 Jun 2025 09:38:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nDAMDTLM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B30DE10E05B
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 09:38:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 91E71629C5;
 Wed, 18 Jun 2025 09:38:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AA3AC4CEE7;
 Wed, 18 Jun 2025 09:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750239526;
 bh=Dk4yynuLUZzdLhb5FVHjc9U3LZysX6xe3JJlSsT39M8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nDAMDTLM1J0youlb6K3un6RIsegAIe71aAVZKYlZNqCocGSR1R4PGVdnOydOBOIsi
 EaVptVlHCw/gjGeceazkbSOUt01S2EhCdYXpBsw78uvD1o0CVJnVf15FhCbqRpdKVN
 4+JeXwh/gKjy88xTZZVaKQSj1PTL2COk76mN+pYDnRCc7+pIyQuNf8qGW9ZWYfdVm0
 +UclJJlLzHN3EAfbl6leKnMXLxYz3I/cgnylMcgqGnkhcWk7K26SYeKj4fWNM2zoyl
 6+Szq0KbGRb8q6pIKRaO+P6UzhwFFv03vuj1NlnwL+fU8LIUMFFv6K1MoFNlo/cXm+
 nMOFBPg4llGtQ==
Date: Wed, 18 Jun 2025 11:38:40 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: types: add Opaque::from_raw
Message-ID: <aFKJILuksX90AJHc@pollux>
References: <20250617-opaque-from-raw-v1-1-a2e99efa3ba2@google.com>
 <aFFzi88miMbCZ0yQ@pollux> <aFJx2IqLfCjWsbVv@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFJx2IqLfCjWsbVv@google.com>
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

On Wed, Jun 18, 2025 at 07:59:20AM +0000, Alice Ryhl wrote:
> On Tue, Jun 17, 2025 at 03:54:19PM +0200, Danilo Krummrich wrote:
> > On Tue, Jun 17, 2025 at 01:36:47PM +0000, Alice Ryhl wrote:
> > > Since commit b20fbbc08a36 ("rust: check type of `$ptr` in
> > > `container_of!`") we have enforced that the field pointer passed to
> > > container_of! must match the declared field. This caused mismatches when
> > > using a pointer to bindings::x for fields of type Opaque<bindings::x>.
> > > 
> > > This situation encourages the user to simply pass field.cast() to the
> > > container_of! macro, but this is not great because you might
> > > accidentally pass a *mut bindings::y when the field type is
> > > Opaque<bindings::x>, which would be wrong.
> > > 
> > > To help catch this kind of mistake, add a new Opaque::from_raw that
> > > wraps a raw pointer in Opaque without changing the inner type.
> > 
> > The patch does more than that, it also adds a hint to container_of!() and fixes
> > up two occurences. I feel like we should split it up.
> 
> I think they go together pretty naturally, but I can split it if you
> insist.

Nah, it's also fine for me to keep it as is, but in that case we should also
mention the other changes in the commit message.

> > > +    /// The opposite operation of [`Opaque::raw_get`].
> > > +    pub const fn from_raw(this: *const T) -> *const Self {
> > 
> > Do we want to name this from_raw()? Usually from_raw() methods return either
> > Self or &'a Self.
> > 
> > Maybe something like cast_from() and rename raw_get() to cast_into()? I think
> > the latter may be confusing anyways, since it sounds like it would do somthing
> > with reference counting.
> 
> The name raw_get() mirrors the stdlib function UnsafeCell::raw_get().
> The stdlib uses this naming because in Rust the word "get" normally has
> nothing to do with reference counting - outside of the kernel, we use
> "clone" for incrementing refcounts and nobody would ever call it "get".

Yeah, I'm aware. The main reason I proposed cast_into() is that it would fit
much better with the newly introduced cast_from() (in case we go with that
name).

I'm happy with other proposals too, I just think that from_raw() would be a bit
inconsistent with how we use this name otherwise.

> That said, it may still be worth to rename the method. Thoughts?

I think it'd be good if it aligns naming wise with its counter part added in
this patch and I don't see this happening with raw_get(). :-)
