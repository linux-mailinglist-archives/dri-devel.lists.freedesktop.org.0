Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6797A3C84A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 20:11:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EE6D10E35B;
	Wed, 19 Feb 2025 19:11:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="crMg/yf0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 776A010E88C;
 Wed, 19 Feb 2025 19:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739992310; x=1771528310;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Ke6kIODm7Ic5ld2VhbGjjU4lqUyHOlUNpqd7DdjdFYc=;
 b=crMg/yf0dUq9P4Bii1wFtB/stNu35Zq9SxBYLhOIWXDfslSdL+V1y/4V
 qGMeUgBYnJNgKZb4CB/c9uOsAgveVmEb3MgPzM0q0+r1cHfZUOMlD/2LR
 yvSrIW2SvJMJuU+gwB3aEmTmbbEiiagLdfh+mUeb0LCCIEfBfxN6FjmmN
 TSXo/SapLIR6nz7KLmutcQnZ55vJQ2nBzxx81QJdjviLDusl65FN6++2L
 DWcArvuaY8giOLNfzdefFrQnPtYPohGqTTfUdfBsZth3ahHPJEgZzGf1h
 SUZOy0P7n3ZKob9E3FMHHKUvJMHa9KgzTHbO5CtMNfcjUoG9Glse8HTXO A==;
X-CSE-ConnectionGUID: 2f/lYnj3S+WQft+pjwnCPA==
X-CSE-MsgGUID: Kt4gttFoQfqi3M5hRjxPVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="44663087"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; d="scan'208";a="44663087"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 11:11:47 -0800
X-CSE-ConnectionGUID: zzwfKHGhTTOb+YmgD3VuBQ==
X-CSE-MsgGUID: A/IeRTbWRrObUAqmg7WciQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="120015438"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 19 Feb 2025 11:10:44 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 19 Feb 2025 21:10:42 +0200
Date: Wed, 19 Feb 2025 21:10:42 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH] drm/atomic: Filter out redundant DPMS calls
Message-ID: <Z7YssnuBvJ0MtaNX@intel.com>
References: <20250219160239.17502-1-ville.syrjala@linux.intel.com>
 <Z7YPjEOgLJGsAt2d@hm-sls2>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z7YPjEOgLJGsAt2d@hm-sls2>
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

On Wed, Feb 19, 2025 at 12:06:20PM -0500, Hamza Mahfooz wrote:
> On Wed, Feb 19, 2025 at 06:02:39PM +0200, Ville Syrjala wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > 
> > Video players (eg. mpv) do periodic XResetScreenSaver() calls to
> > keep the screen on while the video playing. The modesetting ddx
> > plumbs these straight through into the kernel as DPMS setproperty
> > ioctls, without any filtering whatsoever. When implemented via
> > atomic these end up as full commits on the crtc, which leads to a
> > dropped frame every time XResetScreenSaver() is called.
> > 
> > Let's just filter out redundant DPMS property changes in the
> > kernel to avoid this issue.
> 
> Do you know if this has any impact on the DPMS timeout (as set by
> DPMSSetTimeouts())?

That's all in userspace.

> 
> > 
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >  drivers/gpu/drm/drm_atomic_uapi.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> > index 2765ba90ad8f..c2726af6698e 100644
> > --- a/drivers/gpu/drm/drm_atomic_uapi.c
> > +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> > @@ -957,6 +957,10 @@ int drm_atomic_connector_commit_dpms(struct drm_atomic_state *state,
> >  
> >  	if (mode != DRM_MODE_DPMS_ON)
> >  		mode = DRM_MODE_DPMS_OFF;
> > +
> > +	if (connector->dpms == mode)
> > +		goto out;
> > +
> >  	connector->dpms = mode;
> >  
> >  	crtc = connector->state->crtc;
> > -- 
> > 2.45.3

-- 
Ville Syrjälä
Intel
