Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 395C12D7AB9
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 17:21:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 264D06E479;
	Fri, 11 Dec 2020 16:21:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D07296E479
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 16:21:44 +0000 (UTC)
IronPort-SDR: qIhSLAl7Ujw/YxdaT3+WvIpKk3czpfyvXLh0bpDCoenv7mhWi/vq892FDX/25kd8euLxXYgTHq
 jFSv3hv6ZeJg==
X-IronPort-AV: E=McAfee;i="6000,8403,9832"; a="153691115"
X-IronPort-AV: E=Sophos;i="5.78,411,1599548400"; d="scan'208";a="153691115"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2020 08:21:44 -0800
IronPort-SDR: YVggXw13HtOY+s630JDvBcMyjxmEM2cxSjvQiX6F93HSeH3aMbTZ2ChFIGGc2JXU6h/O0SvY20
 bocQRHLtJnXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,411,1599548400"; d="scan'208";a="376593066"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 11 Dec 2020 08:21:40 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 11 Dec 2020 18:21:40 +0200
Date: Fri, 11 Dec 2020 18:21:40 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 1/2] drm/vkms: Unset preferred_depth
Message-ID: <X9OclB/6fOlel6W/@intel.com>
References: <20201211161113.3350061-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201211161113.3350061-1-daniel.vetter@ffwll.ch>
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
Cc: Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 11, 2020 at 05:11:12PM +0100, Daniel Vetter wrote:
> There's a confusion between the preferred_depth uapi and the generic
> fbdev helpers. Former wants depth, latter wants bpp, and for XRGB8888
> they don't match. Which hit me with vkms, which wants that.
> =

> All other drivers setting this and using the generic fbdev helpers use
> 16, where both numbers match, for RGB565.
> =

> Since fixing this is a bit involved (I think for atomic drivers we
> should just compute this all internally from the format list of the
> first primary plane) paper over the issue in vkms by using defaults
> everywhere. Then userspace will pick XRGB8888, and fbdev helpers will
> do the same, and we have what we want.

I think I had a patch ages ago that tried to improve the fb_helper
pixel format stuff a bit. This one I think:
https://patchwork.freedesktop.org/patch/203189/

Haven't checked how much of that would still be relevant though.

> =

> Reported-by: Simon Ser <contact@emersion.fr>
> Reviewed-by: Simon Ser <contact@emersion.fr>
> Cc: Simon Ser <contact@emersion.fr>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> Cc: Melissa Wen <melissa.srw@gmail.com>
> Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  drivers/gpu/drm/vkms/vkms_drv.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> =

> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_=
drv.c
> index d4d39227f2ed..aef29393b811 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -113,7 +113,10 @@ static int vkms_modeset_init(struct vkms_device *vkm=
sdev)
>  	dev->mode_config.max_height =3D YRES_MAX;
>  	dev->mode_config.cursor_width =3D 512;
>  	dev->mode_config.cursor_height =3D 512;
> -	dev->mode_config.preferred_depth =3D 32;
> +	/* FIXME: There's a confusion between bpp and depth between this and
> +	 * fbdev helpers. We have to go with 0, meaning "pick the default",
> +	 * which ix XRGB8888 in all cases. */
> +	dev->mode_config.preferred_depth =3D 0;
>  	dev->mode_config.helper_private =3D &vkms_mode_config_helpers;
>  =

>  	return vkms_output_init(vkmsdev, 0);
> -- =

> 2.29.2
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
