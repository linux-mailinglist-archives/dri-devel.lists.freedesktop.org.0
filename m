Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B29F72F5B16
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 08:12:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0323B89829;
	Thu, 14 Jan 2021 07:12:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A14FD89829;
 Thu, 14 Jan 2021 07:12:19 +0000 (UTC)
IronPort-SDR: JBtT5Cu4ezGkT0sibzYWKHVHbbw5b+4tOO6fXsuJq7U1+cO/5nSDwfWM5vdsvVtkiNAYnJ2aZt
 OGPgZPsBLEvQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9863"; a="175740344"
X-IronPort-AV: E=Sophos;i="5.79,346,1602572400"; d="scan'208";a="175740344"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2021 23:12:18 -0800
IronPort-SDR: cJDv/L0tfPx9bJ4fkZ1bsmZhxw7AiOgksUX2g5eH3BzEnvhub4FHEwNlujc4FtO8Vd2BOnWG/l
 sxsVVmHUs+gg==
X-IronPort-AV: E=Sophos;i="5.79,346,1602572400"; d="scan'208";a="364136636"
Received: from dforourk-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.213.254.146])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2021 23:12:11 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v6 1/4] drm/i915: Keep track of pwm-related backlight
 hooks separately
In-Reply-To: <20210113235426.2190684-2-lyude@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210113235426.2190684-1-lyude@redhat.com>
 <20210113235426.2190684-2-lyude@redhat.com>
Date: Thu, 14 Jan 2021 09:12:08 +0200
Message-ID: <871reornzr.fsf@intel.com>
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
Cc: thaytan@noraisin.net, Arnd Bergmann <arnd@arndb.de>,
 Anshuman Gupta <anshuman.gupta@intel.com>, David Airlie <airlied@linux.ie>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 13 Jan 2021, Lyude Paul <lyude@redhat.com> wrote:
> Currently, every different type of backlight hook that i915 supports is
> pretty straight forward - you have a backlight, probably through PWM
> (but maybe DPCD), with a single set of platform-specific hooks that are
> used for controlling it.
>
> HDR backlights, in particular VESA and Intel's HDR backlight
> implementations, can end up being more complicated. With Intel's
> proprietary interface, HDR backlight controls always run through the
> DPCD. When the backlight is in SDR backlight mode however, the driver
> may need to bypass the TCON and control the backlight directly through
> PWM.
>
> So, in order to support this we'll need to split our backlight callbacks
> into two groups: a set of high-level backlight control callbacks in
> intel_panel, and an additional set of pwm-specific backlight control
> callbacks. This also implies a functional changes for how these
> callbacks are used:
>
> * We now keep track of two separate backlight level ranges, one for the
>   high-level backlight, and one for the pwm backlight range
> * We also keep track of backlight enablement and PWM backlight
>   enablement separately
> * Since the currently set backlight level might not be the same as the
>   currently programmed PWM backlight level, we stop setting
>   panel->backlight.level with the currently programmed PWM backlight
>   level in panel->backlight.pwm_funcs->setup(). Instead, we rely
>   on the higher level backlight control functions to retrieve the
>   current PWM backlight level (in this case, intel_pwm_get_backlight()).
>   Note that there are still a few PWM backlight setup callbacks that
>   do actually need to retrieve the current PWM backlight level, although
>   we no longer save this value in panel->backlight.level like before.
>
> Additionally, we drop the call to lpt_get_backlight() in
> lpt_setup_backlight(), and avoid unconditionally writing the PWM value that
> we get from it and only write it back if we're in CPU mode, and switching
> to PCH mode. The reason for this is because in the original codepath for
> this, it was expected that the intel_panel_bl_funcs->setup() hook would be
> responsible for fetching the initial backlight level. On lpt systems, the
> only time we could ever be in PCH backlight mode is during the initial
> driver load - meaning that outside of the setup() hook, lpt_get_backlight()
> will always be the callback used for retrieving the current backlight
> level. After this patch we still need to fetch and write-back the PCH
> backlight value if we're switching from CPU mode to PCH, but because
> intel_pwm_setup_backlight() will retrieve the backlight level after setup()
> using the get() hook, which always ends up being lpt_get_backlight(). Thus
> - an additional call to lpt_get_backlight() in lpt_setup_backlight() is
> made redundant.
>
> v7:
> * Use panel->backlight.pwm_funcs->get() to get the backlight level in
>   intel_pwm_setup_backlight(), lest we upset lockdep

I think this change is wrong, as it now bypasses
intel_panel_invert_pwm_level(). Please explain. I don't see anything in
there that could trigger a lockdep warning.

Perhaps it's the below you're referring to, but I think the root cause
is different?

> @@ -1788,22 +1780,17 @@ static int vlv_setup_backlight(struct intel_connector *connector, enum pipe pipe
>  	panel->backlight.active_low_pwm = ctl2 & BLM_POLARITY_I965;
>  
>  	ctl = intel_de_read(dev_priv, VLV_BLC_PWM_CTL(pipe));
> -	panel->backlight.max = ctl >> 16;
> +	panel->backlight.pwm_level_max = ctl >> 16;
>  
> -	if (!panel->backlight.max)
> -		panel->backlight.max = get_backlight_max_vbt(connector);
> +	if (!panel->backlight.pwm_level_max)
> +		panel->backlight.pwm_level_max = get_backlight_max_vbt(connector);
>  
> -	if (!panel->backlight.max)
> +	if (!panel->backlight.pwm_level_max)
>  		return -ENODEV;
>  
> -	panel->backlight.min = get_backlight_min_vbt(connector);
> +	panel->backlight.pwm_level_min = get_backlight_min_vbt(connector);
>  
> -	val = _vlv_get_backlight(dev_priv, pipe);

Turns out this is a meaningful change, as the higher level
vlv_get_backlight() function that will be called instead hits:

<4>[   12.870202] i915 0000:00:02.0: drm_WARN_ON(!drm_modeset_is_locked(&dev->mode_config.connection_mutex))

in intel_connector_get_pipe(connector).

It's a real problem. See this, it's obvious (in retrospect):

https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_19348/fi-bsw-kefka/igt@runner@aborted.html
https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_19348/fi-bsw-kefka/boot0.txt

I don't have a quick answer how this could be handled neatly. Perhaps
the ->get call (or rather, intel_pwm_get_backlight) to set
panel->backlight.level needs to be spread out to the end of each
pwm_funcs->setup function after all? Though it's at the wrong
abstraction level wrt level being a higher level, uh, level.

I don't think it's enough to just grab connection_mutex around setup
(and even checking if we can do that is a bunch of digging) - I think
it's likely intel_connector_get_pipe() returns INVALID_PIPE at that
point.

Okay, here's a clumsy suggestion that I think works around this and
unblocks the series until we figure out a better way:

1. At the end of vlv_setup_backlight():

	/* add fixme comment about how wrong this is */
	panel->backlight.level = intel_panel_invert_pwm_level(connector, _vlv_get_backlight());
	

2. In intel_pwm_setup_backlight() only set level if ->setup didn't:

	if (!panel->backlight.level)
        	panel->backlight.level = intel_pwm_get_backlight(connector);

What do you think?

BR,
Jani.

> -	val = intel_panel_compute_brightness(connector, val);
> -	panel->backlight.level = clamp(val, panel->backlight.min,
> -				       panel->backlight.max);
> -
> -	panel->backlight.enabled = ctl2 & BLM_PWM_ENABLE;
> +	panel->backlight.pwm_enabled = ctl2 & BLM_PWM_ENABLE;
>  
>  	return 0;
>  }
> @@ -1828,24 +1815,18 @@ bxt_setup_backlight(struct intel_connector *connector, enum pipe unused)

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
