Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A28F97BA25
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 11:29:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D74689101;
	Wed, 18 Sep 2024 09:29:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VH0NOZPO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1CBD89101;
 Wed, 18 Sep 2024 09:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726651795; x=1758187795;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=JeafycqQxEl4VvkrF3w8mPrUTJJvNEmTotRgPXPeDCE=;
 b=VH0NOZPOuW7N20GLmHkfI/+pP16blillMXxcVLF5SP6vqjMJ7DwjFFTZ
 cKl2cIv0BT/9CFKs+GGl/dyh2Z2TH18c1lZtm2yaJMLkbx1xjXUo0NMfa
 1Au6Y+BFjthLcZ3EaOYQk1Odrw6Qn22JTrOZ3ZpN3ijmFC9kABeF5bcB1
 VdpPJpjTOr77N38oY1xkbyIUT0lX3LcBNp0pssTxOxOeFpzABxgKAEe3d
 ErePyzPjp8MZpUgvJ7QSAORqNaGrwglrW//xYMWE/6mpUSudBFDw847og
 gPk0oADi0Pr8cV/Jnpq1GtjMvOVWoCDSgYcfEwTIvn4BvqARifG8A0UWo w==;
X-CSE-ConnectionGUID: 5M/A8s1KS82CSulz7mqq/g==
X-CSE-MsgGUID: LGh/5ooMSLytiQOl0jOqfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="43024081"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="43024081"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 02:29:54 -0700
X-CSE-ConnectionGUID: M6XzF8VwRy+CDitQq/cZrw==
X-CSE-MsgGUID: clrNjX+sRay4U6eosKHC+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="70272235"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.202])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 02:29:46 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Markus Elfring <Markus.Elfring@web.de>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org, Daniel
 Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>, Faith
 Ekstrand <faith.ekstrand@collabora.com>, Francois Dugast
 <francois.dugast@intel.com>, =?utf-8?Q?Jos=C3=A9?= Roberto de Souza
 <jose.souza@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Matt Roper
 <matthew.d.roper@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Ripard
 <mripard@kernel.org>, Nirmoy Das <nirmoy.das@intel.com>, Philippe Lecluse
 <philippe.lecluse@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Simona Vetter <simona@ffwll.ch>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/xe/query: Refactor copy_to_user() usage in four
 functions
In-Reply-To: <d1f1eb7f-1de7-4d73-a7d0-00cc1eac3d5d@web.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <d1f1eb7f-1de7-4d73-a7d0-00cc1eac3d5d@web.de>
Date: Wed, 18 Sep 2024 12:29:42 +0300
Message-ID: <87plp1b989.fsf@intel.com>
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

On Wed, 18 Sep 2024, Markus Elfring <Markus.Elfring@web.de> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 18 Sep 2024 09:43:07 +0200
>
> Assign return values from copy_to_user() calls to additional local variables
> so that four kfree() calls and return statements can be omitted accordingly.
>
> This issue was transformed by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/gpu/drm/xe/xe_query.c | 32 ++++++++++++--------------------
>  1 file changed, 12 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 5246a4a2740e..6195e720176d 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -220,13 +220,11 @@ static int query_engines(struct xe_device *xe,
>
>  	engines->num_engines = i;
>
> -	if (copy_to_user(query_ptr, engines, size)) {
> +	{

Please don't leave blocks like this behind when you remove the if.

BR,
Jani.

> +		unsigned long ctu = copy_to_user(query_ptr, engines, size);
>  		kfree(engines);
> -		return -EFAULT;
> +		return ctu ? -EFAULT : 0;
>  	}
> -	kfree(engines);
> -
> -	return 0;
>  }
>
>  static size_t calc_mem_regions_size(struct xe_device *xe)
> @@ -344,13 +342,11 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
>  	config->info[DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY] =
>  		xe_exec_queue_device_get_max_priority(xe);
>
> -	if (copy_to_user(query_ptr, config, size)) {
> +	{
> +		unsigned long ctu = copy_to_user(query_ptr, config, size);
>  		kfree(config);
> -		return -EFAULT;
> +		return ctu ? -EFAULT : 0;
>  	}
> -	kfree(config);
> -
> -	return 0;
>  }
>
>  static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query)
> @@ -414,13 +410,11 @@ static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query
>  			REG_FIELD_GET(GMD_ID_REVID, gt->info.gmdid);
>  	}
>
> -	if (copy_to_user(query_ptr, gt_list, size)) {
> +	{
> +		unsigned long ctu = copy_to_user(query_ptr, gt_list, size);
>  		kfree(gt_list);
> -		return -EFAULT;
> +		return ctu ? -EFAULT : 0;
>  	}
> -	kfree(gt_list);
> -
> -	return 0;
>  }
>
>  static int query_hwconfig(struct xe_device *xe,
> @@ -444,13 +438,11 @@ static int query_hwconfig(struct xe_device *xe,
>
>  	xe_guc_hwconfig_copy(&gt->uc.guc, hwconfig);
>
> -	if (copy_to_user(query_ptr, hwconfig, size)) {
> +	{
> +		unsigned long ctu = copy_to_user(query_ptr, hwconfig, size);
>  		kfree(hwconfig);
> -		return -EFAULT;
> +		return ctu ? -EFAULT : 0;
>  	}
> -	kfree(hwconfig);
> -
> -	return 0;
>  }
>
>  static size_t calc_topo_query_size(struct xe_device *xe)
> --
> 2.46.0
>

-- 
Jani Nikula, Intel
