Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6159FF811
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2025 11:30:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E51810E4C8;
	Thu,  2 Jan 2025 10:30:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qzb7k/au";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 003C410E406;
 Thu,  2 Jan 2025 10:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735813839; x=1767349839;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=BJnXMdz4Wt6keyowj70V0S5obEIxnEQtWLQOkciTY9A=;
 b=Qzb7k/au1dP9QUMviDU8RwR2YM5TeS6+rDMJ0FqiRMRRt112IO3Q2I1/
 jhenlWKKpKINBBG1o0YlkpZHVcCfVuT9XJ/C55z1dIbkEWZ/ZoBOeotVu
 8Ajv6N0H9PrhUnqSfuBaU9Mck48iHu4BaUQoyYZSEPSsZwL26DjvjiW0Z
 kAFyLGlAmp8rEuVXl8L80hr8mBbjnsoLko6j+DP1k2wA2+PRTv55YZLGt
 8KHVpOKzlzTRr3bHbVVMKM6UxPDeTtLhx4e65Vqblra3yAN8SK/xyWp2A
 vAqUTgZe7R4nyjc9ja79AJjW+FCDKRlU1EEFAabUYLZMvMDP8EU6HPyLT g==;
X-CSE-ConnectionGUID: o8E6bAzKTL+N5lC/3qL8uA==
X-CSE-MsgGUID: wk5fLSjbTimrD4uT9S2qWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="23635167"
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; d="scan'208";a="23635167"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2025 02:30:38 -0800
X-CSE-ConnectionGUID: CjLXBsT3Q2+0HeB1d4Fp9g==
X-CSE-MsgGUID: wFsXni1UTxCc+U91j6oEKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="132414135"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.212])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2025 02:30:37 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: imre.deak@intel.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 07/16] drm/i915/mst: adapt
 intel_dp_mtp_tu_compute_config() for 128b/132b SST
In-Reply-To: <Z3QY1txezARd21LY@ideak-desk.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1734643485.git.jani.nikula@intel.com>
 <d08257a340e685679a1ae89f180e6eadf5164bcc.1734643485.git.jani.nikula@intel.com>
 <Z3QY1txezARd21LY@ideak-desk.fi.intel.com>
Date: Thu, 02 Jan 2025 12:30:34 +0200
Message-ID: <87a5c9o6d1.fsf@intel.com>
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
> On Thu, Dec 19, 2024 at 11:33:56PM +0200, Jani Nikula wrote:
>> Handle 128b/132b SST in intel_dp_mtp_tu_compute_config(). The remote
>> bandwidth overhead and time slot allocation are only relevant for MST;
>> SST only needs the local bandwidth and a check that 64 slots isn't
>> exceeded.
>> 
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/i915/display/intel_dp_mst.c | 109 +++++++++++---------
>>  1 file changed, 61 insertions(+), 48 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
>> index d08824d2fefe..3fbf9163272b 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
>> @@ -257,10 +257,7 @@ int intel_dp_mtp_tu_compute_config(struct intel_dp *intel_dp,
>>  
>>  	for (bpp = max_bpp; bpp >= min_bpp; bpp -= step) {
>>  		int local_bw_overhead;
>> -		int remote_bw_overhead;
>>  		int link_bpp_x16;
>> -		int remote_tu;
>> -		fixed20_12 pbn;
>>  
>>  		drm_dbg_kms(display->drm, "Trying bpp %d\n", bpp);
>>  
>> @@ -269,57 +266,73 @@ int intel_dp_mtp_tu_compute_config(struct intel_dp *intel_dp,
>>  
>>  		local_bw_overhead = intel_dp_mst_bw_overhead(crtc_state,
>>  							     false, dsc_slice_count, link_bpp_x16);
>> -		remote_bw_overhead = intel_dp_mst_bw_overhead(crtc_state,
>> -							      true, dsc_slice_count, link_bpp_x16);
>> -
>>  		intel_dp_mst_compute_m_n(crtc_state,
>>  					 local_bw_overhead,
>>  					 link_bpp_x16,
>>  					 &crtc_state->dp_m_n);
>>  
>> -		/*
>> -		 * The TU size programmed to the HW determines which slots in
>> -		 * an MTP frame are used for this stream, which needs to match
>> -		 * the payload size programmed to the first downstream branch
>> -		 * device's payload table.
>> -		 *
>> -		 * Note that atm the payload's PBN value DRM core sends via
>> -		 * the ALLOCATE_PAYLOAD side-band message matches the payload
>> -		 * size (which it calculates from the PBN value) it programs
>> -		 * to the first branch device's payload table. The allocation
>> -		 * in the payload table could be reduced though (to
>> -		 * crtc_state->dp_m_n.tu), provided that the driver doesn't
>> -		 * enable SSC on the corresponding link.
>> -		 */
>> -		pbn.full = dfixed_const(intel_dp_mst_calc_pbn(adjusted_mode->crtc_clock,
>> -							      link_bpp_x16,
>> -							      remote_bw_overhead));
>> -		remote_tu = DIV_ROUND_UP(pbn.full, pbn_div.full);
>> -
>> -		/*
>> -		 * Aligning the TUs ensures that symbols consisting of multiple
>> -		 * (4) symbol cycles don't get split between two consecutive
>> -		 * MTPs, as required by Bspec.
>> -		 * TODO: remove the alignment restriction for 128b/132b links
>> -		 * on some platforms, where Bspec allows this.
>> -		 */
>> -		remote_tu = ALIGN(remote_tu, 4 / crtc_state->lane_count);
>> -
>> -		/*
>> -		 * Also align PBNs accordingly, since MST core will derive its
>> -		 * own copy of TU from the PBN in drm_dp_atomic_find_time_slots().
>> -		 * The above comment about the difference between the PBN
>> -		 * allocated for the whole path and the TUs allocated for the
>> -		 * first branch device's link also applies here.
>> -		 */
>> -		pbn.full = remote_tu * pbn_div.full;
>> -
>> -		drm_WARN_ON(display->drm, remote_tu < crtc_state->dp_m_n.tu);
>> -		crtc_state->dp_m_n.tu = remote_tu;
>> +		if (intel_dp->is_mst) {
>> +			int remote_bw_overhead;
>> +			int remote_tu;
>> +			fixed20_12 pbn;
>
> Nit: pbn_div is only used for MST, so would (calculate/look it up from
> mst_state) here. Also this MST block could be in a separate function,
> perhaps for symmetry with the SST part in a function too, but this could
> be a follow-up as well. Either way:

I guess I'm just not sure yet which direction this should be taken. It
would be easy enough to add the functions, but is that the right
division? How to handle pbn_div in that case? How is UHBR SST DSC going
to impact all this?

I know I'm kind of weaseling out of fixing this up front, but I also try
to avoid adding stuff that we may have to back out of later.

I think I'd let this be for now.

> Reviewed-by: Imre Deak <imre.deak@intel.com>

Thanks,
Jani.

>
>> +
>> +			remote_bw_overhead = intel_dp_mst_bw_overhead(crtc_state,
>> +								      true, dsc_slice_count, link_bpp_x16);
>> +
>> +			/*
>> +			 * The TU size programmed to the HW determines which slots in
>> +			 * an MTP frame are used for this stream, which needs to match
>> +			 * the payload size programmed to the first downstream branch
>> +			 * device's payload table.
>> +			 *
>> +			 * Note that atm the payload's PBN value DRM core sends via
>> +			 * the ALLOCATE_PAYLOAD side-band message matches the payload
>> +			 * size (which it calculates from the PBN value) it programs
>> +			 * to the first branch device's payload table. The allocation
>> +			 * in the payload table could be reduced though (to
>> +			 * crtc_state->dp_m_n.tu), provided that the driver doesn't
>> +			 * enable SSC on the corresponding link.
>> +			 */
>> +			pbn.full = dfixed_const(intel_dp_mst_calc_pbn(adjusted_mode->crtc_clock,
>> +								      link_bpp_x16,
>> +								      remote_bw_overhead));
>> +			remote_tu = DIV_ROUND_UP(pbn.full, pbn_div.full);
>> +
>> +			/*
>> +			 * Aligning the TUs ensures that symbols consisting of multiple
>> +			 * (4) symbol cycles don't get split between two consecutive
>> +			 * MTPs, as required by Bspec.
>> +			 * TODO: remove the alignment restriction for 128b/132b links
>> +			 * on some platforms, where Bspec allows this.
>> +			 */
>> +			remote_tu = ALIGN(remote_tu, 4 / crtc_state->lane_count);
>> +
>> +			/*
>> +			 * Also align PBNs accordingly, since MST core will derive its
>> +			 * own copy of TU from the PBN in drm_dp_atomic_find_time_slots().
>> +			 * The above comment about the difference between the PBN
>> +			 * allocated for the whole path and the TUs allocated for the
>> +			 * first branch device's link also applies here.
>> +			 */
>> +			pbn.full = remote_tu * pbn_div.full;
>> +
>> +			drm_WARN_ON(display->drm, remote_tu < crtc_state->dp_m_n.tu);
>> +			crtc_state->dp_m_n.tu = remote_tu;
>> +
>> +			slots = drm_dp_atomic_find_time_slots(state, &intel_dp->mst_mgr,
>> +							      connector->port,
>> +							      dfixed_trunc(pbn));
>> +		} else {
>> +			/* Same as above for remote_tu */
>> +			crtc_state->dp_m_n.tu = ALIGN(crtc_state->dp_m_n.tu,
>> +						      4 / crtc_state->lane_count);
>> +
>> +			if (crtc_state->dp_m_n.tu <= 64)
>> +				slots = crtc_state->dp_m_n.tu;
>> +			else
>> +				slots = -EINVAL;
>> +		}
>>  
>> -		slots = drm_dp_atomic_find_time_slots(state, &intel_dp->mst_mgr,
>> -						      connector->port,
>> -						      dfixed_trunc(pbn));
>>  		if (slots == -EDEADLK)
>>  			return slots;
>>  
>> -- 
>> 2.39.5
>> 

-- 
Jani Nikula, Intel
