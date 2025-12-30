Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF08CE9FEC
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 15:59:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D64FF10E901;
	Tue, 30 Dec 2025 14:59:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RxHAeRbv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E54410E900;
 Tue, 30 Dec 2025 14:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767106765; x=1798642765;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=alRrTz8QAYjKpxV9NpwXFI9GulX68aJV6KCXduFQkL8=;
 b=RxHAeRbvu0+jOgPubflRLWlSHFvRXSNomZ3A0NITdOgyaySoTaYZ0lK1
 T0AuIPZOGAGVn9cR7Jg1nc2uZoqx8cIcbVKUvSNeHal+hBt5p60Qr82wY
 hQNJP0U4AVg7ZrwEwJbQ9pyh8rhnL05AUWLliJQrVRGiUqBoCHAj/mZkn
 bj9c/wLAeQvc9EuSXCz+2ykMZJvccfWtCmd8kfRhAcfJP2rYVgf7vGg87
 nvlsmL5um51goC7O3PdXp2jjU/OPjX5VVHcbwg2BWpg14WSxTDJCW40xC
 jCuIDx1qb0HEeogyogTSoHLUFC54qpNTQqrCTYn+7MdKBluqRVNpYLoJe A==;
X-CSE-ConnectionGUID: cCRDeN7URL+IKu3h6tnung==
X-CSE-MsgGUID: DMaPv67RRDqgHDOmVtP/CA==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="86273408"
X-IronPort-AV: E=Sophos;i="6.21,189,1763452800"; d="scan'208";a="86273408"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2025 06:59:25 -0800
X-CSE-ConnectionGUID: LyJDBNAGSSG4A2eG2/Xm2Q==
X-CSE-MsgGUID: gIjR8poCT6qfP2EZePKuhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,189,1763452800"; d="scan'208";a="200372482"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.171])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2025 06:59:24 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jerome Tollet <jerome.tollet@gmail.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com, Jerome Tollet
 <jerome.tollet@gmail.com>
Subject: Re: [PATCH] drm/i915/hdmi: Fix 4K@60Hz HDMI display with SCDC
 timing delays
In-Reply-To: <20251230091037.5603-1-jerome.tollet@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20251230091037.5603-1-jerome.tollet@gmail.com>
Date: Tue, 30 Dec 2025 16:59:20 +0200
Message-ID: <cdc74618559002ea59915631661be8f4d64c8724@intel.com>
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

On Tue, 30 Dec 2025, Jerome Tollet <jerome.tollet@gmail.com> wrote:
> Some HDMI 2.0 monitors fail to decode the signal at 4K@60Hz (594 MHz)
> when SCDC scrambling is configured too quickly. The monitor displays
> "format detection" error and never recovers, despite SCDC I2C
> transactions succeeding.
>
> Root cause: The SCDC disable/enable sequence happens too fast (~16ms),
> causing the monitor to lose sync during the transition. HDMI 2.0 spec
> section 10.4.1.7 states that the sink can disable scrambling if it
> doesn't detect a scrambled clock within 100ms.
>
> Solution: Add timing delays to allow the monitor to properly handle
> the SCDC configuration:
> - 100ms before SCDC configuration (let monitor stabilize)
> - 150ms after DDI enable (let monitor lock onto scrambled signal)
>
> Testing performed on:
> - Hardware: Intel Alder Lake-N N100 (Gen12.0, PCI ID 8086:46d1)
> - Monitor: Cisco Desk Pro (HDMI 2.0 capable)
> - Resolution: 3840x2160@60Hz via HDMI 2.0
> - Kernel: Linux 6.18.1
> - Test scenarios:
>   * Multiple reboots (stable across all tests)
>   * DPMS ON/OFF cycles (suspend/resume works correctly)
>
> Impact: Adds 250ms delay during boot, only when hdmi_scrambling is
> active (resolutions > 340 MHz). No impact on lower resolutions or
> runtime performance.
>
> Fixes display initialization on monitors sensitive to SCDC timing.
>
> Signed-off-by: Jerome Tollet <jerome.tollet@gmail.com>

Do you have a gitlab issue open about this? If not, please open one and
provide your dmesg with debugs enabled as described at [1].

Thanks,
Jani.


[1] https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.html


> ---
>  drivers/gpu/drm/i915/display/intel_ddi.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
> index abcdef123456..fedcba654321 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -3414,6 +3414,10 @@ static void intel_ddi_enable_hdmi(struct intel_atomic_state *state,
>  	enum port port = encoder->port;
>  	u32 buf_ctl = 0;
>  
> +	/* Give monitor time to be ready before SCDC configuration */
> +	if (crtc_state->hdmi_scrambling)
> +		msleep(100);
> +
>  	if (!intel_hdmi_handle_sink_scrambling(encoder, connector,
>  					       crtc_state->hdmi_high_tmds_clock_ratio,
>  					       crtc_state->hdmi_scrambling))
> @@ -3502,6 +3506,10 @@ static void intel_ddi_enable_hdmi(struct intel_atomic_state *state,
>  	}
>  
>  	intel_ddi_buf_enable(encoder, buf_ctl);
> +
> +	/* Give monitor time to lock onto scrambled signal after DDI enable */
> +	if (crtc_state->hdmi_scrambling)
> +		msleep(150);
>  }
>  
>  static void intel_ddi_enable(struct intel_atomic_state *state,
> --
> 2.43.0

-- 
Jani Nikula, Intel
