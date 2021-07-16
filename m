Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1703CBD93
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 22:16:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7304C6E9F1;
	Fri, 16 Jul 2021 20:16:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A04C86E9F4;
 Fri, 16 Jul 2021 20:16:10 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10047"; a="198048758"
X-IronPort-AV: E=Sophos;i="5.84,245,1620716400"; d="scan'208";a="198048758"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 13:16:09 -0700
X-IronPort-AV: E=Sophos;i="5.84,245,1620716400"; d="scan'208";a="460865102"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 13:16:09 -0700
Date: Fri, 16 Jul 2021 13:04:50 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 39/51] drm/i915/guc: Connect reset modparam updates to
 GuC policy flags
Message-ID: <20210716200450.GA27372@sdutt-i7>
References: <20210716201724.54804-1-matthew.brost@intel.com>
 <20210716201724.54804-40-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210716201724.54804-40-matthew.brost@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 16, 2021 at 01:17:12PM -0700, Matthew Brost wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> Changing the reset module parameter has no effect on a running GuC.
> The corresponding entry in the ADS must be updated and then the GuC
> informed via a Host2GuC message.
> 
> The new debugfs interface to module parameters allows this to happen.
> However, connecting the parameter data address back to anything useful
> is messy. One option would be to pass a new private data structure
> address through instead of just the parameter pointer. However, that
> means having a new (and different) data structure for each parameter
> and a new (and different) write function for each parameter. This
> method keeps everything generic by instead using a string lookup on
> the directory entry name.
> 
> Signed-off-by: John Harrison <john.c.harrison@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c |  2 +-
>  drivers/gpu/drm/i915/i915_debugfs_params.c | 31 ++++++++++++++++++++++
>  2 files changed, 32 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> index 2ad5fcd4e1b7..c6d0b762d82c 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> @@ -99,7 +99,7 @@ static int guc_action_policies_update(struct intel_guc *guc, u32 policy_offset)
>  		policy_offset
>  	};
>  
> -	return intel_guc_send(guc, action, ARRAY_SIZE(action));
> +	return intel_guc_send_busy_loop(guc, action, ARRAY_SIZE(action), 0, true);
>  }
>  
>  int intel_guc_global_policies_update(struct intel_guc *guc)
> diff --git a/drivers/gpu/drm/i915/i915_debugfs_params.c b/drivers/gpu/drm/i915/i915_debugfs_params.c
> index 4e2b077692cb..8ecd8b42f048 100644
> --- a/drivers/gpu/drm/i915/i915_debugfs_params.c
> +++ b/drivers/gpu/drm/i915/i915_debugfs_params.c
> @@ -6,9 +6,20 @@
>  #include <linux/kernel.h>
>  
>  #include "i915_debugfs_params.h"
> +#include "gt/intel_gt.h"
> +#include "gt/uc/intel_guc.h"
>  #include "i915_drv.h"
>  #include "i915_params.h"
>  
> +#define MATCH_DEBUGFS_NODE_NAME(_file, _name)	(strcmp((_file)->f_path.dentry->d_name.name, (_name)) == 0)
> +
> +#define GET_I915(i915, name, ptr)	\
> +	do {	\
> +		struct i915_params *params;	\
> +		params = container_of(((void *) (ptr)), typeof(*params), name);	\
> +		(i915) = container_of(params, typeof(*(i915)), params);	\
> +	} while(0)
> +
>  /* int param */
>  static int i915_param_int_show(struct seq_file *m, void *data)
>  {
> @@ -24,6 +35,16 @@ static int i915_param_int_open(struct inode *inode, struct file *file)
>  	return single_open(file, i915_param_int_show, inode->i_private);
>  }
>  
> +static int notify_guc(struct drm_i915_private *i915)
> +{
> +	int ret = 0;
> +
> +	if (intel_uc_uses_guc_submission(&i915->gt.uc))
> +		ret = intel_guc_global_policies_update(&i915->gt.uc.guc);
> +
> +	return ret;
> +}
> +
>  static ssize_t i915_param_int_write(struct file *file,
>  				    const char __user *ubuf, size_t len,
>  				    loff_t *offp)
> @@ -81,8 +102,10 @@ static ssize_t i915_param_uint_write(struct file *file,
>  				     const char __user *ubuf, size_t len,
>  				     loff_t *offp)
>  {
> +	struct drm_i915_private *i915;
>  	struct seq_file *m = file->private_data;
>  	unsigned int *value = m->private;
> +	unsigned int old = *value;
>  	int ret;
>  
>  	ret = kstrtouint_from_user(ubuf, len, 0, value);
> @@ -95,6 +118,14 @@ static ssize_t i915_param_uint_write(struct file *file,
>  			*value = b;
>  	}
>  
> +	if (!ret && MATCH_DEBUGFS_NODE_NAME(file, "reset")) {
> +		GET_I915(i915, reset, value);
> +
> +		ret = notify_guc(i915);
> +		if (ret)
> +			*value = old;
> +	}
> +
>  	return ret ?: len;
>  }
>  
> -- 
> 2.28.0
> 
