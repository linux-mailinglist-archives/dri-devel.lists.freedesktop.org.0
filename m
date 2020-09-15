Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9045326A6D5
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 16:10:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA88389755;
	Tue, 15 Sep 2020 14:10:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5234C89755;
 Tue, 15 Sep 2020 14:10:18 +0000 (UTC)
IronPort-SDR: iMCAbFzyPrgTNmgOenEPGSkIOqKlaWiuSCJYU6R300avE8wmZcNjdVvKefJtxNgsmFTdy7AKrr
 GsEMTvPaGGhw==
X-IronPort-AV: E=McAfee;i="6000,8403,9744"; a="159309505"
X-IronPort-AV: E=Sophos;i="5.76,430,1592895600"; d="scan'208";a="159309505"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2020 07:10:16 -0700
IronPort-SDR: lURUwg4uirzAvGhJFV5QKRPDs4FcBFst8kp3lyqQ56HCXVJypC86TVa9FdMNpvJ23An5ezQFt6
 70VVjNPuN9Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,430,1592895600"; d="scan'208";a="345843146"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 15 Sep 2020 07:10:12 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 15 Sep 2020 17:10:11 +0300
Date: Tue, 15 Sep 2020 17:10:11 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Karthik B S <karthik.b.s@intel.com>
Subject: Re: [PATCH v8 5/8] drm/i915: Add dedicated plane hook for async flip
 case
Message-ID: <20200915141011.GL6112@intel.com>
References: <20200914055633.21109-1-karthik.b.s@intel.com>
 <20200914055633.21109-6-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200914055633.21109-6-karthik.b.s@intel.com>
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

On Mon, Sep 14, 2020 at 11:26:30AM +0530, Karthik B S wrote:
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

> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
> ---
>  .../gpu/drm/i915/display/intel_atomic_plane.c |  7 ++++++
>  .../drm/i915/display/intel_display_types.h    |  3 +++
>  drivers/gpu/drm/i915/display/intel_sprite.c   | 24 +++++++++++++++++++
>  3 files changed, 34 insertions(+)
> =

> diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/=
gpu/drm/i915/display/intel_atomic_plane.c
> index 79032701873a..fdc633020255 100644
> --- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> +++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> @@ -408,6 +408,13 @@ void intel_update_plane(struct intel_plane *plane,
>  	struct intel_crtc *crtc =3D to_intel_crtc(crtc_state->uapi.crtc);
>  =

>  	trace_intel_update_plane(&plane->base, crtc);
> +
> +	if (crtc_state->uapi.async_flip) {
> +		plane->program_async_surface_address(plane,
> +						     crtc_state, plane_state);
> +		return;
> +	}

if
	.async_flip()
else
	.update_plane()

should do

> +
>  	plane->update_plane(plane, crtc_state, plane_state);
>  }
>  =

> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers=
/gpu/drm/i915/display/intel_display_types.h
> index b2d0edacc58c..d2ae781e4d81 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -1190,6 +1190,9 @@ struct intel_plane {
>  			   struct intel_plane_state *plane_state);
>  	int (*min_cdclk)(const struct intel_crtc_state *crtc_state,
>  			 const struct intel_plane_state *plane_state);
> +	void (*program_async_surface_address)(struct intel_plane *plane,

That's a mouthful. I'd simplify it to eg. just .async_flip().

> +					      const struct intel_crtc_state *crtc_state,
> +					      const struct intel_plane_state *plane_state);
>  };
>  =

>  struct intel_watermark_params {
> diff --git a/drivers/gpu/drm/i915/display/intel_sprite.c b/drivers/gpu/dr=
m/i915/display/intel_sprite.c
> index f0c89418d2e1..69407dfcebf6 100644
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
> @@ -3096,6 +3119,7 @@ skl_universal_plane_create(struct drm_i915_private =
*dev_priv,
>  	plane->get_hw_state =3D skl_plane_get_hw_state;
>  	plane->check_plane =3D skl_plane_check;
>  	plane->min_cdclk =3D skl_plane_min_cdclk;
> +	plane->program_async_surface_address =3D skl_program_async_surface_addr=
ess;
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
