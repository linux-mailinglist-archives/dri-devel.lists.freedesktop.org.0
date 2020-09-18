Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A57D26FBD1
	for <lists+dri-devel@lfdr.de>; Fri, 18 Sep 2020 13:53:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D7606ECDA;
	Fri, 18 Sep 2020 11:53:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2607C6ECDA;
 Fri, 18 Sep 2020 11:53:22 +0000 (UTC)
IronPort-SDR: 0c5s9vS3c23Cakj5RCzAivbYo24cmRKmVSpIZf3PBXvUiwHvw0iBZQtWS3F89fvWsTZvkC/SsV
 jCFpzLGiUc3w==
X-IronPort-AV: E=McAfee;i="6000,8403,9747"; a="147659171"
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; d="scan'208";a="147659171"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2020 04:53:21 -0700
IronPort-SDR: woDn/3V4C/vD31UZm6cUstGHtEEs0LjXKGjSY4FvGU3QnjuKHbhvQqHCfzA2RUPPAheVZGKdgN
 jb8KEV071g1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; d="scan'208";a="289316190"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga008.fm.intel.com with SMTP; 18 Sep 2020 04:53:17 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 18 Sep 2020 14:53:17 +0300
Date: Fri, 18 Sep 2020 14:53:17 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Karthik B S <karthik.b.s@intel.com>
Subject: Re: [PATCH v10 5/8] drm/i915: Add dedicated plane hook for async
 flip case
Message-ID: <20200918115317.GJ6112@intel.com>
References: <20200916150824.15749-6-karthik.b.s@intel.com>
 <20200918070045.9703-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200918070045.9703-1-karthik.b.s@intel.com>
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
Cc: paulo.r.zanoni@intel.com, michel@daenzer.net,
 dri-devel@lists.freedesktop.org, nicholas.kazlauskas@amd.com,
 vandita.kulkarni@intel.com, uma.shankar@intel.com, daniel.vetter@intel.com,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 18, 2020 at 12:30:45PM +0530, Karthik B S wrote:
> This hook is added to avoid writing other plane registers in case of
> async flips, so that we do not write the double buffered registers
> during async surface address update.
> =

> v7: -Plane ctl needs bits from skl_plane_ctl_crtc as well. (Ville)
>     -Add a vfunc for skl_program_async_surface_address
>      and call it from intel_update_plane. (Ville)
> =

> v8: -Rebased.
> =

> v9: -Use if-else instead of return in intel_update_plane(). (Ville)
>     -Rename 'program_async_surface_address' to 'async_flip'. (Ville)
> =

> v10: -Check if async_flip hook is present before calling it.
>       Otherwise it will OOPS during legacy cursor updates. (Ville)
> =

> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
> ---
>  .../gpu/drm/i915/display/intel_atomic_plane.c |  6 ++++-
>  .../drm/i915/display/intel_display_types.h    |  3 +++
>  drivers/gpu/drm/i915/display/intel_sprite.c   | 24 +++++++++++++++++++
>  3 files changed, 32 insertions(+), 1 deletion(-)
> =

> diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/=
gpu/drm/i915/display/intel_atomic_plane.c
> index 79032701873a..6bd8e6cdd477 100644
> --- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> +++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> @@ -408,7 +408,11 @@ void intel_update_plane(struct intel_plane *plane,
>  	struct intel_crtc *crtc =3D to_intel_crtc(crtc_state->uapi.crtc);
>  =

>  	trace_intel_update_plane(&plane->base, crtc);
> -	plane->update_plane(plane, crtc_state, plane_state);
> +
> +	if (crtc_state->uapi.async_flip && plane->async_flip)
> +		plane->async_flip(plane, crtc_state, plane_state);
> +	else
> +		plane->update_plane(plane, crtc_state, plane_state);
>  }
>  =

>  void intel_disable_plane(struct intel_plane *plane,
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers=
/gpu/drm/i915/display/intel_display_types.h
> index 3d4bf9b6a0a2..e3339e41ddf7 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -1183,6 +1183,9 @@ struct intel_plane {
>  			   struct intel_plane_state *plane_state);
>  	int (*min_cdclk)(const struct intel_crtc_state *crtc_state,
>  			 const struct intel_plane_state *plane_state);
> +	void (*async_flip)(struct intel_plane *plane,
> +			   const struct intel_crtc_state *crtc_state,
> +			   const struct intel_plane_state *plane_state);
>  };
>  =

>  struct intel_watermark_params {
> diff --git a/drivers/gpu/drm/i915/display/intel_sprite.c b/drivers/gpu/dr=
m/i915/display/intel_sprite.c
> index 76a3d9bfe0de..3634e98b04c1 100644
> --- a/drivers/gpu/drm/i915/display/intel_sprite.c
> +++ b/drivers/gpu/drm/i915/display/intel_sprite.c
> @@ -609,6 +609,29 @@ icl_program_input_csc(struct intel_plane *plane,
>  			  PLANE_INPUT_CSC_POSTOFF(pipe, plane_id, 2), 0x0);
>  }
>  =

> +static void
> +skl_program_async_surface_address(struct intel_plane *plane,
> +				  const struct intel_crtc_state *crtc_state,
> +				  const struct intel_plane_state *plane_state)

Pls rename this to skl_plane_async_flip() as well.

With that
Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

> +{
> +	struct drm_i915_private *dev_priv =3D to_i915(plane->base.dev);
> +	unsigned long irqflags;
> +	enum plane_id plane_id =3D plane->id;
> +	enum pipe pipe =3D plane->pipe;
> +	u32 surf_addr =3D plane_state->color_plane[0].offset;
> +	u32 plane_ctl =3D plane_state->ctl;
> +
> +	plane_ctl |=3D skl_plane_ctl_crtc(crtc_state);
> +
> +	spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
> +
> +	intel_de_write_fw(dev_priv, PLANE_CTL(pipe, plane_id), plane_ctl);
> +	intel_de_write_fw(dev_priv, PLANE_SURF(pipe, plane_id),
> +			  intel_plane_ggtt_offset(plane_state) + surf_addr);
> +
> +	spin_unlock_irqrestore(&dev_priv->uncore.lock, irqflags);
> +}
> +
>  static void
>  skl_program_plane(struct intel_plane *plane,
>  		  const struct intel_crtc_state *crtc_state,
> @@ -3095,6 +3118,7 @@ skl_universal_plane_create(struct drm_i915_private =
*dev_priv,
>  	plane->get_hw_state =3D skl_plane_get_hw_state;
>  	plane->check_plane =3D skl_plane_check;
>  	plane->min_cdclk =3D skl_plane_min_cdclk;
> +	plane->async_flip =3D skl_program_async_surface_address;
>  =

>  	if (INTEL_GEN(dev_priv) >=3D 11)
>  		formats =3D icl_get_plane_formats(dev_priv, pipe,
> -- =

> 2.22.0

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
