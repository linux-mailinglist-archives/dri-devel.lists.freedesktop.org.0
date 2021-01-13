Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BFF2F4AA7
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 12:51:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E65006E7D3;
	Wed, 13 Jan 2021 11:51:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68B786E7D3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 11:51:11 +0000 (UTC)
IronPort-SDR: emGl98yw/f315JGTxwMXsIzJ9sf/a/tun1GcObrGYyHD3dWZ9khgqElfO8S09plSeXoKSJ6LTs
 D2416h0Tbe5A==
X-IronPort-AV: E=McAfee;i="6000,8403,9862"; a="157966972"
X-IronPort-AV: E=Sophos;i="5.79,344,1602572400"; d="scan'208";a="157966972"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2021 03:51:08 -0800
IronPort-SDR: an4H7LUXPDvQY7jFMsRInuGlh9jsjcQqBCmuFOF96ctFB5KiLLk18mdCwKxKK5ovL+cMcbHMvW
 d0dv/d77Eu8w==
X-IronPort-AV: E=Sophos;i="5.79,344,1602572400"; d="scan'208";a="353433389"
Received: from iklein-mobl.ger.corp.intel.com (HELO localhost) ([10.249.40.83])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2021 03:51:03 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Koba Ko <koba.ko@canonical.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/dp_mst: Align mst link rate with soure rate
In-Reply-To: <20210113014105.28110-2-koba.ko@canonical.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210113014105.28110-1-koba.ko@canonical.com>
 <20210113014105.28110-2-koba.ko@canonical.com>
Date: Wed, 13 Jan 2021 13:51:00 +0200
Message-ID: <8735z5t5qz.fsf@intel.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 13 Jan 2021, Koba Ko <koba.ko@canonical.com> wrote:
> After read the link rate from MST hub, align with
> maximum source rate.
>
> Signed-off-by: Koba Ko <koba.ko@canonical.com>
> ---
>  drivers/gpu/drm/drm_dp_mst_topology.c   | 8 ++++++++
>  drivers/gpu/drm/i915/display/intel_dp.c | 7 +++++++
>  include/drm/drm_dp_helper.h             | 8 ++++++++
>  include/drm/drm_dp_mst_helper.h         | 4 ++++
>  4 files changed, 27 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
> index 6982ecbf30b5..e7ceae97be85 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -3672,6 +3672,10 @@ int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr *mgr, bool ms
>  {
>  	int ret = 0;
>  	struct drm_dp_mst_branch *mstb = NULL;
> +	unsigned int max_link_rate_tbl[MAX_DRM_DP_MAX_RATE + 1] = {
> +		DP_LINK_BW_1_62, DP_LINK_BW_2_7, DP_LINK_BW_5_4,
> +		DP_LINK_BW_8_1, DP_LINK_RATE_TABLE
> +	};

Please no. Read on for why.

>  
>  	mutex_lock(&mgr->payload_lock);
>  	mutex_lock(&mgr->lock);
> @@ -3693,6 +3697,9 @@ int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr *mgr, bool ms
>  			goto out_unlock;
>  		}
>  
> +		if (mgr->max_source_rate < MAX_DRM_DP_MAX_RATE)
> +			mgr->dpcd[1] = max_link_rate_tbl[mgr->max_source_rate];

Make ->max_source_rate the actual physical rate in kHz, and use
drm_dp_link_rate_to_bw_code() here.

> +
>  		mgr->pbn_div = drm_dp_get_vc_payload_bw(mgr->dpcd[1],
>  							mgr->dpcd[2] & DP_MAX_LANE_COUNT_MASK);
>  		if (mgr->pbn_div == 0) {
> @@ -5422,6 +5429,7 @@ int drm_dp_mst_topology_mgr_init(struct drm_dp_mst_topology_mgr *mgr,
>  	mgr->aux = aux;
>  	mgr->max_dpcd_transaction_bytes = max_dpcd_transaction_bytes;
>  	mgr->max_payloads = max_payloads;
> +	mgr->max_source_rate = MAX_DRM_DP_MAX_RATE;
>  	mgr->conn_base_id = conn_base_id;
>  	if (max_payloads + 1 > sizeof(mgr->payload_mask) * 8 ||
>  	    max_payloads + 1 > sizeof(mgr->vcpi_mask) * 8)
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 469e765a1b7b..a89b4c823123 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -5392,6 +5392,13 @@ intel_dp_configure_mst(struct intel_dp *intel_dp)
>  	intel_dp->is_mst = sink_can_mst &&
>  		i915->params.enable_dp_mst;
>  
> +	if (intel_dp_source_supports_hbr3(intel_dp))
> +		intel_dp->mst_mgr.max_source_rate = DRM_DP_MAX_RATE_HBR3;
> +	else if (intel_dp_source_supports_hbr2(intel_dp))
> +		intel_dp->mst_mgr.max_source_rate = DRM_DP_MAX_RATE_HBR2;
> +	else
> +		intel_dp->mst_mgr.max_source_rate = DRM_DP_MAX_RATE_HBR;

Whenever this file references a "rate", it's the rate in kHz. This is
confusing. Use the rate in kHz.

Also, please look at how intel_dp_source_supports_hbr* are implemented;
we already have all the supported source rates cached in intel_dp.

The max source rate is:

	intel_dp->source_rates[intel_dp->num_source_rates - 1].

No need to do the if ladder here at all. If you like, you can add a
helper:

int intel_dp_max_source_rate(struct intel_dp *intel_dp)
{
        return intel_dp->source_rates[intel_dp->num_source_rates - 1];
}

and reuse that in the supports_hbr* functions:

bool intel_dp_source_supports_hbr2(struct intel_dp *intel_dp)
{
        return intel_dp_max_source_rate(intel_dp) >= 540000;
}

> +
>  	drm_dp_mst_topology_mgr_set_mst(&intel_dp->mst_mgr,
>  					intel_dp->is_mst);
>  }
> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> index 6236f212da61..ef2b328469cd 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -183,6 +183,14 @@ struct drm_device;
>  #define DP_SUPPORTED_LINK_RATES		    0x010 /* eDP 1.4 */
>  # define DP_MAX_SUPPORTED_RATES		     8	    /* 16-bit little-endian */
>  
> +enum drm_dp_max_link_rate {
> +	DRM_DP_MAX_RATE_RBR = 0,
> +	DRM_DP_MAX_RATE_HBR,
> +	DRM_DP_MAX_RATE_HBR2,
> +	DRM_DP_MAX_RATE_HBR3,
> +	MAX_DRM_DP_MAX_RATE
> +};

We already have 1) actual physical rates, in kHz, and 2) the DPCD rate
codes, such as DP_LINK_BW_1_62.

Do *not* add a third representation. Prefer kHz throughout, and convert
to/from the DPCD codes near where they are needed.

> +
>  /* Multiple stream transport */
>  #define DP_FAUX_CAP			    0x020   /* 1.2 */
>  # define DP_FAUX_CAP_1			    (1 << 0)
> diff --git a/include/drm/drm_dp_mst_helper.h b/include/drm/drm_dp_mst_helper.h
> index f5e92fe9151c..e7d8c899fea0 100644
> --- a/include/drm/drm_dp_mst_helper.h
> +++ b/include/drm/drm_dp_mst_helper.h
> @@ -593,6 +593,10 @@ struct drm_dp_mst_topology_mgr {
>  	 * @max_payloads: maximum number of payloads the GPU can generate.
>  	 */
>  	int max_payloads;
> +	/**
> +	 * @max_source_rate: maximum link rate of source.
> +	 */
> +	int max_source_rate;

Again, make this the actual rate in kHz. That's what I'd think it is by
reading the comment above anyway.

>  	/**
>  	 * @conn_base_id: DRM connector ID this mgr is connected to. Only used
>  	 * to build the MST connector path value.

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
