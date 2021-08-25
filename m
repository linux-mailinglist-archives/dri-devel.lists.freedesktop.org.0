Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF203F7769
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 16:30:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F0666E239;
	Wed, 25 Aug 2021 14:30:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 005486E237;
 Wed, 25 Aug 2021 14:30:28 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="217252962"
X-IronPort-AV: E=Sophos;i="5.84,350,1620716400"; d="scan'208";a="217252962"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2021 07:30:28 -0700
X-IronPort-AV: E=Sophos;i="5.84,350,1620716400"; d="scan'208";a="527347137"
Received: from mburkard-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.251.213.64])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2021 07:30:26 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Manasi Navare <manasi.d.navare@intel.com>
Subject: Re: [Intel-gfx] [PATCH 2/4] drm/dp: use more of the extended receiver
 cap
In-Reply-To: <YR6R6oveiFbF8xmg@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1628851334.git.jani.nikula@intel.com>
 <ab2ca82226fd954a61a5674cf0531508bd18cef7.1628851334.git.jani.nikula@intel.com>
 <YR6R6oveiFbF8xmg@intel.com>
Date: Wed, 25 Aug 2021 17:30:23 +0300
Message-ID: <87eeahegw0.fsf@intel.com>
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

On Thu, 19 Aug 2021, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Fri, Aug 13, 2021 at 01:43:20PM +0300, Jani Nikula wrote:
>> Extend the use of extended receiver cap at 0x2200 to cover
>> MAIN_LINK_CHANNEL_CODING_CAP in 0x2206, in case an implementation hides
>> the DP 2.0 128b/132b channel encoding cap.
>>=20
>> Cc: Manasi Navare <manasi.d.navare@intel.com>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/drm_dp_helper.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_he=
lper.c
>> index 9b2a2961fca8..9389f92cb944 100644
>> --- a/drivers/gpu/drm/drm_dp_helper.c
>> +++ b/drivers/gpu/drm/drm_dp_helper.c
>> @@ -608,7 +608,7 @@ static u8 drm_dp_downstream_port_count(const u8 dpcd=
[DP_RECEIVER_CAP_SIZE])
>>  static int drm_dp_read_extended_dpcd_caps(struct drm_dp_aux *aux,
>>  					  u8 dpcd[DP_RECEIVER_CAP_SIZE])
>>  {
>> -	u8 dpcd_ext[6];
>> +	u8 dpcd_ext[DP_MAIN_LINK_CHANNEL_CODING + 1];
>
> Why are we even reading less of this than the normal receiver caps?

Good question. I forget my reasoning to only extend to what might affect
this use case. Should we extend to the size of the usual receiver caps?

BR,
Jani.


>
>>  	int ret;
>>=20=20
>>  	/*
>> --=20
>> 2.20.1

--=20
Jani Nikula, Intel Open Source Graphics Center
