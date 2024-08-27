Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA296961598
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 19:36:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB1BE10E3D7;
	Tue, 27 Aug 2024 17:36:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="GNQwbNL5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D77910E3D7
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 17:36:23 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-429ec9f2155so51225575e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 10:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1724780182; x=1725384982; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=AnCcCItuJ5G/haNqbjLIr2OaKlilLY6HRLhaTO1hMzY=;
 b=GNQwbNL5AHp0QjLDRfOF3Yf3+S21v56t/EF2bYy33aSC380uMdExHAeLiaLoJJdXVx
 msFPZUdV9Rz+qC8spxV5fG+mzJlPvJyqnxluVg0Bj274lEnTGygzWAGYcyQBGw9p8BTU
 UF19pWvOg8blFOx6L/ln2pYhKAHaS5Uf9noQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724780182; x=1725384982;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AnCcCItuJ5G/haNqbjLIr2OaKlilLY6HRLhaTO1hMzY=;
 b=oWYFKijw6PEavzeGAm19s2QQs1FBVGjBbI++xOvYnUdGf7S6hCv5T7BIQsCxWNZUgx
 GsG94NGnsvy5ZHTyjV6SoiNH5Xf+4PouDi7+1WKq1EwLtBwqYWfGQzeMHX7la38tkeHY
 3bMjVWB2PsGS7peHM608kHd7JgO9V6KiBIbzxZOSQxoJTmkkEYHP3JndVeKEjL28vvT0
 nUkeptvWJYL1E+kRdSDT5esuWoevE25JERSkZKhy+hYyWv00EtTGGN5jpZWQuIHYKVbU
 Qr8mS3caJaPvlROXyJzxbGVWG1kj6nNxmCR4PSfdqAIMCbDdnCupSAG0yL38mQthb3EL
 QWxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1Y3YI10BX73Gl3PDs35cQbLyHcwLuJ5ldQxkg2Cx5wyUbMgkTz8uCkQROrcx7BHHOyF9Qn7kOnRU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXLTfqltBri7uYfDroJQcAXfzdw4idiWpBBO8g3pMQV3++qQiT
 pHXyFQOzm7yfM3AZWwPIQf1QWSsjFkL2pY16VJU/dBX5v1XErhaDkk5tOJsEUqc=
X-Google-Smtp-Source: AGHT+IHyoz0EQ46mpXNv2pqYLC2FnI2RiE3bZEG7RjaFns5G0WOWxtKwTKGQwWa0uz6s1TF7Id5CfA==
X-Received: by 2002:adf:ecc7:0:b0:369:e72c:876c with SMTP id
 ffacd0b85a97d-37311909456mr9471022f8f.45.1724780181473; 
 Tue, 27 Aug 2024 10:36:21 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3730810fb33sm13551154f8f.13.2024.08.27.10.36.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2024 10:36:21 -0700 (PDT)
Date: Tue, 27 Aug 2024 19:36:19 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH v3 15/15] drm/i915/gt: Allow the user to change the CCS
 mode through sysfs
Message-ID: <Zs4Ok-9Kqc8ZfkxR@phenom.ffwll.local>
References: <20240823130855.72436-1-andi.shyti@linux.intel.com>
 <20240823130855.72436-16-andi.shyti@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823130855.72436-16-andi.shyti@linux.intel.com>
X-Operating-System: Linux phenom 6.9.12-amd64 
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

On Fri, Aug 23, 2024 at 03:08:55PM +0200, Andi Shyti wrote:
> Create the 'ccs_mode' file under
> 
> /sys/class/drm/cardX/gt/gt0/ccs_mode
> 
> This file allows the user to read and set the current CCS mode.
> 
>  - Reading: The user can read the current CCS mode, which can be
>    1, 2, or 4. This value is derived from the current engine
>    mask.
> 
>  - Writing: The user can set the CCS mode to 1, 2, or 4,
>    depending on the desired number of exposed engines and the
>    required load balancing.
> 
> The interface will return -EBUSY if other clients are connected
> to i915, or -EINVAL if an invalid value is set.

This does not agree with the code. The code is a _lot_ more clever.
-Sima

> 
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c | 82 ++++++++++++++++++++-
>  1 file changed, 80 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
> index cc46ee9dea3f..1ed6153ff8cf 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
> @@ -6,6 +6,7 @@
>  #include "i915_drv.h"
>  #include "intel_engine_user.h"
>  #include "intel_gt_ccs_mode.h"
> +#include "intel_gt_pm.h"
>  #include "intel_gt_print.h"
>  #include "intel_gt_regs.h"
>  #include "intel_gt_sysfs.h"
> @@ -172,7 +173,7 @@ static int rb_engine_cmp(struct rb_node *rb_new, const struct rb_node *rb_old)
>  	return new->uabi_class - old->uabi_class;
>  }
>  
> -static void __maybe_unused add_uabi_ccs_engines(struct intel_gt *gt, u32 ccs_mode)
> +static void add_uabi_ccs_engines(struct intel_gt *gt, u32 ccs_mode)
>  {
>  	struct drm_i915_private *i915 = gt->i915;
>  	intel_engine_mask_t new_ccs_mask, tmp;
> @@ -230,7 +231,7 @@ static void __maybe_unused add_uabi_ccs_engines(struct intel_gt *gt, u32 ccs_mod
>  	mutex_unlock(&i915->uabi_engines_mutex);
>  }
>  
> -static void __maybe_unused remove_uabi_ccs_engines(struct intel_gt *gt, u8 ccs_mode)
> +static void remove_uabi_ccs_engines(struct intel_gt *gt, u8 ccs_mode)
>  {
>  	struct drm_i915_private *i915 = gt->i915;
>  	intel_engine_mask_t new_ccs_mask, tmp;
> @@ -273,8 +274,85 @@ static ssize_t num_cslices_show(struct device *dev,
>  }
>  static DEVICE_ATTR_RO(num_cslices);
>  
> +static ssize_t ccs_mode_show(struct device *dev,
> +			     struct device_attribute *attr, char *buff)
> +{
> +	struct intel_gt *gt = kobj_to_gt(&dev->kobj);
> +	u32 ccs_mode;
> +
> +	ccs_mode = hweight32(gt->ccs.id_mask);
> +
> +	return sysfs_emit(buff, "%u\n", ccs_mode);
> +}
> +
> +static ssize_t ccs_mode_store(struct device *dev,
> +			      struct device_attribute *attr,
> +			      const char *buff, size_t count)
> +{
> +	struct intel_gt *gt = kobj_to_gt(&dev->kobj);
> +	int num_cslices = hweight32(CCS_MASK(gt));
> +	int ccs_mode = hweight32(gt->ccs.id_mask);
> +	ssize_t ret;
> +	u32 val;
> +
> +	ret = kstrtou32(buff, 0, &val);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * As of now possible values to be set are 1, 2, 4,
> +	 * up to the maximum number of available slices
> +	 */
> +	if (!val || val > num_cslices || (num_cslices % val))
> +		return -EINVAL;
> +
> +	/* Let's wait until the GT is no longer in use */
> +	ret = intel_gt_pm_wait_for_idle(gt);
> +	if (ret)
> +		return ret;
> +
> +	mutex_lock(&gt->wakeref.mutex);
> +
> +	/*
> +	 * Let's check again that the GT is idle,
> +	 * we don't want to change the CCS mode
> +	 * while someone is using the GT
> +	 */
> +	if (intel_gt_pm_is_awake(gt)) {
> +		ret = -EBUSY;
> +		goto out;
> +	}
> +
> +	/*
> +	 * Nothing to do if the requested setting
> +	 * is the same as the current one
> +	 */
> +	if (val == ccs_mode)
> +		goto out;
> +	else if (val > ccs_mode)
> +		add_uabi_ccs_engines(gt, val);
> +	else
> +		remove_uabi_ccs_engines(gt, val);
> +
> +out:
> +	mutex_unlock(&gt->wakeref.mutex);
> +
> +	return ret ?: count;
> +}
> +static DEVICE_ATTR_RW(ccs_mode);
> +
>  void intel_gt_sysfs_ccs_init(struct intel_gt *gt)
>  {
>  	if (sysfs_create_file(&gt->sysfs_gt, &dev_attr_num_cslices.attr))
>  		gt_warn(gt, "Failed to create sysfs num_cslices files\n");
> +
> +	/*
> +	 * Do not create the ccs_mode file for non DG2 platforms
> +	 * because they don't need it as they have only one CCS engine
> +	 */
> +	if (!IS_DG2(gt->i915))
> +		return;
> +
> +	if (sysfs_create_file(&gt->sysfs_gt, &dev_attr_ccs_mode.attr))
> +		gt_warn(gt, "Failed to create sysfs ccs_mode files\n");
>  }
> -- 
> 2.45.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
