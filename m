Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 365D41A13B4
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 20:31:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4CB86E8CC;
	Tue,  7 Apr 2020 18:31:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 270306E8CC;
 Tue,  7 Apr 2020 18:31:03 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id E35FC804D5;
 Tue,  7 Apr 2020 20:31:00 +0200 (CEST)
Date: Tue, 7 Apr 2020 20:30:59 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 01/17] drm: Nuke mode->hsync
Message-ID: <20200407183059.GD6356@ravnborg.org>
References: <20200403204008.14864-1-ville.syrjala@linux.intel.com>
 <20200403204008.14864-2-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200403204008.14864-2-ville.syrjala@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10 a=QyXUC8HyAAAA:8
 a=QX4gbG5DAAAA:8 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8 a=Yqb6jqoWToFXY3bZnXMA:9
 a=wPNLvfGTeEIA:10 a=AbAUZ8qAyYyZVLSsDulk:22 a=E9Po1WZjFZOl8hwRPBS3:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 03, 2020 at 11:39:52PM +0300, Ville Syrjala wrote:
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> Let's just calculate the hsync rate on demand. No point in wasting
> space storing it and risking the cached value getting out of sync
> with reality.
> =

> v2: Move drm_mode_hsync() next to its only users
>     Drop the TODO
> =

> Reviewed-by: Emil Velikov <emil.velikov@collabora.com> #v1
> Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  Documentation/gpu/todo.rst                   | 12 ---------
>  drivers/gpu/drm/drm_edid.c                   |  8 ++++++
>  drivers/gpu/drm/drm_modes.c                  | 26 --------------------
>  drivers/gpu/drm/i915/display/intel_display.c |  1 -
>  include/drm/drm_modes.h                      | 11 ---------
>  5 files changed, 8 insertions(+), 50 deletions(-)
> =

> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 439656f55c5d..658b52f7ffc6 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -347,18 +347,6 @@ Contact: Sean Paul
>  =

>  Level: Starter
>  =

> -Remove drm_display_mode.hsync
> ------------------------------
> -
> -We have drm_mode_hsync() to calculate this from hsync_start/end, since d=
rivers
> -shouldn't/don't use this, remove this member to avoid any temptations to=
 use it
> -in the future. If there is any debug code using drm_display_mode.hsync, =
convert
> -it to use drm_mode_hsync() instead.
> -
> -Contact: Sean Paul
> -
> -Level: Starter
> -
>  connector register/unregister fixes
>  -----------------------------------
>  =

> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 43b6ca364daa..3bd95c4b02eb 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -2380,6 +2380,14 @@ bad_std_timing(u8 a, u8 b)
>  	       (a =3D=3D 0x20 && b =3D=3D 0x20);
>  }
>  =

> +static int drm_mode_hsync(const struct drm_display_mode *mode)
> +{
> +	if (mode->htotal <=3D 0)
> +		return 0;
> +
> +	return DIV_ROUND_CLOSEST(mode->clock, mode->htotal);
> +}
> +
>  /**
>   * drm_mode_std - convert standard mode info (width, height, refresh) in=
to mode
>   * @connector: connector of for the EDID block
> diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
> index d4d64518e11b..fec1c33b3045 100644
> --- a/drivers/gpu/drm/drm_modes.c
> +++ b/drivers/gpu/drm/drm_modes.c
> @@ -747,32 +747,6 @@ void drm_mode_set_name(struct drm_display_mode *mode)
>  }
>  EXPORT_SYMBOL(drm_mode_set_name);
>  =

> -/**
> - * drm_mode_hsync - get the hsync of a mode
> - * @mode: mode
> - *
> - * Returns:
> - * @modes's hsync rate in kHz, rounded to the nearest integer. Calculate=
s the
> - * value first if it is not yet set.
> - */
> -int drm_mode_hsync(const struct drm_display_mode *mode)
> -{
> -	unsigned int calc_val;
> -
> -	if (mode->hsync)
> -		return mode->hsync;
> -
> -	if (mode->htotal <=3D 0)
> -		return 0;
> -
> -	calc_val =3D (mode->clock * 1000) / mode->htotal; /* hsync in Hz */
> -	calc_val +=3D 500;				/* round to 1000Hz */
> -	calc_val /=3D 1000;				/* truncate to kHz */
> -
> -	return calc_val;
> -}
> -EXPORT_SYMBOL(drm_mode_hsync);
> -
>  /**
>   * drm_mode_vrefresh - get the vrefresh of a mode
>   * @mode: mode
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/d=
rm/i915/display/intel_display.c
> index 70ec301fe6e3..5ebb2df5f1f4 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -8870,7 +8870,6 @@ void intel_mode_from_pipe_config(struct drm_display=
_mode *mode,
>  =

>  	mode->clock =3D pipe_config->hw.adjusted_mode.crtc_clock;
>  =

> -	mode->hsync =3D drm_mode_hsync(mode);
>  	mode->vrefresh =3D drm_mode_vrefresh(mode);
>  	drm_mode_set_name(mode);
>  }
> diff --git a/include/drm/drm_modes.h b/include/drm/drm_modes.h
> index 99134d4f35eb..730fc31de4fb 100644
> --- a/include/drm/drm_modes.h
> +++ b/include/drm/drm_modes.h
> @@ -390,16 +390,6 @@ struct drm_display_mode {
>  	 */
>  	int vrefresh;
>  =

> -	/**
> -	 * @hsync:
> -	 *
> -	 * Horizontal refresh rate, for debug output in human readable form. Not
> -	 * used in a functional way.
> -	 *
> -	 * This value is in kHz.
> -	 */
> -	int hsync;
> -
>  	/**
>  	 * @picture_aspect_ratio:
>  	 *
> @@ -493,7 +483,6 @@ int of_get_drm_display_mode(struct device_node *np,
>  			    int index);
>  =

>  void drm_mode_set_name(struct drm_display_mode *mode);
> -int drm_mode_hsync(const struct drm_display_mode *mode);
>  int drm_mode_vrefresh(const struct drm_display_mode *mode);
>  void drm_mode_get_hv_timing(const struct drm_display_mode *mode,
>  			    int *hdisplay, int *vdisplay);
> -- =

> 2.24.1
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
