Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36838275663
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 12:31:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A00236E91B;
	Wed, 23 Sep 2020 10:31:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E39156E91B;
 Wed, 23 Sep 2020 10:31:41 +0000 (UTC)
IronPort-SDR: opwFi/DyMJQF86tFASptCl/3tgIC8jxq0fkCMQurZzBsmzneailZXBMo7zYfkUbZYdgmQ6JomC
 TifgypZe7rhA==
X-IronPort-AV: E=McAfee;i="6000,8403,9752"; a="224989365"
X-IronPort-AV: E=Sophos;i="5.77,293,1596524400"; d="scan'208";a="224989365"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2020 03:31:41 -0700
IronPort-SDR: dJLHP6x6OTti6lvlOm/HzCQP17j2glmN4Z43Bj7jAlZABciWOXFfk5ZPXkj2TjSwlgG+cji7r9
 ReJHzSDQrQ8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,293,1596524400"; d="scan'208";a="309857330"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga006.jf.intel.com with SMTP; 23 Sep 2020 03:31:37 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 23 Sep 2020 13:31:37 +0300
Date: Wed, 23 Sep 2020 13:31:37 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm: document and enforce rules around "spurious" EBUSY
 from atomic_commit
Message-ID: <20200923103137.GD6112@intel.com>
References: <20200922181834.2913552-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200922181834.2913552-1-daniel.vetter@ffwll.ch>
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 stable@vger.kernel.org, Daniel Vetter <daniel.vetter@intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.co.uk>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 22, 2020 at 08:18:34PM +0200, Daniel Vetter wrote:
> When doing an atomic modeset with ALLOW_MODESET drivers are allowed to
> pull in arbitrary other resources, including CRTCs (e.g. when
> reconfiguring global resources).
> =

> But in nonblocking mode userspace has then no idea this happened,
> which can lead to spurious EBUSY calls, both:
> - when that other CRTC is currently busy doing a page_flip the
>   ALLOW_MODESET commit can fail with an EBUSY
> - on the other CRTC a normal atomic flip can fail with EBUSY because
>   of the additional commit inserted by the kernel without userspace's
>   knowledge
> =

> For blocking commits this isn't a problem, because everyone else will
> just block until all the CRTC are reconfigured. Only thing userspace
> can notice is the dropped frames without any reason for why frames got
> dropped.
> =

> Consensus is that we need new uapi to handle this properly, but no one
> has any idea what exactly the new uapi should look like. Since this
> has been shipping for years already compositors need to deal no matter
> what, so as a first step just try to enforce this across drivers
> better with some checks.
> =

> v2: Add comments and a WARN_ON to enforce this only when allowed - we
> don't want to silently convert page flips into blocking plane updates
> just because the driver is buggy.
> =

> v3: Fix inverted WARN_ON (Pekka).
> =

> v4: Drop the uapi changes, only add a WARN_ON for now to enforce some
> rules for drivers.
> =

> References: https://lists.freedesktop.org/archives/dri-devel/2018-July/18=
2281.html
> Bugzilla: https://gitlab.freedesktop.org/wayland/weston/issues/24#note_95=
68
> Cc: Daniel Stone <daniel@fooishbar.org>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.co.uk>
> Cc: Simon Ser <contact@emersion.fr>
> Cc: stable@vger.kernel.org
> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  drivers/gpu/drm/drm_atomic.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> =

> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 58527f151984..ef106e7153a6 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -281,6 +281,10 @@ EXPORT_SYMBOL(__drm_atomic_state_free);
>   * needed. It will also grab the relevant CRTC lock to make sure that th=
e state
>   * is consistent.
>   *
> + * WARNING: Drivers may only add new CRTC states to a @state if
> + * drm_atomic_state.allow_modeset is set, or if it's a driver-internal c=
ommit
> + * not created by userspace through an IOCTL call.
> + *
>   * Returns:
>   *
>   * Either the allocated state or the error code encoded into the pointer=
. When
> @@ -1262,10 +1266,15 @@ int drm_atomic_check_only(struct drm_atomic_state=
 *state)
>  	struct drm_crtc_state *new_crtc_state;
>  	struct drm_connector *conn;
>  	struct drm_connector_state *conn_state;
> +	unsigned requested_crtc =3D 0;
> +	unsigned affected_crtc =3D 0;
>  	int i, ret =3D 0;
>  =

>  	DRM_DEBUG_ATOMIC("checking %p\n", state);
>  =

> +	for_each_new_crtc_in_state(state, crtc, old_crtc_state, i)
> +		requested_crtc |=3D drm_crtc_mask(crtc);
> +
>  	for_each_oldnew_plane_in_state(state, plane, old_plane_state, new_plane=
_state, i) {
>  		ret =3D drm_atomic_plane_check(old_plane_state, new_plane_state);
>  		if (ret) {
> @@ -1313,6 +1322,24 @@ int drm_atomic_check_only(struct drm_atomic_state =
*state)
>  		}
>  	}
>  =

> +	for_each_new_crtc_in_state(state, crtc, old_crtc_state, i)

Inconsistent old vs. new.

> +		affected_crtc |=3D drm_crtc_mask(crtc);
> +
> +	/*
> +	 * For commits that allow modesets drivers can add other CRTCs to the
> +	 * atomic commit, e.g. when they need to reallocate global resources.
> +	 * This can cause spurious EBUSY, which robs compositors of a very
> +	 * effective sanity check for their drawing loop. Therefor only allow
> +	 * this for modeset commits.
> +	 *
> +	 * FIXME: Should add affected_crtc mask to the ATOMIC IOCTL as an output
> +	 * so compositors know what's going on.
> +	 */
> +	if (affected_crtc !=3D requested_crtc) {
> +		/* adding other CRTC is only allowed for modeset commits */
> +		WARN_ON(!state->allow_modeset);
> +	}

I think this means pretty much all non-pageflip commits will
have to have allow_modeset=3D=3Dtrue on i915 or else we just can't
guarantee that we can anything (due to sagv and/or cdclk mainly).

Also a bit baffled that CI didn't hit this. I think it should be
totally possible to hit this now. To avoid that I guess we'd just
need to make intel_atomic_serialize_global_state() fail if it
has to add any new crtcs when allow_modeset=3D=3Dfalse. Hopefully
there aren't many other places that add crtcs to the state
without forcing a modeset on them.

> +
>  	return 0;
>  }
>  EXPORT_SYMBOL(drm_atomic_check_only);
> -- =

> 2.28.0

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
