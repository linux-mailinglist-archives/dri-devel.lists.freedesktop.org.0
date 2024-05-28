Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEAAB8D19AF
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 13:35:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C04710F545;
	Tue, 28 May 2024 11:35:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HYaY5UPs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDE7310E746;
 Tue, 28 May 2024 11:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716896143; x=1748432143;
 h=date:from:to:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=Djw9ZgFoe1/UlvS0+QnC9yz7ntgBapg5+DLCsagzLjY=;
 b=HYaY5UPsQDQNnGjM5W1h++Wac6EyEiFaGRLQvyVaMOQ/faTBcqJWtjti
 mATmjG6TfR23tJy5ibYYRIaq3Xhs277YY1hPlbFH/ivnLJyyjyVF8+yX+
 HiZbkzWl0rGO7uaxiaXPCiaSjzcKWJO/NNQ0f0djqfyr0vpP2edIB+FFq
 DAxxQYbyanu1tS2oQ3wUplh2Xwpx1tsbVYX77Wp+K/nk0xOgGJXpWoTtm
 jYFRs+Cv7TwldZj4qMATByg7BvewGroLAhk8q1YKtoSWwDIPYEvoAWX4v
 PEOXKdHtIniA311BpLOFWhlPdVKeCelkFuUTiLgjFE6Pq176M/VMZjepn A==;
X-CSE-ConnectionGUID: w3AwHbf4SKqoiTGpTkYy0w==
X-CSE-MsgGUID: R+zJk689Qye/8W1kK7tbRg==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13455750"
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="13455750"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 04:35:07 -0700
X-CSE-ConnectionGUID: Bz/blXswSmScctsW9MfXow==
X-CSE-MsgGUID: ExzH7pscQeW0zP8jlUDk+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="35660778"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 04:35:05 -0700
Date: Tue, 28 May 2024 14:35:10 +0300
From: Imre Deak <imre.deak@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 4/9] drm/i915: Introduce fb->min_alignment
Message-ID: <ZlXBbkseoMxfXzlZ@ideak-desk.fi.intel.com>
References: <20240513175942.12910-1-ville.syrjala@linux.intel.com>
 <20240513175942.12910-5-ville.syrjala@linux.intel.com>
 <ZlW/uMCDFles0dyv@ideak-desk.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZlW/uMCDFles0dyv@ideak-desk.fi.intel.com>
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
Reply-To: imre.deak@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 28, 2024 at 02:27:58PM +0300, Imre Deak wrote:
> [...]
> > +}
> > +
> >  static unsigned int
> >  intel_plane_fb_min_alignment(const struct intel_plane_state *plane_state)
> >  {
> >  	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
> > -	const struct drm_framebuffer *fb = plane_state->hw.fb;
> > +	const struct intel_framebuffer *fb = to_intel_framebuffer(plane_state->hw.fb);
> >  
> > -	return plane->min_alignment(plane, fb, 0);
> > +	/*
> > +	 * Only use plane specific alignment for binding
> > +	 * a per-plane gtt view (remapped or rotated),
> > +	 * otherwise make sure the alignment is suitable
> > +	 * for all planes.
> > +	 */
> > +	if (!gtt_view_is_per_plane(plane_state))
> > +		return fb->min_alignment;
> > +
> > +	if (intel_plane_needs_physical(plane))
> > +		return 0;
> 
> I guess the above is ok, though looks like an unrelated change: the
> cursor plane min_alignment() for relevant platforms is <= 4k, which will
> be rounded up to 4k anyway when binding the vma.

Hm, actually this would change the current 16k vma alignment for cursors on i830?

> 
> > +
> > +	return plane->min_alignment(plane, &fb->base, 0);
> 
> The commit could've had more details about the rational for the above.
> As I understand it avoids having to rebind the vma for different plane
> types, though this is already handled to some degree by
> i915_vma::display_alignment.
> 
> >  }
> >  
> >  static unsigned int
> > diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
> > index ff685aebbd1a..124aac172acb 100644
> > --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
> > +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
> > @@ -46,7 +46,6 @@
> >  #include "gem/i915_gem_mman.h"
> >  
> >  #include "i915_drv.h"
> > -#include "intel_crtc.h"
> >  #include "intel_display_types.h"
> >  #include "intel_fb.h"
> >  #include "intel_fb_pin.h"
> > @@ -172,21 +171,6 @@ static const struct fb_ops intelfb_ops = {
> >  
> >  __diag_pop();
> >  
> > -static unsigned int intel_fbdev_min_alignment(const struct drm_framebuffer *fb)
> > -{
> > -	struct drm_i915_private *i915 = to_i915(fb->dev);
> > -	struct intel_plane *plane;
> > -	struct intel_crtc *crtc;
> > -
> > -	crtc = intel_first_crtc(i915);
> > -	if (!crtc)
> > -		return 0;
> > -
> > -	plane = to_intel_plane(crtc->base.primary);
> > -
> > -	return plane->min_alignment(plane, fb, 0);
> > -}
> > -
> >  static int intelfb_create(struct drm_fb_helper *helper,
> >  			  struct drm_fb_helper_surface_size *sizes)
> >  {
> > @@ -244,7 +228,7 @@ static int intelfb_create(struct drm_fb_helper *helper,
> >  	 * BIOS is suitable for own access.
> >  	 */
> >  	vma = intel_fb_pin_to_ggtt(&fb->base, &view,
> > -				   intel_fbdev_min_alignment(&fb->base), 0,
> > +				   fb->min_alignment, 0,
> >  				   false, &flags);
> >  	if (IS_ERR(vma)) {
> >  		ret = PTR_ERR(vma);
> > -- 
> > 2.43.2
> > 
