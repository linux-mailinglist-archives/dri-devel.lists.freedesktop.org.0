Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F48C695DC9
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 10:00:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 136D610E0BE;
	Tue, 14 Feb 2023 09:00:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 648C110E0BE
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 09:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676365226; x=1707901226;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=NgVhBoZa8yoi+cJKMAOhp/Rw5D5cyncuQgY4D70CJ1s=;
 b=J/nIExYFzAA+cr5b4U1BoVENuOHc5HDhfQDgIt3xmmdgmpFGJe9flyn8
 FYci3/F0R6W+2c8g6QnJLsWQFpQ1W5CPyqm5UYjwDHf+5Sh59d26EDaSX
 1DnstIcwc6ADg56e1iVE2H+apc9nvAjYOI/sqq0cpn91VbbApADY8Efco
 in6UQKbs4Wg4GatCDLgnCyrnqFjQSssgOfUX6+G1N2NgS8BolONwgw1Ro
 UDZvqDmZ1naa66ACiQpRprUqnQfTuY3282Mi3yTfMhQTwhPjTxIBbE9ZW
 rInCSebHDnA6usXhCs+64FxSA0n3IQZ3+ZE5VqKVRLXHoB9Ewsby9rwTy w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="393517074"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="393517074"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 01:00:23 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="914672052"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="914672052"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 00:59:59 -0800
Date: Tue, 14 Feb 2023 09:59:57 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: Try to address the drm_debugfs issues
Message-ID: <20230214085957.GA2824715@linux.intel.com>
References: <20230209081838.45273-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230209081838.45273-1-christian.koenig@amd.com>
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
Cc: jacek.lawrynowicz@linux.intel.com, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 daniel.vetter@ffwll.ch, Oded Gabbay <ogabbay@kernel.org>, mcanal@igalia.com,
 dri-devel@lists.freedesktop.org, mwen@igalia.com, maxime@cerno.tech,
 wambui.karugax@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 09, 2023 at 09:18:35AM +0100, Christian König wrote:
> Hello everyone,
> 
> the drm_debugfs has a couple of well known design problems.
> 
> Especially it wasn't possible to add files between initializing and registering
> of DRM devices since the underlying debugfs directory wasn't created yet.
> 
> The resulting necessity of the driver->debugfs_init() callback function is a
> mid-layering which is really frowned on since it creates a horrible
> driver->DRM->driver design layering.
> 
> The recent patch "drm/debugfs: create device-centered debugfs functions" tried
> to address those problem, but doesn't seem to work correctly. This looks like
> a misunderstanding of the call flow around drm_debugfs_init(), which is called
> multiple times, once for the primary and once for the render node.
> 
> So what happens now is the following:
> 
> 1. drm_dev_init() initially allocates the drm_minor objects.
> 2. ... back to the driver ...
> 3. drm_dev_register() is called.
> 
> 4. drm_debugfs_init() is called for the primary node.
> 5. drm_framebuffer_debugfs_init(), drm_client_debugfs_init() and
>    drm_atomic_debugfs_init() call drm_debugfs_add_file(s)() to add the files
>    for the primary node.
> 6. The driver->debugfs_init() callback is called to add debugfs files for the
>    primary node.
> 7. The added files are consumed and added to the primary node debugfs directory.
> 
> 8. drm_debugfs_init() is called for the render node.
> 9. drm_framebuffer_debugfs_init(), drm_client_debugfs_init() and
>    drm_atomic_debugfs_init() call drm_debugfs_add_file(s)() to add the files
>    again for the render node.
> 10. The driver->debugfs_init() callback is called to add debugfs files for the
>     render node.
> 11. The added files are consumed and added to the render node debugfs directory.
> 
> 12. Some more files are added through drm_debugfs_add_file().
> 13. drm_debugfs_late_register() add the files once more to the primary node
>     debugfs directory.
> 14. From this point on files added through drm_debugfs_add_file() are simply ignored.
> 15. ... back to the driver ...
> 
> Because of this the dev->debugfs_mutex lock is also completely pointless since
> any concurrent use of the interface would just randomly either add the files to
> the primary or render node or just not at all.
> 
> Even worse is that this implementation nails the coffin for removing the
> driver->debugfs_init() mid-layering because otherwise drivers can't control
> where their debugfs (primary/render node) are actually added.
> 
> This patch set here now tries to clean this up a bit, but most likely isn't
> fully complete either since I didn't audit every driver/call path.
> 
> Please comment/discuss.

What is end goal here regarding debugfs in DRM ? My undersigning is that
the direction is get rid of debugfs_init callback as described in:
https://cgit.freedesktop.org/drm/drm-misc/tree/Documentation/gpu/todo.rst#n511
and also make it driver/device-centric instead of minor-centric as
described here:
https://cgit.freedesktop.org/drm/drm-misc/commit/?id=99845faae7099cd704ebf67514c1157c26960a	

I'm asking from accel point of view. We can make things there as they
should look like at the end for DRM, since currently no drivers have
established their interfaces and they can be changed.

Is drivers/device-centric mean we should use drm_dev->unique for debugfs 
dir entry name instead of minor ?
Or perhaps we should have 2 separate dir entries: one (old dri/minor/)
for device drm debugfs files and other one for driver specific files ?

Also what regarding sysfs ? Should we do something with accel_sysfs_device_minor ?

Regards
Stanislaw
