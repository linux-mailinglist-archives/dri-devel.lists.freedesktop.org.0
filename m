Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D9C458B2A
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 10:12:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23BE889E5F;
	Mon, 22 Nov 2021 09:12:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61AC889E33;
 Mon, 22 Nov 2021 09:12:42 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10175"; a="234986919"
X-IronPort-AV: E=Sophos;i="5.87,254,1631602800"; d="scan'208";a="234986919"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2021 01:12:41 -0800
X-IronPort-AV: E=Sophos;i="5.87,254,1631602800"; d="scan'208";a="596219376"
Received: from rmcdonax-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.19.217])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2021 01:12:39 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>, Lyude <lyude@redhat.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 1/2] drm/i915/backlight: Drop duplicate
 intel_panel_actually_set_backlight()
In-Reply-To: <20211121110032.4720-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211121110032.4720-1-hdegoede@redhat.com>
Date: Mon, 22 Nov 2021 11:12:36 +0200
Message-ID: <87lf1go8or.fsf@intel.com>
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 21 Nov 2021, Hans de Goede <hdegoede@redhat.com> wrote:
> After the recent refactoring of the backlight code the contents of
> intel_panel_actually_set_backlight() is exactly the same (minus a
> small wording difference in the drm_dbg_kms() as the contents if the
> more widely used intel_backlight_set_pwm_level() function.
>
> Drop the duplicate intel_panel_actually_set_backlight() function.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_backlight.c | 16 ++--------------
>  1 file changed, 2 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_backlight.c b/drivers/gpu/drm/i915/display/intel_backlight.c
> index 9523411cddd8..03cd730c926a 100644
> --- a/drivers/gpu/drm/i915/display/intel_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_backlight.c
> @@ -268,18 +268,6 @@ static void ext_pwm_set_backlight(const struct drm_connector_state *conn_state,
>  	pwm_apply_state(panel->backlight.pwm, &panel->backlight.pwm_state);
>  }
>  
> -static void
> -intel_panel_actually_set_backlight(const struct drm_connector_state *conn_state, u32 level)
> -{
> -	struct intel_connector *connector = to_intel_connector(conn_state->connector);
> -	struct drm_i915_private *i915 = to_i915(connector->base.dev);
> -	struct intel_panel *panel = &connector->panel;
> -
> -	drm_dbg_kms(&i915->drm, "set backlight level = %d\n", level);
> -
> -	panel->backlight.funcs->set(conn_state, level);
> -}
> -
>  /* set backlight brightness to level in range [0..max], assuming hw min is
>   * respected.
>   */
> @@ -314,7 +302,7 @@ void intel_backlight_set_acpi(const struct drm_connector_state *conn_state,
>  					 panel->backlight.device->props.max_brightness);
>  
>  	if (panel->backlight.enabled)
> -		intel_panel_actually_set_backlight(conn_state, hw_level);
> +		intel_backlight_set_pwm_level(conn_state, hw_level);
>  
>  	mutex_unlock(&dev_priv->backlight_lock);
>  }
> @@ -863,7 +851,7 @@ static void intel_panel_set_backlight(const struct drm_connector_state *conn_sta
>  	panel->backlight.level = hw_level;
>  
>  	if (panel->backlight.enabled)
> -		intel_panel_actually_set_backlight(conn_state, hw_level);
> +		intel_backlight_set_pwm_level(conn_state, hw_level);
>  
>  	mutex_unlock(&dev_priv->backlight_lock);
>  }

-- 
Jani Nikula, Intel Open Source Graphics Center
