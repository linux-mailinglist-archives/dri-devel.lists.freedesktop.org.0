Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B37164EB00
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 12:56:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C987010E5B9;
	Fri, 16 Dec 2022 11:56:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D47DF10E5B9
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Dec 2022 11:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671191787; x=1702727787;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/ZCOHj9hWBMfzutJbFi4Sjcbvy1RFcMuMyKwV7csgvw=;
 b=kibmQhXBMqqHicPOYAcI2rzrSYUUkLOdsNrKpwx1T+MUgN9wT3ciL+Pw
 vNZHzA9541ZmDMzEyHq/7IcTQzFQZgM+8ClEEUIvfPm2DF29tEL6RLRvI
 0uSHcjueCrbyl4NVtkBFth/GddeJYzlrPigLoEqerVEjmkx0JBy9c60I3
 Y8L0nwUcYxlyr2hjYGQgnaKlGGea43gNcm3RrL2+ZdiNzjpFMWarBJ3eW
 e0bfySEH9svLKyURAchnAdsGI0sj9iWSnNvhLiYnYZikhvsVkDBzuy8DS
 YuRvyq12NVQN+xT6uR9e7By9NpFKYeMriytxOi7qHWug0BDoW5R4Xs3Wg Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10562"; a="298623633"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; d="scan'208";a="298623633"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2022 03:56:27 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10562"; a="824085457"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; d="scan'208";a="824085457"
Received: from joe-255.igk.intel.com (HELO localhost) ([172.22.229.67])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2022 03:56:24 -0800
Date: Fri, 16 Dec 2022 12:56:22 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2] drm: fix crash in drm_minor_alloc_release
Message-ID: <20221216115622.GA1117445@linux.intel.com>
References: <20221108183823.314121-1-stanislaw.gruszka@linux.intel.com>
 <Y2uzInZ0Wdo52OQQ@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2uzInZ0Wdo52OQQ@phenom.ffwll.local>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 09, 2022 at 03:03:14PM +0100, Daniel Vetter wrote:
> On Tue, Nov 08, 2022 at 07:38:23PM +0100, Stanislaw Gruszka wrote:
> > If drm_sysfs_minor_alloc() fail in drm_minor_alloc() we can end up
> > freeing invalid minor->kdev pointer and drm_minor_alloc_release()
> > will crash like below:
> > 
> > RIP: 0010:kobject_put+0x19/0x1c0
> > RSP: 0018:ffffbc7001637c38 EFLAGS: 00010282
> > RAX: ffffffffa8d6deb0 RBX: 00000000ffffffff RCX: ffff9cb5912d4540
> > RDX: ffffffffa9c45ec5 RSI: ffff9cb5902f2b68 RDI: fffffffffffffff4
> > RBP: fffffffffffffff4 R08: ffffffffa9c40dec R09: 0000000000000008
> > R10: ffffffffaa81f7d2 R11: 00000000aa81f7ca R12: ffff9cb5912d4540
> > R13: ffff9cb5912d4540 R14: dead000000000122 R15: dead000000000100
> > FS:  00007f56b06e6740(0000) GS:ffff9cb728b40000(0000) knlGS:0000000000000000
> > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > CR2: 0000000000000030 CR3: 000000011285b004 CR4: 0000000000170ee0
> > DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> > DR3: 0000000000000000 DR6: 00000000ffff07f0 DR7: 0000000000000400
> > Call Trace:
> >  <TASK>
> >  drm_minor_alloc_release+0x19/0x50
> >  drm_managed_release+0xab/0x150
> >  drm_dev_init+0x21f/0x2f0
> >  __devm_drm_dev_alloc+0x3c/0xa0
> >  ivpu_probe+0x59/0x797 [intel_vpu 127058409b05eb2f99dcdecd3330bee28d6b3e76]
> >  pci_device_probe+0xa4/0x160
> >  really_probe+0x164/0x340
> >  __driver_probe_device+0x10d/0x190
> >  device_driver_attach+0x26/0x50
> >  bind_store+0x9f/0x120
> >  kernfs_fop_write_iter+0x12d/0x1c0
> >  new_sync_write+0x106/0x180
> >  vfs_write+0x216/0x2a0
> >  ksys_write+0x65/0xe0
> >  do_syscall_64+0x35/0x80
> >  entry_SYSCALL_64_after_hwframe+0x44/0xae
> > 
> > Fix this crash by returning NULL minor->kdev on error.
> > 
> > Fixes: f96306f9892b ("drm: manage drm_minor cleanup with drmm_")
> > Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> 
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I see this is not yet applied:
https://patchwork.freedesktop.org/patch/510798/

Could this be applied? Or should I go with the revert of
f96306f9892b ("drm: manage drm_minor cleanup with drmm_")
to fix this issue.

Regards
Stanislaw

> On the entire drmm thing, you can avoid these if you do a drmm for every
> little thing, that way you never get stuff that might or might not be set
> up in the cleanup handler. But for one-off internal things that's a bit
> overkill, and C utterly sucks at taking care of the boilerplate.
> -Daniel
> 
> > ---
> > v2: return minor->kdev NULL pointer instead of checking for IS_ERR in
> >     drm_minor_alloc_release()
> > 
> >  drivers/gpu/drm/drm_drv.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> > index 8214a0b1ab7f..8d70b634d008 100644
> > --- a/drivers/gpu/drm/drm_drv.c
> > +++ b/drivers/gpu/drm/drm_drv.c
> > @@ -142,8 +142,11 @@ static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
> >  		return r;
> >  
> >  	minor->kdev = drm_sysfs_minor_alloc(minor);
> > -	if (IS_ERR(minor->kdev))
> > -		return PTR_ERR(minor->kdev);
> > +	if (IS_ERR(minor->kdev)) {
> > +		r = PTR_ERR(minor->kdev);
> > +		minor->kdev = NULL;
> > +		return r;
> > +	}
> >  
> >  	*drm_minor_get_slot(dev, type) = minor;
> >  	return 0;
> > -- 
> > 2.25.1
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
