Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BE51B1F4E
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 08:57:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2710A6E8CF;
	Tue, 21 Apr 2020 06:57:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A524D6E8CE;
 Tue, 21 Apr 2020 06:57:12 +0000 (UTC)
IronPort-SDR: uj54/h/eKH0h8mKFA/qfPgu6MyagiMy5gf3qPn9dMQC+kNSIq7eHpEmkO+GqKXuyLMLniwsAKI
 gevPAeHywzyA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2020 23:57:11 -0700
IronPort-SDR: CimnVkiEDSPB3JpqR7gqXnh+V2PJGoRs5Xn0PLDT42izpouH3TYU4EvRCqBkn2HNEP38MtIn31
 Qr7HqnxvhofA==
X-IronPort-AV: E=Sophos;i="5.72,409,1580803200"; d="scan'208";a="455987942"
Received: from parkernx-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.46.80])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2020 23:57:07 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 daniel@ffwll.ch, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>, Imre Deak <imre.deak@intel.com>,
 =?utf-8?Q?Jos=C3=A9?= Roberto de Souza <jose.souza@intel.com>, Lucas De
 Marchi <lucas.demarchi@intel.com>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Pankaj Bharadiya
 <pankaj.laxminarayan.bharadiya@intel.com>
Subject: Re: [PATCH 12/18] drm/i915/display/tc: Prefer drm_WARN_ON over WARN_ON
In-Reply-To: <20200406112800.23762-13-pankaj.laxminarayan.bharadiya@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200406112800.23762-1-pankaj.laxminarayan.bharadiya@intel.com>
 <20200406112800.23762-13-pankaj.laxminarayan.bharadiya@intel.com>
Date: Tue, 21 Apr 2020 09:57:03 +0300
Message-ID: <87zhb5z5q8.fsf@intel.com>
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

On Mon, 06 Apr 2020, Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com> wrote:
> struct drm_device specific drm_WARN* macros include device information
> in the backtrace, so we know what device the warnings originate from.
>
> Prefer drm_WARN_ON over WARN_ON.
>
> Conversion is done with below sementic patch:
>
> @@
> identifier func, T;
> @@
> func(struct intel_digital_port *T,...) {
> <+...
> -WARN_ON(
> +drm_WARN_ON(T->base.base.dev,
> ...)
> ...+>
>
> }
>
> Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_tc.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_tc.c b/drivers/gpu/drm/i915/display/intel_tc.c
> index 9b850c11aa78..7d4172498320 100644
> --- a/drivers/gpu/drm/i915/display/intel_tc.c
> +++ b/drivers/gpu/drm/i915/display/intel_tc.c
> @@ -295,12 +295,12 @@ static void icl_tc_phy_connect(struct intel_digital_port *dig_port,
>  	}
>  
>  	if (!icl_tc_phy_set_safe_mode(dig_port, false) &&
> -	    !WARN_ON(dig_port->tc_legacy_port))
> +	    !drm_WARN_ON(dig_port->base.base.dev, dig_port->tc_legacy_port))
>  		goto out_set_tbt_alt_mode;
>  
>  	max_lanes = intel_tc_port_fia_max_lane_count(dig_port);
>  	if (dig_port->tc_legacy_port) {
> -		WARN_ON(max_lanes != 4);
> +		drm_WARN_ON(dig_port->base.base.dev, max_lanes != 4);

The patch needs a rebase, and please use i915 local variable.

BR,
Jani.

>  		dig_port->tc_mode = TC_PORT_LEGACY;
>  
>  		return;
> @@ -381,14 +381,16 @@ intel_tc_port_get_current_mode(struct intel_digital_port *dig_port)
>  	bool in_safe_mode = icl_tc_phy_is_in_safe_mode(dig_port);
>  	enum tc_port_mode mode;
>  
> -	if (in_safe_mode || WARN_ON(!icl_tc_phy_status_complete(dig_port)))
> +	if (in_safe_mode || drm_WARN_ON(dig_port->base.base.dev,
> +					!icl_tc_phy_status_complete(dig_port)))
>  		return TC_PORT_TBT_ALT;
>  
>  	mode = dig_port->tc_legacy_port ? TC_PORT_LEGACY : TC_PORT_DP_ALT;
>  	if (live_status_mask) {
>  		enum tc_port_mode live_mode = fls(live_status_mask) - 1;
>  
> -		if (!WARN_ON(live_mode == TC_PORT_TBT_ALT))
> +		if (!drm_WARN_ON(dig_port->base.base.dev,
> +				 live_mode == TC_PORT_TBT_ALT))
>  			mode = live_mode;
>  	}
>  
> @@ -432,7 +434,7 @@ static void
>  intel_tc_port_link_init_refcount(struct intel_digital_port *dig_port,
>  				 int refcount)
>  {
> -	WARN_ON(dig_port->tc_link_refcount);
> +	drm_WARN_ON(dig_port->base.base.dev, dig_port->tc_link_refcount);
>  	dig_port->tc_link_refcount = refcount;
>  }

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
