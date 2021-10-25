Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F4C439104
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 10:17:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 647C389C19;
	Mon, 25 Oct 2021 08:17:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E468D89C0A;
 Mon, 25 Oct 2021 08:17:50 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10147"; a="253117058"
X-IronPort-AV: E=Sophos;i="5.87,179,1631602800"; d="scan'208";a="253117058"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 01:17:49 -0700
X-IronPort-AV: E=Sophos;i="5.87,179,1631602800"; d="scan'208";a="496693786"
Received: from atmozipo-mobl.amr.corp.intel.com (HELO localhost)
 ([10.249.43.83])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 01:17:45 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org,
 Tsuchiya Yuto <kitakar@gmail.com>
Subject: Re: [PATCH] drm/i915/vlv_dsi: Double pixelclock on read-back for
 dual-link panels
In-Reply-To: <20211024155020.126328-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211024155020.126328-1-hdegoede@redhat.com>
Date: Mon, 25 Oct 2021 11:17:42 +0300
Message-ID: <87a6ixldqx.fsf@intel.com>
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

On Sun, 24 Oct 2021, Hans de Goede <hdegoede@redhat.com> wrote:
> In intel_dsi_get_config() double the pclk returned by foo_dsi_get_pclk()
> for dual-link panels. This fixes the following WARN triggering:
>
>  i915 0000:00:02.0: [drm] *ERROR* [CRTC:51:pipe A] mismatch in pixel_rate (expected 235710, found 118056)
>  i915 0000:00:02.0: [drm] *ERROR* [CRTC:51:pipe A] mismatch in hw.pipe_mode.crtc_clock (expected 235710, found 118056)
>  i915 0000:00:02.0: [drm] *ERROR* [CRTC:51:pipe A] mismatch in hw.adjusted_mode.crtc_clock (expected 235710, found 118056)
>  i915 0000:00:02.0: [drm] *ERROR* [CRTC:51:pipe A] mismatch in port_clock (expected 235710, found 118056)
>  ------------[ cut here ]------------
>  pipe state doesn't match!
>  WARNING: CPU: 3 PID: 136 at drivers/gpu/drm/i915/display/intel_display.c:9125 intel_display_finish_reset+0x1bd3/0x2050 [i915]
>  ...
>
> This has been tested on a Xiaomi Mi Pad 2 (with CHT x5-Z8500 SoC) tablet,
> with a 1536x2048 dual-link DSI panel.
>
> Note this fix was taken from icl_dsi.c which does the same in
> its get_config().
>
> Cc: Tsuchiya Yuto <kitakar@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Acked-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/vlv_dsi.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/vlv_dsi.c b/drivers/gpu/drm/i915/display/vlv_dsi.c
> index 3e646a58b38a..2b7909bc52ff 100644
> --- a/drivers/gpu/drm/i915/display/vlv_dsi.c
> +++ b/drivers/gpu/drm/i915/display/vlv_dsi.c
> @@ -1265,7 +1265,9 @@ static void intel_dsi_get_config(struct intel_encoder *encoder,
>  				 struct intel_crtc_state *pipe_config)
>  {
>  	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
> +	struct intel_dsi *intel_dsi = enc_to_intel_dsi(encoder);
>  	u32 pclk;
> +
>  	drm_dbg_kms(&dev_priv->drm, "\n");
>  
>  	pipe_config->output_types |= BIT(INTEL_OUTPUT_DSI);
> @@ -1277,6 +1279,9 @@ static void intel_dsi_get_config(struct intel_encoder *encoder,
>  		pclk = vlv_dsi_get_pclk(encoder, pipe_config);
>  	}
>  
> +	if (intel_dsi->dual_link)
> +		pclk *= 2;
> +
>  	if (pclk) {
>  		pipe_config->hw.adjusted_mode.crtc_clock = pclk;
>  		pipe_config->port_clock = pclk;

-- 
Jani Nikula, Intel Open Source Graphics Center
