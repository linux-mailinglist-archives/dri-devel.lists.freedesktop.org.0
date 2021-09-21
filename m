Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8320D413051
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 10:45:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 562536E916;
	Tue, 21 Sep 2021 08:45:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A24736E916;
 Tue, 21 Sep 2021 08:44:59 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10113"; a="284326439"
X-IronPort-AV: E=Sophos;i="5.85,310,1624345200"; d="scan'208";a="284326439"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2021 01:44:58 -0700
X-IronPort-AV: E=Sophos;i="5.85,310,1624345200"; d="scan'208";a="556850956"
Received: from unknown (HELO localhost) ([10.251.218.108])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2021 01:44:56 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 manasi.d.navare@intel.com
Subject: Re: [PATCH v3 12/13] drm/i915/dg2: configure TRANS_DP2_VFREQ{HIGH,
 LOW} for 128b/132b
In-Reply-To: <YUSP4kNmeNejBQZS@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1631191763.git.jani.nikula@intel.com>
 <a2902cc188973f022f282f2a77e693afdecefb5a.1631191763.git.jani.nikula@intel.com>
 <YUSP4kNmeNejBQZS@intel.com>
Date: Tue, 21 Sep 2021 11:44:53 +0300
Message-ID: <87pmt2tj0a.fsf@intel.com>
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

On Fri, 17 Sep 2021, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Thu, Sep 09, 2021 at 03:52:04PM +0300, Jani Nikula wrote:
>> There's a new register pair for 128b/132b mode where you need to set the
>> pixel clock in Hz.
>>=20
>> v2: Fix UHBR rate check, use intel_dp_is_uhbr() helper
>>=20
>> Bspec: 54128
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Reviewed-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Thanks for the reviews, pushed up to and including this one.

BR,
Jani.


>
>> ---
>>  drivers/gpu/drm/i915/display/intel_dp_mst.c | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>=20
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/d=
rm/i915/display/intel_dp_mst.c
>> index d104441344c0..97af19fd9780 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
>> @@ -550,6 +550,17 @@ static void intel_mst_enable_dp(struct intel_atomic=
_state *state,
>>=20=20
>>  	clear_act_sent(encoder, pipe_config);
>>=20=20
>> +	if (intel_dp_is_uhbr(pipe_config)) {
>> +		const struct drm_display_mode *adjusted_mode =3D
>> +			&pipe_config->hw.adjusted_mode;
>> +		u64 crtc_clock_hz =3D KHz(adjusted_mode->crtc_clock);
>> +
>> +		intel_de_write(dev_priv, TRANS_DP2_VFREQHIGH(pipe_config->cpu_transco=
der),
>> +			       TRANS_DP2_VFREQ_PIXEL_CLOCK(crtc_clock_hz >> 24));
>> +		intel_de_write(dev_priv, TRANS_DP2_VFREQLOW(pipe_config->cpu_transcod=
er),
>> +			       TRANS_DP2_VFREQ_PIXEL_CLOCK(crtc_clock_hz & 0xffffff));
>> +	}
>> +
>>  	intel_ddi_enable_transcoder_func(encoder, pipe_config);
>>=20=20
>>  	intel_de_rmw(dev_priv, TRANS_DDI_FUNC_CTL(trans), 0,
>> --=20
>> 2.30.2

--=20
Jani Nikula, Intel Open Source Graphics Center
