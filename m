Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3CF36FDC5
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 17:28:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23F0A6F54B;
	Fri, 30 Apr 2021 15:28:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CBBB6F54B
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 15:28:19 +0000 (UTC)
IronPort-SDR: M0HuxesnKkktSnCgiPMt20PAkaQAUATCdhN6vY9Koq0JEiqIeflGKc2gHrORX2F6RShApLZidD
 Vx9D3BqbA5Ag==
X-IronPort-AV: E=McAfee;i="6200,9189,9970"; a="177457858"
X-IronPort-AV: E=Sophos;i="5.82,263,1613462400"; d="scan'208";a="177457858"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2021 08:28:19 -0700
IronPort-SDR: tzvZIJHaQKm0nng8w5SSUZHN8det0RhqTfhIKAzz7SokX/lfNpphrgmb2l51GwdqwImA6NMn1d
 lQ241eMOk1sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,263,1613462400"; d="scan'208";a="394412862"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga007.fm.intel.com with SMTP; 30 Apr 2021 08:28:16 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 30 Apr 2021 18:28:15 +0300
Date: Fri, 30 Apr 2021 18:28:15 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: log errors in drm_gem_fb_init_with_funcs
Message-ID: <YIwiD3KFC67fiSYB@intel.com>
References: <R359hIfrDhyN2VBgiSyQ1ogbifYmn7KwIuMUqS3u3A@cp4-web-032.plabs.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <R359hIfrDhyN2VBgiSyQ1ogbifYmn7KwIuMUqS3u3A@cp4-web-032.plabs.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 30, 2021 at 02:40:02PM +0000, Simon Ser wrote:
> Let the user know what went wrong in drm_gem_fb_init_with_funcs
> failure paths.
> =

> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Noralf Tr=F8nnes <noralf@tronnes.org>
> Cc: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> ---
>  drivers/gpu/drm/drm_gem_framebuffer_helper.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> =

> diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/d=
rm/drm_gem_framebuffer_helper.c
> index 109d11fb4cd4..e4a3c7eb43b2 100644
> --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> @@ -155,8 +155,10 @@ int drm_gem_fb_init_with_funcs(struct drm_device *de=
v,
>  	int ret, i;
>  =

>  	info =3D drm_get_format_info(dev, mode_cmd);
> -	if (!info)
> +	if (!info) {
> +		drm_dbg_kms(dev, "Failed to get FB format info\n");
>  		return -EINVAL;
> +	}

Assuming this thing gets plugged into .fb_create() getting
this far with a bogus format would be rather suprising.

>  =

>  	for (i =3D 0; i < info->num_planes; i++) {
>  		unsigned int width =3D mode_cmd->width / (i ? info->hsub : 1);
> @@ -175,6 +177,9 @@ int drm_gem_fb_init_with_funcs(struct drm_device *dev,
>  			 + mode_cmd->offsets[i];
>  =

>  		if (objs[i]->size < min_size) {
> +			drm_dbg_kms(dev,
> +				    "GEM object size (%u) smaller than minimum size (%u) for plane %=
d\n",
> +				    objs[i]->size, min_size, i);
>  			drm_gem_object_put(objs[i]);
>  			ret =3D -EINVAL;
>  			goto err_gem_object_put;
> -- =

> 2.31.1
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
