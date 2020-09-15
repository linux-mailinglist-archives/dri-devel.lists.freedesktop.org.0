Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AED026A6EC
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 16:19:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFB1A6E0D3;
	Tue, 15 Sep 2020 14:19:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 103CA6E08A;
 Tue, 15 Sep 2020 14:19:14 +0000 (UTC)
IronPort-SDR: /yMnoJfanIEtF4exvsE6+OhI3c7GqqHST1fmxhfUyu0A1nzj5C3mgkddnd4yCrtq3qt7LQ9h21
 o2JtBYrLQFtw==
X-IronPort-AV: E=McAfee;i="6000,8403,9744"; a="177332505"
X-IronPort-AV: E=Sophos;i="5.76,430,1592895600"; d="scan'208";a="177332505"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2020 07:19:14 -0700
IronPort-SDR: 20ZIljk/H5xsjRQjaczGdqG4CG97Ww4geS+g6tZYHW4sdAHcb2GI1u29zAlALcA7ddupUYYbpM
 vKLHfnRwR6kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,430,1592895600"; d="scan'208";a="319473324"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga002.jf.intel.com with SMTP; 15 Sep 2020 07:19:10 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 15 Sep 2020 17:19:09 +0300
Date: Tue, 15 Sep 2020 17:19:09 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Karthik B S <karthik.b.s@intel.com>
Subject: Re: [PATCH v8 6/8] drm/i915: WA for platforms with double buffered
 adress update enable bit
Message-ID: <20200915141909.GM6112@intel.com>
References: <20200914055633.21109-1-karthik.b.s@intel.com>
 <20200914055633.21109-7-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200914055633.21109-7-karthik.b.s@intel.com>
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

On Mon, Sep 14, 2020 at 11:26:31AM +0530, Karthik B S wrote:
> In Gen 9 and Gen 10 platforms, async address update enable bit is
> double buffered. Due to this, during the transition from async flip
> to sync flip we have to wait until this bit is updated before continuing
> with the normal commit for sync flip.
> =

> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 44 ++++++++++++++++++++
>  1 file changed, 44 insertions(+)
> =

> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/d=
rm/i915/display/intel_display.c
> index a0c17d94daf3..b7e24dff0772 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -15360,6 +15360,42 @@ static void intel_enable_crtc(struct intel_atomi=
c_state *state,
>  	intel_crtc_enable_pipe_crc(crtc);
>  }
>  =

> +static void skl_toggle_async_sync(struct intel_atomic_state *state,

skl_disable_async_flip_wa() maybe?

> +				  struct intel_crtc *crtc,
> +				  struct intel_crtc_state *new_crtc_state)
> +{
> +	struct drm_i915_private *dev_priv =3D to_i915(state->base.dev);
> +	struct intel_plane *plane;
> +	struct intel_plane_state *new_plane_state;
> +	u32 update_mask =3D new_crtc_state->update_planes;
> +	u32 plane_ctl, surf_addr;
> +	enum plane_id plane_id;
> +	unsigned long irqflags;
> +	enum pipe pipe;

Most of these things are only needed within the loop, so that's where
the declarations should be.

> +	int i;
> +
> +	for_each_new_intel_plane_in_state(state, plane, new_plane_state, i) {
> +		if (crtc->pipe !=3D plane->pipe ||
> +		    !(update_mask & BIT(plane->id)))
> +			continue;
> +
> +		plane_id =3D plane->id;
> +		pipe =3D plane->pipe;
> +

I'd take the lock here so the rmw is fully protected.

> +		plane_ctl =3D intel_de_read_fw(dev_priv, PLANE_CTL(pipe, plane_id));
> +		surf_addr =3D intel_de_read_fw(dev_priv, PLANE_SURF(pipe, plane_id));
> +
> +		plane_ctl &=3D ~PLANE_CTL_ASYNC_FLIP;
> +
> +		spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
> +		intel_de_write_fw(dev_priv, PLANE_CTL(pipe, plane_id), plane_ctl);
> +		intel_de_write_fw(dev_priv, PLANE_SURF(pipe, plane_id), surf_addr);
> +		spin_unlock_irqrestore(&dev_priv->uncore.lock, irqflags);
> +	}
> +
> +	intel_wait_for_vblank(dev_priv, crtc->pipe);
> +}
> +
>  static void intel_update_crtc(struct intel_atomic_state *state,
>  			      struct intel_crtc *crtc)
>  {
> @@ -15387,6 +15423,14 @@ static void intel_update_crtc(struct intel_atomi=
c_state *state,
>  	else
>  		intel_fbc_enable(state, crtc);
>  =

> +	/* WA for older platforms where async address update enable bit

s/older//

> +	 * is double buffered.

"is double buffered and only latched at start of vblank" or
something. Otherwise one is left wondering what the fuss is about.

> +	 */

Multiline comment format should be
/*
 * blah
 * blah
 */

> +	if (old_crtc_state->uapi.async_flip &&
> +	    !new_crtc_state->uapi.async_flip &&
> +	    INTEL_GEN(dev_priv) <=3D 10 && INTEL_GEN(dev_priv) >=3D 9)

IS_GEN_RANGE(9, 10) or whatever it's called.

I guess we might want to put this call into intel_pre_plane_update()
since that's where all kinds of similar wait_for_vblank w/as live.

> +		skl_toggle_async_sync(state, crtc, new_crtc_state);
> +
>  	/* Perform vblank evasion around commit operation */
>  	intel_pipe_update_start(new_crtc_state);
>  =

> -- =

> 2.22.0

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
