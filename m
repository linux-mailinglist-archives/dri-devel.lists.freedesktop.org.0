Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 507DF1ECE12
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jun 2020 13:13:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3757689BF4;
	Wed,  3 Jun 2020 11:13:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C620C89BF4
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jun 2020 11:13:46 +0000 (UTC)
IronPort-SDR: 0eQXkG8s7iNIY39piB43495BtbLA8YmfJmurOCKpwie0p60elivCjwx8xcDammHmq8hdTg8Aj7
 A6OGw34kEjAw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2020 04:13:46 -0700
IronPort-SDR: Q5EPcuCm80c4yT+Fz12gJqO2PDosn+njfivokIQcWi1qKnZ5H5AzpGxw/hYoAjqrwRFszV2V2P
 OYguShbyWQ4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,467,1583222400"; d="scan'208";a="304574509"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga008.jf.intel.com with SMTP; 03 Jun 2020 04:13:43 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 03 Jun 2020 14:13:43 +0300
Date: Wed, 3 Jun 2020 14:13:43 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/atomic: don't reset link-status to GOOD without
 ALLOW_MODESET
Message-ID: <20200603111343.GO6112@intel.com>
References: <6Q-O7vKObfRu8cOyvcAxR_uRWgjQdlYgVursTGN2AaHtdaUZICSC6szFjkkDGXhyKF22Grj-aGCTC74OGhtuJ9JChitqvqtCVi1wr_Lnh6Y=@emersion.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6Q-O7vKObfRu8cOyvcAxR_uRWgjQdlYgVursTGN2AaHtdaUZICSC6szFjkkDGXhyKF22Grj-aGCTC74OGhtuJ9JChitqvqtCVi1wr_Lnh6Y=@emersion.fr>
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
Cc: Manasi Navare <manasi.d.navare@intel.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 03, 2020 at 10:45:23AM +0000, Simon Ser wrote:
> In update_output_state, the link-status property was reset to GOOD to
> ensure legacy drmModeSetCrtc re-trains the link. However this auto-reset
> is also performed on an atomic commit without ALLLOW_MODESET. If a

I didn't think udate_output_state() was getting called for
non-legacy paths. Where is that coming from?

> driver reads link-status to figure out whether to re-train the link,
> this could cause an atomic commit failure. User-space doesn't expect
> such a failure, because commits without ALLOW_MODESET aren't supposed to
> fail because of link training issues.
> =

> Change update_output_state to implicitly reset link-status to GOOD only
> if ALLOW_MODESET is set. This is the case for legacy drmModeSetCrtc
> because drm_atomic_state_init sets it (and is used in
> drm_atomic_helper_set_config, called from drm_mode_setcrtc).
> =

> Drivers don't seem to read link-status at the moment -- they seem to
> rely on user-space performing a modeset instead. So this shouldn't
> result in any change in behaviour, this should only prevent future
> failures if drivers start reading link-status.
> =

> Signed-off-by: Simon Ser <contact@emersion.fr>
> Suggested-by: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Manasi Navare <manasi.d.navare@intel.com>
> ---
>  drivers/gpu/drm/drm_atomic.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> =

> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 965173fd0ac2..3d9d9e6f7397 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -1426,7 +1426,8 @@ static int update_output_state(struct drm_atomic_st=
ate *state,
>  				return ret;
>  =

>  			/* Make sure legacy setCrtc always re-trains */
> -			new_conn_state->link_status =3D DRM_LINK_STATUS_GOOD;
> +			if (state->allow_modeset)
> +				new_conn_state->link_status =3D DRM_LINK_STATUS_GOOD;
>  		}
>  	}
>  =

> -- =

> 2.26.2
> =

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
