Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4528AACDF14
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 15:30:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 014F910E6D8;
	Wed,  4 Jun 2025 13:30:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="qU1R/kXK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 506FA10E6EC
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 13:30:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4A090A504C9;
 Wed,  4 Jun 2025 13:30:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BAD0C4CEF0;
 Wed,  4 Jun 2025 13:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1749043801;
 bh=uAGF1rGgwXCCFTMw3y6E5QwiVbOIGvouMM0eNw+XRz0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qU1R/kXKp9D6+jx5VYTlP7L0TWBw4HwzAe/nBG7841zDc0hNJnT/FgXj0h3Sy5Syx
 VLic0jaMZDl6jLnrJPzQc/m19ZOHyxAsvhF67K0xV5MR0NAqRRJ3lKUU+sfVwl7Uw7
 x5rkOTr8SInBk1mby7fViWxyxBJLqPPocmLapX7U=
Date: Wed, 4 Jun 2025 15:29:58 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, stable@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] Revert "drm/amd/display: more liberal vmin/vmax update
 for freesync"
Message-ID: <2025060410-skinning-unguided-a3de@gregkh>
References: <20250530200918.391912-1-aurabindo.pillai@amd.com>
 <CADnq5_P1Wf+QmV7Xivk7j-0uSsZHD3VcoROUoSoRa2oYmcO2jw@mail.gmail.com>
 <jn3rvqffhemwjltd6z5ssa2lfpszsw4w7c4kjmkqqbum6zqvmi@pv6x2rkbeys6>
 <CADnq5_PHv+yxYqH8QxjMorn=PBpLekmLkW4XNNYaCN0iMLjZQw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADnq5_PHv+yxYqH8QxjMorn=PBpLekmLkW4XNNYaCN0iMLjZQw@mail.gmail.com>
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

On Wed, Jun 04, 2025 at 09:15:14AM -0400, Alex Deucher wrote:
> On Wed, Jun 4, 2025 at 5:40 AM Uwe Kleine-König
> <u.kleine-koenig@baylibre.com> wrote:
> >
> > Hello Alex,
> >
> > On Fri, May 30, 2025 at 04:14:09PM -0400, Alex Deucher wrote:
> > > On Fri, May 30, 2025 at 4:09 PM Aurabindo Pillai
> > > <aurabindo.pillai@amd.com> wrote:
> > > >
> > > > This reverts commit 219898d29c438d8ec34a5560fac4ea8f6b8d4f20 since it
> > > > causes regressions on certain configs. Revert until the issue can be
> > > > isolated and debugged.
> > > >
> > > > Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4238
> > > > Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
> > > > Acked-by: Alex Deucher <alexander.deucher@amd.com>
> > >
> > > Already included in my -fixes PR for this week:
> > > https://lists.freedesktop.org/archives/amd-gfx/2025-May/125350.html
> >
> > Note the way this was done isn't maximally friendly to our stable
> > maintainers though.
> >
> > The commit in your tree (1b824eef269db44d068bbc0de74c94a8e8f9ce02) is a
> > tad better than the patch that Aurabindo sent as it has:
> >
> >         This reverts commit cfb2d41831ee5647a4ae0ea7c24971a92d5dfa0d ...
> >
> > which at least is a known commit and has Cc: stable.
> >
> > However this is still a bit confusing as commit cfb2d41831ee has no Cc:
> > stable, but a duplicate in mainline: f1c6be3999d2 that has Cc: stable.
> >
> > So f1c6be3999d2 was backported to 6.14.7 (commit
> > 4ec308a4104bc71a431c75cc9babf49303645617), 6.12.29 (commit
> > 468034a06a6e8043c5b50f9cd0cac730a6e497b5) and 6.6.91 (commit
> > c8a91debb020298c74bba0b9b6ed720fa98dc4a9). But it might not be obvious
> > that 1b824eef269db44d068bbc0de74c94a8e8f9ce02 needs backporting to trees
> > that don't contain cfb2d41831ee (or a backport of it).
> >
> > Please keep an eye on that change that it gets properly backported.
> 
> DRM patches land in -next first since that is where the developers
> work and then bug fixes get cherry-picked to -fixes.  When a patch is
> cherry-picked to -fixes, we use cherry-pick -x to keep the reference
> to the original commit and then add stable CC's as needed.  See this
> thread for background:
> https://lore.kernel.org/dri-devel/871px5iwbx.fsf@intel.com/T/#t

And that thread shows how the confusion between git ids that are
reverted and committed to the tree cause reverts to get missed with our
automatic tools, so you HAVE to explicitly tag them as cc: stable, which
is not always done :(

thanks,

greg k-h
