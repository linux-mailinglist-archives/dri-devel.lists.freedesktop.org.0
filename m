Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8D31A302F
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 09:34:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB2AE6EB75;
	Thu,  9 Apr 2020 07:33:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3449C6E0A6
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 09:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1586339518; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IQzclyuBGPes56NpSwBGhrVH6MMCe3VetYkAXSQBNG8=;
 b=ELHwDl0kyArSfk3beIp7b3ZqYSeJ0IgOiRbei11KJTTFvQZwRQZn9Jm/8uRpOHL23Yuqyq
 Lb+YgbnyUqesw2fqyk2k03PKdMWdSMysRF3rZUQE/FK/PZs6m5p4dh3rn4UOk5kOeL6MIr
 WDZagi7EtMEU8WC28520+yNcD+dZkyw=
Date: Wed, 08 Apr 2020 11:51:47 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 1/3] gpu/drm: ingenic: Add trick to support 16bpp on
 24-bit panels
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>
Message-Id: <BERG8Q.6W7J6M63PE2V2@crapouillou.net>
In-Reply-To: <20200226043041.289764-1-paul@crapouillou.net>
References: <20200226043041.289764-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 09 Apr 2020 07:33:24 +0000
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
Cc: od@zcrc.me, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Any feedback for this patchset?

Thanks,
-Paul


Le mer. 26 f=E9vr. 2020 =E0 1:30, Paul Cercueil <paul@crapouillou.net> a =

=E9crit :
> If the panel interface is 24-bit but our primary plane is 16bpp,
> configure as if the panel was 18-bit. This tricks permits the display
> of 16bpp data on a 24-bit panel by wiring each color component to the
> MSBs of the 24-bit interface.
> =

> v2: Check bytes-per-pixel count instead of fourcc format
> =

> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/gpu/drm/ingenic/ingenic-drm.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> =

> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.c =

> b/drivers/gpu/drm/ingenic/ingenic-drm.c
> index 6d47ef7b148c..5493a80d7d2f 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm.c
> @@ -400,6 +400,8 @@ static void =

> ingenic_drm_encoder_atomic_mode_set(struct drm_encoder *encoder,
>  	struct drm_display_mode *mode =3D &crtc_state->adjusted_mode;
>  	struct drm_connector *conn =3D conn_state->connector;
>  	struct drm_display_info *info =3D &conn->display_info;
> +	struct drm_plane_state *plane_state =3D =

> crtc_state->crtc->primary->state;
> +	const struct drm_format_info *finfo =3D NULL;
>  	unsigned int cfg;
> =

>  	priv->panel_is_sharp =3D info->bus_flags & DRM_BUS_FLAG_SHARP_SIGNALS;
> @@ -435,7 +437,21 @@ static void =

> ingenic_drm_encoder_atomic_mode_set(struct drm_encoder *encoder,
>  				cfg |=3D JZ_LCD_CFG_MODE_GENERIC_18BIT;
>  				break;
>  			case MEDIA_BUS_FMT_RGB888_1X24:
> -				cfg |=3D JZ_LCD_CFG_MODE_GENERIC_24BIT;
> +				if (plane_state && plane_state->fb)
> +					finfo =3D plane_state->fb->format;
> +
> +				/*
> +				 * If the panel interface is 24-bit but our
> +				 * primary plane is 16bpp, configure as if the
> +				 * panel was 18-bit. This tricks permits the
> +				 * display of 16bpp data on a 24-bit panel by
> +				 * wiring each color component to the MSBs of
> +				 * the 24-bit interface.
> +				 */
> +				if (finfo && finfo->cpp[0] < 3)
> +					cfg |=3D JZ_LCD_CFG_MODE_GENERIC_18BIT;
> +				else
> +					cfg |=3D JZ_LCD_CFG_MODE_GENERIC_24BIT;
>  				break;
>  			case MEDIA_BUS_FMT_RGB888_3X8:
>  				cfg |=3D JZ_LCD_CFG_MODE_8BIT_SERIAL;
> --
> 2.25.0
> =



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
