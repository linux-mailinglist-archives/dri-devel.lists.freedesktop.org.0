Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1261682EF
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 17:13:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 134746E406;
	Fri, 21 Feb 2020 16:13:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74B106E406;
 Fri, 21 Feb 2020 16:13:06 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id D413480644;
 Fri, 21 Feb 2020 17:13:02 +0100 (CET)
Date: Fri, 21 Feb 2020 17:13:01 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 09/12] drm: Shrink drm_display_mode timings
Message-ID: <20200221161301.GA20663@ravnborg.org>
References: <20200219203544.31013-1-ville.syrjala@linux.intel.com>
 <20200219203544.31013-10-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200219203544.31013-10-ville.syrjala@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10 a=QyXUC8HyAAAA:8
 a=e5mUnYsNAAAA:8 a=JcUIftbedcslCWFZPWoA:9 a=wPNLvfGTeEIA:10
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ville.

On Wed, Feb 19, 2020 at 10:35:41PM +0200, Ville Syrjala wrote:
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> Store the timings (apart from the clock) as u16. The uapi mode
> struct already uses u16 for everything so using something bigger
> internally doesn't really help us.
> =

> Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_modes.c |  7 ------
>  include/drm/drm_modes.h     | 46 ++++++++++++++++++-------------------
>  2 files changed, 23 insertions(+), 30 deletions(-)
> =

> diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
> index 0e7c9ba241c4..cc9fc52f9f7c 100644
> --- a/drivers/gpu/drm/drm_modes.c
> +++ b/drivers/gpu/drm/drm_modes.c
> @@ -1917,13 +1917,6 @@ EXPORT_SYMBOL(drm_mode_create_from_cmdline_mode);
>  void drm_mode_convert_to_umode(struct drm_mode_modeinfo *out,
>  			       const struct drm_display_mode *in)
>  {
> -	WARN(in->hdisplay > USHRT_MAX || in->hsync_start > USHRT_MAX ||
> -	     in->hsync_end > USHRT_MAX || in->htotal > USHRT_MAX ||
> -	     in->hskew > USHRT_MAX || in->vdisplay > USHRT_MAX ||
> -	     in->vsync_start > USHRT_MAX || in->vsync_end > USHRT_MAX ||
> -	     in->vtotal > USHRT_MAX || in->vscan > USHRT_MAX,
> -	     "timing values too large for mode info\n");
> -
>  	out->clock =3D in->clock;
>  	out->hdisplay =3D in->hdisplay;
>  	out->hsync_start =3D in->hsync_start;

This chunk is not mentioned in the changelog.
But with the change of type it does not makes sense so good to get rid
of it.

	Sam

> diff --git a/include/drm/drm_modes.h b/include/drm/drm_modes.h
> index b28c0234fcd7..b585074945b5 100644
> --- a/include/drm/drm_modes.h
> +++ b/include/drm/drm_modes.h
> @@ -278,16 +278,16 @@ struct drm_display_mode {
>  	 * Pixel clock in kHz.
>  	 */
>  	int clock;		/* in kHz */
> -	int hdisplay;
> -	int hsync_start;
> -	int hsync_end;
> -	int htotal;
> -	int hskew;
> -	int vdisplay;
> -	int vsync_start;
> -	int vsync_end;
> -	int vtotal;
> -	int vscan;
> +	u16 hdisplay;
> +	u16 hsync_start;
> +	u16 hsync_end;
> +	u16 htotal;
> +	u16 hskew;
> +	u16 vdisplay;
> +	u16 vsync_start;
> +	u16 vsync_end;
> +	u16 vtotal;
> +	u16 vscan;
>  	/**
>  	 * @flags:
>  	 *
> @@ -356,19 +356,19 @@ struct drm_display_mode {
>  	 * difference is exactly a factor of 10.
>  	 */
>  	int crtc_clock;
> -	int crtc_hdisplay;
> -	int crtc_hblank_start;
> -	int crtc_hblank_end;
> -	int crtc_hsync_start;
> -	int crtc_hsync_end;
> -	int crtc_htotal;
> -	int crtc_hskew;
> -	int crtc_vdisplay;
> -	int crtc_vblank_start;
> -	int crtc_vblank_end;
> -	int crtc_vsync_start;
> -	int crtc_vsync_end;
> -	int crtc_vtotal;
> +	u16 crtc_hdisplay;
> +	u16 crtc_hblank_start;
> +	u16 crtc_hblank_end;
> +	u16 crtc_hsync_start;
> +	u16 crtc_hsync_end;
> +	u16 crtc_htotal;
> +	u16 crtc_hskew;
> +	u16 crtc_vdisplay;
> +	u16 crtc_vblank_start;
> +	u16 crtc_vblank_end;
> +	u16 crtc_vsync_start;
> +	u16 crtc_vsync_end;
> +	u16 crtc_vtotal;
>  =

>  	/**
>  	 * @private_flags:
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
