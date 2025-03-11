Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A239A5CBCF
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 18:13:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D98A10E2BF;
	Tue, 11 Mar 2025 17:13:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fcfFIT1r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9E6010E2BF;
 Tue, 11 Mar 2025 17:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741713203; x=1773249203;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=24+5qJIcAfCH8EBR18YUzgbstW0szGfuyAGdr6wElAA=;
 b=fcfFIT1rK/64E491BKGHG6sHIX/Ew74gkwiko06d8blqS91MDQLD/tS+
 6h3ULk+Z8GJizlMblohXclvJ3UJOMRpSKs9aUaBW8zaWIAb+qr7shruj5
 vEyluNP2jPf6EXv0tcR64v1ryW+vgKUq9mGmUOnLsVVR3BwA99J2a5bsR
 e5SBO5npEE3eRv9bgLAoINURb2uRVVvHb2A17HQcWDr8QkJB3LSk0Li+v
 g3+sr6+tDDKJgbR22cA1QK6w2vQW6sDgzeoqFpkSIVYetpH4BUYZXG37q
 jH8v9SE01PJFl9LW6j119G0RTEdCo1rngvBZxkQ9t3a+rXGBRZRFtQlhn Q==;
X-CSE-ConnectionGUID: Vl6ZSD3cRLSaOeap2qmVXg==
X-CSE-MsgGUID: IZgCsrD8SX253GBZhawPAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="60312353"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="60312353"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 10:13:22 -0700
X-CSE-ConnectionGUID: Sd44fNiVQvS0KlFxHSngYQ==
X-CSE-MsgGUID: YYdp9I3OToyuGLScQZb5UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="120326006"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 10:13:18 -0700
Date: Tue, 11 Mar 2025 19:13:15 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 siqueira@igalia.com, airlied@gmail.com, simona@ffwll.ch,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 Xaver Hugl <xaver.hugl@kde.org>
Subject: Re: [PATCH 2/2] drm/amdgpu: Make use of drm_wedge_app_info
Message-ID: <Z9BvK55_Nim54eOu@black.fi.intel.com>
References: <20250228121353.1442591-1-andrealmeid@igalia.com>
 <20250228121353.1442591-3-andrealmeid@igalia.com>
 <Z8HO-s_otb2u44V7@black.fi.intel.com>
 <38b9cc8b-2a55-4815-a19f-f5bdf0f7687c@igalia.com>
 <Z8KjZfLYjH6ehYwy@black.fi.intel.com>
 <73602c9b-74f6-4b4a-82c6-918292b13cf7@igalia.com>
 <CADnq5_PbZUoyxyqweqa=kUNsSXanjY=5mUJrn03aY3je6rER+w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADnq5_PbZUoyxyqweqa=kUNsSXanjY=5mUJrn03aY3je6rER+w@mail.gmail.com>
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

On Mon, Mar 10, 2025 at 06:03:27PM -0400, Alex Deucher wrote:
> On Mon, Mar 10, 2025 at 5:54 PM André Almeida <andrealmeid@igalia.com> wrote:
> >
> > Em 01/03/2025 03:04, Raag Jadav escreveu:
> > > On Fri, Feb 28, 2025 at 06:49:43PM -0300, André Almeida wrote:
> > >> Hi Raag,
> > >>
> > >> On 2/28/25 11:58, Raag Jadav wrote:
> > >>> On Fri, Feb 28, 2025 at 09:13:53AM -0300, André Almeida wrote:
> > >>>> To notify userspace about which app (if any) made the device get in a
> > >>>> wedge state, make use of drm_wedge_app_info parameter, filling it with
> > >>>> the app PID and name.
> > >>>>
> > >>>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> > >>>> ---
> > >>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 19 +++++++++++++++++--
> > >>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |  6 +++++-
> > >>>>    2 files changed, 22 insertions(+), 3 deletions(-)
> > >>>>
> > >>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > >>>> index 00b9b87dafd8..e06adf6f34fd 100644
> > >>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > >>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > >>>> @@ -6123,8 +6123,23 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
> > >>>>            atomic_set(&adev->reset_domain->reset_res, r);
> > >>>> -  if (!r)
> > >>>> -          drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE, NULL);
> > >>>> +  if (!r) {
> > >>>> +          struct drm_wedge_app_info aux, *info = NULL;
> > >>>> +
> > >>>> +          if (job) {
> > >>>> +                  struct amdgpu_task_info *ti;
> > >>>> +
> > >>>> +                  ti = amdgpu_vm_get_task_info_pasid(adev, job->pasid);
> > >>>> +                  if (ti) {
> > >>>> +                          aux.pid = ti->pid;
> > >>>> +                          aux.comm = ti->process_name;
> > >>>> +                          info = &aux;
> > >>>> +                          amdgpu_vm_put_task_info(ti);
> > >>>> +                  }
> > >>>> +          }
> > >>> Is this guaranteed to be guilty app and not some scheduled worker?
> > >>
> > >> This is how amdgpu decides which app is the guilty one earlier in the code
> > >> as in the print:
> > >>
> > >>      ti = amdgpu_vm_get_task_info_pasid(ring->adev, job->pasid);
> > >>
> > >>      "Process information: process %s pid %d thread %s pid %d\n"
> > >>
> > >> So I think it's consistent with what the driver thinks it's the guilty
> > >> process.
> > >
> > > Sure, but with something like app_info we're kind of hinting to userspace
> > > that an application was _indeed_ involved with reset. Is that also guaranteed?
> > >
> > > Is it possible that an application needlessly suffers from a false positive
> > > scenario (reset due to other factors)?
> > >
> >
> > I asked Alex Deucher in IRC about that and yes, there's a chance that
> > this is a false positive. However, for the majority of cases this is the
> > right app that caused the hang. This is what amdgpu is doing for GL
> > robustness as well and devcoredump, so it's very consistent with how
> > amdgpu deals with this scenario even if the mechanism is still not perfect.
> 
> It's usually the guilty one, but it's not guaranteed.  For example,
> say you have a ROCm user queue and a gfx job submitted to a kernel
> queue.  The actual guilty job may be the ROCm user queue, but the
> driver may not detect that the ROCm queue was hung until some other
> event (e.g., memory pressure).  However, the timer for the gfx job may
> timeout before that happens on the ROCm queue so in that case the gfx
> job would be incorrectly considered guilty.

So it boils down to what are the chances of that happening and whether
it's significant enough to open the door for API abuse.

Considering this is amd specific accuracy, it's still an open question
how other drivers are/will be managing it.

Raag
