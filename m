Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C81BDA4A936
	for <lists+dri-devel@lfdr.de>; Sat,  1 Mar 2025 07:04:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA02E10E104;
	Sat,  1 Mar 2025 06:04:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iVWfETdy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CC3F10E104;
 Sat,  1 Mar 2025 06:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740809069; x=1772345069;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=c3on3RmOuYQNzLqfDmHQArk971VhgmNpJQD9KcEGlcA=;
 b=iVWfETdyBjJ/Jb2/juyeG6MerzgCDGpquDgYt10ei5jlh1+4wGIZPlaM
 cVt8kVrvzNQ2y7Byyo50Y8vnbR+FlU0DTnerKFLhA7DysvbguLvEYirxh
 tYF2EPSyvJmh6bT5aw9q3H7Sr2EtH0hSdysMJf8vu80l20a1kpyzpcMDn
 pReEWiJHkLhFSO2D131AlhRTTO9KCROFdcAqgZ7zYO286lyGycXuk3HgF
 TWqIp3XMIhvyZsapG7/6ViwstlNTdvZnyC6H04monE2ksOATJaxMoXLMg
 y/y1/+m42Y825qTDSjv5KQB/tBq1rivmZODNoXYd82rwSM3MUSH7cciIA g==;
X-CSE-ConnectionGUID: Fq5S+5+ORa+8te6y0kwGZA==
X-CSE-MsgGUID: Q6LSdm9gQ7OXF3ph8+3png==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="59283256"
X-IronPort-AV: E=Sophos;i="6.13,324,1732608000"; d="scan'208";a="59283256"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 22:04:27 -0800
X-CSE-ConnectionGUID: 1l0M562iQ7u6+0aBrCEQxw==
X-CSE-MsgGUID: sQ+TNsB6TRG0lvoNNCBkdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,324,1732608000"; d="scan'208";a="117308986"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 22:04:24 -0800
Date: Sat, 1 Mar 2025 08:04:21 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 'Christian =?iso-8859-1?Q?K=F6nig'?= <christian.koenig@amd.com>,
 siqueira@igalia.com, airlied@gmail.com, simona@ffwll.ch,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com
Subject: Re: [PATCH 2/2] drm/amdgpu: Make use of drm_wedge_app_info
Message-ID: <Z8KjZfLYjH6ehYwy@black.fi.intel.com>
References: <20250228121353.1442591-1-andrealmeid@igalia.com>
 <20250228121353.1442591-3-andrealmeid@igalia.com>
 <Z8HO-s_otb2u44V7@black.fi.intel.com>
 <38b9cc8b-2a55-4815-a19f-f5bdf0f7687c@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <38b9cc8b-2a55-4815-a19f-f5bdf0f7687c@igalia.com>
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

On Fri, Feb 28, 2025 at 06:49:43PM -0300, André Almeida wrote:
> Hi Raag,
> 
> On 2/28/25 11:58, Raag Jadav wrote:
> > On Fri, Feb 28, 2025 at 09:13:53AM -0300, André Almeida wrote:
> > > To notify userspace about which app (if any) made the device get in a
> > > wedge state, make use of drm_wedge_app_info parameter, filling it with
> > > the app PID and name.
> > > 
> > > Signed-off-by: André Almeida <andrealmeid@igalia.com>
> > > ---
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 19 +++++++++++++++++--
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |  6 +++++-
> > >   2 files changed, 22 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > > index 00b9b87dafd8..e06adf6f34fd 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > > @@ -6123,8 +6123,23 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
> > >   	atomic_set(&adev->reset_domain->reset_res, r);
> > > -	if (!r)
> > > -		drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE, NULL);
> > > +	if (!r) {
> > > +		struct drm_wedge_app_info aux, *info = NULL;
> > > +
> > > +		if (job) {
> > > +			struct amdgpu_task_info *ti;
> > > +
> > > +			ti = amdgpu_vm_get_task_info_pasid(adev, job->pasid);
> > > +			if (ti) {
> > > +				aux.pid = ti->pid;
> > > +				aux.comm = ti->process_name;
> > > +				info = &aux;
> > > +				amdgpu_vm_put_task_info(ti);
> > > +			}
> > > +		}
> > Is this guaranteed to be guilty app and not some scheduled worker?
> 
> This is how amdgpu decides which app is the guilty one earlier in the code
> as in the print:
> 
>     ti = amdgpu_vm_get_task_info_pasid(ring->adev, job->pasid);
> 
>     "Process information: process %s pid %d thread %s pid %d\n"
> 
> So I think it's consistent with what the driver thinks it's the guilty
> process.

Sure, but with something like app_info we're kind of hinting to userspace
that an application was _indeed_ involved with reset. Is that also guaranteed?

Is it possible that an application needlessly suffers from a false positive
scenario (reset due to other factors)?

Raag
