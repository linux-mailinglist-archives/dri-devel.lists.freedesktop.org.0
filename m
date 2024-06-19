Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BA790F47E
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 18:53:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC09C10ED49;
	Wed, 19 Jun 2024 16:53:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KH0yoEsM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6123A10ED48;
 Wed, 19 Jun 2024 16:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718816011; x=1750352011;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=XXIrMAcMbcp5oaVVNppfAytQzZjKAra1ESuvjV2+tg4=;
 b=KH0yoEsMn8HmvMLlylgLQtKEfLlfNJsWSY/5t6vLq9/mfS2eH1IsXxgN
 +2c23rQjn7iqwVd/q9ALigNi8+AFRGdeWWouJqFve85hsEyff2dNjqHk3
 7l+cmMohiw6tZcKh53CbjbFV8+/a9RMHxpbOdof9t3fbVzteuyp97QS9R
 8wV0mrkHRnJWVGbSGZYACezPqfr0Wt2UyTLrHM4SE5MVvr/u7nHPPqAkj
 r1zMeArbO1B8W6o6Vh4lT+cQD1fabNGZjQkTt5JFLBkANiA9GHgHvhTZi
 fXLZ1/3dzWLBa+Iy8ZcwLSu9UmiXnOn72H0luKMT/pInA1V2mCaVWYTBg A==;
X-CSE-ConnectionGUID: m9BTvkPbTQKo0pBat/AgvQ==
X-CSE-MsgGUID: R888DsmlQIGCr4/CHkz/Hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15743802"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="15743802"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 09:53:30 -0700
X-CSE-ConnectionGUID: jOZ8PKgJSf25HoRmbnZigw==
X-CSE-MsgGUID: pDtwV7+YQrmjOn2N7sjD5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="41932105"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 19 Jun 2024 09:53:24 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 19 Jun 2024 19:53:23 +0300
Date: Wed, 19 Jun 2024 19:53:23 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 0/9] drm/i915: Polish plane surface alignment handling
Message-ID: <ZnMNA8QQdxPLQ1oV@intel.com>
References: <20240612204712.31404-1-ville.syrjala@linux.intel.com>
 <ZnLDKM2I8WWrWwmO@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZnLDKM2I8WWrWwmO@intel.com>
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

On Wed, Jun 19, 2024 at 02:38:16PM +0300, Ville Syrjälä wrote:
> On Wed, Jun 12, 2024 at 11:47:03PM +0300, Ville Syrjala wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > 
> > intel_surf_alignment() in particular has devolved into
> > a complete mess. Redesign the code so that we can handle
> > alignment restrictions in a nicer. Also adjust alignment
> > for TGL+ to actually match the hardware requirements.
> > 
> > v2: Drop the per-plane vma stuff as it was borked
> >     Don't temporarily remove the 2MiB DPT alignment for UV on TGL
> > 
> > Ville Syrjälä (9):
> >   drm: Rename drm_plane_check_pixel_format() to drm_plane_has_format()
> >   drm: Export drm_plane_has_format()
> 
> Maarten/Maxime/Thomas, can I get an ack for merging these via
> drm-intel please?
> 
> >   drm/i915: Introduce the plane->min_alignment() vfunc
> >   drm/i915: Introduce fb->min_alignment
> >   drm/i915: Split cursor alignment to per-platform vfuncs
> >   drm/i915: Split pre-skl platforms out from intel_surf_alignment()
> >   drm/i915: Move intel_surf_alignment() into skl_univerals_plane.c
> >   drm/i915: Update plane alignment requirements for TGL+
> >   drm/i915: Nuke the TGL+ chroma plane tile row alignment stuff
> > 
> >  drivers/gpu/drm/drm_atomic.c                  |   7 +-
> >  drivers/gpu/drm/drm_crtc.c                    |   6 +-
> >  drivers/gpu/drm/drm_crtc_internal.h           |   2 -
> >  drivers/gpu/drm/drm_plane.c                   |  23 ++-
> >  drivers/gpu/drm/i915/display/i9xx_plane.c     |  75 ++++++++-
> >  drivers/gpu/drm/i915/display/intel_cursor.c   |  38 +++++
> >  .../drm/i915/display/intel_display_types.h    |   5 +
> >  drivers/gpu/drm/i915/display/intel_fb.c       | 151 ++++--------------
> >  drivers/gpu/drm/i915/display/intel_fb.h       |   3 -
> >  drivers/gpu/drm/i915/display/intel_fb_pin.c   |  39 +++--
> >  drivers/gpu/drm/i915/display/intel_fb_pin.h   |   3 +-
> >  drivers/gpu/drm/i915/display/intel_fbdev.c    |   5 +-
> >  drivers/gpu/drm/i915/display/intel_sprite.c   |  26 +++
> >  .../drm/i915/display/skl_universal_plane.c    |  85 +++++++++-
> >  drivers/gpu/drm/xe/display/xe_fb_pin.c        |   3 +-
> >  drivers/gpu/drm/xe/display/xe_plane_initial.c |   4 +-
> 
> Lucas, can you give me an ack for the merging the xe
> changes via drm-intel?

Apparently Lucas is out. Rodrigo, can you ack this?

> 
> >  include/drm/drm_plane.h                       |   2 +
> >  17 files changed, 309 insertions(+), 168 deletions(-)
> > 
> > -- 
> > 2.44.2
> 
> -- 
> Ville Syrjälä
> Intel

-- 
Ville Syrjälä
Intel
