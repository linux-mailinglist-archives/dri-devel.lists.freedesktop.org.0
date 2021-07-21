Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C953D15F6
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 20:13:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C3C96E838;
	Wed, 21 Jul 2021 18:13:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C0FB6E9D6;
 Wed, 21 Jul 2021 18:13:48 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10052"; a="272605751"
X-IronPort-AV: E=Sophos;i="5.84,258,1620716400"; d="scan'208";a="272605751"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2021 11:13:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,258,1620716400"; d="scan'208";a="501383771"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by FMSMGA003.fm.intel.com with ESMTP; 21 Jul 2021 11:13:45 -0700
Received: from [10.249.140.99] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.140.99])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 16LIDi6k011531; Wed, 21 Jul 2021 19:13:44 +0100
Subject: Re: [PATCH 12/14] drm/i915/guc/slpc: Sysfs hooks for SLPC
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210721161120.24610-1-vinay.belgaumkar@intel.com>
 <20210721161120.24610-13-vinay.belgaumkar@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <c8b72a61-61a2-a32e-1842-6d296154733d@intel.com>
Date: Wed, 21 Jul 2021 20:13:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210721161120.24610-13-vinay.belgaumkar@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 21.07.2021 18:11, Vinay Belgaumkar wrote:
> Update the get/set min/max freq hooks to work for
> SLPC case as well. Consolidate helpers for requested/min/max
> frequency get/set to intel_rps where the proper action can
> be taken depending on whether slpc is enabled.

s/slpc/SLPC

> 
> v2: Add wrappers for getting rp0/1/n frequencies, update
> softlimits in set min/max slpc functions. Also check for
> boundary conditions before setting them.
> 
> v3: Address review comments (Michal W)
> 
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_rps.c         | 165 ++++++++++++++++++++
>  drivers/gpu/drm/i915/gt/intel_rps.h         |  11 ++
>  drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c |  14 ++
>  drivers/gpu/drm/i915/i915_pmu.c             |   2 +-
>  drivers/gpu/drm/i915/i915_reg.h             |   2 +
>  drivers/gpu/drm/i915/i915_sysfs.c           |  77 ++-------
>  6 files changed, 207 insertions(+), 64 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
> index e858eeb2c59d..48d4147165a9 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
> @@ -37,6 +37,13 @@ static struct intel_uncore *rps_to_uncore(struct intel_rps *rps)
>  	return rps_to_gt(rps)->uncore;
>  }
>  
> +static struct intel_guc_slpc *rps_to_slpc(struct intel_rps *rps)
> +{
> +	struct intel_gt *gt = rps_to_gt(rps);
> +
> +	return &gt->uc.guc.slpc;
> +}
> +
>  static bool rps_uses_slpc(struct intel_rps *rps)
>  {
>  	struct intel_gt *gt = rps_to_gt(rps);
> @@ -1960,6 +1967,164 @@ u32 intel_rps_read_actual_frequency(struct intel_rps *rps)
>  	return freq;
>  }
>  
> +u32 intel_rps_read_punit_req(struct intel_rps *rps)
> +{
> +	struct intel_uncore *uncore = rps_to_uncore(rps);
> +
> +	return intel_uncore_read(uncore, GEN6_RPNSWREQ);
> +}
> +
> +u32 intel_rps_get_req(struct intel_rps *rps, u32 pureq)
> +{
> +	u32 req = pureq >> GEN9_SW_REQ_UNSLICE_RATIO_SHIFT;
> +
> +	return req;
> +}
> +
> +u32 intel_rps_read_punit_req_frequency(struct intel_rps *rps)
> +{
> +	u32 freq = intel_rps_get_req(rps, intel_rps_read_punit_req(rps));
> +
> +	return intel_gpu_freq(rps, freq);
> +}
> +
> +u32 intel_rps_get_requested_frequency(struct intel_rps *rps)
> +{
> +	if (rps_uses_slpc(rps))
> +		return intel_rps_read_punit_req_frequency(rps);
> +	else
> +		return intel_gpu_freq(rps, rps->cur_freq);
> +}
> +
> +u32 intel_rps_get_max_frequency(struct intel_rps *rps)
> +{
> +	struct intel_guc_slpc *slpc = rps_to_slpc(rps);
> +
> +	if (rps_uses_slpc(rps))
> +		return slpc->max_freq_softlimit;
> +	else
> +		return intel_gpu_freq(rps, rps->max_freq_softlimit);
> +}
> +
> +u32 intel_rps_get_rp0_frequency(struct intel_rps *rps)
> +{
> +	struct intel_guc_slpc *slpc = rps_to_slpc(rps);
> +
> +	if (rps_uses_slpc(rps))
> +		return slpc->rp0_freq;
> +	else
> +		return intel_gpu_freq(rps, rps->rp0_freq);
> +}
> +
> +u32 intel_rps_get_rp1_frequency(struct intel_rps *rps)
> +{
> +	struct intel_guc_slpc *slpc = rps_to_slpc(rps);
> +
> +	if (rps_uses_slpc(rps))
> +		return slpc->rp1_freq;
> +	else
> +		return intel_gpu_freq(rps, rps->rp1_freq);
> +}
> +
> +u32 intel_rps_get_rpn_frequency(struct intel_rps *rps)
> +{
> +	struct intel_guc_slpc *slpc = rps_to_slpc(rps);
> +
> +	if (rps_uses_slpc(rps))
> +		return slpc->min_freq;
> +	else
> +		return intel_gpu_freq(rps, rps->min_freq);
> +}
> +
> +int intel_rps_set_max_frequency(struct intel_rps *rps, u32 val)
> +{
> +	struct drm_i915_private *i915 = rps_to_i915(rps);
> +	struct intel_guc_slpc *slpc = rps_to_slpc(rps);
> +	int ret = 0;
> +
> +	if (rps_uses_slpc(rps))
> +		return intel_guc_slpc_set_max_freq(slpc, val);
> +
> +	mutex_lock(&rps->lock);
> +
> +	val = intel_freq_opcode(rps, val);
> +	if (val < rps->min_freq ||
> +	    val > rps->max_freq ||
> +	    val < rps->min_freq_softlimit) {
> +		ret = -EINVAL;
> +		goto unlock;
> +	}
> +
> +	if (val > rps->rp0_freq)
> +		drm_dbg(&i915->drm, "User requested overclocking to %d\n",
> +			  intel_gpu_freq(rps, val));
> +
> +	rps->max_freq_softlimit = val;
> +
> +	val = clamp_t(int, rps->cur_freq,
> +		      rps->min_freq_softlimit,
> +		      rps->max_freq_softlimit);
> +
> +	/*
> +	 * We still need *_set_rps to process the new max_delay and
> +	 * update the interrupt limits and PMINTRMSK even though
> +	 * frequency request may be unchanged.
> +	 */
> +	intel_rps_set(rps, val);
> +
> +unlock:
> +	mutex_unlock(&rps->lock);
> +
> +	return ret;
> +}
> +
> +u32 intel_rps_get_min_frequency(struct intel_rps *rps)
> +{
> +	struct intel_guc_slpc *slpc = rps_to_slpc(rps);
> +
> +	if (rps_uses_slpc(rps))
> +		return slpc->min_freq_softlimit;
> +	else
> +		return intel_gpu_freq(rps, rps->min_freq_softlimit);
> +}
> +
> +int intel_rps_set_min_frequency(struct intel_rps *rps, u32 val)
> +{
> +	struct intel_guc_slpc *slpc = rps_to_slpc(rps);
> +	int ret = 0;
> +
> +	if (rps_uses_slpc(rps))
> +		return intel_guc_slpc_set_min_freq(slpc, val);
> +
> +	mutex_lock(&rps->lock);
> +
> +	val = intel_freq_opcode(rps, val);
> +	if (val < rps->min_freq ||
> +	    val > rps->max_freq ||
> +	    val > rps->max_freq_softlimit) {
> +		ret = -EINVAL;
> +		goto unlock;
> +	}
> +
> +	rps->min_freq_softlimit = val;
> +
> +	val = clamp_t(int, rps->cur_freq,
> +		      rps->min_freq_softlimit,
> +		      rps->max_freq_softlimit);
> +
> +	/*
> +	 * We still need *_set_rps to process the new min_delay and
> +	 * update the interrupt limits and PMINTRMSK even though
> +	 * frequency request may be unchanged.
> +	 */
> +	intel_rps_set(rps, val);
> +
> +unlock:
> +	mutex_unlock(&rps->lock);
> +
> +	return ret;
> +}
> +
>  /* External interface for intel_ips.ko */
>  
>  static struct drm_i915_private __rcu *ips_mchdev;
> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.h b/drivers/gpu/drm/i915/gt/intel_rps.h
> index 1d2cfc98b510..6a66690dfb0f 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rps.h
> +++ b/drivers/gpu/drm/i915/gt/intel_rps.h
> @@ -31,6 +31,17 @@ int intel_gpu_freq(struct intel_rps *rps, int val);
>  int intel_freq_opcode(struct intel_rps *rps, int val);
>  u32 intel_rps_get_cagf(struct intel_rps *rps, u32 rpstat1);
>  u32 intel_rps_read_actual_frequency(struct intel_rps *rps);
> +u32 intel_rps_get_requested_frequency(struct intel_rps *rps);
> +u32 intel_rps_get_min_frequency(struct intel_rps *rps);
> +int intel_rps_set_min_frequency(struct intel_rps *rps, u32 val);
> +u32 intel_rps_get_max_frequency(struct intel_rps *rps);
> +int intel_rps_set_max_frequency(struct intel_rps *rps, u32 val);
> +u32 intel_rps_get_rp0_frequency(struct intel_rps *rps);
> +u32 intel_rps_get_rp1_frequency(struct intel_rps *rps);
> +u32 intel_rps_get_rpn_frequency(struct intel_rps *rps);
> +u32 intel_rps_read_punit_req(struct intel_rps *rps);
> +u32 intel_rps_get_req(struct intel_rps *rps, u32 pureq);
> +u32 intel_rps_read_punit_req_frequency(struct intel_rps *rps);
>  
>  void gen5_rps_irq_handler(struct intel_rps *rps);
>  void gen6_rps_irq_handler(struct intel_rps *rps, u32 pm_iir);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> index 134c57ca10b7..05d8870ec6da 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> @@ -301,6 +301,11 @@ int intel_guc_slpc_set_max_freq(struct intel_guc_slpc *slpc, u32 val)
>  	struct drm_i915_private *i915 = slpc_to_i915(slpc);
>  	intel_wakeref_t wakeref;
>  
> +	if ((val < slpc->min_freq) ||
> +	    (val > slpc->rp0_freq) ||
> +	    (val < slpc->min_freq_softlimit))
> +		return -EINVAL;
> +
>  	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
>  		ret = slpc_set_param(slpc,
>  			       SLPC_PARAM_GLOBAL_MAX_GT_UNSLICE_FREQ_MHZ,
> @@ -313,6 +318,8 @@ int intel_guc_slpc_set_max_freq(struct intel_guc_slpc *slpc, u32 val)
>  		}
>  	}
>  
> +	slpc->max_freq_softlimit = val;
> +
>  	return ret;
>  }
>  
> @@ -359,6 +366,11 @@ int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val)
>  	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
>  	intel_wakeref_t wakeref;
>  
> +	if ((val < slpc->min_freq) ||
> +	    (val > slpc->rp0_freq) ||
> +	    (val > slpc->max_freq_softlimit))
> +		return -EINVAL;
> +
>  	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
>  		ret = slpc_set_param(slpc,
>  			       SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
> @@ -371,6 +383,8 @@ int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val)
>  		}
>  	}
>  
> +	slpc->min_freq_softlimit = val;
> +
>  	return ret;
>  }
>  
> diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
> index 34d37d46a126..a896bec18255 100644
> --- a/drivers/gpu/drm/i915/i915_pmu.c
> +++ b/drivers/gpu/drm/i915/i915_pmu.c
> @@ -407,7 +407,7 @@ frequency_sample(struct intel_gt *gt, unsigned int period_ns)
>  
>  	if (pmu->enable & config_mask(I915_PMU_REQUESTED_FREQUENCY)) {
>  		add_sample_mult(&pmu->sample[__I915_SAMPLE_FREQ_REQ],
> -				intel_gpu_freq(rps, rps->cur_freq),
> +				intel_rps_get_requested_frequency(rps),
>  				period_ns / 1000);
>  	}
>  
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 92392c1da0e6..a5d893625736 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -9198,6 +9198,8 @@ enum {
>  #define   GEN9_FREQUENCY(x)			((x) << 23)
>  #define   GEN6_OFFSET(x)			((x) << 19)
>  #define   GEN6_AGGRESSIVE_TURBO			(0 << 15)
> +#define   GEN9_SW_REQ_UNSLICE_RATIO_SHIFT 	23
> +
>  #define GEN6_RC_VIDEO_FREQ			_MMIO(0xA00C)
>  #define GEN6_RC_CONTROL				_MMIO(0xA090)
>  #define   GEN6_RC_CTL_RC6pp_ENABLE		(1 << 16)
> diff --git a/drivers/gpu/drm/i915/i915_sysfs.c b/drivers/gpu/drm/i915/i915_sysfs.c
> index 873bf996ceb5..346646a0b43b 100644
> --- a/drivers/gpu/drm/i915/i915_sysfs.c
> +++ b/drivers/gpu/drm/i915/i915_sysfs.c
> @@ -272,7 +272,7 @@ static ssize_t gt_cur_freq_mhz_show(struct device *kdev,
>  	struct drm_i915_private *i915 = kdev_minor_to_i915(kdev);
>  	struct intel_rps *rps = &i915->gt.rps;
>  
> -	return sysfs_emit(buf, "%d\n", intel_gpu_freq(rps, rps->cur_freq));
> +	return sysfs_emit(buf, "%d\n", intel_rps_get_requested_frequency(rps));
>  }
>  
>  static ssize_t gt_boost_freq_mhz_show(struct device *kdev, struct device_attribute *attr, char *buf)
> @@ -326,9 +326,10 @@ static ssize_t vlv_rpe_freq_mhz_show(struct device *kdev,
>  static ssize_t gt_max_freq_mhz_show(struct device *kdev, struct device_attribute *attr, char *buf)
>  {
>  	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
> -	struct intel_rps *rps = &dev_priv->gt.rps;
> +	struct intel_gt *gt = &dev_priv->gt;
> +	struct intel_rps *rps = &gt->rps;
>  
> -	return sysfs_emit(buf, "%d\n", intel_gpu_freq(rps, rps->max_freq_softlimit));
> +	return sysfs_emit(buf, "%d\n", intel_rps_get_max_frequency(rps));
>  }
>  
>  static ssize_t gt_max_freq_mhz_store(struct device *kdev,
> @@ -336,7 +337,8 @@ static ssize_t gt_max_freq_mhz_store(struct device *kdev,
>  				     const char *buf, size_t count)
>  {
>  	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
> -	struct intel_rps *rps = &dev_priv->gt.rps;
> +	struct intel_gt *gt = &dev_priv->gt;
> +	struct intel_rps *rps = &gt->rps;
>  	ssize_t ret;
>  	u32 val;
>  
> @@ -344,35 +346,7 @@ static ssize_t gt_max_freq_mhz_store(struct device *kdev,
>  	if (ret)
>  		return ret;
>  
> -	mutex_lock(&rps->lock);
> -
> -	val = intel_freq_opcode(rps, val);
> -	if (val < rps->min_freq ||
> -	    val > rps->max_freq ||
> -	    val < rps->min_freq_softlimit) {
> -		ret = -EINVAL;
> -		goto unlock;
> -	}
> -
> -	if (val > rps->rp0_freq)
> -		DRM_DEBUG("User requested overclocking to %d\n",
> -			  intel_gpu_freq(rps, val));
> -
> -	rps->max_freq_softlimit = val;
> -
> -	val = clamp_t(int, rps->cur_freq,
> -		      rps->min_freq_softlimit,
> -		      rps->max_freq_softlimit);
> -
> -	/*
> -	 * We still need *_set_rps to process the new max_delay and
> -	 * update the interrupt limits and PMINTRMSK even though
> -	 * frequency request may be unchanged.
> -	 */
> -	intel_rps_set(rps, val);
> -
> -unlock:
> -	mutex_unlock(&rps->lock);
> +	ret = intel_rps_set_max_frequency(rps, val);
>  
>  	return ret ?: count;
>  }
> @@ -380,9 +354,10 @@ static ssize_t gt_max_freq_mhz_store(struct device *kdev,
>  static ssize_t gt_min_freq_mhz_show(struct device *kdev, struct device_attribute *attr, char *buf)
>  {
>  	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
> -	struct intel_rps *rps = &dev_priv->gt.rps;
> +	struct intel_gt *gt = &dev_priv->gt;
> +	struct intel_rps *rps = &gt->rps;
>  
> -	return sysfs_emit(buf, "%d\n", intel_gpu_freq(rps, rps->min_freq_softlimit));
> +	return sysfs_emit(buf, "%d\n", intel_rps_get_min_frequency(rps));
>  }
>  
>  static ssize_t gt_min_freq_mhz_store(struct device *kdev,
> @@ -398,31 +373,7 @@ static ssize_t gt_min_freq_mhz_store(struct device *kdev,
>  	if (ret)
>  		return ret;
>  
> -	mutex_lock(&rps->lock);
> -
> -	val = intel_freq_opcode(rps, val);
> -	if (val < rps->min_freq ||
> -	    val > rps->max_freq ||
> -	    val > rps->max_freq_softlimit) {
> -		ret = -EINVAL;
> -		goto unlock;
> -	}
> -
> -	rps->min_freq_softlimit = val;
> -
> -	val = clamp_t(int, rps->cur_freq,
> -		      rps->min_freq_softlimit,
> -		      rps->max_freq_softlimit);
> -
> -	/*
> -	 * We still need *_set_rps to process the new min_delay and
> -	 * update the interrupt limits and PMINTRMSK even though
> -	 * frequency request may be unchanged.
> -	 */
> -	intel_rps_set(rps, val);
> -
> -unlock:
> -	mutex_unlock(&rps->lock);
> +	ret = intel_rps_set_min_frequency(rps, val);
>  
>  	return ret ?: count;
>  }
> @@ -448,11 +399,11 @@ static ssize_t gt_rp_mhz_show(struct device *kdev, struct device_attribute *attr
>  	u32 val;
>  
>  	if (attr == &dev_attr_gt_RP0_freq_mhz)
> -		val = intel_gpu_freq(rps, rps->rp0_freq);
> +		val = intel_rps_get_rp0_frequency(rps);
>  	else if (attr == &dev_attr_gt_RP1_freq_mhz)
> -		val = intel_gpu_freq(rps, rps->rp1_freq);
> +		val = intel_rps_get_rp1_frequency(rps);
>  	else if (attr == &dev_attr_gt_RPn_freq_mhz)
> -		val = intel_gpu_freq(rps, rps->min_freq);
> +		val = intel_rps_get_rpn_frequency(rps);
>  	else
>  		BUG();
>  
> 

LGTM, but likely you will want someone who is more familiar with RPS to
give r-b, from my side, with typo fixed, this is:

Acked-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
