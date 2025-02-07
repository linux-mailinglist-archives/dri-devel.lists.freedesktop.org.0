Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3B1A2C9E9
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 18:14:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5802510EB86;
	Fri,  7 Feb 2025 17:14:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="EB4qZguv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47BA010EB81
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 17:14:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2D4DD5C709B;
 Fri,  7 Feb 2025 17:14:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E9F4C4CED1;
 Fri,  7 Feb 2025 17:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1738948481;
 bh=u/ED8JNnC1UQpHwKYWpyVLSbIfd3idX0j4jpEDRD/Po=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EB4qZguvpalT0C0z5a/gmU1Fx/oGkxoHt7O7oT5NG1M+IgG+gErAElJCoutxyOcyX
 A5ZLVUwf1kS+TT68/W3kyrxczesNU++Zz7xX8hX2jqAVzSKXaZrc4qpBW5aQgmXsep
 naRvC6qJ9IxhQQE4HYjYFv54gzi1+cJhRLxSN7nY=
Date: Fri, 7 Feb 2025 12:14:36 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Hector Martin <marcan@marcan.st>
Cc: Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@gmail.com>, 
 Jason Gunthorpe <jgg@nvidia.com>, Greg KH <gregkh@linuxfoundation.org>, 
 Linus Torvalds <torvalds@linux-foundation.org>, phasta@kernel.org,
 Christoph Hellwig <hch@lst.de>, 
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 daniel.almeida@collabora.com, aliceryhl@google.com, robin.murphy@arm.com, 
 rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Valentin Obst <kernel@valentinobst.de>,
 open list <linux-kernel@vger.kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, airlied@redhat.com, 
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>,
 DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: On community influencing (was Re: [PATCH v8 2/2] rust: add dma
 coherent allocator abstraction.)
Message-ID: <20250207-mature-pastel-rottweiler-e6dbd9@lemur>
References: <2025013030-gummy-cosmic-7927@gregkh>
 <20250130172437.GN5556@nvidia.com>
 <2025013148-reversal-pessimism-1515@gregkh>
 <20250131135421.GO5556@nvidia.com>
 <2b9b75d1-eb8e-494a-b05f-59f75c92e6ae@marcan.st>
 <Z6OzgBYZNJPr_ZD1@phenom.ffwll.local>
 <CAPM=9tzPR9wd=3Wbjnp-T0W8-dDfGah-H3Ny52G85B+2Ev9ksA@mail.gmail.com>
 <208e1fc3-cfc3-4a26-98c3-a48ab35bb9db@marcan.st>
 <Z6UPXxEJYpanU9iU@cassiopeiae>
 <4c0a7cf9-26e1-4a19-8a6e-7c30bc3aef86@marcan.st>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4c0a7cf9-26e1-4a19-8a6e-7c30bc3aef86@marcan.st>
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

On Fri, Feb 07, 2025 at 05:16:28AM +0900, Hector Martin wrote:
> And what I see, is very little effort to improve that status quo, or at
> least very little that yields any actual change that isn't just
> band-aids (e.g. tooling like b4, which is nice and appreciated, but
> doesn't fix any underlying issues). And that's not going to change no
> matter how many long technical arguments we have on the MLs (or even off
> MLs, since MLs are also not particularly good for this, and I've seen
> multiple arguments only reach a resolution after being redirected to IRC).

From my perspective, there are several camps clashing when it comes to the
kernel development model. One is people who are (rightfully) pointing out that
using the mailing lists was fine 20 years ago, but the world of software
development has vastly moved on to forges.

The other camp is people who (also rightfully) point out that kernel
development has always been decentralized and we should resist all attempts to
get ourselves into a position where Linux is dependent on any single
Benevolent Entity (Github, Gitlab, LF, kernel.org, etc), because this would
give that entity too much political or commercial control or, at the very
least, introduce SPoFs.

At best, I can hope to make both camps grumpily agree to coexist.

I *am* very wary of Benevolent Entities, because we have too many very recent
examples of companies "realigning priorities" when political winds shift.
Programs and initiatives that have until recently been poster board examples
of progress and benevolence are shuttered and defunded. I am concerned that
we're only a couple of mood swings away from someone deciding that free
software should not be allowed to exist because it benefits America's foes.
Many of us remember all too well when large tech giants treated Linux as a
"cancer" to be opposed, and I can certainly see that idea easily re-entering
some Big Brain in Charge.

From my perspective, I would like to ensure that Linux development can
continue without a hard dependency on a single centralized forge -- whether
controlled by a large commercial entity, or even a standalone one that is
operated by kernel.org. It's becoming shockingly difficult to operate a public
resource on the web unless you're willing to put it behind a large commercial
CDN that will protect you from hostile bots (and if you do that, you're back
to depending on the whims of a Benevolent Entity).

We're trying to get lore.kernel.org to the point where it's like a global
messaging bus that is indexed and searchable. Currently, you mostly have to
send things to a mailing list for them to end up on lore, but it's gradually
becoming less and less the case. We're already bridging with bugzilla and we
should be able to bridge with forges soon, too (currently delayed again
because I'm scrambling to move kernel.org frontends away from Equinix). Who
knows, we may be actually leapfrogging the forge era of software development
straight into "AI" agents era -- but that remains to be seen.

Anyway, all of this is to say that I'm happy that you've found b4 useful, but
I wouldn't view it as a band-aid -- it's just a very small and email-centric
way to interact with the kernel lore.

-K

