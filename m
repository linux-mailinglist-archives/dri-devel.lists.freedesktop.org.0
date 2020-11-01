Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7042A1C24
	for <lists+dri-devel@lfdr.de>; Sun,  1 Nov 2020 06:41:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E1B16E10A;
	Sun,  1 Nov 2020 05:41:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDD6D6E10A;
 Sun,  1 Nov 2020 05:41:41 +0000 (UTC)
IronPort-SDR: EtTQW0LhMan8SvY1O81m1g7tz7Gm+JMTrYoR+VIlQ6UxXI/73QPxAyi4U7wHw19MUVxjqQFBJJ
 2AqigfUAQiDw==
X-IronPort-AV: E=McAfee;i="6000,8403,9791"; a="155754543"
X-IronPort-AV: E=Sophos;i="5.77,440,1596524400"; d="scan'208";a="155754543"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2020 22:41:41 -0700
IronPort-SDR: WLuyw3xjc/7PnlHVhY5DXT+tk08OGzv8YYIFw6kHNuicEUE+jNRole4ktKi74IN4gcV1UIgGHz
 byBpAYBodzMg==
X-IronPort-AV: E=Sophos;i="5.77,440,1596524400"; d="scan'208";a="537565815"
Received: from aknautiy-mobl.gar.corp.intel.com (HELO [10.215.177.133])
 ([10.215.177.133])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2020 22:41:38 -0700
Subject: Re: [RFC 02/13] drm/edid: Parse MAX_FRL field from HFVSDB block
To: "Shankar, Uma" <uma.shankar@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20201015105259.27934-1-ankit.k.nautiyal@intel.com>
 <20201015105259.27934-3-ankit.k.nautiyal@intel.com>
 <f0e519bf25234f128e716a520443a60f@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Message-ID: <98103781-a583-6635-2c69-3a9c4fae8d3d@intel.com>
Date: Sun, 1 Nov 2020 11:11:35 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <f0e519bf25234f128e716a520443a60f@intel.com>
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


On 10/19/2020 2:17 AM, Shankar, Uma wrote:
>
>> -----Original Message-----
>> From: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>
>> Sent: Thursday, October 15, 2020 4:23 PM
>> To: intel-gfx@lists.freedesktop.org
>> Cc: dri-devel@lists.freedesktop.org; Shankar, Uma <uma.shankar@intel.com>;
>> Kulkarni, Vandita <vandita.kulkarni@intel.com>; ville.syrjala@linux.intel.com;
>> Sharma, Swati2 <swati2.sharma@intel.com>
>> Subject: [RFC 02/13] drm/edid: Parse MAX_FRL field from HFVSDB block
>>
>> From: Swati Sharma <swati2.sharma@intel.com>
>>
>> This patch parses MAX_FRL field to get the MAX rate in Gbps that the HDMI 2.1
>> panel can support in FRL mode. Source need this field to determine the optimal
>> rate between the source and sink during FRL training.
>>
>> Signed-off-by: Sharma, Swati2 <swati2.sharma@intel.com>
>> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>> ---
>>   drivers/gpu/drm/drm_edid.c  | 51 +++++++++++++++++++++++++++++++++++++
>>   include/drm/drm_connector.h |  6 +++++
>>   2 files changed, 57 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c index
>> 631125b46e04..8afb136e73f5 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -4849,6 +4849,52 @@ static void drm_parse_vcdb(struct drm_connector
>> *connector, const u8 *db)
>>   info->rgb_quant_range_selectable = true;  }
>>
>> +static
>> +void drm_get_max_frl_rate(int max_frl_rate, u8 *max_lanes, u8
>> +*max_rate_per_lane) {
>> +switch(max_frl_rate) {
>> +case 1:
>> +*max_lanes = 3;
>> +*max_rate_per_lane = 3;
>> +break;
>> +case 2:
>> +*max_lanes = 3;
>> +*max_rate_per_lane = 6;
>> +break;
>> +case 3:
>> +*max_lanes = 4;
>> +*max_rate_per_lane = 6;
>> +break;
>> +case 4:
>> +*max_lanes = 4;
>> +*max_rate_per_lane = 8;
>> +break;
>> +case 5:
>> +*max_lanes = 4;
>> +*max_rate_per_lane = 10;
>> +break;
>> +case 6:
>> +*max_lanes = 4;
>> +*max_rate_per_lane = 12;
>> +break;
>> +case 0:
>> +default:
>> +*max_lanes = 0;
>> +*max_rate_per_lane = 0;
>> +}
>> +}
>> +
>> +static void drm_parse_hdmi_21_additional_fields(struct drm_connector
>> *connector,
>> +const u8 *db)
>> +{
>> +struct drm_hdmi_info *hdmi = &connector->display_info.hdmi;
>> +u8 max_frl_rate;
>> +
>> +max_frl_rate = db[7] & DRM_EDID_MAX_FRL_RATE_MASK;
> This seems wrong,  we need to right shift this by 4 to get the max_frl_rate.


Thanks Uma for catching this.

This was correct in the first patch, bug crept in while restructuring 
the code. Will fix in the next patchset.

>
>> +drm_get_max_frl_rate(max_frl_rate, &hdmi->max_lanes,
>> +     &hdmi->max_frl_rate_per_lane);
> We can just pass the connecter and drm_get_max_frl_rate can fill the respective fields.


I wanted to make this generic, as this function is to be re-used in case 
of parsing DSC max frl also, so I just passed the lanes and rate per 
lane to be filled.


>
>> +}
>> +
>>   static void drm_parse_ycbcr420_deep_color_info(struct drm_connector
>> *connector,
>>          const u8 *db)
>>   {
>> @@ -4902,6 +4948,11 @@ static void drm_parse_hdmi_forum_vsdb(struct
>> drm_connector *connector,
>>   }
>>   }
>>
>> +if (hf_vsdb[7]) {
>> +    DRM_DEBUG_KMS("hdmi_21 sink detected. parsing edid\n");
>> +    drm_parse_hdmi_21_additional_fields(connector, hf_vsdb);
> We can get rid of this extra wrapper.


Agreed. Will take care of this in the next patchset.

Thanks & Regards,

Ankit

>
>> +}
>> +
>>   drm_parse_ycbcr420_deep_color_info(connector, hf_vsdb);  }
>>
>> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h index
>> 928136556174..f351bf10c076 100644
>> --- a/include/drm/drm_connector.h
>> +++ b/include/drm/drm_connector.h
>> @@ -207,6 +207,12 @@ struct drm_hdmi_info {
>>
>>   /** @y420_dc_modes: bitmap of deep color support index */
>>   u8 y420_dc_modes;
>> +
>> +/** @max_frl_rate_per_lane: support fixed rate link */
>> +u8 max_frl_rate_per_lane;
>> +
>> +/** @max_lanes: supported by sink */
>> +u8 max_lanes;
>>   };
>>
>>   /**
>> --
>> 2.17.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
