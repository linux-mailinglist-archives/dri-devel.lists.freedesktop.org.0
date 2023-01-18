Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 249056712C7
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 05:48:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9485410E046;
	Wed, 18 Jan 2023 04:48:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-2.mailo.com (msg-2.mailo.com [213.182.54.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BEC810E046;
 Wed, 18 Jan 2023 04:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
 t=1674017295; bh=CrkLUeMtrNdwnxo7dSQaVwIRujSfMbGdt5IVuAFQz3k=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:In-Reply-To;
 b=DrUYygIy8N0vpXuxg5PaiBxDOdSmFRoXgm3FAnIuReaTrFLWDpDYq9pAtZHcwLkPR
 e/rWsAqZ1JT+sLxgQ7bBgx6yu7l36GrfPy1JEEXuHRrxFFYimGFFs508YtEmHzVyYm
 AaNGoO6EVCVifJK3yz9ZTHy2z1VThMG8BXsANbgI=
Received: by b-4.in.mailobj.net [192.168.90.14] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Wed, 18 Jan 2023 05:48:15 +0100 (CET)
X-EA-Auth: 0H2RaE5We5J7qEl4sTPdiDLLdShReSlIjm3JvD6yCBtdwCoUmnZ1e4mcFnjvlIWsg/cpckZCiDWRzndLuqYvZuXD0zsTIdt6
Date: Wed, 18 Jan 2023 10:18:11 +0530
From: Deepak R Varma <drv@mailo.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915/gvt: Avoid full proxy f_ops for
 vgpu_status debug attributes
Message-ID: <Y8d6CwD3dHLKOUZ5@ubun2204.myguest.virtualbox.org>
References: <cover.1673375066.git.drv@mailo.com>
 <188df08e0feba0cda2c92145f513dd4e57c6e6cf.1673375066.git.drv@mailo.com>
 <Y72zVXYLVHXuyK05@intel.com>
 <Y8TkTi+/GQwhiMvO@zhen-hp.sh.intel.com>
 <Y8b3IRhx976Ke99X@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8b3IRhx976Ke99X@intel.com>
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
Cc: Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 intel-gfx@lists.freedesktop.org, Saurabh Singh Sengar <ssengar@microsoft.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 17, 2023 at 02:29:37PM -0500, Rodrigo Vivi wrote:
> On Mon, Jan 16, 2023 at 01:44:46PM +0800, Zhenyu Wang wrote:
> > On 2023.01.10 13:49:57 -0500, Rodrigo Vivi wrote:
> > > On Wed, Jan 11, 2023 at 12:00:12AM +0530, Deepak R Varma wrote:
> > > > Using DEFINE_SIMPLE_ATTRIBUTE macro with the debugfs_create_file()
> > > > function adds the overhead of introducing a proxy file operation
> > > > functions to wrap the original read/write inside file removal protection
> > > > functions. This adds significant overhead in terms of introducing and
> > > > managing the proxy factory file operations structure and function
> > > > wrapping at runtime.
> > > > As a replacement, a combination of DEFINE_DEBUGFS_ATTRIBUTE macro paired
> > > > with debugfs_create_file_unsafe() is suggested to be used instead.  The
> > > > DEFINE_DEBUGFS_ATTRIBUTE utilises debugfs_file_get() and
> > > > debugfs_file_put() wrappers to protect the original read and write
> > > > function calls for the debug attributes. There is no need for any
> > > > runtime proxy file operations to be managed by the debugfs core.
> > > > Following coccicheck make command helped identify this change:
> > > > 
> > > > make coccicheck M=drivers/gpu/drm/i915/ MODE=patch COCCI=./scripts/coccinelle/api/debugfs/debugfs_simple_attr.cocci
> > > > 
> > > > Signed-off-by: Deepak R Varma <drv@mailo.com>
> > > 
> > > I believe these 2 gvt cases could be done in one patch.
> > > But anyways,
> > > 
> > > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > 
> > > for both patches... and will leave these 2 patches for gvt folks
> > > to apply. Unless they ack and I apply in the drm-intel along with the other ones.
> > >
> > 
> > yeah, they're fine with me, feel free to apply them directly.
> > 
> > Acked-by: Zhenyu Wang <zhenyuw@linux.intel.com>
> 
> Unfortunately I got some conflicts when trying to apply on drm-intel-next.
> 
> We probably need a new version, and probably through gvt branches it
> will be easier to handle conflicts if they appear.

Hello Rodrigo,
Sure. I will send in a new version. I am current using linux-next git repo as my
remote origin [tag 20230113]. Are there any specific instruction/location from
where I should access the gvt branch?

Thank you.

> 
> > 
> > thanks!
> > 
> > > > ---
> > > >  drivers/gpu/drm/i915/gvt/debugfs.c | 6 +++---
> > > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/i915/gvt/debugfs.c b/drivers/gpu/drm/i915/gvt/debugfs.c
> > > > index 03f081c3d9a4..baccbf1761b7 100644
> > > > --- a/drivers/gpu/drm/i915/gvt/debugfs.c
> > > > +++ b/drivers/gpu/drm/i915/gvt/debugfs.c
> > > > @@ -165,7 +165,7 @@ static int vgpu_status_get(void *data, u64 *val)
> > > >  	return 0;
> > > >  }
> > > >  
> > > > -DEFINE_SIMPLE_ATTRIBUTE(vgpu_status_fops, vgpu_status_get, NULL, "0x%llx\n");
> > > > +DEFINE_DEBUGFS_ATTRIBUTE(vgpu_status_fops, vgpu_status_get, NULL, "0x%llx\n");
> > > >  
> > > >  /**
> > > >   * intel_gvt_debugfs_add_vgpu - register debugfs entries for a vGPU
> > > > @@ -182,8 +182,8 @@ void intel_gvt_debugfs_add_vgpu(struct intel_vgpu *vgpu)
> > > >  			    &vgpu_mmio_diff_fops);
> > > >  	debugfs_create_file_unsafe("scan_nonprivbb", 0644, vgpu->debugfs, vgpu,
> > > >  				   &vgpu_scan_nonprivbb_fops);
> > > > -	debugfs_create_file("status", 0644, vgpu->debugfs, vgpu,
> > > > -			    &vgpu_status_fops);
> > > > +	debugfs_create_file_unsafe("status", 0644, vgpu->debugfs, vgpu,
> > > > +				   &vgpu_status_fops);
> > > >  }
> > > >  
> > > >  /**
> > > > -- 
> > > > 2.34.1
> > > > 
> > > > 
> > > > 
> 
> 


