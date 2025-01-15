Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F20A11D01
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 10:10:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 545CE10E59D;
	Wed, 15 Jan 2025 09:10:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WI5H/qYk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C40810E594;
 Wed, 15 Jan 2025 09:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736932243; x=1768468243;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=LQ8N3YQmtMLxUG2gVPGVGYyiTiSbBwkQQTJ1XWIfTlk=;
 b=WI5H/qYkrUbcqRJRlCwJ1KrZfYs5TLJyXR0Gl1uB+z6yMXdrARJjxska
 lZl/m6cCxOXO0SpxpWoskQb7SC5MCNdrRNbOYPDZxeQKPUy7F5ntDG193
 GsA5JgxNKpQ50ftWD6M+adNNWxK7vyIzGOGN9qtawsR+4bamGKFbaHLdq
 ZEMrZhgsiAojW2pC7LqKZ3QxY0l8IYzOnL755sLZ9C8liX2lqkblBRQTk
 yx5ySTUegn/Gy4ToXGsB7E+MhAQlikEl9NGUXMVUC/SpvDCrkU7q1mso5
 sm5o3PFtKFuvQ2x9690/8xLAqblvBRNfyBQJ554Y5AsdCpNqORskIzxt4 A==;
X-CSE-ConnectionGUID: 1KiPRnt8TyKefE0Gz9j2sA==
X-CSE-MsgGUID: uej3a0GoT6uabk8cSHyDnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="37137043"
X-IronPort-AV: E=Sophos;i="6.12,316,1728975600"; d="scan'208";a="37137043"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 01:10:42 -0800
X-CSE-ConnectionGUID: zYYReisPQ7KqFtgfoh/RVw==
X-CSE-MsgGUID: lgt5M4RhQPGdo67SKOukFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,316,1728975600"; d="scan'208";a="110038856"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.54])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 01:10:38 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jonathan Denose <jdenose@google.com>, LKML <linux-kernel@vger.kernel.org>
Cc: rodrigo.vivi@intel.com, intel-gfx@lists.freedesktop.org, Jonathan Denose
 <jdenose@google.com>, David Airlie <airlied@gmail.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Simona Vetter <simona@ffwll.ch>, Tvrtko
 Ursulin <tursulin@ursulin.net>, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, imre.deak@intel.com
Subject: Re: [PATCH] drm/i915/display: Add skip link check quirk
In-Reply-To: <20250114190709.1.Ia17111747d0450169dbe902e5d7ef25912a9338e@changeid>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250114190709.1.Ia17111747d0450169dbe902e5d7ef25912a9338e@changeid>
Date: Wed, 15 Jan 2025 11:10:35 +0200
Message-ID: <87a5bsh27o.fsf@intel.com>
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

On Tue, 14 Jan 2025, Jonathan Denose <jdenose@google.com> wrote:
> The display on the Advantech UTC124G3PWWW0E-ES worked fine until commit
> "drm/i915/dp: Recheck link state after modeset" was introduced. After
> this commit the display flickers intermittently as the driver code
> initiates the delayed link recheck in an infinite loop.
>
> To resolve this issue for the Advantech device, add a quirk to skip over
> the delayed link recheck.

It would be better to try to get at the root cause first, instead of
blindly skipping required parts. The code's complicated enough without
quirks, and removing them afterwards is very difficult.

Please file a bug according to [1], and attach full dmesg with debugs
enabled.

Cc: Imre

BR,
Jani.



[1] https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.html



>
> Signed-off-by: Jonathan Denose <jdenose@google.com>
> ---
>
>  drivers/gpu/drm/i915/display/intel_dp_link_training.c | 4 +++-
>  drivers/gpu/drm/i915/display/intel_quirks.c           | 8 ++++++++
>  drivers/gpu/drm/i915/display/intel_quirks.h           | 1 +
>  3 files changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> index 397cc4ebae526..7804ad38b00cd 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> @@ -32,6 +32,7 @@
>  #include "intel_encoder.h"
>  #include "intel_hotplug.h"
>  #include "intel_panel.h"
> +#include "intel_quirks.h"
>  
>  #define LT_MSG_PREFIX			"[CONNECTOR:%d:%s][ENCODER:%d:%s][%s] "
>  #define LT_MSG_ARGS(_intel_dp, _dp_phy)	(_intel_dp)->attached_connector->base.base.id, \
> @@ -1622,7 +1623,8 @@ void intel_dp_start_link_train(struct intel_atomic_state *state,
>  		lt_dbg(intel_dp, DP_PHY_DPRX, "Forcing link training failure\n");
>  	} else if (passed) {
>  		intel_dp->link.seq_train_failures = 0;
> -		intel_encoder_link_check_queue_work(encoder, 2000);
> +		if (!intel_has_quirk(display, QUIRK_SKIP_LINK_CHECK))
> +			intel_encoder_link_check_queue_work(encoder, 2000);
>  		return;
>  	}
>  
> diff --git a/drivers/gpu/drm/i915/display/intel_quirks.c b/drivers/gpu/drm/i915/display/intel_quirks.c
> index 28f497ae785bb..d472a5f21f8b9 100644
> --- a/drivers/gpu/drm/i915/display/intel_quirks.c
> +++ b/drivers/gpu/drm/i915/display/intel_quirks.c
> @@ -78,6 +78,12 @@ static void quirk_fw_sync_len(struct intel_dp *intel_dp)
>  	drm_info(display->drm, "Applying Fast Wake sync pulse count quirk\n");
>  }
>  
> +static void quirk_skip_link_check(struct intel_display *display)
> +{
> +	intel_set_quirk(display, QUIRK_SKIP_LINK_CHECK);
> +	drm_info(display->drm, "Applying skip link check quirk\n");
> +}
> +
>  struct intel_quirk {
>  	int device;
>  	int subsystem_vendor;
> @@ -229,6 +235,8 @@ static struct intel_quirk intel_quirks[] = {
>  	{ 0x3184, 0x1019, 0xa94d, quirk_increase_ddi_disabled_time },
>  	/* HP Notebook - 14-r206nv */
>  	{ 0x0f31, 0x103c, 0x220f, quirk_invert_brightness },
> +	/* Advantech UTC124G3PWWW0E-ES */
> +	{0x5a85, 0x8086, 0x2212, quirk_skip_link_check},
>  };
>  
>  static const struct intel_dpcd_quirk intel_dpcd_quirks[] = {
> diff --git a/drivers/gpu/drm/i915/display/intel_quirks.h b/drivers/gpu/drm/i915/display/intel_quirks.h
> index cafdebda75354..9e8f2816a4fba 100644
> --- a/drivers/gpu/drm/i915/display/intel_quirks.h
> +++ b/drivers/gpu/drm/i915/display/intel_quirks.h
> @@ -20,6 +20,7 @@ enum intel_quirk_id {
>  	QUIRK_LVDS_SSC_DISABLE,
>  	QUIRK_NO_PPS_BACKLIGHT_POWER_HOOK,
>  	QUIRK_FW_SYNC_LEN,
> +	QUIRK_SKIP_LINK_CHECK,
>  };
>  
>  void intel_init_quirks(struct intel_display *display);

-- 
Jani Nikula, Intel
