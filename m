Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9666DD68B
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 11:27:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C0A210E51A;
	Tue, 11 Apr 2023 09:27:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A426310E511;
 Tue, 11 Apr 2023 09:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681205243; x=1712741243;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=iI2t87/uhLKu3MKVrrkEskkv3w9ib+0I3zw/GUEjajw=;
 b=bXho+2XixksvlcCYYuou3X49J2SB0uvIc0x2hR3GxFJq9pHji9/6F+XN
 JpNV9DQd9YKUt7nGQo/ebhmHlmdJcfJt2nMcvBTeAQzYud61p8XoUXjTd
 NjpMVvgyS2gQzzhHcK3VgE798ilz+eMIEMYOVKC/cjtZMhnHjLR96/xxj
 EyhQ9/PYvd04ZIWU5I1NZ+hs1cI79HOlMr1WNBgB/p5j+9u3UfYl4AOKH
 Y5LuMH9yXUBTnr10NbRoyiJFkwT42h//xZZNu7MKONVM4Q+AmCpgjOucO
 O12ZuH7lTjgiRHVMt3oehpDINjtwXzeZMTzsSpTVgaltAeiyBFooSgSAj w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="429855757"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; d="scan'208";a="429855757"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2023 02:27:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="718902535"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; d="scan'208";a="718902535"
Received: from tunterlu-mobl2.amr.corp.intel.com (HELO localhost)
 ([10.252.56.34])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2023 02:27:13 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Ben Skeggs
 <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>, Lyude Paul
 <lyude@redhat.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/i915: constify pointers to hwmon_channel_info
In-Reply-To: <20230407150031.79749-1-krzysztof.kozlowski@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230407150031.79749-1-krzysztof.kozlowski@linaro.org>
Date: Tue, 11 Apr 2023 12:27:10 +0300
Message-ID: <873556epld.fsf@intel.com>
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
Cc: linux-hwmon@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 07 Apr 2023, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> Statically allocated array of pointed to hwmon_channel_info can be made
> const for safety.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> ---
>
> This depends on hwmon core patch:
> https://lore.kernel.org/all/20230406203103.3011503-2-krzysztof.kozlowski@linaro.org/
>
> Therefore I propose this should also go via hwmon tree.

Thanks for doing this, I couldn't be bothered to follow through with it
[1].

Acked-by: Jani Nikula <jani.nikula@intel.com>



[1] https://lore.kernel.org/r/20230309082841.400118-1-jani.nikula@intel.com


>
> Cc: Jean Delvare <jdelvare@suse.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: linux-hwmon@vger.kernel.org
> ---
>  drivers/gpu/drm/i915/i915_hwmon.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
> index 596dd2c07010..87b527a54272 100644
> --- a/drivers/gpu/drm/i915/i915_hwmon.c
> +++ b/drivers/gpu/drm/i915/i915_hwmon.c
> @@ -267,7 +267,7 @@ static const struct attribute_group *hwm_groups[] = {
>  	NULL
>  };
>  
> -static const struct hwmon_channel_info *hwm_info[] = {
> +static const struct hwmon_channel_info * const hwm_info[] = {
>  	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT),
>  	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT),
>  	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT),
> @@ -275,7 +275,7 @@ static const struct hwmon_channel_info *hwm_info[] = {
>  	NULL
>  };
>  
> -static const struct hwmon_channel_info *hwm_gt_info[] = {
> +static const struct hwmon_channel_info * const hwm_gt_info[] = {
>  	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT),
>  	NULL
>  };

-- 
Jani Nikula, Intel Open Source Graphics Center
