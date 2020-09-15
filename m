Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DC826ACF7
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 21:05:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7E096E8F6;
	Tue, 15 Sep 2020 19:05:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D59F66E8F6;
 Tue, 15 Sep 2020 19:05:49 +0000 (UTC)
IronPort-SDR: 2aE1jzNq7jk7iXORJjgs0JYgtL13ZK01oBy+CBxjJzY5Q9zV9t7Zy4Df4fdPS1GAJuh85vRLe6
 83OXCM2w3p6g==
X-IronPort-AV: E=McAfee;i="6000,8403,9745"; a="177395386"
X-IronPort-AV: E=Sophos;i="5.76,430,1592895600"; d="scan'208";a="177395386"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2020 12:05:45 -0700
IronPort-SDR: jIrdw8mnLJ1SY2aqytxcXM8BdhcUnw84Rv9hGD+LLrc4EDmcmhNQL4G/XRgC628PucrgjCRxmF
 8I9yS+aI7WdQ==
X-IronPort-AV: E=Sophos;i="5.76,430,1592895600"; d="scan'208";a="331338513"
Received: from rdvivi-losangeles.jf.intel.com (HELO intel.com)
 ([10.165.21.201])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2020 12:05:44 -0700
Date: Tue, 15 Sep 2020 15:08:03 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [RFC 2/5] drm/i915: Rename pwm_* backlight callbacks to ext_pwm_*
Message-ID: <20200915190803.GD503362@intel.com>
References: <20200915172939.2810538-1-lyude@redhat.com>
 <20200915172939.2810538-3-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200915172939.2810538-3-lyude@redhat.com>
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
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
 Manasi Navare <manasi.d.navare@intel.com>,
 Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 15, 2020 at 01:29:36PM -0400, Lyude Paul wrote:
> Since we're going to need to add a set of lower-level PWM backlight
> control hooks to be shared by normal backlight controls and HDR
> backlight controls in SDR mode, let's add a prefix to the external PWM
> backlight functions so that the difference between them and the high
> level PWM-only backlight functions is a bit more obvious.

it looks like a good idea to me:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> This introduces no functional changes.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Cc: thaytan@noraisin.net
> Cc: Vasily Khoruzhick <anarsoul@gmail.com>
> ---
>  drivers/gpu/drm/i915/display/intel_panel.c | 24 +++++++++++-----------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_panel.c b/drivers/gpu/drm/i915/display/intel_panel.c
> index 9f23bac0d7924..c0e36244bb07d 100644
> --- a/drivers/gpu/drm/i915/display/intel_panel.c
> +++ b/drivers/gpu/drm/i915/display/intel_panel.c
> @@ -589,7 +589,7 @@ static u32 bxt_get_backlight(struct intel_connector *connector)
>  			     BXT_BLC_PWM_DUTY(panel->backlight.controller));
>  }
>  
> -static u32 pwm_get_backlight(struct intel_connector *connector)
> +static u32 ext_pwm_get_backlight(struct intel_connector *connector)
>  {
>  	struct intel_panel *panel = &connector->panel;
>  	struct pwm_state state;
> @@ -666,7 +666,7 @@ static void bxt_set_backlight(const struct drm_connector_state *conn_state, u32
>  		       BXT_BLC_PWM_DUTY(panel->backlight.controller), level);
>  }
>  
> -static void pwm_set_backlight(const struct drm_connector_state *conn_state, u32 level)
> +static void ext_pwm_set_backlight(const struct drm_connector_state *conn_state, u32 level)
>  {
>  	struct intel_panel *panel = &to_intel_connector(conn_state->connector)->panel;
>  
> @@ -835,7 +835,7 @@ static void cnp_disable_backlight(const struct drm_connector_state *old_conn_sta
>  		       tmp & ~BXT_BLC_PWM_ENABLE);
>  }
>  
> -static void pwm_disable_backlight(const struct drm_connector_state *old_conn_state)
> +static void ext_pwm_disable_backlight(const struct drm_connector_state *old_conn_state)
>  {
>  	struct intel_connector *connector = to_intel_connector(old_conn_state->connector);
>  	struct intel_panel *panel = &connector->panel;
> @@ -1168,8 +1168,8 @@ static void cnp_enable_backlight(const struct intel_crtc_state *crtc_state,
>  		       pwm_ctl | BXT_BLC_PWM_ENABLE);
>  }
>  
> -static void pwm_enable_backlight(const struct intel_crtc_state *crtc_state,
> -				 const struct drm_connector_state *conn_state)
> +static void ext_pwm_enable_backlight(const struct intel_crtc_state *crtc_state,
> +				     const struct drm_connector_state *conn_state)
>  {
>  	struct intel_connector *connector = to_intel_connector(conn_state->connector);
>  	struct intel_panel *panel = &connector->panel;
> @@ -1890,8 +1890,8 @@ cnp_setup_backlight(struct intel_connector *connector, enum pipe unused)
>  	return 0;
>  }
>  
> -static int pwm_setup_backlight(struct intel_connector *connector,
> -			       enum pipe pipe)
> +static int ext_pwm_setup_backlight(struct intel_connector *connector,
> +				   enum pipe pipe)
>  {
>  	struct drm_device *dev = connector->base.dev;
>  	struct drm_i915_private *dev_priv = to_i915(dev);
> @@ -2065,11 +2065,11 @@ intel_panel_init_backlight_funcs(struct intel_panel *panel)
>  		panel->backlight.hz_to_pwm = pch_hz_to_pwm;
>  	} else if (IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv)) {
>  		if (connector->base.connector_type == DRM_MODE_CONNECTOR_DSI) {
> -			panel->backlight.setup = pwm_setup_backlight;
> -			panel->backlight.enable = pwm_enable_backlight;
> -			panel->backlight.disable = pwm_disable_backlight;
> -			panel->backlight.set = pwm_set_backlight;
> -			panel->backlight.get = pwm_get_backlight;
> +			panel->backlight.setup = ext_pwm_setup_backlight;
> +			panel->backlight.enable = ext_pwm_enable_backlight;
> +			panel->backlight.disable = ext_pwm_disable_backlight;
> +			panel->backlight.set = ext_pwm_set_backlight;
> +			panel->backlight.get = ext_pwm_get_backlight;
>  		} else {
>  			panel->backlight.setup = vlv_setup_backlight;
>  			panel->backlight.enable = vlv_enable_backlight;
> -- 
> 2.26.2
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
