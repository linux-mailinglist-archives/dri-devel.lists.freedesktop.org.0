Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 029C22A1C78
	for <lists+dri-devel@lfdr.de>; Sun,  1 Nov 2020 07:52:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A52336EA74;
	Sun,  1 Nov 2020 06:52:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C70EB6EA74;
 Sun,  1 Nov 2020 06:52:38 +0000 (UTC)
IronPort-SDR: SNDAn0twZKeqva+QhYwFrsspdYNg+DFrP7ivNeUxsVrfng61U7iNOQFDvr9k+MpwiTrMTK8WPd
 JBX9yKFIDIrA==
X-IronPort-AV: E=McAfee;i="6000,8403,9791"; a="155756429"
X-IronPort-AV: E=Sophos;i="5.77,440,1596524400"; d="scan'208";a="155756429"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2020 23:52:38 -0700
IronPort-SDR: kHPP9iGgTMCeFcv/02gpjW7CHD73lnjj6K/r62vDTen3wCFXwuCq4tmue5AgnYgDkNRCbgO85p
 9HWnAfAoAkQQ==
X-IronPort-AV: E=Sophos;i="5.77,440,1596524400"; d="scan'208";a="537582900"
Received: from aknautiy-mobl.gar.corp.intel.com (HELO [10.215.177.133])
 ([10.215.177.133])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2020 23:52:35 -0700
Subject: Re: [RFC 09/13] drm/edid: Parse DSC1.2 cap fields from HFVSDB block
To: "Shankar, Uma" <uma.shankar@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20201015105259.27934-1-ankit.k.nautiyal@intel.com>
 <20201015105259.27934-10-ankit.k.nautiyal@intel.com>
 <dde5113aa60d430db1a1101e4e18cb70@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Message-ID: <2e8f4c95-bb70-9364-2927-7fb703b1a129@intel.com>
Date: Sun, 1 Nov 2020 12:22:32 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <dde5113aa60d430db1a1101e4e18cb70@intel.com>
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


On 10/19/2020 4:31 AM, Shankar, Uma wrote:
>
>> -----Original Message-----
>> From: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>
>> Sent: Thursday, October 15, 2020 4:23 PM
>> To: intel-gfx@lists.freedesktop.org
>> Cc: dri-devel@lists.freedesktop.org; Shankar, Uma <uma.shankar@intel.com>;
>> Kulkarni, Vandita <vandita.kulkarni@intel.com>; ville.syrjala@linux.intel.com;
>> Sharma, Swati2 <swati2.sharma@intel.com>
>> Subject: [RFC 09/13] drm/edid: Parse DSC1.2 cap fields from HFVSDB block
> Move this also to beginning of series along with all DRM helpers.


Agreed will move this with other DRM helpers.

>
>> This patch parses HFVSDB fields for DSC1.2 capabilities of an
>> HDMI2.1 sink. These fields are required by a source to understand the DSC
>> capability of the sink, to set appropriate PPS parameters, before transmitting
>> compressed data stream.
>>
>> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>> ---
>>   drivers/gpu/drm/drm_edid.c  | 19 +++++++++++++++++++
>> include/drm/drm_connector.h | 32 ++++++++++++++++++++++++++++++++
>>   2 files changed, 51 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c index
>> 8afb136e73f5..feee19657a7a 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -4889,10 +4889,29 @@ static void
>> drm_parse_hdmi_21_additional_fields(struct drm_connector *connector,  {
>>   struct drm_hdmi_info *hdmi = &connector->display_info.hdmi;
>>   u8 max_frl_rate;
>> +u8 dsc_max_frl_rate;
>>
>>   max_frl_rate = db[7] & DRM_EDID_MAX_FRL_RATE_MASK;
>>   drm_get_max_frl_rate(max_frl_rate, &hdmi->max_lanes,
>>        &hdmi->max_frl_rate_per_lane);
>> +
>> +hdmi->dsc_1p2 = db[11] & DRM_EDID_DSC_1P2;
> We should right shift them as well to get right values.

You are right, For MAX_FRL_RATE and DSC_MAX_FRL_RATE_MASK given below, 
we need to rshift by 4 for getting correct values.

I had missed that in this patch. Will take care in the next version.

But for others there are only 1 bit, we are just storing these as bool, 
if the appropriate bit is set.


>
>> +        hdmi->dsc_native_420 = db[11] & DRM_EDID_DSC_NATIVE_420;
> Same here. Also Alignment is off.


Will fix the alignment in next version.

>
>> +hdmi->dsc_all_bpp = db[11] & DRM_EDID_DSC_ALL_BPP;
>> +
>> +if (db[11] & DRM_EDID_DSC_16BPC)
>> +hdmi->dsc_bpc_supported = 16;
>> +else if (db[11] & DRM_EDID_DSC_12BPC)
>> +hdmi->dsc_bpc_supported = 12;
>> +else if (db[11] & DRM_EDID_DSC_10BPC)
>> +hdmi->dsc_bpc_supported = 10;
>> +else
>> +hdmi->dsc_bpc_supported = 0;
>> +
>> +dsc_max_frl_rate = db[12] & DRM_EDID_DSC_MAX_FRL_RATE;
> This will not give correct value. Fix it.

As mentioned above, will fix this in next version.


>
>> +drm_get_max_frl_rate(dsc_max_frl_rate, &hdmi->dsc_max_lanes,
>> +     &hdmi->dsc_max_frl_rate_per_lane);
>> +hdmi->dsc_total_chunk_kbytes = db[13] &
>> +DRM_EDID_DSC_TOTAL_CHUNK_KBYTES;
>>   }
>>
>>   static void drm_parse_ycbcr420_deep_color_info(struct drm_connector
>> *connector, diff --git a/include/drm/drm_connector.h
>> b/include/drm/drm_connector.h index f351bf10c076..7100012f9c0f 100644
>> --- a/include/drm/drm_connector.h
>> +++ b/include/drm/drm_connector.h
>> @@ -213,6 +213,38 @@ struct drm_hdmi_info {
>>
>>   /** @max_lanes: supported by sink */
>>   u8 max_lanes;
>> +
>> +/** @dsc_1p2: flag for dsc1.2 support by sink */
>> +bool dsc_1p2;
> Add a struct for all these HDMI dsc params.


Makes sense, will add a new struct for HDMI dsc parameters read for DSC 
supported by a given HDMI sink.

Thanks & Regards,

Ankit

>
>> +
>> +/** @dsc_native_420: Does sink support DSC with 4:2:0 compression */
>> +bool dsc_native_420;
>> +
>> +/**
>> + * @dsc_all_bpp: Does sink support all bpp with 4:4:4: or 4:2:2
>> + * compressed formats
>> + */
>> +bool dsc_all_bpp;
>> +
>> +/**
>> + * @dsc_bpc_supported: compressed bpc supported by sink : 10, 12 or 16
>> bpc
>> + */
>> +u8 dsc_bpc_supported;
>> +
>> +/** @dsc_max_slices: maximum number of Horizontal slices supported
>> by */
>> +u8 dsc_max_slices;
>> +
>> +/** @dsc_clk_per_slice : max pixel clock in MHz supported per slice */
>> +u8 dsc_clk_per_slice;
>> +
>> +/** @dsc_max_lanes : dsc max lanes supported for Fixed rate Link
>> training */
>> +u8 dsc_max_lanes;
>> +
>> +/** @dsc_max_frl_rate_per_lane : maximum frl rate with DSC per lane */
>> +u8 dsc_max_frl_rate_per_lane;
>> +
>> +/** @dsc_total_chunk_kbytes: max size of chunks in KBs supported per
>> line*/
>> +u8 dsc_total_chunk_kbytes;
>>   };
>>
>>   /**
>> --
>> 2.17.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
