Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC5BA11E3B
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 10:38:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA21910E5B1;
	Wed, 15 Jan 2025 09:38:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="D+2amd7d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E99A510E5AD
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 09:38:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8221F5C59B4;
 Wed, 15 Jan 2025 09:37:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CB55C4CEDF;
 Wed, 15 Jan 2025 09:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1736933918;
 bh=UMQoRaAZX1oKZv1S0PwTUGSYUHqTJdpwVnUOd/dHL0Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D+2amd7dvtZWRhw85zAG8xaR9L3GJV4kbBghIcDwGpSO2uFvNIjGSfQYA2ArvE5bD
 fUEdV/c8+5uIwvcTqbXNgNB9NIw9WOzqS9kXmBpScRtvtkL65zrS8LFlZG3M7hPKLs
 MuNlqmSK0RwwjbhwnQHaPUq6eRbOOqLwtJGKm0oQ=
Date: Wed, 15 Jan 2025 10:38:34 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Sasha Levin <sashal@kernel.org>, Dave Airlie <airlied@gmail.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 stable@vger.kernel.org, ashutosh.dixit@intel.com,
 dri-devel@lists.freedesktop.org
Subject: Re: AAARRRGGGHHH!!!! (was Re: [PATCH 6.12.y] xe/oa: Fix query mode
 of operation for OAR/OAC)
Message-ID: <2025011503-algorithm-composed-3b81@gregkh>
References: <CAPM=9txn1x5A7xt+9YQ+nvLaQ3ycekC1Oj4J2PUpWCJwyQEL9w@mail.gmail.com>
 <CAPM=9twogjmTCc=UHBYkPPkrdHfm0PJ9VDoOg+X2jWZbdjVBww@mail.gmail.com>
 <2025011247-spoilage-hamster-28b2@gregkh>
 <CAPM=9tx1cFzhaZNz=gQOmP9Q0KEK5fMKZYSc-P0xA_f2sxoZ9w@mail.gmail.com>
 <2025011352-fox-wrangle-4d3f@gregkh>
 <CAPM=9tzkJ=dn2gq7GcvtN_C95ZzxwC7XMMXHBrwF6Ez6fYfU=g@mail.gmail.com>
 <Z4Z8rQKR2QEaWNyI@phenom.ffwll.local> <Z4aIGvAmMld_uztJ@lappy>
 <Z4afbuFN1uc3zhOt@phenom.ffwll.local>
 <Z4d6406b82Pu1PRV@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z4d6406b82Pu1PRV@phenom.ffwll.local>
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

On Wed, Jan 15, 2025 at 10:07:47AM +0100, Simona Vetter wrote:
> On Tue, Jan 14, 2025 at 06:31:26PM +0100, Simona Vetter wrote:
> > On Tue, Jan 14, 2025 at 10:51:54AM -0500, Sasha Levin wrote:
> > > On Tue, Jan 14, 2025 at 04:03:09PM +0100, Simona Vetter wrote:
> > > > On Tue, Jan 14, 2025 at 11:01:34AM +1000, Dave Airlie wrote:
> > > > > > > > We create a "web" when we backport commits, and mark things for "Fixes:"
> > > > > > > > When we get those ids wrong because you all have duplicate commits for
> > > > > > > > the same thing, everything breaks.
> > > > > > > >
> > > > > > > > > I just don't get what the ABI the tools expect is, and why everyone is
> > > > > > > > > writing bespoke tools and getting it wrong, then blaming us for not
> > > > > > > > > conforming. Fix the tools or write new ones when you realise the
> > > > > > > > > situation is more complex than your initial ideas.
> > > > > > > >
> > > > > > > > All I want to see and care about is:
> > > > > > > >
> > > > > > > >  - for a stable commit, the id that the commit is in Linus's tree.
> > > > > > > >  - for a Fixes: tag, the id that matches the commit in Linus's tree AND
> > > > > > > >    the commit that got backported to stable trees.
> > > > > > > >
> > > > > > > > That's it, that's the whole "ABI".  The issue is that you all, for any
> > > > > > > > number of commits, have 2 unique ids for any single commit and how are
> > > > > > > > we supposed to figure that mess out...
> > > > > > >
> > > > > > > Pretty sure we've explained how a few times now, not sure we can do much more.
> > > > > >
> > > > > > And the same for me.
> > > > > >
> > > > > > > If you see a commit with a cherry-pick link in it and don't have any
> > > > > > > sight on that commit in Linus's tree, ignore the cherry-pick link in
> > > > > > > it, assume it's a future placeholder for that commit id. You could if
> > > > > > > you wanted to store that info somewhere, but there shouldn't be a
> > > > > > > need.
> > > > > >
> > > > > > Ok, this is "fine", I can live with it.  BUT that's not the real issue
> > > > > > (and your own developers get confused by this, again, look at the
> > > > > > original email that started this all, they used an invalid git id to
> > > > > > send to us thinking that was the correct id to use.)
> > > > > 
> > > > > I'm going to go back and look at the one you pointed out as I'm
> > > > > missing the issue with it, I thought it was due to a future ID being
> > > > > used.
> > > > 
> > > > I think the issue is that with the cherry-picking we do, we don't update
> > > > the Fixes: or Reverts: lines, so those still point at the og commit in
> > > > -next, while the cherry-picked commit is in -fixes.
> > > > 
> > > > The fix for that (which our own cherry-pick scripts implement iirc) is to
> > > > keep track of the cherry-picks (which is why we add that line) and treat
> > > > them as aliases.
> > > > 
> > > > So if you have a Fixes: $sha1 pointing at -next, then if you do a
> > > > full-text commit message search for (cherry picked from $sha1), you should
> > > > be able to find it.
> > > > 
> > > > We could try to do that lookup with the cherry-pick scripts, but a lot of
> > > > folks hand-roll these, so it's lossy at best. Plus you already have to
> > > > keep track of aliases anyway since you're cherry-picking to stable, so I
> > > > was assuming that this shouldn't cause additional issues.
> > > > 
> > > > The other part is that if you already have a cherry picked from $sha1 in
> > > > your history, even if it wasn't done with stable cherry-pick, then you
> > > > don't have to cherry-pick again. These should be easy to filter out.
> > > > 
> > > > But maybe I'm also not understanding what the issue is, I guess would need
> > > > to look at a specific example.
> > > > 
> > > > > > > When future tools are analysing things, they will see the patch from
> > > > > > > the merge window, the cherry-picked patches in the fixes tree, and
> > > > > > > stable will reference the fixes, and the fixes patch will reference
> > > > > > > the merge window one?
> > > > > >
> > > > > >
> > > > > > > but I think when we cherry-pick patches from -next that fix
> > > > > > > other patches from -next maybe the fixes lines should be reworked to
> > > > > > > reference the previous Linus tree timeline not the future one. not
> > > > > > > 100% sure this happens? Sima might know more.
> > > > > >
> > > > > > Please fix this up, if you all can.  That is the issue here.  And again,
> > > > > > same for reverts.
> > > > > >
> > > > > > I think between the two, this is causing many fixes and reverts to go
> > > > > > unresolved in the stable trees.
> > > > > >
> > > > > > > Now previously I think we'd be requested to remove the cherry-picks
> > > > > > > from the -fixes commits as they were referencing things not in Linus'
> > > > > > > tree, we said it was a bad idea, I think we did it anyways, we got
> > > > > > > shouted at, we put it back, we get shouted that we are referencing
> > > > > > > commits that aren't in Linus tree. Either the link is useful
> > > > > > > information and we just assume cherry-picks of something we can't see
> > > > > > > are a future placeholder and ignore it until it shows up in our
> > > > > > > timeline.
> > > > > >
> > > > > > I still think it's lunacy to have a "cherry pick" commit refer to a
> > > > > > commit that is NOT IN THE TREE YET and shows up in history as "IN THE
> > > > > > FUTURE".  But hey, that's just me.
> > > > > >
> > > > > > Why do you have these markings at all?  Who are they helping?  Me?
> > > > > > Someone else?
> > > > > 
> > > > > They are for helping you. Again if the commit that goes into -next is immutable,
> > > > > there is no way for it to reference the commit that goes into -fixes
> > > > > ahead of it.
> > > > > 
> > > > > The commit in -fixes needs to add the link to the future commit in
> > > > > -next, that link is the cherry-pick statement.
> > > > > 
> > > > > When you get the future commit into the stable queue, you look for the
> > > > > commit id in stable history as a cherry-pick and drop it if it's
> > > > > already there.
> > > > > 
> > > > > I can't see any other way to do this, the future commit id is a
> > > > > placeholder in Linus/stable tree, the commit is immutable and 99.99%
> > > > > of the time it will arrive at some future point in time.
> > > > > 
> > > > > I'm open to how you would make this work that isn't lunacy, but I
> > > > > can't really see a way since git commits are immutable.
> > > > 
> > > > Yeah the (cherry picked from $sha1) with a sha1 that's in -next and almost
> > > > always shows up in Linus' tree in the future shouldn't be an issue. That
> > > > part really is required for driver teams to manage their flows.
> > > > 
> > > > > > > I think we could ask to not merge things into -next with stable cc'ed
> > > > > > > but I think that will result in a loss of valuable fixes esp for
> > > > > > > backporters.
> > > > > >
> > > > > > Again, it's the Fixes and Reverts id referencing that is all messed up
> > > > > > here.  That needs to be resolved.  If it takes you all the effort to
> > > > > > make up a special "stable tree only" branch/series/whatever, I'm all for
> > > > > > it, but as it is now, what you all are doing is NOT working for me at
> > > > > > all.
> > > > > 
> > > > > I'll have to see if anyone is willing to consider pulling this sort of
> > > > > feat off, it's not a small task, and it would have to be 99% automated
> > > > > I think to be not too burdensome.
> > > > 
> > > > It's not that hard to script, dim cherry-pick already does it. It's the
> > > > part where we need to guarantee that we never ever let one slip through
> > > > didn't get this treatment of replacing the sha1.
> > > > 
> > > > The even more insideous one is when people rebase their -next or -fixes
> > > > trees, since then the sha1 will really never ever show up. Which is why
> > > > we're telling people to not mess with git history at all and instead
> > > > cherry-pick. It's the lesser pain.
> > > 
> > > But this does happen with cherry picks... A few examples from what I saw
> > > with drivers/gpu/drm/ and -stable:
> > > 
> > > 5a507b7d2be1 ("drm/mst: Fix NULL pointer dereference at
> > > drm_dp_add_payload_part2") which landed as 8a0a7b98d4b6 ("drm/mst: Fix
> > > NULL pointer dereference at drm_dp_add_payload_part2") rather than
> > > 4545614c1d8da.
> > 
> > This one also landed through Alex' tree, and before he switched over to
> > cherry-pick -x and not trying to fix things up with rebasing. Because in
> > theory rebasing bugfixes out of -next into -fixes avoids all that trouble,
> > in practice it just causes a reliably even bigger mess.
> > 
> > > e89afb51f97a ("drm/vmwgfx: Fix a 64bit regression on svga3") which
> > > landed as c2aaa37dc18f ("drm/vmwgfx: Fix a 64bit regression on svga3")
> > > rather than 873601687598.
> > 
> > This one is from 2021. Iirc it's the case that motivated us to improve the
> > commiter documentation and make it clear that only maintainers should do
> > cherry-picks. Occasionally people don't know and screw up.
> > 
> > > a829f033e966 ("drm/i915: Wedge the GPU if command parser setup fails")
> > > which indicates it's a cherry-pick, but I couldn't find the equivalent
> > > commit landing at any point later on.
> > 
> > This one was a maintainer action by Dave and me, where we went in and
> > rebased an entire -next tree. Also from 2021, even more exceptional than
> > the "committer cherry-picked themselves and screwed up".
> > 
> > I'm not saying that the cherry-pick model with committers is error free.
> > Not at all. It's just in my experience substantially less error prone than
> > anything else, it's simply the less shit option.
> > 
> > Roughly the options are:
> > 
> > - rebase trees to not have duplicated commits. Breaks the committer model,
> >   pretty much guarantees that you have commit references to absolutely
> >   nowhere at all in practice because people butcher rebases all the time.
> >   Also pisses off Linus with unecessary rebases that don't reflect actual
> >   development history.
> > 
> >   Plus we'd insta run out of maintainers in drm if we do this.
> 
> Bit more here, because this isn't hyperbole. drm isn't magic, we don't
> have more maintainer volunteers than any other subsystem. And if we'd run
> the show the same way as most others, we'd suffer like everyone else from
> overloaded and burnt out maintainers.
> 
> We fixed the "not enough maintainer volunteers" problem by radically
> changing the workflow, and radically reducing the amount of work
> maintainers have to do. But that has consequences, and that's why we
> cherry-pick so much.
> 
> If you center your flow around committers, then you also need to accept
> that for a committer the most important tree is their driver/subsystem
> tree, and everything else is downstream. And they don't care about
> downstream at that much. Exactly like how maintainers don't care that much
> about stable trees as their downstream, and you're trying to make it as
> easy as possible for them.
> 
> Roughly translating things:
> 
> - For you, stable is the downstream that cherry-picks from the main
>   development branch. For drm committers, drm-fixes is their downstream
>   that cherry-picks from the development tree (and everything else is even
>   further downstream).
> 
> - For you Linus' git tree is the development branch you cherry-pick from.
>   For drm committers the drm-foo-next branch is their development branch
>   that we cherry-pick from.
> 
> - You asking us to not cherry-pick but instead do the classic maintainer
>   approach of filtering out fixes into foo-fixes branches is the same as
>   if you'd ask maintainers to send bugfixes for stable to you directly,
>   rebase them out of their pr to Linus and then backmerge. This is total
>   bullocks, because stable isn't the development branch.

No, I can live with you all cherry-picking as that seems to make your
life easier, what I am complaining about is when that cherry-picking
causes massive confusion as the Fixes: and Revert ids end up showing
going "back in time" and pointing to the wrong commit.

And note, the commit that caused this recent thread DID actually confuse
your own developers, and they used the wrong git id as well, so it's not
like your own developers don't get confused either.

It's your tree, you all run it like you want to, I'm just pointing out
that the current way you all are running it IS causing problems for
those of us who have to deal with the result of it.

thanks,

greg k-h
