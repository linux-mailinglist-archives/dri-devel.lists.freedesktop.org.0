Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAAA7E9BFD
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 13:17:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1046E10E364;
	Mon, 13 Nov 2023 12:17:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0F1410E363;
 Mon, 13 Nov 2023 12:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699877841; x=1731413841;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=nHw0lZSKBA0b0oTFnaz5EVD6m1j7Wu/WZcVlKDnDX04=;
 b=EjZNPtGpJAIkzizUz/XhxhQCRMrq5Rc1veFquYJkFGLhptPbm6IiqOvY
 C9cHLAsimGgV5fKWRTep7HFMrxZyd14xT6pNF5DL+TN+km//2XQben/4Y
 anVg+jDaPhIHYPKRDqEz8uQ8oAe391iMEcpXU8/LdM0XCHJdxhwilQ9HS
 4l1S2dBhVlYeg/zTZwqThMny44+ImL9LuAJnYzeaDO/0PuWLU8Do9Ej2r
 BJfjbx3ggiqCF/PrTI/0THcLi3xt5bB8UTHoDGUF+kZ1k3VIDqb7pP7Db
 aCcV7no3vZGpEC9xqqb6K0mCqDXy3VsC7RJaqBVtUp98TOqsTooBmb/tJ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="421521264"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="421521264"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 04:17:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="834700590"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="834700590"
Received: from cgheban-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.92])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 04:17:17 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Heiner Kallweit <hkallweit1@gmail.com>, Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH 15/20] drivers/gpu/drm/i915/display: remove
 I2C_CLASS_DDC support
In-Reply-To: <20231113112344.719-16-hkallweit1@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231113112344.719-1-hkallweit1@gmail.com>
 <20231113112344.719-16-hkallweit1@gmail.com>
Date: Mon, 13 Nov 2023 14:17:14 +0200
Message-ID: <87sf59vodx.fsf@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-i2c@vger.kernel.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 13 Nov 2023, Heiner Kallweit <hkallweit1@gmail.com> wrote:
> After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
> olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
> Class-based device auto-detection is a legacy mechanism and shouldn't
> be used in new code. So we can remove this class completely now.

So this is copy-pasted to all commits and the cover letter, but please
do explain why there are no functional changes here (or are there?),
without me having to go through the i2c stack and try to find the
commits alluded to in "After removal of the legacy ...".

What does this mean?


BR,
Jani.


>
> Preferably this series should be applied via the i2c tree.
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>
> ---
>  drivers/gpu/drm/i915/display/intel_gmbus.c |    1 -
>  drivers/gpu/drm/i915/display/intel_sdvo.c  |    1 -
>  2 files changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
> index 40d7b6f3f..e9e4dcf34 100644
> --- a/drivers/gpu/drm/i915/display/intel_gmbus.c
> +++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
> @@ -899,7 +899,6 @@ int intel_gmbus_setup(struct drm_i915_private *i915)
>  		}
>  
>  		bus->adapter.owner = THIS_MODULE;
> -		bus->adapter.class = I2C_CLASS_DDC;
>  		snprintf(bus->adapter.name,
>  			 sizeof(bus->adapter.name),
>  			 "i915 gmbus %s", gmbus_pin->name);
> diff --git a/drivers/gpu/drm/i915/display/intel_sdvo.c b/drivers/gpu/drm/i915/display/intel_sdvo.c
> index a636f42ce..5e64d1baf 100644
> --- a/drivers/gpu/drm/i915/display/intel_sdvo.c
> +++ b/drivers/gpu/drm/i915/display/intel_sdvo.c
> @@ -3311,7 +3311,6 @@ intel_sdvo_init_ddc_proxy(struct intel_sdvo_ddc *ddc,
>  	ddc->ddc_bus = ddc_bus;
>  
>  	ddc->ddc.owner = THIS_MODULE;
> -	ddc->ddc.class = I2C_CLASS_DDC;
>  	snprintf(ddc->ddc.name, I2C_NAME_SIZE, "SDVO %c DDC%d",
>  		 port_name(sdvo->base.port), ddc_bus);
>  	ddc->ddc.dev.parent = &pdev->dev;
>

-- 
Jani Nikula, Intel
