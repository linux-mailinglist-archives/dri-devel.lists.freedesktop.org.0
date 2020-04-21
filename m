Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A01FE1B1F48
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 08:56:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 889CE6E8B5;
	Tue, 21 Apr 2020 06:56:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 989986E8B5;
 Tue, 21 Apr 2020 06:56:16 +0000 (UTC)
IronPort-SDR: datjOjS49JFWLW7f4bc/Av6JuqanVN9W962hQKNM8uMmKaaFAESmezs7I6tc55CjMG7oiGjfmA
 Dg1QPLm+yYkw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2020 23:56:15 -0700
IronPort-SDR: Nev4Z5qPr/VYcEOZvq4YeFa+9+e0AtjGhkEuvh1VxE6eCx83V1Rna7bJ2DpROWWM40fc+l5DYK
 c6Q25N+gaZOw==
X-IronPort-AV: E=Sophos;i="5.72,409,1580803200"; d="scan'208";a="402095723"
Received: from parkernx-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.46.80])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2020 23:56:10 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 daniel@ffwll.ch, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Chris Wilson <chris@chris-wilson.co.uk>,
 Manasi Navare <manasi.d.navare@intel.com>, Imre Deak
 <imre.deak@intel.com>, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: Re: [PATCH 06/18] drm/i915/display/dp: Prefer drm_WARN* over WARN*
In-Reply-To: <20200406112800.23762-7-pankaj.laxminarayan.bharadiya@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200406112800.23762-1-pankaj.laxminarayan.bharadiya@intel.com>
 <20200406112800.23762-7-pankaj.laxminarayan.bharadiya@intel.com>
Date: Tue, 21 Apr 2020 09:56:08 +0300
Message-ID: <87368x1g53.fsf@intel.com>
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
Cc: pankaj.laxminarayan.bharadiya@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 06 Apr 2020, Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com> wrote:
> struct drm_device specific drm_WARN* macros include device information
> in the backtrace, so we know what device the warnings originate from.

The patch no longer applies.

>
> Prefer drm_WARN* over WARN* at places where struct intel_dp struct
> pointer is available.
>
> Conversion is done with below sementic patch:
>
> @@
> identifier func, T;
> @@
> func(struct intel_dp *T,...) {
> + struct drm_i915_private *i915 = dp_to_i915(T);
> <+...
> (
> -WARN_ON(
> +drm_WARN_ON(&i915->drm,
> ...)
> |
> -WARN_ON_ONCE(
> +drm_WARN_ON_ONCE(&i915->drm,
> ...)
> )
> ...+>
>
> }
>
> @@
> identifier func, T;
> @@
> func(...) {
> ...
> struct intel_dp *T = ...;
> + struct drm_i915_private *i915 = dp_to_i915(T);
> <+...
> (
> -WARN_ON(
> +drm_WARN_ON(&i915->drm,
> ...)
> |
> -WARN_ON_ONCE(
> +drm_WARN_ON_ONCE(&i915->drm,
> ...)
> )
> ...+>
>
> }
>
> Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 26 ++++++++++++++++---------
>  1 file changed, 17 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index db6ae8e9af6e..5076a7cfe0e5 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -410,7 +410,10 @@ static int intel_dp_rate_index(const int *rates, int len, int rate)
>  
>  static void intel_dp_set_common_rates(struct intel_dp *intel_dp)
>  {
> -	WARN_ON(!intel_dp->num_source_rates || !intel_dp->num_sink_rates);
> +	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
> +
> +	drm_WARN_ON(&i915->drm,
> +		    !intel_dp->num_source_rates || !intel_dp->num_sink_rates);
>  
>  	intel_dp->num_common_rates = intersect_rates(intel_dp->source_rates,
>  						     intel_dp->num_source_rates,
> @@ -419,7 +422,7 @@ static void intel_dp_set_common_rates(struct intel_dp *intel_dp)
>  						     intel_dp->common_rates);
>  
>  	/* Paranoia, there should always be something in common. */
> -	if (WARN_ON(intel_dp->num_common_rates == 0)) {
> +	if (drm_WARN_ON(&i915->drm, intel_dp->num_common_rates == 0)) {
>  		intel_dp->common_rates[0] = 162000;
>  		intel_dp->num_common_rates = 1;
>  	}
> @@ -1549,6 +1552,7 @@ static ssize_t
>  intel_dp_aux_transfer(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg)
>  {
>  	struct intel_dp *intel_dp = container_of(aux, struct intel_dp, aux);
> +	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
>  	u8 txbuf[20], rxbuf[20];
>  	size_t txsize, rxsize;
>  	int ret;
> @@ -1562,10 +1566,10 @@ intel_dp_aux_transfer(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg)
>  		txsize = msg->size ? HEADER_SIZE + msg->size : BARE_ADDRESS_SIZE;
>  		rxsize = 2; /* 0 or 1 data bytes */
>  
> -		if (WARN_ON(txsize > 20))
> +		if (drm_WARN_ON(&i915->drm, txsize > 20))
>  			return -E2BIG;
>  
> -		WARN_ON(!msg->buffer != !msg->size);
> +		drm_WARN_ON(&i915->drm, !msg->buffer != !msg->size);
>  
>  		if (msg->buffer)
>  			memcpy(txbuf + HEADER_SIZE, msg->buffer, msg->size);
> @@ -1590,7 +1594,7 @@ intel_dp_aux_transfer(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg)
>  		txsize = msg->size ? HEADER_SIZE : BARE_ADDRESS_SIZE;
>  		rxsize = msg->size + 1;
>  
> -		if (WARN_ON(rxsize > 20))
> +		if (drm_WARN_ON(&i915->drm, rxsize > 20))
>  			return -E2BIG;
>  
>  		ret = intel_dp_aux_xfer(intel_dp, txbuf, txsize,
> @@ -1864,10 +1868,11 @@ static void intel_dp_print_rates(struct intel_dp *intel_dp)
>  int
>  intel_dp_max_link_rate(struct intel_dp *intel_dp)
>  {
> +	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
>  	int len;
>  
>  	len = intel_dp_common_len_rate_limit(intel_dp, intel_dp->max_link_rate);
> -	if (WARN_ON(len <= 0))
> +	if (drm_WARN_ON(&i915->drm, len <= 0))
>  		return 162000;
>  
>  	return intel_dp->common_rates[len - 1];
> @@ -1875,10 +1880,11 @@ intel_dp_max_link_rate(struct intel_dp *intel_dp)
>  
>  int intel_dp_rate_select(struct intel_dp *intel_dp, int rate)
>  {
> +	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
>  	int i = intel_dp_rate_index(intel_dp->sink_rates,
>  				    intel_dp->num_sink_rates, rate);
>  
> -	if (WARN_ON(i < 0))
> +	if (drm_WARN_ON(&i915->drm, i < 0))
>  		i = 0;
>  
>  	return i;
> @@ -5404,6 +5410,7 @@ static void intel_dp_handle_test_request(struct intel_dp *intel_dp)
>  static int
>  intel_dp_check_mst_status(struct intel_dp *intel_dp)
>  {
> +	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
>  	bool bret;
>  
>  	if (intel_dp->is_mst) {
> @@ -5412,7 +5419,7 @@ intel_dp_check_mst_status(struct intel_dp *intel_dp)
>  		int retry;
>  		bool handled;
>  
> -		WARN_ON_ONCE(intel_dp->active_mst_links < 0);
> +		drm_WARN_ON_ONCE(&i915->drm, intel_dp->active_mst_links < 0);
>  		bret = intel_dp_get_sink_irq_esi(intel_dp, esi);
>  go_again:
>  		if (bret == true) {
> @@ -5695,11 +5702,12 @@ intel_dp_short_pulse(struct intel_dp *intel_dp)
>  static enum drm_connector_status
>  intel_dp_detect_dpcd(struct intel_dp *intel_dp)
>  {
> +	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
>  	struct intel_lspcon *lspcon = dp_to_lspcon(intel_dp);
>  	u8 *dpcd = intel_dp->dpcd;
>  	u8 type;
>  
> -	if (WARN_ON(intel_dp_is_edp(intel_dp)))
> +	if (drm_WARN_ON(&i915->drm, intel_dp_is_edp(intel_dp)))
>  		return connector_status_connected;
>  
>  	if (lspcon->active)

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
