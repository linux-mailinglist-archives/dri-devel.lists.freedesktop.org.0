Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F23D13024B7
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jan 2021 13:13:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2D6789C88;
	Mon, 25 Jan 2021 12:13:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C04389C88
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 12:13:25 +0000 (UTC)
IronPort-SDR: MbuEPCSnldxFwZp2HpptRe6roCTmr0xLZr7NQiCxKcS2h5MuK9R9//anzF+zqB6uZt5boMr2bK
 1xzEhbPkvCtw==
X-IronPort-AV: E=McAfee;i="6000,8403,9874"; a="159489439"
X-IronPort-AV: E=Sophos;i="5.79,373,1602572400"; d="scan'208";a="159489439"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2021 04:13:24 -0800
IronPort-SDR: 9qd2aZHm0dS+lvCto+da6tKdkaWQAtPzN47Q68a3w+bOczfN06WbEvfcNszP88bUaQxapUVMsF
 /BC7pBxprTgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,373,1602572400"; d="scan'208";a="350250591"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga007.fm.intel.com with SMTP; 25 Jan 2021 04:13:22 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 25 Jan 2021 14:13:22 +0200
Date: Mon, 25 Jan 2021 14:13:22 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Mario Kleiner <mario.kleiner.de@gmail.com>
Subject: Re: [PATCH] drm/simple-kms: Drop drm_simple_kms_format_mod_supported.
Message-ID: <YA614iI5kHJMATye@intel.com>
References: <20210124204748.25234-1-mario.kleiner.de@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210124204748.25234-1-mario.kleiner.de@gmail.com>
X-Patchwork-Hint: comment
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jan 24, 2021 at 09:47:48PM +0100, Mario Kleiner wrote:
> The check was introduced to make sure that only the
> DRM_FORMAT_MOD_LINEAR modifier is accepted by tinydrm.
> =

> However, if .format_mod_supported is not hooked up to
> drm_simple_kms_format_mod_supported then the core will
> simply validate modifiers against the format_modifiers
> list passed into drm_simple_display_pipe_init() or
> drm_universal_plane_init() and perform the same validation
> as drm_simple_kms_format_mod_supported() would have done.
> =

> Additionally, if a kms driver / plane does not support
> modifiers, it will not reject fb updates with no modifiers/
> DRM_FORMAT_MOD_INVALID. This is important, because some
> simple drm drivers, e.g., pl111, pass NULL as format_modifiers
> list, so modifier support is disabled for these drivers,
> userspace would fall back to drmAddFB() without modifiers,
> and ergo the current drm_simple_kms_format_mod_supported()
> function would reject valid modifier-less fb's.
> =

> So this should fix display on non-tinydrm drivers like
> pl111, and probably also for non-atomic clients?
> =

> The Mesa vc4 gallium driver mentions pl111 as one possible
> display driver in render_only mode, so i assume this matters
> for some SoC's?
> =

> The background for the patch that introduced this was to
> fix atomic modesetting in the X-Servers modesetting-ddx,
> but with atomic modesetting and format modifiers disabled
> in modesetting-ddx (and also current kernels when interacting
> with modesetting-ddx), i assume this should fix some panels.
> =

> Note that i don't have any of the hw required for testing
> this, this is purely based on looking at the code, so this
> patch is only compile-tested.
> =

> For more reference, this fix was motivated by some discussions
> around broken page-flipping on VideoCore6 / RaspberryPi 4
> with current Raspbian OS, so the experts may want to weigh
> in on that Mesa bug report as well, under the following link:
> =

> https://gitlab.freedesktop.org/mesa/mesa/-/issues/3601
> =

> Fixes: dff906c3f91c ("drm/tinydrm: Advertise that we can do only DRM_FORM=
AT_MOD_LINEAR.")
> Signed-off-by: Mario Kleiner <mario.kleiner.de@gmail.com>
> Cc: Eric Anholt <eric@anholt.net>
> Cc: Noralf Tr=F8nnes <noralf@tronnes.org>
> Cc: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_simple_kms_helper.c | 8 --------
>  1 file changed, 8 deletions(-)
> =

> diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c b/drivers/gpu/drm/dr=
m_simple_kms_helper.c
> index 743e57c1b44f..5f3e30553172 100644
> --- a/drivers/gpu/drm/drm_simple_kms_helper.c
> +++ b/drivers/gpu/drm/drm_simple_kms_helper.c
> @@ -229,13 +229,6 @@ static void drm_simple_kms_plane_cleanup_fb(struct d=
rm_plane *plane,
>  	pipe->funcs->cleanup_fb(pipe, state);
>  }
>  =

> -static bool drm_simple_kms_format_mod_supported(struct drm_plane *plane,
> -						uint32_t format,
> -						uint64_t modifier)
> -{
> -	return modifier =3D=3D DRM_FORMAT_MOD_LINEAR;
> -}
> -
>  static const struct drm_plane_helper_funcs drm_simple_kms_plane_helper_f=
uncs =3D {
>  	.prepare_fb =3D drm_simple_kms_plane_prepare_fb,
>  	.cleanup_fb =3D drm_simple_kms_plane_cleanup_fb,
> @@ -250,7 +243,6 @@ static const struct drm_plane_funcs drm_simple_kms_pl=
ane_funcs =3D {
>  	.reset			=3D drm_atomic_helper_plane_reset,
>  	.atomic_duplicate_state	=3D drm_atomic_helper_plane_duplicate_state,
>  	.atomic_destroy_state	=3D drm_atomic_helper_plane_destroy_state,
> -	.format_mod_supported   =3D drm_simple_kms_format_mod_supported,

This will now cause also this driver to report a totally borked
IN_FORMATS blob.

Would need this
https://patchwork.freedesktop.org/series/83018/

but IIRC the bikeshed around that kinda suggested we should just
implement .format_mod_support() always. Can't quite recall the
details anymore.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
