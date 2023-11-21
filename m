Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8566E7F2E93
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 14:41:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8335510E496;
	Tue, 21 Nov 2023 13:41:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16CA710E2A6;
 Tue, 21 Nov 2023 13:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700574107; x=1732110107;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=5+Ao5hr+/R7aRxljis3caYcPgVhTeptDqdAsy6+8QtE=;
 b=Zh63+rBGLJY1vPTRC4WZEfbk+4jw7+epRoSuVsvl3SqES3bxhRp4oMqe
 c7mgFTIkY+LvrdBWibXKTUQcYSp+qJXMBwecxf3n07FQzdzlH7pRR/yCZ
 LSEMLBBu5uZlYUwzJsG8uDQrzLLw+jKlp6+D7uRwHnwAgS3mJKEp8zNXJ
 aaimEGFC+CYoLtoPPL/hQ91K2johlYKTR2XCuJ1VcfrtV+93ZTyAz0q2F
 vK1A9zfDWXBus8126lPqHIks7W7zbYq2h9FHurhcajcbAaWDO71+P2tWc
 vqimNHnVf4Jb/DXQi2XhL74Pw97DrhtUfi02XhffPtgKB5XROV/FxSYN6 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="388986759"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; d="scan'208";a="388986759"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2023 05:39:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; d="scan'208";a="14522277"
Received: from hlagrand-mobl1.ger.corp.intel.com (HELO [10.251.219.157])
 ([10.251.219.157])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2023 05:39:36 -0800
Message-ID: <b0a27f48-45b8-449b-81df-2ed4964087b6@linux.intel.com>
Date: Tue, 21 Nov 2023 14:39:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Intel-gfx] [PATCH v3 02/11] drm/dp_mst: Fix PBN divider
 calculation for UHBR rates
To: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>
References: <20231116131841.1588781-3-imre.deak@intel.com>
 <20231117150929.1767227-1-imre.deak@intel.com> <ZVeS88sx9U35ITPh@intel.com>
 <ZVfBorwAcQ5UFmwG@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <ZVfBorwAcQ5UFmwG@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023-11-17 20:40, Rodrigo Vivi wrote:
> On Fri, Nov 17, 2023 at 06:21:07PM +0200, Ville Syrjälä wrote:
>> On Fri, Nov 17, 2023 at 05:09:27PM +0200, Imre Deak wrote:
>>> The current way of calculating the pbn_div value, the link BW per each
>>> MTP slot, worked only for DP 1.4 link rates. Fix things up for UHBR
>>> rates calculating with the correct channel coding efficiency based on
>>> the link rate.
>>>
>>> v2:
>>> - Return the fractional pbn_div value from drm_dp_get_vc_payload_bw().
>>> v3:
>>> - Fix rounding up quotient while calculating req_slots. (Ville)
>>>
>>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
>>> Cc: Lyude Paul <lyude@redhat.com>
>>> Cc: dri-devel@lists.freedesktop.org
>>> Signed-off-by: Imre Deak <imre.deak@intel.com>
>>
>> Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Dave, Sima, it looks like this whole series is ready for getting merged:
> 
> https://patchwork.freedesktop.org/series/126526/
> 
> But it has these 3 drm/dp_mst here.
> Ack to merge them through drm-intel?
Well, as drm-misc maintainer:

Acked-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

> 
>>
>>> ---
>>>   drivers/gpu/drm/display/drm_dp_mst_topology.c | 10 +++++++---
>>>   include/drm/display/drm_dp_helper.h           | 13 +++++++++++++
>>>   2 files changed, 20 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
>>> index 000d05e80352a..8ca01a6bf645d 100644
>>> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
>>> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
>>> @@ -3585,14 +3585,18 @@ static int drm_dp_send_up_ack_reply(struct drm_dp_mst_topology_mgr *mgr,
>>>   fixed20_12 drm_dp_get_vc_payload_bw(const struct drm_dp_mst_topology_mgr *mgr,
>>>   				    int link_rate, int link_lane_count)
>>>   {
>>> +	int ch_coding_efficiency =
>>> +		drm_dp_bw_channel_coding_efficiency(drm_dp_is_uhbr_rate(link_rate));
>>>   	fixed20_12 ret;
>>>   
>>>   	if (link_rate == 0 || link_lane_count == 0)
>>>   		drm_dbg_kms(mgr->dev, "invalid link rate/lane count: (%d / %d)\n",
>>>   			    link_rate, link_lane_count);
>>>   
>>> -	/* See DP v2.0 2.6.4.2, VCPayload_Bandwidth_for_OneTimeSlotPer_MTP_Allocation */
>>> -	ret.full = dfixed_const(link_rate * link_lane_count / 54000);
>>> +	/* See DP v2.0 2.6.4.2, 2.7.6.3 VCPayload_Bandwidth_for_OneTimeSlotPer_MTP_Allocation */
>>> +	ret.full = DIV_ROUND_DOWN_ULL(mul_u32_u32(link_rate * link_lane_count,
>>> +						  ch_coding_efficiency),
>>> +				      (1000000ULL * 8 * 5400) >> 12);
>>>   
>>>   	return ret;
>>>   }
>>> @@ -4342,7 +4346,7 @@ int drm_dp_atomic_find_time_slots(struct drm_atomic_state *state,
>>>   		}
>>>   	}
>>>   
>>> -	req_slots = DIV_ROUND_UP(pbn, dfixed_trunc(topology_state->pbn_div));
>>> +	req_slots = DIV_ROUND_UP(dfixed_const(pbn), topology_state->pbn_div.full);
>>>   
>>>   	drm_dbg_atomic(mgr->dev, "[CONNECTOR:%d:%s] [MST PORT:%p] TU %d -> %d\n",
>>>   		       port->connector->base.id, port->connector->name,
>>> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
>>> index c5f1079acb3b1..863b2e7add29e 100644
>>> --- a/include/drm/display/drm_dp_helper.h
>>> +++ b/include/drm/display/drm_dp_helper.h
>>> @@ -252,6 +252,19 @@ drm_edp_backlight_supported(const u8 edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE])
>>>   	return !!(edp_dpcd[1] & DP_EDP_TCON_BACKLIGHT_ADJUSTMENT_CAP);
>>>   }
>>>   
>>> +/**
>>> + * drm_dp_is_uhbr_rate - Determine if a link rate is UHBR
>>> + * @link_rate: link rate in 10kbits/s units
>>> + *
>>> + * Determine if the provided link rate is an UHBR rate.
>>> + *
>>> + * Returns: %True if @link_rate is an UHBR rate.
>>> + */
>>> +static inline bool drm_dp_is_uhbr_rate(int link_rate)
>>> +{
>>> +	return link_rate >= 1000000;
>>> +}
>>> +
>>>   /*
>>>    * DisplayPort AUX channel
>>>    */
>>> -- 
>>> 2.39.2
>>
>> -- 
>> Ville Syrjälä
>> Intel
