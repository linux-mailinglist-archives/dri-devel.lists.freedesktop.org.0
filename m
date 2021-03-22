Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE83F344A6D
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 17:06:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC4A16E504;
	Mon, 22 Mar 2021 16:06:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19E3E6E4CF;
 Mon, 22 Mar 2021 15:57:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1616428630; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=943PxvuOVOvD4aIfz0aSIuAtEWSyDAhWQvjOcjR1pNk=;
 b=f4jLbnwVuMbmtzmw+emafC69VpgVedDhr7rg/0AcvaGfGvZxlJ5TVBfmDTPoRzGusXur9I
 gKwxgrQWmVdOwmX5J6jTC+zFtPRSmvMlUNAAYZPbdl5TygS/pi9TDn6CSi9HZMAqcs2crF
 Y5UBe3gudtxixSh7p+0W/adWm1rfAO8=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A97A5ACA8;
 Mon, 22 Mar 2021 15:57:10 +0000 (UTC)
Date: Mon, 22 Mar 2021 16:57:05 +0100
From: Michal Hocko <mhocko@suse.com>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH] drm/ttm: stop warning on TT shrinker failure
Message-ID: <YFi+UROYbQERYEEr@dhcp22.suse.cz>
References: <20210319140857.2262-1-christian.koenig@amd.com>
 <YFTk1GSaUDI3wcWt@phenom.ffwll.local>
 <2831bfcc-140e-dade-1f50-a6431e495e9d@gmail.com>
 <YFT2LSR97rkkPyEP@phenom.ffwll.local>
 <1ae415c4-8e49-5183-b44d-bc92088657d5@gmail.com>
 <CAKMK7uEDhuvSwJj5CX8vHgLb+5zm=rdJPmXwb-VQWdrW6GwQZw@mail.gmail.com>
 <e6e9df3e-cd2b-d80f-205d-6ca1865819b2@gmail.com>
 <YFigZ5+H95c/GI/S@phenom.ffwll.local>
 <20210322140548.GN1719932@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210322140548.GN1719932@casper.infradead.org>
X-Mailman-Approved-At: Mon, 22 Mar 2021 16:06:00 +0000
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
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Linux MM <linux-mm@kvack.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Dave Chinner <dchinner@redhat.com>, Leo Liu <Leo.Liu@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon 22-03-21 14:05:48, Matthew Wilcox wrote:
> On Mon, Mar 22, 2021 at 02:49:27PM +0100, Daniel Vetter wrote:
> > On Sun, Mar 21, 2021 at 03:18:28PM +0100, Christian K=F6nig wrote:
> > > Am 20.03.21 um 14:17 schrieb Daniel Vetter:
> > > > On Sat, Mar 20, 2021 at 10:04 AM Christian K=F6nig
> > > > <ckoenig.leichtzumerken@gmail.com> wrote:
> > > > > Am 19.03.21 um 20:06 schrieb Daniel Vetter:
> > > > > > On Fri, Mar 19, 2021 at 07:53:48PM +0100, Christian K=F6nig wro=
te:
> > > > > > > Am 19.03.21 um 18:52 schrieb Daniel Vetter:
> > > > > > > > On Fri, Mar 19, 2021 at 03:08:57PM +0100, Christian K=F6nig=
 wrote:
> > > > > > > > > Don't print a warning when we fail to allocate a page for=
 swapping things out.
> > > > > > > > > =

> > > > > > > > > Also rely on memalloc_nofs_save/memalloc_nofs_restore ins=
tead of GFP_NOFS.
> > > > > > > > Uh this part doesn't make sense. Especially since you only =
do it for the
> > > > > > > > debugfs file, not in general. Which means you've just compl=
etely broken
> > > > > > > > the shrinker.
> > > > > > > Are you sure? My impression is that GFP_NOFS should now work =
much more out
> > > > > > > of the box with the memalloc_nofs_save()/memalloc_nofs_restor=
e().
> > > > > > Yeah, if you'd put it in the right place :-)
> > > > > > =

> > > > > > But also -mm folks are very clear that memalloc_no*() family is=
 for dire
> > > > > > situation where there's really no other way out. For anything w=
here you
> > > > > > know what you're doing, you really should use explicit gfp flag=
s.
> > > > > My impression is just the other way around. You should try to avo=
id the
> > > > > NOFS/NOIO flags and use the memalloc_no* approach instead.
> > > > Where did you get that idea?
> > > =

> > > Well from the kernel comment on GFP_NOFS:
> > > =

> > > =A0* %GFP_NOFS will use direct reclaim but will not use any filesystem
> > > interfaces.
> > > =A0* Please try to avoid using this flag directly and instead use
> > > =A0* memalloc_nofs_{save,restore} to mark the whole scope which
> > > cannot/shouldn't
> > > =A0* recurse into the FS layer with a short explanation why. All allo=
cation
> > > =A0* requests will inherit GFP_NOFS implicitly.
> > =

> > Huh that's interesting, since iirc Willy or Dave told me the opposite, =
and
> > the memalloc_no* stuff is for e.g. nfs calling into network layer (needs
> > GFP_NOFS) or swap on top of a filesystems (even needs GFP_NOIO I think).
> > =

> > Adding them, maybe I got confused.
> =

> My impression is that the scoped API is preferred these days.
> =

> https://www.kernel.org/doc/html/latest/core-api/gfp_mask-from-fs-io.html
> =

> I'd probably need to spend a few months learning the DRM subsystem to
> have a more detailed opinion on whether passing GFP flags around explicit=
ly
> or using the scope API is the better approach for your situation.

yes, in an ideal world we would have a clearly defined scope of the
reclaim recursion wrt FS/IO associated with it. I've got back to
https://lore.kernel.org/amd-gfx/20210319140857.2262-1-christian.koenig@amd.=
com/
and there are two things standing out. Why does ttm_tt_debugfs_shrink_show
really require NOFS semantic? And why does it play with
fs_reclaim_acquire?

-- =

Michal Hocko
SUSE Labs
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
