Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E984A855263
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 19:41:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8F6E10E2C4;
	Wed, 14 Feb 2024 18:41:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Iih6pa8E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3063310E3F4;
 Wed, 14 Feb 2024 18:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707936085; x=1739472085;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=InTT6bYSM0w+PF/r5zeveMuJFdQywHuVLtuRMFh/qQI=;
 b=Iih6pa8EjqDoWmPqTVVHaXzJ5caRRj8N9rAP5MPiKCaJ5S+CeZR5rpT9
 qlAfsYaNZuL6YEbQP+aRWcBz/3Tn+EAOtRG8CAlXVfmlxbJ04ctGSAurF
 vuO6TxNehfVmvBrg3ObMYEWnseTI8XW8U8qby080QiYA71F0xC1ABvyc9
 +imvt1Mk/jY4CFRhgK3jnHU3wuv4MpSTlNfZL+ruAyBiSXnpbCUU7cit3
 tI0Og8KAGFkiXEWQc+1Yk8iZ2J1ilm1Dc9jhA5ezXmBXaGLVuDgKTs02A
 Eehi2pF5ccOrNFf5eLWT2SVRnJFK4i9NlQ7f34Aoi2Ph72dAvMjscdbnZ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="13387697"
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; d="scan'208";a="13387697"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 10:41:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; 
   d="scan'208";a="3352533"
Received: from kwszolek-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.63.190])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 10:41:22 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Arun R Murthy <arun.r.murthy@intel.com>
Subject: Re: [PATCH v2 4/6] drm/i915/mst: use the MST mode detected previously
In-Reply-To: <Zc0HmRxIj4ePnh4I@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1707823736.git.jani.nikula@intel.com>
 <4fb849117a31940a3fbc26287c09ee3928e91991.1707823736.git.jani.nikula@intel.com>
 <Zc0HmRxIj4ePnh4I@intel.com>
Date: Wed, 14 Feb 2024 20:41:19 +0200
Message-ID: <87v86q6g8g.fsf@intel.com>
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
> On Tue, Feb 13, 2024 at 01:30:59PM +0200, Jani Nikula wrote:
>> Drop the duplicate read of DP_MSTM_CAP DPCD register, and the duplicate
>> logic for choosing MST mode, and store the chosen mode in struct
>> intel_dp. Rename intel_dp_configure_mst() to intel_dp_mst_configure()
>> while at it.
>>=20
>> Cc: Arun R Murthy <arun.r.murthy@intel.com>
>> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  .../drm/i915/display/intel_display_types.h    |  1 +
>>  drivers/gpu/drm/i915/display/intel_dp.c       | 23 ++++++++-----------
>>  2 files changed, 11 insertions(+), 13 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/driver=
s/gpu/drm/i915/display/intel_display_types.h
>> index 01eb6e4e6049..4a8440a3a812 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
>> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
>> @@ -1780,6 +1780,7 @@ struct intel_dp {
>>=20=20
>>  	bool is_mst;
>>  	int active_mst_links;
>> +	enum drm_dp_mst_mode mst_detect;
>>=20=20
>>  	/* connector directly attached - won't be use for modeset in mst world=
 */
>>  	struct intel_connector *attached_connector;
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i=
915/display/intel_dp.c
>> index 007cb2a04e38..72e91322e310 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
>> @@ -4039,11 +4039,10 @@ intel_dp_mst_detect(struct intel_dp *intel_dp)
>>  	struct drm_i915_private *i915 =3D dp_to_i915(intel_dp);
>>  	struct intel_encoder *encoder =3D &dp_to_dig_port(intel_dp)->base;
>>  	enum drm_dp_mst_mode sink_mst_mode;
>> -	enum drm_dp_mst_mode mst_detect;
>>=20=20
>>  	sink_mst_mode =3D drm_dp_read_mst_cap(&intel_dp->aux, intel_dp->dpcd);
>>=20=20
>> -	mst_detect =3D intel_dp_mst_mode_choose(intel_dp, sink_mst_mode);
>> +	intel_dp->mst_detect =3D intel_dp_mst_mode_choose(intel_dp, sink_mst_m=
ode);
>>=20=20
>>  	drm_dbg_kms(&i915->drm,
>>  		    "[ENCODER:%d:%s] MST support: port: %s, sink: %s, modparam: %s ->=
 enable: %s\n",
>> @@ -4051,25 +4050,23 @@ intel_dp_mst_detect(struct intel_dp *intel_dp)
>>  		    str_yes_no(intel_dp_mst_source_support(intel_dp)),
>>  		    intel_dp_mst_mode_str(sink_mst_mode),
>>  		    str_yes_no(i915->display.params.enable_dp_mst),
>> -		    intel_dp_mst_mode_str(mst_detect));
>> +		    intel_dp_mst_mode_str(intel_dp->mst_detect));
>>=20=20
>> -	return mst_detect !=3D DRM_DP_SST;
>> +	return intel_dp->mst_detect !=3D DRM_DP_SST;
>>  }
>>=20=20
>>  static void
>> -intel_dp_configure_mst(struct intel_dp *intel_dp)
>> +intel_dp_mst_configure(struct intel_dp *intel_dp)
>>  {
>> -	struct drm_i915_private *i915 =3D dp_to_i915(intel_dp);
>> -	bool sink_can_mst =3D drm_dp_read_mst_cap(&intel_dp->aux, intel_dp->dp=
cd) =3D=3D DRM_DP_MST;
>> -
>>  	if (!intel_dp_mst_source_support(intel_dp))
>>  		return;
>
> I was wondering if we even need that, but it looks to be just a
> check to see if we actually initialized the mst_mgt or not.
> We should probably rename it or something... Or perhaps we could
> tweak the topology manager a bit so we wouldn't need to check...

Yeah, I figured we should address this in
follow-up. intel_dp_mst_suspend() and intel_dp_mst_resume() would
benefit too.

>
>>=20=20
>> -	intel_dp->is_mst =3D sink_can_mst &&
>> -		i915->display.params.enable_dp_mst;
>> +	intel_dp->is_mst =3D intel_dp->mst_detect !=3D DRM_DP_SST;
>> +
>> +	drm_dp_mst_topology_mgr_set_mst(&intel_dp->mst_mgr, intel_dp->is_mst);
>>=20=20
>> -	drm_dp_mst_topology_mgr_set_mst(&intel_dp->mst_mgr,
>> -					intel_dp->is_mst);
>> +	/* Avoid stale info on the next detect cycle. */
>> +	intel_dp->mst_detect =3D DRM_DP_SST;
>
> Hmm. Not sure I like having ephemeral stuff like this in intel_dp,
> but I guess the alternative would be plumb it up from detect_dpcd()
> by hand, which might not be super pretty either. Oh well.

Trust me, I went back and forth with this, and this felt least ugly. The
main reason for resetting it back here was to ensure nobody tries to use
it for anything else, and to ensure it gets reset.

>
> Reviewed-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Thanks!

>
>>  }
>>=20=20
>>  static bool
>> @@ -5739,7 +5736,7 @@ intel_dp_detect(struct drm_connector *connector,
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
