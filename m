Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E38551C055
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 15:14:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0068910E30E;
	Thu,  5 May 2022 13:14:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50C7210E30E;
 Thu,  5 May 2022 13:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651756475; x=1683292475;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=H/4vih/4+18s6ROnxbsj2OrBV/jfRttDjakKv5cWhoo=;
 b=PEfujXl1P3OILlxMak2xeg4KbWXJbI62iVXG/qM7ughC/kSR/E6H4QlV
 XVA9B3xBQyyCLnTjgmAQpWENPoYqOLRjc2wqWiNlw3AmEFzA5yiDYK+PD
 aqq/T9xWT+l03X8WtJuAsE31rvtpB/XyTRw+DeFU3O/J541XSZscArNlR
 PWY5omEdqYpOrtxBa3HiHzEAWGwIQVBE6yR6rBsXcB6T3uqDWXCzUf+4r
 qLxWawFPS/YKpMr1A9odHIzCdvq7ZyjH9mYhL5eTtMVwaoqpzzw0EzWd+
 tbrfKDf78mGV+zr/I+zuGRK30Z/YEjLWjePinsTw4Tc+TjU5hQiEb+GVh A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10337"; a="267992892"
X-IronPort-AV: E=Sophos;i="5.91,201,1647327600"; d="scan'208";a="267992892"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 06:14:34 -0700
X-IronPort-AV: E=Sophos;i="5.91,201,1647327600"; d="scan'208";a="517501332"
Received: from mrbroom-mobl.ger.corp.intel.com (HELO [10.213.206.41])
 ([10.213.206.41])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 06:14:33 -0700
Message-ID: <b9651f2f-64dc-78a7-d100-0bd70d1a2493@linux.intel.com>
Date: Thu, 5 May 2022 14:14:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [Intel-gfx] [PATCH v7 6/7] drm/i915/gt: Create per-tile RPS sysfs
 interfaces
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
References: <20220318233938.149744-1-andi.shyti@linux.intel.com>
 <20220318233938.149744-7-andi.shyti@linux.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220318233938.149744-7-andi.shyti@linux.intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Andi,

On 18/03/2022 23:39, Andi Shyti wrote:
> Now tiles have their own sysfs interfaces under the gt/
> directory. Because RPS is a property that can be configured on a
> tile basis, then each tile should have its own interface
> 
> The new sysfs structure will have a similar layout for the 4 tile
> case:
> 
> /sys/.../card0
>           ├── gt
>           │   ├── gt0
>           │   │   ├── id
>           │   │   ├── rc6_enable
>           │   │   ├── rc6_residency_ms
>           │   │   ├── rps_act_freq_mhz
>           │   │   ├── rps_boost_freq_mhz
>           │   │   ├── rps_cur_freq_mhz
>           │   │   ├── rps_max_freq_mhz
>           │   │   ├── rps_min_freq_mhz
>           │   │   ├── rps_RP0_freq_mhz
>           │   │   ├── rps_RP1_freq_mhz
>           │   │   └── rps_RPn_freq_mhz
>           .   .
>           .   .
>           .   .
>           │   └── gtN
>           │       ├── id
>           │       ├── rc6_enable
>           │       ├── rc6_residency_ms
>           │       ├── rps_act_freq_mhz
>           │       ├── rps_boost_freq_mhz
>           │       ├── rps_cur_freq_mhz
>           │       ├── rps_max_freq_mhz
>           │       ├── rps_min_freq_mhz
>           │       ├── rps_RP0_freq_mhz
>           │       ├── rps_RP1_freq_mhz
>           │       └── rps_RPn_freq_mhz
>           ├── gt_act_freq_mhz   -+
>           ├── gt_boost_freq_mhz  |
>           ├── gt_cur_freq_mhz    |    Original interface
>           ├── gt_max_freq_mhz    +─-> kept as existing ABI;
>           ├── gt_min_freq_mhz    |    it points to gt0/
>           ├── gt_RP0_freq_mhz    |
>           ├── gt_RP1_freq_mhz    |
>           └── gt_RPn_freq_mhz   -+
> 
> The existing interfaces have been kept in their original location
> to preserve the existing ABI. They act on all the GTs: when
> writing they loop through all the GTs and write the information
> on each interface. When reading they provide the average value
> from all the GTs.
> 
> This patch is not really adding exposing new interfaces (new
> ABI) other than adapting the existing one to more tiles. In any
> case this new set of interfaces will be a basic tool for system
> managers and administrators when using i915.
> 
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c | 283 ++++++++++++++++++++
>   drivers/gpu/drm/i915/i915_sysfs.c           | 177 ------------
>   2 files changed, 283 insertions(+), 177 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
> index 144b004e4de82..b0a1ea95d028e 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
> @@ -14,6 +14,7 @@
>   #include "intel_gt_sysfs.h"
>   #include "intel_gt_sysfs_pm.h"
>   #include "intel_rc6.h"
> +#include "intel_rps.h"
>   
>   #ifdef CONFIG_PM
>   enum intel_gt_sysfs_op {
> @@ -21,6 +22,30 @@ enum intel_gt_sysfs_op {
>   	INTEL_GT_SYSFS_MAX,
>   };
>   
> +static int
> +sysfs_gt_attribute_w_func(struct device *dev, struct device_attribute *attr,
> +			  int (func)(struct intel_gt *gt, u32 val), u32 val)
> +{
> +	struct intel_gt *gt;
> +	int ret;
> +
> +	if (!is_object_gt(&dev->kobj)) {
> +		int i;
> +		struct drm_i915_private *i915 = kdev_minor_to_i915(dev);
> +
> +		for_each_gt(gt, i915, i) {
> +			ret = func(gt, val);
> +			if (ret)
> +				break;
> +		}
> +	} else {
> +		gt = intel_gt_sysfs_get_drvdata(dev, attr->attr.name);
> +		ret = func(gt, val);
> +	}
> +
> +	return ret;
> +}
> +
>   static u32
>   sysfs_gt_attribute_r_func(struct device *dev, struct device_attribute *attr,
>   			  u32 (func)(struct intel_gt *gt),
> @@ -62,6 +87,7 @@ sysfs_gt_attribute_r_func(struct device *dev, struct device_attribute *attr,
>   #define sysfs_gt_attribute_r_min_func(d, a, f) \
>   		sysfs_gt_attribute_r_func(d, a, f, INTEL_GT_SYSFS_MIN)
>   
> +/* Frequency interfaces will show the maximum frequency value */
>   #define sysfs_gt_attribute_r_max_func(d, a, f) \
>   		sysfs_gt_attribute_r_func(d, a, f, INTEL_GT_SYSFS_MAX)
>   
> @@ -238,7 +264,264 @@ static void intel_sysfs_rc6_init(struct intel_gt *gt, struct kobject *kobj)
>   }
>   #endif /* CONFIG_PM */
>   
> +static u32 __act_freq_mhz_show(struct intel_gt *gt)
> +{
> +	return intel_rps_read_actual_frequency(&gt->rps);
> +}
> +
> +static ssize_t act_freq_mhz_show(struct device *dev,
> +				 struct device_attribute *attr, char *buff)
> +{
> +	u32 actual_freq = sysfs_gt_attribute_r_max_func(dev, attr,
> +						    __act_freq_mhz_show);

Because sysfs_gt_attribute_r_max_func is only defined if CONFIG_PM is 
set, the !CONFIG_PM builds are broken. I guess just move it to be always 
available.

Regards,

Tvrtko
