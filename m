Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C592D98B8
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 14:27:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 000AD6E1F7;
	Mon, 14 Dec 2020 13:27:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC27B6E1D5;
 Mon, 14 Dec 2020 13:27:37 +0000 (UTC)
IronPort-SDR: edYQQXiccvepYVxABq+1O7hzUwypEJj59RwTYh7Vpf3IRDHvteilof65CK/u5ElEEZq3iFFNyu
 rJvK9TUqCnhw==
X-IronPort-AV: E=McAfee;i="6000,8403,9834"; a="174847577"
X-IronPort-AV: E=Sophos;i="5.78,418,1599548400"; d="scan'208";a="174847577"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2020 05:27:34 -0800
IronPort-SDR: im7ahNoXZiHGg1V36oNMdTag45mrgbpVXPtSsP8+9d85xrYYlpSKQ3wxK4n1a1eI/+QfrPxDiB
 1sROs5zzL8Eg==
X-IronPort-AV: E=Sophos;i="5.78,418,1599548400"; d="scan'208";a="487070053"
Received: from ssonth-mobl.gar.corp.intel.com (HELO [10.215.117.161])
 ([10.215.117.161])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2020 05:27:30 -0800
Subject: Re: [PATCH v4 15/16] drm/i915: Let PCON convert from RGB to YUV if it
 can
To: "Shankar, Uma" <uma.shankar@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20201208075145.17389-1-ankit.k.nautiyal@intel.com>
 <20201208075145.17389-16-ankit.k.nautiyal@intel.com>
 <3e75205fdf02455c98cad1fa81d60d71@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Message-ID: <73634186-ce53-a96f-00a2-6dcc3b24be8f@intel.com>
Date: Mon, 14 Dec 2020 18:57:27 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <3e75205fdf02455c98cad1fa81d60d71@intel.com>
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Sharma,
 Swati2" <swati2.sharma@intel.com>, "Kulkarni,
 Vandita" <vandita.kulkarni@intel.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12/13/2020 12:53 PM, Shankar, Uma wrote:
>
>> -----Original Message-----
>> From: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>
>> Sent: Tuesday, December 8, 2020 1:22 PM
>> To: intel-gfx@lists.freedesktop.org
>> Cc: dri-devel@lists.freedesktop.org; Shankar, Uma <uma.shankar@intel.com>;
>> airlied@linux.ie; jani.nikula@linux.intel.com; ville.syrjala@linux.intel.com;
>> Kulkarni, Vandita <vandita.kulkarni@intel.com>; Sharma, Swati2
>> <swati2.sharma@intel.com>
>> Subject: [PATCH v4 15/16] drm/i915: Let PCON convert from RGB to YUV if it can
> Make it drm/i915/display:
Noted. Will change in next version of the patch
>
>> If PCON has capability to convert RGB->YUV colorspace and also to 444->420
>> downsampling then for any YUV420 only mode, we can let the PCON do all the
>> conversion.
>>
>> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>> ---
>>   .../drm/i915/display/intel_display_types.h    |  1 +
>>   drivers/gpu/drm/i915/display/intel_dp.c       | 37 +++++++++++++------
>>   2 files changed, 26 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h
>> b/drivers/gpu/drm/i915/display/intel_display_types.h
>> index b41de41759a0..4150108bdc6d 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
>> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
>> @@ -1460,6 +1460,7 @@ struct intel_dp {
>>   		int pcon_max_frl_bw, sink_max_frl_bw;
>>   		u8 max_bpc;
>>   		bool ycbcr_444_to_420;
>> +		bool rgb_to_ycbcr;
>>   	} dfp;
>>
>>   	/* Display stream compression testing */ diff --git
>> a/drivers/gpu/drm/i915/display/intel_dp.c
>> b/drivers/gpu/drm/i915/display/intel_dp.c
>> index 30c76ba63232..b3f1190d8150 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
>> @@ -651,6 +651,10 @@ intel_dp_output_format(struct drm_connector
>> *connector,
>>   	    !drm_mode_is_420_only(info, mode))
>>   		return INTEL_OUTPUT_FORMAT_RGB;
>>
>> +	if (intel_dp->dfp.rgb_to_ycbcr &&
>> +	    intel_dp->dfp.ycbcr_444_to_420)
>> +		return INTEL_OUTPUT_FORMAT_RGB;
>> +
>>   	if (intel_dp->dfp.ycbcr_444_to_420)
>>   		return INTEL_OUTPUT_FORMAT_YCBCR444;
>>   	else
>> @@ -4365,13 +4369,12 @@ void intel_dp_configure_protocol_converter(struct
>> intel_dp *intel_dp)
>>   			    "Failed to set protocol converter YCbCr 4:2:0
>> conversion mode to %s\n",
>>   			    enableddisabled(intel_dp->dfp.ycbcr_444_to_420));
>>
>> -	tmp = 0;
>> -
>> -	if (drm_dp_dpcd_writeb(&intel_dp->aux,
>> -			       DP_PROTOCOL_CONVERTER_CONTROL_2, tmp) <= 0)
>> +	tmp = intel_dp->dfp.rgb_to_ycbcr ?
>> +		DP_CONVERSION_BT601_RGB_YCBCR_ENABLE : 0;
> There are other combinations also possible like BT709 and BT2020. Handle those as well here.
> If no colorspace data is provided we can make BT601 as default, but if user chooses a colorspace
> and pcon supports it, then we should go for that option. We can get that info from connector
> colorspace properties.

Agreed. I will take into account color space in version of the patch.

For DP we set vsc.colorspace in pipe_config from connector colorspace, 
so I can use that information to take a call if its rec 709 or BT2020.

As suggested will use BT601 as default.

Thanks & Regards,

Ankit

>
>> +	if (drm_dp_pcon_convert_rgb_to_ycbcr(&intel_dp->aux, tmp) <= 0)
>>   		drm_dbg_kms(&i915->drm,
>> -			    "Failed to set protocol converter YCbCr 4:2:2
>> conversion mode to %s\n",
>> -			    enableddisabled(false));
>> +			    "Failed to set protocol converter RGB->YCbCr
>> conversion mode to %s\n",
>> +			    enableddisabled(intel_dp->dfp.rgb_to_ycbcr));
>>   }
>>
>>   static void intel_enable_dp(struct intel_atomic_state *state, @@ -6897,7
>> +6900,7 @@ intel_dp_update_420(struct intel_dp *intel_dp)  {
>>   	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
>>   	struct intel_connector *connector = intel_dp->attached_connector;
>> -	bool is_branch, ycbcr_420_passthrough, ycbcr_444_to_420;
>> +	bool is_branch, ycbcr_420_passthrough, ycbcr_444_to_420, rgb_to_ycbcr;
>>
>>   	/* No YCbCr output support on gmch platforms */
>>   	if (HAS_GMCH(i915))
>> @@ -6919,14 +6922,23 @@ intel_dp_update_420(struct intel_dp *intel_dp)
>>   		dp_to_dig_port(intel_dp)->lspcon.active ||
>>   		drm_dp_downstream_444_to_420_conversion(intel_dp->dpcd,
>>   							intel_dp-
>>> downstream_ports);
>> +	rgb_to_ycbcr = drm_dp_downstream_rgb_to_ycbcr_conversion(intel_dp-
>>> dpcd,
>> +							intel_dp-
>>> downstream_ports);
>>   	if (INTEL_GEN(i915) >= 11) {
>> +		/* Let PCON convert from RGB->YCbCr if possible */
>> +		if (is_branch && rgb_to_ycbcr && ycbcr_444_to_420) {
>> +			intel_dp->dfp.rgb_to_ycbcr = true;
>> +			intel_dp->dfp.ycbcr_444_to_420 = true;
>> +			connector->base.ycbcr_420_allowed = true;
>> +		} else {
>>   		/* Prefer 4:2:0 passthrough over 4:4:4->4:2:0 conversion */
>> -		intel_dp->dfp.ycbcr_444_to_420 =
>> -			ycbcr_444_to_420 && !ycbcr_420_passthrough;
>> +			intel_dp->dfp.ycbcr_444_to_420 =
>> +				ycbcr_444_to_420 && !ycbcr_420_passthrough;
>>
>> -		connector->base.ycbcr_420_allowed =
>> -			!is_branch || ycbcr_444_to_420 ||
>> ycbcr_420_passthrough;
>> +			connector->base.ycbcr_420_allowed =
>> +				!is_branch || ycbcr_444_to_420 ||
>> ycbcr_420_passthrough;
>> +		}
>>   	} else {
>>   		/* 4:4:4->4:2:0 conversion is the only way */
>>   		intel_dp->dfp.ycbcr_444_to_420 = ycbcr_444_to_420; @@ -
>> 6935,8 +6947,9 @@ intel_dp_update_420(struct intel_dp *intel_dp)
>>   	}
>>
>>   	drm_dbg_kms(&i915->drm,
>> -		    "[CONNECTOR:%d:%s] YCbCr 4:2:0 allowed? %s, YCbCr 4:4:4-
>>> 4:2:0 conversion? %s\n",
>> +		    "[CONNECTOR:%d:%s] RGB->YcbCr conversion? %s, YCbCr 4:2:0
>> +allowed? %s, YCbCr 4:4:4->4:2:0 conversion? %s\n",
>>   		    connector->base.base.id, connector->base.name,
>> +		    yesno(intel_dp->dfp.rgb_to_ycbcr),
>>   		    yesno(connector->base.ycbcr_420_allowed),
>>   		    yesno(intel_dp->dfp.ycbcr_444_to_420));
>>   }
>> --
>> 2.17.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
