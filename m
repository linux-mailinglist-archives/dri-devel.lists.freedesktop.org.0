Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DFB9FF787
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2025 10:39:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42A7110E3E7;
	Thu,  2 Jan 2025 09:39:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LjC3QHUN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91F2610E3E8;
 Thu,  2 Jan 2025 09:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735810753; x=1767346753;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=jCBDl8+EpK2lmeC/Ohb+BmkI3r9Bhl5cey3sCG3MBAQ=;
 b=LjC3QHUNi5ZqL0YXBq1sSeVDge/Z4EKY88CfiDhPAcEXY54rVSrnThHu
 hYb97rodFf1WySkiG++OPZcbfO7EV20JVAysUzEPbyfpr5JCczKzfI+J+
 uXACnBnwGdAyU7WlejnnZAJTKa7qjL1/pgKyZLcASW1NJUCM50t4LPwLi
 qHrTxmw1qWaBy7kOO4S5tkWABpebf31Y4eNm9yL26Cz1jYwfJTWeNGqBl
 s54ZNzXeLFo2/AibTjDHFErjfAmcoiT2DB2+an2fbvJaITDsGvxt1Zf/O
 0iDxWPrIC4ILaQmiQsMrgp+nRcGBC7Yo++0M0zFfjvUMH1kBXvVfM+khG w==;
X-CSE-ConnectionGUID: vZb58e2GTRmvXDGcHDQZcQ==
X-CSE-MsgGUID: zxeXG9bRQDWcm2VrBZ+G2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="46715379"
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; d="scan'208";a="46715379"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2025 01:39:12 -0800
X-CSE-ConnectionGUID: oqYzU2H6Sgq5v7vli7I1fg==
X-CSE-MsgGUID: mJaCb7gZQgOnG8Pt7tAyXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; d="scan'208";a="101956218"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.212])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2025 01:39:10 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: imre.deak@intel.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 11/16] drm/i915/ddi: initialize 128b/132b SST DP2
 VFREQ registers
In-Reply-To: <Z3QhMxIylsbgAN-2@ideak-desk.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1734643485.git.jani.nikula@intel.com>
 <38cfa6554f8249605a8af98353f64c6b53d1d106.1734643485.git.jani.nikula@intel.com>
 <Z3QhMxIylsbgAN-2@ideak-desk.fi.intel.com>
Date: Thu, 02 Jan 2025 11:39:07 +0200
Message-ID: <87frm1o8qs.fsf@intel.com>
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

On Tue, 31 Dec 2024, Imre Deak <imre.deak@intel.com> wrote:
> On Thu, Dec 19, 2024 at 11:34:00PM +0200, Jani Nikula wrote:
>> Write the DP2 specific VFREQ registers.
>> 
>> This is preparation for enabling 128b/132b SST. This path is not
>> reachable yet.
>> 
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/i915/display/intel_ddi.c | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>> 
>> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
>> index 64528ff8856e..91e6cd91e91f 100644
>> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
>> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
>> @@ -3467,8 +3467,20 @@ static void intel_ddi_enable(struct intel_atomic_state *state,
>>  {
>>  	struct intel_display *display = to_intel_display(encoder);
>>  	struct intel_crtc *pipe_crtc;
>> +	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
>>  	int i;
>>  
>> +	/* 128b/132b SST */
>> +	if (intel_dp_is_uhbr(crtc_state)) {
>
> Hm, not sure how this would work on HDMI (FRL), but to be sure shouldn't
> this check that crtc_state is for a DP (SST) mode?

DP MST does not call intel_ddi_enable().

Yes, it's all very subtle, and I hate the way all of the
DDI/SST/MST/etc. is intertwined, but I feel like it's overall a bigger
refactoring to clean up.

BR,
Jani.


>
>> +		const struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
>> +		u64 crtc_clock_hz = KHz(adjusted_mode->crtc_clock);
>> +
>> +		intel_de_write(display, TRANS_DP2_VFREQHIGH(cpu_transcoder),
>> +			       TRANS_DP2_VFREQ_PIXEL_CLOCK(crtc_clock_hz >> 24));
>> +		intel_de_write(display, TRANS_DP2_VFREQLOW(cpu_transcoder),
>> +			       TRANS_DP2_VFREQ_PIXEL_CLOCK(crtc_clock_hz & 0xffffff));
>> +	}
>> +
>>  	intel_ddi_enable_transcoder_func(encoder, crtc_state);
>>  
>>  	/* Enable/Disable DP2.0 SDP split config before transcoder */
>> -- 
>> 2.39.5
>> 

-- 
Jani Nikula, Intel
