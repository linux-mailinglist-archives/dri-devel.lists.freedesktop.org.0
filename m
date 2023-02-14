Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DF06962A3
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 12:46:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B81FD10E17D;
	Tue, 14 Feb 2023 11:46:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A075010E17D
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 11:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676375198; x=1707911198;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=0yuvRuj+iZ39uOrGIj9aeb2YUQEb5JBEiDX4aM66tYo=;
 b=DzFzXNW4oAQRYSPJtuTyXuujP1Z961tzdDvHMuev2sJS/tSnwLIHGzA+
 hfP3kN+cQCpvVqsUrROa6tqtxI4Z/N4cxphk+hLdg8wM2b6DDPkM1Sclc
 ODUVr5szx1V/h33xZw5/hwS5hgx2LbqQhO055XRGfkUYUK44HNCoTXzrg
 a3kFnR+mNwhRDyKf6Pcs8JyJM27hKvCkJt3c1sa/nLxclqR5da1qR6YLX
 UeDT6jt9xteDnlK1/FFp2wIjI+5Q2eu6oB1udqFV4eF2rAPAHfi2x0w0L
 X35TyyIMmfInvCM/5+R8QlRGsFkaddQkPbugk15hBfoSe+QmbUX9fgUjA w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="393544725"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="393544725"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 03:46:38 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="646733555"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="646733555"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 03:46:35 -0800
Date: Tue, 14 Feb 2023 12:46:33 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: Try to address the drm_debugfs issues
Message-ID: <20230214114633.GB2824715@linux.intel.com>
References: <20230209081838.45273-1-christian.koenig@amd.com>
 <20230214085957.GA2824715@linux.intel.com>
 <c953dfe6-cdfc-92af-fabe-309e1af9f5d8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c953dfe6-cdfc-92af-fabe-309e1af9f5d8@gmail.com>
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
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>, daniel.vetter@ffwll.ch,
 Oded Gabbay <ogabbay@kernel.org>, mcanal@igalia.com,
 dri-devel@lists.freedesktop.org, mwen@igalia.com,
 jacek.lawrynowicz@linux.intel.com, wambui.karugax@gmail.com, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 14, 2023 at 10:28:24AM +0100, Christian König wrote:
> Am 14.02.23 um 09:59 schrieb Stanislaw Gruszka:
> > On Thu, Feb 09, 2023 at 09:18:35AM +0100, Christian König wrote:
> > > Hello everyone,
> > > 
> > > the drm_debugfs has a couple of well known design problems.
> > > 
> > > Especially it wasn't possible to add files between initializing and registering
> > > of DRM devices since the underlying debugfs directory wasn't created yet.
> > > 
> > > The resulting necessity of the driver->debugfs_init() callback function is a
> > > mid-layering which is really frowned on since it creates a horrible
> > > driver->DRM->driver design layering.
> > > 
> > > The recent patch "drm/debugfs: create device-centered debugfs functions" tried
> > > to address those problem, but doesn't seem to work correctly. This looks like
> > > a misunderstanding of the call flow around drm_debugfs_init(), which is called
> > > multiple times, once for the primary and once for the render node.
> > > 
> > > So what happens now is the following:
> > > 
> > > 1. drm_dev_init() initially allocates the drm_minor objects.
> > > 2. ... back to the driver ...
> > > 3. drm_dev_register() is called.
> > > 
> > > 4. drm_debugfs_init() is called for the primary node.
> > > 5. drm_framebuffer_debugfs_init(), drm_client_debugfs_init() and
> > >     drm_atomic_debugfs_init() call drm_debugfs_add_file(s)() to add the files
> > >     for the primary node.
> > > 6. The driver->debugfs_init() callback is called to add debugfs files for the
> > >     primary node.
> > > 7. The added files are consumed and added to the primary node debugfs directory.
> > > 
> > > 8. drm_debugfs_init() is called for the render node.
> > > 9. drm_framebuffer_debugfs_init(), drm_client_debugfs_init() and
> > >     drm_atomic_debugfs_init() call drm_debugfs_add_file(s)() to add the files
> > >     again for the render node.
> > > 10. The driver->debugfs_init() callback is called to add debugfs files for the
> > >      render node.
> > > 11. The added files are consumed and added to the render node debugfs directory.
> > > 
> > > 12. Some more files are added through drm_debugfs_add_file().
> > > 13. drm_debugfs_late_register() add the files once more to the primary node
> > >      debugfs directory.
> > > 14. From this point on files added through drm_debugfs_add_file() are simply ignored.
> > > 15. ... back to the driver ...
> > > 
> > > Because of this the dev->debugfs_mutex lock is also completely pointless since
> > > any concurrent use of the interface would just randomly either add the files to
> > > the primary or render node or just not at all.
> > > 
> > > Even worse is that this implementation nails the coffin for removing the
> > > driver->debugfs_init() mid-layering because otherwise drivers can't control
> > > where their debugfs (primary/render node) are actually added.
> > > 
> > > This patch set here now tries to clean this up a bit, but most likely isn't
> > > fully complete either since I didn't audit every driver/call path.
> > > 
> > > Please comment/discuss.
> > What is end goal here regarding debugfs in DRM ? My undersigning is that
> > the direction is get rid of debugfs_init callback as described in:
> > https://cgit.freedesktop.org/drm/drm-misc/tree/Documentation/gpu/todo.rst#n511
> > and also make it driver/device-centric instead of minor-centric as
> > described here:
> > https://cgit.freedesktop.org/drm/drm-misc/commit/?id=99845faae7099cd704ebf67514c1157c26960a	
> 
> Well my main goal is to get rid of the debugfs_init() mid-layering in the
> mid term, everything else is just nice to have.
> 
> > I'm asking from accel point of view. We can make things there as they
> > should look like at the end for DRM, since currently no drivers have
> > established their interfaces and they can be changed.
> > 
> > Is drivers/device-centric mean we should use drm_dev->unique for debugfs
> > dir entry name instead of minor ?
> 
> Oh, good idea! That would also finally make it a bit less problematic to
> figure out which PCI or platform device corresponds to which debugfs
> directory.
> 
> Only potential problem I see is that we would need to rename the directory
> should a driver every decide to set drm_dev->unique to something else than
> the default. But a quick check shows no users of drm_dev_set_unique(), so we
> could potentially just unexport the function
>
> > Or perhaps we should have 2 separate dir entries: one (old dri/minor/)
> > for device drm debugfs files and other one for driver specific files ?
> 
> How about we just create symlinks between the old and the new directory for
> now which we remove after everything has settled again?

Yes, that would make perfect sense. 

However my idea was a bit different, that we have separate directories
one for drm specific debugfs files (i.e. clints, framebuffer, gem, ... )
and another one for driver specific files (registers, whatever
individual needs for debugging). I'm just considering different options.

> > Also what regarding sysfs ? Should we do something with accel_sysfs_device_minor ?
> 
> I see sysfs as a different and probably even more complicated topic.

I wish to have some clear guidance how things should be done regarding
sysfs. But I guess we can stick with accel_sysfs_device_minor for accel
as it is currently. And make changes along with whole DRM.

Regards
Stanislaw
