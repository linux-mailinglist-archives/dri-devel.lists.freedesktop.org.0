Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1A4A6A453
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 11:58:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 361E310E5DD;
	Thu, 20 Mar 2025 10:58:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mXd7gcY1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D1FB10E5DC;
 Thu, 20 Mar 2025 10:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742468281; x=1774004281;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=mnCdFNNc8O0nJ3xevXKvsTOw3IypSnnSGWOzyc+CHu0=;
 b=mXd7gcY1u6RUiEP5UmY2VbHLbfwcblmWZceh0bOmDf9QY/jY5gHgajhH
 Axl1cTcv7fbiP5YKnjOZcqnAYRdVD8LtvhJwX1ZldpLRqDubXjmQkd4NM
 cCMTtKIDQW7yPluhs3SnPjs6lGWspPpgZ5dgqd60sTApBXGh6CInl5cmI
 ZGSx6dz2yuCsVKXUYnDMOqgJZmbAen7WZGBnF1S5alBf3x7wnIUYciocK
 iiuqsVSG7SF7QB3ACxQsedsBS5F1GjO42aVAcNrhJS4H74FI3jw4ZRtHv
 amMdf/9eeidFURJxCdOZMTPYVUc3M/oG3fOordpTs7gWQXebYdDodqxxD A==;
X-CSE-ConnectionGUID: suMprWfATMSdjRmImJyo5A==
X-CSE-MsgGUID: E2oo3BPsTKqhtoZtbi3u/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="43803890"
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; d="scan'208";a="43803890"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 03:58:01 -0700
X-CSE-ConnectionGUID: WW44s1EFTFelcycxDyXBHQ==
X-CSE-MsgGUID: iBrD/9cIS6m9dNJZxJ4b8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; d="scan'208";a="128150859"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 03:57:58 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lu Yao <yaolu@kylinos.cn>, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Lu Yao <yaolu@kylinos.cn>
Subject: Re: [PATCH] drm/i915/display: add audio dis/enable when connector
 hotplug
In-Reply-To: <20250318070435.347383-1-yaolu@kylinos.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250318070435.347383-1-yaolu@kylinos.cn>
Date: Thu, 20 Mar 2025 12:57:55 +0200
Message-ID: <87cyecc6ks.fsf@intel.com>
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

On Tue, 18 Mar 2025, Lu Yao <yaolu@kylinos.cn> wrote:
> Now audio enable/disable depends on an atomic commit, it doesn't make
> sence. For wayland, there will trigering an atomic commit, so it
> works well. But for Xorg using modesetting, there won't. In this
> case, unplug the HDMI/DP and the audio jack event is not triggered,
> resulting in still having a HDMI/DP audio output choice.

As it is, the implementation is not acceptable, but with this
description I also don't understand the problem.

Please file a bug at [1], attach dmesg from boot exhibiting the problem.

BR,
Jani.

[1] https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.html

> Signed-off-by: Lu Yao <yaolu@kylinos.cn>
> ---
>  drivers/gpu/drm/i915/display/intel_hotplug.c | 31 ++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> ---
> Test hardware:
>   CPU: i5-12500
>   GPU: UHD Graphics 770
>
>
> diff --git a/drivers/gpu/drm/i915/display/intel_hotplug.c b/drivers/gpu/drm/i915/display/intel_hotplug.c
> index 3adc791d3776..332d6e1a99cd 100644
> --- a/drivers/gpu/drm/i915/display/intel_hotplug.c
> +++ b/drivers/gpu/drm/i915/display/intel_hotplug.c
> @@ -32,6 +32,7 @@
>  #include "intel_display_types.h"
>  #include "intel_hotplug.h"
>  #include "intel_hotplug_irq.h"
> +#include "intel_audio.h"
>  
>  /**
>   * DOC: Hotplug
> @@ -415,6 +416,35 @@ void intel_hpd_trigger_irq(struct intel_digital_port *dig_port)
>  	queue_work(i915->display.hotplug.dp_wq, &i915->display.hotplug.dig_port_work);
>  }
>  
> +/*
> + * when connector hotplug state changed, audio need changed too.
> + */
> +static void i915_audio_hotplug(struct intel_connector *connector)
> +{
> +	struct drm_crtc *crtc;
> +	struct drm_device *dev = connector->base.dev;
> +
> +	drm_for_each_crtc(crtc, dev) {
> +		if (connector->base.state->crtc == crtc) {
> +			struct intel_crtc *intel_crtc = to_intel_crtc(crtc);
> +			struct intel_crtc_state *pipe_config =
> +				to_intel_crtc_state(intel_crtc->base.state);
> +			struct intel_encoder *encoder =
> +				intel_attached_encoder(connector);
> +
> +			if (pipe_config && pipe_config->has_audio) {
> +				if (connector->base.status == connector_status_disconnected)
> +					intel_audio_codec_disable(encoder, pipe_config,
> +								  connector->base.state);
> +				else if (connector->base.status == connector_status_connected)
> +					intel_audio_codec_enable(encoder, pipe_config,
> +								 connector->base.state);
> +			}
> +			break;
> +		}
> +	}
> +}
> +
>  /*
>   * Handle hotplug events outside the interrupt handler proper.
>   */
> @@ -487,6 +517,7 @@ static void i915_hotplug_work_func(struct work_struct *work)
>  					drm_connector_get(&connector->base);
>  					first_changed_connector = &connector->base;
>  				}
> +				i915_audio_hotplug(connector);
>  				break;
>  			case INTEL_HOTPLUG_RETRY:
>  				retry |= hpd_bit;

-- 
Jani Nikula, Intel
