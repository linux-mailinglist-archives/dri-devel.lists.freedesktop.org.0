Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C628517FC
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 16:31:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F163B10E79F;
	Mon, 12 Feb 2024 15:31:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TRXuDINf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24AB610E9DE;
 Mon, 12 Feb 2024 15:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707751861; x=1739287861;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=51KmCr/57YkOOiF/b5x/9PQhRk3ATwGzqTy8A1e4CL4=;
 b=TRXuDINf2JuO4vhjAWsavS8Mb1TNgE/iif2qZRWBLdQ+GcO4S0uLMy2C
 8baTzyaR/z8+iqQP2obnMkyBj0lvlgWDt8qGSQdS8sSpdl4W0gIIohPwG
 QefXVkLpNmL4DIIdAJEyugcr1cnXojGwbVkbkXJoSgMjkOJMlN7s0x/u1
 0DfScXi69HSAJBcgKFHX7YmrgF/haL2eyD6GjXhqD9oM+2LZQI5x57JwU
 Y5+cPcv3P03TXWTdQaEyDTf7HUpiGWRQrEydvnk8LuvUwSfBBCMSM4glS
 cLJd5hSiJaG7/eFqfWeDvZIYI4h4gl4YB4pc1MTZ+Q1DKa2ABlxdUk5/X g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="13113196"
X-IronPort-AV: E=Sophos;i="6.06,264,1705392000"; d="scan'208";a="13113196"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 07:30:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,264,1705392000"; 
   d="scan'208";a="2594117"
Received: from belyakov-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.252.63.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 07:30:44 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Arun R
 Murthy <arun.r.murthy@intel.com>
Subject: Re: [RFC 4/4] drm/i915/mst: enable MST mode for 128b/132b
 single-stream sideband
In-Reply-To: <Zb0QJGZ0RE-5KBQb@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1706882590.git.jani.nikula@intel.com>
 <a2c9faf86b5d93013fdd0be9bf3d6ba6228f0a8f.1706882591.git.jani.nikula@intel.com>
 <Zb0QJGZ0RE-5KBQb@intel.com>
Date: Mon, 12 Feb 2024 17:30:40 +0200
Message-ID: <87sf1x8ztr.fsf@intel.com>
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
> On Fri, Feb 02, 2024 at 04:05:34PM +0200, Jani Nikula wrote:
>> If the sink supports 128b/132b and single-stream sideband messaging,
>> enable MST mode.
>>=20
>> With this, the topology manager will still write DP_MSTM_CTRL, which
>> should be ignored by the sink. In the future,
>> drm_dp_mst_topology_mgr_set_mst() bool mst_state parameter should
>> probably be turned into an enum drm_dp_mst_mode mst_mode parameter.
>
> Rather I'd say the topology manager should stop concerning itself
> with the MST enable bit and just frob the sideband enable bit.
> The MST enable bit should be configured at modeset time to
> reflect whether we're about to transmit in MST or SST mode.

Are you suggesting the driver should write the MST vs. SST mode in
DP_MSTM_CTRL?

I worry a bit about the rmw on DPCD regs. The topology manager only does
writes.

BR,
Jani.





>
>>=20
>> Cc: Arun R Murthy <arun.r.murthy@intel.com>
>> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/i915/display/intel_dp.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i=
915/display/intel_dp.c
>> index 4dd9c50226d1..16130e87dc23 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
>> @@ -4020,7 +4020,9 @@ static bool intel_dp_mst_detect(struct intel_dp *i=
ntel_dp)
>>=20=20
>>  	intel_dp->is_mst =3D i915->display.params.enable_dp_mst &&
>>  		intel_dp_mst_source_support(intel_dp) &&
>> -		sink_mst_mode =3D=3D DP_MST_CAPABLE;
>> +		(sink_mst_mode =3D=3D DP_MST_CAPABLE ||
>> +		 (sink_mst_mode =3D=3D DP_MST_SIDEBAND_MSG &&
>> +		  intel_dp->dpcd[DP_MAIN_LINK_CHANNEL_CODING] & DP_CAP_ANSI_128B132B)=
);
>>=20=20
>>  	drm_dbg_kms(&i915->drm,
>>  		    "[ENCODER:%d:%s] MST support: port: %s, sink: %s, modparam: %s ->=
 enable: %s\n",
>> --=20
>> 2.39.2

--=20
Jani Nikula, Intel
