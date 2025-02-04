Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EBAA27677
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 16:51:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A830110E6AC;
	Tue,  4 Feb 2025 15:51:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OV7VlHjR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1DE510E6AC;
 Tue,  4 Feb 2025 15:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738684259; x=1770220259;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=j9ZDeI08NIbiOXaAmlKMhw+kP9Z2Hchl6VBImHiDQ1M=;
 b=OV7VlHjRWY43r50KZ4P4RhR8jGo8gbzhUbFPqZmciMQeUkLN/AcFzqKp
 3HkQhdnlLPn5/4X4TC0uyVjX+9j4h7zWUGe0FlaP0aOR2a/1OQisfT4Xs
 FxgleX8g9RR+WCWTZ4CzwhYcJTMRtjgjZjUo74P+pyBPIFUJPOQRZ9/c/
 ILBaYlYHhAKf2ndUOckuxIz1bzil9/e3ixa/0yjjtqJW/Vmym2q2iGMv5
 NClU1AmM/lP6R3qi6XBAZBZ1SGpp3/G2qf88aqiVrdmNsbBsMJBDqw7xL
 ycCIcbJ75LSVJ54t4PrsHCe20jvOYyhTnv/SlN7B45TM4/vwoLdNI8egd g==;
X-CSE-ConnectionGUID: Y7jijqaHSnqpWLDOC9/Ygg==
X-CSE-MsgGUID: PD1wArLGT8y4/wDHpvzOVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="49869809"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="49869809"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 07:50:58 -0800
X-CSE-ConnectionGUID: VD80o8uYS0yldunGLarMzQ==
X-CSE-MsgGUID: f1Dx/b++TwKwqBiYfni1sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="115816338"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.139])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 07:50:56 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: imre.deak@intel.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 16/16] drm/i915/dp: compute config for 128b/132b SST
 w/o DSC
In-Reply-To: <Z6I0knh2Kt5T0JrT@ideak-desk.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1734643485.git.jani.nikula@intel.com>
 <b239079a989ce11d60e9467cb1125bc2033ae0bd.1734643485.git.jani.nikula@intel.com>
 <Z6I0knh2Kt5T0JrT@ideak-desk.fi.intel.com>
Date: Tue, 04 Feb 2025 17:50:53 +0200
Message-ID: <87ikpp674y.fsf@intel.com>
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

On Tue, 04 Feb 2025, Imre Deak <imre.deak@intel.com> wrote:
> On Thu, Dec 19, 2024 at 11:34:05PM +0200, Jani Nikula wrote:
>> Enable basic 128b/132b SST functionality without compression. Reuse
>> intel_dp_mtp_tu_compute_config() to figure out the TU after we've
>> determined we need to use an UHBR rate.
>> 
>> It's slightly complicated as the M/N computation is done in different
>> places in MST and SST paths, so we need to avoid trashing the values
>> later for UHBR.
>> 
>> If uncompressed UHBR fails, we drop to compressed non-UHBR, which is
>> quite likely to fail as well. We still lack 128b/132b SST+DSC.
>> 
>> We need mst_master_transcoder also for 128b/132b SST. Use cpu_transcoder
>> directly. Enhanced framing is "don't care" for 128b/132b link.
>> 
>> v2: mst_master_transcoder, enhanced framing (Imre)
>> 
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/i915/display/intel_dp.c | 34 +++++++++++++++++--------
>>  1 file changed, 24 insertions(+), 10 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
>> index fba3af338280..d14a42f02ba8 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
>> @@ -2525,8 +2525,8 @@ intel_dp_compute_config_limits(struct intel_dp *intel_dp,
>>  	limits->min_rate = intel_dp_min_link_rate(intel_dp);
>>  	limits->max_rate = intel_dp_max_link_rate(intel_dp);
>>  
>> -	/* FIXME 128b/132b SST support missing */
>> -	if (!is_mst)
>> +	/* FIXME 128b/132b SST+DSC support missing */
>> +	if (!is_mst && dsc)
>>  		limits->max_rate = min(limits->max_rate, 810000);
>>  	limits->min_rate = min(limits->min_rate, limits->max_rate);
>>  
>> @@ -2640,6 +2640,13 @@ intel_dp_compute_link_config(struct intel_encoder *encoder,
>>  		 */
>>  		ret = intel_dp_compute_link_config_wide(intel_dp, pipe_config,
>>  							conn_state, &limits);
>> +		if (!ret && intel_dp_is_uhbr(pipe_config))
>> +			ret = intel_dp_mtp_tu_compute_config(intel_dp,
>> +							     pipe_config,
>> +							     pipe_config->pipe_bpp,
>> +							     pipe_config->pipe_bpp,
>> +							     conn_state,
>> +							     0, false);
>
> Missed this in my review: intel_dp_mtp_tu_compute_config() for this to
> work, it needs to handle step == 0, i.e. if (step == 0) break; at the
> end of the bpp loop.

Right, good catch!

I wanted to pass 0 step to be explicit about doing it just once, but it
really only happens once if it succeeds! Otherwise it results in an
infinite loop.

Fix on the list.

Thanks,
Jani.

>
>>  		if (ret)
>>  			dsc_needed = true;
>>  	}
>> @@ -3148,8 +3155,13 @@ intel_dp_compute_config(struct intel_encoder *encoder,
>>  	pipe_config->limited_color_range =
>>  		intel_dp_limited_color_range(pipe_config, conn_state);
>>  
>> -	pipe_config->enhanced_framing =
>> -		drm_dp_enhanced_frame_cap(intel_dp->dpcd);
>> +	if (intel_dp_is_uhbr(pipe_config)) {
>> +		/* 128b/132b SST also needs this */
>> +		pipe_config->mst_master_transcoder = pipe_config->cpu_transcoder;
>> +	} else {
>> +		pipe_config->enhanced_framing =
>> +			drm_dp_enhanced_frame_cap(intel_dp->dpcd);
>> +	}
>>  
>>  	if (pipe_config->dsc.compression_enable)
>>  		link_bpp_x16 = pipe_config->dsc.compressed_bpp_x16;
>> @@ -3180,12 +3192,14 @@ intel_dp_compute_config(struct intel_encoder *encoder,
>>  
>>  	intel_dp_audio_compute_config(encoder, pipe_config, conn_state);
>>  
>> -	intel_link_compute_m_n(link_bpp_x16,
>> -			       pipe_config->lane_count,
>> -			       adjusted_mode->crtc_clock,
>> -			       pipe_config->port_clock,
>> -			       intel_dp_bw_fec_overhead(pipe_config->fec_enable),
>> -			       &pipe_config->dp_m_n);
>> +	if (!intel_dp_is_uhbr(pipe_config)) {
>> +		intel_link_compute_m_n(link_bpp_x16,
>> +				       pipe_config->lane_count,
>> +				       adjusted_mode->crtc_clock,
>> +				       pipe_config->port_clock,
>> +				       intel_dp_bw_fec_overhead(pipe_config->fec_enable),
>> +				       &pipe_config->dp_m_n);
>> +	}
>>  
>>  	/* FIXME: abstract this better */
>>  	if (pipe_config->splitter.enable)
>> -- 
>> 2.39.5
>> 

-- 
Jani Nikula, Intel
