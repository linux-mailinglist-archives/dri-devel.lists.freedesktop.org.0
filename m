Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E76E15FAD77
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 09:28:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A8B810E7D6;
	Tue, 11 Oct 2022 07:28:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72E8B10E7D5;
 Tue, 11 Oct 2022 07:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665473296; x=1697009296;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=L5MBqgqp6MTU4ypjZqNT8kLPN3xIwjQwKf//0nsfzJk=;
 b=cn6QbeH7FHI9zEiOgsoLwMaQFL+p5TQ+1UNzmJIeK2E0wUYpNl3mVHVL
 JaEZHCTbNkmvB+mhiRSOs6MohiLvW0ZG0z3LPH1OEP4xsXavA/hvzhIkr
 acZodIBctAxzf6cfCA6HgbvyvfOPEgoTT3Dbsrzo5HxRMkMZbRtSO+QVV
 X6C4tGTFUTsWywCaMa5WixhCYEFHYNIbEDGH8dyuzmz/IJuNeXL16hAsi
 l+evbC3iStjQadyfStiaT+LHLDF3DEIkioIFeVlmCk0/V37NjkjLdXelm
 7rn+dQ5lAHnVwQY54JYUgY3m2H/+kCtm/JfrV4R+5I6Esu1pIUgH4nH9O A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="390739348"
X-IronPort-AV: E=Sophos;i="5.95,175,1661842800"; d="scan'208";a="390739348"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 00:28:01 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="730872554"
X-IronPort-AV: E=Sophos;i="5.95,175,1661842800"; d="scan'208";a="730872554"
Received: from milawils-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.40.183])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 00:27:59 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915: Use graphics ver, rel info for media on old
 platforms
In-Reply-To: <20221010231720.3730568-1-radhakrishna.sripada@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20221010231720.3730568-1-radhakrishna.sripada@intel.com>
Date: Tue, 11 Oct 2022 10:27:56 +0300
Message-ID: <87pmeyyg3n.fsf@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 10 Oct 2022, Radhakrishna Sripada <radhakrishna.sripada@intel.com> wrote:
> Platforms prior to MTL do not have a separate media and graphics version.
> On platforms where GMD id is not supported, reuse the graphics ip version,
> release info for media.
>
> The rest of the IP graphics, display versions would be copied during driver
> creation.
>
> While at it warn if GMD is not used for platforms greater than gen12.
>
> Fixes: c2c7075225ef ("drm/i915: Read graphics/media/display arch version from hw")
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> ---
>  drivers/gpu/drm/i915/intel_device_info.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drivers/gpu/drm/i915/intel_device_info.c
> index 090097bb3c0a..ba178b61bceb 100644
> --- a/drivers/gpu/drm/i915/intel_device_info.c
> +++ b/drivers/gpu/drm/i915/intel_device_info.c
> @@ -329,8 +329,18 @@ static void intel_ipver_early_init(struct drm_i915_private *i915)
>  {
>  	struct intel_runtime_info *runtime = RUNTIME_INFO(i915);
>  
> -	if (!HAS_GMD_ID(i915))
> +	if (!HAS_GMD_ID(i915)) {
> +		drm_WARN_ON(&i915->drm, RUNTIME_INFO(i915)->graphics.ip.ver > 12);
> +		/*
> +		 * On older platforms, graphics and media share the same ip
> +		 * version and release.
> +		 */
> +		RUNTIME_INFO(i915)->media.ip.ver =
> +			RUNTIME_INFO(i915)->graphics.ip.ver;
> +		RUNTIME_INFO(i915)->media.ip.rel =
> +			RUNTIME_INFO(i915)->graphics.ip.rel;

You could assign the whole struct ip_version (*) at once, or is there a
reason you're intentionally not assigning step?

BR,
Jani.

(*) Why does that name not have intel_ prefix?

>  		return;
> +	}
>  
>  	ip_ver_read(i915, i915_mmio_reg_offset(GMD_ID_GRAPHICS),
>  		    &runtime->graphics.ip);

-- 
Jani Nikula, Intel Open Source Graphics Center
