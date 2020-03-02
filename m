Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A63E217712B
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 09:25:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C175B6EA35;
	Tue,  3 Mar 2020 08:24:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EFE76E81F
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 20:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1583180025; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b/ff2aDf9v2GEyVwlT7fBrb+9IkYeVPe7z8fqf2ruvI=;
 b=R6JL9INYvN6TsMXpqOhE4I75ea19IF8vPVLrZK9wPLbdYNczK5ez7OvGeBAnt++cyV5SZk
 CWYpy9SyzU+JPLkT+CU20GU5DkFtu9fonoOl6Boi/Mj08gp4r7RqrBolD58c3F3aSc0De/
 JROf1Gcm1JrDK/9HW+Yb29VLuuu4qjM=
Date: Mon, 02 Mar 2020 17:13:31 -0300
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 31/51] drm/ingenic: Drop explicit drm_mode_config_cleanup
 call
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Message-Id: <1583180011.3.8@crapouillou.net>
In-Reply-To: <20200227181522.2711142-32-daniel.vetter@ffwll.ch>
References: <20200227181522.2711142-1-daniel.vetter@ffwll.ch>
 <20200227181522.2711142-32-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 03 Mar 2020 08:24:06 +0000
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 m.felsch@pengutronix.de, DRI Development <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,


Le jeu., f=E9vr. 27, 2020 at 19:15, Daniel Vetter =

<daniel.vetter@ffwll.ch> a =E9crit :
> Allows us to drop the drm_driver.release callback.
> =

> This is made possible by a preceeding patch which added a drmm_
> cleanup action to drm_mode_config_init(), hence all we need to do to
> ensure that drm_mode_config_cleanup() is run on final drm_device
> cleanup is check the new error code for _init().
> =

> v2: Explain why this cleanup is possible (Laurent).
> =

> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Paul Cercueil <paul@crapouillou.net>

Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
>  drivers/gpu/drm/ingenic/ingenic-drm.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> =

> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.c =

> b/drivers/gpu/drm/ingenic/ingenic-drm.c
> index 192aaa4421a3..f5689521428e 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm.c
> @@ -489,11 +489,6 @@ static irqreturn_t ingenic_drm_irq_handler(int =

> irq, void *arg)
>  	return IRQ_HANDLED;
>  }
> =

> -static void ingenic_drm_release(struct drm_device *drm)
> -{
> -	drm_mode_config_cleanup(drm);
> -}
> -
>  static int ingenic_drm_enable_vblank(struct drm_crtc *crtc)
>  {
>  	struct ingenic_drm *priv =3D drm_crtc_get_priv(crtc);
> @@ -537,7 +532,6 @@ static struct drm_driver ingenic_drm_driver_data =

> =3D {
>  	.gem_prime_mmap		=3D drm_gem_cma_prime_mmap,
> =

>  	.irq_handler		=3D ingenic_drm_irq_handler,
> -	.release		=3D ingenic_drm_release,
>  };
> =

>  static const struct drm_plane_funcs ingenic_drm_primary_plane_funcs =

> =3D {
> @@ -638,7 +632,10 @@ static int ingenic_drm_probe(struct =

> platform_device *pdev)
>  	}
>  	drmm_add_final_kfree(drm, priv);
> =

> -	drm_mode_config_init(drm);
> +	ret =3D drm_mode_config_init(drm);
> +	if (ret)
> +		return ret;
> +
>  	drm->mode_config.min_width =3D 0;
>  	drm->mode_config.min_height =3D 0;
>  	drm->mode_config.max_width =3D soc_info->max_width;
> --
> 2.24.1
> =



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
