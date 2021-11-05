Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A23F044684E
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 19:14:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63AED6EC87;
	Fri,  5 Nov 2021 18:14:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2B656EC87
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Nov 2021 18:14:10 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10159"; a="218857606"
X-IronPort-AV: E=Sophos;i="5.87,212,1631602800"; d="scan'208";a="218857606"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2021 11:14:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,212,1631602800"; d="scan'208";a="542887102"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga008.fm.intel.com with SMTP; 05 Nov 2021 11:14:05 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 05 Nov 2021 20:14:04 +0200
Date: Fri, 5 Nov 2021 20:14:04 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 02/13] drm/connector: Add helper to check if a mode
 requires scrambling
Message-ID: <YYV0bArjRbvYJ2K2@intel.com>
References: <20211102145944.259181-1-maxime@cerno.tech>
 <20211102145944.259181-3-maxime@cerno.tech>
 <YYP+MX9gxZVafhKk@intel.com> <YYVxtp9PZiR3ZOjp@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YYVxtp9PZiR3ZOjp@phenom.ffwll.local>
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
Cc: Emma Anholt <emma@anholt.net>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-tegra@vger.kernel.org,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 05, 2021 at 07:02:30PM +0100, Daniel Vetter wrote:
> On Thu, Nov 04, 2021 at 05:37:21PM +0200, Ville Syrjälä wrote:
> > On Tue, Nov 02, 2021 at 03:59:33PM +0100, Maxime Ripard wrote:
> > > --- a/include/drm/drm_modes.h
> > > +++ b/include/drm/drm_modes.h
> > > @@ -424,6 +424,21 @@ static inline bool drm_mode_is_stereo(const struct drm_display_mode *mode)
> > >  	return mode->flags & DRM_MODE_FLAG_3D_MASK;
> > >  }
> > >  
> > > +/**
> > > + * drm_mode_hdmi_requires_scrambling - Checks if a mode requires HDMI Scrambling
> > > + * @mode: DRM display mode
> > > + *
> > > + * Checks if a given display mode requires the scrambling to be enabled.
> > > + *
> > > + * Returns:
> > > + * A boolean stating whether it's required or not.
> > > + */
> > > +static inline bool
> > > +drm_mode_hdmi_requires_scrambling(const struct drm_display_mode *mode)
> > > +{
> > > +	return mode->clock > DRM_HDMI_14_MAX_TMDS_CLK_KHZ;
> > > +}
> > 
> > That's only correct for 8bpc. The actual limit is on the TMDS clock (or
> > rather TMDS character rate as HDMI 2.0 calls it due to the 1/1 vs. 1/4
> > magic for the actually transmitted TMDS clock).
> 
> Yeah we might need to add the bus format for the cable here too, to make
> this complete.

I don't think we have a usable thing for that on the drm level, so
would need to invent something. Oh, and the mode->clock vs. 
mode->crtc_clock funny business also limits the usability of this
approach. So probably just easiest to pass in the the driver calculated
TMDS clock instead.

-- 
Ville Syrjälä
Intel
