Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 875509F0F52
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 15:36:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C6E110F03B;
	Fri, 13 Dec 2024 14:36:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IVHnUBK+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B240510F03B;
 Fri, 13 Dec 2024 14:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734100612; x=1765636612;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=YBcoTpTWKibasV/+heQtN+JEvDMzFqVAV8Zs1N+emGg=;
 b=IVHnUBK+oadTmeMvl3u1OJWkB0U2+Rq5uUYzv4klw7279GcA4J3ZSElt
 cy6+BWDwlxKIduQnNkQz2jU5Du0QAP28yI0cW4cDVuiW3/Q+hPMvR6DP6
 8k2X6M/wNycGtOWZxVxNYLVu3cN8yPSvM5RYJfhnXbAQO/nipdNUZ+8c3
 REsLvyt9Sn1T1KlX41zndTzqtw/jBrctLGhR3ymMv8UOKMMFJCXCJpY37
 ePskT1A4THW7yv9KSEHoKY9PseTuKoIZuDzClqLC5yUVr3mJU32IPaNc6
 +a7UiSwrbay6uc8Z9jRbEBnsPZEBPco7LZx2RloktdrBdj8EIrSvSbmlU g==;
X-CSE-ConnectionGUID: RxjBKZdVQfSupXn3bqP1fw==
X-CSE-MsgGUID: yA+kY9XiSEiq1HQbYeX3Og==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="45163432"
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; d="scan'208";a="45163432"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 06:36:51 -0800
X-CSE-ConnectionGUID: aOpbWUmCTTGH6embKJih9A==
X-CSE-MsgGUID: oOnkyNxSTumTT/K5CaiZcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="96408972"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 06:36:47 -0800
Date: Fri, 13 Dec 2024 16:36:43 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 airlied@gmail.com, simona@ffwll.ch, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 andriy.shevchenko@linux.intel.com, lina@asahilina.net,
 michal.wajdeczko@intel.com, "Sharma, Shashank" <Shashank.Sharma@amd.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 himal.prasad.ghimiray@intel.com, aravind.iddamsetty@linux.intel.com,
 anshuman.gupta@intel.com, alexander.deucher@amd.com,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com
Subject: Re: [PATCH 1/1] drm/amdgpu: Use device wedged event
Message-ID: <Z1xGe1X_XzB00J1Q@black.fi.intel.com>
References: <20241212190909.28559-1-andrealmeid@igalia.com>
 <20241212190909.28559-2-andrealmeid@igalia.com>
 <d9f2583d-da79-4532-90fc-85028e977ceb@amd.com>
 <c7c498f0-2ee3-42f5-9b45-c87e52ffc3e4@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c7c498f0-2ee3-42f5-9b45-c87e52ffc3e4@igalia.com>
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

On Fri, Dec 13, 2024 at 11:15:31AM -0300, André Almeida wrote:
> Hi Christian,
> 
> Em 13/12/2024 04:34, Christian König escreveu:
> > Am 12.12.24 um 20:09 schrieb André Almeida:
> > > Use DRM's device wedged event to notify userspace that a reset had
> > > happened. For now, only use `none` method meant for telemetry
> > > capture.
> > > 
> > > Signed-off-by: André Almeida <andrealmeid@igalia.com>
> > > ---
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 3 +++
> > >   1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > > b/drivers/gpu/ drm/amd/amdgpu/amdgpu_device.c
> > > index 96316111300a..19e1a5493778 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > > @@ -6057,6 +6057,9 @@ int amdgpu_device_gpu_recover(struct
> > > amdgpu_device *adev,
> > >           dev_info(adev->dev, "GPU reset end with ret = %d\n", r);
> > >       atomic_set(&adev->reset_domain->reset_res, r);
> > > +
> > > +    drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE);
> > 
> > That looks really good in general. I would just make the
> > DRM_WEDGE_RECOVERY_NONE depend on the value of "r".
> > 
> 
> Why depend or `r`? A reset was triggered anyway, regardless of the success
> of it, shouldn't we tell userspace?

A failed reset would perhaps result in wedging, atleast that's how i915
is handling it.

Raag
