Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3B9A2CC07
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 19:54:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3C7110EBAB;
	Fri,  7 Feb 2025 18:54:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="smKJK53u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB00110EBAB
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 18:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
 :Subject; bh=EAcqYwz2jmB6Mvusczq8VIeE3A07B10hda1ej7t/Xe8=; b=smKJK53uK4eErOQV
 PDjUcgn3F89vn7KLBPpz/VkKUhnQuII8VRw7zR8UyeMBeNDJVSAxi12sNrwyadDFDtWWS0Xndz4SO
 ldx/PvWRDZgBXjf3APTyUBa4sguVxsFYPwiU+wjnbnjcsxAIN3j1R+6So9KLN5tk4s1TeG0wbhl9I
 rtezlIgvdtv+ZV8v5FYvDOMipJ1I7B05/bma9ABqItWYzGj2COLa8SutJ+aD4qvEuqArt9WCn1WBe
 0KuZ0ejFNeLfXX43LM1Wdk/qqTCWEkPFLm7EN38d/H/iQs5HGCi0olpebtywvE+qzfaW1r/QB3y/a
 ADK20FLy8pv2gt+KiQ==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
 (envelope-from <dg@treblig.org>) id 1tgTU3-00ELPl-1K;
 Fri, 07 Feb 2025 18:53:47 +0000
Date: Fri, 7 Feb 2025 18:53:47 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Hector Martin <marcan@marcan.st>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@gmail.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Greg KH <gregkh@linuxfoundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, phasta@kernel.org,
 Christoph Hellwig <hch@lst.de>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 daniel.almeida@collabora.com, aliceryhl@google.com,
 robin.murphy@arm.com, rust-for-linux@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Valentin Obst <kernel@valentinobst.de>,
 open list <linux-kernel@vger.kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, airlied@redhat.com,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>,
 DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: On community influencing (was Re: [PATCH v8 2/2] rust: add dma
 coherent allocator abstraction.)
Message-ID: <Z6ZWu44D9UCXVIgi@gallifrey>
References: <2025013148-reversal-pessimism-1515@gregkh>
 <20250131135421.GO5556@nvidia.com>
 <2b9b75d1-eb8e-494a-b05f-59f75c92e6ae@marcan.st>
 <Z6OzgBYZNJPr_ZD1@phenom.ffwll.local>
 <CAPM=9tzPR9wd=3Wbjnp-T0W8-dDfGah-H3Ny52G85B+2Ev9ksA@mail.gmail.com>
 <208e1fc3-cfc3-4a26-98c3-a48ab35bb9db@marcan.st>
 <Z6UPXxEJYpanU9iU@cassiopeiae>
 <4c0a7cf9-26e1-4a19-8a6e-7c30bc3aef86@marcan.st>
 <20250207-mature-pastel-rottweiler-e6dbd9@lemur>
 <1bbdf8b7-a70b-4994-865e-7fcb8d53ebef@marcan.st>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <1bbdf8b7-a70b-4994-865e-7fcb8d53ebef@marcan.st>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 18:48:07 up 275 days,  6:02,  1 user,  load average: 0.06, 0.05, 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)
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

* Hector Martin (marcan@marcan.st) wrote:
> On 2025/02/08 2:14, Konstantin Ryabitsev wrote:
> > On Fri, Feb 07, 2025 at 05:16:28AM +0900, Hector Martin wrote:
> >> And what I see, is very little effort to improve that status quo, or at
> >> least very little that yields any actual change that isn't just
> >> band-aids (e.g. tooling like b4, which is nice and appreciated, but
> >> doesn't fix any underlying issues). And that's not going to change no
> >> matter how many long technical arguments we have on the MLs (or even off
> >> MLs, since MLs are also not particularly good for this, and I've seen
> >> multiple arguments only reach a resolution after being redirected to IRC).
> > 
> > From my perspective, there are several camps clashing when it comes to the
> > kernel development model. One is people who are (rightfully) pointing out that
> > using the mailing lists was fine 20 years ago, but the world of software
> > development has vastly moved on to forges.
> > 
> > The other camp is people who (also rightfully) point out that kernel
> > development has always been decentralized and we should resist all attempts to
> > get ourselves into a position where Linux is dependent on any single
> > Benevolent Entity (Github, Gitlab, LF, kernel.org, etc), because this would
> > give that entity too much political or commercial control or, at the very
> > least, introduce SPoFs.
> > 
> > At best, I can hope to make both camps grumpily agree to coexist.
> > 
> > I *am* very wary of Benevolent Entities, because we have too many very recent
> > examples of companies "realigning priorities" when political winds shift.
> > Programs and initiatives that have until recently been poster board examples
> > of progress and benevolence are shuttered and defunded. I am concerned that
> > we're only a couple of mood swings away from someone deciding that free
> > software should not be allowed to exist because it benefits America's foes.
> > Many of us remember all too well when large tech giants treated Linux as a
> > "cancer" to be opposed, and I can certainly see that idea easily re-entering
> > some Big Brain in Charge.
> > 
> > From my perspective, I would like to ensure that Linux development can
> > continue without a hard dependency on a single centralized forge -- whether
> > controlled by a large commercial entity, or even a standalone one that is
> > operated by kernel.org. It's becoming shockingly difficult to operate a public
> > resource on the web unless you're willing to put it behind a large commercial
> > CDN that will protect you from hostile bots (and if you do that, you're back
> > to depending on the whims of a Benevolent Entity).
> > 
> > We're trying to get lore.kernel.org to the point where it's like a global
> > messaging bus that is indexed and searchable. Currently, you mostly have to
> > send things to a mailing list for them to end up on lore, but it's gradually
> > becoming less and less the case. We're already bridging with bugzilla and we
> > should be able to bridge with forges soon, too (currently delayed again
> > because I'm scrambling to move kernel.org frontends away from Equinix). Who
> > knows, we may be actually leapfrogging the forge era of software development
> > straight into "AI" agents era -- but that remains to be seen.
> > 
> > Anyway, all of this is to say that I'm happy that you've found b4 useful, but
> > I wouldn't view it as a band-aid -- it's just a very small and email-centric
> > way to interact with the kernel lore.
> > 
> 
> The centralization concern is valid, but there are technical solutions
> to this, such as forge federation. It's possible to set up a forge
> environment to be less of a SPoF, such as by ensuring all data is open
> and archiveable to allow for migration and backup restore, even by third
> parties (you can make practically ~all forge data public except for
> login passwords, and we have email-based reset processes for those).
> It's also possible to simply shard, and let different subsystems choose
> their own forge infrastructure, so downtime has a more limited effect.
> 
> Meanwhile, for better or worse, much of Linux infra *is* centralized -
> for example, the mailing lists themselves, and a lot of the Git hosting.

Although, many of the subsystems have their own patchworks or other systems
anyway dotted in random places.

It's actually something I find quite hard, it might seem there is
*a* Linux contribution process, but if you do fixups or devices all over
rather than in one subsystem you end up tripping over the oddities
of each maintainer; then trying to figure out when they're prepared
to take a patch, or where to check for whether they've taken it,
or whether to expect it to turn up in -next can all be quite random.


<snip>

> - Hector

Dave

> 
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
