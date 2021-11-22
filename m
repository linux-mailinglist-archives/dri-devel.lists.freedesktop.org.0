Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4EB458B2E
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 10:13:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3FF389E8C;
	Mon, 22 Nov 2021 09:13:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA8CA89C9C;
 Mon, 22 Nov 2021 09:13:35 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10175"; a="298164319"
X-IronPort-AV: E=Sophos;i="5.87,254,1631602800"; d="scan'208";a="298164319"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2021 01:13:04 -0800
X-IronPort-AV: E=Sophos;i="5.87,254,1631602800"; d="scan'208";a="508458246"
Received: from rmcdonax-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.19.217])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2021 01:13:01 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>, Lyude <lyude@redhat.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 2/2] drm/i915/backlight: Make
 ext_pwm_disable_backlight() call intel_backlight_set_pwm_level()
In-Reply-To: <20211121110032.4720-2-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211121110032.4720-1-hdegoede@redhat.com>
 <20211121110032.4720-2-hdegoede@redhat.com>
Date: Mon, 22 Nov 2021 11:12:58 +0200
Message-ID: <87ilwko8o5.fsf@intel.com>
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
> At least the Bay Trail LPSS PWM controller used with DSI panels on many
> Bay Trail tablets seems to leave the PWM pin in whatever state it was
> (high or low) ATM that the PWM gets disabled. Combined with some panels
> not having a separate backlight-enable pin this leads to the backlight
> sometimes staying on while it should not (when the pin was high during
> PWM-disabling).
>
> First calling intel_backlight_set_pwm_level() will ensure that the pin
> is always low (or high for inverted brightness panels) since the passed
> in duty-cycle is 0% (or 100%) when the PWM gets disabled fixing the
> backlight sometimes staying on.
>
> With the exception of ext_pwm_disable_backlight() all other
> foo_disable_backlight() functions call intel_backlight_set_pwm_level()
> already before disabling the backlight, so this change also aligns
> ext_pwm_disable_backlight() with all the other disable() functions.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I'll take your word for it.

Acked-by: Jani Nikula <jani.nikula@intel.com>


> ---
>  drivers/gpu/drm/i915/display/intel_backlight.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_backlight.c b/drivers/gpu/drm/i915/display/intel_backlight.c
> index 03cd730c926a..2758a2f6c093 100644
> --- a/drivers/gpu/drm/i915/display/intel_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_backlight.c
> @@ -421,6 +421,8 @@ static void ext_pwm_disable_backlight(const struct drm_connector_state *old_conn
>  	struct intel_connector *connector = to_intel_connector(old_conn_state->connector);
>  	struct intel_panel *panel = &connector->panel;
>  
> +	intel_backlight_set_pwm_level(old_conn_state, level);
> +
>  	panel->backlight.pwm_state.enabled = false;
>  	pwm_apply_state(panel->backlight.pwm, &panel->backlight.pwm_state);
>  }

-- 
Jani Nikula, Intel Open Source Graphics Center
