Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BC3667BBE
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 17:45:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0280310E1B2;
	Thu, 12 Jan 2023 16:45:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8134B10E1B2;
 Thu, 12 Jan 2023 16:45:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9FB4C620B0;
 Thu, 12 Jan 2023 16:45:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E55DAC433EF;
 Thu, 12 Jan 2023 16:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1673541945;
 bh=oLyzs7BrkGWrZjSzv965hq1U/ogrEev6fsNywyDh/lU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qGKOr22K15obpuPJ2CduJ03kjMfQsEsBg+IopFp8651muUYVjOz3wPA0Adark/TSt
 P7H+ZB/lKXM6Qb4ztgkLjiHRHMMO6EfuGuusauu4hLJvKNWOPeTAoE/GIxkAUVFhCw
 SxQCaub5ZANAeRoCXsiGnWAOihOOVdrqBPp0t91k=
Date: Thu, 12 Jan 2023 17:45:42 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 5.10 1/1] drm/amdkfd: Check for null pointer after
 calling kmemdup
Message-ID: <Y8A5NgtGLDJv4sON@kroah.com>
References: <20230104175633.1420151-1-dragos.panait@windriver.com>
 <20230104175633.1420151-2-dragos.panait@windriver.com>
 <Y8ABeXQLzWdoaGAY@kroah.com>
 <CAKMK7uEgzJU8ukgR3sQtSUB5+wrD9VyMwCHOA-SReFWd0tKzzw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uEgzJU8ukgR3sQtSUB5+wrD9VyMwCHOA-SReFWd0tKzzw@mail.gmail.com>
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Dragos-Marian Panait <dragos.panait@windriver.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Harish Kasiviswanathan <Harish.Kasiviswanathan@amd.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Kent Russell <kent.russell@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 12, 2023 at 04:26:45PM +0100, Daniel Vetter wrote:
> On Thu, 12 Jan 2023 at 13:47, Greg KH <gregkh@linuxfoundation.org> wrote:
> > On Wed, Jan 04, 2023 at 07:56:33PM +0200, Dragos-Marian Panait wrote:
> > > From: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> > >
> > > [ Upstream commit abfaf0eee97925905e742aa3b0b72e04a918fa9e ]
> > >
> > > As the possible failure of the allocation, kmemdup() may return NULL
> > > pointer.
> > > Therefore, it should be better to check the 'props2' in order to prevent
> > > the dereference of NULL pointer.
> > >
> > > Fixes: 3a87177eb141 ("drm/amdkfd: Add topology support for dGPUs")
> > > Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> > > Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
> > > Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
> > > Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> > > Signed-off-by: Dragos-Marian Panait <dragos.panait@windriver.com>
> > > ---
> > >  drivers/gpu/drm/amd/amdkfd/kfd_crat.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_crat.c b/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
> > > index 86b4dadf772e..02e3c650ed1c 100644
> > > --- a/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
> > > +++ b/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
> > > @@ -408,6 +408,9 @@ static int kfd_parse_subtype_iolink(struct crat_subtype_iolink *iolink,
> > >                       return -ENODEV;
> > >               /* same everything but the other direction */
> > >               props2 = kmemdup(props, sizeof(*props2), GFP_KERNEL);
> > > +             if (!props2)
> > > +                     return -ENOMEM;
> >
> > Not going to queue this up as this is a bogus CVE.
> 
> Are we at the point where CVE presence actually contraindicates
> backporting?

Some would say that that point passed a long time ago :)

> At least I'm getting a bit the feeling there's a surge of
> automated (security) fixes that just don't hold up to any scrutiny.

That has been happening a lot more in the past 6-8 months than in years
past with the introduction of more automated tools being present.

> Last week I had to toss out an fbdev locking patch due to static
> checker that has no clue at all how refcounting works, and so
> complained that things need more locking ... (that was -fixes, but
> would probably have gone to stable too if I didn't catch it).
> 
> Simple bugfixes from random people was nice when it was checkpatch
> stuff and I was fairly happy to take these aggressively in drm. But my
> gut feeling says things seem to be shifting towards more advanced
> tooling, but without more advanced understanding by submitters. Does
> that holder in other areas too?

Again, yes, I have seen that a lot recently, especially with regards to
patches that purport to fix bugs yet obviously were never tested.

That being said, there are a few developers who are doing great things
with fault-injection testing and providing good patches for that.  So we
can't just say that everyone using these tools has no clue.

thanks,

greg k-h
