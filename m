Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE766BC9CA
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 09:50:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F231610E137;
	Thu, 16 Mar 2023 08:50:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D7D110E137;
 Thu, 16 Mar 2023 08:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678956643; x=1710492643;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=n3eEIKzs4I20vZGq7RBjpAg0fdr655bEY7Eg4mQ6/V0=;
 b=PXmzPUAi/LwCLq1jSWCtNNXmSz9qF7pWPOxQQxcArl5XHC7TvgNecKcW
 nDSSHYNPD2eaDLcnnWFNt3+8s4nCuEx77PB8UIP9gPRH3bMeqtQVHY3M6
 leMZStWGUwNa4y0Cn9U1YO2BZURfPloKVCR4l7fCCoUh2G9z/fUTcPmD1
 G75E3ZALh9IX8xE9FIt76T6W7A/WlZt4P7s9mVm8TlYzpRZaXWgfxNWR7
 jIZhWPf+e36+NE8s2VrY0HmdGXRQmMLp6rE+ImK8QWI05K4plIJnbkG+E
 f3qslGk+NBzwE+ng7O5v4tJvHZqfqsPp7SQpSRj/xhK9yBTBx7mQdnNtc w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="402798700"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="402798700"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 01:50:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="679826186"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="679826186"
Received: from kflynn1-mobl3.ger.corp.intel.com (HELO [10.213.236.25])
 ([10.213.236.25])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 01:50:41 -0700
Message-ID: <cc56d923-4021-3423-bfdf-986e7b73283f@linux.intel.com>
Date: Thu, 16 Mar 2023 08:50:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [Intel-gfx] [PATCH v3] drm/i915/pxp: limit drm-errors or warning
 on firmware API failures
Content-Language: en-US
To: Eero Tamminen <eero.t.tamminen@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20230314175832.1506427-1-alan.previn.teres.alexis@intel.com>
 <6cff8c19-0ab6-4b03-d778-ad57aa207b98@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <6cff8c19-0ab6-4b03-d778-ad57aa207b98@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 15/03/2023 09:16, Eero Tamminen wrote:
> Hi,
> 
> Tested the patch with Ubuntu 22.04 desktop + Linux 6.2-rc3 (drm-tip) 
> kernel, on TGL-H HW.
> 
> With it, this log spam has disappeared:
> ----------------------------------------------------
> [ 8691.608933] i915 0000:00:02.0: [drm] PXP firmware failed arb session 
> init request ret=[0x0000101f]
> [ 8691.709442] i915 0000:00:02.0: [drm] *ERROR* arb session failed to go 
> in play
> ----------------------------------------------------
> 
> There's now just a single message on boot:
> ----------------------------------------------------
> [   11.674177] ------------[ cut here ]------------
> [   11.674183] i915 0000:00:02.0: PXP init-arb-session-15 failed due to 
> BIOS/SOC:0x0000101a:ERR_PLATFORM_CONFIG
> [   11.674222] WARNING: CPU: 12 PID: 123 at 
> drivers/gpu/drm/i915/pxp/intel_pxp_tee.c:345 
> intel_pxp_tee_cmd_create_arb_session+0x19a/0x1e0 [i915]
> ...
> [   11.674961] Call Trace:
> [   11.674966]  <TASK>
> [   11.674970]  ? pxp_session_work+0x123/0x1d0 [i915]
> [   11.675130]  pxp_session_work+0x123/0x1d0 [i915]
> [   11.675286]  process_one_work+0x1d9/0x3e0
> [   11.675295]  worker_thread+0x21b/0x3d0
> [   11.675301]  ? __pfx_worker_thread+0x10/0x10
> [   11.675307]  kthread+0xe9/0x110
> [   11.675311]  ? __pfx_kthread+0x10/0x10
> [   11.675315]  ret_from_fork+0x29/0x50
> [   11.675323]  </TASK>
> [   11.675325] ---[ end trace 0000000000000000 ]---
> ----------------------------------------------------

Alan - is this expected during normal operation on some parts, or it's 
something truly unexpected/unexplained? If the former then I think it 
would be good to downgrade away from drm_WARN so it is less scary.

Commit message talks about "HW/platform gaps" - if it is like a missing 
BIOS support or so then I think WARN_ON is too much.

Regards,

Tvrtko

> 
> 
>      - Eero
> 
> On 14.3.2023 19.58, Alan Previn wrote:
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
>>      - Fix couple of typecasting nits (Daniele)
>>
>> Fixes: b762787bf767 ("drm/i915/pxp: Use drm_dbg if arb session failed 
>> due to fw version")
>> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
>> ---
>>   .../i915/pxp/intel_pxp_cmd_interface_cmn.h    |  3 +
>>   drivers/gpu/drm/i915/pxp/intel_pxp_session.c  |  2 +-
>>   drivers/gpu/drm/i915/pxp/intel_pxp_tee.c      | 77 +++++++++++++++----
>>   3 files changed, 67 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_cmn.h 
>> b/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_cmn.h
>> index ae9b151b7cb7..6f6541d5e49a 100644
>> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_cmn.h
>> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_cmn.h
>> @@ -18,6 +18,9 @@
>>   enum pxp_status {
>>       PXP_STATUS_SUCCESS = 0x0,
>>       PXP_STATUS_ERROR_API_VERSION = 0x1002,
>> +    PXP_STATUS_NOT_READY = 0x100e,
>> +    PXP_STATUS_PLATFCONFIG_KF1_NOVERIF = 0x101a,
>> +    PXP_STATUS_PLATFCONFIG_KF1_BAD = 0x101f,
>>       PXP_STATUS_OP_NOT_PERMITTED = 0x4013
>>   };
>> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c 
>> b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
>> index 448cacb0465d..7de849cb6c47 100644
>> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
>> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
>> @@ -74,7 +74,7 @@ static int pxp_create_arb_session(struct intel_pxp 
>> *pxp)
>>       ret = pxp_wait_for_session_state(pxp, ARB_SESSION, true);
>>       if (ret) {
>> -        drm_err(&gt->i915->drm, "arb session failed to go in play\n");
>> +        drm_dbg(&gt->i915->drm, "arb session failed to go in play\n");
>>           return ret;
>>       }
>>       drm_dbg(&gt->i915->drm, "PXP ARB session is alive\n");
>> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c 
>> b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
>> index d9d248b48093..6f89cd850251 100644
>> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
>> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
>> @@ -19,6 +19,37 @@
>>   #include "intel_pxp_tee.h"
>>   #include "intel_pxp_types.h"
>> +static bool
>> +is_fw_err_platform_config(u32 type)
>> +{
>> +    switch (type) {
>> +    case PXP_STATUS_ERROR_API_VERSION:
>> +    case PXP_STATUS_PLATFCONFIG_KF1_NOVERIF:
>> +    case PXP_STATUS_PLATFCONFIG_KF1_BAD:
>> +        return true;
>> +    default:
>> +        break;
>> +    }
>> +    return false;
>> +}
>> +
>> +static const char *
>> +fw_err_to_string(u32 type)
>> +{
>> +    switch (type) {
>> +    case PXP_STATUS_ERROR_API_VERSION:
>> +        return "ERR_API_VERSION";
>> +    case PXP_STATUS_NOT_READY:
>> +        return "ERR_NOT_READY";
>> +    case PXP_STATUS_PLATFCONFIG_KF1_NOVERIF:
>> +    case PXP_STATUS_PLATFCONFIG_KF1_BAD:
>> +        return "ERR_PLATFORM_CONFIG";
>> +    default:
>> +        break;
>> +    }
>> +    return NULL;
>> +}
>> +
>>   static int intel_pxp_tee_io_message(struct intel_pxp *pxp,
>>                       void *msg_in, u32 msg_in_size,
>>                       void *msg_out, u32 msg_out_max_size,
>> @@ -307,15 +338,22 @@ int intel_pxp_tee_cmd_create_arb_session(struct 
>> intel_pxp *pxp,
>>                          &msg_out, sizeof(msg_out),
>>                          NULL);
>> -    if (ret)
>> -        drm_err(&i915->drm, "Failed to send tee msg ret=[%d]\n", ret);
>> -    else if (msg_out.header.status == PXP_STATUS_ERROR_API_VERSION)
>> -        drm_dbg(&i915->drm, "PXP firmware version unsupported, 
>> requested: "
>> -            "CMD-ID-[0x%08x] on API-Ver-[0x%08x]\n",
>> -            msg_in.header.command_id, msg_in.header.api_version);
>> -    else if (msg_out.header.status != 0x0)
>> -        drm_warn(&i915->drm, "PXP firmware failed arb session init 
>> request ret=[0x%08x]\n",
>> -             msg_out.header.status);
>> +    if (ret) {
>> +        drm_err(&i915->drm, "Failed to send tee msg init arb session, 
>> ret=[%d]\n", ret);
>> +    } else if (msg_out.header.status != 0) {
>> +        if (is_fw_err_platform_config(msg_out.header.status)) {
>> +            drm_WARN_ONCE(&i915->drm, true,
>> +                      "PXP init-arb-session-%d failed due to 
>> BIOS/SOC:0x%08x:%s\n",
>> +                      arb_session_id, msg_out.header.status,
>> +                      fw_err_to_string(msg_out.header.status));
>> +        } else {
>> +            drm_dbg(&i915->drm, "PXP init-arb-session--%d failed 
>> 0x%08x:%st:\n",
>> +                arb_session_id, msg_out.header.status,
>> +                fw_err_to_string(msg_out.header.status));
>> +            drm_dbg(&i915->drm, "     cmd-detail: 
>> ID=[0x%08x],API-Ver-[0x%08x]\n",
>> +                msg_in.header.command_id, msg_in.header.api_version);
>> +        }
>> +    }
>>       return ret;
>>   }
>> @@ -347,10 +385,21 @@ void intel_pxp_tee_end_arb_fw_session(struct 
>> intel_pxp *pxp, u32 session_id)
>>       if ((ret || msg_out.header.status != 0x0) && ++trials < 3)
>>           goto try_again;
>> -    if (ret)
>> -        drm_err(&i915->drm, "Failed to send tee msg for 
>> inv-stream-key-%d, ret=[%d]\n",
>> +    if (ret) {
>> +        drm_err(&i915->drm, "Failed to send tee msg for 
>> inv-stream-key-%u, ret=[%d]\n",
>>               session_id, ret);
>> -    else if (msg_out.header.status != 0x0)
>> -        drm_warn(&i915->drm, "PXP firmware failed inv-stream-key-%d 
>> with status 0x%08x\n",
>> -             session_id, msg_out.header.status);
>> +    } else if (msg_out.header.status != 0) {
>> +        if (is_fw_err_platform_config(msg_out.header.status)) {
>> +            drm_WARN_ONCE(&i915->drm, true,
>> +                      "PXP inv-stream-key-%u failed due to BIOS/SOC 
>> :0x%08x:%s\n",
>> +                      session_id, msg_out.header.status,
>> +                      fw_err_to_string(msg_out.header.status));
>> +        } else {
>> +            drm_dbg(&i915->drm, "PXP inv-stream-key-%u failed 
>> 0x%08x:%s:\n",
>> +                session_id, msg_out.header.status,
>> +                fw_err_to_string(msg_out.header.status));
>> +            drm_dbg(&i915->drm, "     cmd-detail: 
>> ID=[0x%08x],API-Ver-[0x%08x]\n",
>> +                msg_in.header.command_id, msg_in.header.api_version);
>> +        }
>> +    }
>>   }
>>
>> base-commit: 07f982ec08c9bfc4aa82d98022111126cd638a0b
