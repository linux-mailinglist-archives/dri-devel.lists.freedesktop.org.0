Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4450E8AD44B
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 20:49:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56BE310F77D;
	Mon, 22 Apr 2024 18:49:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RF59Kzyd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F3D410F77D
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 18:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713811753; x=1745347753;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=NEhut3AMCx5WprTtoCXYaXw0lI9Lkbu+xXEoqieubfQ=;
 b=RF59KzydTe/tgo7G+uxSxEhvQ2NSzE2H6Cf6vebchY0TNKDtS4EB6SvU
 +Kg1hj2unLBf2jRmrxmEmUIVEJdxsLsvBtAUCU4RvL9ZxREfmDhD2j3Ud
 eUGzFSApR6kmWl8xUnN8xu4d53MrIKY9K5Kxe88tTzKnjMaCETDexUssf
 ymQyyNLavuB6HMbymHgJzYy12HCxSC1vnZ9Zb2GdmQNpbHyVFsLgErNrb
 /T4Z0AFT/1/SzCRV77GGmqYYOoiCqj4SOz4G9T6BYd8lVMwoIBWQRTEDr
 j/OySmt4O85KBhnJ33UMTZtPF277yTa8wptmS0JiMuhgL3uamm45qHqBc A==;
X-CSE-ConnectionGUID: be/j3KpXSky1m91/jqHSlg==
X-CSE-MsgGUID: MSndoeLpStyEfamd3pzZsA==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="9585100"
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; 
   d="scan'208";a="9585100"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 11:49:12 -0700
X-CSE-ConnectionGUID: DxtNHo/yRIWaBblTjbug5g==
X-CSE-MsgGUID: zD+11gt4Rj+Jdu6cfySs+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; d="scan'208";a="61545654"
Received: from ralbanes-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.63.128])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 11:49:08 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Melissa Wen
 <mwen@igalia.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] drm: fixed: Don't use "proxy" headers
In-Reply-To: <20240422143338.2026791-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240422143338.2026791-1-andriy.shevchenko@linux.intel.com>
Date: Mon, 22 Apr 2024 21:49:04 +0300
Message-ID: <87r0exs067.fsf@intel.com>
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

On Mon, 22 Apr 2024, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> Update header inclusions to follow IWYU (Include What You Use)
> principle.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Assuming it builds, and nothing depends on other stuff from kernel.h via
drm_fixed.h,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  include/drm/drm_fixed.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/include/drm/drm_fixed.h b/include/drm/drm_fixed.h
> index 81572d32db0c..387fb81d5b81 100644
> --- a/include/drm/drm_fixed.h
> +++ b/include/drm/drm_fixed.h
> @@ -25,8 +25,9 @@
>  #ifndef DRM_FIXED_H
>  #define DRM_FIXED_H
>  
> -#include <linux/kernel.h>
>  #include <linux/math64.h>
> +#include <linux/types.h>
> +#include <linux/wordpart.h>
>  
>  typedef union dfixed {
>  	u32 full;

-- 
Jani Nikula, Intel
