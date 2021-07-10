Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E343C35DC
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jul 2021 19:38:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 442B86EB4C;
	Sat, 10 Jul 2021 17:38:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC1A16EB4C;
 Sat, 10 Jul 2021 17:37:59 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10041"; a="209655486"
X-IronPort-AV: E=Sophos;i="5.84,229,1620716400"; d="scan'208";a="209655486"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2021 10:37:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,229,1620716400"; d="scan'208";a="450742252"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by orsmga007.jf.intel.com with ESMTP; 10 Jul 2021 10:37:57 -0700
Received: from [10.249.151.15] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.151.15])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 16AHbtZv032512; Sat, 10 Jul 2021 18:37:56 +0100
Subject: Re: [Intel-gfx] [PATCH 07/16] drm/i915/guc/slpc: Enable slpc and add
 related H2G events
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210710012026.19705-1-vinay.belgaumkar@intel.com>
 <20210710012026.19705-8-vinay.belgaumkar@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <24627794-12b3-1d4a-2ee0-d6ef45be0b05@intel.com>
Date: Sat, 10 Jul 2021 19:37:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210710012026.19705-8-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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



On 10.07.2021 03:20, Vinay Belgaumkar wrote:
> Add methods for interacting with guc for enabling SLPC. Enable
> SLPC after guc submission has been established. GuC load will

s/guc/GuC

> fail if SLPC cannot be successfully initialized. Add various
> helper methods to set/unset the parameters for SLPC. They can
> be set using h2g calls or directly setting bits in the shared

/h2g/H2G

> data structure.
> 
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Signed-off-by: Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   | 221 ++++++++++++++++++
>  .../gpu/drm/i915/gt/uc/intel_guc_submission.c |   4 -
>  drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  10 +
>  3 files changed, 231 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> index 94e2f19951aa..e579408d1c19 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> @@ -18,6 +18,61 @@ static inline struct intel_guc *slpc_to_guc(struct intel_guc_slpc *slpc)
>  	return container_of(slpc, struct intel_guc, slpc);
>  }
>  
> +static inline struct intel_gt *slpc_to_gt(struct intel_guc_slpc *slpc)
> +{
> +	return guc_to_gt(slpc_to_guc(slpc));
> +}
> +
> +static inline struct drm_i915_private *slpc_to_i915(struct intel_guc_slpc *slpc)
> +{
> +	return (slpc_to_gt(slpc))->i915;
> +}
> +
> +static void slpc_mem_set_param(struct slpc_shared_data *data,
> +				u32 id, u32 value)
> +{
> +	GEM_BUG_ON(id >= SLPC_MAX_OVERRIDE_PARAMETERS);
> +	/* When the flag bit is set, corresponding value will be read
> +	 * and applied by slpc.

fix format of multi-line comment
s/slpc/SLPC

> +	 */
> +	data->override_params_set_bits[id >> 5] |= (1 << (id % 32));

use __set_bit instead

> +	data->override_params_values[id] = value;
> +}
> +
> +static void slpc_mem_unset_param(struct slpc_shared_data *data,
> +				 u32 id)
> +{
> +	GEM_BUG_ON(id >= SLPC_MAX_OVERRIDE_PARAMETERS);
> +	/* When the flag bit is unset, corresponding value will not be
> +	 * read by slpc.
> +	 */
> +	data->override_params_set_bits[id >> 5] &= (~(1 << (id % 32)));

same here

> +	data->override_params_values[id] = 0;
> +}
> +
> +static void slpc_mem_task_control(struct slpc_shared_data *data,
> +				 u64 val, u32 enable_id, u32 disable_id)

hmm, u64 to pass simple tri-state flag ?

> +{
> +	/* Enabling a param involves setting the enable_id
> +	 * to 1 and disable_id to 0. Setting it to default
> +	 * will unset both enable and disable ids and let
> +	 * slpc choose it's default values.

fix format + s/slpc/SLPC

> +	 */
> +	if (val == SLPC_PARAM_TASK_DEFAULT) {
> +		/* set default */
> +		slpc_mem_unset_param(data, enable_id);
> +		slpc_mem_unset_param(data, disable_id);
> +	} else if (val == SLPC_PARAM_TASK_ENABLED) {
> +		/* set enable */
> +		slpc_mem_set_param(data, enable_id, 1);
> +		slpc_mem_set_param(data, disable_id, 0);
> +	} else if (val == SLPC_PARAM_TASK_DISABLED) {
> +		/* set disable */
> +		slpc_mem_set_param(data, disable_id, 1);
> +		slpc_mem_set_param(data, enable_id, 0);
> +	}

maybe instead of SLPC_PARAM_TASK_* flags (that btw were confusing me
earlier) you can define 3x small helpers:

static void slpc_mem_set_default(data, enable_id, disable_id);
static void slpc_mem_set_enabled(data, enable_id, disable_id);
static void slpc_mem_set_disabled(data, enable_id, disable_id);


> +}
> +
>  static int slpc_shared_data_init(struct intel_guc_slpc *slpc)
>  {
>  	struct intel_guc *guc = slpc_to_guc(slpc);
> @@ -34,6 +89,128 @@ static int slpc_shared_data_init(struct intel_guc_slpc *slpc)
>  	return err;
>  }
>  
> +/*
> + * Send SLPC event to guc
> + *
> + */
> +static int slpc_send(struct intel_guc_slpc *slpc,
> +			struct slpc_event_input *input,
> +			u32 in_len)
> +{
> +	struct intel_guc *guc = slpc_to_guc(slpc);
> +	u32 *action;
> +
> +	action = (u32 *)input;
> +	action[0] = INTEL_GUC_ACTION_SLPC_REQUEST;

why not just updating input->h2g_action_id ?

> +
> +	return intel_guc_send(guc, action, in_len);
> +}
> +
> +static bool slpc_running(struct intel_guc_slpc *slpc)
> +{
> +	struct slpc_shared_data *data;
> +	u32 slpc_global_state;
> +
> +	GEM_BUG_ON(!slpc->vma);
> +
> +	drm_clflush_virt_range(slpc->vaddr, sizeof(struct slpc_shared_data));

do you really need to flush all 8K of shared data?
it looks that you only need single u32

> +	data = slpc->vaddr;
> +
> +	slpc_global_state = data->global_state;
> +
> +	return (data->global_state == SLPC_GLOBAL_STATE_RUNNING);
> +}
> +
> +static int host2guc_slpc_query_task_state(struct intel_guc_slpc *slpc)
> +{
> +	struct intel_guc *guc = slpc_to_guc(slpc);
> +	u32 shared_data_gtt_offset = intel_guc_ggtt_offset(guc, slpc->vma);
> +	struct slpc_event_input data = {0};
> +
> +	data.header.value = SLPC_EVENT(SLPC_EVENT_QUERY_TASK_STATE, 2);

you defined header.num_args and header.event_id, don't want to use them?

> +	data.args[0] = shared_data_gtt_offset;
> +	data.args[1] = 0;
> +
> +	return slpc_send(slpc, &data, 4);

magic 4

> +}
> +
> +static int slpc_read_task_state(struct intel_guc_slpc *slpc)
> +{
> +	return host2guc_slpc_query_task_state(slpc);
> +}

hmm, all this looks complicated more than needed, why not just:

static int guc_action_slpc_query(struct intel_guc *guc, u32 offset)
{
	u32 request[] = {
		INTEL_GUC_ACTION_SLPC_REQUEST,
		SLPC_EVENT(SLPC_EVENT_QUERY_TASK_STATE, 2),
		offset,
		0,
	};
	int err;

	return intel_guc_send(guc, request, ARRAY_SIZE(request));
}

static int slpc_query_task_state(struct intel_guc_slpc *slpc)
{
	struct intel_guc *guc = slpc_to_guc(slpc);
	u32 offset = intel_guc_ggtt_offset(guc, slpc->vma);

	return guc_action_slpc_query(guc, offset);
}

btw, there is little magic in H2G data, as only event enums were defined
in slpc_fwif.h (or slpc_abi.h) but it looks that len and format of args
depends on the actual event used

> +
> +static const char *slpc_state_stringify(enum slpc_global_state state)
> +{
> +	const char *str = NULL;
> +
> +	switch (state) {
> +	case SLPC_GLOBAL_STATE_NOT_RUNNING:
> +		str = "not running";
> +		break;
> +	case SLPC_GLOBAL_STATE_INITIALIZING:
> +		str = "initializing";
> +		break;
> +	case SLPC_GLOBAL_STATE_RESETTING:
> +		str = "resetting";
> +		break;
> +	case SLPC_GLOBAL_STATE_RUNNING:
> +		str = "running";
> +		break;
> +	case SLPC_GLOBAL_STATE_SHUTTING_DOWN:
> +		str = "shutting down";
> +		break;
> +	case SLPC_GLOBAL_STATE_ERROR:
> +		str = "error";
> +		break;
> +	default:
> +		str = "unknown";
> +		break;
> +	}
> +
> +	return str;
> +}
> +
> +static const char *get_slpc_state(struct intel_guc_slpc *slpc)

lot of duplicated code with slpc_running()

maybe there should be:
	u32 slpc_get_state(slpc);
	bool slpc_is_running(slpc);
	const char *slpc_state_string(slpc);


> +{
> +	struct slpc_shared_data *data;
> +	u32 slpc_global_state;
> +
> +	GEM_BUG_ON(!slpc->vma);
> +
> +	drm_clflush_virt_range(slpc->vaddr, sizeof(struct slpc_shared_data));
> +	data = slpc->vaddr;
> +
> +	slpc_global_state = data->global_state;
> +
> +	return slpc_state_stringify(slpc_global_state);
> +}
> +
> +static int host2guc_slpc_reset(struct intel_guc_slpc *slpc)
> +{
> +	struct intel_guc *guc = slpc_to_guc(slpc);
> +	u32 shared_data_gtt_offset = intel_guc_ggtt_offset(guc, slpc->vma);
> +	struct slpc_event_input data = {0};
> +	int ret;
> +
> +	data.header.value = SLPC_EVENT(SLPC_EVENT_RESET, 2);
> +	data.args[0] = shared_data_gtt_offset;
> +	data.args[1] = 0;
> +
> +	/* TODO: Hardcoded 4 needs define */
> +	ret = slpc_send(slpc, &data, 4);
> +
> +	if (!ret) {
> +		/* TODO: How long to Wait until SLPC is running */

do we know state transitions ?
maybe there is no point in waiting for RUNNING if it is in ERROR or
SHUTTING_DOWN ?

> +		if (wait_for(slpc_running(slpc), 5)) {

magic 5

> +			DRM_ERROR("SLPC not enabled! State = %s\n",

use drm_err

> +				  get_slpc_state(slpc));
> +			return -EIO;
> +		}
> +	}
> +
> +	return ret;
> +}
> +
>  int intel_guc_slpc_init(struct intel_guc_slpc *slpc)
>  {
>  	GEM_BUG_ON(slpc->vma);
> @@ -56,6 +233,50 @@ int intel_guc_slpc_init(struct intel_guc_slpc *slpc)
>   */
>  int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
>  {
> +	struct drm_i915_private *i915 = slpc_to_i915(slpc);
> +	struct slpc_shared_data *data;
> +	int ret;
> +
> +	GEM_BUG_ON(!slpc->vma);
> +
> +	memset(slpc->vaddr, 0, sizeof(struct slpc_shared_data));
> +
> +	data = slpc->vaddr;
> +	data->shared_data_size = sizeof(struct slpc_shared_data);
> +
> +	/* Enable only GTPERF task, Disable others */
> +	slpc_mem_task_control(data, SLPC_PARAM_TASK_ENABLED,
> +				SLPC_PARAM_TASK_ENABLE_GTPERF,
> +				SLPC_PARAM_TASK_DISABLE_GTPERF);
> +
> +	slpc_mem_task_control(data, SLPC_PARAM_TASK_DISABLED,
> +				SLPC_PARAM_TASK_ENABLE_BALANCER,
> +				SLPC_PARAM_TASK_DISABLE_BALANCER);
> +
> +	slpc_mem_task_control(data, SLPC_PARAM_TASK_DISABLED,
> +				SLPC_PARAM_TASK_ENABLE_DCC,
> +				SLPC_PARAM_TASK_DISABLE_DCC);
> +
> +	ret = host2guc_slpc_reset(slpc);
> +	if (ret) {
> +		drm_err(&i915->drm, "SLPC Reset event returned %d", ret);

you may want to print error as %pe
missing \n

> +		return -EIO;
> +	}
> +
> +	DRM_INFO("SLPC state: %s\n", get_slpc_state(slpc));

use drm_info

> +
> +	if (slpc_read_task_state(slpc))
> +		drm_err(&i915->drm, "Unable to read task state data");

missing \n

> +
> +	drm_clflush_virt_range(slpc->vaddr, sizeof(struct slpc_shared_data));
> +
> +	/* min and max frequency limits being used by SLPC */
> +	drm_info(&i915->drm, "SLPC min freq: %u Mhz, max is %u Mhz",

missing \n

> +			DIV_ROUND_CLOSEST(data->task_state_data.min_unslice_freq *
> +				GT_FREQUENCY_MULTIPLIER, GEN9_FREQ_SCALER),
> +			DIV_ROUND_CLOSEST(data->task_state_data.max_unslice_freq *
> +				GT_FREQUENCY_MULTIPLIER, GEN9_FREQ_SCALER));

this info/code seems to be duplicated in patch 10/16
maybe just call intel_guc_slpc_info() here once available ?

> +
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index e2644a05f298..3e76d4d5f7bb 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -2321,10 +2321,6 @@ void intel_guc_submission_enable(struct intel_guc *guc)
>  
>  void intel_guc_submission_disable(struct intel_guc *guc)
>  {
> -	struct intel_gt *gt = guc_to_gt(guc);
> -
> -	GEM_BUG_ON(gt->awake); /* GT should be parked first */

if not mistake, can you explain why it was removed ?

> -
>  	/* Note: By the time we're here, GuC may have already been reset */
>  }
>  
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> index dca5f6d0641b..7b6c767d3eb0 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> @@ -501,6 +501,14 @@ static int __uc_init_hw(struct intel_uc *uc)
>  	if (intel_uc_uses_guc_submission(uc))
>  		intel_guc_submission_enable(guc);
>  
> +	if (intel_uc_uses_guc_slpc(uc)) {
> +		ret = intel_guc_slpc_enable(&guc->slpc);
> +		if (ret)
> +			goto err_submission;
> +		drm_info(&i915->drm, "GuC SLPC %s\n",
> +			 enableddisabled(intel_uc_uses_guc_slpc(uc)));

move this drm_info after below GuC report and/or modify to have:

"GuC firmware path.bin version 1.0 loaded:yes"
"GuC submission:enabled"
"GuC SLPC:enabled"
"HuC firmware path.bin version 1.0 authenticated:yes"

Michal

> +	}
> +
>  	drm_info(&i915->drm, "%s firmware %s version %u.%u %s:%s\n",
>  		 intel_uc_fw_type_repr(INTEL_UC_FW_TYPE_GUC), guc->fw.path,
>  		 guc->fw.major_ver_found, guc->fw.minor_ver_found,
> @@ -521,6 +529,8 @@ static int __uc_init_hw(struct intel_uc *uc)
>  	/*
>  	 * We've failed to load the firmware :(
>  	 */
> +err_submission:
> +	intel_guc_submission_disable(guc);
>  err_log_capture:
>  	__uc_capture_load_err_log(uc);
>  err_out:
> 
