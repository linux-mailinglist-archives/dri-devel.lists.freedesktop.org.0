Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8222A2077
	for <lists+dri-devel@lfdr.de>; Sun,  1 Nov 2020 18:38:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 639AA6EB3A;
	Sun,  1 Nov 2020 17:38:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DEE66E0CC;
 Fri, 30 Oct 2020 10:20:05 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.77,432,1596492000"; d="scan'208";a="475004550"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Oct 2020 11:20:03 +0100
Date: Fri, 30 Oct 2020 11:20:03 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [Outreachy kernel] [PATCH] drm/amdgpu: use
 DEFINE_DEBUGFS_ATTRIBUTE with debugfs_create_file_unsafe()
In-Reply-To: <20201030082425.GA1619669@kroah.com>
Message-ID: <alpine.DEB.2.22.394.2010301118560.2733@hadrien>
References: <20201030032245.GA274478@my--box>
 <20201030071120.GA1493629@kroah.com> <20201030075716.GA6976@my--box>
 <20201030080316.GA1612206@kroah.com>
 <CACAkLupMiH9z4g7WLJ7t-N089_M6QGX6HkPQUATu4VCxDeFAKw@mail.gmail.com>
 <20201030082425.GA1619669@kroah.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 01 Nov 2020 17:36:56 +0000
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
Cc: Sumera Priyadarsini <sylphrenadin@gmail.com>,
 Deepak R Varma <mh12gx2825@gmail.com>, David Airlie <airlied@linux.ie>,
 daniel.vetter@ffwll.ch, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, melissa.srw@gmail.com,
 Outreachy <outreachy-kernel@googlegroups.com>, nicstange@gmail.com,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?ISO-8859-15?Q?Christian_K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On Fri, 30 Oct 2020, Greg KH wrote:

> On Fri, Oct 30, 2020 at 01:47:05PM +0530, Sumera Priyadarsini wrote:
> > On Fri, 30 Oct, 2020, 1:32 PM Greg KH, <gregkh@linuxfoundation.org> wrote:
> >
> > > On Fri, Oct 30, 2020 at 01:27:16PM +0530, Deepak R Varma wrote:
> > > > On Fri, Oct 30, 2020 at 08:11:20AM +0100, Greg KH wrote:
> > > > > On Fri, Oct 30, 2020 at 08:52:45AM +0530, Deepak R Varma wrote:
> > > > > > Using DEFINE_DEBUGFS_ATTRIBUTE macro with
> > > debugfs_create_file_unsafe()
> > > > > > function in place of the debugfs_create_file() function will make the
> > > > > > file operation struct "reset" aware of the file's lifetime.
> > > Additional
> > > > > > details here:
> > > https://lists.archive.carbon60.com/linux/kernel/2369498
> > > > > >
> > > > > > Issue reported by Coccinelle script:
> > > > > > scripts/coccinelle/api/debugfs/debugfs_simple_attr.cocci
> > > > > >
> > > > > > Signed-off-by: Deepak R Varma <mh12gx2825@gmail.com>
> > > > > > ---
> > > > > > Please Note: This is a Outreachy project task patch.
> > > > > >
> > > > > >  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 20
> > > ++++++++++----------
> > > > > >  1 file changed, 10 insertions(+), 10 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> > > b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> > > > > > index 2d125b8b15ee..f076b1ba7319 100644
> > > > > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> > > > > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> > > > > > @@ -1551,29 +1551,29 @@ static int amdgpu_debugfs_sclk_set(void
> > > *data, u64 val)
> > > > > >   return 0;
> > > > > >  }
> > > > > >
> > > > > > -DEFINE_SIMPLE_ATTRIBUTE(fops_ib_preempt, NULL,
> > > > > > -                 amdgpu_debugfs_ib_preempt, "%llu\n");
> > > > > > +DEFINE_DEBUGFS_ATTRIBUTE(fops_ib_preempt, NULL,
> > > > > > +                  amdgpu_debugfs_ib_preempt, "%llu\n");
> > > > >
> > > > > Are you sure this is ok?  Do these devices need this additional
> > > > > "protection"?  Do they have the problem that these macros were written
> > > > > for?
> > > > >
> > > > > Same for the other patches you just submitted here, I think you need to
> > > > > somehow "prove" that these changes are necessary, checkpatch isn't able
> > > > > to determine this all the time.
> > > >
> > > > Hi Greg,
> > > > Based on my understanding, the current function debugfs_create_file()
> > > > adds an overhead of lifetime managing proxy for such fop structs. This
> > > > should be applicable to these set of drivers as well. Hence I think this
> > > > change will be useful.
> > >
> > > Why do these drivers need these changes?  Are these files dynamically
> > > removed from the system at random times?
> > >
> > > There is a reason we didn't just do a global search/replace for this in
> > > the kernel when the new functions were added, so I don't know why
> > > checkpatch is now saying it must be done.
> > >
> >
> > Hi,
> >
> > Sorry to jump in on the thread this way, but what exactly does a 'lifetime
> > managing proxy' for file operations mean? I am trying to understand how
> > DEFINE_DEBUGFS_ATTRIBUTE changes things wrt debug_ fs file operations but
> > can't find many resources. :(
>
> It means that the debugfs core can handle debugfs files being removed
> from the system while they are still open when they were created by a
> driver/module that is now unloaded from memory.
>
> This is only an issue for drivers that manage devices that have unknown
> lifespans (i.e. they can be yanked out of the system at any time, and
> the memory for those debugfs files can be freed).
>
> For the entire DRM/GPU subsystem, I strongly doubt this is the case.
>
> > Please let me know if I should be asking this in a different mailing
> > list/irc instead.
> >
> > The change seems to be suggested by a coccinelle script.
>
> I know, and I don't think that script knows the nuances behind this, as,
> again, we would have just done a global search/replace for this when the
> debugfs fixes went into the kernel.

The script comes from Nicolai Stange <nicstange@gmail.com>.

If there are some precise considerations that make the change likely to be
useful, then the script can be changed.

If the script is not helpful, then it can be removed.

julia


>
> thanks,
>
> greg k-h
>
> --
> You received this message because you are subscribed to the Google Groups "outreachy-kernel" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to outreachy-kernel+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/outreachy-kernel/20201030082425.GA1619669%40kroah.com.
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
