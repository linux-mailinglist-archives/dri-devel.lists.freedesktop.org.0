Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 480081A1537
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 20:46:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE55C6E8DD;
	Tue,  7 Apr 2020 18:46:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0B3B6E8D8;
 Tue,  7 Apr 2020 18:46:06 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id BCB7E80538;
 Tue,  7 Apr 2020 20:46:04 +0200 (CEST)
Date: Tue, 7 Apr 2020 20:46:03 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 09/17] drm: Flatten drm_mode_vrefresh()
Message-ID: <20200407184603.GI6356@ravnborg.org>
References: <20200403204008.14864-1-ville.syrjala@linux.intel.com>
 <20200403204008.14864-10-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200403204008.14864-10-ville.syrjala@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10 a=QyXUC8HyAAAA:8
 a=QX4gbG5DAAAA:8 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8 a=HPv8fEl2qouvAlxC6HYA:9
 a=MG5i2C4Bp9e4CIY8:21 a=NJ9UzGjZE1qqg5t5:21 a=wPNLvfGTeEIA:10
 a=AbAUZ8qAyYyZVLSsDulk:22 a=E9Po1WZjFZOl8hwRPBS3:22
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

On Fri, Apr 03, 2020 at 11:40:00PM +0300, Ville Syrjala wrote:
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> Remove the pointless whole-function indentation. Also don't
> need to worry about negative values anymore since we switched
> everything to u16.
> =

> Reviewed-by: Emil Velikov <emil.velikov@collabora.com>
> Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

First change could have been in the patch that made this check
pointless. But this works too.

Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  drivers/gpu/drm/drm_modes.c | 26 ++++++++++++--------------
>  1 file changed, 12 insertions(+), 14 deletions(-)
> =

> diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
> index 77d68120931a..f2865f88bd54 100644
> --- a/drivers/gpu/drm/drm_modes.c
> +++ b/drivers/gpu/drm/drm_modes.c
> @@ -757,24 +757,22 @@ EXPORT_SYMBOL(drm_mode_set_name);
>   */
>  int drm_mode_vrefresh(const struct drm_display_mode *mode)
>  {
> -	int refresh =3D 0;
> +	unsigned int num, den;
>  =

> -	if (mode->htotal > 0 && mode->vtotal > 0) {
> -		unsigned int num, den;
> +	if (mode->htotal =3D=3D 0 || mode->vtotal =3D=3D 0)
> +		return 0;
>  =

> -		num =3D mode->clock * 1000;
> -		den =3D mode->htotal * mode->vtotal;
> +	num =3D mode->clock * 1000;
> +	den =3D mode->htotal * mode->vtotal;
>  =

> -		if (mode->flags & DRM_MODE_FLAG_INTERLACE)
> -			num *=3D 2;
> -		if (mode->flags & DRM_MODE_FLAG_DBLSCAN)
> -			den *=3D 2;
> -		if (mode->vscan > 1)
> -			den *=3D mode->vscan;
> +	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
> +		num *=3D 2;
> +	if (mode->flags & DRM_MODE_FLAG_DBLSCAN)
> +		den *=3D 2;
> +	if (mode->vscan > 1)
> +		den *=3D mode->vscan;
>  =

> -		refresh =3D DIV_ROUND_CLOSEST(num, den);
> -	}
> -	return refresh;
> +	return DIV_ROUND_CLOSEST(num, den);
>  }
>  EXPORT_SYMBOL(drm_mode_vrefresh);
>  =

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
