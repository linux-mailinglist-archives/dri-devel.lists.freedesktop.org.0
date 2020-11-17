Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 451742B69F1
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 17:22:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 456816E044;
	Tue, 17 Nov 2020 16:22:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D1236E044
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 16:22:14 +0000 (UTC)
IronPort-SDR: rdX5hwoKmZKw7hUcVOi2jhmq6fUjNvzoRz+9AwPY1R4/aOzYr2Rsc0bZzorZ42isowidyHJBUh
 IJ7YHD/4HzQA==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="255669059"
X-IronPort-AV: E=Sophos;i="5.77,485,1596524400"; d="scan'208";a="255669059"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2020 08:22:12 -0800
IronPort-SDR: CoGzXPEVNbKmnYjIVbZO9kezAllEJyz0IDtWk8i0pxuD6cgse6FPzRuCUZYsNgnXmjHipt4DZj
 c/reFg8COcNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,485,1596524400"; d="scan'208";a="367935190"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 17 Nov 2020 08:22:07 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 17 Nov 2020 18:22:06 +0200
Date: Tue, 17 Nov 2020 18:22:06 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 01/10] drm/fb-helper: Call dirty helper after writing to
 fbdev
Message-ID: <20201117162206.GF6112@intel.com>
References: <20201116200437.17977-1-tzimmermann@suse.de>
 <20201116200437.17977-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201116200437.17977-2-tzimmermann@suse.de>
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
Cc: airlied@linux.ie, Daniel Vetter <daniel.vetter@ffwll.ch>,
 virtualization@lists.linux-foundation.org, dri-devel@lists.freedesktop.org,
 sam@ravnborg.org, christian.koenig@amd.com, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 16, 2020 at 09:04:28PM +0100, Thomas Zimmermann wrote:
> If fbdev uses a shadow framebuffer, call the damage handler. Otherwise
> the update might not make it to the screen.
> =

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 222ec45f4c69 ("drm/fb_helper: Support framebuffers in I/O memory")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: virtualization@lists.linux-foundation.org
> ---
>  drivers/gpu/drm/drm_fb_helper.c | 3 +++
>  1 file changed, 3 insertions(+)
> =

> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_hel=
per.c
> index 25edf670867c..ee1a19e22df2 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -2189,6 +2189,9 @@ static ssize_t drm_fbdev_fb_write(struct fb_info *i=
nfo, const char __user *buf,
>  	if (ret > 0)
>  		*ppos +=3D ret;
>  =

> +	if (ret > 0)
> +		drm_fb_helper_dirty(info, 0, 0, info->var.xres, info->var.yres);

Should that rather be 0->{x,y}res_virtual or {x,y}offset->{x,y}res?

> +
>  	return ret ? ret : err;
>  }
>  =

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
