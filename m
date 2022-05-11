Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2389B522ED6
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 10:58:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74CA010E15C;
	Wed, 11 May 2022 08:58:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62C3C10E15C;
 Wed, 11 May 2022 08:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652259506; x=1683795506;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=EsqUYBIJvkF6TIvtjObR6yTIxML5iEfJ+ur/bVZD/uE=;
 b=kzsT0s0uJBnQ+O/8BuTxvS1BW9ef9vBoVz7moRQqcD38qdTAWNXUmtN6
 q7ovK7RLQNtmhtelT4IHlAXVbUUocDiVoAe8wGAsqXJZyOTHE1hLQ70vJ
 Aopa66iA/N3c96FdTjjhJgER489HIdBzWK2+aJCbbtSc7WAIiPQkESTft
 1Kdr6rl+d9cPTtQSD5GhtPWh6uBrMeauTQYr5qcGbB4+7OioU8Bqlq9gB
 25siwbEnB+GEvYAsEaG/Denq1+Tu8nJkPESwh9KEPLeG0Xy89e1gdo7d0
 Koc0V/S33yCcphRY/vC35PeFK1FjMz4tnSnQUrziXlFuHnru9A0It2jDC Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="269306634"
X-IronPort-AV: E=Sophos;i="5.91,216,1647327600"; d="scan'208";a="269306634"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 01:58:25 -0700
X-IronPort-AV: E=Sophos;i="5.91,216,1647327600"; d="scan'208";a="594018082"
Received: from kniesyn-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.131.79])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 01:58:24 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>, Intel GFX
 <intel-gfx@lists.freedesktop.org>, DRI Devel
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915/gt: Fix use of static in macro mismatch
In-Reply-To: <20220510140447.80200-1-andi.shyti@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220510140447.80200-1-andi.shyti@linux.intel.com>
Date: Wed, 11 May 2022 11:58:21 +0300
Message-ID: <87pmkkigya.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 10 May 2022, Andi Shyti <andi.shyti@linux.intel.com> wrote:
> The INTEL_GT_RPS_SYSFS_ATTR was creating to different structures
> but. When called with the "static" keyword this is affecting only
> the first structure, while the second is created as non static.
>
> Move the static keyword inside the macros to affect both the
> structures.
>
> Reported-by: Jani Nikula <jani.nikula@linux.intel.com>
> Fixes: 56a709cf77468 ("drm/i915/gt: Create per-tile RPS sysfs interfaces")
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c | 21 +++++++++++----------
>  1 file changed, 11 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
> index e92990d514b24..f76b6cf8040ec 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
> @@ -457,22 +457,23 @@ static ssize_t vlv_rpe_freq_mhz_show(struct device *dev,
>  }
>  
>  #define INTEL_GT_RPS_SYSFS_ATTR(_name, _mode, _show, _store) \
> -	struct device_attribute dev_attr_gt_##_name = __ATTR(gt_##_name, _mode, _show, _store); \
> -	struct device_attribute dev_attr_rps_##_name = __ATTR(rps_##_name, _mode, _show, _store)
> +	static struct device_attribute dev_attr_gt_##_name = __ATTR(gt_##_name, _mode, _show, _store); \
> +	static struct device_attribute dev_attr_rps_##_name = __ATTR(rps_##_name, _mode, _show, _store)
>  
>  #define INTEL_GT_RPS_SYSFS_ATTR_RO(_name)				\
>  		INTEL_GT_RPS_SYSFS_ATTR(_name, 0444, _name##_show, NULL)
>  #define INTEL_GT_RPS_SYSFS_ATTR_RW(_name)				\
>  		INTEL_GT_RPS_SYSFS_ATTR(_name, 0644, _name##_show, _name##_store)
>  
> -static INTEL_GT_RPS_SYSFS_ATTR_RO(act_freq_mhz);
> -static INTEL_GT_RPS_SYSFS_ATTR_RO(cur_freq_mhz);
> -static INTEL_GT_RPS_SYSFS_ATTR_RW(boost_freq_mhz);
> -static INTEL_GT_RPS_SYSFS_ATTR_RO(RP0_freq_mhz);
> -static INTEL_GT_RPS_SYSFS_ATTR_RO(RP1_freq_mhz);
> -static INTEL_GT_RPS_SYSFS_ATTR_RO(RPn_freq_mhz);
> -static INTEL_GT_RPS_SYSFS_ATTR_RW(max_freq_mhz);
> -static INTEL_GT_RPS_SYSFS_ATTR_RW(min_freq_mhz);
> +/* The below macros generate static structures */
> +INTEL_GT_RPS_SYSFS_ATTR_RO(act_freq_mhz);
> +INTEL_GT_RPS_SYSFS_ATTR_RO(cur_freq_mhz);
> +INTEL_GT_RPS_SYSFS_ATTR_RW(boost_freq_mhz);
> +INTEL_GT_RPS_SYSFS_ATTR_RO(RP0_freq_mhz);
> +INTEL_GT_RPS_SYSFS_ATTR_RO(RP1_freq_mhz);
> +INTEL_GT_RPS_SYSFS_ATTR_RO(RPn_freq_mhz);
> +INTEL_GT_RPS_SYSFS_ATTR_RW(max_freq_mhz);
> +INTEL_GT_RPS_SYSFS_ATTR_RW(min_freq_mhz);
>  
>  static DEVICE_ATTR_RO(vlv_rpe_freq_mhz);

-- 
Jani Nikula, Intel Open Source Graphics Center
