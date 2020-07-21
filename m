Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CD2229183
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jul 2020 09:03:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 488756E5BE;
	Wed, 22 Jul 2020 07:02:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 269A16E424;
 Tue, 21 Jul 2020 16:01:01 +0000 (UTC)
IronPort-SDR: 5B9LAzehoIvEbBDdvpqOChS1x8AWCh+wpJPqXOI3J6KfieBBymlAUes4lVTAxmf4oFagIPz3gN
 MatZca/C5kPA==
X-IronPort-AV: E=McAfee;i="6000,8403,9689"; a="149317288"
X-IronPort-AV: E=Sophos;i="5.75,379,1589266800"; d="scan'208";a="149317288"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2020 09:01:00 -0700
IronPort-SDR: ZaKq67pMrZn6Fm9phMZIm9o0L6OqSDfdBjzsrC9q79xMY2MRISyHjiyvS6v7UIer/mwHjnUXhc
 3n/5AxzSEnmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,379,1589266800"; d="scan'208";a="432043968"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga004.jf.intel.com with ESMTP; 21 Jul 2020 09:00:58 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1jxuhO-0035zQ-T5; Tue, 21 Jul 2020 19:00:58 +0300
Date: Tue, 21 Jul 2020 19:00:58 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v1] drm/i915/dsi: Drop double check for ACPI companion
 device
Message-ID: <20200721160058.GP3703480@smile.fi.intel.com>
References: <20200529123317.20470-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200529123317.20470-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Approved-At: Wed, 22 Jul 2020 07:02:50 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 29, 2020 at 03:33:17PM +0300, Andy Shevchenko wrote:
> acpi_dev_get_resources() does perform the NULL pointer check against
> ACPI companion device which is given as function parameter. Thus,
> there is no need to duplicate this check in the caller.

Any comment so far?

> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dsi_vbt.c | 24 ++++++++------------
>  1 file changed, 10 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
> index 574dcfec9577..6f9e08cda964 100644
> --- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
> +++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
> @@ -426,23 +426,19 @@ static void i2c_acpi_find_adapter(struct intel_dsi *intel_dsi,
>  {
>  	struct drm_device *drm_dev = intel_dsi->base.base.dev;
>  	struct device *dev = &drm_dev->pdev->dev;
> -	struct acpi_device *acpi_dev;
> +	struct acpi_device *acpi_dev = ACPI_COMPANION(dev);
>  	struct list_head resource_list;
>  	struct i2c_adapter_lookup lookup;
>  
> -	acpi_dev = ACPI_COMPANION(dev);
> -	if (acpi_dev) {
> -		memset(&lookup, 0, sizeof(lookup));
> -		lookup.slave_addr = slave_addr;
> -		lookup.intel_dsi = intel_dsi;
> -		lookup.dev_handle = acpi_device_handle(acpi_dev);
> -
> -		INIT_LIST_HEAD(&resource_list);
> -		acpi_dev_get_resources(acpi_dev, &resource_list,
> -				       i2c_adapter_lookup,
> -				       &lookup);
> -		acpi_dev_free_resource_list(&resource_list);
> -	}
> +	memset(&lookup, 0, sizeof(lookup));
> +	lookup.slave_addr = slave_addr;
> +	lookup.intel_dsi = intel_dsi;
> +	lookup.dev_handle = acpi_device_handle(acpi_dev);
> +
> +	INIT_LIST_HEAD(&resource_list);
> +	acpi_dev_get_resources(acpi_dev, &resource_list,
> +			       i2c_adapter_lookup, &lookup);
> +	acpi_dev_free_resource_list(&resource_list);
>  }
>  #else
>  static inline void i2c_acpi_find_adapter(struct intel_dsi *intel_dsi,
> -- 
> 2.26.2
> 

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
