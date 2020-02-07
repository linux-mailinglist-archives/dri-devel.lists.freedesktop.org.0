Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D5F155672
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 12:11:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFBDF6FC3D;
	Fri,  7 Feb 2020 11:11:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC72F6FC3F;
 Fri,  7 Feb 2020 11:11:14 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Feb 2020 03:11:14 -0800
X-IronPort-AV: E=Sophos;i="5.70,413,1574150400"; d="scan'208";a="236324213"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Feb 2020 03:11:10 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 1/4] Revert "drm/i915: Don't use VBT for detecting DPCD
 backlight controls"
In-Reply-To: <20200204192823.111404-2-lyude@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200204192823.111404-1-lyude@redhat.com>
 <20200204192823.111404-2-lyude@redhat.com>
Date: Fri, 07 Feb 2020 13:11:07 +0200
Message-ID: <87r1z61wl0.fsf@intel.com>
MIME-Version: 1.0
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
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Lee Shawn C <shawn.c.lee@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 04 Feb 2020, Lyude Paul <lyude@redhat.com> wrote:
> This reverts commit d2a4bb6f8bc8cf2d788adf7e59b5b52fe3a3333c.
>
> So, turns out that this ended up just breaking things. While many
> laptops incorrectly advertise themselves as supporting PWM backlight
> controls, they actually will only work with DPCD backlight controls.
> Unfortunately, it also seems there are a number of systems which
> advertise DPCD backlight controls in their eDP DPCD but don't actually
> support them. Talking with some laptop manufacturers has shown it might
> be possible to probe this support via the EDID (!?!?) but I haven't been
> able to confirm that this would work on any other manufacturer's
> systems.
>
> So in the mean time, we'll just revert this commit for now and go back
> to the old way of doing things.

The below sentence does not seem to match the patch:

> Additionally, let's print out an info
> message into the kernel log so that it's a little more obvious if a
> system needs DPCD backlight controls enabled through a quirk (which
> we'll introduce in the next commit).

I've pushed the revert to dinq, with the above removed, thanks for the
patch.

I'll try to look into the rest of the patches soon...

BR,
Jani.

>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> index e86feebef299..48276237b362 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> @@ -328,16 +328,15 @@ intel_dp_aux_display_control_capable(struct intel_connector *connector)
>  int intel_dp_aux_init_backlight_funcs(struct intel_connector *intel_connector)
>  {
>  	struct intel_panel *panel = &intel_connector->panel;
> -	enum intel_backlight_type type =
> -		to_i915(intel_connector->base.dev)->vbt.backlight.type;
> +	struct drm_i915_private *dev_priv = to_i915(intel_connector->base.dev);
>  
>  	if (i915_modparams.enable_dpcd_backlight == 0 ||
>  	    (i915_modparams.enable_dpcd_backlight == -1 &&
> -	     !intel_dp_aux_display_control_capable(intel_connector)))
> +	    dev_priv->vbt.backlight.type != INTEL_BACKLIGHT_VESA_EDP_AUX_INTERFACE))
>  		return -ENODEV;
>  
> -	if (type != INTEL_BACKLIGHT_VESA_EDP_AUX_INTERFACE)
> -		DRM_DEBUG_DRIVER("Ignoring VBT backlight type\n");
> +	if (!intel_dp_aux_display_control_capable(intel_connector))
> +		return -ENODEV;
>  
>  	panel->backlight.setup = intel_dp_aux_setup_backlight;
>  	panel->backlight.enable = intel_dp_aux_enable_backlight;

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
