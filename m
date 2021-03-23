Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5248A345E45
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 13:37:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E21616E8E1;
	Tue, 23 Mar 2021 12:37:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D67076E8E2;
 Tue, 23 Mar 2021 12:37:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1616503031; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AkQCdkqsRL6FjVNRqhzir7MU97cl0F21rnjotT8pc7o=;
 b=KwkHFRMetl98EBn2+6hZdQMbLx3wGCW+ZeZTXYE6tZ9EWQDepTMVHHnXIg/k3bqU0cCDMX
 ORhlt0uu4/H6PIzCcWdRTwWn0RqVtQFCiL2CroNtQNHwcFgJj87e7ZbaFf+k1oipnKCAV4
 L00HWoonVx+sHh/m0UpP3MDTrpVYy5c=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 673DEAD38;
 Tue, 23 Mar 2021 12:37:11 +0000 (UTC)
Date: Tue, 23 Mar 2021 13:37:10 +0100
From: Michal Hocko <mhocko@suse.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH] drm/ttm: stop warning on TT shrinker failure
Message-ID: <YFng9qXM3NdrGHTx@dhcp22.suse.cz>
References: <YFigZ5+H95c/GI/S@phenom.ffwll.local>
 <20210322140548.GN1719932@casper.infradead.org>
 <YFi+UROYbQERYEEr@dhcp22.suse.cz>
 <CAKMK7uGM6EJvzktrANyeeemRPoW7O0ka-ZyKi==wL1zt3yM=5w@mail.gmail.com>
 <c78457bb-d93a-ff84-1cce-0fb3fa9f0cec@gmail.com>
 <YFma+ZxncvfBd++o@dhcp22.suse.cz>
 <YFnQ1Lk6BTo8L7pr@phenom.ffwll.local>
 <cd17d2ca-140e-1e69-37ac-c2726cc1ef9f@gmail.com>
 <YFnZMzs2wYGWqowi@dhcp22.suse.cz>
 <75ff80c5-a054-d13d-85c1-0040addb45d2@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <75ff80c5-a054-d13d-85c1-0040addb45d2@gmail.com>
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
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Linux MM <linux-mm@kvack.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Dave Chinner <dchinner@redhat.com>, Leo Liu <Leo.Liu@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue 23-03-21 13:21:32, Christian K=F6nig wrote:
> Am 23.03.21 um 13:04 schrieb Michal Hocko:
> > On Tue 23-03-21 12:48:58, Christian K=F6nig wrote:
> > > Am 23.03.21 um 12:28 schrieb Daniel Vetter:
> > > > On Tue, Mar 23, 2021 at 08:38:33AM +0100, Michal Hocko wrote:
> > > > > On Mon 22-03-21 20:34:25, Christian K=F6nig wrote:
> > [...]
> > > > > > My only concern is that if I could rely on memalloc_no* being u=
sed we could
> > > > > > optimize this quite a bit further.
> > > > > Yes you can use the scope API and you will be guaranteed that _an=
y_
> > > > > allocation from the enclosed context will inherit GFP_NO* semanti=
c.
> > > The question is if this is also guaranteed the other way around?
> > > =

> > > In other words if somebody calls get_free_page(GFP_NOFS) are the cont=
ext
> > > flags set as well?
> > gfp mask is always restricted in the page allocator. So say you have
> > noio scope context and call get_free_page/kmalloc(GFP_NOFS) then the
> > scope would restrict the allocation flags to GFP_NOIO (aka drop
> > __GFP_IO). For further details, have a look at current_gfp_context
> > and its callers.
> > =

> > Does this answer your question?
> =

> But what happens if you don't have noio scope and somebody calls
> get_free_page(GFP_NOFS)?

Then this will be a regular NOFS request. Let me repeat scope API will
further restrict any requested allocation mode.

> Is then the noio scope added automatically? And is it possible that the
> shrinker gets called without noio scope even we would need it?

Here you have lost me again.

> > > > > I think this is where I don't get yet what Christian tries to do:=
 We
> > > > > really shouldn't do different tricks and calling contexts between=
 direct
> > > > > reclaim and kswapd reclaim. Otherwise very hard to track down bug=
s are
> > > > > pretty much guaranteed. So whether we use explicit gfp flags or t=
he
> > > > > context apis, result is exactly the same.
> > > Ok let us recap what TTMs TT shrinker does here:
> > > =

> > > 1. We got memory which is not swapable because it might be accessed b=
y the
> > > GPU at any time.
> > > 2. Make sure the memory is not accessed by the GPU and driver need to=
 grab a
> > > lock before they can make it accessible again.
> > > 3. Allocate a shmem file and copy over the not swapable pages.
> > This is quite tricky because the shrinker operates in the PF_MEMALLOC
> > context so such an allocation would be allowed to completely deplete
> > memory unless you explicitly mark that context as __GFP_NOMEMALLOC.
> =

> Thanks, exactly that was one thing I was absolutely not sure about. And y=
es
> I agree that this is really tricky.
> =

> Ideally I would like to be able to trigger swapping out the shmem page I
> allocated immediately after doing the copy.

So let me try to rephrase to make sure I understand. You would like to
swap out the existing content from the shrinker and you use shmem as a
way to achieve that. The swapout should happen at the time of copying
(shrinker context) or shortly afterwards?

So effectively to call pageout() on the shmem page after the copy?
 =

> This way I would only need a single page for the whole shrink operation at
> any given time.

What do you mean by that? You want the share the same shmem page for
other copy+swapout?
-- =

Michal Hocko
SUSE Labs
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
