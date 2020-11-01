Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 339422A1C65
	for <lists+dri-devel@lfdr.de>; Sun,  1 Nov 2020 07:06:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C87B96E18E;
	Sun,  1 Nov 2020 06:06:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C96B16E18E;
 Sun,  1 Nov 2020 06:06:20 +0000 (UTC)
IronPort-SDR: xr8suicvqLkBiQ125/gWSXkppbdIN5cdhPDDQenJhdJ+rjjj2ak4T9/vbVASW8ndkv/HAeyy8p
 3aVBytEdkCKQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9791"; a="230405415"
X-IronPort-AV: E=Sophos;i="5.77,440,1596524400"; d="scan'208";a="230405415"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2020 23:06:20 -0700
IronPort-SDR: LnGQ+E3Cd+MPsHufEKnT7wxo0BMxxpxiYpec/fxIFpcpockXn0P8NRtYYK5E5IzdntRSO5VVUu
 YElbD2nCs2Jg==
X-IronPort-AV: E=Sophos;i="5.77,440,1596524400"; d="scan'208";a="537571568"
Received: from aknautiy-mobl.gar.corp.intel.com (HELO [10.215.177.133])
 ([10.215.177.133])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2020 23:06:17 -0700
Subject: Re: [RFC 06/13] drm/i915: Check for FRL training before DP Link
 training
To: "Shankar, Uma" <uma.shankar@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20201015105259.27934-1-ankit.k.nautiyal@intel.com>
 <20201015105259.27934-7-ankit.k.nautiyal@intel.com>
 <5ca574e0aac34b8e8f39ef17d2610672@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Message-ID: <7876fd54-5ea8-3e2b-6e89-206b06d63cb5@intel.com>
Date: Sun, 1 Nov 2020 11:36:14 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <5ca574e0aac34b8e8f39ef17d2610672@intel.com>
Content-Language: en-US
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
Cc: "Kulkarni, Vandita" <vandita.kulkarni@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Sharma,
 Swati2" <swati2.sharma@intel.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/19/2020 3:51 AM, Shankar, Uma wrote:
>
>> -----Original Message-----
>> From: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>
>> Sent: Thursday, October 15, 2020 4:23 PM
>> To: intel-gfx@lists.freedesktop.org
>> Cc: dri-devel@lists.freedesktop.org; Shankar, Uma <uma.shankar@intel.com>;
>> Kulkarni, Vandita <vandita.kulkarni@intel.com>; ville.syrjala@linux.intel.com;
>> Sharma, Swati2 <swati2.sharma@intel.com>
>> Subject: [RFC 06/13] drm/i915: Check for FRL training before DP Link training
>>
>> This patch calls functions to check FRL training requirements for an HDMI2.1 sink,
>> when connected through PCON.
>> The call is made before the DP link training. In case FRL is not required or failure
>> during FRL training, the TMDS mode is selected for the pcon.
>>
>> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>> ---
>>   drivers/gpu/drm/i915/display/intel_ddi.c | 2 ++
>> drivers/gpu/drm/i915/display/intel_dp.c  | 2 ++
>>   2 files changed, 4 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c
>> b/drivers/gpu/drm/i915/display/intel_ddi.c
>> index bb0b9930958f..1834e5de60a7 100644
>> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
>> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
>> @@ -3484,6 +3484,8 @@ static void tgl_ddi_pre_enable_dp(struct
>> intel_atomic_state *state,
>>   if (!is_mst)
>>   intel_dp_sink_dpms(intel_dp, DRM_MODE_DPMS_ON);
>>
>> +intel_dp_check_frl_training(intel_dp);
> Good to move it near start_link_training to stay consistent with rest of the calls.


Alright. Will take care in the next version.

Thanks & Regards,

Ankit


>
>> +
>>   intel_dp_sink_set_decompression_state(intel_dp, crtc_state, true);
>>   /*
>>    * DDI FEC: "anticipates enabling FEC encoding sets the FEC_READY bit
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
>> b/drivers/gpu/drm/i915/display/intel_dp.c
>> index c1342b5e7781..668165dd2b1a 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
>> @@ -4206,6 +4206,7 @@ static void intel_enable_dp(struct intel_atomic_state
>> *state,
>>
>>   intel_dp_sink_dpms(intel_dp, DRM_MODE_DPMS_ON);
>>   intel_dp_configure_protocol_converter(intel_dp);
>> +intel_dp_check_frl_training(intel_dp);
>>   intel_dp_start_link_train(intel_dp, pipe_config);
>>   intel_dp_stop_link_train(intel_dp, pipe_config);
>>
>> @@ -6127,6 +6128,7 @@ int intel_dp_retrain_link(struct intel_encoder
>> *encoder,
>>       !intel_dp_mst_is_master_trans(crtc_state))
>>   continue;
>>
>> +intel_dp_check_frl_training(intel_dp);
>>   intel_dp_start_link_train(intel_dp, crtc_state);
>>   intel_dp_stop_link_train(intel_dp, crtc_state);
>>   break;
>> --
>> 2.17.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
