Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CCE3D15DD
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 20:05:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CE696E8E1;
	Wed, 21 Jul 2021 18:05:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42D5B6E187;
 Wed, 21 Jul 2021 18:05:24 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10052"; a="233294455"
X-IronPort-AV: E=Sophos;i="5.84,258,1620716400"; d="scan'208";a="233294455"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2021 11:05:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,258,1620716400"; d="scan'208";a="564814526"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by orsmga004.jf.intel.com with ESMTP; 21 Jul 2021 11:05:22 -0700
Received: from [10.249.140.99] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.140.99])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 16LI5K79009565; Wed, 21 Jul 2021 19:05:21 +0100
Subject: Re: [PATCH 09/14] drm/i915/guc/slpc: Add debugfs for SLPC info
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210721161120.24610-1-vinay.belgaumkar@intel.com>
 <20210721161120.24610-10-vinay.belgaumkar@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <91447d98-cf2d-cf60-e1c8-1bb13b4ae12d@intel.com>
Date: Wed, 21 Jul 2021 20:05:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210721161120.24610-10-vinay.belgaumkar@intel.com>
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
Cc: Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 21.07.2021 18:11, Vinay Belgaumkar wrote:
> This prints out relevant SLPC info from the SLPC shared structure.
> 
> We will send a h2g message which forces SLPC to update the
> shared data structure with latest information before reading it.
> 
> v2: Address review comments (Michal W)
> 
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Signed-off-by: Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>
> ---
>  .../gpu/drm/i915/gt/uc/intel_guc_debugfs.c    | 23 +++++++++++
>  drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   | 40 +++++++++++++++++++
>  drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h   |  4 +-
>  3 files changed, 66 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c
> index 72ddfff42f7d..46b22187927b 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c
> @@ -12,6 +12,7 @@
>  #include "gt/uc/intel_guc_ct.h"
>  #include "gt/uc/intel_guc_ads.h"
>  #include "gt/uc/intel_guc_submission.h"
> +#include "gt/uc/intel_guc_slpc.h"
>  
>  static int guc_info_show(struct seq_file *m, void *data)
>  {
> @@ -50,11 +51,33 @@ static int guc_registered_contexts_show(struct seq_file *m, void *data)
>  }
>  DEFINE_GT_DEBUGFS_ATTRIBUTE(guc_registered_contexts);
>  
> +static int guc_slpc_info_show(struct seq_file *m, void *unused)
> +{
> +	struct intel_guc *guc = m->private;
> +	struct intel_guc_slpc *slpc = &guc->slpc;
> +	struct drm_printer p = drm_seq_file_printer(m);
> +
> +	if (!intel_guc_slpc_is_used(guc))
> +		return -ENODEV;
> +
> +	return intel_guc_slpc_info(slpc, &p);
> +}
> +DEFINE_GT_DEBUGFS_ATTRIBUTE(guc_slpc_info);
> +
> +bool intel_eval_slpc_support(void *data)
> +{
> +	struct intel_guc *guc;
> +
> +	guc = (struct intel_guc *)data;

	struct intel_guc *guc = (struct intel_guc *)data;

> +	return intel_guc_slpc_is_used(guc);
> +}
> +
>  void intel_guc_debugfs_register(struct intel_guc *guc, struct dentry *root)
>  {
>  	static const struct debugfs_gt_file files[] = {
>  		{ "guc_info", &guc_info_fops, NULL },
>  		{ "guc_registered_contexts", &guc_registered_contexts_fops, NULL },
> +		{ "guc_slpc_info", &guc_slpc_info_fops, &intel_eval_slpc_support},
>  	};
>  
>  	if (!intel_guc_is_supported(guc))
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> index c1cf8d46e360..73379985c105 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> @@ -430,6 +430,46 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
>  	return 0;
>  }
>  
> +int intel_guc_slpc_info(struct intel_guc_slpc *slpc, struct drm_printer *p)
> +{
> +	struct drm_i915_private *i915 = guc_to_gt(slpc_to_guc(slpc))->i915;
> +	struct slpc_shared_data *data;
> +	struct slpc_task_state_data *slpc_tasks;
> +	intel_wakeref_t wakeref;
> +	int ret = 0;
> +
> +	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
> +		if (slpc_query_task_state(slpc))
> +			return -EIO;

not sure if you can return directly from "with_rpm"

> +
> +		slpc_tasks = &data->task_state_data;
> +
> +		drm_printf(p, "SLPC state: %s\n", slpc_state_string(slpc));
> +		drm_printf(p, "\tgtperf task active: %s\n",
> +			yesno(slpc_tasks->status & SLPC_GTPERF_TASK_ACTIVE));
> +		drm_printf(p, "\tdcc task active: %s\n",
> +			yesno(slpc_tasks->status & SLPC_DCC_TASK_ACTIVE));
> +		drm_printf(p, "\tin dcc: %s\n",
> +			yesno(slpc_tasks->status & SLPC_IN_DCC));
> +		drm_printf(p, "\tfreq switch active: %s\n",
> +			yesno(slpc_tasks->status & SLPC_FREQ_SWITCH_ACTIVE));
> +		drm_printf(p, "\tibc enabled: %s\n",
> +			yesno(slpc_tasks->status & SLPC_IBC_ENABLED));
> +		drm_printf(p, "\tibc active: %s\n",
> +			yesno(slpc_tasks->status & SLPC_IBC_ACTIVE));
> +		drm_printf(p, "\tpg1 enabled: %s\n",
> +			yesno(slpc_tasks->status & SLPC_PG1_ENABLED));
> +		drm_printf(p, "\tpg1 active: %s\n",
> +			yesno(slpc_tasks->status & SLPC_PG1_ACTIVE));
> +		drm_printf(p, "\tmax freq: %dMHz\n",
> +				slpc_decode_max_freq(slpc));
> +		drm_printf(p, "\tmin freq: %dMHz\n",
> +				slpc_decode_min_freq(slpc));

not sure what they are:

DCC ?
IBC ?
PG1 ?

and make sure to use %u for unsigned

Michal

> +	}
> +
> +	return ret;
> +}
> +
>  void intel_guc_slpc_fini(struct intel_guc_slpc *slpc)
>  {
>  	if (!slpc->vma)
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
> index 627c71a95777..852c6316aa47 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
> @@ -10,6 +10,8 @@
>  #include "intel_guc_slpc_types.h"
>  #include "abi/guc_actions_slpc_abi.h"
>  
> +struct drm_printer;
> +
>  static inline bool intel_guc_slpc_is_supported(struct intel_guc *guc)
>  {
>  	return guc->slpc_supported;
> @@ -26,7 +28,6 @@ static inline bool intel_guc_slpc_is_used(struct intel_guc *guc)
>  }
>  
>  void intel_guc_slpc_init_early(struct intel_guc_slpc *slpc);
> -
>  int intel_guc_slpc_init(struct intel_guc_slpc *slpc);
>  int intel_guc_slpc_enable(struct intel_guc_slpc *slpc);
>  void intel_guc_slpc_fini(struct intel_guc_slpc *slpc);
> @@ -34,5 +35,6 @@ int intel_guc_slpc_set_max_freq(struct intel_guc_slpc *slpc, u32 val);
>  int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val);
>  int intel_guc_slpc_get_max_freq(struct intel_guc_slpc *slpc, u32 *val);
>  int intel_guc_slpc_get_min_freq(struct intel_guc_slpc *slpc, u32 *val);
> +int intel_guc_slpc_info(struct intel_guc_slpc *slpc, struct drm_printer *p);
>  
>  #endif
> 
