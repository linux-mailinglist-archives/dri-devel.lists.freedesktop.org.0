Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A022F9D1182
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 14:12:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B5A510E4D4;
	Mon, 18 Nov 2024 13:12:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bnE5pPzn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E245510E4D8;
 Mon, 18 Nov 2024 13:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731935535; x=1763471535;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=U8ay/gmGFswbNe/Qi36yt9M/u1Vhio+27RB1n8Mxrr8=;
 b=bnE5pPznE6owQ3a3IAmGj6F3ZLk5Mb0z6l53sZuArFDj8F3NbPfkO+8p
 UXwW+bdM4GvcoLDp3M9cIZvIyT/2QmGaMBsDM/lhzbQoyCkGg4/XRdi2s
 +EDbUKkUifsMmENm6a+TpG7LUwYPTr4EWv+VI3/byWROql+/dCH4YWP5B
 aezutVs9EiV4dfNjdxW0vE5S3TM51HFU0XZdQV66JoTaO4RHE3oRrPZz0
 MRtuYg26cECCTbBXxidcCdRBuL0A5St+It3t3PSnoZ3YuKAZ1p30+AYND
 2j80ECGsrNVbXDnsAb3gdOmkcA1NwNcMkNolxlzuK2Z3a+GC9klggCcgA w==;
X-CSE-ConnectionGUID: Hlua6XVHTMa8lZc+eLmJzg==
X-CSE-MsgGUID: /BHo37gmS82IxiUXvylLBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="43276405"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="43276405"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 05:12:15 -0800
X-CSE-ConnectionGUID: iZMPESiDQmGJ6i2txzBweg==
X-CSE-MsgGUID: MYFGyDYeTI2LmNP6psWpPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="94272327"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 05:12:14 -0800
Date: Mon, 18 Nov 2024 15:12:49 +0200
From: Imre Deak <imre.deak@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 3/4] drm/i915/dp_mst: Expose a connector to kernel users
 after it's properly initialized
Message-ID: <Zzs9UU8sR7BA5zBU@ideak-desk.fi.intel.com>
References: <20241115164159.1081675-1-imre.deak@intel.com>
 <20241115164159.1081675-3-imre.deak@intel.com>
 <878qtg4u75.fsf@intel.com>
 <Zzsvw4Dc7kgyR8xs@ideak-desk.fi.intel.com>
 <875xok4tnv.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875xok4tnv.fsf@intel.com>
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

On Mon, Nov 18, 2024 at 02:23:48PM +0200, Jani Nikula wrote:
> On Mon, 18 Nov 2024, Imre Deak <imre.deak@intel.com> wrote:
> > On Mon, Nov 18, 2024 at 02:12:14PM +0200, Jani Nikula wrote:
> >> On Fri, 15 Nov 2024, Imre Deak <imre.deak@intel.com> wrote:
> >> > After a connector is added to the drm_mode_config::connector_list, it's
> >> > visible to any in-kernel users looking up connectors via the above list.
> >> > Make sure that the connector is properly initialized before such
> >> > look-ups.
> >> >
> >> > Signed-off-by: Imre Deak <imre.deak@intel.com>
> >> > ---
> >> >  drivers/gpu/drm/i915/display/intel_dp_mst.c | 29 ++++++++-------------
> >> >  1 file changed, 11 insertions(+), 18 deletions(-)
> >> >
> >> > diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> >> > index f058360a26413..d91a1d1fb26f4 100644
> >> > --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> >> > +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> >> > @@ -1719,6 +1719,8 @@ static struct drm_connector *intel_dp_add_mst_connector(struct drm_dp_mst_topolo
> >> >  	if (!intel_connector)
> >> >  		return NULL;
> >> >  
> >> > +	connector = &intel_connector->base;
> >> 
> >> I'd rather see a patch s/intel_connector/connector/ and using
> >> &connector->base for drm_connector.
> >
> > Yes, thought the same and did it. However I think that should be done
> > converting all the other intel_connector usage in the file. Is that ok
> > with you?
> 
> Works for me.

Ok, will add that in a separate patch then.

> >> > +
> >> >  	intel_connector->get_hw_state = intel_dp_mst_get_hw_state;
> >> >  	intel_connector->sync_state = intel_dp_connector_sync_state;
> >> >  	intel_connector->mst_port = intel_dp;
> >> > @@ -1727,30 +1729,19 @@ static struct drm_connector *intel_dp_add_mst_connector(struct drm_dp_mst_topolo
> >> >  
> >> >  	intel_dp_init_modeset_retry_work(intel_connector);
> >> >  
> >> > -	/*
> >> > -	 * TODO: The following drm_connector specific initialization belongs
> >> > -	 * to DRM core, however it happens atm too late in
> >> > -	 * drm_connector_init(). That function will also expose the connector
> >> > -	 * to in-kernel users, so it can't be called until the connector is
> >> > -	 * sufficiently initialized; init the device pointer used by the
> >> > -	 * following DSC setup, until a fix moving this to DRM core.
> >> > -	 */
> >> > -	intel_connector->base.dev = mgr->dev;
> >> > -
> >> > -	intel_connector->dp.dsc_decompression_aux = drm_dp_mst_dsc_aux_for_port(port);
> >> > -	intel_dp_mst_read_decompression_port_dsc_caps(intel_dp, intel_connector);
> >> > -	intel_connector->dp.dsc_hblank_expansion_quirk =
> >> > -		detect_dsc_hblank_expansion_quirk(intel_connector);
> >> > -
> >> > -	connector = &intel_connector->base;
> >> > -	ret = drm_connector_init(display->drm, connector, &intel_dp_mst_connector_funcs,
> >> > -				 DRM_MODE_CONNECTOR_DisplayPort);
> >> > +	ret = drm_connector_init_core(display->drm, connector, &intel_dp_mst_connector_funcs,
> >> > +				      DRM_MODE_CONNECTOR_DisplayPort);
> >> >  	if (ret) {
> >> >  		drm_dp_mst_put_port_malloc(port);
> >> >  		intel_connector_free(intel_connector);
> >> >  		return NULL;
> >> >  	}
> >> >  
> >> > +	intel_connector->dp.dsc_decompression_aux = drm_dp_mst_dsc_aux_for_port(port);
> >> > +	intel_dp_mst_read_decompression_port_dsc_caps(intel_dp, intel_connector);
> >> > +	intel_connector->dp.dsc_hblank_expansion_quirk =
> >> > +		detect_dsc_hblank_expansion_quirk(intel_connector);
> >> > +
> >> >  	drm_connector_helper_add(connector, &intel_dp_mst_connector_helper_funcs);
> >> >  
> >> >  	for_each_pipe(display, pipe) {
> >> > @@ -1771,6 +1762,8 @@ static struct drm_connector *intel_dp_add_mst_connector(struct drm_dp_mst_topolo
> >> >  		drm_dbg_kms(display->drm, "[%s:%d] HDCP MST init failed, skipping.\n",
> >> >  			    connector->name, connector->base.id);
> >> >  
> >> > +	drm_connector_add(connector);
> >> > +
> >> >  	return connector;
> >> >  
> >> >  err:
> >> 
> >> -- 
> >> Jani Nikula, Intel
> 
> -- 
> Jani Nikula, Intel
