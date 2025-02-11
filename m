Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8A1A30E15
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 15:21:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 781A810E6C9;
	Tue, 11 Feb 2025 14:21:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="RgFva9OM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id BA23810E6CE
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 14:21:41 +0000 (UTC)
Received: by linux.microsoft.com (Postfix, from userid 1127)
 id E39672107A9E; Tue, 11 Feb 2025 06:21:40 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com E39672107A9E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1739283700;
 bh=TLqJ9wdS7eZDzRW6bb8bC8nDRew1xQ5RwuLtrAYt6xk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RgFva9OM28hG7VhnJXq+jdS8w90nMSb/4Zx3EVuGFApeAmI+7yy0o2VXoP+CWWNhf
 GX5NZAgp+qpL0u3JdDaw+ErqAmARiglOUFcmg2e3NYkD1W78ZLlnYA0s32hHruFcYf
 805obfGrQ5GNd/GTUf+kYQR125oAeqwRvsvm9XhQ=
Date: Tue, 11 Feb 2025 06:21:40 -0800
From: Saurabh Singh Sengar <ssengar@linux.microsoft.com>
To: Michael Kelley <mhklinux@outlook.com>
Cc: "drawat.floss@gmail.com" <drawat.floss@gmail.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "christophe.jaillet@wanadoo.fr" <christophe.jaillet@wanadoo.fr>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>
Subject: Re: [PATCH 1/1] drm/hyperv: Fix address space leak when Hyper-V DRM
 device is removed
Message-ID: <20250211142140.GA2330@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <20250210193441.2414-1-mhklinux@outlook.com>
 <20250211033326.GA17799@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
 <SN6PR02MB41575726CE86AAB16FF6C365D4FD2@SN6PR02MB4157.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SN6PR02MB41575726CE86AAB16FF6C365D4FD2@SN6PR02MB4157.namprd02.prod.outlook.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
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

On Tue, Feb 11, 2025 at 03:46:51AM +0000, Michael Kelley wrote:
> From: Saurabh Singh Sengar <ssengar@linux.microsoft.com> Sent: Monday, February 10, 2025 7:33 PM
> > 
> > On Mon, Feb 10, 2025 at 11:34:41AM -0800, mhkelley58@gmail.com wrote:
> > > From: Michael Kelley <mhklinux@outlook.com>
> > >
> > > When a Hyper-V DRM device is probed, the driver allocates MMIO space for
> > > the vram, and maps it cacheable. If the device removed, or in the error
> > > path for device probing, the MMIO space is released but no unmap is done.
> > > Consequently the kernel address space for the mapping is leaked.
> > >
> > > Fix this by adding iounmap() calls in the device removal path, and in the
> > > error path during device probing.
> > >
> > > Fixes: f1f63cbb705d ("drm/hyperv: Fix an error handling path in hyperv_vmbus_probe()")
> > > Fixes: a0ab5abced55 ("drm/hyperv : Removing the restruction of VRAM allocation with PCI bar size")
> > > Signed-off-by: Michael Kelley <mhklinux@outlook.com>
> > > ---
> > >  drivers/gpu/drm/hyperv/hyperv_drm_drv.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> > b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> > > index e0953777a206..b491827941f1 100644
> > > --- a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> > > +++ b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> > > @@ -156,6 +156,7 @@ static int hyperv_vmbus_probe(struct hv_device *hdev,
> > >  	return 0;
> > >
> > >  err_free_mmio:
> > > +	iounmap(hv->vram);
> > >  	vmbus_free_mmio(hv->mem->start, hv->fb_size);
> > >  err_vmbus_close:
> > >  	vmbus_close(hdev->channel);
> > > @@ -174,6 +175,7 @@ static void hyperv_vmbus_remove(struct hv_device *hdev)
> > >  	vmbus_close(hdev->channel);
> > >  	hv_set_drvdata(hdev, NULL);
> > >
> > > +	iounmap(hv->vram);
> > >  	vmbus_free_mmio(hv->mem->start, hv->fb_size);
> > >  }
> > >
> > > --
> > > 2.25.1
> > >
> > 
> > Thanks for the fix. May I know how do you find such issues ?
> 
> I think it was that I was looking at the Hyper-V FB driver for the
> vmbus_free_mmio() call sites, and realizing that such call sites
> should probably also have an associated iounmap(). Then I was
> looking at the same thing in the Hyper-V DRM driver, and
> realizing there were no calls to iounmap()!
> 
> To confirm, the contents of /proc/vmallocinfo can be filtered
> for ioremap calls with size 8 MiB (which actually show up as
> 8 MiB + 4KiB because the address space allocator adds a guard
> page to each allocation). When doing repeated unbind/bind
> sequences on the DRM driver, those 8 MiB entries in
> /proc/vmallocinfo kept accumulating and were never freed.
> 
> Michael

Thank you!

Regards,
Saurabh
