Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF8529FF4F
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 09:02:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0650C6E968;
	Fri, 30 Oct 2020 08:02:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED4FD6E968;
 Fri, 30 Oct 2020 08:02:28 +0000 (UTC)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B7F6F206DD;
 Fri, 30 Oct 2020 08:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604044948;
 bh=sjpPspkLsWiWbFSLHAjaeQlueI6WT5/q7Z9EziIU0wQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VbONgRrLC42ZQFZhvxtyCZWX4k4LA6yxZEzKU7qVlAJvFRe1crGjYUjeJGfeEVdOf
 lVayfrDrNhKZq358K3LswRdStjL7Gwo1L8DNtWjDUn2MPqzmRuEjmiM2BBUb/dBOHH
 Orh7h2x797L4hI4r7sZjjgnytACUICBpQ7aGblkk=
Date: Fri, 30 Oct 2020 09:03:16 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Deepak R Varma <mh12gx2825@gmail.com>
Subject: Re: [Outreachy kernel] [PATCH] drm/amdgpu: use
 DEFINE_DEBUGFS_ATTRIBUTE with debugfs_create_file_unsafe()
Message-ID: <20201030080316.GA1612206@kroah.com>
References: <20201030032245.GA274478@my--box>
 <20201030071120.GA1493629@kroah.com>
 <20201030075716.GA6976@my--box>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201030075716.GA6976@my--box>
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
Cc: David Airlie <airlied@linux.ie>, daniel.vetter@ffwll.ch,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 melissa.srw@gmail.com, outreachy-kernel@googlegroups.com,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 30, 2020 at 01:27:16PM +0530, Deepak R Varma wrote:
> On Fri, Oct 30, 2020 at 08:11:20AM +0100, Greg KH wrote:
> > On Fri, Oct 30, 2020 at 08:52:45AM +0530, Deepak R Varma wrote:
> > > Using DEFINE_DEBUGFS_ATTRIBUTE macro with debugfs_create_file_unsafe()
> > > function in place of the debugfs_create_file() function will make the
> > > file operation struct "reset" aware of the file's lifetime. Additional
> > > details here: https://lists.archive.carbon60.com/linux/kernel/2369498
> > > 
> > > Issue reported by Coccinelle script:
> > > scripts/coccinelle/api/debugfs/debugfs_simple_attr.cocci
> > > 
> > > Signed-off-by: Deepak R Varma <mh12gx2825@gmail.com>
> > > ---
> > > Please Note: This is a Outreachy project task patch.
> > > 
> > >  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 20 ++++++++++----------
> > >  1 file changed, 10 insertions(+), 10 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> > > index 2d125b8b15ee..f076b1ba7319 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> > > @@ -1551,29 +1551,29 @@ static int amdgpu_debugfs_sclk_set(void *data, u64 val)
> > >  	return 0;
> > >  }
> > >  
> > > -DEFINE_SIMPLE_ATTRIBUTE(fops_ib_preempt, NULL,
> > > -			amdgpu_debugfs_ib_preempt, "%llu\n");
> > > +DEFINE_DEBUGFS_ATTRIBUTE(fops_ib_preempt, NULL,
> > > +			 amdgpu_debugfs_ib_preempt, "%llu\n");
> > 
> > Are you sure this is ok?  Do these devices need this additional
> > "protection"?  Do they have the problem that these macros were written
> > for?
> > 
> > Same for the other patches you just submitted here, I think you need to
> > somehow "prove" that these changes are necessary, checkpatch isn't able
> > to determine this all the time.
> 
> Hi Greg,
> Based on my understanding, the current function debugfs_create_file()
> adds an overhead of lifetime managing proxy for such fop structs. This
> should be applicable to these set of drivers as well. Hence I think this
> change will be useful.

Why do these drivers need these changes?  Are these files dynamically
removed from the system at random times?

There is a reason we didn't just do a global search/replace for this in
the kernel when the new functions were added, so I don't know why
checkpatch is now saying it must be done.

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
