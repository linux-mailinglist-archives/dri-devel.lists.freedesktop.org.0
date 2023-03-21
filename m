Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 641B56C34BD
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 15:50:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A691610E1E2;
	Tue, 21 Mar 2023 14:49:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FA1910E19F;
 Tue, 21 Mar 2023 14:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679410194; x=1710946194;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=eRAFR/qcwgM/Bd21tuNdHgplz3q4bOh8y3Ms0CS8VSs=;
 b=UdRNwzIPOZHsyWGL/tbL4U2tiyOzSziTPFeNQLIUcHiCTlyGnEhouesz
 RCJ96P4kxw0lX74YvQHmIODTnqgLXgKCGe8kG6pcnouIXnBT2Mh/zM4cJ
 cVUugbRyBljZX8wxZqd+fpejttWbeNSbZhJ3V4MIYFUzWFE2pK7TeeVOY
 LAaZ01HVGxsB3mpxDpmKDPB7+zqc7CGQy2CUj99PWc97EqoGmpuBuqW9a
 L4G+panUKtzXrJ3jaZnnHQ5QAvW30eJtUvmwvSOcJo91CJnpYK1uTqHst
 j4j1rk4MVTarlgpWyy15rHJHS6YnprxCHK6Er3PK/xqWIgxjK2rvun9rl w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="327335473"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="327335473"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 07:49:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="792113254"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="792113254"
Received: from trybicki-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.63.119])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 07:49:51 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Arun R Murthy <arun.r.murthy@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCHv4 2/2] i915/display/dp: SDP CRC16 for 128b132b link layer
In-Reply-To: <87lek9rkov.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230302081532.765821-1-arun.r.murthy@intel.com>
 <20230302081532.765821-3-arun.r.murthy@intel.com>
 <87o7p5rkpn.fsf@intel.com> <87lek9rkov.fsf@intel.com>
Date: Tue, 21 Mar 2023 16:49:48 +0200
Message-ID: <87y1nq6twz.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 07 Mar 2023, Jani Nikula <jani.nikula@intel.com> wrote:
> On Tue, 07 Mar 2023, Jani Nikula <jani.nikula@intel.com> wrote:
>> On Thu, 02 Mar 2023, Arun R Murthy <arun.r.murthy@intel.com> wrote:
>>> Enable SDP error detection configuration, this will set CRC16 in
>>> 128b/132b link layer.
>>> For Display version 13 a hardware bit31 in register VIDEO_DIP_CTL is
>>> added to enable/disable SDP CRC applicable for DP2.0 only, but the
>>> default value of this bit will enable CRC16 in 128b/132b hence
>>> skipping this write.
>>> Corrective actions on SDP corruption is yet to be defined.
>>>
>>> v2: Moved the CRC enable to link training init(Jani N)
>>> v3: Moved crc enable to ddi pre enable <Jani N>
>>> v4: Separate function for SDP CRC16 (Jani N)
>>>
>>> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
>>
>> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
>
> PS. I've queued retest on this one, need to wait for results before
> applying.

And finally pushed to drm-intel-next. Thanks for the patches & patience.

BR,
Jani.

>
>
>>
>>> ---
>>>  drivers/gpu/drm/i915/display/intel_ddi.c      |  4 ++++
>>>  .../drm/i915/display/intel_dp_link_training.c | 20 +++++++++++++++++++
>>>  .../drm/i915/display/intel_dp_link_training.h |  2 ++
>>>  3 files changed, 26 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
>>> index e5979427b38b..127b3035f92d 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
>>> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
>>> @@ -2519,6 +2519,10 @@ static void intel_ddi_pre_enable_dp(struct intel_atomic_state *state,
>>>  {
>>>  	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
>>>  
>>> +	if (HAS_DP20(dev_priv))
>>> +		intel_dp_128b132b_sdp_crc16(enc_to_intel_dp(encoder),
>>> +					    crtc_state);
>>> +
>>>  	if (DISPLAY_VER(dev_priv) >= 12)
>>>  		tgl_ddi_pre_enable_dp(state, encoder, crtc_state, conn_state);
>>>  	else
>>> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
>>> index 3d3efcf02011..35d31e4efab9 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
>>> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
>>> @@ -1454,3 +1454,23 @@ void intel_dp_start_link_train(struct intel_dp *intel_dp,
>>>  	if (!passed)
>>>  		intel_dp_schedule_fallback_link_training(intel_dp, crtc_state);
>>>  }
>>> +
>>> +void intel_dp_128b132b_sdp_crc16(struct intel_dp *intel_dp,
>>> +				 const struct intel_crtc_state *crtc_state)
>>> +{
>>> +	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
>>> +
>>> +	/*
>>> +	 * VIDEO_DIP_CTL register bit 31 should be set to '0' to not
>>> +	 * disable SDP CRC. This is applicable for Display version 13.
>>> +	 * Default value of bit 31 is '0' hence discarding the write
>>> +	 * TODO: Corrective actions on SDP corruption yet to be defined
>>> +	 */
>>> +	if (intel_dp_is_uhbr(crtc_state))
>>> +		/* DP v2.0 SCR on SDP CRC16 for 128b/132b Link Layer */
>>> +		drm_dp_dpcd_writeb(&intel_dp->aux,
>>> +				   DP_SDP_ERROR_DETECTION_CONFIGURATION,
>>> +				   DP_SDP_CRC16_128B132B_EN);
>>> +
>>> +	drm_dbg_kms(&i915->drm, "DP2.0 SDP CRC16 for 128b/132b enabled\n");
>>> +}
>>> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.h b/drivers/gpu/drm/i915/display/intel_dp_link_training.h
>>> index 7fa1c0833096..2c8f2775891b 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.h
>>> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.h
>>> @@ -39,4 +39,6 @@ static inline u8 intel_dp_training_pattern_symbol(u8 pattern)
>>>  	return pattern & ~DP_LINK_SCRAMBLING_DISABLE;
>>>  }
>>>  
>>> +void intel_dp_128b132b_sdp_crc16(struct intel_dp *intel_dp,
>>> +				 const struct intel_crtc_state *crtc_state);
>>>  #endif /* __INTEL_DP_LINK_TRAINING_H__ */

-- 
Jani Nikula, Intel Open Source Graphics Center
