Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13742A11D06
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 10:11:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4720E10E584;
	Wed, 15 Jan 2025 09:11:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kXkwuapY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA32A10E584
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 09:11:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E6004A419C4;
 Wed, 15 Jan 2025 09:09:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FB9FC4CEDF;
 Wed, 15 Jan 2025 09:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1736932263;
 bh=nWMxkXit2DGaZifVgwlAuHrDVVsAZQbVzqfiXv8H0Go=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kXkwuapYlF7QCY6JOIonHyW2I6Ny6fdMmkwSkPoJDY1FDqrSNsnzn49F1wGxwOG1S
 Iqlet5os8CxibcrL5BdkP8aSr7r3mmERGkbFzNmu1INgSQKxy9ib9ZhJaL1E5Qqtn4
 U2bb7ZPEtgRffeCX8hJymBP4vSiB8P5y8lqEZ5DM=
Date: Wed, 15 Jan 2025 10:11:00 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Dave Airlie <airlied@gmail.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 stable@vger.kernel.org, ashutosh.dixit@intel.com,
 dri-devel@lists.freedesktop.org
Subject: Re: AAARRRGGGHHH!!!! (was Re: [PATCH 6.12.y] xe/oa: Fix query mode
 of operation for OAR/OAC)
Message-ID: <2025011551-volatile-turbofan-52ab@gregkh>
References: <2025010650-tuesday-motivate-5cbb@gregkh>
 <20250110205341.199539-1-umesh.nerlige.ramappa@intel.com>
 <2025011215-agreeing-bonfire-97ae@gregkh>
 <CAPM=9txHupDKRShZLe8FA2kJwov-ScDASqJouUdxbMZ3X=U1-Q@mail.gmail.com>
 <871px5iwbx.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <871px5iwbx.fsf@intel.com>
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

On Tue, Jan 14, 2025 at 11:22:26AM +0200, Jani Nikula wrote:
> On Tue, 14 Jan 2025, Dave Airlie <airlied@gmail.com> wrote:
> > On Sun, 12 Jan 2025 at 22:19, Greg KH <gregkh@linuxfoundation.org> wrote:
> >>
> >> On Fri, Jan 10, 2025 at 12:53:41PM -0800, Umesh Nerlige Ramappa wrote:
> >> > commit 55039832f98c7e05f1cf9e0d8c12b2490abd0f16 upstream
> >>
> >> <snip>
> >>
> >> > Fixes: 8135f1c09dd2 ("drm/xe/oa: Don't reset OAC_CONTEXT_ENABLE on OA stream close")
> >> > Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> >> > Reviewed-by: Matthew Brost <matthew.brost@intel.com> # commit 1
> >> > Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> >> > Cc: stable@vger.kernel.org # 6.12+
> >> > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> >> > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> >> > Link: https://patchwork.freedesktop.org/patch/msgid/20241220171919.571528-2-umesh.nerlige.ramappa@intel.com
> >> > (cherry picked from commit 55039832f98c7e05f1cf9e0d8c12b2490abd0f16)
> >> > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> >>
> >> Oh I see what you all did here.
> >>
> >> I give up.  You all need to stop it with the duplicated git commit ids
> >> all over the place.  It's a major pain and hassle all the time and is
> >> something that NO OTHER subsystem does.
> >
> > Let me try and work out what you think is the problem with this
> > particular commit as I read your email and I don't get it.
> >
> > This commit is in drm-next as  55039832f98c7e05f1cf9e0d8c12b2490abd0f16
> > and says Fixes: 8135f1c09dd2 ("drm/xe/oa: Don't reset
> > OAC_CONTEXT_ENABLE on OA stream close)
> >
> > It was pulled into drm-fixes a second time as a cherry-pick from next
> > as f0ed39830e6064d62f9c5393505677a26569bb56
> > (cherry picked from commit 55039832f98c7e05f1cf9e0d8c12b2490abd0f16)
> >
> > Now the commit it Fixes: 8135f1c09dd2 is also at
> > 0c8650b09a365f4a31fca1d1d1e9d99c56071128
> >
> > Now the above thing you wrote is your cherry-picked commit for stable?
> > since I don't see
> > (cherry picked from commit f0ed39830e6064d62f9c5393505677a26569bb56)
> > in my tree anywhere.
> 
> The automatic cherry-pick for 6.12 stable failed, and Umesh provided the
> manually cherry-picked patch for it, apparently using -x in the process,
> adding the second cherry-pick annotation. The duplicate annotation
> hasn't been merged to any tree, it's not part of the process, it's just
> what happened with this manual stable backport. I think it would be wise
> to ignore that part of the whole discussion. It's really not that
> relevant.

On the contrary, this commit shows the whole problem very well.  It is
trivial for people to get confused, the author submitted a backport of a
commit that is NOT in Linus's tree because they got an email telling of
a failure and didn't use the correct id because they looked in the
drm-next branch, NOT in Linus's branch.

Which is why I flagged it, as the commit id used here was not a valid
one at this point in time.  Yes, after -rc1 it would be valid, but
again, totally confusing.

You all are seeing confusion with this development model.  That's the
issue.  Whether or not it's intentional, that's the result.  And because
of it, I am telling you all, the kernel is less secure as it allows us
all to get confused and mis backports and drop fixes incorrectly.

So either you all change the process, or just live with it and the
consequences of having total confusion at times and grumpy stable
developers because of it, and less secure users due to missed bug and
security fixes.

greg k-h
