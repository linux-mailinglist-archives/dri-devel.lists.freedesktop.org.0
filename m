Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9E29CF60E
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 21:30:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8668310E8B5;
	Fri, 15 Nov 2024 20:29:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GaWrZ8zT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1390A10E3E1;
 Fri, 15 Nov 2024 20:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731702594; x=1763238594;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=XSUv9m5qVvNMSRmKF5P6IsrVhp+zWJUrO/gtkor3KpE=;
 b=GaWrZ8zTP0musaNmgKLXn9g7rqsdIffoG905cVEYcx34YnJjMVa3U5QK
 U41bd+y5WZIsBdQvLCVEE6wAgr5L2dW3lVlDbj5PqdYRQf0uQgtusSOZy
 LVMXbtvbbOjBi+xaTyDG/h0urCzUAomckkJ2pMuHweP2/tIjq7uaUzNzp
 ioSvN6zrE/Gt0YCiEoTon+zvEscelqZh3RYLBIU7V0/Vx1zidE9Q0hVk7
 dNDrtuV7rQ3aNNZNDTZvO6TrLTgDhCcc6pvNcs0XzQIk3w32nFQXXgJr8
 lm8wcmncSk49eD8q4t60VvGUZLNRZsFOsm1/ANeqyMdlbldY5Ov/QmHSp g==;
X-CSE-ConnectionGUID: /nMYzdlzRpGITXfwrM9xNQ==
X-CSE-MsgGUID: hgC2c8+WQqGcRpVoWISruQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11257"; a="54229273"
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="54229273"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 12:29:47 -0800
X-CSE-ConnectionGUID: Kqshr5sLRRaTnHCWvk8xdA==
X-CSE-MsgGUID: 88m3Nl0GSvWRKV1TCIVpbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="93752174"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 12:29:46 -0800
Date: Fri, 15 Nov 2024 22:30:12 +0200
From: Imre Deak <imre.deak@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 1/4] drm/i915/dp_mst: Fix connector initialization in
 intel_dp_add_mst_connector()
Message-ID: <ZzevVE-MM4iFz1T_@ideak-desk.fi.intel.com>
References: <20241115164159.1081675-1-imre.deak@intel.com>
 <ZzetKr-rApPqmehO@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZzetKr-rApPqmehO@intel.com>
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

On Fri, Nov 15, 2024 at 03:20:58PM -0500, Rodrigo Vivi wrote:
> On Fri, Nov 15, 2024 at 06:41:56PM +0200, Imre Deak wrote:
> > The connector initialization in intel_dp_add_mst_connector() depends on
> > the device pointer in connector to be valid, at least by connector
> > debug printing. The device pointer is initialized by drm_connector_init(),
> > however that function also exposes the connector to in-kernel users,
> > which can't be done before the connector is fully initialized. For now
> > make sure the device pointer is valid before it's used, until a
> > follow-up change moving this to DRM core.
> > 
> > This issue was revealed by the commit in the Fixes: line below, before
> > which the above debug printing checked and handled a NULL device pointer
> > gracefully in DRM core.
> > 
> > Cc: Jani Nikula <jani.nikula@intel.com>
> > Fixes: 529798bd786a ("drm/i915/mst: convert to struct intel_display")
> 
> This is awkward. This patch actually removes callers of base.dev.
> I don't see how that it could be causing this new null dereference.

It adds

struct intel_display *display = to_intel_display(connector);

which will be NULL since connector->base.dev is NULL and later display
is dereferenced.

> > Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12799
> 
> But well, trusting more the tests then my eyes, let's move forward.
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_dp_mst.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > index df7edcfe885b6..f058360a26413 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > @@ -1727,6 +1727,16 @@ static struct drm_connector *intel_dp_add_mst_connector(struct drm_dp_mst_topolo
> >  
> >  	intel_dp_init_modeset_retry_work(intel_connector);
> >  
> > +	/*
> > +	 * TODO: The following drm_connector specific initialization belongs
> > +	 * to DRM core, however it happens atm too late in
> > +	 * drm_connector_init(). That function will also expose the connector
> > +	 * to in-kernel users, so it can't be called until the connector is
> > +	 * sufficiently initialized; init the device pointer used by the
> > +	 * following DSC setup, until a fix moving this to DRM core.
> > +	 */
> > +	intel_connector->base.dev = mgr->dev;
> > +
> >  	intel_connector->dp.dsc_decompression_aux = drm_dp_mst_dsc_aux_for_port(port);
> >  	intel_dp_mst_read_decompression_port_dsc_caps(intel_dp, intel_connector);
> >  	intel_connector->dp.dsc_hblank_expansion_quirk =
> > -- 
> > 2.44.2
> > 
