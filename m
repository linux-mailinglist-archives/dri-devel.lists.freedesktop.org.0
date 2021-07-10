Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D811C3C3603
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jul 2021 20:08:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06EEF6EB4D;
	Sat, 10 Jul 2021 18:08:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AAAB6EB4D;
 Sat, 10 Jul 2021 18:08:26 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10041"; a="190220283"
X-IronPort-AV: E=Sophos;i="5.84,229,1620716400"; d="scan'208";a="190220283"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2021 11:08:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,229,1620716400"; d="scan'208";a="647594282"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by fmsmga006.fm.intel.com with ESMTP; 10 Jul 2021 11:08:14 -0700
Received: from [10.249.151.15] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.151.15])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 16AI8DL8007441; Sat, 10 Jul 2021 19:08:13 +0100
Subject: Re: [PATCH 10/16] drm/i915/guc/slpc: Add debugfs for slpc info
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210710012026.19705-1-vinay.belgaumkar@intel.com>
 <20210710012026.19705-11-vinay.belgaumkar@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <181d8958-362d-5c00-9e0b-858275272f8f@intel.com>
Date: Sat, 10 Jul 2021 20:08:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210710012026.19705-11-vinay.belgaumkar@intel.com>
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



On 10.07.2021 03:20, Vinay Belgaumkar wrote:
> This prints out relevant SLPC info from the SLPC shared structure.
> 
> We will send a h2g message which forces SLPC to update the
> shared data structure with latest information before reading it.
> 
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Signed-off-by: Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>
> ---
>  .../gpu/drm/i915/gt/uc/intel_guc_debugfs.c    | 16 ++++++
>  drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   | 53 +++++++++++++++++++
>  drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h   |  3 ++
>  3 files changed, 72 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c
> index 9a03ff56e654..bef749e54601 100644
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
> @@ -50,11 +51,26 @@ static int guc_registered_contexts_show(struct seq_file *m, void *data)
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
> +

other entries don't have empty line here

> +DEFINE_GT_DEBUGFS_ATTRIBUTE(guc_slpc_info);
> +
>  void intel_guc_debugfs_register(struct intel_guc *guc, struct dentry *root)
>  {
>  	static const struct debugfs_gt_file files[] = {
>  		{ "guc_info", &guc_info_fops, NULL },
>  		{ "guc_registered_contexts", &guc_registered_contexts_fops, NULL },
> +		{ "guc_slpc_info", &guc_slpc_info_fops, NULL},

IIRC last field is "eval" where maybe you could add your own to check if
intel_guc_slpc_is_used() to avoid exposing this info if N/A

>  	};
>  
>  	if (!intel_guc_is_supported(guc))
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> index 98a283d31734..d179ba14ece6 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> @@ -432,6 +432,59 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
>  	return 0;
>  }
>  
> +int intel_guc_slpc_info(struct intel_guc_slpc *slpc, struct drm_printer *p)
> +{
> +	struct drm_i915_private *i915 = guc_to_gt(slpc_to_guc(slpc))->i915;
> +	struct slpc_shared_data *data;
> +	struct slpc_platform_info *platform_info;
> +	struct slpc_task_state_data *task_state_data;
> +	intel_wakeref_t wakeref;
> +	int ret = 0;
> +
> +	wakeref = intel_runtime_pm_get(&i915->runtime_pm);
> +
> +	if (slpc_read_task_state(slpc)) {
> +		ret = -EIO;
> +		goto done;
> +	}
> +
> +	GEM_BUG_ON(!slpc->vma);
> +
> +	drm_clflush_virt_range(slpc->vaddr, sizeof(struct slpc_shared_data));

likely will go away if integrated into slpc_read_task_state

> +	data = slpc->vaddr;
> +
> +	platform_info = &data->platform_info;

is this used ?

> +	task_state_data = &data->task_state_data;

as it looks that you treat these sections separately, then maybe it
would be cleaner to have:

static void print_global_data(*global_data, *p) {}
static void print_platform_info(*platform_info, *p) {}
static void print_task_state_data(*task_state_data, *p) {}

> +
> +	drm_printf(p, "SLPC state: %s\n", slpc_state_stringify(data->global_state));
> +	drm_printf(p, "\tgtperf task active: %d\n",
> +			task_state_data->gtperf_task_active);
> +	drm_printf(p, "\tdcc task active: %d\n",
> +				task_state_data->dcc_task_active);
> +	drm_printf(p, "\tin dcc: %d\n",
> +				task_state_data->in_dcc);
> +	drm_printf(p, "\tfreq switch active: %d\n",
> +				task_state_data->freq_switch_active);
> +	drm_printf(p, "\tibc enabled: %d\n",
> +				task_state_data->ibc_enabled);
> +	drm_printf(p, "\tibc active: %d\n",
> +				task_state_data->ibc_active);
> +	drm_printf(p, "\tpg1 enabled: %s\n",
> +				yesno(task_state_data->pg1_enabled));
> +	drm_printf(p, "\tpg1 active: %s\n",
> +				yesno(task_state_data->pg1_active));
> +	drm_printf(p, "\tmax freq: %dMHz\n",
> +				DIV_ROUND_CLOSEST(data->task_state_data.max_unslice_freq *
> +				GT_FREQUENCY_MULTIPLIER, GEN9_FREQ_SCALER));
> +	drm_printf(p, "\tmin freq: %dMHz\n",
> +				DIV_ROUND_CLOSEST(data->task_state_data.min_unslice_freq *
> +				GT_FREQUENCY_MULTIPLIER, GEN9_FREQ_SCALER));

you defined task_state_data but in above 2 you're accessing it from data

Michal

> +
> +done:
> +	intel_runtime_pm_put(&i915->runtime_pm, wakeref);
> +	return ret;
> +}
> +
>  void intel_guc_slpc_fini(struct intel_guc_slpc *slpc)
>  {
>  	if (!slpc->vma)
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
> index 2cb830cdacb5..cd12c5f19f4b 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
> @@ -10,6 +10,8 @@
>  #include <linux/mutex.h>
>  #include "intel_guc_slpc_fwif.h"
>  
> +struct drm_printer;
> +
>  struct intel_guc_slpc {
>  	/*Protects access to vma and SLPC actions */
>  	struct i915_vma *vma;
> @@ -38,5 +40,6 @@ int intel_guc_slpc_set_max_freq(struct intel_guc_slpc *slpc, u32 val);
>  int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val);
>  int intel_guc_slpc_get_max_freq(struct intel_guc_slpc *slpc, u32 *val);
>  int intel_guc_slpc_get_min_freq(struct intel_guc_slpc *slpc, u32 *val);
> +int intel_guc_slpc_info(struct intel_guc_slpc *slpc, struct drm_printer *p);
>  
>  #endif
> 
