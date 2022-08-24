Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B455A02FE
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 22:50:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF820C905F;
	Wed, 24 Aug 2022 20:49:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3167EB4A33;
 Wed, 24 Aug 2022 12:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661345466; x=1692881466;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=gVDfDPEiVT6OL8hq48CmnNY2PbGIUK+1rwU/ND+ln1c=;
 b=Rvvl8ATHGfIZ7/B2NTbbwGOyOnlAq3p6jbK4ig4xDtH+DVR7e9MD0taS
 MZAH15JH6TXaNR9qijHhcGFXX4jWDcQkSTnT4IJUUcofQZV7eN68CnMDe
 +d0quWneKSM2zu3jVfDPIFC5fQ00KvUHYt/NWsYWhpTnApyFwM0p07XcF
 YXL0MrrBouy1/3IqmG96GwNlH0Xk/Cut87tR/CI+3M4mGqAFuAwevy7/S
 3sq66W/z+apbxiFPyvxfreQy85h7IuKhOLLHv2ySBJZH7gCCVvlwS+i48
 zFqi9BTfCtGXYlo1nljQiKgNZBlRO/dO2YAxd2vN5MP/msPjlQf2265oZ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10448"; a="293953460"
X-IronPort-AV: E=Sophos;i="5.93,260,1654585200"; d="scan'208";a="293953460"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2022 05:51:05 -0700
X-IronPort-AV: E=Sophos;i="5.93,260,1654585200"; d="scan'208";a="670487177"
Received: from zlim2-mobl.gar.corp.intel.com (HELO localhost) ([10.252.52.23])
 by fmsmga008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2022 05:50:58 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>, Ben Skeggs <bskeggs@redhat.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude <lyude@redhat.com>, Daniel Dadap
 <ddadap@nvidia.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>, Lukas Wunner
 <lukas@wunner.de>, Mark Gross <markgross@kernel.org>, Andy Shevchenko
 <andy@kernel.org>
Subject: Re: [PATCH v4 02/31] drm/i915: Don't register backlight when
 another backlight should be used
In-Reply-To: <20220824121523.1291269-3-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220824121523.1291269-1-hdegoede@redhat.com>
 <20220824121523.1291269-3-hdegoede@redhat.com>
Date: Wed, 24 Aug 2022 15:50:56 +0300
Message-ID: <87v8qhiz4f.fsf@intel.com>
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
Cc: linux-acpi@vger.kernel.org, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>, amd-gfx@lists.freedesktop.org,
 Len Brown <lenb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 24 Aug 2022, Hans de Goede <hdegoede@redhat.com> wrote:
> Before this commit when we want userspace to use the acpi_video backlight
> device we register both the GPU's native backlight device and acpi_video's
> firmware acpi_video# backlight device. This relies on userspace preferring
> firmware type backlight devices over native ones.
>
> Registering 2 backlight devices for a single display really is
> undesirable, don't register the GPU's native backlight device when
> another backlight device should be used.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpu/drm/i915/display/intel_backlight.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_backlight.c b/drivers/gpu/drm/i915/display/intel_backlight.c
> index 681ebcda97ad..a4dd7924e0c1 100644
> --- a/drivers/gpu/drm/i915/display/intel_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_backlight.c
> @@ -8,6 +8,8 @@
>  #include <linux/pwm.h>
>  #include <linux/string_helpers.h>
>  
> +#include <acpi/video.h>
> +
>  #include "intel_backlight.h"
>  #include "intel_backlight_regs.h"
>  #include "intel_connector.h"
> @@ -952,6 +954,11 @@ int intel_backlight_device_register(struct intel_connector *connector)
>  
>  	WARN_ON(panel->backlight.max == 0);
>  
> +	if (!acpi_video_backlight_use_native()) {
> +		DRM_INFO("Skipping intel_backlight registration\n");

Could use drm_info with drm_device.

Either way,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

and ack for merging via whichever tree suits you best.


> +		return 0;
> +	}
> +
>  	memset(&props, 0, sizeof(props));
>  	props.type = BACKLIGHT_RAW;

-- 
Jani Nikula, Intel Open Source Graphics Center
