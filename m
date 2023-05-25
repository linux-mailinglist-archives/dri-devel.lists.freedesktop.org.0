Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D6D7108C2
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 11:23:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F350910E855;
	Thu, 25 May 2023 09:23:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D6EC10E133;
 Thu, 25 May 2023 09:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685006584; x=1716542584;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=/GppYPfESLOi0JHBQPIuFHQkEMrivIc3fjf4d77i7TU=;
 b=d8PPVLK0gWSwCcZqMG2myJPRVoEELbhOgM+xVcsAbMDyTdJ2b75zp2d/
 phteOy2H/jT1f6M+7qrZibLjAQ3DbX3VrWO6loXFcOrEXbUdD6VP1ilfJ
 +sPYVYiUqW0HUCKJC6B1L4991SoTA8sUBiuIpHwIBf9XGdliOGzMTz9l6
 Vk2DxeSnLfl+J02JDOOHGsO6e1Ll5aLrbv6NmnO1QZU9+2rFQA8SaU6e1
 oWqwVnT0AtHiboJAod+geZS315nFjv/0hKthzdRCHC7bXcRMaq2SjMQxj
 bOfysUmjQwgrqfC0GmGL6dIh7Lt9HbSZgjSmSqsFYtrI3dPs0+b1RDJGq w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="338412463"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="338412463"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 02:23:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="951383409"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="951383409"
Received: from emontau-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.42.201])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 02:22:59 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH] drm/i915: constify pointers to hwmon_channel_info
In-Reply-To: <20230511175446.282041-1-krzysztof.kozlowski@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230511175446.282041-1-krzysztof.kozlowski@linaro.org>
Date: Thu, 25 May 2023 12:22:57 +0300
Message-ID: <87a5xskbny.fsf@intel.com>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 11 May 2023, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> Statically allocated array of pointers to hwmon_channel_info can be made
> const for safety.

Btw if you want to further make things const, the compound literals
defined by HWMON_CHANNEL_INFO() still end up mutable, even if they're
only referenced inline using a const pointer. If possible, would be nice
to add const there too.

BR,
Jani.

>
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/gpu/drm/i915/i915_hwmon.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
> index 8e7dccc8d3a0..e99e8c97ef01 100644
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
