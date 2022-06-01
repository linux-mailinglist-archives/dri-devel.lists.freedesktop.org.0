Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DB5539CD9
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 08:00:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 871DE1131E6;
	Wed,  1 Jun 2022 05:59:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E33C91131E3;
 Wed,  1 Jun 2022 05:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654063197; x=1685599197;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=cGwxg1BWZdIM5jLKiLmL6SgOiujqlF1KK+dkcSZQcHo=;
 b=mGwZ0P0ECwRH350Xkr3s6El9s5RZHprWybFKkFvQntZJageMWDmFH3y5
 NL5NQe1etqDLUZGGhTmcSvZ7EQ9OpAVgjpR4MgODzdEgxT1NaQjDDBXgT
 TjZi166fbb1dmPzk6dbORj8T0cNWG40C6WidAdG/LZMgQvXhT/08b9oEA
 hmqfr+Ywu6C+1tlI7ZyHfm/jOE11GRvIDiSJ8exA8BZoSCmrqY7QBEN9E
 eYYRxZXZreZ5HXT8hAbaEyHcoN8t4LCzvXZPfRFkZRbMeNuHcb+9RgMU8
 0zeeMDBnrLKvbM556fep6rNvRtzv1j8Id0lis/9PuXMwpCTuKAsRQEo9p g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10364"; a="255352553"
X-IronPort-AV: E=Sophos;i="5.91,266,1647327600"; d="scan'208";a="255352553"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2022 22:59:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,266,1647327600"; d="scan'208";a="823602242"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga006.fm.intel.com with ESMTP; 31 May 2022 22:59:57 -0700
Received: from [10.249.151.195] (unknown [10.249.151.195])
 by linux.intel.com (Postfix) with ESMTP id 62B815808AE;
 Tue, 31 May 2022 22:59:56 -0700 (PDT)
Message-ID: <f78258ce-24ec-eaec-b2de-9baf544676b6@intel.com>
Date: Wed, 1 Jun 2022 08:59:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [Intel-gfx] [PATCH v2 2/6] drm/i915/xehp: Drop GETPARAM lookups
 of I915_PARAM_[SUB]SLICE_MASK
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220517032005.2694737-1-matthew.d.roper@intel.com>
 <20220517032005.2694737-3-matthew.d.roper@intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <20220517032005.2694737-3-matthew.d.roper@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/05/2022 06:20, Matt Roper wrote:
> Slice/subslice/EU information should be obtained via the topology
> queries provided by the I915_QUERY interface; let's turn off support for
> the old GETPARAM lookups on Xe_HP and beyond where we can't return
> meaningful values.
>
> The slice mask lookup is meaningless since Xe_HP doesn't support
> traditional slices (and we make no attempt to return the various new
> units like gslices, cslices, mslices, etc.) here.
>
> The subslice mask lookup is even more problematic; given the distinct
> masks for geometry vs compute purposes, the combined mask returned here
> is likely not what userspace would want to act upon anyway.  The value
> is also limited to 32-bits by the nature of the GETPARAM ioctl which is
> sufficient for the initial Xe_HP platforms, but is unable to convey the
> larger masks that will be needed on other upcoming platforms.  Finally,
> the value returned here becomes even less meaningful when used on
> multi-tile platforms where each tile will have its own masks.
>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Sounds fair. We've been relying on the topology query in Mesa since it's 
available and it's a requirement for Gfx10+.

FYI, we're also not using I915_PARAM_EU_TOTAL on Gfx10+ for the same reason.


Acked-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>


> ---
>   drivers/gpu/drm/i915/i915_getparam.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/i915_getparam.c b/drivers/gpu/drm/i915/i915_getparam.c
> index c12a0adefda5..ac9767c56619 100644
> --- a/drivers/gpu/drm/i915/i915_getparam.c
> +++ b/drivers/gpu/drm/i915/i915_getparam.c
> @@ -148,11 +148,19 @@ int i915_getparam_ioctl(struct drm_device *dev, void *data,
>   		value = intel_engines_has_context_isolation(i915);
>   		break;
>   	case I915_PARAM_SLICE_MASK:
> +		/* Not supported from Xe_HP onward; use topology queries */
> +		if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50))
> +			return -EINVAL;
> +
>   		value = sseu->slice_mask;
>   		if (!value)
>   			return -ENODEV;
>   		break;
>   	case I915_PARAM_SUBSLICE_MASK:
> +		/* Not supported from Xe_HP onward; use topology queries */
> +		if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50))
> +			return -EINVAL;
> +
>   		/* Only copy bits from the first slice */
>   		memcpy(&value, sseu->subslice_mask,
>   		       min(sseu->ss_stride, (u8)sizeof(value)));


