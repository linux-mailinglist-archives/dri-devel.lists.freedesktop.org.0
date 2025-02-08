Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDB9A2D8BA
	for <lists+dri-devel@lfdr.de>; Sat,  8 Feb 2025 21:53:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9771410E14B;
	Sat,  8 Feb 2025 20:53:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mit.edu header.i=@mit.edu header.b="bR9oNLqb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 364 seconds by postgrey-1.36 at gabe;
 Sat, 08 Feb 2025 20:51:05 UTC
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3831010E14B
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Feb 2025 20:51:05 +0000 (UTC)
Received: from cwcc.thunk.org (pool-173-48-111-148.bstnma.fios.verizon.net
 [173.48.111.148]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 518KiGOj028750
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 8 Feb 2025 15:44:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
 t=1739047466; bh=i4/aJJgLvt2vX9K0kAeUf0wS62Jq2SDxN3YWCkva0QA=;
 h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
 b=bR9oNLqbfd3dv4YQX7/Vtgz/20TMk/PM5VyDusFulLscsAdL4ONdaEOs56qChYT8f
 c182rp019vz5W5sQhHNRDzdZC5uLWTb8jRsLVaA5uCvOUh/jEPWLpFn9VL8vF+gc9w
 ANqjOq/nhErzEJEH181/E8xs74J49IJoiRiNBt3N0b3vwfle3GjD3aSDnPfmNTYZLS
 Nv+pSJWqVVpN574IUPrps2xyxfBGe26zvJW1yw9NtUC2FwK9QrIVROJsArSWr41iHs
 /8c35u4E8ECXTcWTrpP/1qIkjwlxIuSFjfxB41M1EC4sj9aOEnCEx1innvruMfSX11
 G5G0uympP8mfA==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
 id 7C10915C013F; Sat, 08 Feb 2025 15:44:16 -0500 (EST)
Date: Sat, 8 Feb 2025 15:44:16 -0500
From: "Theodore Ts'o" <tytso@mit.edu>
To: "Dr. Greg" <greg@enjellic.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Hector Martin <marcan@marcan.st>, Dave Airlie <airlied@gmail.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Greg KH <gregkh@linuxfoundation.org>,
 phasta@kernel.org, Christoph Hellwig <hch@lst.de>,
 Danilo Krummrich <dakr@kernel.org>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 daniel.almeida@collabora.com, aliceryhl@google.com,
 robin.murphy@arm.com, rust-for-linux@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 Bj??rn Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Valentin Obst <kernel@valentinobst.de>,
 open list <linux-kernel@vger.kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, airlied@redhat.com,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>,
 DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: On community influencing (was Re: [PATCH v8 2/2] rust: add dma
 coherent allocator abstraction.)
Message-ID: <20250208204416.GL1130956@mit.edu>
References: <2025013030-gummy-cosmic-7927@gregkh>
 <20250130172437.GN5556@nvidia.com>
 <2025013148-reversal-pessimism-1515@gregkh>
 <20250131135421.GO5556@nvidia.com>
 <2b9b75d1-eb8e-494a-b05f-59f75c92e6ae@marcan.st>
 <Z6OzgBYZNJPr_ZD1@phenom.ffwll.local>
 <CAPM=9tzPR9wd=3Wbjnp-T0W8-dDfGah-H3Ny52G85B+2Ev9ksA@mail.gmail.com>
 <208e1fc3-cfc3-4a26-98c3-a48ab35bb9db@marcan.st>
 <CAHk-=wi=ZmP2=TmHsFSUGq8vUZAOWWSK1vrJarMaOhReDRQRYQ@mail.gmail.com>
 <20250207121638.GA7356@wind.enjellic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207121638.GA7356@wind.enjellic.com>
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

On Fri, Feb 07, 2025 at 06:16:38AM -0600, Dr. Greg wrote:
> 
> The all powerful sub-system maintainer model works well if the big
> technology companies can employ omniscient individuals in these roles,
> but those types are a bit hard to come by.

I'll let you in a secret.  The maintainers are not "all-powerfui".  We
are the "thin blue line" that is trying to keep the code to be
maintainable and high quality.  Like most leaders of volunteer
organization, whether it is the Internet Engineerint Task Force (the
standards body for the Internet), we actually have very little power.
We can not *command* people to work on retiring technical debt, or to
improve testing infrastructure, or work on some particular feature
that we'd very like for our users.

All we can do is stop things from being accepted (either in our
subsystem, or the imprimatur of the IETF).  Hopefully, we're only
stopping bad things from progressing, but that *really* is all we can
actually do.

One of the things which gets very frustrating from the maintainer's
perspective is development teams that are only interested in their pet
feature, and we *know*, through very bitter experience, that 95+% of
the time, once the code is accepted, the engineers which contribute
the code will disappear, never to be seen again.  As a result, a very
common dynamic is that maintainers will exercise the one and only
power which they have --- which is to refuse to accept code until it
is pretty much perfect --- since once we accept the code, we instantly
lose all leverge, and the contributors will be disappear, and we will
be left with the responsibility of cleanig up the mess.  (And once
there are users, we can't even rip out the code, since that would be a
user-visible regression.)

Occasionally, there is an accusation that different standards that
might apply for people who are in the "gold old buys club".  But what
isn't appreciated, is that it is precisely because people who are
long-term members of the community are trusted to stick around and
will support code that the have sponsored.  For example, Darrick Wong,
who contributed ext4 metadata checksuming support before we moved on
to become the XFS maintainer, is still reviewing and making
contributions to code that he contributed many years to ext4.  I've
been known to submit fixes to test bugs for xfs-specific tests in
xfstests that I discovered when running daily spinner tests on the
linux git tree.

Just in the past two weeks, I've spent 15+ hours working on cleaning
up a casefold "security fix" that had nasty on-disk backwards
compatibility issues.  Part of it was that it was ext4 (although I
discovered that there was also fsck.f2fs problems that had been
overlooked), but the *other* part of why I spent so much time was that
I sponsored the casefolding patches, and so I felt I certain moral
responsibility to make sure the code was continued to be maintained.

(And note, this has nothing to do with who employs me; the 15-20 hours
that I spent working on creating the fix and the test scripts was
purely on my own time, on the weekend, or late at night.  The time
that I spend doing this isn't reflected in my performance reviews, or
promotion propects --- in fact, arguably, over the past 15 years, this
has probably slowed down my promotion prospects; I've only been
promoted once since joining said big tech company...)

> Not sure what the fix is, from a project management perspective the
> technology industry has never faced a challenge like this.  The fork
> model, which was the classic protection in open-source, doesn't work
> at this scale.

Well, here's my suggestion.  Teams that want to get features,
especially ones that might be potentially disruptive, into the tree,
need to spend time becoming part of the *community*.  This means that
they need to participate in part of the joint effort to keep the code
maintainable and high quaity --- even if it isn't part of their
company's short-term goals, or directly related to their pet feature
that they are trying to get upstream.

This was the trust of my "Beyond Upstream First" presentation which I
gave to the Linux Foundation Member Summit last fall[1].

[1] https://docs.google.com/presentation/d/11rMc8PBeyMItV6hv31OHSZ626_6FCZxjX6ZxEAehCpQ/edit#slide=id.p

Now, I'll say that the Rust developers are making strides in the right
direction here.  Miguel has stood for election for the Technical
Adviory Board, and has been contributing in various ways beyond just
Rust for Linux.  Ultimately, Cristoph's concern is that Rust is going
to make life harder for maintainers because of particular build breaks
getting in the way of the very limited bandwidth that Maintainers have
(and again, a lot of the work that we do gets done on our own personal
time; it's rare that even those maintainers employed by a "big
technology company" have complete freedom to work on whatever they
want; and they certainly don't have minions employed to do all of the
grunt work to support code maintenance work, especially if we let
crappy code slip past us in the name of "time to market" concerns.)

So I think we'll get past this.  It might take some more effort, and
more trust building --- on both sides --- but I'm fairly optismistic
that it will happen.  It might not happe as *fast* as people might
like; as Linus pointed out, it took ten years for the Clang compiler
to be considered 100% fully supported --- and this was without needing
to worrying about language issues, including an upstream language
community which refuses to make any kind of backwards compatibility
guarantees, and which is *actively* hostile to a second Rust compiler
implementation (I suspect because it might limit their ability to make
arbitrary backwards-incompatble language changes).

> Obviously respect and open-mindedness to new ideas appears to be the
> grease that makes all of this run smoothly.  Unfortunately that seems
> to be about as rare a commodity as omniscience in our industry.

The other thing which is super rare is people and companies who care
about tech debt cleanup, code maintainability, and code quality.
Instead of complaining about maintainers for who are unreasonably
caring about these things, when they are desparately under-resourced
to do as good of a job as they industry demands, how about meeting us
half-way and *helping* us with these sort of long-term code health
issues?  Maybe if you engage us as part of the community, we'll be a
lot more open to adding changes that might increase the code
maintenance burden?

Cheers,

					- Ted
