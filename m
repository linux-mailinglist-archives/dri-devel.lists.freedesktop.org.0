Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6F835C8D0
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 16:32:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8D306E5C8;
	Mon, 12 Apr 2021 14:32:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5262A6E5C8
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 14:32:46 +0000 (UTC)
Date: Mon, 12 Apr 2021 15:32:27 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 2/2] drm/ingenic: Don't request full modeset if property
 is not modified
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Simon Ser
 <contact@emersion.fr>
Message-Id: <3EGGRQ.5XC2ZJHIFWID@crapouillou.net>
In-Reply-To: <20210329175046.214629-3-paul@crapouillou.net>
References: <20210329175046.214629-1-paul@crapouillou.net>
 <20210329175046.214629-3-paul@crapouillou.net>
MIME-Version: 1.0
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
Cc: linux-mips@vger.kernel.org, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, od@zcrc.me, dri-devel@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Can I have an ACK for this patch?

Cheers,
-Paul

Le lun. 29 mars 2021 =E0 18:50, Paul Cercueil <paul@crapouillou.net> a =

=E9crit :
> Avoid requesting a full modeset if the sharpness property is not
> modified, because then we don't actually need it.
> =

> Fixes: fc1acf317b01 ("drm/ingenic: Add support for the IPU")
> Cc: <stable@vger.kernel.org> # 5.8+
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/gpu/drm/ingenic/ingenic-ipu.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> =

> diff --git a/drivers/gpu/drm/ingenic/ingenic-ipu.c =

> b/drivers/gpu/drm/ingenic/ingenic-ipu.c
> index 3b1091e7c0cd..95b665c4a7b0 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-ipu.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-ipu.c
> @@ -640,10 +640,12 @@ ingenic_ipu_plane_atomic_set_property(struct =

> drm_plane *plane,
>  {
>  	struct ingenic_ipu *ipu =3D plane_to_ingenic_ipu(plane);
>  	struct drm_crtc_state *crtc_state;
> +	bool mode_changed;
> =

>  	if (property !=3D ipu->sharpness_prop)
>  		return -EINVAL;
> =

> +	mode_changed =3D val !=3D ipu->sharpness;
>  	ipu->sharpness =3D val;
> =

>  	if (state->crtc) {
> @@ -651,7 +653,7 @@ ingenic_ipu_plane_atomic_set_property(struct =

> drm_plane *plane,
>  		if (WARN_ON(!crtc_state))
>  			return -EINVAL;
> =

> -		crtc_state->mode_changed =3D true;
> +		crtc_state->mode_changed |=3D mode_changed;
>  	}
> =

>  	return 0;
> --
> 2.30.2
> =



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
