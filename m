Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E8B8561FE
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 12:46:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FE8610E5FA;
	Thu, 15 Feb 2024 11:46:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MuxYeSRX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E31D10E5FA;
 Thu, 15 Feb 2024 11:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707997615; x=1739533615;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=TvCXcwyKXytTLtbcrBaWhEG8Z15VImsxEFkPd+A0T+Q=;
 b=MuxYeSRXHpSFIde/2eZWz1qkfFBWYleP6NzL83AnSHRNnakftxndq9l7
 CpEXNlIaaiUT9pxEhOVFelBVpjlrTtKo0Xf3VAqzlGQUQbA8EU5IVIdpP
 rYY/70iivPLNS5oRRhpof9PrfwR6XdrqHVyzTEhlkWipUT1oC+bNAtBFR
 vCcOwngY1vBwkZAMJOCJV+VkvislPXA9/+4hcG6E8HPx7DZO8m4YEHc+r
 4CohOB9QU3KKj4BZ9NXN6bI5w+e1CmKD6G+f+PYy0ZcjOLVwurRbzfUtE
 O+r5589vyeC6P1v0D++8lWwsHIn89DPXtP6Eh1/oDM4uaoCtjB5c3HJlK w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="1934324"
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="1934324"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 03:46:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="3830436"
Received: from kraszkow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.44.13])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 03:46:51 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Arun R Murthy <arun.r.murthy@intel.com>
Subject: Re: [PATCH v2 2/6] drm/i915/mst: improve debug logging of DP MST
 mode detect
In-Reply-To: <Zc0D2L1F5JCXC4ID@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1707823736.git.jani.nikula@intel.com>
 <26cddf53e9f7697fc422d19e14bfaf215d6548a6.1707823736.git.jani.nikula@intel.com>
 <Zc0D2L1F5JCXC4ID@intel.com>
Date: Thu, 15 Feb 2024 13:46:48 +0200
Message-ID: <87jzn654rb.fsf@intel.com>
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

On Wed, 14 Feb 2024, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Tue, Feb 13, 2024 at 01:30:57PM +0200, Jani Nikula wrote:
>> Rename intel_dp_can_mst() to intel_dp_mst_detect(), and move all DP MST
>> detect debug logging there. Debug log the sink's MST capability,
>> including single-stream sideband messaging support, and the decision
>> whether to enable MST mode or not. Do this regardless of whether we're
>> actually enabling MST or not.
>>=20
>> Cc: Arun R Murthy <arun.r.murthy@intel.com>
>> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/i915/display/intel_dp.c | 45 +++++++++++++++++--------
>>  1 file changed, 31 insertions(+), 14 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i=
915/display/intel_dp.c
>> index a1c304f451bd..944f566525dd 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
>> @@ -4007,31 +4007,48 @@ intel_dp_get_dpcd(struct intel_dp *intel_dp)
>>  					   intel_dp->downstream_ports) =3D=3D 0;
>>  }
>>=20=20
>> +static const char *intel_dp_mst_mode_str(enum drm_dp_mst_mode mst_mode)
>> +{
>> +	if (mst_mode =3D=3D DRM_DP_SST_SIDEBAND_MSG)
>> +		return "single-stream sideband messaging";
>> +	else
>> +		return str_yes_no(mst_mode =3D=3D DRM_DP_MST);
>
> I wonder if this should also just say "sst"/"mst"/"sst sideband" etc.
> Shrug.
>
> Reviewed-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

I realize there's an issue here.

intel_dp_detect_dpcd() bails out early for !drm_dp_is_branch(), before
the intel_dp_can_mst() call. (Renamed intel_dp_mst_detect() here.)

We'll still happily call intel_dp_configure_mst() later also for
!branch.

We'll need to call intel_dp_mst_detect() earlier and/or somehow combine
these together. I don't think branch devices need to support MST, but I
think MST devices need to support branching. And single-stream sideband
support does not mean branching.

The intention of this patch was to improve MST debug logging, but the
end result is that it reduces it! Auch.

I wonder if we should branch (eh) the detect earlier for eDP, SST and
MST/branch paths. Just to make it easier for our poor brains to follow.


BR,
Jani.


>
>> +}
>> +
>>  static bool
>> -intel_dp_can_mst(struct intel_dp *intel_dp)
>> +intel_dp_mst_detect(struct intel_dp *intel_dp)
>>  {
>>  	struct drm_i915_private *i915 =3D dp_to_i915(intel_dp);
>> +	struct intel_encoder *encoder =3D &dp_to_dig_port(intel_dp)->base;
>> +	enum drm_dp_mst_mode sink_mst_mode;
>> +	enum drm_dp_mst_mode mst_detect;
>> +
>> +	sink_mst_mode =3D drm_dp_read_mst_cap(&intel_dp->aux, intel_dp->dpcd);
>> +
>> +	if (i915->display.params.enable_dp_mst &&
>> +	    intel_dp_mst_source_support(intel_dp) &&
>> +	    sink_mst_mode =3D=3D DRM_DP_MST)
>> +		mst_detect =3D DRM_DP_MST;
>> +	else
>> +		mst_detect =3D DRM_DP_SST;
>>=20=20
>> -	return i915->display.params.enable_dp_mst &&
>> -		intel_dp_mst_source_support(intel_dp) &&
>> -		drm_dp_read_mst_cap(&intel_dp->aux, intel_dp->dpcd) =3D=3D DRM_DP_MST;
>> +	drm_dbg_kms(&i915->drm,
>> +		    "[ENCODER:%d:%s] MST support: port: %s, sink: %s, modparam: %s ->=
 enable: %s\n",
>> +		    encoder->base.base.id, encoder->base.name,
>> +		    str_yes_no(intel_dp_mst_source_support(intel_dp)),
>> +		    intel_dp_mst_mode_str(sink_mst_mode),
>> +		    str_yes_no(i915->display.params.enable_dp_mst),
>> +		    intel_dp_mst_mode_str(mst_detect));
>> +
>> +	return mst_detect !=3D DRM_DP_SST;
>>  }
>>=20=20
>>  static void
>>  intel_dp_configure_mst(struct intel_dp *intel_dp)
>>  {
>>  	struct drm_i915_private *i915 =3D dp_to_i915(intel_dp);
>> -	struct intel_encoder *encoder =3D
>> -		&dp_to_dig_port(intel_dp)->base;
>>  	bool sink_can_mst =3D drm_dp_read_mst_cap(&intel_dp->aux, intel_dp->dp=
cd) =3D=3D DRM_DP_MST;
>>=20=20
>> -	drm_dbg_kms(&i915->drm,
>> -		    "[ENCODER:%d:%s] MST support: port: %s, sink: %s, modparam: %s\n",
>> -		    encoder->base.base.id, encoder->base.name,
>> -		    str_yes_no(intel_dp_mst_source_support(intel_dp)),
>> -		    str_yes_no(sink_can_mst),
>> -		    str_yes_no(i915->display.params.enable_dp_mst));
>> -
>>  	if (!intel_dp_mst_source_support(intel_dp))
>>  		return;
>>=20=20
>> @@ -5390,7 +5407,7 @@ intel_dp_detect_dpcd(struct intel_dp *intel_dp)
>>  		connector_status_connected : connector_status_disconnected;
>>  	}
>>=20=20
>> -	if (intel_dp_can_mst(intel_dp))
>> +	if (intel_dp_mst_detect(intel_dp))
>>  		return connector_status_connected;
>>=20=20
>>  	/* If no HPD, poke DDC gently */
>> --=20
>> 2.39.2

--=20
Jani Nikula, Intel
