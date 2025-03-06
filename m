Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D64BA53FEF
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 02:29:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5199710E88C;
	Thu,  6 Mar 2025 01:29:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CIxAk0i+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D425F10E88A;
 Thu,  6 Mar 2025 01:29:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 50757A46849;
 Thu,  6 Mar 2025 01:24:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8424C4CED1;
 Thu,  6 Mar 2025 01:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741224571;
 bh=dJlANX6sAseVQ82aST6VrHKfnrfmDH28jV7K8jzluCo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CIxAk0i+iwHHX3sEoNk1IxumZkXWViAVZV2acku/awxDPy+gl+YzahGURwoMXw83x
 Ck0e/vC1BzSQ5eRjXZeqBpGCxE7i5g0bCJd7eCSf6xA4+4+6LeTN158H/PDqEajra1
 DST1xE5667opKpTpyTswj7Ea84pVmftGXag1xkyDi6RM2Sv/sXOopQlGcN6NSjLXZG
 E3jj265/l/EupkA+TpM4ryz4YqSss3RGlA14zmHwwwbGqFtH18hVspBVqQwWY+LRic
 tWEi8fioKcNSWsfGipR0NIkS4Lp3I7qHd0hlxJNWiigOggZVZX5jZzdW2grupehWMn
 2HYcIRbjQbOFw==
Date: Thu, 6 Mar 2025 02:29:22 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Benno Lossin <benno.lossin@proton.me>
Cc: airlied@gmail.com, simona@ffwll.ch, corbet@lwn.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, ajanulgu@redhat.com, lyude@redhat.com,
 pstanner@redhat.com, zhiw@nvidia.com, cjia@nvidia.com,
 jhubbard@nvidia.com, bskeggs@nvidia.com, acurrid@nvidia.com,
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, a.hindborg@kernel.org,
 aliceryhl@google.com, tmgross@umich.edu, gregkh@linuxfoundation.org,
 mcgrof@kernel.org, russ.weight@linux.dev,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v5 2/5] rust: firmware: introduce
 `firmware::ModInfoBuilder`
Message-ID: <Z8j6ckpD6JVY4m-p@pollux>
References: <20250304173555.2496-1-dakr@kernel.org>
 <20250304173555.2496-3-dakr@kernel.org>
 <D88OSC9XJXZL.C5HXWFYCG9U6@proton.me> <Z8jSV5CpZDcXrviY@pollux>
 <D88Q7503C8FF.2TMMBSEMOGKU1@proton.me> <Z8jk3qs6nCIJz-39@pollux>
 <D88R7HI1Z6GG.ZOQ9A1VQOR28@proton.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D88R7HI1Z6GG.ZOQ9A1VQOR28@proton.me>
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

On Thu, Mar 06, 2025 at 12:24:21AM +0000, Benno Lossin wrote:
> On Thu Mar 6, 2025 at 12:57 AM CET, Danilo Krummrich wrote:
> > On Wed, Mar 05, 2025 at 11:36:54PM +0000, Benno Lossin wrote:
> >> On Wed Mar 5, 2025 at 11:38 PM CET, Danilo Krummrich wrote:
> >> > On Wed, Mar 05, 2025 at 10:30:31PM +0000, Benno Lossin wrote:
> >> >> On Tue Mar 4, 2025 at 6:34 PM CET, Danilo Krummrich wrote:
> >> >> > +    /// Push an additional path component.
> >> >> > +    ///
> >> >> > +    /// After a new [`ModInfoBuilder`] instance has been created, [`ModInfoBuilder::prepare`] must
> >> >> > +    /// be called before adding path components.
> >> >> > +    pub const fn push(self, s: &str) -> Self {
> >> >> > +        if N != 0 && self.n == 0 {
> >> >> > +            crate::build_error!("Must call prepare() before push().");
> >> >>
> >> >> This will only prevent the first `prepare` call being missed, right?
> >> >
> >> > Correct, unfortunately there's no way to detect subsequent ones.
> >>
> >> Does it make sense to do that one in the constructor?
> >>
> >> (After looking at the example below) Ah maybe you can't do that, since
> >> then you would have two `prepare()` calls for the example below...?
> >
> > Exactly.
> >
> >> >> If you always have to call this before `push`, why not inline it there?
> >> >
> >> > You can push() multiple times to compose the firmware path string (which is the
> >> > whole purpose :).
> >>
> >> Ah I see, I only looked at the example you have in the next patch. All
> >> in all, I think this patch could use some better documentation, since I
> >> had to read a lot of the code to understand what everything is supposed
> >> to do...
> >
> > I can expand the example in module_firmware! to make things a bit more obvious.
> >
> > Otherwise, what information do you think is missing?
> 
> Abstractly: what `ModInfoBuilder` *does*, concretely:
> - why the generic constant `N` exists,

It doesn't really matter to the user, since the user never needs to supply it.
That happens in the module_firmware! macro.

I agree it not good to not mention anything about it at all, but I wouldn't want
to bother the user with all implemention details.

We can probably just mention that it's used internally and is supplied by
module_firmware!. (That module_firmware! does that by doing a dry run of the
builder itself, isn't necessary to know for the user I think.)

> - what `prepare()` does,

Same here, it's an implementation detail not relevant to the user. All the user
needs to know is that prepare() acts as a separator to be able to supply the
next firmware path.

> - what happens with the `module_name` parameter of `new`

Should probably just mention it's supplied by module_firmware! and used
internally.

> - answer the question "I want that the builder outputs the string `???`
>   can it do that? If yes, how do I do it?"

All it does is concatenating multiple &str in const context, which I thought is
clear since there are only push() and prepare() as public methods.

May it be that your request is more about can we add more hints on the
implementation details rather than user focused documentation?
