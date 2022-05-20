Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1ED052E884
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 11:15:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6CD310E99C;
	Fri, 20 May 2022 09:15:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A56C510E99C;
 Fri, 20 May 2022 09:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653038136; x=1684574136;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=7bqeTnQSercfdoIv7GPfGGYKU1mOpW+k3TZlf1B/vdU=;
 b=h+VTSjGMuIgUQkvkJQixKMK0veuSd57UBaJHNXH9N+hSogC2liVw/SOk
 dkiGyV7lYHSathdGVFwNAhRZPapsay+/+md7bltGBFXLcafHNH1DHI7Pa
 gIWNF/8rIwND6eJcH12i/XJjiVWoBxFWHr19O6xVAFkE7MTbuVm/lUgC8
 XemEl8UUIVY8XrK6+tECp9iTfaSmTdB7L2gQ4/Tdk05yJ2BQeO77Wl+LH
 /qMETDc4aw6iPryA3kRxfNYGhe0QwaZz6CjwNRSAMoNRJrGda5Bz+NtvX
 hQOZdE80xtzKHtVZLpKf7+/sz9+XTgul3aWIhbiqIRc7SgO43PIMcpj8F g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10352"; a="254604091"
X-IronPort-AV: E=Sophos;i="5.91,238,1647327600"; d="scan'208";a="254604091"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2022 02:15:36 -0700
X-IronPort-AV: E=Sophos;i="5.91,238,1647327600"; d="scan'208";a="570719159"
Received: from bpower2-mobl2.ger.corp.intel.com (HELO [10.213.200.132])
 ([10.213.200.132])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2022 02:15:34 -0700
Message-ID: <4123b22d-5018-bb08-4ae0-99140225dc1a@linux.intel.com>
Date: Fri, 20 May 2022 10:15:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 2/6] drm/i915/xehp: Drop GETPARAM lookups of
 I915_PARAM_[SUB]SLICE_MASK
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220517032005.2694737-1-matthew.d.roper@intel.com>
 <20220517032005.2694737-3-matthew.d.roper@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
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
Cc: Jordan Justen <jordan.l.justen@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 17/05/2022 04:20, Matt Roper wrote:
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

Just in case lets run this by Jordan and Lionel since it affects DG2. 
Anyone else on the userspace side who might be affected?

Regards,

Tvrtko
