Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D593F6C7B0E
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 10:20:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FD3410E521;
	Fri, 24 Mar 2023 09:20:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7331E10E521;
 Fri, 24 Mar 2023 09:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679649629; x=1711185629;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=EnM6oLlmqo28fPAyEQkb4IdUToddJ0eIiox3un89s2g=;
 b=UQutKfX9BQtwxlmMmAx3vxE2JNCUm6w44AsiZ6yqaSn6hTkNvs3S1Snm
 46sif8IIuXUPe4ZtXZKwtQ59ZWuggiGRFP1Co/ljxylRzhAUWxjpFB7w8
 R6p9T7UnHEa/CTySmHNXu2rgpOsE5teQCeitxiXegp1uV04Azj4VQkFnM
 wZLXtsU0JWvFPjUJ68MFKqH8Ax4UIyiGlXy0i3ynSkrHbWm9JtoHUuny0
 M2Gr6+1+IebWcomBybbQLiLNkjGbcTOgJTfMVoFX2F8M8Szvfo0JOD24D
 LVEcvyvDJmPDk1IPO1DsYbiWqq0dvC7CAZXB/fPZAnNU2RDZD8D7YGoMm Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="402321066"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; d="scan'208";a="402321066"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 02:20:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="632777114"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; d="scan'208";a="632777114"
Received: from yanluwan-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.48.159])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 02:20:27 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, Alan Previn
 <alan.previn.teres.alexis@intel.com>, intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH v5] drm/i915/pxp: limit drm-errors or
 warning on firmware API failures
In-Reply-To: <3a0bf008-da85-8334-33d6-784c2ece54af@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230323184156.4140659-1-alan.previn.teres.alexis@intel.com>
 <3a0bf008-da85-8334-33d6-784c2ece54af@intel.com>
Date: Fri, 24 Mar 2023 11:20:24 +0200
Message-ID: <87o7oi5wvb.fsf@intel.com>
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
Cc: Eero T Tamminen <eero.t.tamminen@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 23 Mar 2023, "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com> wrote:
> On 3/23/2023 11:41 AM, Alan Previn wrote:
>> MESA driver is creating protected context on every driver handle
>> creation to query caps bits for app. So when running CI tests,
>> they are observing hundreds of drm_errors when enabling PXP
>> in .config but using SOC fusing or BIOS configuration that cannot
>> support PXP sessions.
>>
>> The fixes tag referenced below was to resolve a related issue
>> where we wanted to silence error messages, but that case was due
>> to outdated IFWI (firmware) that definitely needed an upgrade and
>> was, at that point, considered a one-off case as opposed to today's
>> realization that default CI was enabling PXP in kernel config for
>> all testing.
>>
>> So with this patch, let's strike a balance between issues that is
>> critical but are root-caused from HW/platform gaps (louder drm-warn
>> but just ONCE) vs other cases where it could also come from session
>> state machine (which cannot be a WARN_ONCE since it can be triggered
>> due to runtime operation events).
>>
>> Let's use helpers for these so as more functions are added in future
>> features / HW (or as FW designers continue to bless upstreaming of
>> the error codes and meanings), we only need to update the helpers.
>>
>> NOTE: Don't completely remove FW errors (via drm_debug) or else cusomer
>> apps that really needs to know that content protection failed won't
>> be aware of it.
>>
>> v2: - Add fixes tag (Trvtko)
>> v3: - Break multi-line drm_dbg strings into separate drm_dbg (Daniele)
>>      - Fix couple of typecasting nits (Daniele)
>> v4: - Unsuccessful PXP FW cmd due to platform configuration shouldn't
>>        use drm_WARN_once (Tvrtko), Switched to use drm_info_once.
>> v5: - Added "reported-and-tested" by Eero.
>>
>> Reported-and-tested-by: Eero Tamminen <eero.t.tamminen@intel.com>
>
> checkpatch seems to not like this tag. Maybe have 2 lines?
>
> Reported-by: ...
> Tested-by: ...

It's not that. It's that checkpatch wants a link to the report
immediately following the Reported-by: or Reported-and-tested-by:.

If you have a link to the report, by all means add it, but it's no big
deal.

BR,
Jani.


>
> Can be fixed while merging.
>
>> Fixes: b762787bf767 ("drm/i915/pxp: Use drm_dbg if arb session failed due to fw version")
>> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
>
> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>
> Daniele
>
>> ---
>>   .../i915/pxp/intel_pxp_cmd_interface_cmn.h    |  3 +
>>   drivers/gpu/drm/i915/pxp/intel_pxp_session.c  |  2 +-
>>   drivers/gpu/drm/i915/pxp/intel_pxp_tee.c      | 77 +++++++++++++++----
>>   3 files changed, 67 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_cmn.h b/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_cmn.h
>> index ae9b151b7cb7..6f6541d5e49a 100644
>> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_cmn.h
>> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_cmn.h
>> @@ -18,6 +18,9 @@
>>   enum pxp_status {
>>   	PXP_STATUS_SUCCESS = 0x0,
>>   	PXP_STATUS_ERROR_API_VERSION = 0x1002,
>> +	PXP_STATUS_NOT_READY = 0x100e,
>> +	PXP_STATUS_PLATFCONFIG_KF1_NOVERIF = 0x101a,
>> +	PXP_STATUS_PLATFCONFIG_KF1_BAD = 0x101f,
>>   	PXP_STATUS_OP_NOT_PERMITTED = 0x4013
>>   };
>>   
>> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
>> index 448cacb0465d..7de849cb6c47 100644
>> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
>> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
>> @@ -74,7 +74,7 @@ static int pxp_create_arb_session(struct intel_pxp *pxp)
>>   
>>   	ret = pxp_wait_for_session_state(pxp, ARB_SESSION, true);
>>   	if (ret) {
>> -		drm_err(&gt->i915->drm, "arb session failed to go in play\n");
>> +		drm_dbg(&gt->i915->drm, "arb session failed to go in play\n");
>>   		return ret;
>>   	}
>>   	drm_dbg(&gt->i915->drm, "PXP ARB session is alive\n");
>> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
>> index d9d248b48093..a2846b1dbbee 100644
>> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
>> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
>> @@ -19,6 +19,37 @@
>>   #include "intel_pxp_tee.h"
>>   #include "intel_pxp_types.h"
>>   
>> +static bool
>> +is_fw_err_platform_config(u32 type)
>> +{
>> +	switch (type) {
>> +	case PXP_STATUS_ERROR_API_VERSION:
>> +	case PXP_STATUS_PLATFCONFIG_KF1_NOVERIF:
>> +	case PXP_STATUS_PLATFCONFIG_KF1_BAD:
>> +		return true;
>> +	default:
>> +		break;
>> +	}
>> +	return false;
>> +}
>> +
>> +static const char *
>> +fw_err_to_string(u32 type)
>> +{
>> +	switch (type) {
>> +	case PXP_STATUS_ERROR_API_VERSION:
>> +		return "ERR_API_VERSION";
>> +	case PXP_STATUS_NOT_READY:
>> +		return "ERR_NOT_READY";
>> +	case PXP_STATUS_PLATFCONFIG_KF1_NOVERIF:
>> +	case PXP_STATUS_PLATFCONFIG_KF1_BAD:
>> +		return "ERR_PLATFORM_CONFIG";
>> +	default:
>> +		break;
>> +	}
>> +	return NULL;
>> +}
>> +
>>   static int intel_pxp_tee_io_message(struct intel_pxp *pxp,
>>   				    void *msg_in, u32 msg_in_size,
>>   				    void *msg_out, u32 msg_out_max_size,
>> @@ -307,15 +338,22 @@ int intel_pxp_tee_cmd_create_arb_session(struct intel_pxp *pxp,
>>   				       &msg_out, sizeof(msg_out),
>>   				       NULL);
>>   
>> -	if (ret)
>> -		drm_err(&i915->drm, "Failed to send tee msg ret=[%d]\n", ret);
>> -	else if (msg_out.header.status == PXP_STATUS_ERROR_API_VERSION)
>> -		drm_dbg(&i915->drm, "PXP firmware version unsupported, requested: "
>> -			"CMD-ID-[0x%08x] on API-Ver-[0x%08x]\n",
>> -			msg_in.header.command_id, msg_in.header.api_version);
>> -	else if (msg_out.header.status != 0x0)
>> -		drm_warn(&i915->drm, "PXP firmware failed arb session init request ret=[0x%08x]\n",
>> -			 msg_out.header.status);
>> +	if (ret) {
>> +		drm_err(&i915->drm, "Failed to send tee msg init arb session, ret=[%d]\n", ret);
>> +	} else if (msg_out.header.status != 0) {
>> +		if (is_fw_err_platform_config(msg_out.header.status)) {
>> +			drm_info_once(&i915->drm,
>> +				      "PXP init-arb-session-%d failed due to BIOS/SOC:0x%08x:%s\n",
>> +				      arb_session_id, msg_out.header.status,
>> +				      fw_err_to_string(msg_out.header.status));
>> +		} else {
>> +			drm_dbg(&i915->drm, "PXP init-arb-session--%d failed 0x%08x:%st:\n",
>> +				arb_session_id, msg_out.header.status,
>> +				fw_err_to_string(msg_out.header.status));
>> +			drm_dbg(&i915->drm, "     cmd-detail: ID=[0x%08x],API-Ver-[0x%08x]\n",
>> +				msg_in.header.command_id, msg_in.header.api_version);
>> +		}
>> +	}
>>   
>>   	return ret;
>>   }
>> @@ -347,10 +385,21 @@ void intel_pxp_tee_end_arb_fw_session(struct intel_pxp *pxp, u32 session_id)
>>   	if ((ret || msg_out.header.status != 0x0) && ++trials < 3)
>>   		goto try_again;
>>   
>> -	if (ret)
>> -		drm_err(&i915->drm, "Failed to send tee msg for inv-stream-key-%d, ret=[%d]\n",
>> +	if (ret) {
>> +		drm_err(&i915->drm, "Failed to send tee msg for inv-stream-key-%u, ret=[%d]\n",
>>   			session_id, ret);
>> -	else if (msg_out.header.status != 0x0)
>> -		drm_warn(&i915->drm, "PXP firmware failed inv-stream-key-%d with status 0x%08x\n",
>> -			 session_id, msg_out.header.status);
>> +	} else if (msg_out.header.status != 0) {
>> +		if (is_fw_err_platform_config(msg_out.header.status)) {
>> +			drm_info_once(&i915->drm,
>> +				      "PXP inv-stream-key-%u failed due to BIOS/SOC :0x%08x:%s\n",
>> +				      session_id, msg_out.header.status,
>> +				      fw_err_to_string(msg_out.header.status));
>> +		} else {
>> +			drm_dbg(&i915->drm, "PXP inv-stream-key-%u failed 0x%08x:%s:\n",
>> +				session_id, msg_out.header.status,
>> +				fw_err_to_string(msg_out.header.status));
>> +			drm_dbg(&i915->drm, "     cmd-detail: ID=[0x%08x],API-Ver-[0x%08x]\n",
>> +				msg_in.header.command_id, msg_in.header.api_version);
>> +		}
>> +	}
>>   }
>>
>> base-commit: 3a266f994a6b752953eb974ab7bf1dc382a2d1b8
>

-- 
Jani Nikula, Intel Open Source Graphics Center
