Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C51265532A4
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 14:58:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E572D112595;
	Tue, 21 Jun 2022 12:58:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A129112595
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 12:58:35 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6800B104;
 Tue, 21 Jun 2022 14:58:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1655816312;
 bh=QeBzIO+U3oKdldlfZMcuLeVK7EiSrArkPksFp8cBSkM=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=OO5/5+9Yhc4qSTux6Py6LT4Iy9hqrC9FAcbdk89g+PfRJ9mfNx/9LXQfiVqPfMl6B
 l/HtiR7/BVJjXnB3PuCTdJ9rho2pL2COKVqdaXTmuizWOt9m7IN1wjsDio7LVg3ePB
 sCpnfC6Tove2EPl7XyJUAFnmnCL1okn8xaSvBPgs=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220616170821.1348169-1-steve@sk2.org>
References: <20220616170821.1348169-1-steve@sk2.org>
Subject: Re: [PATCH v2] drm: shmobile: Use backlight helper
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Stephen Kitt <steve@sk2.org>
Date: Tue, 21 Jun 2022 13:58:29 +0100
Message-ID: <165581630958.18145.12909267841116831017@Monstersaurus>
User-Agent: alot/0.10
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
Cc: Stephen Kitt <steve@sk2.org>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Stephen Kitt (2022-06-16 18:08:21)
> This started with work on the removal of backlight_properties'
> deprecated fb_blank field, much of which can be taken care of by using
> helper functions provided by backlight.h instead of directly accessing
> fields in backlight_properties. This patch series doesn't involve
> fb_blank, but it still seems useful to use helper functions where
> appropriate.
>=20
> Instead of retrieving the backlight brightness in struct
> backlight_properties manually, and then checking whether the backlight
> should be on at all, use backlight_get_brightness() which does all
> this and insulates this from future changes.
>=20
> Signed-off-by: Stephen Kitt <steve@sk2.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


Hi Stephen,

This looks reasonable to me too.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> ---
> Changes since v1: clarified commit message, this doesn't touch fb_blank
> ---
>  drivers/gpu/drm/shmobile/shmob_drm_backlight.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/shmobile/shmob_drm_backlight.c b/drivers/gpu=
/drm/shmobile/shmob_drm_backlight.c
> index f6628a5ee95f..794573badfe8 100644
> --- a/drivers/gpu/drm/shmobile/shmob_drm_backlight.c
> +++ b/drivers/gpu/drm/shmobile/shmob_drm_backlight.c
> @@ -18,11 +18,7 @@ static int shmob_drm_backlight_update(struct backlight=
_device *bdev)
>         struct shmob_drm_connector *scon =3D bl_get_data(bdev);
>         struct shmob_drm_device *sdev =3D scon->connector.dev->dev_privat=
e;
>         const struct shmob_drm_backlight_data *bdata =3D &sdev->pdata->ba=
cklight;
> -       int brightness =3D bdev->props.brightness;
> -
> -       if (bdev->props.power !=3D FB_BLANK_UNBLANK ||
> -           bdev->props.state & BL_CORE_SUSPENDED)
> -               brightness =3D 0;
> +       int brightness =3D backlight_get_brightness(bdev);
> =20
>         return bdata->set_brightness(brightness);
>  }
>=20
> base-commit: f2906aa863381afb0015a9eb7fefad885d4e5a56
> --=20
> 2.30.2
>
