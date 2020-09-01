Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEED258D5A
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 13:23:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9839B6E851;
	Tue,  1 Sep 2020 11:23:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFEDF6E851;
 Tue,  1 Sep 2020 11:23:52 +0000 (UTC)
IronPort-SDR: sh0LLEPQdcPEeL2uWcJYbQ7dtISE7C6czbDMwf3P939yIrqd7BJgW7k8zSS5omM8eJGLP8rRYx
 +ppCm1J5KcWQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9730"; a="221374455"
X-IronPort-AV: E=Sophos;i="5.76,378,1592895600"; d="scan'208";a="221374455"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2020 04:23:51 -0700
IronPort-SDR: 9jMaMimnULPxsbY+BVrJE3ofFWTQbfT/f4sPaguGSl8NQAjuId29yOljEqNIVBv0zcRCU4OiBy
 MGyCkaJQoE5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,378,1592895600"; d="scan'208";a="340993898"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 01 Sep 2020 04:23:47 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 01 Sep 2020 14:23:46 +0300
Date: Tue, 1 Sep 2020 14:23:46 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Karthik B S <karthik.b.s@intel.com>
Subject: Re: [PATCH v6 4/7] drm/i915: Do not call drm_crtc_arm_vblank_event
 in async flips
Message-ID: <20200901112346.GI6112@intel.com>
References: <20200807093551.10673-1-karthik.b.s@intel.com>
 <20200807093551.10673-5-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200807093551.10673-5-karthik.b.s@intel.com>
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

On Fri, Aug 07, 2020 at 03:05:48PM +0530, Karthik B S wrote:
> Since the flip done event will be sent in the flip_done_handler,
> no need to add the event to the list and delay it for later.
> =

> v2: -Moved the async check above vblank_get as it
>      was causing issues for PSR.
> =

> v3: -No need to wait for vblank to pass, as this wait was causing a
>      16ms delay once every few flips.
> =

> v4: -Rebased.
> =

> v5: -Rebased.
> =

> v6: -Rebased.
> =

> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_sprite.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> =

> diff --git a/drivers/gpu/drm/i915/display/intel_sprite.c b/drivers/gpu/dr=
m/i915/display/intel_sprite.c
> index c26ca029fc0a..2b2d96c59d7f 100644
> --- a/drivers/gpu/drm/i915/display/intel_sprite.c
> +++ b/drivers/gpu/drm/i915/display/intel_sprite.c
> @@ -93,6 +93,9 @@ void intel_pipe_update_start(const struct intel_crtc_st=
ate *new_crtc_state)
>  	DEFINE_WAIT(wait);
>  	u32 psr_status;
>  =

> +	if (new_crtc_state->uapi.async_flip)
> +		goto irq_disable;

We shouldn't really need the irq disable at all if we don't do the
vblank evade. And if we only write ctl+surf then atomicity is already
guaranteed by the hw.

> +
>  	vblank_start =3D adjusted_mode->crtc_vblank_start;
>  	if (adjusted_mode->flags & DRM_MODE_FLAG_INTERLACE)
>  		vblank_start =3D DIV_ROUND_UP(vblank_start, 2);
> @@ -206,7 +209,7 @@ void intel_pipe_update_end(struct intel_crtc_state *n=
ew_crtc_state)
>  	 * Would be slightly nice to just grab the vblank count and arm the
>  	 * event outside of the critical section - the spinlock might spin for a
>  	 * while ... */
> -	if (new_crtc_state->uapi.event) {
> +	if (new_crtc_state->uapi.event && !new_crtc_state->uapi.async_flip) {
>  		drm_WARN_ON(&dev_priv->drm,
>  			    drm_crtc_vblank_get(&crtc->base) !=3D 0);
>  =

> @@ -220,6 +223,9 @@ void intel_pipe_update_end(struct intel_crtc_state *n=
ew_crtc_state)
>  =

>  	local_irq_enable();
>  =

> +	if (new_crtc_state->uapi.async_flip)
> +		return;
> +
>  	if (intel_vgpu_active(dev_priv))
>  		return;
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
