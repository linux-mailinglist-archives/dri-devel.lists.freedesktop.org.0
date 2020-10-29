Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E51629ED99
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 14:50:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36DC76ECC6;
	Thu, 29 Oct 2020 13:50:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAC4C6ECD8
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 13:50:45 +0000 (UTC)
IronPort-SDR: qqWdUGhk6utG8WH97rv37S0cAb7h7NA2m/ijNRsmTTKShvUryKDi3kX83Z6VzL0AUAaz48gGdz
 7buVoApasjAA==
X-IronPort-AV: E=McAfee;i="6000,8403,9788"; a="253140168"
X-IronPort-AV: E=Sophos;i="5.77,430,1596524400"; d="scan'208";a="253140168"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2020 06:50:45 -0700
IronPort-SDR: hSFaOqAVMNCkyTGUZT9uN6KjpWEKeaSwDC7/UyIfdvZTvnxqKFFhXml2EswvysRoXwx6+ytHCO
 VwbYh6rZqgDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,430,1596524400"; d="scan'208";a="395166957"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga001.jf.intel.com with SMTP; 29 Oct 2020 06:50:42 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 29 Oct 2020 15:50:41 +0200
Date: Thu, 29 Oct 2020 15:50:41 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 1/2] drm/atomic: Pass the full state to CRTC atomic_check
Message-ID: <20201029135041.GA6112@intel.com>
References: <20201028123222.1732139-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201028123222.1732139-1-maxime@cerno.tech>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 28, 2020 at 01:32:21PM +0100, Maxime Ripard wrote:
> The current atomic helpers have either their object state being passed as
> an argument or the full atomic state.
> =

> The former is the pattern that was done at first, before switching to the
> latter for new hooks or when it was needed.
> =

> Let's start convert all the remaining helpers to provide a consistent
> interface, starting with the CRTC's atomic_check.
> =

> The conversion was done using the coccinelle script below,
> built tested on all the drivers and actually tested on vc4.
> =

> virtual report

?

<snip>
> @ depends on crtc_atomic_func @
> identifier crtc_atomic_func.func;
> expression E;
> type T;
> @@
> =

>  int func(...)
>  {
> 	...
> -	T state =3D E;
> +	T crtc_state =3D E;
>  	<+...
> -	state
> +	crtc_state
>  	...+>

>  }
> =

> @ depends on crtc_atomic_func @
> identifier crtc_atomic_func.func;
> type T;
> @@
> =

>  int func(...)
>  {
>  	...
> -	T state;
> +	T crtc_state;
>  	<+...
> -	state
> +	crtc_state
>  	...+>
>  }

These two seem a bit fuzzy. AFAICS 'state' could be any
kind of state given the constrainsts. Though I guess
the fact that this is the crtc .atomic_check() it's most
likely to either the crtc state or the whole atomic state.

Not sure what would be the best way to tighten this up.
Maybe a regex thing on the assignment? But I'm not sure
you can even do that on an expression.

Anyways, doesn't look like this went wrong anywhere, so
seems good enough for a onetime job.

<snip>
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mx=
sfb_kms.c
> index 956f631997f2..b0757f84a979 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> @@ -269,17 +269,19 @@ static void mxsfb_crtc_mode_set_nofb(struct mxsfb_d=
rm_private *mxsfb)
>  }
>  =

>  static int mxsfb_crtc_atomic_check(struct drm_crtc *crtc,
> -				   struct drm_crtc_state *state)
> +				   struct drm_atomic_state *state)
>  {
> -	bool has_primary =3D state->plane_mask &
> +	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(sta=
te,
> +									  crtc);
> +	bool has_primary =3D crtc_state->plane_mask &
>  			   drm_plane_mask(crtc->primary);
>  =

>  	/* The primary plane has to be enabled when the CRTC is active. */
> -	if (state->active && !has_primary)
> +	if (crtc_state->active && !has_primary)
>  		return -EINVAL;
>  =

>  	/* TODO: Is this needed ? */
> -	return drm_atomic_add_affected_planes(state->state, crtc);
> +	return drm_atomic_add_affected_planes(crtc_state->state, crtc);

Could also s/crtc_state->state/state/ in various places.

But that could done as a followup as well.

Didn't spot any mistakes:
Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
