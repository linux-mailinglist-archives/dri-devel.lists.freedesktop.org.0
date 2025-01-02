Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1A99FF871
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2025 11:52:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 726E110E4E0;
	Thu,  2 Jan 2025 10:52:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bE0cew1D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FB2810E40F;
 Thu,  2 Jan 2025 10:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735815164; x=1767351164;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=tDuaHu6rJ8Z7a8v9QzdiwLCLE0Q8k68D8SAllq1iJrY=;
 b=bE0cew1DcNH0aQ6699VemH4p3v8UWjbw4+tOU1j8PAVhhEIGkdvTwVUX
 uJnvGfMrXS+xeh5nqzxjZz0SaqgirUQIwDtCHnGhhjGajX9JNLavtVIvS
 m0vt+q7hcE8iKJx16jTE/SR5ew1SOoxZ31SO3tfkKJ40M0TMmdOkC3bTy
 3frnsdoRhT146fY69w/TBWLLDbFK4zscQuq9E43DyksyX/OK4041c0SyJ
 ywZTX+x7D9Oe8WhYHKRAeec4mXoXwGS9646p34M865RGkKTH6o2LuQvTw
 2lBs0tjswSkANhJNkVTNFXZZh2Lsko1WOXVmxaGZmrvMjUtFMS7l6ZI7y Q==;
X-CSE-ConnectionGUID: 56LzjCqzT3i4srHBKP1BGA==
X-CSE-MsgGUID: YTMeq16GR4C8xFP5sS9XTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="35949962"
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; d="scan'208";a="35949962"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2025 02:52:43 -0800
X-CSE-ConnectionGUID: L+FVdSFuTmOH3at+o8dIzQ==
X-CSE-MsgGUID: gsnzOvFTSo+gQR6lqKawUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="138803685"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.212])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2025 02:52:42 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: imre.deak@intel.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 10/16] drm/i915/ddi: write payload for 128b/132b SST
In-Reply-To: <Z3QerVHWpJ5aN8eT@ideak-desk.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1734643485.git.jani.nikula@intel.com>
 <5ce97e5f6c2dd4d5ee3181b2d4ed968eb806534c.1734643485.git.jani.nikula@intel.com>
 <Z3QerVHWpJ5aN8eT@ideak-desk.fi.intel.com>
Date: Thu, 02 Jan 2025 12:52:38 +0200
Message-ID: <877c7do5c9.fsf@intel.com>
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
> On Thu, Dec 19, 2024 at 11:33:59PM +0200, Jani Nikula wrote:
>> Write the payload allocation table for 128b/132b SST. Use VCPID 1 and
>> start from slot 0, with dp_m_n.tu slots.
>> 
>> This is preparation for enabling 128b/132b SST. This path is not
>> reachable yet. Indeed, we don't yet compute TU for 128b/132b SST.
>> 
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/i915/display/intel_ddi.c | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>> 
>> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
>> index 6f813bf85b23..64528ff8856e 100644
>> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
>> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
>> @@ -2669,6 +2669,12 @@ static void mtl_ddi_pre_enable_dp(struct intel_atomic_state *state,
>>  	/* 6.o Configure and enable FEC if needed */
>>  	intel_ddi_enable_fec(encoder, crtc_state);
>>  
>> +	/* 7.a 128b/132b SST. */
>> +	if (!is_mst && intel_dp_is_uhbr(crtc_state)) {
>> +		/* VCPID 1, start slot 0 for 128b/132b, tu slots */
>> +		drm_dp_dpcd_write_payload(&intel_dp->aux, 1, 0, crtc_state->dp_m_n.tu);
>
> I would handle the error by sending a modeset retry uevent. Either way:

Mmmh. The MST code calls intel_dp_queue_modeset_retry_for_link() in
response to drm_dp_add_payload_part{1,2}() failures, but nothing
else. As in, we don't do anything else (we just plunge on with the
enable), and we don't even do that much in response to any other errors.

Our options are limited anyway.

Arguably the MST path payload update has more failure modes than SST,
but you'd like to do this:

	ret = drm_dp_dpcd_write_payload(&intel_dp->aux, 1, 0, crtc_state->dp_m_n.tu);
	if (ret < 0)
		intel_dp_queue_modeset_retry_for_link(state, encoder, crtc_state);

in mtl_ddi_pre_enable_dp() and tgl_ddi_pre_enable_dp()?

Overall I'm wondering if this too needs an overhaul. Instead of queueing
the retry all over the place, maybe we should just flag it in
crtc_state, and have intel_atomic_cleanup_work() do it once afterwards?


BR,
Jani.

>
> Reviewed-by: Imre Deak <imre.deak@intel.com>
>
>> +	}
>> +
>>  	if (!is_mst)
>>  		intel_dsc_dp_pps_write(encoder, crtc_state);
>>  }
>> @@ -2808,6 +2814,11 @@ static void tgl_ddi_pre_enable_dp(struct intel_atomic_state *state,
>>  	/* 7.l Configure and enable FEC if needed */
>>  	intel_ddi_enable_fec(encoder, crtc_state);
>>  
>> +	if (!is_mst && intel_dp_is_uhbr(crtc_state)) {
>> +		/* VCPID 1, start slot 0 for 128b/132b, tu slots */
>> +		drm_dp_dpcd_write_payload(&intel_dp->aux, 1, 0, crtc_state->dp_m_n.tu);
>> +	}
>> +
>>  	if (!is_mst)
>>  		intel_dsc_dp_pps_write(encoder, crtc_state);
>>  }
>> -- 
>> 2.39.5
>> 

-- 
Jani Nikula, Intel
