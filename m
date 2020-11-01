Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 276022A1C5E
	for <lists+dri-devel@lfdr.de>; Sun,  1 Nov 2020 06:57:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 829C96E185;
	Sun,  1 Nov 2020 05:57:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A49186E185;
 Sun,  1 Nov 2020 05:57:04 +0000 (UTC)
IronPort-SDR: HvNR6t8qI5o64m4ziuRAnbL6dUB5qS05iMQ7m/HNGs9PzmN4J63v5YYSI9nMPZd7XD12qV8w6F
 nL/dajGMg4KQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9791"; a="165270694"
X-IronPort-AV: E=Sophos;i="5.77,440,1596524400"; d="scan'208";a="165270694"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2020 22:57:03 -0700
IronPort-SDR: sQQGpGHj9B81dQS27Hk6Z5JGMrj98HW9pfYjAIqAIWacH+EfUIQC3IfI7Xi8N6fk4YQ4hO4KDo
 JE9mp6npD6lg==
X-IronPort-AV: E=Sophos;i="5.77,440,1596524400"; d="scan'208";a="537569375"
Received: from aknautiy-mobl.gar.corp.intel.com (HELO [10.215.177.133])
 ([10.215.177.133])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2020 22:57:01 -0700
Subject: Re: [RFC 04/13] drm/i915: Capture max frl rate for PCON in dfp cap
 structure
To: "Shankar, Uma" <uma.shankar@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20201015105259.27934-1-ankit.k.nautiyal@intel.com>
 <20201015105259.27934-5-ankit.k.nautiyal@intel.com>
 <0bc6df6f31934c4e99777e78a994808c@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Message-ID: <a4eadb69-96ab-280d-e9c7-7fc5b7832ce7@intel.com>
Date: Sun, 1 Nov 2020 11:26:59 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <0bc6df6f31934c4e99777e78a994808c@intel.com>
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


On 10/19/2020 3:11 AM, Shankar, Uma wrote:
>
>> -----Original Message-----
>> From: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>
>> Sent: Thursday, October 15, 2020 4:23 PM
>> To: intel-gfx@lists.freedesktop.org
>> Cc: dri-devel@lists.freedesktop.org; Shankar, Uma <uma.shankar@intel.com>;
>> Kulkarni, Vandita <vandita.kulkarni@intel.com>; ville.syrjala@linux.intel.com;
>> Sharma, Swati2 <swati2.sharma@intel.com>
>> Subject: [RFC 04/13] drm/i915: Capture max frl rate for PCON in dfp cap structure
>>
>> HDMI2.1 PCON advertises Max FRL bandwidth supported by the PCON and by the
>> sink.
>>
>> This patch captures these in dfp cap structure in intel_dp and uses these to
>> prune connector modes that cannot be supported by the PCON and sink FRL
>> bandwidth.
>>
>> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>> ---
>>   .../drm/i915/display/intel_display_types.h    |  1 +
>>   drivers/gpu/drm/i915/display/intel_dp.c       | 33 +++++++++++++++++--
>>   2 files changed, 32 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h
>> b/drivers/gpu/drm/i915/display/intel_display_types.h
>> index 0b5df8e44966..e2f58d0575a2 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
>> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
>> @@ -1398,6 +1398,7 @@ struct intel_dp {
>>   struct {
>>   int min_tmds_clock, max_tmds_clock;
>>   int max_dotclock;
>> +int pcon_max_frl, sink_max_frl;
> Append it with bw or rate.


Agreed, will add 'bw' for clarity.

>
>>   u8 max_bpc;
>>   bool ycbcr_444_to_420;
>>   } dfp;
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
>> b/drivers/gpu/drm/i915/display/intel_dp.c
>> index 0902a9aeeda1..cd6934f28f32 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
>> @@ -683,6 +683,24 @@ intel_dp_mode_valid_downstream(struct
>> intel_connector *connector,
>>   const struct drm_display_info *info = &connector->base.display_info;
>>   int tmds_clock;
>>
>> +/* If PCON and HDMI2.1 sink both support FRL MODE, check FRL
> Use multi line comment style.

Agreed. Will take care in next version.


>
>> + * bandwidth constraints.
>> + */
>> +if (intel_dp->dfp.pcon_max_frl) {
>> +int target_bw;
>> +int max_frl_bw;
>> +int bpp = intel_dp_mode_min_output_bpp(&connector->base,
>> mode);
>> +
>> +target_bw = bpp * DIV_ROUND_UP(target_clock, 1000000);
> To avoid any roundup errors, it would be good to multiple max_frl_bw by 1000000 than dividing target_clock

Alright. Will take care of this in next version.


Thanks & Regards,

Ankit

>
>> +
>> +max_frl_bw = min(intel_dp->dfp.pcon_max_frl,
>> + intel_dp->dfp.sink_max_frl);
>> +if (target_bw > max_frl_bw)
>> +return MODE_CLOCK_HIGH;
>> +
>> +return MODE_OK;
>> +}
>> +
>>   if (intel_dp->dfp.max_dotclock &&
>>       target_clock > intel_dp->dfp.max_dotclock)
>>   return MODE_CLOCK_HIGH;
>> @@ -6383,13 +6401,21 @@ intel_dp_update_dfp(struct intel_dp *intel_dp,
>>    intel_dp->downstream_ports,
>>    edid);
>>
>> +intel_dp->dfp.pcon_max_frl =
>> +drm_dp_get_pcon_max_frl_bw(intel_dp->dpcd,
>> +   intel_dp->downstream_ports);
>> +
>> +intel_dp->dfp.sink_max_frl =
>> +drm_dp_get_hdmi_max_frl_bw(&intel_dp->aux);
>> +
>>   drm_dbg_kms(&i915->drm,
>> -    "[CONNECTOR:%d:%s] DFP max bpc %d, max dotclock %d,
>> TMDS clock %d-%d\n",
>> +    "[CONNECTOR:%d:%s] DFP max bpc %d, max dotclock %d,
>> TMDS clock
>> +%d-%d, PCON Max FRL BW %dGbps, Sink Max FRL BW %dGbps\n",
>>       connector->base.base.id, connector->base.name,
>>       intel_dp->dfp.max_bpc,
>>       intel_dp->dfp.max_dotclock,
>>       intel_dp->dfp.min_tmds_clock,
>> -    intel_dp->dfp.max_tmds_clock);
>> +    intel_dp->dfp.max_tmds_clock,
>> +    intel_dp->dfp.pcon_max_frl,
>> +    intel_dp->dfp.sink_max_frl);
>>   }
>>
>>   static void
>> @@ -6479,6 +6505,9 @@ intel_dp_unset_edid(struct intel_dp *intel_dp)
>>   intel_dp->dfp.min_tmds_clock = 0;
>>   intel_dp->dfp.max_tmds_clock = 0;
>>
>> +intel_dp->dfp.pcon_max_frl = 0;
>> +intel_dp->dfp.sink_max_frl = 0;
>> +
>>   intel_dp->dfp.ycbcr_444_to_420 = false;
>>   connector->base.ycbcr_420_allowed = false;  }
>> --
>> 2.17.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
