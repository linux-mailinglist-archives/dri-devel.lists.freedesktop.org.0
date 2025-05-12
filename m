Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B16B4AB36B7
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 14:09:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FD0B10E18F;
	Mon, 12 May 2025 12:09:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZDCOwjKf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A275810E18F
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 12:09:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 620D6A4CB50;
 Mon, 12 May 2025 12:09:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9659C4CEE7;
 Mon, 12 May 2025 12:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747051754;
 bh=rbOQFiKsaQKA8Dslp+szQU+13m9/TNNVGrRqAYHCIyU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZDCOwjKfyGeI+pRaB1pX+m/OJFJqb6UwsrF+3tEwiEWntFt0OC2Nx6q+f7z6xz4Q/
 Ye0/WPf1YebjMZxZuOXiA0R1XQZTAgUw+cFPcDpPFQJn3qyCrUK1RKrzlQ+SkLRkwv
 CKn88pxM8vY9jELjjnk1r16AvLcemT27x3hwXTgOT3zk0JBcBGxlFzPS+U8DGVmPuD
 kevQh+XXTBv7reksPAfcoypFckvfbA6aQTvsVvVlvf6LbaxHlj2z5dV8GOLWIr8pbn
 CyNw8RrPLknRHDPIa5LS1YxUmt6SpuGC7s+UsLXij6NdH8C/IJ4SOdSermjtJAqu8D
 dHe9ub9lll8OQ==
Date: Mon, 12 May 2025 14:09:07 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, lyude@redhat.com,
 lina@asahilina.net, daniel.almeida@collabora.com, j@jannau.net,
 alyssa@rosenzweig.io, ojeda@kernel.org, alex.gaynor@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 7/8] rust: drm: gem: Add GEM object abstraction
Message-ID: <aCHk4286hSrq2pym@pollux>
References: <20250410235546.43736-1-dakr@kernel.org>
 <20250410235546.43736-8-dakr@kernel.org>
 <CANiq72ks_1rEQYvYY464WOqAGKJTQpgvjM_RoBkHTJhMx1euyA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72ks_1rEQYvYY464WOqAGKJTQpgvjM_RoBkHTJhMx1euyA@mail.gmail.com>
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

On Mon, May 12, 2025 at 01:41:13PM +0200, Miguel Ojeda wrote:
> On Fri, Apr 11, 2025 at 1:56 AM Danilo Krummrich <dakr@kernel.org> wrote:
> >
> > +    fn from_gem_obj(obj: *mut bindings::drm_gem_object) -> *mut Self {
> > +        // SAFETY: All of our objects are Object<T>.
> > +        unsafe { crate::container_of!(obj, Object<T>, obj).cast_mut() }
> > +    }
> 
> Doing something unrelated, I got a Clippy warning about this public
> function not being unsafe, and while the lint talks about potentially
> dereferecing a pointer, it is still the case the `container_of` uses
> `byte_sub` which is why the macro requires both the in and out pointer
> to be in bounds of the same allocation.
> 
> So since someone may pass any pointer here, this should be unsafe, right?
> 
> Even if that is not correct, the `// SAFETY` comment should
> nevertheless explain why that holds, no?
> 
> I hope that helps.

Lyude's series [1] should address this and the other one you pointed out.

- Danilo

[1] https://lore.kernel.org/rust-for-linux/20250501183717.2058109-1-lyude@redhat.com/
