Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E853A0ABF4
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jan 2025 22:06:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D875B10E26E;
	Sun, 12 Jan 2025 21:06:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dvw6YTMB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8A2710E26E
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jan 2025 21:06:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1CFAE5C2821;
 Sun, 12 Jan 2025 21:06:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 383EFC4CEDF;
 Sun, 12 Jan 2025 21:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1736716005;
 bh=QL3Xjp6YtetnhdwQppGS1xyyqRfVg3yt3I38H4N66Ho=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dvw6YTMBnZeJai7RzqadrGrwC0s8ZaRxpOF5WHkjxczBIpiG9Hb+PuN5UgT+5K/Qg
 2CX6+LQ11kDiSf1aToyHBbSW0/rqbFALMlYctKrLRSWDY1rNjf8nw0Wpfw8BJWVz3P
 zA2wK3Kg5i3MpuhHJs8FxpqI2ouNLrpAi28OvK4Q=
Date: Sun, 12 Jan 2025 22:06:42 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Dave Airlie <airlied@gmail.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 stable@vger.kernel.org, ashutosh.dixit@intel.com,
 dri-devel@lists.freedesktop.org
Subject: Re: AAARRRGGGHHH!!!! (was Re: [PATCH 6.12.y] xe/oa: Fix query mode
 of operation for OAR/OAC)
Message-ID: <2025011244-backlit-jubilance-4fa1@gregkh>
References: <2025010650-tuesday-motivate-5cbb@gregkh>
 <20250110205341.199539-1-umesh.nerlige.ramappa@intel.com>
 <2025011215-agreeing-bonfire-97ae@gregkh>
 <CAPM=9txn1x5A7xt+9YQ+nvLaQ3ycekC1Oj4J2PUpWCJwyQEL9w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPM=9txn1x5A7xt+9YQ+nvLaQ3ycekC1Oj4J2PUpWCJwyQEL9w@mail.gmail.com>
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

On Mon, Jan 13, 2025 at 05:51:30AM +1000, Dave Airlie wrote:
> On Sun, 12 Jan 2025 at 22:19, Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Fri, Jan 10, 2025 at 12:53:41PM -0800, Umesh Nerlige Ramappa wrote:
> > > commit 55039832f98c7e05f1cf9e0d8c12b2490abd0f16 upstream
> >
> > <snip>
> >
> > > Fixes: 8135f1c09dd2 ("drm/xe/oa: Don't reset OAC_CONTEXT_ENABLE on OA stream close")
> > > Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> > > Reviewed-by: Matthew Brost <matthew.brost@intel.com> # commit 1
> > > Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > > Cc: stable@vger.kernel.org # 6.12+
> > > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > > Link: https://patchwork.freedesktop.org/patch/msgid/20241220171919.571528-2-umesh.nerlige.ramappa@intel.com
> > > (cherry picked from commit 55039832f98c7e05f1cf9e0d8c12b2490abd0f16)
> > > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > (cherry picked from commit f0ed39830e6064d62f9c5393505677a26569bb56)
> >
> > Oh I see what you all did here.
> >
> > I give up.  You all need to stop it with the duplicated git commit ids
> > all over the place.  It's a major pain and hassle all the time and is
> > something that NO OTHER subsystem does.
> >
> > Yes, I know that DRM is special and unique and running at a zillion
> > times faster with more maintainers than any other subsystem and really,
> > it's bigger than the rest of the kernel combined, but hey, we ALL are a
> > common project here.  If each different subsystem decided to have their
> > own crazy workflows like this, we'd be in a world of hurt.  Right now
> > it's just you all that is causing this world of hurt, no one else, so
> > I'll complain to you.
> 
> All subsystems that grow to having large teams (more than 2-4 people)
> working on a single driver will eventually hit the scaling problem,
> just be glad we find things first so everyone else knows how to deal
> with it later.

That's fine, the issue is that you are the only ones with "duplicate"
commits in the tree that are both tagged for stable, every release.

> > We have commits that end up looking like they go back in time that are
> > backported to stable releases BEFORE they end up in Linus's tree and
> > future releases.  This causes major havoc and I get complaints from
> > external people when they see this as obviously, it makes no sense at
> > all.
> 
> None of what you are saying makes any sense here. Explain how patches
> are backported to stable releases before they end up in Linus's tree
> to me like I'm 5, because there should be no possible workflow where
> that can happen, stable pulls from patches in Linus' tree, not from my
> tree or drm-next or anywhere else. Now it might appear that way
> because tooling isn't prepared or people don't know what they are
> looking at, but I still don't see the actual problem.

Look at the above commit here that triggered this latest complaint.

It "claims" to be commit id 55039832f98c7e05f1cf9e0d8c12b2490abd0f16.
But that id is NOT in Linus's tree, rather it is ONLY in the DRM tree at
this point in time.

What _is_ in Linus's tree is the same exact thing, with a different
commit id, f0ed39830e6064d62f9c5393505677a26569bb56.

That's the problem.  You all check the same exact change into 2
different branches, which then flows to Linus at different points in
time.  Many times, after both are in Linus's tree, we get backport
requests, or backports, or CVE reports, or "Fixes:" tags that refer to
one, or the other, commit, causing confusion (which commit was
backported to where, so where does the Fixes line up to, what branches
are fixed / vulnerable, etc.)

I don't mind duplicate commits, but PLEASE don't mark both of them to be
included into the stable trees.  That's the issue here.  We don't have a
way to say "This commit is IDENTICAL to that commit, despite it landing
in Linus's tree at different points in time/releases."

Again, think of the backports.  And the Fixes:.  And the resulting
confusion.

> > And it easily breaks tools that tries to track where backports went and
> > if they are needed elsewhere, which ends up missing things because of
> > this crazy workflow.  So in the end, it's really only hurting YOUR
> > subsystem because of this.
> 
> Fix the tools.

Please tell me how to properly determine this when given the above
commit sent to us to backport.  When one commit (of the identical pair)
is backported to a stable tree, yet the Fixes tag refers to the other
commit, how am I supposed to know what to do?

If you follow the "path in time" it looks like things travel backwards
sometimes.  We ran into that a few weeks ago with a commit that was
marked as a CVE and we tried to figure out what releases it fixed.  It
was marked as Fixing a commit that was _after_ it showed up in Linus's
tree.

So again, if you want to do duplicate commits in different branches, go
ahead.  But if so, pick one, or the other, to mark for Fixes, AND to
mark for stable backports.

> > And yes, there is a simple way to fix this, DO NOT TAG COMMITS THAT ARE
> > DUPLICATES AS FOR STABLE.  Don't know why you all don't do that, would
> > save a world of hurt.
> 
> How do you recommend we do that, edit the immutable git history to
> remove the stable
> tag from the original commit?
> 
> >
> > I'm tired of it, please, just stop.  I am _this_ close to just ignoring
> > ALL DRM patches for stable trees...
> 
> If you have to do, go do it. The thing is the workflow is there for a
> reason, once you have a large enough team, having every single team
> member intimately aware of the rc schedule to decide where they need
> to land patches doesn't scale. If you can't land patches to a central
> -next tree and then pick those patches out to a -fixes tree after a
> maintainer realises they need to be backported to stable. Now I
> suppose we could just ban stable tags on the next tree and only put
> them on the cherry-picks but then how does it deal with the case where
> something needs to be fixes in -next but not really urgent enough for
> -fixes immediately. Would that be good enough, no stable tags in -next
> trees, like we could make the tooling block it? But it seems like
> overkill, to avoid fixing some shitty scripts someone is probably
> selling as a security application.

If you all want to not mark anything for us to backport, and will make a
tree/mbox/whatever for us to take only, I would _LOVE_ it.  That way you
all can make sure the git ids match up properly (for the backport id,
AND for the Fixes: id).

Otherwise, again, stop it with the duplicate commit ids.  They are a
pain and every time I see a DRM patch tagged for stable I flinch and
dread it.

thanks,

greg k-h
