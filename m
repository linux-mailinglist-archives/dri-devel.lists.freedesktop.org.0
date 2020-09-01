Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79000258D6B
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 13:27:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D3646E857;
	Tue,  1 Sep 2020 11:27:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5C586E853;
 Tue,  1 Sep 2020 11:27:23 +0000 (UTC)
IronPort-SDR: KJ4dVih2iUSFbaQlDXr855zJ/fRQThOWZCBmFwF9XZGL2npBSnMgsKDNZ7+zWmBmlr3NwOuO9W
 VXdFEeYrR+Rw==
X-IronPort-AV: E=McAfee;i="6000,8403,9730"; a="154658337"
X-IronPort-AV: E=Sophos;i="5.76,378,1592895600"; d="scan'208";a="154658337"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2020 04:27:22 -0700
IronPort-SDR: 9C9HRrq92EbJ7ZvAxMs9fmu5rpdJdyTSoKLaFEe3eYogq1PuJnMljb2lbnTB8Ullxonmgi5leE
 FWmznr5V5XaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,378,1592895600"; d="scan'208";a="314697230"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga002.jf.intel.com with SMTP; 01 Sep 2020 04:27:18 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 01 Sep 2020 14:27:17 +0300
Date: Tue, 1 Sep 2020 14:27:17 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Karthik B S <karthik.b.s@intel.com>
Subject: Re: [PATCH v6 5/7] drm/i915: Add dedicated plane hook for async flip
 case
Message-ID: <20200901112717.GJ6112@intel.com>
References: <20200807093551.10673-1-karthik.b.s@intel.com>
 <20200807093551.10673-6-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200807093551.10673-6-karthik.b.s@intel.com>
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

On Fri, Aug 07, 2020 at 03:05:49PM +0530, Karthik B S wrote:
> This hook is added to avoid writing other plane registers in case of
> async flips, so that we do not write the double buffered registers
> during async surface address update.
> =

> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_sprite.c | 25 +++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> =

> diff --git a/drivers/gpu/drm/i915/display/intel_sprite.c b/drivers/gpu/dr=
m/i915/display/intel_sprite.c
> index 2b2d96c59d7f..1c03546a4d2a 100644
> --- a/drivers/gpu/drm/i915/display/intel_sprite.c
> +++ b/drivers/gpu/drm/i915/display/intel_sprite.c
> @@ -609,6 +609,24 @@ icl_program_input_csc(struct intel_plane *plane,
>  			  PLANE_INPUT_CSC_POSTOFF(pipe, plane_id, 2), 0x0);
>  }
>  =

> +static void
> +skl_program_async_surface_address(struct drm_i915_private *dev_priv,
> +				  const struct intel_plane_state *plane_state,
> +				  enum pipe pipe, enum plane_id plane_id,
> +				  u32 surf_addr)
> +{
> +	unsigned long irqflags;
> +	u32 plane_ctl =3D plane_state->ctl;

Need the bits from skl_plane_ctl_crtc() too.

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
> @@ -637,6 +655,13 @@ skl_program_plane(struct intel_plane *plane,
>  	u32 keymsk, keymax;
>  	u32 plane_ctl =3D plane_state->ctl;
>  =

> +	/* During Async flip, no other updates are allowed */
> +	if (crtc_state->uapi.async_flip) {
> +		skl_program_async_surface_address(dev_priv, plane_state,
> +						  pipe, plane_id, surf_addr);
> +		return;
> +	}

I'd suggest adding a vfunc for this. Should be able to call it from
intel_update_plane(). That way we don't need to patch it into each
and every .update_plane() implementation.


> +
>  	plane_ctl |=3D skl_plane_ctl_crtc(crtc_state);
>  =

>  	if (INTEL_GEN(dev_priv) >=3D 10 || IS_GEMINILAKE(dev_priv))
> -- =

> 2.22.0

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
