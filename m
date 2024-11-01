Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E499B8DBE
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2024 10:22:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93A2110E405;
	Fri,  1 Nov 2024 09:22:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T4g5MXr8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A370310E21D;
 Fri,  1 Nov 2024 09:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730452946; x=1761988946;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=bTGvYe562v4iO/ej2FrV7MW9IE5/LvMsQygTJKb+YdY=;
 b=T4g5MXr8nxubm8MBQIX74RTjTyWgfn850ILgsStS+RWAyn9fEH9dzKMM
 JUJMxHeXVaMWynUoPhHNj6s7G9krlKDFzfTBPXQ1vtK3z0RluJ9mdrXvf
 QCpfXnbzVUJsm/LeTwQizJpO9Zxa1/0wIXm+yAe3nwFunIA7YPaq6enAk
 7d5Sd+Gaq2E/Ul6XEAFFQlqtSMIHpyp7k81p83FHPG4GI3w3C2Nf7azKM
 xQkKjaIAD+CzyXkmuTZda9/i2sounkZ2a5DFRTP8oQwNVmxdK6QObTaw0
 10IDoHvzU7kGsaESkuIEqHD6x14NFJx21LQeFeZajIDbVeckqqMqjKx9r w==;
X-CSE-ConnectionGUID: cpdezEzpT/+6q/F32TjWSQ==
X-CSE-MsgGUID: SZ68p8kNQi6AGW71dHvh4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="40844918"
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; d="scan'208";a="40844918"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2024 02:22:25 -0700
X-CSE-ConnectionGUID: D+IpKCtRTomwlwGuBOc3FQ==
X-CSE-MsgGUID: y8duOdhSQS2qYZJsphVRQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; d="scan'208";a="87508070"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.234])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2024 02:22:16 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: imre.deak@intel.com, Abel Vesa <abel.vesa@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Karol Herbst
 <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, Danilo Krummrich
 <dakr@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH RFC 1/4] drm/dp: Add helper to set LTTPRs in transparent
 mode
In-Reply-To: <ZyPxLpykHkO9Xx_R@ideak-desk.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-0-cafbb9855f40@linaro.org>
 <20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-1-cafbb9855f40@linaro.org>
 <ZyPxLpykHkO9Xx_R@ideak-desk.fi.intel.com>
Date: Fri, 01 Nov 2024 11:22:13 +0200
Message-ID: <87msijjol6.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 31 Oct 2024, Imre Deak <imre.deak@intel.com> wrote:
> On Thu, Oct 31, 2024 at 05:12:45PM +0200, Abel Vesa wrote:
>> According to the DisplayPort standard, LTTPRs have two operating
>> modes:
>>  - non-transparent - it replies to DPCD LTTPR field specific AUX
>>    requests, while passes through all other AUX requests
>>  - transparent - it passes through all AUX requests.
>> 
>> Switching between this two modes is done by the DPTX by issuing
>> an AUX write to the DPCD PHY_REPEATER_MODE register.
>> 
>> Add a generic helper that allows switching between these modes.
>> 
>> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
>> ---
>>  drivers/gpu/drm/display/drm_dp_helper.c | 17 +++++++++++++++++
>>  include/drm/display/drm_dp_helper.h     |  1 +
>>  2 files changed, 18 insertions(+)
>> 
>> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
>> index 6ee51003de3ce616c3a52653c2f1979ad7658e21..38d612345986ad54b42228902ea718a089d169c4 100644
>> --- a/drivers/gpu/drm/display/drm_dp_helper.c
>> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
>> @@ -2694,6 +2694,23 @@ int drm_dp_lttpr_max_link_rate(const u8 caps[DP_LTTPR_COMMON_CAP_SIZE])
>>  }
>>  EXPORT_SYMBOL(drm_dp_lttpr_max_link_rate);
>>  
>> +/**
>> + * drm_dp_lttpr_set_transparent_mode - set the LTTPR in transparent mode
>> + * @aux: DisplayPort AUX channel
>> + * @enable: Enable or disable transparent mode
>> + *
>> + * Returns 0 on success or a negative error code on failure.
>
> Should be "Returns 1 on success".

But is that a sensible return value?

>
>> + */
>> +

Superfluous newline.

>> +int drm_dp_lttpr_set_transparent_mode(struct drm_dp_aux *aux, bool enable)
>> +{
>> +	u8 val = enable ? DP_PHY_REPEATER_MODE_TRANSPARENT :
>> +			  DP_PHY_REPEATER_MODE_NON_TRANSPARENT;
>> +
>> +	return drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE, val);
>> +}
>> +EXPORT_SYMBOL(drm_dp_lttpr_set_transparent_mode);
>> +
>>  /**
>>   * drm_dp_lttpr_max_lane_count - get the maximum lane count supported by all LTTPRs
>>   * @caps: LTTPR common capabilities
>> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
>> index 279624833ea9259809428162f4e845654359f8c9..8821ab2d36b0e04d38ccbdddcb703b34de7ed680 100644
>> --- a/include/drm/display/drm_dp_helper.h
>> +++ b/include/drm/display/drm_dp_helper.h
>> @@ -625,6 +625,7 @@ int drm_dp_read_lttpr_phy_caps(struct drm_dp_aux *aux,
>>  			       u8 caps[DP_LTTPR_PHY_CAP_SIZE]);
>>  int drm_dp_lttpr_count(const u8 cap[DP_LTTPR_COMMON_CAP_SIZE]);
>>  int drm_dp_lttpr_max_link_rate(const u8 caps[DP_LTTPR_COMMON_CAP_SIZE]);
>> +int drm_dp_lttpr_set_transparent_mode(struct drm_dp_aux *aux, bool enable);
>>  int drm_dp_lttpr_max_lane_count(const u8 caps[DP_LTTPR_COMMON_CAP_SIZE]);
>>  bool drm_dp_lttpr_voltage_swing_level_3_supported(const u8 caps[DP_LTTPR_PHY_CAP_SIZE]);
>>  bool drm_dp_lttpr_pre_emphasis_level_3_supported(const u8 caps[DP_LTTPR_PHY_CAP_SIZE]);
>> 
>> -- 
>> 2.34.1
>> 

-- 
Jani Nikula, Intel
