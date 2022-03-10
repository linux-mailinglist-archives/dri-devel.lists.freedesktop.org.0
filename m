Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 031544D4996
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 15:50:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFA9310E80D;
	Thu, 10 Mar 2022 14:50:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39E1F10E80D
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 14:50:31 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nSK7V-0004bE-W9; Thu, 10 Mar 2022 15:50:26 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Colin Ian King <colin.i.king@gmail.com>,
 Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH] drm/rockchip: remove redundant assignment to pointer
 connector
Date: Thu, 10 Mar 2022 15:50:25 +0100
Message-ID: <4453075.DPozGzHrQt@diego>
In-Reply-To: <CAKwvOdkXNGRJkZDd7Cg8jhL9Ex7R+VPYqEEc+VpwDyi9NJKXQQ@mail.gmail.com>
References: <20220307181704.149076-1-colin.i.king@gmail.com>
 <CAKwvOdkXNGRJkZDd7Cg8jhL9Ex7R+VPYqEEc+VpwDyi9NJKXQQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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
Cc: knaerzche@gmail.com, David Airlie <airlied@linux.ie>, llvm@lists.linux.dev,
 kernel-janitors@vger.kernel.org, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

looks like I wasn't in the original recipient list, so only got Nick's
answer.

Am Mittwoch, 9. M=E4rz 2022, 00:10:31 CET schrieb Nick Desaulniers:
> On Mon, Mar 7, 2022 at 10:17 AM Colin Ian King <colin.i.king@gmail.com> w=
rote:
> >
> > The pointer connector is being assigned a value that is never read,
> > it is being re-assigned in the following statement. The assignment
> > is redundant and can be removed.
> >
> > Cleans up clang scan build warning:
> > drivers/gpu/drm/rockchip/rockchip_rgb.c:153:2: warning: Value stored
> > to 'connector' is never read [deadcode.DeadStores]
>=20
> + Author & reviewer of:
> Fixes: 2e87bf389e13 ("drm/rockchip: add DRM_BRIDGE_ATTACH_NO_CONNECTOR
> flag to drm_bridge_attach")
>=20
> >
> > Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> > ---
> >  drivers/gpu/drm/rockchip/rockchip_rgb.c | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/rockchip/rockchip_rgb.c b/drivers/gpu/drm/=
rockchip/rockchip_rgb.c
> > index 2494b079489d..92a727931a49 100644
> > --- a/drivers/gpu/drm/rockchip/rockchip_rgb.c
> > +++ b/drivers/gpu/drm/rockchip/rockchip_rgb.c
> > @@ -150,7 +150,6 @@ struct rockchip_rgb *rockchip_rgb_init(struct devic=
e *dev,
> >         if (ret)
> >                 goto err_free_encoder;
> >
> > -       connector =3D &rgb->connector;
> >         connector =3D drm_bridge_connector_init(rgb->drm_dev, encoder);

I don't think this will work as expected.

Yes, the whole thing looks a bit broken right now, but the connector
field in the rockchip_rgb struct still exists and rockchip_rgb_fini also
still uses it when calling drm_connector_cleanup.

Same issue seems to exist in in rockchip_lvds.c with drm_connector_cleanup
it seems.

I guess drm_bridge_connector_destroy() is responsible for the cleanup so
the drm_connector_cleanup call both in rockchip_rgb and rockchip_lvds
as well as the local connector elements can go away as well?


Heiko


> >         if (IS_ERR(connector)) {
> >                 DRM_DEV_ERROR(drm_dev->dev,
> > --
> > 2.35.1
> >
> >
>=20
>=20
>=20




