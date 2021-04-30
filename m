Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B9636F56F
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 07:43:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80A446E459;
	Fri, 30 Apr 2021 05:43:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1D556E459;
 Fri, 30 Apr 2021 05:43:34 +0000 (UTC)
IronPort-SDR: 2nFeVqEK96TAlgJSH/gk68w7ub9rjbE/PyAFmces7wuOnfGaSdD/eaxXxuYpWh6Oq/8hi9XCD0
 eOt75KgFpZ0g==
X-IronPort-AV: E=McAfee;i="6200,9189,9969"; a="282545751"
X-IronPort-AV: E=Sophos;i="5.82,260,1613462400"; d="scan'208";a="282545751"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 22:43:34 -0700
IronPort-SDR: qpSmQaTHSDXQvP3DxAlY9d7jqaegJMVPQzpcGsiakKy/aFeGzVCc3yRbNz/OX1UWB686yzD7Cm
 RToFEG4KknmA==
X-IronPort-AV: E=Sophos;i="5.82,260,1613462400"; d="scan'208";a="431257059"
Received: from angiepch-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.252.52.49])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 22:43:30 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Nikola Cornij <nikola.cornij@amd.com>, amd-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH v8 1/1] drm/drm_mst: Use Extended Base
 Receiver Capability DPCD space
In-Reply-To: <20210428234346.1085977-2-nikola.cornij@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210428234346.1085977-1-nikola.cornij@amd.com>
 <20210428234346.1085977-2-nikola.cornij@amd.com>
Date: Fri, 30 Apr 2021 08:43:27 +0300
Message-ID: <875z042ups.fsf@intel.com>
MIME-Version: 1.0
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Nikola Cornij <nikola.cornij@amd.com>, koba.ko@canonical.com,
 aurabindo.pillai@amd.com, mikita.lipski@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 28 Apr 2021, Nikola Cornij <nikola.cornij@amd.com> wrote:
> [why]
> DP 1.4a spec madates that if DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT is
> set, Extended Base Receiver Capability DPCD space must be used. Without
> doing that, the three DPCD values that differ will be wrong, leading to
> incorrect or limited functionality. MST link rate, for example, could
> have a lower value. Also, Synaptics quirk wouldn't work out well when
> Extended DPCD was not read, resulting in no DSC for such hubs.
>
> [how]
> Modify MST topology manager to use the values from Extended DPCD where
> applicable.
>
> To prevent regression on the sources that have a lower maximum link rate
> capability than MAX_LINK_RATE from Extended DPCD, have the drivers
> supply maximum lane count and rate at initialization time.
>
> This also reverts 'commit 2dcab875e763 ("Revert drm/dp_mst: Retrieve
> extended DPCD caps for topology manager")', brining the change back to
> the original 'commit ad44c03208e4 ("drm/dp_mst: Retrieve extended DPCD
> caps for topology manager")'.
>
> Signed-off-by: Nikola Cornij <nikola.cornij@amd.com>
> ---
>  .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  5 +++
>  .../gpu/drm/amd/display/dc/core/dc_link_dp.c  | 18 ++++++++++
>  drivers/gpu/drm/amd/display/dc/dc_link.h      |  2 ++
>  drivers/gpu/drm/drm_dp_mst_topology.c         | 33 ++++++++++++-------
>  drivers/gpu/drm/i915/display/intel_dp_mst.c   |  6 +++-
>  drivers/gpu/drm/nouveau/dispnv50/disp.c       |  3 +-
>  drivers/gpu/drm/radeon/radeon_dp_mst.c        |  7 ++++
>  include/drm/drm_dp_mst_helper.h               | 12 ++++++-
>  8 files changed, 71 insertions(+), 15 deletions(-)


> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index 860381d68d9d..a4245eb48ef4 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -942,6 +942,7 @@ intel_dp_mst_encoder_init(struct intel_digital_port *dig_port, int conn_base_id)
>  	struct intel_dp *intel_dp = &dig_port->dp;
>  	enum port port = dig_port->base.port;
>  	int ret;
> +	int bios_max_link_rate;
>  
>  	if (!HAS_DP_MST(i915) || intel_dp_is_edp(intel_dp))
>  		return 0;
> @@ -956,8 +957,11 @@ intel_dp_mst_encoder_init(struct intel_digital_port *dig_port, int conn_base_id)
>  
>  	/* create encoders */
>  	intel_dp_create_fake_mst_encoders(dig_port);
> +	bios_max_link_rate = intel_bios_dp_max_link_rate(&dig_port->base);

Wait, what? This can return 0, and usually does. This is an optional
limitation, and is generally only used if there's a need to have a
smaller max link rate than the max the platform supports. We call this
in one single place, and are not looking to add another call site.

I haven't had my doze of coffee this morning, but at a glance, I think
this will break MST for most i915 users.

See intel_dp->source_rates[] and intel_dp->num_source_rates for all the
rates the source supports, initialized at encoder
init. intel_dp->source_rates[intel_dp->num_source_rates - 1] would be
the max.

Also, I suggest using kHz for rates throughout, and specifically not the
DPCD "units". Otherwise, this is just another thing that needs fixing
with the DP 2.0 UHBR rates where the bandwidth codes don't follow the
same pattern.

Ten versions of the patch, with a benign looking subject, and none of
the i915 maintainers in Cc. Not cool.


BR,
Jani.


>  	ret = drm_dp_mst_topology_mgr_init(&intel_dp->mst_mgr, &i915->drm,
> -					   &intel_dp->aux, 16, 3, conn_base_id);
> +					   &intel_dp->aux, 16, 3,
> +					   dig_port->max_lanes,
> +					   bios_max_link_rate / 27000, conn_base_id);
>  	if (ret)
>  		return ret;
>  

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
