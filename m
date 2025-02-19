Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D399A3C399
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 16:26:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B97CA10E330;
	Wed, 19 Feb 2025 15:26:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AXq4j3T9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E250E10E32D;
 Wed, 19 Feb 2025 15:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739978802; x=1771514802;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=CK0AZ7Lpkp/QfXcb02pW83lUn9FRAJI72YGbMp2sIIQ=;
 b=AXq4j3T94k7pJ6pSkhc2RfwAq5ddOCYvXk2Jiqf0mNMQbWzHoBlNL40f
 8GxbBie1+uNDGHPl7WirikjA+XhiaXHHCh9NMGQ00WXiq44C9vb/w3qvR
 ZrftBVmNCj5SZSw0WTpbRmif0XlPrmiYFD0pN8ydzi4GhUKx0i4YsWum9
 4vQBtlHGBp0Rg4cEj4Bf3U8q7VCthvTN+aywMalbrIeh3bsdH2ihIOg/9
 NPnhTe32Aw4zskT1rNYurEi+xgxNIqBmGSI0H+W09hVN2jjLK0+p8de4C
 Q8Pjd0UrYDvdo/JJlusfF12ksZkaMqql7H8R2xFM9/HHAXVgEQ+W8h27C Q==;
X-CSE-ConnectionGUID: T4JyzvKJQq+H+FFZ8xLfSw==
X-CSE-MsgGUID: JEV8Dn+WTaeaFysdGAoNiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="44490308"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; d="scan'208";a="44490308"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 07:26:42 -0800
X-CSE-ConnectionGUID: hc0YFeZyTfenPRKrf4pPAg==
X-CSE-MsgGUID: yV91Q3S3TiOssDXVkhcBOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; d="scan'208";a="114941437"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.160])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 07:26:35 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Haoxiang Li <haoxiang_li2024@163.com>, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, airlied@gmail.com,
 simona@ffwll.ch, gustavo.sousa@intel.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Haoxiang Li
 <haoxiang_li2024@163.com>, stable@vger.kernel.org
Subject: Re: [PATCH] drm/i915/display: Add check for
 alloc_ordered_workqueue() and alloc_workqueue()
In-Reply-To: <20250219130800.2638016-1-haoxiang_li2024@163.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250219130800.2638016-1-haoxiang_li2024@163.com>
Date: Wed, 19 Feb 2025 17:26:28 +0200
Message-ID: <87wmdmlzvf.fsf@intel.com>
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

On Wed, 19 Feb 2025, Haoxiang Li <haoxiang_li2024@163.com> wrote:
> Add check for the return value of alloc_ordered_workqueue()
> and alloc_workqueue() to catch potential exception.
>
> Fixes: 40053823baad ("drm/i915/display: move modeset probe/remove functions to intel_display_driver.c")

Not really. That's just code movement.

> Cc: stable@vger.kernel.org
> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display_driver.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
> index 50ec0c3c7588..dfe5b779aefd 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_driver.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
> @@ -245,6 +245,11 @@ int intel_display_driver_probe_noirq(struct intel_display *display)
>  						WQ_UNBOUND, WQ_UNBOUND_MAX_ACTIVE);
>  	display->wq.cleanup = alloc_workqueue("i915_cleanup", WQ_HIGHPRI, 0);
>  
> +	if (!display->wq.modeset || !display->wq.flip || !display->wq.cleanup) {
> +		ret = -ENOMEM;
> +		goto cleanup_vga_client_pw_domain_dmc;
> +	}
> +

Yes, we should check these, but if some of them succeed and some fail,
we'll never destroy the workqueues whose allocation succeeded.

BR,
Jani.


>  	intel_mode_config_init(display);
>  
>  	ret = intel_cdclk_init(display);

-- 
Jani Nikula, Intel
