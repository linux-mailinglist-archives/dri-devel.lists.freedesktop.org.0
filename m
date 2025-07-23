Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F735B0F4C2
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 16:01:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 855BC10E05E;
	Wed, 23 Jul 2025 14:00:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LaNj516z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 110E810E05E;
 Wed, 23 Jul 2025 14:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753279248; x=1784815248;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3jN44jS9jJD88nKaWGNgZjFEgmcnbW+yQM1DzmF/ZOA=;
 b=LaNj516zXqPllU+gGP5kOfjwAaFz4XpGBq2cEQdMGT1H/XsN17a/GOA2
 wr2vWJ5hzWcMTjvsGh5+5CjW9t0dNoRYBFZtA1qw+4Ry+oa5yvD9cfDmT
 zImzoDFeIt/nVzweO0T5FgSLOcPMaWZ4YbkG/Tks2w4eA1fbLcNvD6ico
 pStghhsPBdrgoba7iYrKnZHkYthw0X6chzoka8aY+OiNtRoe/WK5rsOpe
 1AJ2T6UtI6JcQl+IpXPKg4tQKAu60OtGV3+zz3e6YUOzD3wdjs0iybRMq
 6P8DuB9Edf3vs8S+BK+aL5ucDncvjPyoqRW3SqX/sSfuQlH2VZe+xOOQk g==;
X-CSE-ConnectionGUID: hK3k8NT+S82FD/UqXw43Ww==
X-CSE-MsgGUID: EcPB9MGvQo2XHpliR78vOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="65824519"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="65824519"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 07:00:48 -0700
X-CSE-ConnectionGUID: iWTJPjOTSsa1pa0cHUmROw==
X-CSE-MsgGUID: G71UOMzmQ/SvGD+x7D9nLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="159170041"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 07:00:43 -0700
Date: Wed, 23 Jul 2025 17:00:40 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, aravind.iddamsetty@linux.intel.com,
 umesh.nerlige.ramappa@intel.com, frank.scarbrough@intel.com,
 sk.anirban@intel.com, simona.vetter@ffwll.ch, airlied@gmail.com
Subject: Re: [PATCH v5 4/9] drm/xe/xe_survivability: Refactor survivability
 mode
Message-ID: <aIDrCMRK2gPGmIs6@black.fi.intel.com>
References: <20250715104730.2109506-1-riana.tauro@intel.com>
 <20250715104730.2109506-5-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715104730.2109506-5-riana.tauro@intel.com>
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

On Tue, Jul 15, 2025 at 04:17:24PM +0530, Riana Tauro wrote:
> The patches in these series refactor the boot survivability code to
> allow adding runtime survivability
> Refactor existing code to separate both the modes

Punctuations please!

> This patch renames the functions and separates init and enable

...

>  static ssize_t survivability_mode_show(struct device *dev,
>  				       struct device_attribute *attr, char *buff)
>  {
> @@ -130,6 +138,11 @@ static ssize_t survivability_mode_show(struct device *dev,
>  	struct xe_survivability_info *info = survivability->info;
>  	int index = 0, count = 0;
>  
> +	count += sysfs_emit_at(buff, count, "Survivability mode type: Boot\n");

Although I'm okay with this but, should we make it something more parseable
from userspace?

> +	if (!check_boot_failure(xe))
> +		return count;
> +

...

> +int xe_survivability_mode_boot_enable(struct xe_device *xe)
>  {
>  	struct xe_survivability *survivability = &xe->survivability;
> -	struct xe_survivability_info *info;
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	int ret;
>  
>  	if (!xe_survivability_mode_is_requested(xe))
>  		return 0;
>  
> -	survivability->size = MAX_SCRATCH_MMIO;
> -
> -	info = devm_kcalloc(xe->drm.dev, survivability->size, sizeof(*info),
> -			    GFP_KERNEL);
> -	if (!info)
> -		return -ENOMEM;
> -
> -	survivability->info = info;
> -
> -	populate_survivability_info(xe);
> +	ret = init_survivability_mode(xe);
> +	if (ret)
> +		return ret;
>  
> -	/* Only log debug information and exit if it is a critical failure */
> +	/* Log breadcrumbs but do not enter survivability mode for Critical boot errors */
>  	if (survivability->boot_status == CRITICAL_FAILURE) {
>  		log_survivability_info(pdev);

I'm not much informed about the history here, but should we be logging the
scratchs if we consider them sensitive?

Raag
