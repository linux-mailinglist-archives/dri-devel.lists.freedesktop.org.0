Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE97A3DE66
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 16:27:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2324F10E99E;
	Thu, 20 Feb 2025 15:27:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WoTG9crP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7964E10E995;
 Thu, 20 Feb 2025 15:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740065233; x=1771601233;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=uTnLf8wvB429OSCdHA4hXdgbljgSBLn2hsDZwxYmKRU=;
 b=WoTG9crPQtKqLfr8m+6/4PPchRgBENV3E1M1YjiyQY3omcCi8OLBd3eV
 0ButBXktoey6XtrN5qkGunDe5u325JQnG4xoehCfXTasWbJpLMvM0KtvJ
 uiD9s6O8rboxrOlJOgU8A7VIzJb0PrYyaVjbr14pMuty8i9vbgIopfkxN
 ZNLlfpGtBLz0Qy7VFQaaSR8cWhubMFE+XAveCLN4itkc1RA5Ga0VvCtAV
 ihxtRMH10vK86bvPMH5c8+waDni8XCKzB4dl5SrUkNpIthbt0zLiZj0/d
 zcARMRk3wEFJGhvYFYTiPMU4xf75OyMLtiGHqZ2MhNwEtqCuxlgzw3aec g==;
X-CSE-ConnectionGUID: rSyN9k5RS66D7oT0vavQ+w==
X-CSE-MsgGUID: L8D/IdRXRCWp1QVyUgeMQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41057917"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="41057917"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 07:27:13 -0800
X-CSE-ConnectionGUID: +ZtmpS62R7KkUm/Wwx2ZoQ==
X-CSE-MsgGUID: l71k36X1Qa6EQtzOn6oedQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="120290224"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 20 Feb 2025 07:27:11 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 20 Feb 2025 17:27:10 +0200
Date: Thu, 20 Feb 2025 17:27:10 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH] drm/atomic: Filter out redundant DPMS calls
Message-ID: <Z7dJzkupHUSXPtDT@intel.com>
References: <20250219160239.17502-1-ville.syrjala@linux.intel.com>
 <Z7b7tSabXeLe1ovT@phenom.ffwll.local>
 <Z7b9PD2o6XhfdjWf@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z7b9PD2o6XhfdjWf@phenom.ffwll.local>
X-Patchwork-Hint: comment
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

On Thu, Feb 20, 2025 at 11:00:28AM +0100, Simona Vetter wrote:
> On Thu, Feb 20, 2025 at 10:53:57AM +0100, Simona Vetter wrote:
> > On Wed, Feb 19, 2025 at 06:02:39PM +0200, Ville Syrjala wrote:
> > > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > 
> > > Video players (eg. mpv) do periodic XResetScreenSaver() calls to
> > > keep the screen on while the video playing. The modesetting ddx
> > > plumbs these straight through into the kernel as DPMS setproperty
> > > ioctls, without any filtering whatsoever. When implemented via
> > > atomic these end up as full commits on the crtc, which leads to a
> > > dropped frame every time XResetScreenSaver() is called.
> > 
> > I think you should add here that it's just an empty commit, because we do
> > filter out redundant commits where crtc->active_changed does nothing.
> > Except we still run the entire machinery with timestamps and drm_event and
> > everything.

Yeah, it'll take at least one frame. And it's a blocking ioctl as well.

> > 
> > And I don't think it's worth to filter that out at the atomic level,
> > because it's really only legacy ioctl that had this "complete noop"
> > behaviour.

Yep, I think we can expect atomic userspace to do better.
Oh, and you can't even set the DPMS property via the atomic uapi
directly.

> > 
> > With the commit message augmented:
> > 
> > Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>
> 
> Ok, one more thing: Please also augment the dpms property uapi doc text
> with a note that we make this guarantee. Otherwise this feels a bit too
> much opaque magic. Maybe even a one-liner comment in the code that this is
> uapi?

Something like this perhaps?
+ *     On atomic drivers any DPMS setproperty ioctl where the value does not
+ *     change is completely skipped, otherwise an atomic commit will occur.
+ *     On legacy drivers the exact behavior is driver specific.

> -Sima
> 
> > 
> > Might also be nice to have a igt for this? Plus also wondering whether we
> > should cc: stable it.
> > 
> > Cheers, Sima
> > 
> > > Let's just filter out redundant DPMS property changes in the
> > > kernel to avoid this issue.
> > > 
> > > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > ---
> > >  drivers/gpu/drm/drm_atomic_uapi.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> > > index 2765ba90ad8f..c2726af6698e 100644
> > > --- a/drivers/gpu/drm/drm_atomic_uapi.c
> > > +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> > > @@ -957,6 +957,10 @@ int drm_atomic_connector_commit_dpms(struct drm_atomic_state *state,
> > >  
> > >  	if (mode != DRM_MODE_DPMS_ON)
> > >  		mode = DRM_MODE_DPMS_OFF;
> > > +
> > > +	if (connector->dpms == mode)
> > > +		goto out;
> > > +
> > >  	connector->dpms = mode;
> > >  
> > >  	crtc = connector->state->crtc;
> > > -- 
> > > 2.45.3
> > > 
> > 
> > -- 
> > Simona Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
> 
> -- 
> Simona Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Ville Syrjälä
Intel
