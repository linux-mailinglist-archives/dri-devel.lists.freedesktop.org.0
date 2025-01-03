Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9AFA008A0
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2025 12:30:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4262110E889;
	Fri,  3 Jan 2025 11:30:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kX2vKxUs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79ECF10E887;
 Fri,  3 Jan 2025 11:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735903824; x=1767439824;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=Sd6ulKYnB+ssoZ32ra99GpB1xMrWSHj96BpwEQ4nYu0=;
 b=kX2vKxUsAHYQHVWOYO0GmCqlY72UE3vosFk6Wrd4jpdW5tI8eORgSzOt
 bewCvahk8pzMoz5KDNnkYkzThZ/+SC4pVnEZP4tO2L40bL5G8eryi2EZO
 GzIpJUze7hvme+VqigY3Ula+UlrQLjgDiDYIgC6QuQAYtKCris7GhfaTM
 +aOs1aTL0Osq5BNMK5nh7HM8khSXfj+LQq3VpxPvcqoVAPzavailuVw6Y
 FjG8Jo+LHa7Kn0WZJG9/WlJTJgOBrzLbUe3imuQi6G5hvTddjtDP5aChx
 nrwfGUsFHDQfO+9m7gCkKIV6H+sGshF6rl9HB9QCKKcwQEU7s/G4306wh A==;
X-CSE-ConnectionGUID: 6DR4AyTbQy+LykDTk42+Sg==
X-CSE-MsgGUID: Rn+GjlekRXaYZbHZOdFsjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="35853741"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; d="scan'208";a="35853741"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2025 03:30:24 -0800
X-CSE-ConnectionGUID: xnh5RQbsSmSO9C9dB0sDZQ==
X-CSE-MsgGUID: oxRQ4+6TQpSE0PY3iUS3Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="101627828"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.242])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2025 03:30:22 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: imre.deak@intel.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 13/16] drm/i915/ddi: start distinguishing 128b/132b
 SST and MST at state readout
In-Reply-To: <Z3altKmovqFnIJTM@ideak-desk.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1734643485.git.jani.nikula@intel.com>
 <2c95b57e72ba2a7f07fe377ac71cb4f4038f751d.1734643485.git.jani.nikula@intel.com>
 <Z3altKmovqFnIJTM@ideak-desk.fi.intel.com>
Date: Fri, 03 Jan 2025 13:30:19 +0200
Message-ID: <87h66gm8xg.fsf@intel.com>
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

On Thu, 02 Jan 2025, Imre Deak <imre.deak@intel.com> wrote:
> On Thu, Dec 19, 2024 at 11:34:02PM +0200, Jani Nikula wrote:
>> We'll want to distinguish 128b/132b SST and MST modes at state
>> readout. There's a catch, though. From the hardware perspective,
>> 128b/132b SST and MST programming are pretty much the same. And we can't
>> really ask the sink at this point.
>>=20
>> If we have more than one transcoder in 128b/132b mode associated with
>> the port, we can safely assume it's MST. But for MST with only a single
>> stream enabled, we are pretty much out of luck. Let's fall back to
>> looking at the software state, i.e. intel_dp->is_mst. It should be fine
>> for the state checker, but for hardware takeover at probe, we'll have to
>> trust the GOP has only enabled SST.
>>=20
>> TODO: Not sure how this *or* our current code handles 128b/132b enabled
>> by GOP.
>>=20
>> Cc: Imre Deak <imre.deak@intel.com>
>> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/i915/display/intel_ddi.c | 29 +++++++++++++++++++-----
>>  1 file changed, 23 insertions(+), 6 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/=
i915/display/intel_ddi.c
>> index 7b739b9c5a06..04118f2eea94 100644
>> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
>> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
>> @@ -786,7 +786,7 @@ static void intel_ddi_get_encoder_pipes(struct intel=
_encoder *encoder,
>>  	intel_wakeref_t wakeref;
>>  	enum pipe p;
>>  	u32 tmp;
>> -	u8 mst_pipe_mask;
>> +	u8 mst_pipe_mask =3D 0, dp128b132b_pipe_mask =3D 0;
>>=20=20
>>  	*pipe_mask =3D 0;
>>  	*is_dp_mst =3D false;
>> @@ -823,7 +823,6 @@ static void intel_ddi_get_encoder_pipes(struct intel=
_encoder *encoder,
>>  		goto out;
>>  	}
>>=20=20
>> -	mst_pipe_mask =3D 0;
>>  	for_each_pipe(dev_priv, p) {
>>  		enum transcoder cpu_transcoder =3D (enum transcoder)p;
>>  		u32 port_mask, ddi_select, ddi_mode;
>> @@ -852,9 +851,10 @@ static void intel_ddi_get_encoder_pipes(struct inte=
l_encoder *encoder,
>>=20=20
>>  		ddi_mode =3D tmp & TRANS_DDI_MODE_SELECT_MASK;
>>=20=20
>> -		if (ddi_mode =3D=3D TRANS_DDI_MODE_SELECT_DP_MST ||
>> -		    (ddi_mode =3D=3D TRANS_DDI_MODE_SELECT_FDI_OR_128B132B && HAS_DP2=
0(display)))
>> +		if (ddi_mode =3D=3D TRANS_DDI_MODE_SELECT_DP_MST)
>>  			mst_pipe_mask |=3D BIT(p);
>> +		else if (ddi_mode =3D=3D TRANS_DDI_MODE_SELECT_FDI_OR_128B132B && HAS=
_DP20(display))
>> +			dp128b132b_pipe_mask |=3D BIT(p);
>>=20=20
>>  		*pipe_mask |=3D BIT(p);
>>  	}
>> @@ -864,6 +864,23 @@ static void intel_ddi_get_encoder_pipes(struct inte=
l_encoder *encoder,
>>  			    "No pipe for [ENCODER:%d:%s] found\n",
>>  			    encoder->base.base.id, encoder->base.name);
>>=20=20
>> +	if (!mst_pipe_mask && dp128b132b_pipe_mask) {
>> +		struct intel_dp *intel_dp =3D enc_to_intel_dp(encoder);
>> +
>
> 8b10b and 128b132b can't be mixed on one link, so the above could make
> this clear (and more robust) by
>
> 	if (dp128b132b_pipe_mask) {
> 		if (WARN(mst_pipe_mask))
> 			mst_pipe_mask =3D 0;

They can't be mixed, but doesn't mean the registers can't contain that
stuff!

The point is any goof-ups like that get caught in one place below...

> In any case the patch is correct, so either way:
>
> Reviewed-by: Imre Deak <imre.deak@intel.com>
>
>> +		/*
>> +		 * If we don't have 8b/10b MST, but have more than one
>> +		 * transcoder in 128b/132b mode, we know it must be 128b/132b
>> +		 * MST.
>> +		 *
>> +		 * Otherwise, we fall back to checking the current MST
>> +		 * state. It's not accurate for hardware takeover at probe, but
>> +		 * we don't expect MST to have been enabled at that point, and
>> +		 * can assume it's SST.
>> +		 */
>> +		if (hweight8(dp128b132b_pipe_mask) > 1 || intel_dp->is_mst)
>> +			mst_pipe_mask =3D dp128b132b_pipe_mask;
>> +	}
>> +
>>  	if (!mst_pipe_mask && hweight8(*pipe_mask) > 1) {
>>  		drm_dbg_kms(&dev_priv->drm,
>>  			    "Multiple pipes for [ENCODER:%d:%s] (pipe_mask %02x)\n",
>> @@ -874,9 +891,9 @@ static void intel_ddi_get_encoder_pipes(struct intel=
_encoder *encoder,
>>=20=20
>>  	if (mst_pipe_mask && mst_pipe_mask !=3D *pipe_mask)

...here. If both mst_pipe_mask !=3D 0 and dp128b132b_pipe_mask !=3D 0, then
mst_pipe_mask !=3D *pipe_mask.

BR,
Jani.

>>  		drm_dbg_kms(&dev_priv->drm,
>> -			    "Conflicting MST and non-MST state for [ENCODER:%d:%s] (pipe_mas=
k %02x mst_pipe_mask %02x)\n",
>> +			    "Conflicting MST and non-MST state for [ENCODER:%d:%s] (pipe mas=
ks: all %02x, MST %02x, 128b/132b %02x)\n",
>>  			    encoder->base.base.id, encoder->base.name,
>> -			    *pipe_mask, mst_pipe_mask);
>> +			    *pipe_mask, mst_pipe_mask, dp128b132b_pipe_mask);
>>  	else
>>  		*is_dp_mst =3D mst_pipe_mask;
>>=20=20
>> --=20
>> 2.39.5
>>=20

--=20
Jani Nikula, Intel
