Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A223E9EE3D9
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 11:13:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4016F10ED39;
	Thu, 12 Dec 2024 10:13:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OhHM7ZMp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1A7710E1AC;
 Thu, 12 Dec 2024 10:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733998422; x=1765534422;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Sf7OcXolOlpPRzw64FFl5dReMkLEPLQx5QJCwq7cfxo=;
 b=OhHM7ZMpSNZ3+IXw4mJconnlzEQJVKdLgsO78E+LjGFKlqpvj1bhNG2i
 GYqwhW8jskxAePYs9J2rHptG+iBW70xH7JmDmy4OQ7IuxAcdt+tWO3oJ5
 mFM5XEu905wnhcMD69kvo6GK0UxGugdhoAdlgtDFLgI5mgIxTpwJI8AKV
 k9Uq80O4AiaPXaMK53PP9YRM2O7WcJ3PtWQrYIvwhoLfrNwTkNizS2CU2
 +xd4D83TkU+AjebrNV/XSbEBSXUWO/xrdoqKEhpFRpQqaeljngb00pPaI
 QX9EG6JxNEvsL0NfvYFHJ8qL+jmMyvwMry5bHsc50QH9AcEBpH0ScZLJS Q==;
X-CSE-ConnectionGUID: 1gIYeIhtT1uMldzlF3cKnQ==
X-CSE-MsgGUID: ZHKPWzLfSlWPJ1ep4C5D8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34537173"
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; d="scan'208";a="34537173"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 02:13:41 -0800
X-CSE-ConnectionGUID: eP5zBDrFQ6yGqt+K1fUq8A==
X-CSE-MsgGUID: ppbLywxfS8KdEMD0Ws3BjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="96025604"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.101])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 02:13:39 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Lyude Paul <lyude@redhat.com>, Rodrigo
 Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v3 05/11] drm/i915/dp_mst: Expose a connector to kernel
 users after it's properly initialized
In-Reply-To: <20241211230328.4012496-6-imre.deak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241211230328.4012496-1-imre.deak@intel.com>
 <20241211230328.4012496-6-imre.deak@intel.com>
Date: Thu, 12 Dec 2024 12:13:35 +0200
Message-ID: <878qslxl80.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, 12 Dec 2024, Imre Deak <imre.deak@intel.com> wrote:
> After a connector is added to the drm_mode_config::connector_list, it's
> visible to any in-kernel users looking up connectors via the above list.
> Make sure that the connector is properly initialized before such
> look-ups, by initializing the connector with
> drm_connector_dynamic_register() - which doesn't add the connector to
> the list - and registering it with drm_connector_dynamic_register() -
> which adds the connector to the list - after the initialization is
> complete.
>
> v2: Rebase on the change which moves adding the connector to the
>     connector list only later when calling
>     drm_connector_dynamic_register().
>
> Cc: Lyude Paul <lyude@redhat.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> (v1)
> Signed-off-by: Imre Deak <imre.deak@intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_dp_mst.c | 27 +++++++--------------
>  1 file changed, 9 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index 123c4ece62688..debe4d0eee11f 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -1731,6 +1731,8 @@ mst_topology_add_connector(struct drm_dp_mst_topology_mgr *mgr,
>  	if (!intel_connector)
>  		return NULL;
>  
> +	connector = &intel_connector->base;
> +
>  	intel_connector->get_hw_state = mst_connector_get_hw_state;
>  	intel_connector->sync_state = intel_dp_connector_sync_state;
>  	intel_connector->mst_port = intel_dp;
> @@ -1739,30 +1741,19 @@ mst_topology_add_connector(struct drm_dp_mst_topology_mgr *mgr,
>  
>  	intel_dp_init_modeset_retry_work(intel_connector);
>  
> -	/*
> -	 * TODO: The following drm_connector specific initialization belongs
> -	 * to DRM core, however it happens atm too late in
> -	 * drm_connector_init(). That function will also expose the connector
> -	 * to in-kernel users, so it can't be called until the connector is
> -	 * sufficiently initialized; init the device pointer used by the
> -	 * following DSC setup, until a fix moving this to DRM core.
> -	 */
> -	intel_connector->base.dev = mgr->dev;
> -
> -	intel_connector->dp.dsc_decompression_aux = drm_dp_mst_dsc_aux_for_port(port);
> -	intel_dp_mst_read_decompression_port_dsc_caps(intel_dp, intel_connector);
> -	intel_connector->dp.dsc_hblank_expansion_quirk =
> -		detect_dsc_hblank_expansion_quirk(intel_connector);
> -
> -	connector = &intel_connector->base;
> -	ret = drm_connector_init(display->drm, connector, &mst_connector_funcs,
> -				 DRM_MODE_CONNECTOR_DisplayPort);
> +	ret = drm_connector_dynamic_init(display->drm, connector, &mst_connector_funcs,
> +					 DRM_MODE_CONNECTOR_DisplayPort, NULL);
>  	if (ret) {
>  		drm_dp_mst_put_port_malloc(port);
>  		intel_connector_free(intel_connector);
>  		return NULL;
>  	}
>  
> +	intel_connector->dp.dsc_decompression_aux = drm_dp_mst_dsc_aux_for_port(port);
> +	intel_dp_mst_read_decompression_port_dsc_caps(intel_dp, intel_connector);
> +	intel_connector->dp.dsc_hblank_expansion_quirk =
> +		detect_dsc_hblank_expansion_quirk(intel_connector);
> +
>  	drm_connector_helper_add(connector, &mst_connector_helper_funcs);
>  
>  	for_each_pipe(display, pipe) {

-- 
Jani Nikula, Intel
