Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC7A97E792
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 10:32:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6C6410E3AE;
	Mon, 23 Sep 2024 08:31:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GB87Grra";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5AF510E3A9;
 Mon, 23 Sep 2024 08:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727080317; x=1758616317;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=sqJPIPcDtwSFk3n3WB0UPJAdfYcKynV4nzk4gp3uHb8=;
 b=GB87GrraJX3mhr5pTam241w2dVAEiPUvekPv+iNPvrTvzFQYu0Tf4wNr
 pkQoUW0oC1G0PGkFqfFb6jyZIVWq7SyeAfwaLLRmKuPMjAeq+VWHeQQzL
 QyxpAOJTP9Eb/fwTQFtf3+NudVRm4+uRj3kqXXB5qy6kX6p1AnmHVxOwX
 Dq6Q5zW44MLnEt6DMXMdpQquOkWmdXr3f7N706uSCV9LmzIYfbEqNWgDQ
 XdqSI/9uIjBCceI67LyRrkngozjv9uaaVNjBdIvvxayIrbcZiDAyecNqA
 geZC9aJnUFAiPYbSsyg1uqBitEwqova0dKswL5wFph3OYqiHGY1FnGkY2 Q==;
X-CSE-ConnectionGUID: MG6Ex8dyQbaoiup4JRc2Kw==
X-CSE-MsgGUID: nyOLva+yReK7Iy1VaAE8Fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="25495842"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="25495842"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 01:31:55 -0700
X-CSE-ConnectionGUID: kaED5uSYSDyvRVnZf0x5Hg==
X-CSE-MsgGUID: OhZCHVJARfiyPdVktkM6Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="71269153"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.65])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 01:31:49 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Alexander Usyskin <alexander.usyskin@intel.com>, Mark Brown
 <broonie@kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>, Oded
 Gabbay <ogabbay@kernel.org>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Cc: Tomas Winkler <tomas.winkler@intel.com>, Alexander Usyskin
 <alexander.usyskin@intel.com>, Vitaly Lubart <vitaly.lubart@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v6 08/12] drm/i915/spi: add spi device for discrete
 graphics
In-Reply-To: <20240916134928.3654054-9-alexander.usyskin@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240916134928.3654054-1-alexander.usyskin@intel.com>
 <20240916134928.3654054-9-alexander.usyskin@intel.com>
Date: Mon, 23 Sep 2024 11:31:45 +0300
Message-ID: <87ldzi7oum.fsf@intel.com>
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

On Mon, 16 Sep 2024, Alexander Usyskin <alexander.usyskin@intel.com> wrote:
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index 39f6614a0a99..b9d4f9be5355 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -34,6 +34,8 @@
>  
>  #include <linux/pm_qos.h>
>  
> +#include <linux/intel_dg_spi_aux.h>
> +
>  #include <drm/ttm/ttm_device.h>
>  
>  #include "display/intel_display_limits.h"
> @@ -315,6 +317,8 @@ struct drm_i915_private {
>  
>  	struct i915_perf perf;
>  
> +	struct intel_dg_spi_dev spi;
> +

Sorry, late to the party.

Can we make that struct intel_dg_spi_dev *spi, drop the include and use
a forward declaration for the type, and allocate dynamically please?

Ditto for xe driver.

struct drm_i915_private is huge, i915_drv.h gets included everywhere,
and there's no reason everyone should be able to look at the guts of of
that member.


BR,
Jani.


-- 
Jani Nikula, Intel
