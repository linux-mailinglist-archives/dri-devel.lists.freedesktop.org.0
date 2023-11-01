Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B647DE27E
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 15:56:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4864510E71E;
	Wed,  1 Nov 2023 14:56:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCBAB10E71E
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Nov 2023 14:56:52 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id CF44D8D;
 Wed,  1 Nov 2023 15:56:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1698850595;
 bh=5XFw4kIPXXZ2DwgwHP3vUbhDMgLtjcVtiOsJfOvp0J8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b7mPDl0zzBSqxli5xbl7IZiKaJCRg3QqU6qWhsHDKBU+MY5OBLYRSWD/aKjU9Ki88
 PaP01nmHfBQ/1CdNHzbejaKyEBDuR2Ey+js+tiyYGowNsSbEzu8NTB2PoIKcSNjqgW
 ObZlTG/XgMSzADCVuknTSnvYAq1oWWeI5/4ydigU=
Date: Wed, 1 Nov 2023 16:56:58 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH 10/10] drm/tidss: Fix atomic_flush check
Message-ID: <20231101145658.GZ12764@pendragon.ideasonboard.com>
References: <20231101-tidss-probe-v1-0-45149e0f9415@ideasonboard.com>
 <20231101-tidss-probe-v1-10-45149e0f9415@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231101-tidss-probe-v1-10-45149e0f9415@ideasonboard.com>
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
Cc: Aradhya Bhatia <a-bhatia1@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Jyri Sarha <jyri.sarha@iki.fi>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Thank you for the patch.

On Wed, Nov 01, 2023 at 11:17:47AM +0200, Tomi Valkeinen wrote:
> tidss_crtc_atomic_flush() checks if the crtc is enabled, and if not,
> returns immediately as there's no reason to do any register changes.
> 
> However, the code checks for 'crtc->state->enable', which does not
> reflect the actual HW state. We should instead look at the
> 'crtc->state->active' flag.
> 
> This causes the tidss_crtc_atomic_flush() to proceed with the flush even
> if the active state is false, which then causes us to hit the
> WARN_ON(!crtc->state->event) check.
> 
> Fix this by checking the active flag, and while at it, fix the related
> debug print which had "active" and "needs modeset" wrong way.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/tidss/tidss_crtc.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_crtc.c b/drivers/gpu/drm/tidss/tidss_crtc.c
> index 5e5e466f35d1..4c7009a5d643 100644
> --- a/drivers/gpu/drm/tidss/tidss_crtc.c
> +++ b/drivers/gpu/drm/tidss/tidss_crtc.c
> @@ -169,13 +169,12 @@ static void tidss_crtc_atomic_flush(struct drm_crtc *crtc,
>  	struct tidss_device *tidss = to_tidss(ddev);
>  	unsigned long flags;
>  
> -	dev_dbg(ddev->dev,
> -		"%s: %s enabled %d, needs modeset %d, event %p\n", __func__,
> -		crtc->name, drm_atomic_crtc_needs_modeset(crtc->state),
> -		crtc->state->enable, crtc->state->event);
> +	dev_dbg(ddev->dev, "%s: %s active %d, needs modeset %d, event %p\n",
> +		__func__, crtc->name, crtc->state->active,
> +		drm_atomic_crtc_needs_modeset(crtc->state), crtc->state->event);

While at it, how about this ?

	dev_dbg(ddev->dev, "%s: %s is %sactive, %s modeset, event %p\n",
		__func__, crtc->name, crtc->state->active ? "" : "not ",
		drm_atomic_crtc_needs_modeset(crtc->state) ? "needs", "doesn't need",
		crtc->state->event);

>  
>  	/* There is nothing to do if CRTC is not going to be enabled. */
> -	if (!crtc->state->enable)
> +	if (!crtc->state->active)

I think the drm_atomic_helper_commit_planes() helper will handle this if
you pass it the DRM_PLANE_COMMIT_ACTIVE_ONLY flag.

>  		return;
>  
>  	/*

-- 
Regards,

Laurent Pinchart
