Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7222F4220E3
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 10:33:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86AF56E32F;
	Tue,  5 Oct 2021 08:33:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E57056EB1F;
 Tue,  5 Oct 2021 08:33:25 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10127"; a="289196788"
X-IronPort-AV: E=Sophos;i="5.85,348,1624345200"; d="scan'208";a="289196788"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2021 01:33:25 -0700
X-IronPort-AV: E=Sophos;i="5.85,348,1624345200"; d="scan'208";a="477572757"
Received: from gionascu-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.249.40.237])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2021 01:33:23 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/dp: add drm_dp_phy_name() for getting DP PHY name
In-Reply-To: <YVwLm+Akrbx9ZAG/@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211005081053.13729-1-jani.nikula@intel.com>
 <YVwLm+Akrbx9ZAG/@intel.com>
Date: Tue, 05 Oct 2021 11:33:20 +0300
Message-ID: <87ilyb27n3.fsf@intel.com>
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

On Tue, 05 Oct 2021, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Tue, Oct 05, 2021 at 11:10:52AM +0300, Jani Nikula wrote:
>> Add a helper for getting the DP PHY name. In the interest of caller
>> simplicity and to avoid allocations and passing in of buffers, duplicate
>> the const strings to return. It's a minor penalty to pay for simplicity
>> in all the call sites.
>
> Yeah, the on stack extra buffer is getting a bit annoying, especially
> with the calls multiplying like rabbits in my recent patches.
>
> Series is
> Reviewed-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Thanks.

I don't want to block your patches with this, so I can wait and rebase.


BR,
Jani.


>
>>=20
>> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/drm_dp_helper.c | 21 +++++++++++++++++++++
>>  include/drm/drm_dp_helper.h     |  2 ++
>>  2 files changed, 23 insertions(+)
>>=20
>> diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_he=
lper.c
>> index 4d0d1e8e51fa..f1d03b5a4bab 100644
>> --- a/drivers/gpu/drm/drm_dp_helper.c
>> +++ b/drivers/gpu/drm/drm_dp_helper.c
>> @@ -197,6 +197,27 @@ void drm_dp_link_train_channel_eq_delay(const struc=
t drm_dp_aux *aux,
>>  }
>>  EXPORT_SYMBOL(drm_dp_link_train_channel_eq_delay);
>>=20=20
>> +const char *drm_dp_phy_name(enum drm_dp_phy dp_phy)
>> +{
>> +	static const char * const phy_names[] =3D {
>> +		[DP_PHY_DPRX] =3D "DPRX",
>> +		[DP_PHY_LTTPR1] =3D "LTTPR 1",
>> +		[DP_PHY_LTTPR2] =3D "LTTPR 2",
>> +		[DP_PHY_LTTPR3] =3D "LTTPR 3",
>> +		[DP_PHY_LTTPR4] =3D "LTTPR 4",
>> +		[DP_PHY_LTTPR5] =3D "LTTPR 5",
>> +		[DP_PHY_LTTPR6] =3D "LTTPR 6",
>> +		[DP_PHY_LTTPR7] =3D "LTTPR 7",
>> +		[DP_PHY_LTTPR8] =3D "LTTPR 8",
>> +	};
>> +
>> +	if (dp_phy < 0 || dp_phy >=3D ARRAY_SIZE(phy_names))
>> +		return "<INVALID DP PHY>";
>> +
>> +	return phy_names[dp_phy];
>> +}
>> +EXPORT_SYMBOL(drm_dp_phy_name);
>> +
>>  void drm_dp_lttpr_link_train_clock_recovery_delay(void)
>>  {
>>  	usleep_range(100, 200);
>> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
>> index b52df4db3e8f..c873e6349b41 100644
>> --- a/include/drm/drm_dp_helper.h
>> +++ b/include/drm/drm_dp_helper.h
>> @@ -2115,6 +2115,8 @@ bool drm_dp_read_sink_count_cap(struct drm_connect=
or *connector,
>>  				const struct drm_dp_desc *desc);
>>  int drm_dp_read_sink_count(struct drm_dp_aux *aux);
>>=20=20
>> +const char *drm_dp_phy_name(enum drm_dp_phy dp_phy);
>> +
>>  int drm_dp_read_lttpr_common_caps(struct drm_dp_aux *aux,
>>  				  u8 caps[DP_LTTPR_COMMON_CAP_SIZE]);
>>  int drm_dp_read_lttpr_phy_caps(struct drm_dp_aux *aux,
>> --=20
>> 2.30.2

--=20
Jani Nikula, Intel Open Source Graphics Center
