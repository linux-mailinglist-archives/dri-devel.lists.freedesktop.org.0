Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1721BB0B16C
	for <lists+dri-devel@lfdr.de>; Sat, 19 Jul 2025 20:31:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 536AA10E2A8;
	Sat, 19 Jul 2025 18:30:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cY4E24ZV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D3A910E02E;
 Sat, 19 Jul 2025 18:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752949853; x=1784485853;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=0GPDXHtiCNdUnDUZaQj8amOknfSO5SESpbv6f2oeBgo=;
 b=cY4E24ZVv0QgO3DZikeRx4y+jPIBwvKsApLHkzlwDWNLKUNKZgRYWhAl
 SchCGuQodowGHdY+guE6NCnFlsLMHKhEZVDUoZx+APR8C7gv2tJSTpes9
 WNRSBJ3VwOEhM8ciNXDY1FZeJRZsdGxxhxMrvRl0fTW/371pMYdbOA0yN
 FvcIOT0XLa4LlBw3WHFnGOpXORKpeVIXvJRL/Ffnin5j8tQmJYBUqMOid
 pll6lY1qawuXUdwQx1yECOCrc5fI+oqAReTOVQjpMhPZ4eNU8NW+Db+Cg
 yJRKpzVoF4rOWDH4IOGnqCGXFfbO/VF4+NwN9TPeBQqUmpvmg4I0Rm80C g==;
X-CSE-ConnectionGUID: ZMu+F/cnQ3ys0vO0152suQ==
X-CSE-MsgGUID: jB4VHvoqRnuqXqxdAZ4Xkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11497"; a="55304667"
X-IronPort-AV: E=Sophos;i="6.16,324,1744095600"; d="scan'208";a="55304667"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2025 11:30:53 -0700
X-CSE-ConnectionGUID: Qsi2NV7aQ72T9kNwrvJC1w==
X-CSE-MsgGUID: f5Cb9QTySGiIjchwGuEgXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,324,1744095600"; d="scan'208";a="164121461"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO stinkbox)
 ([10.245.245.152])
 by orviesa005.jf.intel.com with SMTP; 19 Jul 2025 11:30:47 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Sat, 19 Jul 2025 21:30:46 +0300
Date: Sat, 19 Jul 2025 21:30:46 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 03/10] drm/i915/display/i9xx: Add a disable_tiling()
 for i9xx planes
Message-ID: <aHvkVora3Gzrm5NH@intel.com>
References: <20250618094011.238154-1-jfalempe@redhat.com>
 <20250618094011.238154-4-jfalempe@redhat.com>
 <aHviiKb0EnQbNksL@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aHviiKb0EnQbNksL@intel.com>
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

On Sat, Jul 19, 2025 at 09:23:04PM +0300, Ville Syrjälä wrote:
> On Wed, Jun 18, 2025 at 11:31:21AM +0200, Jocelyn Falempe wrote:
> > drm_panic draws in linear framebuffer, so it's easier to re-use the
> > current framebuffer, and disable tiling in the panic handler, to show
> > the panic screen.
> > This assumes that the alignment restriction is always smaller in
> > linear than in tiled.
> > It also assumes that the linear framebuffer size is always smaller
> > than the tiled.
> > 
> > Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> > ---
> > 
> > v7:
> >  * Reword commit message about alignment/size when disabling tiling (Ville Syrjälä)
> > 
> >  drivers/gpu/drm/i915/display/i9xx_plane.c     | 23 +++++++++++++++++++
> >  .../drm/i915/display/intel_display_types.h    |  2 ++
> >  2 files changed, 25 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/i9xx_plane.c b/drivers/gpu/drm/i915/display/i9xx_plane.c
> > index 8f15333a4b07..0807fae12450 100644
> > --- a/drivers/gpu/drm/i915/display/i9xx_plane.c
> > +++ b/drivers/gpu/drm/i915/display/i9xx_plane.c
> > @@ -905,6 +905,27 @@ static const struct drm_plane_funcs i8xx_plane_funcs = {
> >  	.format_mod_supported_async = intel_plane_format_mod_supported_async,
> >  };
> >  
> > +static void i9xx_disable_tiling(struct intel_plane *plane)
> > +{
> > +	struct intel_display *display = to_intel_display(plane);
> > +	enum i9xx_plane_id i9xx_plane = plane->i9xx_plane;
> > +	u32 dspcntr;
> > +	u32 reg;
> > +
> > +	dspcntr = intel_de_read_fw(display, DSPCNTR(display, i9xx_plane));
> > +	dspcntr &= ~DISP_TILED;
> > +	intel_de_write_fw(display, DSPCNTR(display, i9xx_plane), dspcntr);
> > +
> > +	if (DISPLAY_VER(display) >= 4) {
> > +		reg = intel_de_read_fw(display, DSPSURF(display, i9xx_plane));
> > +		intel_de_write_fw(display, DSPSURF(display, i9xx_plane), reg);
> > +
> > +	} else {
> > +		reg = intel_de_read_fw(display, DSPADDR(display, i9xx_plane));
> > +		intel_de_write_fw(display, DSPADDR(display, i9xx_plane), reg);
> > +	}
> > +}
> 
> I thought I already shot this down before, but apparently this
> got merged now :(
> 
> Just to reiterate why we don't want these 'disable tiling' hacks:
> - different tiling formats have different stride/alignment/watermark
>   requirements so one can't safely change from one tiling to another
> - this completely fails to account for the TILEOFF vs. LINOFF stuff

Oh yeah, and rotation support of course is one really big difference
between different tiling formats.

> - etc.
> 
> So IMO these hacks must be removed and instead the code must learn how
> to propetly write the tiled data. igt has all the code for that btw
> (twice over IIRC) so shouldn't be that hard.
> 
> I suppose the only hack we need to keep is to disable compression,
> mainly because (IIRC) on flat CCS systems the CPU doesn't have access
> to the AUX data to clear it manually.
> 
> I also wonder if there are actual igts for this? I think what is needed
> is a test that sets random things (different panning, rotation, pixel
> foramts, etc.) and triggers the dumper. Not quite sure how the test
> could validate that the output is correct though. CRCs might be a bit
> tricky since you need an identical reference image.
> 
> /me off to summer vacation. Good luck
> 
> -- 
> Ville Syrjälä
> Intel

-- 
Ville Syrjälä
Intel
