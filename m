Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C9A9D1073
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 13:14:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 511FA10E4AF;
	Mon, 18 Nov 2024 12:14:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nOjwO4fv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE68710E26D;
 Mon, 18 Nov 2024 12:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731932066; x=1763468066;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=y/Sv1lz2b7YtjmMZvb+sn9upeTLmQWttzwJeW0OMaCk=;
 b=nOjwO4fvoPX8qrl2vCWc73ehObfhLaCZl9zZk/XdNVqVuofky/zUBOxF
 Qr7mfz9VdcBqqwdAoOnfoAn5Hk87UYNjKOCLKnGvjGFCuNBrUCx/Rc03W
 Qk1GlcUT5D+eqWW08yfzDNLS1A2tuN9qNU/5DunUqBWdkbQaA3F+5sCS9
 ci4kgke9/dKzV1eBWbWKHrywn7fAQi8dWeHuNV1mmuXJFV+ACd8UCi1N2
 QZFLzDML9+ukqCozLAy2Q7KJxwEr8/dhATobsS1XchP/3Lb3A9rAkh1db
 +QVZPC+Tn4Yjo63MSzA7eQbmQ0I3OleaEF/h9dLuUSwoVngnU9wK1muob A==;
X-CSE-ConnectionGUID: 3N9z4wOnQ0WO600p8mHkCg==
X-CSE-MsgGUID: uUHZXckzRLysXuVV1+kT7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="49422866"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="49422866"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 04:14:24 -0800
X-CSE-ConnectionGUID: HQBSyaKLR5S1UXIUNZjSPw==
X-CSE-MsgGUID: KtiZ4jFyQsaLrSHscqznrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="94263698"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 04:14:24 -0800
Date: Mon, 18 Nov 2024 14:14:59 +0200
From: Imre Deak <imre.deak@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 3/4] drm/i915/dp_mst: Expose a connector to kernel users
 after it's properly initialized
Message-ID: <Zzsvw4Dc7kgyR8xs@ideak-desk.fi.intel.com>
References: <20241115164159.1081675-1-imre.deak@intel.com>
 <20241115164159.1081675-3-imre.deak@intel.com>
 <878qtg4u75.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878qtg4u75.fsf@intel.com>
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

On Mon, Nov 18, 2024 at 02:12:14PM +0200, Jani Nikula wrote:
> On Fri, 15 Nov 2024, Imre Deak <imre.deak@intel.com> wrote:
> > After a connector is added to the drm_mode_config::connector_list, it's
> > visible to any in-kernel users looking up connectors via the above list.
> > Make sure that the connector is properly initialized before such
> > look-ups.
> >
> > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_dp_mst.c | 29 ++++++++-------------
> >  1 file changed, 11 insertions(+), 18 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > index f058360a26413..d91a1d1fb26f4 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > @@ -1719,6 +1719,8 @@ static struct drm_connector *intel_dp_add_mst_connector(struct drm_dp_mst_topolo
> >  	if (!intel_connector)
> >  		return NULL;
> >  
> > +	connector = &intel_connector->base;
> 
> I'd rather see a patch s/intel_connector/connector/ and using
> &connector->base for drm_connector.

Yes, thought the same and did it. However I think that should be done
converting all the other intel_connector usage in the file. Is that ok
with you?

> 
> > +
> >  	intel_connector->get_hw_state = intel_dp_mst_get_hw_state;
> >  	intel_connector->sync_state = intel_dp_connector_sync_state;
> >  	intel_connector->mst_port = intel_dp;
> > @@ -1727,30 +1729,19 @@ static struct drm_connector *intel_dp_add_mst_connector(struct drm_dp_mst_topolo
> >  
> >  	intel_dp_init_modeset_retry_work(intel_connector);
> >  
> > -	/*
> > -	 * TODO: The following drm_connector specific initialization belongs
> > -	 * to DRM core, however it happens atm too late in
> > -	 * drm_connector_init(). That function will also expose the connector
> > -	 * to in-kernel users, so it can't be called until the connector is
> > -	 * sufficiently initialized; init the device pointer used by the
> > -	 * following DSC setup, until a fix moving this to DRM core.
> > -	 */
> > -	intel_connector->base.dev = mgr->dev;
> > -
> > -	intel_connector->dp.dsc_decompression_aux = drm_dp_mst_dsc_aux_for_port(port);
> > -	intel_dp_mst_read_decompression_port_dsc_caps(intel_dp, intel_connector);
> > -	intel_connector->dp.dsc_hblank_expansion_quirk =
> > -		detect_dsc_hblank_expansion_quirk(intel_connector);
> > -
> > -	connector = &intel_connector->base;
> > -	ret = drm_connector_init(display->drm, connector, &intel_dp_mst_connector_funcs,
> > -				 DRM_MODE_CONNECTOR_DisplayPort);
> > +	ret = drm_connector_init_core(display->drm, connector, &intel_dp_mst_connector_funcs,
> > +				      DRM_MODE_CONNECTOR_DisplayPort);
> >  	if (ret) {
> >  		drm_dp_mst_put_port_malloc(port);
> >  		intel_connector_free(intel_connector);
> >  		return NULL;
> >  	}
> >  
> > +	intel_connector->dp.dsc_decompression_aux = drm_dp_mst_dsc_aux_for_port(port);
> > +	intel_dp_mst_read_decompression_port_dsc_caps(intel_dp, intel_connector);
> > +	intel_connector->dp.dsc_hblank_expansion_quirk =
> > +		detect_dsc_hblank_expansion_quirk(intel_connector);
> > +
> >  	drm_connector_helper_add(connector, &intel_dp_mst_connector_helper_funcs);
> >  
> >  	for_each_pipe(display, pipe) {
> > @@ -1771,6 +1762,8 @@ static struct drm_connector *intel_dp_add_mst_connector(struct drm_dp_mst_topolo
> >  		drm_dbg_kms(display->drm, "[%s:%d] HDCP MST init failed, skipping.\n",
> >  			    connector->name, connector->base.id);
> >  
> > +	drm_connector_add(connector);
> > +
> >  	return connector;
> >  
> >  err:
> 
> -- 
> Jani Nikula, Intel
