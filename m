Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B29F13C70D
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 16:12:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C68736EAD2;
	Wed, 15 Jan 2020 15:12:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 806EF89BAE;
 Wed, 15 Jan 2020 15:12:03 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Jan 2020 07:12:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,322,1574150400"; d="scan'208";a="253890127"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga001.fm.intel.com with SMTP; 15 Jan 2020 07:11:54 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 15 Jan 2020 17:11:53 +0200
Date: Wed, 15 Jan 2020 17:11:53 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 07/21] drm/i915: Convert to CRTC VBLANK callbacks
Message-ID: <20200115151153.GB13686@intel.com>
References: <20200115121652.7050-1-tzimmermann@suse.de>
 <20200115121652.7050-8-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200115121652.7050-8-tzimmermann@suse.de>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: hamohammed.sa@gmail.com, airlied@linux.ie, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 alexandre.torgue@st.com, thellstrom@vmware.com, sean@poorly.run,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com,
 mcoquelin.stm32@gmail.com, sunpeng.li@amd.com, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, rodrigo.vivi@intel.com, vincent.abriou@st.com,
 rodrigosiqueiramelo@gmail.com, philippe.cornu@st.com, yannick.fertre@st.com,
 alexander.deucher@amd.com, freedreno@lists.freedesktop.org,
 christian.koenig@amd.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 15, 2020 at 01:16:38PM +0100, Thomas Zimmermann wrote:
> VBLANK callbacks in struct drm_driver are deprecated in favor of their
> equivalents in struct drm_crtc_funcs. Convert i915 over.
> =

> The callback struct drm_driver.get_scanout_position() is deprecated
> in favor of struct drm_crtc_helper_funcs.get_scanout_position().
> i915 doesn't use CRTC helpers. Instead pass i915's implementation of
> get_scanout_position() to DRM core's
> drm_crtc_vblank_helper_get_vblank_timestamp_internal().
> =

> v2:
> 	* use DRM's implementation of get_vblank_timestamp()
> 	* simplify function names
> =

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c |  7 +++++++
>  drivers/gpu/drm/i915/i915_drv.c              |  3 ---
>  drivers/gpu/drm/i915/i915_irq.c              | 20 +++++++++++++++-----
>  drivers/gpu/drm/i915/i915_irq.h              |  6 ++----
>  4 files changed, 24 insertions(+), 12 deletions(-)
> =

> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/d=
rm/i915/display/intel_display.c
> index 59c375879186..c8f1da845e7d 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -16336,6 +16336,7 @@ static const struct drm_crtc_funcs bdw_crtc_funcs=
 =3D {
>  	.get_vblank_counter =3D g4x_get_vblank_counter,
>  	.enable_vblank =3D bdw_enable_vblank,
>  	.disable_vblank =3D bdw_disable_vblank,
> +	.get_vblank_timestamp =3D i915_crtc_get_vblank_timestamp,
>  };
>  =

>  static const struct drm_crtc_funcs ilk_crtc_funcs =3D {
> @@ -16344,6 +16345,7 @@ static const struct drm_crtc_funcs ilk_crtc_funcs=
 =3D {
>  	.get_vblank_counter =3D g4x_get_vblank_counter,
>  	.enable_vblank =3D ilk_enable_vblank,
>  	.disable_vblank =3D ilk_disable_vblank,
> +	.get_vblank_timestamp =3D i915_crtc_get_vblank_timestamp,
>  };
>  =

>  static const struct drm_crtc_funcs g4x_crtc_funcs =3D {
> @@ -16352,6 +16354,7 @@ static const struct drm_crtc_funcs g4x_crtc_funcs=
 =3D {
>  	.get_vblank_counter =3D g4x_get_vblank_counter,
>  	.enable_vblank =3D i965_enable_vblank,
>  	.disable_vblank =3D i965_disable_vblank,
> +	.get_vblank_timestamp =3D i915_crtc_get_vblank_timestamp,
>  };
>  =

>  static const struct drm_crtc_funcs i965_crtc_funcs =3D {
> @@ -16360,6 +16363,7 @@ static const struct drm_crtc_funcs i965_crtc_func=
s =3D {
>  	.get_vblank_counter =3D i915_get_vblank_counter,
>  	.enable_vblank =3D i965_enable_vblank,
>  	.disable_vblank =3D i965_disable_vblank,
> +	.get_vblank_timestamp =3D i915_crtc_get_vblank_timestamp,
>  };
>  =

>  static const struct drm_crtc_funcs i915gm_crtc_funcs =3D {
> @@ -16368,6 +16372,7 @@ static const struct drm_crtc_funcs i915gm_crtc_fu=
ncs =3D {
>  	.get_vblank_counter =3D i915_get_vblank_counter,
>  	.enable_vblank =3D i915gm_enable_vblank,
>  	.disable_vblank =3D i915gm_disable_vblank,
> +	.get_vblank_timestamp =3D i915_crtc_get_vblank_timestamp,
>  };
>  =

>  static const struct drm_crtc_funcs i915_crtc_funcs =3D {
> @@ -16376,6 +16381,7 @@ static const struct drm_crtc_funcs i915_crtc_func=
s =3D {
>  	.get_vblank_counter =3D i915_get_vblank_counter,
>  	.enable_vblank =3D i8xx_enable_vblank,
>  	.disable_vblank =3D i8xx_disable_vblank,
> +	.get_vblank_timestamp =3D i915_crtc_get_vblank_timestamp,
>  };
>  =

>  static const struct drm_crtc_funcs i8xx_crtc_funcs =3D {
> @@ -16384,6 +16390,7 @@ static const struct drm_crtc_funcs i8xx_crtc_func=
s =3D {
>  	/* no hw vblank counter */
>  	.enable_vblank =3D i8xx_enable_vblank,
>  	.disable_vblank =3D i8xx_disable_vblank,
> +	.get_vblank_timestamp =3D i915_crtc_get_vblank_timestamp,
>  };
>  =

>  static struct intel_crtc *intel_crtc_alloc(void)
> diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_=
drv.c
> index f7385abdd74b..30b9ba136a81 100644
> --- a/drivers/gpu/drm/i915/i915_drv.c
> +++ b/drivers/gpu/drm/i915/i915_drv.c
> @@ -2769,9 +2769,6 @@ static struct drm_driver driver =3D {
>  	.gem_prime_export =3D i915_gem_prime_export,
>  	.gem_prime_import =3D i915_gem_prime_import,
>  =

> -	.get_vblank_timestamp =3D drm_calc_vbltimestamp_from_scanoutpos,
> -	.get_scanout_position =3D i915_get_crtc_scanoutpos,
> -
>  	.dumb_create =3D i915_gem_dumb_create,
>  	.dumb_map_offset =3D i915_gem_dumb_mmap_offset,
>  =

> diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_=
irq.c
> index afc6aad9bf8c..c39e3ef6e4a2 100644
> --- a/drivers/gpu/drm/i915/i915_irq.c
> +++ b/drivers/gpu/drm/i915/i915_irq.c
> @@ -762,13 +762,15 @@ static int __intel_get_crtc_scanline(struct intel_c=
rtc *crtc)
>  	return (position + crtc->scanline_offset) % vtotal;
>  }
>  =

> -bool i915_get_crtc_scanoutpos(struct drm_device *dev, unsigned int index,
> -			      bool in_vblank_irq, int *vpos, int *hpos,
> -			      ktime_t *stime, ktime_t *etime,
> -			      const struct drm_display_mode *mode)
> +static bool i915_get_crtc_scanoutpos(struct drm_crtc *dcrtc,

'struct drm_crtc *_crtc'
is the style we're going with these days.

> +				     bool in_vblank_irq,
> +				     int *vpos, int *hpos,
> +				     ktime_t *stime, ktime_t *etime,
> +				     const struct drm_display_mode *mode)
>  {
> +	struct drm_device *dev =3D dcrtc->dev;
>  	struct drm_i915_private *dev_priv =3D to_i915(dev);
> -	struct intel_crtc *crtc =3D to_intel_crtc(drm_crtc_from_index(dev, inde=
x));
> +	struct intel_crtc *crtc =3D to_intel_crtc(dcrtc);
>  	enum pipe pipe =3D crtc->pipe;
>  	int position;
>  	int vbl_start, vbl_end, hsync_start, htotal, vtotal;
> @@ -879,6 +881,14 @@ bool i915_get_crtc_scanoutpos(struct drm_device *dev=
, unsigned int index,
>  	return true;
>  }
>  =

> +bool i915_crtc_get_vblank_timestamp(struct drm_crtc *crtc, int *max_erro=
r,
> +				    ktime_t *vblank_time, bool in_vblank_irq)

'intel_crtc_get_vblank_timestamp' pls.

Otherwise lgtm
Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

> +{
> +	return drm_crtc_vblank_helper_get_vblank_timestamp_internal(
> +		crtc, max_error, vblank_time, in_vblank_irq,
> +		i915_get_crtc_scanoutpos);
> +}
> +
>  int intel_get_crtc_scanline(struct intel_crtc *crtc)
>  {
>  	struct drm_i915_private *dev_priv =3D to_i915(crtc->base.dev);
> diff --git a/drivers/gpu/drm/i915/i915_irq.h b/drivers/gpu/drm/i915/i915_=
irq.h
> index 812c47a9c2d6..53ec921c1c67 100644
> --- a/drivers/gpu/drm/i915/i915_irq.h
> +++ b/drivers/gpu/drm/i915/i915_irq.h
> @@ -101,10 +101,8 @@ void gen8_irq_power_well_post_enable(struct drm_i915=
_private *dev_priv,
>  void gen8_irq_power_well_pre_disable(struct drm_i915_private *dev_priv,
>  				     u8 pipe_mask);
>  =

> -bool i915_get_crtc_scanoutpos(struct drm_device *dev, unsigned int pipe,
> -			      bool in_vblank_irq, int *vpos, int *hpos,
> -			      ktime_t *stime, ktime_t *etime,
> -			      const struct drm_display_mode *mode);
> +bool i915_crtc_get_vblank_timestamp(struct drm_crtc *crtc, int *max_erro=
r,
> +				    ktime_t *vblank_time, bool in_vblank_irq);
>  =

>  u32 i915_get_vblank_counter(struct drm_crtc *crtc);
>  u32 g4x_get_vblank_counter(struct drm_crtc *crtc);
> -- =

> 2.24.1
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
