Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F9926FBD4
	for <lists+dri-devel@lfdr.de>; Fri, 18 Sep 2020 13:54:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E793B6ECDE;
	Fri, 18 Sep 2020 11:54:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E56D6ECDD;
 Fri, 18 Sep 2020 11:54:43 +0000 (UTC)
IronPort-SDR: RG0XQc86tjb1z0Ua2BGDM05PwkM8qfVDIo8HLxm6w7Jw+kbQZ+KUVLZE4m4iE3noaFuPzTmziy
 A4K5um0Xmmtg==
X-IronPort-AV: E=McAfee;i="6000,8403,9747"; a="178007346"
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; d="scan'208";a="178007346"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2020 04:54:41 -0700
IronPort-SDR: 3MYn21Bxg9eXNtOL1f37HN+jwnpyU4jskusag3F65NOmb9QBfh/BcbCvvHDmiIFE1yfWfmzGhU
 VgHeJihRenNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; d="scan'208";a="307853690"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga006.jf.intel.com with SMTP; 18 Sep 2020 04:54:37 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 18 Sep 2020 14:54:36 +0300
Date: Fri, 18 Sep 2020 14:54:36 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Karthik B S <karthik.b.s@intel.com>
Subject: Re: [PATCH v9 6/8] drm/i915: WA for platforms with double buffered
 address update enable bit
Message-ID: <20200918115436.GK6112@intel.com>
References: <20200916150824.15749-1-karthik.b.s@intel.com>
 <20200916150824.15749-7-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200916150824.15749-7-karthik.b.s@intel.com>
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

On Wed, Sep 16, 2020 at 08:38:22PM +0530, Karthik B S wrote:
> In Gen 9 and Gen 10 platforms, async address update enable bit is
> double buffered. Due to this, during the transition from async flip
> to sync flip we have to wait until this bit is updated before continuing
> with the normal commit for sync flip.
> =

> v9: -Rename skl_toggle_async_sync() to skl_disable_async_flip_wa(). (Vill=
e)
>     -Place the declarations appropriately as per need. (Ville)
>     -Take the lock before the reg read. (Ville)
>     -Fix comment and formatting. (Ville)
>     -Use IS_GEN_RANGE() for gen check. (Ville)
>     -Move skl_disable_async_flip_wa() to intel_pre_plane_update(). (Ville)
> =

> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>

Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 46 ++++++++++++++++++++
>  1 file changed, 46 insertions(+)
> =

> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/d=
rm/i915/display/intel_display.c
> index 0f0bcbb00c7f..6f6edc581e14 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -6562,6 +6562,43 @@ static void intel_post_plane_update(struct intel_a=
tomic_state *state,
>  		icl_wa_scalerclkgating(dev_priv, pipe, false);
>  }
>  =

> +static void skl_disable_async_flip_wa(struct intel_atomic_state *state,
> +				      struct intel_crtc *crtc,
> +				      const struct intel_crtc_state *new_crtc_state)
> +{
> +	struct drm_i915_private *dev_priv =3D to_i915(state->base.dev);
> +	struct intel_plane *plane;
> +	struct intel_plane_state *new_plane_state;
> +	int i;
> +
> +	for_each_new_intel_plane_in_state(state, plane, new_plane_state, i) {
> +		u32 update_mask =3D new_crtc_state->update_planes;
> +		u32 plane_ctl, surf_addr;
> +		enum plane_id plane_id;
> +		unsigned long irqflags;
> +		enum pipe pipe;
> +
> +		if (crtc->pipe !=3D plane->pipe ||
> +		    !(update_mask & BIT(plane->id)))
> +			continue;
> +
> +		plane_id =3D plane->id;
> +		pipe =3D plane->pipe;
> +
> +		spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
> +		plane_ctl =3D intel_de_read_fw(dev_priv, PLANE_CTL(pipe, plane_id));
> +		surf_addr =3D intel_de_read_fw(dev_priv, PLANE_SURF(pipe, plane_id));
> +
> +		plane_ctl &=3D ~PLANE_CTL_ASYNC_FLIP;
> +
> +		intel_de_write_fw(dev_priv, PLANE_CTL(pipe, plane_id), plane_ctl);
> +		intel_de_write_fw(dev_priv, PLANE_SURF(pipe, plane_id), surf_addr);
> +		spin_unlock_irqrestore(&dev_priv->uncore.lock, irqflags);
> +	}
> +
> +	intel_wait_for_vblank(dev_priv, crtc->pipe);
> +}
> +
>  static void intel_pre_plane_update(struct intel_atomic_state *state,
>  				   struct intel_crtc *crtc)
>  {
> @@ -6647,6 +6684,15 @@ static void intel_pre_plane_update(struct intel_at=
omic_state *state,
>  	 */
>  	if (IS_GEN(dev_priv, 2) && planes_disabling(old_crtc_state, new_crtc_st=
ate))
>  		intel_set_cpu_fifo_underrun_reporting(dev_priv, pipe, false);
> +
> +	/*
> +	 * WA for platforms where async address update enable bit
> +	 * is double buffered and only latched at start of vblank.
> +	 */
> +	if (old_crtc_state->uapi.async_flip &&
> +	    !new_crtc_state->uapi.async_flip &&
> +	    IS_GEN_RANGE(dev_priv, 9, 10))
> +		skl_disable_async_flip_wa(state, crtc, new_crtc_state);
>  }
>  =

>  static void intel_crtc_disable_planes(struct intel_atomic_state *state,
> -- =

> 2.22.0

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
