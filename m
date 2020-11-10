Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86EAD2ADB32
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 17:04:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D00E08970B;
	Tue, 10 Nov 2020 16:04:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47B748935C
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 16:04:23 +0000 (UTC)
IronPort-SDR: ZvSsBT1kB++iGQZKi+4uQ0PUvMaZn/G48EX2F6pqTj25R6DfoXadaQl+OLSV6A2JKS6uW6qyIO
 c6Pj22h2a0dA==
X-IronPort-AV: E=McAfee;i="6000,8403,9801"; a="167414789"
X-IronPort-AV: E=Sophos;i="5.77,466,1596524400"; d="scan'208";a="167414789"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2020 08:04:08 -0800
IronPort-SDR: 5yrC1rgqAjWPTMag4X+IoJG30cqWGtkQDFbDOal+CcU/nw3yWeOPwqqCTMM2S9PrkgfBBUv93H
 5OBGtjVNpGxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,466,1596524400"; d="scan'208";a="365564827"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 10 Nov 2020 08:04:06 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 10 Nov 2020 18:04:05 +0200
Date: Tue, 10 Nov 2020 18:04:05 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: add debug logs for drm_mode_atomic_ioctl errors
Message-ID: <20201110160405.GS6112@intel.com>
References: <2sJwtJZS8GpTVmDedCE6b5WNkmnmUARXGt0mugjU2BA@cp3-web-033.plabs.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2sJwtJZS8GpTVmDedCE6b5WNkmnmUARXGt0mugjU2BA@cp3-web-033.plabs.ch>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 10, 2020 at 03:58:01PM +0000, Simon Ser wrote:
> Be nice to user-space and log what happened when returning EINVAL in
> drm_mode_atomic_ioctl.
> =

> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_atomic_uapi.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> =

> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atom=
ic_uapi.c
> index 25c269bc4681..68d767420082 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -1303,22 +1303,30 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>  	 * though this may be a bit overkill, since legacy userspace
>  	 * wouldn't know how to call this ioctl)
>  	 */
> -	if (!file_priv->atomic)
> +	if (!file_priv->atomic) {
> +		DRM_DEBUG_ATOMIC("atomic commit failed: atomic cap not enabled\n");

The "atomic commit failed:" bit seems a bit redundant.

>  		return -EINVAL;
> +	}
>  =

> -	if (arg->flags & ~DRM_MODE_ATOMIC_FLAGS)
> +	if (arg->flags & ~DRM_MODE_ATOMIC_FLAGS) {
> +		DRM_DEBUG_ATOMIC("atomic commit failed: invalid flag\n");
>  		return -EINVAL;
> +	}
>  =

>  	if (arg->reserved)
>  		return -EINVAL;

You don't want one for this? I wonder why this "reserved" field
even exists...

>  =

> -	if (arg->flags & DRM_MODE_PAGE_FLIP_ASYNC)
> +	if (arg->flags & DRM_MODE_PAGE_FLIP_ASYNC) {
> +		DRM_DEBUG_ATOMIC("atomic commit failed: invalid flag DRM_MODE_PAGE_FLI=
P_ASYNC\n");
>  		return -EINVAL;
> +	}
>  =

>  	/* can't test and expect an event at the same time. */
>  	if ((arg->flags & DRM_MODE_ATOMIC_TEST_ONLY) &&
> -			(arg->flags & DRM_MODE_PAGE_FLIP_EVENT))
> +			(arg->flags & DRM_MODE_PAGE_FLIP_EVENT)) {
> +		DRM_DEBUG_ATOMIC("atomic commit failed: page-flip event requested with=
 test-only commit\n");
>  		return -EINVAL;
> +	}
>  =

>  	state =3D drm_atomic_state_alloc(dev);
>  	if (!state)
> -- =

> 2.29.2
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
