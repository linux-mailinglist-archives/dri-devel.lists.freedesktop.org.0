Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EA8A0B07B
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 09:05:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC7FC10E335;
	Mon, 13 Jan 2025 08:05:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KFK1/6Wb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C1CC10E335
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 08:05:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id F00D3A40C3F;
 Mon, 13 Jan 2025 08:03:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E044C4CED6;
 Mon, 13 Jan 2025 08:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1736755514;
 bh=IG9qnpEX18jqQFrJ8ttaXS4hbkhp8Uq/zev/rEp0ZWc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KFK1/6WbbUWbgE1SsMxqSVABYUgj3WinXfDulvO91ugPBNzeNIK1uuxHclpum1ExZ
 b2S6yC4JGabA2pCe8lUHKB+m97+fqaERkdf2Kgg/ETlTxhdPIrYaOkGNmSGsFbHp8S
 iCWpoxV6itjCawk3Xf2SIhSMzbsAGZHQze79FPok=
Date: Mon, 13 Jan 2025 09:05:10 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Dave Airlie <airlied@gmail.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 stable@vger.kernel.org, ashutosh.dixit@intel.com,
 dri-devel@lists.freedesktop.org
Subject: Re: AAARRRGGGHHH!!!! (was Re: [PATCH 6.12.y] xe/oa: Fix query mode
 of operation for OAR/OAC)
Message-ID: <2025011352-fox-wrangle-4d3f@gregkh>
References: <2025010650-tuesday-motivate-5cbb@gregkh>
 <20250110205341.199539-1-umesh.nerlige.ramappa@intel.com>
 <2025011215-agreeing-bonfire-97ae@gregkh>
 <CAPM=9txn1x5A7xt+9YQ+nvLaQ3ycekC1Oj4J2PUpWCJwyQEL9w@mail.gmail.com>
 <CAPM=9twogjmTCc=UHBYkPPkrdHfm0PJ9VDoOg+X2jWZbdjVBww@mail.gmail.com>
 <2025011247-spoilage-hamster-28b2@gregkh>
 <CAPM=9tx1cFzhaZNz=gQOmP9Q0KEK5fMKZYSc-P0xA_f2sxoZ9w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPM=9tx1cFzhaZNz=gQOmP9Q0KEK5fMKZYSc-P0xA_f2sxoZ9w@mail.gmail.com>
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

On Mon, Jan 13, 2025 at 10:44:41AM +1000, Dave Airlie wrote:
> On Mon, 13 Jan 2025 at 07:09, Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Mon, Jan 13, 2025 at 06:01:51AM +1000, Dave Airlie wrote:
> > > On Mon, 13 Jan 2025 at 05:51, Dave Airlie <airlied@gmail.com> wrote:
> > > >
> > > > On Sun, 12 Jan 2025 at 22:19, Greg KH <gregkh@linuxfoundation.org> wrote:
> > > > >
> > > > > On Fri, Jan 10, 2025 at 12:53:41PM -0800, Umesh Nerlige Ramappa wrote:
> > > > > > commit 55039832f98c7e05f1cf9e0d8c12b2490abd0f16 upstream
> > > > >
> > > > > <snip>
> > > > >
> > > > > > Fixes: 8135f1c09dd2 ("drm/xe/oa: Don't reset OAC_CONTEXT_ENABLE on OA stream close")
> > > > > > Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> > > > > > Reviewed-by: Matthew Brost <matthew.brost@intel.com> # commit 1
> > > > > > Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > > > > > Cc: stable@vger.kernel.org # 6.12+
> > > > > > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > > > > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > > > > > Link: https://patchwork.freedesktop.org/patch/msgid/20241220171919.571528-2-umesh.nerlige.ramappa@intel.com
> > > > > > (cherry picked from commit 55039832f98c7e05f1cf9e0d8c12b2490abd0f16)
> > > > > > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > > > > (cherry picked from commit f0ed39830e6064d62f9c5393505677a26569bb56)
> > > > >
> > > > > Oh I see what you all did here.
> > > > >
> > > > > I give up.  You all need to stop it with the duplicated git commit ids
> > > > > all over the place.  It's a major pain and hassle all the time and is
> > > > > something that NO OTHER subsystem does.
> > > > >
> > > > > Yes, I know that DRM is special and unique and running at a zillion
> > > > > times faster with more maintainers than any other subsystem and really,
> > > > > it's bigger than the rest of the kernel combined, but hey, we ALL are a
> > > > > common project here.  If each different subsystem decided to have their
> > > > > own crazy workflows like this, we'd be in a world of hurt.  Right now
> > > > > it's just you all that is causing this world of hurt, no one else, so
> > > > > I'll complain to you.
> > > >
> > > > All subsystems that grow to having large teams (more than 2-4 people)
> > > > working on a single driver will eventually hit the scaling problem,
> > > > just be glad we find things first so everyone else knows how to deal
> > > > with it later.
> > > >
> > > > >
> > > > > We have commits that end up looking like they go back in time that are
> > > > > backported to stable releases BEFORE they end up in Linus's tree and
> > > > > future releases.  This causes major havoc and I get complaints from
> > > > > external people when they see this as obviously, it makes no sense at
> > > > > all.
> > > >
> > > > None of what you are saying makes any sense here. Explain how patches
> > > > are backported to stable releases before they end up in Linus's tree
> > > > to me like I'm 5, because there should be no possible workflow where
> > > > that can happen, stable pulls from patches in Linus' tree, not from my
> > > > tree or drm-next or anywhere else. Now it might appear that way
> > > > because tooling isn't prepared or people don't know what they are
> > > > looking at, but I still don't see the actual problem.
> > > >
> > > > >
> > > > > And it easily breaks tools that tries to track where backports went and
> > > > > if they are needed elsewhere, which ends up missing things because of
> > > > > this crazy workflow.  So in the end, it's really only hurting YOUR
> > > > > subsystem because of this.
> > > >
> > > > Fix the tools.
> > > >
> > > > >
> > > > > And yes, there is a simple way to fix this, DO NOT TAG COMMITS THAT ARE
> > > > > DUPLICATES AS FOR STABLE.  Don't know why you all don't do that, would
> > > > > save a world of hurt.
> > > >
> > > > How do you recommend we do that, edit the immutable git history to
> > > > remove the stable
> > > > tag from the original commit?
> > > >
> > > > >
> > > > > I'm tired of it, please, just stop.  I am _this_ close to just ignoring
> > > > > ALL DRM patches for stable trees...
> > > >
> > > > If you have to do, go do it. The thing is the workflow is there for a
> > > > reason, once you have a large enough team, having every single team
> > > > member intimately aware of the rc schedule to decide where they need
> > > > to land patches doesn't scale. If you can't land patches to a central
> > > > -next tree and then pick those patches out to a -fixes tree after a
> > > > maintainer realises they need to be backported to stable. Now I
> > > > suppose we could just ban stable tags on the next tree and only put
> > > > them on the cherry-picks but then how does it deal with the case where
> > > > something needs to be fixes in -next but not really urgent enough for
> > > > -fixes immediately. Would that be good enough, no stable tags in -next
> > > > trees, like we could make the tooling block it? But it seems like
> > > > overkill, to avoid fixing some shitty scripts someone is probably
> > > > selling as a security application.
> > >
> > > If you were to ignore stable tags on drm, could we then write a tool
> > > that creates a new for-stable tree that just strips out all the
> > > fixes/backports/commits and recreates it based on Linus commits to
> > > you, or would future duplicate commits then break tools?
> >
> > That would be great, just pick which commit id to reference (i.e. the
> > one that shows up in Linus's tree first.)
> >
> > But then, be careful with the "Fixes:" tags as well, those need to line
> > up and match the correct ones.
> >
> > We create a "web" when we backport commits, and mark things for "Fixes:"
> > When we get those ids wrong because you all have duplicate commits for
> > the same thing, everything breaks.
> >
> > > I just don't get what the ABI the tools expect is, and why everyone is
> > > writing bespoke tools and getting it wrong, then blaming us for not
> > > conforming. Fix the tools or write new ones when you realise the
> > > situation is more complex than your initial ideas.
> >
> > All I want to see and care about is:
> >
> >  - for a stable commit, the id that the commit is in Linus's tree.
> >  - for a Fixes: tag, the id that matches the commit in Linus's tree AND
> >    the commit that got backported to stable trees.
> >
> > That's it, that's the whole "ABI".  The issue is that you all, for any
> > number of commits, have 2 unique ids for any single commit and how are
> > we supposed to figure that mess out...
> 
> Pretty sure we've explained how a few times now, not sure we can do much more.

And the same for me.

> If you see a commit with a cherry-pick link in it and don't have any
> sight on that commit in Linus's tree, ignore the cherry-pick link in
> it, assume it's a future placeholder for that commit id. You could if
> you wanted to store that info somewhere, but there shouldn't be a
> need.

Ok, this is "fine", I can live with it.  BUT that's not the real issue
(and your own developers get confused by this, again, look at the
original email that started this all, they used an invalid git id to
send to us thinking that was the correct id to use.)

The problem is when it comes to Reverts and Fixes.  Both of those now
get out of sync because the DRM developers don't know which commit id to
pick, and so they choose a random one.  And of course, now 50% of the
time they are wrong.

> When the initial commit enters during the next merge window, you look
> for that subject or commit id in the stable tree already, if it
> exists, dump the latest Linus patch on the floor, it's already in
> stable your job is done.

This takes an extra step from any other subsystem, which is why DRM
patches are the LAST to get merged into stable releases after the big
-rc1 flood as it takes me a manual step for each and every commit.  It's
a pain and I curse it but hey, if I have to live with it I can.

But again, that's not what I am complaining about here.  Again, it's the
mismatch of Fixes and Revert ids being used.

> When future tools are analysing things, they will see the patch from
> the merge window, the cherry-picked patches in the fixes tree, and
> stable will reference the fixes, and the fixes patch will reference
> the merge window one?

Yes, they sometimes are wrong.  How am I supposed to know that if I see
a DRM Fixes or Revert id, I need to walk the whole tree and search again
for the ids in the changelog to see if they match or not.

That is the problem.

> I'm just not seeing what I'm missing here, fixes tags should work
> fine,

They do not when you refer to the "wrong" commit id (i.e. the commit
that ended up in -rc1, NOT the previous real release that came through
the "fixes" branch you have.)

> but I think when we cherry-pick patches from -next that fix
> other patches from -next maybe the fixes lines should be reworked to
> reference the previous Linus tree timeline not the future one. not
> 100% sure this happens? Sima might know more.

Please fix this up, if you all can.  That is the issue here.  And again,
same for reverts.

I think between the two, this is causing many fixes and reverts to go
unresolved in the stable trees.

> Now previously I think we'd be requested to remove the cherry-picks
> from the -fixes commits as they were referencing things not in Linus'
> tree, we said it was a bad idea, I think we did it anyways, we got
> shouted at, we put it back, we get shouted that we are referencing
> commits that aren't in Linus tree. Either the link is useful
> information and we just assume cherry-picks of something we can't see
> are a future placeholder and ignore it until it shows up in our
> timeline.

I still think it's lunacy to have a "cherry pick" commit refer to a
commit that is NOT IN THE TREE YET and shows up in history as "IN THE
FUTURE".  But hey, that's just me.

Why do you have these markings at all?  Who are they helping?  Me?
Someone else?

> I think we could ask to not merge things into -next with stable cc'ed
> but I think that will result in a loss of valuable fixes esp for
> backporters.

Again, it's the Fixes and Reverts id referencing that is all messed up
here.  That needs to be resolved.  If it takes you all the effort to
make up a special "stable tree only" branch/series/whatever, I'm all for
it, but as it is now, what you all are doing is NOT working for me at
all.

thanks,

greg k-h
