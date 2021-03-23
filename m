Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12094346012
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 14:48:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12C2B6E15C;
	Tue, 23 Mar 2021 13:48:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A87BB6E15C;
 Tue, 23 Mar 2021 13:48:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1616507286; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6tF7KSRmZ6+Q2eQmtg3qs6Lj7pxyXqSPb+EoL1Xiwgo=;
 b=CauOHGc6V6duECZzZ4rC2VPuL2MdIyErENX91lTCz7oUhGFaYtQ4z0Xh5Yii3ZWbnl+WLA
 geknr5fCNCQCICctxKfxYP27oB6cXHGwPK6ZJvQH6GTykbnPfqiqxnDn74HcLe4CwumITs
 RZCSbOiJvRcExSTyuUSE9rGIn5qhIas=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 43567ACBF;
 Tue, 23 Mar 2021 13:48:06 +0000 (UTC)
Date: Tue, 23 Mar 2021 14:48:00 +0100
From: Michal Hocko <mhocko@suse.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/ttm: stop warning on TT shrinker failure
Message-ID: <YFnxkLhBGYRj7Hck@dhcp22.suse.cz>
References: <YFigZ5+H95c/GI/S@phenom.ffwll.local>
 <20210322140548.GN1719932@casper.infradead.org>
 <YFi+UROYbQERYEEr@dhcp22.suse.cz>
 <CAKMK7uGM6EJvzktrANyeeemRPoW7O0ka-ZyKi==wL1zt3yM=5w@mail.gmail.com>
 <c78457bb-d93a-ff84-1cce-0fb3fa9f0cec@gmail.com>
 <YFma+ZxncvfBd++o@dhcp22.suse.cz>
 <YFnQ1Lk6BTo8L7pr@phenom.ffwll.local>
 <cd17d2ca-140e-1e69-37ac-c2726cc1ef9f@gmail.com>
 <YFnZMzs2wYGWqowi@dhcp22.suse.cz>
 <YFnp2e2jGrtM7iGx@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YFnp2e2jGrtM7iGx@phenom.ffwll.local>
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
Cc: Matthew Wilcox <willy@infradead.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Linux MM <linux-mm@kvack.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Dave Chinner <dchinner@redhat.com>, Leo Liu <Leo.Liu@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue 23-03-21 14:15:05, Daniel Vetter wrote:
> On Tue, Mar 23, 2021 at 01:04:03PM +0100, Michal Hocko wrote:
> > On Tue 23-03-21 12:48:58, Christian K=F6nig wrote:
> > > Am 23.03.21 um 12:28 schrieb Daniel Vetter:
> > > > On Tue, Mar 23, 2021 at 08:38:33AM +0100, Michal Hocko wrote:
> > > > > I think this is where I don't get yet what Christian tries to do:=
 We
> > > > > really shouldn't do different tricks and calling contexts between=
 direct
> > > > > reclaim and kswapd reclaim. Otherwise very hard to track down bug=
s are
> > > > > pretty much guaranteed. So whether we use explicit gfp flags or t=
he
> > > > > context apis, result is exactly the same.
> > > =

> > > Ok let us recap what TTMs TT shrinker does here:
> > > =

> > > 1. We got memory which is not swapable because it might be accessed b=
y the
> > > GPU at any time.
> > > 2. Make sure the memory is not accessed by the GPU and driver need to=
 grab a
> > > lock before they can make it accessible again.
> > > 3. Allocate a shmem file and copy over the not swapable pages.
> > =

> > This is quite tricky because the shrinker operates in the PF_MEMALLOC
> > context so such an allocation would be allowed to completely deplete
> > memory unless you explicitly mark that context as __GFP_NOMEMALLOC. Also
> > note that if the allocation cannot succeed it will not trigger reclaim
> > again because you are already called from the reclaim context.
> =

> [Limiting to that discussion]
> =

> Yes it's not emulating real (direct) reclaim correctly, but ime the
> biggest issue with direct reclaim is when you do mutex_lock instead of
> mutex_trylock or in general block on stuff that you cant. And lockdep +
> fs_reclaim annotations gets us that, so pretty good to make sure our
> shrinker is correct.

I have to confess that I manage to (happily) forget all the nasty
details about fs_reclaim lockdep internals so I am not sure the use by
the proposed patch is actually reasonable. Talk to lockdep guys about
that and make sure to put a big fat comment explaining what is going on.

In general allocating from the reclaim context is a bad idea and you
should avoid that. As already said a simple allocation request from the
reclaim context is not constrained and it will not recurse back into
the reclaim. Calling into shmem from the shrinker context might be
really tricky as well. I am not even sure this is possible for anything
other than full (GFP_KERNEL) reclaim context.
-- =

Michal Hocko
SUSE Labs
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
