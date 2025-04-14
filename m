Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17494A87D18
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 12:10:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4738C10E549;
	Mon, 14 Apr 2025 10:10:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BsnJpmcF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9257510E549;
 Mon, 14 Apr 2025 10:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744625424; x=1776161424;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=dzANcdKlHKk/XlVKBMN3bAA4Jx6duIYSfj2CAHTpMN8=;
 b=BsnJpmcFntMV5YzngxnuIplrpC+UjOywSr+RGVx+aY30CzoDCHnxNbvc
 KyI0/A7c5hk20GxuoiTBUcU3TpqyhyVLibIYqW5HuIogHLoK7kSsZiLfZ
 fVyMyklHAGEHmavo2QIidw4TbAmW8gYre4VeV2ocT5sB1s2HhAEkXcSE6
 k/8en/4gSX6z9IGXK3hnpCVKq8oZxarVIoicANFqGOE3//palFL/HJmAY
 H3i3YtnuvAoq5WIH19W7PQ/jKVR8UhuiA8n1NFooYrlNbdh/NPjI5pP0n
 8ZVdMqpim4ZOOS+vgzuzNz5lfpEid1xN6t3ZHYl9gVH67zgFIhtr2tf4S w==;
X-CSE-ConnectionGUID: vTIkK1+rTrScVIyeTd4msA==
X-CSE-MsgGUID: QZsTcV+4QAOt6G5DjfM8mg==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="45999068"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="45999068"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 03:10:23 -0700
X-CSE-ConnectionGUID: imantNFPSvqq1YnOzMcZZA==
X-CSE-MsgGUID: E9yHHkecRDWZiu5bF5pWIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="134532754"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.205])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 03:10:18 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Melissa Wen <mwen@igalia.com>, Alex Hung <alex.hung@amd.com>, Mario
 Limonciello <mario.limonciello@amd.com>, Rodrigo Siqueira
 <siqueira@igalia.com>, harry.wentland@amd.com, sunpeng.li@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
Subject: Re: [PATCH 03/13] drm/amd/display: parse display name from drm_eld
In-Reply-To: <20250411201333.151335-4-mwen@igalia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250411201333.151335-1-mwen@igalia.com>
 <20250411201333.151335-4-mwen@igalia.com>
Date: Mon, 14 Apr 2025 13:10:16 +0300
Message-ID: <87fribt5o7.fsf@intel.com>
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

On Fri, 11 Apr 2025, Melissa Wen <mwen@igalia.com> wrote:
> We don't need to parse dc_edid to get the display name since it's
> already set in drm_eld which in turn had it values updated when updating
> connector with the opaque drm_edid.
>
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index e93adb7e48a5..faea6b7fb3f3 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -34,7 +34,7 @@
>  #include <drm/amdgpu_drm.h>
>  #include <drm/drm_edid.h>
>  #include <drm/drm_fixed.h>
> -
> +#include <drm/drm_eld.h>
>  #include "dm_services.h"
>  #include "amdgpu.h"
>  #include "dc.h"
> @@ -90,6 +90,7 @@ static void apply_edid_quirks(struct drm_device *dev, struct edid *edid, struct
>  	}
>  }
>  
> +#define AMDGPU_ELD_DISPLAY_NAME_SIZE_IN_CHARS 13
>  /**
>   * dm_helpers_parse_edid_caps() - Parse edid caps
>   *
> @@ -132,9 +133,10 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
>  	edid_caps->manufacture_week = product_id.week_of_manufacture;
>  	edid_caps->manufacture_year = product_id.year_of_manufacture;
>  
> -	drm_edid_get_monitor_name(edid_buf,
> -				  edid_caps->display_name,
> -				  AUDIO_INFO_DISPLAY_NAME_SIZE_IN_CHARS);
> +	memset(edid_caps->display_name, 0, AUDIO_INFO_DISPLAY_NAME_SIZE_IN_CHARS);
> +	memcpy(edid_caps->display_name,
> +	       &connector->eld[DRM_ELD_MONITOR_NAME_STRING],
> +	       AMDGPU_ELD_DISPLAY_NAME_SIZE_IN_CHARS);

It's not that simple. The monitor name in ELD is not fixed length (see
drm_eld_mnl()) and neither is it guaranteed to be NUL terminated.

BR,
Jani.


>  
>  	edid_caps->edid_hdmi = connector->display_info.is_hdmi;

-- 
Jani Nikula, Intel
