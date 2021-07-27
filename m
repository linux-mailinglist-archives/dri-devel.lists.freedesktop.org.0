Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D5F3D7F00
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 22:19:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6BCC6E84B;
	Tue, 27 Jul 2021 20:19:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 050076E171;
 Tue, 27 Jul 2021 20:19:40 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10058"; a="192801502"
X-IronPort-AV: E=Sophos;i="5.84,274,1620716400"; d="scan'208";a="192801502"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 13:19:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,274,1620716400"; d="scan'208";a="417536581"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by orsmga003.jf.intel.com with ESMTP; 27 Jul 2021 13:19:38 -0700
Received: from [10.249.141.251] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.141.251])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 16RKJbRS029171; Tue, 27 Jul 2021 21:19:37 +0100
Subject: Re: [Intel-gfx] [PATCH 06/15] drm/i915/guc/slpc: Enable SLPC and add
 related H2G events
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210726190800.26762-1-vinay.belgaumkar@intel.com>
 <20210726190800.26762-7-vinay.belgaumkar@intel.com>
 <1e49627f-80a5-5283-eb6d-f06b0f024911@intel.com>
 <dd8d1976-4b3b-be9d-8b7d-e6487f2c06aa@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <3358d696-04c6-a22a-a956-bfd17f2f1bae@intel.com>
Date: Tue, 27 Jul 2021 22:19:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <dd8d1976-4b3b-be9d-8b7d-e6487f2c06aa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 27.07.2021 22:00, Belgaumkar, Vinay wrote:
> 
> 
> On 7/27/2021 8:12 AM, Michal Wajdeczko wrote:
>>
>>
>> On 26.07.2021 21:07, Vinay Belgaumkar wrote:
>>> Add methods for interacting with GuC for enabling SLPC. Enable
>>> SLPC after GuC submission has been established. GuC load will
>>> fail if SLPC cannot be successfully initialized. Add various
>>> helper methods to set/unset the parameters for SLPC. They can
>>> be set using H2G calls or directly setting bits in the shared
>>> data structure.
>>>
>>> v2: Address several review comments, add new helpers for
>>> decoding the SLPC min/max frequencies. Use masks instead of hardcoded
>>> constants. (Michal W)
>>>
>>> v3: Split global_state_to_string function, and check for positive
>>> non-zero return value from intel_guc_send() (Michal W)
>>>
>>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>> Signed-off-by: Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   | 237 ++++++++++++++++++
>>>   .../gpu/drm/i915/gt/uc/intel_guc_slpc_types.h |   2 +
>>>   drivers/gpu/drm/i915/gt/uc/intel_uc.c         |   8 +
>>>   3 files changed, 247 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>>> index bae4e33db0f8..f5808d2acbca 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>>> @@ -45,6 +45,40 @@ void intel_guc_slpc_init_early(struct
>>> intel_guc_slpc *slpc)
>>>       guc->slpc_selected = __guc_slpc_selected(guc);
>>>   }
>>>   +static void slpc_mem_set_param(struct slpc_shared_data *data,
>>> +                u32 id, u32 value)
>>> +{
>>> +    GEM_BUG_ON(id >= SLPC_MAX_OVERRIDE_PARAMETERS);
>>> +    /*
>>> +     * When the flag bit is set, corresponding value will be read
>>> +     * and applied by slpc.
>>
>> s/slpc/SLPC
> ok.
> 
>>
>>> +     */
>>> +    data->override_params.bits[id >> 5] |= (1 << (id % 32));
>>> +    data->override_params.values[id] = value;
>>> +}
>>> +
>>> +static void slpc_mem_set_enabled(struct slpc_shared_data *data,
>>> +                u8 enable_id, u8 disable_id)
>>> +{
>>> +    /*
>>> +     * Enabling a param involves setting the enable_id
>>> +     * to 1 and disable_id to 0.
>>> +     */
>>> +    slpc_mem_set_param(data, enable_id, 1);
>>> +    slpc_mem_set_param(data, disable_id, 0);
>>> +}
>>> +
>>> +static void slpc_mem_set_disabled(struct slpc_shared_data *data,
>>> +                u8 enable_id, u8 disable_id)
>>> +{
>>> +    /*
>>> +     * Disabling a param involves setting the enable_id
>>> +     * to 0 and disable_id to 1.
>>> +     */
>>> +    slpc_mem_set_param(data, disable_id, 1);
>>> +    slpc_mem_set_param(data, enable_id, 0);
>>> +}
>>> +
>>>   static int slpc_shared_data_init(struct intel_guc_slpc *slpc)
>>>   {
>>>       struct intel_guc *guc = slpc_to_guc(slpc);
>>> @@ -63,6 +97,129 @@ static int slpc_shared_data_init(struct
>>> intel_guc_slpc *slpc)
>>>       return err;
>>>   }
>>>   +static u32 slpc_get_state(struct intel_guc_slpc *slpc)
>>> +{
>>> +    struct slpc_shared_data *data;
>>> +
>>> +    GEM_BUG_ON(!slpc->vma);
>>> +
>>> +    drm_clflush_virt_range(slpc->vaddr, sizeof(u32));
>>> +    data = slpc->vaddr;
>>> +
>>> +    return data->header.global_state;
>>> +}
>>> +
>>> +static bool slpc_is_running(struct intel_guc_slpc *slpc)
>>> +{
>>> +    return (slpc_get_state(slpc) == SLPC_GLOBAL_STATE_RUNNING);
>>
>> extra ( ) not needed
> 
> ok.
> 
>>
>>> +}
>>> +
>>> +static int guc_action_slpc_query(struct intel_guc *guc, u32 offset)
>>> +{
>>> +    u32 request[] = {
>>> +        INTEL_GUC_ACTION_SLPC_REQUEST,
>>> +         SLPC_EVENT(SLPC_EVENT_QUERY_TASK_STATE, 2),
>>> +        offset,
>>> +        0,
>>> +    };
>>> +    int ret;
>>> +
>>> +    ret = intel_guc_send(guc, request, ARRAY_SIZE(request));
>>> +
>>> +    return ret > 0 ? -EPROTO : ret;
>>> +}
>>> +
>>> +static int slpc_query_task_state(struct intel_guc_slpc *slpc)
>>> +{
>>> +    struct intel_guc *guc = slpc_to_guc(slpc);
>>> +    struct drm_i915_private *i915 = slpc_to_i915(slpc);
>>> +    u32 shared_data_gtt_offset = intel_guc_ggtt_offset(guc, slpc->vma);
>>
>> just "offset" ? or maybe pass directly in call below ?
> 
> ok.
> 
>>
>>> +    int ret;
>>> +
>>> +    ret = guc_action_slpc_query(guc, shared_data_gtt_offset);
>>> +    if (ret)
>>> +        drm_err(&i915->drm, "Query task state data returned (%pe)\n",
>>
>> "Failed to query task state (%pe)\n" ?
> 
> ok.
>>
>>> +                ERR_PTR(ret));
>>> +
>>> +    drm_clflush_virt_range(slpc->vaddr, SLPC_PAGE_SIZE_BYTES);
>>> +
>>> +    return ret;
>>> +}
>>> +
>>> +static const char *slpc_global_state_to_string(enum
>>> slpc_global_state state)
>>> +{
>>> +    const char *str = NULL;
>>> +
>>> +    switch (state) {
>>> +    case SLPC_GLOBAL_STATE_NOT_RUNNING:
>>> +        str = "not running";
>>> +        break;
>>> +    case SLPC_GLOBAL_STATE_INITIALIZING:
>>> +        str = "initializing";
>>> +        break;
>>> +    case SLPC_GLOBAL_STATE_RESETTING:
>>> +        str = "resetting";
>>> +        break;
>>> +    case SLPC_GLOBAL_STATE_RUNNING:
>>> +        str = "running";
>>> +        break;
>>> +    case SLPC_GLOBAL_STATE_SHUTTING_DOWN:
>>> +        str = "shutting down";
>>> +        break;
>>> +    case SLPC_GLOBAL_STATE_ERROR:
>>> +        str = "error";
>>> +        break;
>>> +    default:
>>> +        str = "unknown";
>>
>> nit: you can do early returns to simplify the code
> ok.
> 
>>
>>> +        break;
>>> +    }
>>> +
>>> +    return str;
>>> +}
>>> +
>>> +static const char *slpc_get_state_string(struct intel_guc_slpc *slpc)
>>> +{
>>> +    return slpc_global_state_to_string(slpc_get_state(slpc));
>>> +}
>>> +
>>> +static int guc_action_slpc_reset(struct intel_guc *guc, u32 offset)
>>> +{
>>> +    u32 request[] = {
>>> +        INTEL_GUC_ACTION_SLPC_REQUEST,
>>> +        SLPC_EVENT(SLPC_EVENT_RESET, 2),
>>> +        offset,
>>> +        0,
>>> +    };
>>> +    int ret;
>>> +
>>> +    ret = intel_guc_send(guc, request, ARRAY_SIZE(request));
>>> +
>>> +    return ret > 0 ? -EPROTO : ret;
>>> +}
>>> +
>>> +static int slpc_reset(struct intel_guc_slpc *slpc)
>>> +{
>>> +    struct drm_i915_private *i915 = slpc_to_i915(slpc);
>>> +    struct intel_guc *guc = slpc_to_guc(slpc);
>>> +    u32 offset = intel_guc_ggtt_offset(guc, slpc->vma);
>>> +    int ret;
>>> +
>>> +    ret = guc_action_slpc_reset(guc, offset);
>>> +
>>> +    if (unlikely(ret < 0))
>>> +        return ret;
>>
>> no SLPC error here ?
> 
> added.
> 
>>
>>> +
>>> +    if (!ret) {
>>> +        if (wait_for(slpc_is_running(slpc), SLPC_RESET_TIMEOUT_MS)) {
>>> +            drm_err(&i915->drm, "SLPC not enabled! State = %s\n",
>>> +                  slpc_get_state_string(slpc));
>>> +            return -EIO;
>>> +        }
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>>   int intel_guc_slpc_init(struct intel_guc_slpc *slpc)
>>>   {
>>>       GEM_BUG_ON(slpc->vma);
>>> @@ -70,6 +227,86 @@ int intel_guc_slpc_init(struct intel_guc_slpc *slpc)
>>>       return slpc_shared_data_init(slpc);
>>>   }
>>>   +static u32 slpc_decode_min_freq(struct intel_guc_slpc *slpc)
>>> +{
>>> +    struct slpc_shared_data *data = slpc->vaddr;
>>> +
>>> +    GEM_BUG_ON(!slpc->vma);
>>> +
>>> +    return    DIV_ROUND_CLOSEST(
>>> +        REG_FIELD_GET(SLPC_MIN_UNSLICE_FREQ_MASK,
>>> +            data->task_state_data.freq) *
>>> +        GT_FREQUENCY_MULTIPLIER, GEN9_FREQ_SCALER);
>>> +}
>>> +
>>> +static u32 slpc_decode_max_freq(struct intel_guc_slpc *slpc)
>>> +{
>>> +    struct slpc_shared_data *data = slpc->vaddr;
>>> +
>>> +    GEM_BUG_ON(!slpc->vma);
>>> +
>>> +    return    DIV_ROUND_CLOSEST(
>>> +        REG_FIELD_GET(SLPC_MAX_UNSLICE_FREQ_MASK,
>>> +            data->task_state_data.freq) *
>>> +        GT_FREQUENCY_MULTIPLIER, GEN9_FREQ_SCALER);
>>> +}
>>> +
>>> +/*
>>> + * intel_guc_slpc_enable() - Start SLPC
>>> + * @slpc: pointer to intel_guc_slpc.
>>> + *
>>> + * SLPC is enabled by setting up the shared data structure and
>>> + * sending reset event to GuC SLPC. Initial data is setup in
>>> + * intel_guc_slpc_init. Here we send the reset event. We do
>>> + * not currently need a slpc_disable since this is taken care
>>> + * of automatically when a reset/suspend occurs and the GuC
>>> + * CTB is destroyed.
>>> + *
>>> + * Return: 0 on success, non-zero error code on failure.
>>> + */
>>> +int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
>>> +{
>>> +    struct drm_i915_private *i915 = slpc_to_i915(slpc);
>>> +    struct slpc_shared_data *data;
>>> +    int ret;
>>> +
>>> +    GEM_BUG_ON(!slpc->vma);
>>> +
>>> +    memset(slpc->vaddr, 0, sizeof(struct slpc_shared_data));
>>> +
>>> +    data = slpc->vaddr;
>>
>> vaddr is "struct slpc_shared_data *"
>> do you really need "data" local var?
>>
>>> +    data->header.size = sizeof(struct slpc_shared_data);
>>> +
>>> +    /* Enable only GTPERF task, disable others */
>>> +    slpc_mem_set_enabled(data, SLPC_PARAM_TASK_ENABLE_GTPERF,
>>> +                SLPC_PARAM_TASK_DISABLE_GTPERF);
>>> +
>>> +    slpc_mem_set_disabled(data, SLPC_PARAM_TASK_ENABLE_BALANCER,
>>> +                SLPC_PARAM_TASK_DISABLE_BALANCER);
>>> +
>>> +    slpc_mem_set_disabled(data, SLPC_PARAM_TASK_ENABLE_DCC,
>>> +                SLPC_PARAM_TASK_DISABLE_DCC);
>>
>> btw, all this "data" related calls are good candidate for helper like
>>
>> static void slpc_shared_data_reset(struct slpc_shared_data *data)
>> { ... }
> 
> ok.
> 
>>
>>> +
>>> +    ret = slpc_reset(slpc);
>>> +    if (unlikely(ret < 0)) {
>>> +        drm_err(&i915->drm, "SLPC Reset event returned (%pe)\n",
>>> +                ERR_PTR(ret));
>>> +        return ret;
>>> +    }
>>> +
>>> +    drm_info(&i915->drm, "GuC SLPC: enabled\n");
>>> +
>>> +    slpc_query_task_state(slpc);
>>
>> as this still may fail, maybe it should be before we claim success and
>> "SLPC: enabled" ?
> 
> ok. Added error check for this as well.
> 
>>
>>> +
>>> +    /* min and max frequency limits being used by SLPC */
>>> +    drm_info(&i915->drm, "SLPC min freq: %u Mhz, max is %u Mhz\n",
>>> +            slpc_decode_min_freq(slpc),
>>> +            slpc_decode_max_freq(slpc));
>>> +
>>> +
>>> +    return 0;
>>> +}
>>> +
>>>   void intel_guc_slpc_fini(struct intel_guc_slpc *slpc)
>>>   {
>>>       if (!slpc->vma)
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
>>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
>>> index edcf4c05bd9f..f14f81821a51 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
>>> @@ -6,6 +6,8 @@
>>>   #ifndef _INTEL_GUC_SLPC_TYPES_H_
>>>   #define _INTEL_GUC_SLPC_TYPES_H_
>>>   +#define SLPC_RESET_TIMEOUT_MS 5
>>> +
>>>   struct intel_guc_slpc {
>>>       struct i915_vma *vma;
>>>       struct slpc_shared_data *vaddr;
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>>> b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>>> index e6bd9406c7b2..b98c14f8c229 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>>> @@ -506,6 +506,12 @@ static int __uc_init_hw(struct intel_uc *uc)
>>>            "submission",
>>>            enableddisabled(intel_uc_uses_guc_submission(uc)));
>>>   +    if (intel_uc_uses_guc_slpc(uc)) {
>>> +        ret = intel_guc_slpc_enable(&guc->slpc);
>>> +        if (ret)
>>> +            goto err_submission;
>>
>> hmm, as this may fail, above success message
>>     "GuC submission enabled"
>> will be void
>>
>> what you likely need is to split "slpc_enable" with error messages only
>> that is called before we start reporting successes, and then
>> "slpc_status" part with all drm_info() that could be placed here.
> 
> Why? It is totally possible that GuC submission works just fine, but
> SLPC enable fails. In this case, even though we printed "submission
> enabled", we can still fail later with slpc errors.

hmm, in the code above there is "goto err_submission" if SLPC enabling
fails, and that will go to the "We've failed to load the firmware"
section below that disables GuC submission ... no ?

Michal

> 
> Thanks,
> Vinay.
>>
>> Michal
>>
>>> +    }
>>> +
>>>       if (intel_uc_uses_huc(uc)) {
>>>           drm_info(&i915->drm, "%s firmware %s version %u.%u %s:%s\n",
>>>                intel_uc_fw_type_repr(INTEL_UC_FW_TYPE_HUC),
>>> @@ -520,6 +526,8 @@ static int __uc_init_hw(struct intel_uc *uc)
>>>       /*
>>>        * We've failed to load the firmware :(
>>>        */
>>> +err_submission:
>>> +    intel_guc_submission_disable(guc);
>>>   err_log_capture:
>>>       __uc_capture_load_err_log(uc);
>>>   err_out:
>>>
