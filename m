Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F15F12527C7
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 08:51:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12D3F6EA1E;
	Wed, 26 Aug 2020 06:51:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D0986EA1E;
 Wed, 26 Aug 2020 06:51:27 +0000 (UTC)
IronPort-SDR: dQiwOQn6Nuz5acPb/V0Zu6n/MH+JSfwHS6qbs2gDSuMpGZNhdv8TRbDN89nN+T5RruzMoJ7s7c
 oguKhdKkVQ8w==
X-IronPort-AV: E=McAfee;i="6000,8403,9724"; a="220505414"
X-IronPort-AV: E=Sophos;i="5.76,354,1592895600"; d="scan'208";a="220505414"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2020 23:51:26 -0700
IronPort-SDR: 18Kq/bo3KG+2JklofckLvITM98eBKy6PzKdqzNhgUaZo6F7C1RgDNcRA+WafVqssMiI4sPbMmj
 JzDOdx2sfeiQ==
X-IronPort-AV: E=Sophos;i="5.76,354,1592895600"; d="scan'208";a="474658678"
Received: from jguenthe-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.32.223])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2020 23:51:19 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org
Subject: Re: [RFC v4 09/20] drm/i915/dp: Extract drm_dp_has_mst()
In-Reply-To: <20200825195027.74681-10-lyude@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200825195027.74681-1-lyude@redhat.com>
 <20200825195027.74681-10-lyude@redhat.com>
Date: Wed, 26 Aug 2020 09:51:16 +0300
Message-ID: <87r1rt6gt7.fsf@intel.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Manasi Navare <manasi.d.navare@intel.com>, Uma Shankar <uma.shankar@intel.com>,
 =?utf-8?Q?Jos?= =?utf-8?Q?=C3=A9?= Roberto de Souza <jose.souza@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 25 Aug 2020, Lyude Paul <lyude@redhat.com> wrote:
> Just a tiny drive-by cleanup, we can consolidate i915's code for
> checking for MST support into a helper to be shared across drivers.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Reviewed-by: Sean Paul <sean@poorly.run>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 18 ++----------------
>  include/drm/drm_dp_mst_helper.h         | 22 ++++++++++++++++++++++
>  2 files changed, 24 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 79c27f91f42c0..1e29d3a012856 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -4699,20 +4699,6 @@ intel_dp_get_dpcd(struct intel_dp *intel_dp)
>  	return true;
>  }
>  
> -static bool
> -intel_dp_sink_can_mst(struct intel_dp *intel_dp)
> -{
> -	u8 mstm_cap;
> -
> -	if (intel_dp->dpcd[DP_DPCD_REV] < 0x12)
> -		return false;
> -
> -	if (drm_dp_dpcd_readb(&intel_dp->aux, DP_MSTM_CAP, &mstm_cap) != 1)
> -		return false;
> -
> -	return mstm_cap & DP_MST_CAP;
> -}
> -
>  static bool
>  intel_dp_can_mst(struct intel_dp *intel_dp)
>  {
> @@ -4720,7 +4706,7 @@ intel_dp_can_mst(struct intel_dp *intel_dp)
>  
>  	return i915->params.enable_dp_mst &&
>  		intel_dp->can_mst &&
> -		intel_dp_sink_can_mst(intel_dp);
> +		drm_dp_has_mst(&intel_dp->aux, intel_dp->dpcd);
>  }
>  
>  static void
> @@ -4729,7 +4715,7 @@ intel_dp_configure_mst(struct intel_dp *intel_dp)
>  	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
>  	struct intel_encoder *encoder =
>  		&dp_to_dig_port(intel_dp)->base;
> -	bool sink_can_mst = intel_dp_sink_can_mst(intel_dp);
> +	bool sink_can_mst = drm_dp_has_mst(&intel_dp->aux, intel_dp->dpcd);
>  
>  	drm_dbg_kms(&i915->drm,
>  		    "[ENCODER:%d:%s] MST support: port: %s, sink: %s, modparam: %s\n",
> diff --git a/include/drm/drm_dp_mst_helper.h b/include/drm/drm_dp_mst_helper.h
> index 8b9eb4db3381c..2d8983a713e8c 100644
> --- a/include/drm/drm_dp_mst_helper.h
> +++ b/include/drm/drm_dp_mst_helper.h
> @@ -911,4 +911,26 @@ __drm_dp_mst_state_iter_get(struct drm_atomic_state *state,
>  	for ((__i) = 0; (__i) < (__state)->num_private_objs; (__i)++) \
>  		for_each_if(__drm_dp_mst_state_iter_get((__state), &(mgr), NULL, &(new_state), (__i)))
>  
> +/**
> + * drm_dp_has_mst() - check whether or not a sink supports MST
> + * @aux: The DP AUX channel to use
> + * @dpcd: A cached copy of the DPCD capabilities for this sink
> + *
> + * Returns: %True if the sink supports MST, %false otherwise
> + */
> +static inline bool

I've become more and more critical of accumulating a lot of inlines in
headers. Do we really want this in the header?

> +drm_dp_has_mst(struct drm_dp_aux *aux,
> +	       const u8 dpcd[DP_RECEIVER_CAP_SIZE])
> +{
> +	u8 mstm_cap;
> +
> +	if (dpcd[DP_DPCD_REV] < DP_DPCD_REV_12)
> +		return false;
> +
> +	if (drm_dp_dpcd_readb(aux, DP_MSTM_CAP, &mstm_cap) != 1)
> +		return false;
> +
> +	return !!(mstm_cap & DP_MST_CAP);

The !! is superfluous.

BR,
Jani.

> +}
> +
>  #endif

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
