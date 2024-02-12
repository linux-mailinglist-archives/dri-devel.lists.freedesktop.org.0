Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5BC8517E4
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 16:25:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9956510ECD9;
	Mon, 12 Feb 2024 15:25:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G3JBTHId";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E0C410ECD9;
 Mon, 12 Feb 2024 15:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707751550; x=1739287550;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=oBGJviN5K3qZYQbXFMl5KwnwCmSjIZTU5lH2/pqypsk=;
 b=G3JBTHIdWaYRsnT3jqZrJ7elsRyhOzIc3BuIwTrPkrXtJ3635hHWQdTz
 1bmCoMzyQPd1mM6ioZYEFKtAjpsWyuzMNCed4DZIhGztqiNKIYr6xS1tY
 yzHRiK6ZWA0SL5V8qi+qoN8rMX353JXBmTzpviSbYnaoPIoLFdaSbEqGc
 tvz6C3mcYztsVsIOql1kiPcPscoFWT35t1z0dnjrQTBoOjB4XVZkd/3Kz
 A7mG8u1XqbSrrXnO83Q52H/G8dolJ8XLo3+weqpUwf06mfiE88XhT2u49
 RHDcDxYzomz+2yeSLeFAkrlJ92C4B20VdZrEe9C7u/W/eQpzIdHl4DHzO A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1613742"
X-IronPort-AV: E=Sophos;i="6.06,264,1705392000"; 
   d="scan'208";a="1613742"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 07:25:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,264,1705392000"; 
   d="scan'208";a="7267622"
Received: from belyakov-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.252.63.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 07:25:48 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Arun R
 Murthy <arun.r.murthy@intel.com>
Subject: Re: [RFC 2/4] drm/i915/dp: refactor DP MST detection and configuration
In-Reply-To: <Zb0PZldnyLe59Vb0@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1706882590.git.jani.nikula@intel.com>
 <d789334e1f31ba6eff1c7e2913e6a03cea8227e7.1706882591.git.jani.nikula@intel.com>
 <Zb0PZldnyLe59Vb0@intel.com>
Date: Mon, 12 Feb 2024 17:25:43 +0200
Message-ID: <87v86t9020.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Fri, 02 Feb 2024, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Fri, Feb 02, 2024 at 04:05:32PM +0200, Jani Nikula wrote:
>> Currently we've split MST capability detection in two places,
>> intel_dp_can_mst() and intel_dp_configure_mst(). They check essentially
>> the same things.
>>=20
>> Move bulk of the work, including logging, to intel_dp_can_mst() and
>> rename it intel_dp_mst_detect(). Set intel_dp->is_mst there to avoid
>> duplicate work.
>
> This seems confusing. is_mst is supposed to reflect the state
> of the topology manager, nothing more.

We'll, that's still exactly what we're going to set the topology manager
state to. It's just that now we figure it out just a little earlier, so
we don't have to duplicate the dpcd reads and logic to two places.

BR,
Jani.


>
>>=20
>> Rename intel_dp_configure_mst() to intel_dp_mst_configure(), and only
>> set the topology manager state there.
>>=20
>> The main functional difference is that the DP_MSTM_CAP DPCD register is
>> now only read once at detect, unconditionally, and the MST support is
>> always logged. Everything else should remain the same.
>>=20
>> Cc: Arun R Murthy <arun.r.murthy@intel.com>
>> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/i915/display/intel_dp.c | 36 ++++++++++---------------
>>  1 file changed, 14 insertions(+), 22 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i=
915/display/intel_dp.c
>> index 7af09f2c008d..e0b8ee6bde79 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
>> @@ -4004,23 +4004,15 @@ intel_dp_get_dpcd(struct intel_dp *intel_dp)
>>  					   intel_dp->downstream_ports) =3D=3D 0;
>>  }
>>=20=20
>> -static bool
>> -intel_dp_can_mst(struct intel_dp *intel_dp)
>> +static bool intel_dp_mst_detect(struct intel_dp *intel_dp)
>>  {
>>  	struct drm_i915_private *i915 =3D dp_to_i915(intel_dp);
>> +	struct intel_encoder *encoder =3D &dp_to_dig_port(intel_dp)->base;
>> +	bool sink_can_mst =3D drm_dp_read_mst_cap(&intel_dp->aux, intel_dp->dp=
cd) =3D=3D DP_MST_CAPABLE;
>>=20=20
>> -	return i915->display.params.enable_dp_mst &&
>> +	intel_dp->is_mst =3D i915->display.params.enable_dp_mst &&
>>  		intel_dp_mst_source_support(intel_dp) &&
>> -		drm_dp_read_mst_cap(&intel_dp->aux, intel_dp->dpcd) =3D=3D DP_MST_CAP=
ABLE;
>> -}
>> -
>> -static void
>> -intel_dp_configure_mst(struct intel_dp *intel_dp)
>> -{
>> -	struct drm_i915_private *i915 =3D dp_to_i915(intel_dp);
>> -	struct intel_encoder *encoder =3D
>> -		&dp_to_dig_port(intel_dp)->base;
>> -	bool sink_can_mst =3D drm_dp_read_mst_cap(&intel_dp->aux, intel_dp->dp=
cd) =3D=3D DP_MST_CAPABLE;
>> +		sink_can_mst;
>>=20=20
>>  	drm_dbg_kms(&i915->drm,
>>  		    "[ENCODER:%d:%s] MST support: port: %s, sink: %s, modparam: %s\n",
>> @@ -4029,14 +4021,14 @@ intel_dp_configure_mst(struct intel_dp *intel_dp)
>>  		    str_yes_no(sink_can_mst),
>>  		    str_yes_no(i915->display.params.enable_dp_mst));
>>=20=20
>> -	if (!intel_dp_mst_source_support(intel_dp))
>> -		return;
>> -
>> -	intel_dp->is_mst =3D sink_can_mst &&
>> -		i915->display.params.enable_dp_mst;
>> +	return intel_dp->is_mst;
>> +}
>>=20=20
>> -	drm_dp_mst_topology_mgr_set_mst(&intel_dp->mst_mgr,
>> -					intel_dp->is_mst);
>> +static void intel_dp_mst_configure(struct intel_dp *intel_dp)
>> +{
>> +	if (intel_dp_mst_source_support(intel_dp))
>> +		drm_dp_mst_topology_mgr_set_mst(&intel_dp->mst_mgr,
>> +						intel_dp->is_mst);
>>  }
>>=20=20
>>  static bool
>> @@ -5387,7 +5379,7 @@ intel_dp_detect_dpcd(struct intel_dp *intel_dp)
>>  		connector_status_connected : connector_status_disconnected;
>>  	}
>>=20=20
>> -	if (intel_dp_can_mst(intel_dp))
>> +	if (intel_dp_mst_detect(intel_dp))
>>  		return connector_status_connected;
>>=20=20
>>  	/* If no HPD, poke DDC gently */
>> @@ -5706,7 +5698,7 @@ intel_dp_detect(struct drm_connector *connector,
>>=20=20
>>  	intel_dp_detect_dsc_caps(intel_dp, intel_connector);
>>=20=20
>> -	intel_dp_configure_mst(intel_dp);
>> +	intel_dp_mst_configure(intel_dp);
>>=20=20
>>  	/*
>>  	 * TODO: Reset link params when switching to MST mode, until MST
>> --=20
>> 2.39.2

--=20
Jani Nikula, Intel
