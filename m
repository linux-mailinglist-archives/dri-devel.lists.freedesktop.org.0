Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 241C2A53EB5
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 00:57:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C04C910E872;
	Wed,  5 Mar 2025 23:57:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jlnekHAY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC09610E86C;
 Wed,  5 Mar 2025 23:57:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id DF533A467A1;
 Wed,  5 Mar 2025 23:51:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96B9FC4CED1;
 Wed,  5 Mar 2025 23:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741219047;
 bh=QRJv6AFPFNy75p7zfaZ2IXSyUSPhoWe5fwtItKMg7Ts=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jlnekHAYXRKnKt2JxmOVnfIz5RncxlJkMw1jFjdFoajqFchcIl4oNvJspBVLte/CK
 b7iYMcyvyHaESdqBVRMROUG3lc/r0CzYUpEHHLCzx89rjFNBGit5Ef2baSZYshn/xj
 xMn5+Q6CJDUo1Y4sco/dP4RikYTfhtDv84nWCxI5Bggqo00ciivFCze0rQPskIl+oh
 aOw1Sbl/5ThhxOUyDV9bEjCNFmmBnkh5Zi/5YQVE8LSHKB+vTccBks+LEN45zbGhEn
 IdbrAJJynzIZZL6wr6VTmNeXxwi2EHAjjC9Hk4ons0SlloVT8ES3QZ7bZt46sZqzhj
 wxBfrWCvpCldQ==
Date: Thu, 6 Mar 2025 00:57:18 +0100
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
Message-ID: <Z8jk3qs6nCIJz-39@pollux>
References: <20250304173555.2496-1-dakr@kernel.org>
 <20250304173555.2496-3-dakr@kernel.org>
 <D88OSC9XJXZL.C5HXWFYCG9U6@proton.me> <Z8jSV5CpZDcXrviY@pollux>
 <D88Q7503C8FF.2TMMBSEMOGKU1@proton.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D88Q7503C8FF.2TMMBSEMOGKU1@proton.me>
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

On Wed, Mar 05, 2025 at 11:36:54PM +0000, Benno Lossin wrote:
> On Wed Mar 5, 2025 at 11:38 PM CET, Danilo Krummrich wrote:
> > On Wed, Mar 05, 2025 at 10:30:31PM +0000, Benno Lossin wrote:
> >> On Tue Mar 4, 2025 at 6:34 PM CET, Danilo Krummrich wrote:
> >> > +    /// Push an additional path component.
> >> > +    ///
> >> > +    /// After a new [`ModInfoBuilder`] instance has been created, [`ModInfoBuilder::prepare`] must
> >> > +    /// be called before adding path components.
> >> > +    pub const fn push(self, s: &str) -> Self {
> >> > +        if N != 0 && self.n == 0 {
> >> > +            crate::build_error!("Must call prepare() before push().");
> >>
> >> This will only prevent the first `prepare` call being missed, right?
> >
> > Correct, unfortunately there's no way to detect subsequent ones.
> 
> Does it make sense to do that one in the constructor?
> 
> (After looking at the example below) Ah maybe you can't do that, since
> then you would have two `prepare()` calls for the example below...?

Exactly.

> >> If you always have to call this before `push`, why not inline it there?
> >
> > You can push() multiple times to compose the firmware path string (which is the
> > whole purpose :).
> 
> Ah I see, I only looked at the example you have in the next patch. All
> in all, I think this patch could use some better documentation, since I
> had to read a lot of the code to understand what everything is supposed
> to do...

I can expand the example in module_firmware! to make things a bit more obvious.

Otherwise, what information do you think is missing?

> 
> It might also make sense to make this more generic, since one probably
> also needs this in other places? Or do you think this will only be
> required for modinfo?

Currently, I don't think there's any more need for a generic const string
builder. For now, I think we're good. Let's factor it out, once we have actual
need for that.
