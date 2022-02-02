Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A2F4A71A0
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 14:34:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A52CE10E448;
	Wed,  2 Feb 2022 13:34:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFFF410E330;
 Wed,  2 Feb 2022 13:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643808864; x=1675344864;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=81ViL3WaNpRJLrpADZi64VIW+HV40UqQmumX/ZmomE4=;
 b=KVctN4cDuYkXrRInyraJnt2ua8FGC0QLrSxSO1SxDqARhdK+EVFnHKv6
 iOa2zZWmT5vDMz7QZ+XvPFXwm/rZYQJ2vXurEUjrQMsCjvffm9Y5mW4/X
 MxU32TyRthyX8YPauRC/WlkKdAPS9kNFtyZ6J/rN5tnUrWEjZm0vzKMij
 s/STvzq18lXVr4eWbLY31U43bj449U+fhCOoxKIfT+8pHunCg7t4HKXtI
 AnPzyhS+afOHXXjmoQMWSCbfLWFiRmUeEp3fFTsHM1YPXItOvmQO+cPSr
 lqnzZJib5Pnp6GzvsgEnDQrqd3mqbFcFdgtg/WoDr/TZhi58gS/giysY/ A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10245"; a="246744494"
X-IronPort-AV: E=Sophos;i="5.88,336,1635231600"; d="scan'208";a="246744494"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2022 05:34:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,336,1635231600"; d="scan'208";a="497743846"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by orsmga002.jf.intel.com with SMTP; 02 Feb 2022 05:34:20 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 02 Feb 2022 15:34:19 +0200
Date: Wed, 2 Feb 2022 15:34:19 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 5/6] drm/rcar_du: changes to rcar-du driver resulting
 from drm_writeback_connector structure changes
Message-ID: <YfqIW3UC4i17fZU/@intel.com>
References: <20220202085429.22261-1-suraj.kandpal@intel.com>
 <20220202085429.22261-6-suraj.kandpal@intel.com>
 <Yfp8Q6OFqTAvESOi@pendragon.ideasonboard.com>
 <87y22ts948.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87y22ts948.fsf@intel.com>
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
Cc: Kandpal Suraj <suraj.kandpal@intel.com>, carsten.haitzler@arm.com,
 intel-gfx@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dmitry.baryshkov@linaro.org, arun.r.murthy@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 02, 2022 at 03:15:03PM +0200, Jani Nikula wrote:
> On Wed, 02 Feb 2022, Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
> > Hi Kandpal,
> >
> > Thank you for the patch.
> >
> > On Wed, Feb 02, 2022 at 02:24:28PM +0530, Kandpal Suraj wrote:
> >> Changing rcar_du driver to accomadate the change of
> >> drm_writeback_connector.base and drm_writeback_connector.encoder
> >> to a pointer the reason for which is explained in the
> >> Patch(drm: add writeback pointers to drm_connector).
> >> 
> >> Signed-off-by: Kandpal Suraj <suraj.kandpal@intel.com>
> >> ---
> >>  drivers/gpu/drm/rcar-du/rcar_du_crtc.h      | 2 ++
> >>  drivers/gpu/drm/rcar-du/rcar_du_writeback.c | 8 +++++---
> >>  2 files changed, 7 insertions(+), 3 deletions(-)
> >> 
> >> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
> >> index 66e8839db708..68f387a04502 100644
> >> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
> >> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
> >> @@ -72,6 +72,8 @@ struct rcar_du_crtc {
> >>  	const char *const *sources;
> >>  	unsigned int sources_count;
> >>  
> >> +	struct drm_connector connector;
> >> +	struct drm_encoder encoder;
> >
> > Those fields are, at best, poorly named. Furthermore, there's no need in
> > this driver or in other drivers using drm_writeback_connector to create
> > an encoder or connector manually. Let's not polute all drivers because
> > i915 doesn't have its abstractions right.
> 
> i915 uses the quite common model for struct inheritance:
> 
> 	struct intel_connector {
> 		struct drm_connector base;
> 		/* ... */
> 	}
> 
> Same with at least amd, ast, fsl-dcu, hisilicon, mga200, msm, nouveau,
> radeon, tilcdc, and vboxvideo.
> 
> We could argue about the relative merits of that abstraction, but I
> think the bottom line is that it's popular and the drivers using it are
> not going to be persuaded to move away from it.
> 
> It's no coincidence that the drivers who've implemented writeback so far
> (komeda, mali, rcar-du, vc4, and vkms) do not use the abstraction,
> because the drm_writeback_connector midlayer does, forcing the issue.
> 
> So I think drm_writeback_connector should *not* use the inheritance
> abstraction because it's a midlayer that should leave that option to the
> drivers. I think drm_writeback_connector needs to be changed to
> accommodate that, and, unfortunately, it means current writeback users
> need to be changed as well.
> 
> I am not sure, however, if the series at hand is the right
> approach. Perhaps writeback can be modified to allocate the stuff for
> you if you prefer it that way, as long as the drm_connector is not
> embedded in struct drm_writeback_connector.

Maybe it's possible to split out the actual writeback functionality
into a separate lighter struct that then gets embedded into
the current drm_writeback_connector (which would therefore remain
as a midlayer for the drivers that want one). And other drivers
can embed the core writeback struct directly into their own things.

Something like that should perhaps minimize the driver changes for
the current users and we just need to adjust a bunch of things in
drm_writeback.c/etc. to not depend on the midlayer stuff.

-- 
Ville Syrjälä
Intel
