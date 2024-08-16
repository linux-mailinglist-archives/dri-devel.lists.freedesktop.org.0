Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE82954ADF
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 15:18:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7165110E6C2;
	Fri, 16 Aug 2024 13:18:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jAmji71X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA20510E6A0;
 Fri, 16 Aug 2024 13:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723814319; x=1755350319;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=0WXmG62FzuEGQr1rUL+sEKQbL4bo5d7jf/vx3Aamu7M=;
 b=jAmji71X/E6ac4+LEYitc24novFZNoCkV1Nh2IBwW1cSRTjkIt/Nkd9o
 hUGJXUtw96zJM4/TnSBtlY2AgfnMC3+gw0gJjeKkKDPrq/ovfyiscX6MA
 +lqcBhfqABZ1Zb8g5CZF5Wuf5mwL79eX2Hro9xTGZMNyw1Jnym2C2mc5k
 wrhmlJkUHpLDi1ETHaoqyqe3IaXYicHkqFeFrIx0wLddO6/4ihjyMy2j0
 M16mpbAcM4wZsg6A9Kc+JVCKIMSmOM8R1WfAPXGP0kvocFE1c/hrANov1
 7m5j0JXlyyNQ+HnMaeekJCcyDdmXjbOO+G2+SRGGNc6SEm0lx2QX2rT2a Q==;
X-CSE-ConnectionGUID: RuyHZdN1Qk2RinW8+rNiLA==
X-CSE-MsgGUID: JsPcW4rDSvi96OZznieQ+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="39622178"
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; d="scan'208";a="39622178"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 06:18:39 -0700
X-CSE-ConnectionGUID: B+zdp7TrS1yhC9YXY+JXSA==
X-CSE-MsgGUID: zcZIEHgWRxis1CNcVRB56Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; d="scan'208";a="60227025"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.214])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 06:18:33 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Thomas =?utf-8?Q?Hellstr?=
 =?utf-8?Q?=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 83/86] drm/{i915,xe}: Run DRM default client setup
In-Reply-To: <20240816125408.310253-84-tzimmermann@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240816125408.310253-1-tzimmermann@suse.de>
 <20240816125408.310253-84-tzimmermann@suse.de>
Date: Fri, 16 Aug 2024 16:18:27 +0300
Message-ID: <87cym87gik.fsf@intel.com>
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

On Fri, 16 Aug 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 206328387150..7a28396abb25 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -17,6 +17,8 @@
>  #include <drm/drm_print.h>
>  #include <drm/xe_drm.h>
>  
> +#include "intel_fbdev.h"
> +
>  #include "display/xe_display.h"
>  #include "instructions/xe_gpu_commands.h"
>  #include "regs/xe_gt_regs.h"
> @@ -267,6 +269,7 @@ static struct drm_driver driver = {
>  
>  	.dumb_create = xe_bo_dumb_create,
>  	.dumb_map_offset = drm_gem_ttm_dumb_map_offset,
> +	INTEL_FBDEV_DRIVER_OPS,
>  #ifdef CONFIG_PROC_FS
>  	.show_fdinfo = xe_drm_client_fdinfo,
>  #endif

Basically xe_device.c should have close to zero idea about display
details, and should not include intel_fbdev.h directly.

There's a xe_display_driver_set_hooks() call that is the right place to
set the driver->fbdev_probe hook.

It's a bit of a bummer in the sense that this prevents struct drm_driver
from being const, but that's how it already is for xe.


BR,
Jani.


-- 
Jani Nikula, Intel
