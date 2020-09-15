Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D05BD26A6CC
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 16:07:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F63E8926D;
	Tue, 15 Sep 2020 14:07:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8D988920E;
 Tue, 15 Sep 2020 14:07:25 +0000 (UTC)
IronPort-SDR: nBJFAhVy7Do3uwfVAkfJi9Et0WXgPhPHKezT0m7cu3gxxK3HJmG6TTt6H2W9sXpNDES1jLhylu
 OXE++Bq0FD/g==
X-IronPort-AV: E=McAfee;i="6000,8403,9744"; a="177329953"
X-IronPort-AV: E=Sophos;i="5.76,430,1592895600"; d="scan'208";a="177329953"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2020 07:07:24 -0700
IronPort-SDR: aGYtl15hg1DUW7ctfkvwP6meEMcRsPQpSyEUg0nCmp37aTUVB+VarDi3mGW6b8EqbstLsOXDnB
 cYmnh/yVWJiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,430,1592895600"; d="scan'208";a="343517109"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 15 Sep 2020 07:07:20 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 15 Sep 2020 17:07:19 +0300
Date: Tue, 15 Sep 2020 17:07:19 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Karthik B S <karthik.b.s@intel.com>
Subject: Re: [PATCH v8 4/8] drm/i915: Do not call drm_crtc_arm_vblank_event
 in async flips
Message-ID: <20200915140719.GK6112@intel.com>
References: <20200914055633.21109-1-karthik.b.s@intel.com>
 <20200914055633.21109-5-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200914055633.21109-5-karthik.b.s@intel.com>
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

On Mon, Sep 14, 2020 at 11:26:29AM +0530, Karthik B S wrote:
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

> v7: -No need of irq disable if we are not doing vblank evade. (Ville)
> =

> v8: -Rebased.
> =

> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_sprite.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> =

> diff --git a/drivers/gpu/drm/i915/display/intel_sprite.c b/drivers/gpu/dr=
m/i915/display/intel_sprite.c
> index 5ac0dbf0e03d..f0c89418d2e1 100644
> --- a/drivers/gpu/drm/i915/display/intel_sprite.c
> +++ b/drivers/gpu/drm/i915/display/intel_sprite.c
> @@ -93,6 +93,9 @@ void intel_pipe_update_start(const struct intel_crtc_st=
ate *new_crtc_state)
>  	DEFINE_WAIT(wait);
>  	u32 psr_status;
>  =

> +	if (new_crtc_state->uapi.async_flip)
> +		return;
> +
>  	vblank_start =3D adjusted_mode->crtc_vblank_start;
>  	if (adjusted_mode->flags & DRM_MODE_FLAG_INTERLACE)
>  		vblank_start =3D DIV_ROUND_UP(vblank_start, 2);
> @@ -202,6 +205,9 @@ void intel_pipe_update_end(struct intel_crtc_state *n=
ew_crtc_state)
>  =

>  	trace_intel_pipe_update_end(crtc, end_vbl_count, scanline_end);
>  =

> +	if (new_crtc_state->uapi.async_flip)
> +		return;

The pipe update tracepoints will be inconsistent if you put this here.
I guess we don't really need the pipe update tracepoints for async
flips. We might want to add a separate tracepoint for async flip itself,
or perhaps convey the sync vs. async information via the current
plane update tracepoint.

With this moved to before the tracepoint
Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

> +
>  	/* We're still in the vblank-evade critical section, this can't race.
>  	 * Would be slightly nice to just grab the vblank count and arm the
>  	 * event outside of the critical section - the spinlock might spin for a
> -- =

> 2.22.0

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
