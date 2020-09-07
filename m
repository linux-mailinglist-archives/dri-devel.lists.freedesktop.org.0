Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A9725FE7C
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 18:17:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D11DF6E4BB;
	Mon,  7 Sep 2020 16:17:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEB1C6E4BB
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 16:17:49 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 216E53E;
 Mon,  7 Sep 2020 18:17:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1599495457;
 bh=oUXDtmb/aWHYuEDGLK0yDkObyVcA366/VIqlbIpXLAU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=baX7fTKt2b1L58jlqgWnPkjrSCV4QUur25+tDNBEhpeS/yHIOAtaoMaP5TYK3iPOn
 tlKrBYyt6uPAAc7XB2q22S/1zK4pdAvWU214gn4lydYNPzdXM98PmEKykc0sQe24I4
 04Q289KjDUzKdloEpOiGT2uAfSno8ceF8330AaN0=
Date: Mon, 7 Sep 2020 19:17:12 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH] drm: mxsfb: check framebuffer pitch
Message-ID: <20200907161712.GF6047@pendragon.ideasonboard.com>
References: <20200907160343.124405-1-stefan@agner.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200907160343.124405-1-stefan@agner.ch>
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
Cc: marex@denx.de, airlied@linux.ie, s.hauer@pengutronix.de,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-imx@nxp.com, kernel@pengutronix.de, shawnguo@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stefan,

Thank you for the patch.

On Mon, Sep 07, 2020 at 06:03:43PM +0200, Stefan Agner wrote:
> The lcdif IP does not support a framebuffer pitch (stride) other than
> the CRTC width. Check for equality and reject the state otherwise.
> 
> This prevents a distorted picture when using 640x800 and running the
> Mesa graphics stack. Mesa tires to use a cache aligned stride, which

s/tires/tries/

> leads at that particular resolution to width != stride. Currently
> Mesa has no fallback behavior, but rejecting this configuration allows
> userspace to handle the issue correctly.

I'm increasingly impressed by how featureful this IP core is :-)

> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
>  drivers/gpu/drm/mxsfb/mxsfb_kms.c | 22 ++++++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> index b721b8b262ce..79aa14027f91 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> @@ -403,14 +403,28 @@ static int mxsfb_plane_atomic_check(struct drm_plane *plane,
>  {
>  	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(plane->dev);
>  	struct drm_crtc_state *crtc_state;
> +	unsigned int pitch;
> +	int ret;
>  
>  	crtc_state = drm_atomic_get_new_crtc_state(plane_state->state,
>  						   &mxsfb->crtc);
>  
> -	return drm_atomic_helper_check_plane_state(plane_state, crtc_state,
> -						   DRM_PLANE_HELPER_NO_SCALING,
> -						   DRM_PLANE_HELPER_NO_SCALING,
> -						   false, true);
> +	ret = drm_atomic_helper_check_plane_state(plane_state, crtc_state,
> +						  DRM_PLANE_HELPER_NO_SCALING,
> +						  DRM_PLANE_HELPER_NO_SCALING,
> +						  false, true);
> +	if (ret || !plane_state->visible)

Would it be more explict to check for !plane_state->fb ? Otherwise I'll
have to verify that !fb always implies !visible :-)

> +		return ret;
> +
> +	pitch = crtc_state->mode.hdisplay *
> +		plane_state->fb->format->cpp[0];

This holds on a single line.

> +	if (plane_state->fb->pitches[0] != pitch) {
> +		dev_err(plane->dev->dev,
> +			"Invalid pitch: fb and crtc widths must be the same");

I'd turn this into a dev_dbg(), printing error messages to the kernel
log in response to user-triggered conditions is a bit too verbose and
could flood the log.

Wouldn't it be best to catch this issue when creating the framebuffer ?

> +		return -EINVAL;
> +	}
> +
> +	return 0;
>  }
>  
>  static void mxsfb_plane_primary_atomic_update(struct drm_plane *plane,

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
