Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFF11A155F
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 20:57:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABE8E6E141;
	Tue,  7 Apr 2020 18:56:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EB836E141;
 Tue,  7 Apr 2020 18:56:56 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id A8FC88052B;
 Tue,  7 Apr 2020 20:56:54 +0200 (CEST)
Date: Tue, 7 Apr 2020 20:56:53 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 15/17] drm/gma500: Stop using mode->private_flags
Message-ID: <20200407185653.GL6356@ravnborg.org>
References: <20200403204008.14864-1-ville.syrjala@linux.intel.com>
 <20200403204008.14864-16-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200403204008.14864-16-ville.syrjala@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10 a=QyXUC8HyAAAA:8
 a=pGLkceISAAAA:8 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8 a=Nl4_LtoO0wqeSjo6JPwA:9
 a=wPNLvfGTeEIA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 Emil Velikov <emil.l.velikov@gmail.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ville.

On Fri, Apr 03, 2020 at 11:40:06PM +0300, Ville Syrjala wrote:
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> gma500 only uses mode->private_flags to convey the sdvo pixel
> multiplier from the encoder .mode_fixup() hook to the encoder
> .mode_set() hook. Those always seems get called as a pair so
> let's just stuff the pixel multiplier into the encoder itself
> as there are no state objects we could use in this non-atomic
> driver.
> =

> Paves the way for nuking mode->private_flag.
Nice little clean-up. One comment below.

	Sam
> =

> Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> CC: Sam Ravnborg <sam@ravnborg.org>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Emil Velikov <emil.l.velikov@gmail.com>
> Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/gma500/psb_intel_drv.h  | 19 -------------------
>  drivers/gpu/drm/gma500/psb_intel_sdvo.c | 11 ++++++-----
>  2 files changed, 6 insertions(+), 24 deletions(-)
> =

> diff --git a/drivers/gpu/drm/gma500/psb_intel_drv.h b/drivers/gpu/drm/gma=
500/psb_intel_drv.h
> index fb601983cef0..3dd5718c3e31 100644
> --- a/drivers/gpu/drm/gma500/psb_intel_drv.h
> +++ b/drivers/gpu/drm/gma500/psb_intel_drv.h
> @@ -56,25 +56,6 @@
>  #define INTEL_OUTPUT_DISPLAYPORT 9
>  #define INTEL_OUTPUT_EDP 10
>  =

> -#define INTEL_MODE_PIXEL_MULTIPLIER_SHIFT (0x0)
> -#define INTEL_MODE_PIXEL_MULTIPLIER_MASK (0xf << INTEL_MODE_PIXEL_MULTIP=
LIER_SHIFT)
> -
> -static inline void
> -psb_intel_mode_set_pixel_multiplier(struct drm_display_mode *mode,
> -				int multiplier)
> -{
> -	mode->clock *=3D multiplier;
> -	mode->private_flags |=3D multiplier;
> -}
> -
> -static inline int
> -psb_intel_mode_get_pixel_multiplier(const struct drm_display_mode *mode)
> -{
> -	return (mode->private_flags & INTEL_MODE_PIXEL_MULTIPLIER_MASK)
> -	       >> INTEL_MODE_PIXEL_MULTIPLIER_SHIFT;
> -}
> -
> -
>  /*
>   * Hold information useally put on the device driver privates here,
>   * since it needs to be shared across multiple of devices drivers privat=
es.
> diff --git a/drivers/gpu/drm/gma500/psb_intel_sdvo.c b/drivers/gpu/drm/gm=
a500/psb_intel_sdvo.c
> index 264d7ad004b4..9e88a37f55e9 100644
> --- a/drivers/gpu/drm/gma500/psb_intel_sdvo.c
> +++ b/drivers/gpu/drm/gma500/psb_intel_sdvo.c
> @@ -132,6 +132,8 @@ struct psb_intel_sdvo {
>  	/* DDC bus used by this SDVO encoder */
>  	uint8_t ddc_bus;
>  =

> +	u8 pixel_multiplier;
> +

There is really no good reason to use an u8 here.
psb_intel_sdvo_get_pixel_multiplier() return an int, so use an int here
too.

With this fixed:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

>  	/* Input timings for adjusted_mode */
>  	struct psb_intel_sdvo_dtd input_dtd;
>  =

> @@ -958,7 +960,6 @@ static bool psb_intel_sdvo_mode_fixup(struct drm_enco=
der *encoder,
>  				  struct drm_display_mode *adjusted_mode)
>  {
>  	struct psb_intel_sdvo *psb_intel_sdvo =3D to_psb_intel_sdvo(encoder);
> -	int multiplier;
>  =

>  	/* We need to construct preferred input timings based on our
>  	 * output timings.  To do that, we have to set the output
> @@ -985,8 +986,9 @@ static bool psb_intel_sdvo_mode_fixup(struct drm_enco=
der *encoder,
>  	/* Make the CRTC code factor in the SDVO pixel multiplier.  The
>  	 * SDVO device will factor out the multiplier during mode_set.
>  	 */
> -	multiplier =3D psb_intel_sdvo_get_pixel_multiplier(adjusted_mode);
> -	psb_intel_mode_set_pixel_multiplier(adjusted_mode, multiplier);
> +	psb_intel_sdvo->pixel_multiplier =3D
> +		psb_intel_sdvo_get_pixel_multiplier(adjusted_mode);
> +	adjusted_mode->clock *=3D psb_intel_sdvo->pixel_multiplier;
>  =

>  	return true;
>  }
> @@ -1002,7 +1004,6 @@ static void psb_intel_sdvo_mode_set(struct drm_enco=
der *encoder,
>  	u32 sdvox;
>  	struct psb_intel_sdvo_in_out_map in_out;
>  	struct psb_intel_sdvo_dtd input_dtd;
> -	int pixel_multiplier =3D psb_intel_mode_get_pixel_multiplier(adjusted_m=
ode);
>  	int rate;
>  	int need_aux =3D IS_MRST(dev) ? 1 : 0;
>  =

> @@ -1060,7 +1061,7 @@ static void psb_intel_sdvo_mode_set(struct drm_enco=
der *encoder,
>  =

>  	(void) psb_intel_sdvo_set_input_timing(psb_intel_sdvo, &input_dtd);
>  =

> -	switch (pixel_multiplier) {
> +	switch (psb_intel_sdvo->pixel_multiplier) {
>  	default:
>  	case 1: rate =3D SDVO_CLOCK_RATE_MULT_1X; break;
>  	case 2: rate =3D SDVO_CLOCK_RATE_MULT_2X; break;
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
