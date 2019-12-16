Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA0D1211B5
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 18:27:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9F4A6E842;
	Mon, 16 Dec 2019 17:27:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 795B26E842
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 17:27:29 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Dec 2019 09:27:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,322,1571727600"; d="scan'208";a="221541460"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga001.fm.intel.com with SMTP; 16 Dec 2019 09:27:26 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 16 Dec 2019 19:27:25 +0200
Date: Mon, 16 Dec 2019 19:27:25 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Stephan Gerhold <stephan@gerhold.net>
Subject: Re: [PATCH v2] drm/modes: Apply video parameters with only reflect
 option
Message-ID: <20191216172725.GZ1208@intel.com>
References: <20191216171017.173326-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191216171017.173326-1-stephan@gerhold.net>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 16, 2019 at 06:10:17PM +0100, Stephan Gerhold wrote:
> At the moment, video mode parameters like video=3D540x960,reflect_x,
> (without rotation set) are not taken into account when applying the
> mode in drm_client_modeset.c.

A rotation value without exactly one rotation angle is illegal.
IMO the code should not generate a value like that in the first
place.

> =

> One of the reasons for this is that the calculation that
> combines the panel_orientation with cmdline->rotation_reflection
> does not handle the case when cmdline->rotation_reflection does
> not have any rotation set.
> (i.e. cmdline->rotation_reflection & DRM_MODE_ROTATE_MASK =3D=3D 0)
> =

> Example:
>   *rotation =3D DRM_MODE_ROTATE_0 (no panel_orientation)
>   cmdline->rotation_reflection =3D DRM_MODE_REFLECT_X (video=3DMODE,refle=
ct_x)
> =

> The current code does:
>   panel_rot =3D ilog2(*rotation & DRM_MODE_ROTATE_MASK);
>   cmdline_rot =3D ilog2(cmdline->rotation_reflection & DRM_MODE_ROTATE_MA=
SK);
>   sum_rot =3D (panel_rot + cmdline_rot) % 4;
> =

> and therefore:
>   panel_rot =3D ilog2(DRM_MODE_ROTATE_0) =3D ilog2(1) =3D 0
>   cmdline_rot =3D ilog2(0) =3D -1
>   sum_rot =3D (0 + -1) % 4 =3D -1 % 4 =3D 3
>    ...
>   *rotation =3D DRM_MODE_ROTATE_270 | DRM_MODE_REFLECT_X
> =

> So we incorrectly generate DRM_MODE_ROTATE_270 in this case.
> To prevent cmdline_rot from becoming -1, we need to treat
> the rotation as DRM_MODE_ROTATE_0.
> =

> On the other hand, there is no need to go through that calculation
> at all if no rotation is set in rotation_reflection.
> A simple XOR is enough to combine the reflections.
> =

> Finally, also allow DRM_MODE_ROTATE_0 in the if statement below.
> DRM_MODE_ROTATE_0 means "no rotation" and should therefore not
> require any special handling (e.g. specific tiling format).
> =

> This makes video parameters with only reflect option work correctly.
> =

> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
> v1: https://lists.freedesktop.org/archives/dri-devel/2019-December/248145=
.html
> =

> Changes in v2:
>   - Clarified commit message - parameters are parsed correctly,
>     but not taken into account when applying the mode.
> ---
>  drivers/gpu/drm/drm_client_modeset.c | 27 ++++++++++++++++-----------
>  1 file changed, 16 insertions(+), 11 deletions(-)
> =

> diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_c=
lient_modeset.c
> index 895b73f23079..cfebce4f19a5 100644
> --- a/drivers/gpu/drm/drm_client_modeset.c
> +++ b/drivers/gpu/drm/drm_client_modeset.c
> @@ -859,19 +859,23 @@ bool drm_client_rotation(struct drm_mode_set *modes=
et, unsigned int *rotation)
>  	 */
>  	cmdline =3D &connector->cmdline_mode;
>  	if (cmdline->specified && cmdline->rotation_reflection) {
> -		unsigned int cmdline_rest, panel_rest;
> -		unsigned int cmdline_rot, panel_rot;
> -		unsigned int sum_rot, sum_rest;
> +		if (cmdline->rotation_reflection & DRM_MODE_ROTATE_MASK) {
> +			unsigned int cmdline_rest, panel_rest;
> +			unsigned int cmdline_rot, panel_rot;
> +			unsigned int sum_rot, sum_rest;
>  =

> -		panel_rot =3D ilog2(*rotation & DRM_MODE_ROTATE_MASK);
> -		cmdline_rot =3D ilog2(cmdline->rotation_reflection & DRM_MODE_ROTATE_M=
ASK);
> -		sum_rot =3D (panel_rot + cmdline_rot) % 4;
> +			panel_rot =3D ilog2(*rotation & DRM_MODE_ROTATE_MASK);
> +			cmdline_rot =3D ilog2(cmdline->rotation_reflection & DRM_MODE_ROTATE_=
MASK);
> +			sum_rot =3D (panel_rot + cmdline_rot) % 4;
>  =

> -		panel_rest =3D *rotation & ~DRM_MODE_ROTATE_MASK;
> -		cmdline_rest =3D cmdline->rotation_reflection & ~DRM_MODE_ROTATE_MASK;
> -		sum_rest =3D panel_rest ^ cmdline_rest;
> +			panel_rest =3D *rotation & ~DRM_MODE_ROTATE_MASK;
> +			cmdline_rest =3D cmdline->rotation_reflection & ~DRM_MODE_ROTATE_MASK;
> +			sum_rest =3D panel_rest ^ cmdline_rest;
>  =

> -		*rotation =3D (1 << sum_rot) | sum_rest;
> +			*rotation =3D (1 << sum_rot) | sum_rest;
> +		} else {
> +			*rotation ^=3D cmdline->rotation_reflection;
> +		}
>  	}
>  =

>  	/*
> @@ -879,7 +883,8 @@ bool drm_client_rotation(struct drm_mode_set *modeset=
, unsigned int *rotation)
>  	 * depending on the hardware this may require the framebuffer
>  	 * to be in a specific tiling format.
>  	 */
> -	if ((*rotation & DRM_MODE_ROTATE_MASK) !=3D DRM_MODE_ROTATE_180 ||
> +	if (((*rotation & DRM_MODE_ROTATE_MASK) !=3D DRM_MODE_ROTATE_0 &&
> +	     (*rotation & DRM_MODE_ROTATE_MASK) !=3D DRM_MODE_ROTATE_180) ||
>  	    !plane->rotation_property)
>  		return false;
>  =

> -- =

> 2.24.1
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
