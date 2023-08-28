Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7667F78B0F7
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 14:49:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 978F510E2C8;
	Mon, 28 Aug 2023 12:49:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6603A10E2C8
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 12:49:35 +0000 (UTC)
Received: from hamburger.collabora.co.uk (hamburger.collabora.co.uk
 [IPv6:2a01:4f8:1c1c:f269::1])
 by madras.collabora.co.uk (Postfix) with ESMTP id 275B06606F65;
 Mon, 28 Aug 2023 13:49:32 +0100 (BST)
From: "Helen Mae Koike Fornazier" <helen.koike@collabora.com>
In-Reply-To: <20230826071901.29420-3-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="utf-8"
X-Forward: 127.0.0.1
Date: Mon, 28 Aug 2023 13:49:31 +0100
To: "Biju Das" <biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Message-ID: <31ff-64ec9800-1-66482280@42123241>
Subject: =?utf-8?q?Re=3A?= [PATCH v4 2/2] =?utf-8?q?drm/bridge=3A?= Drop 
 conditionals around =?utf-8?q?of=5Fnode?= pointers
User-Agent: SOGoMail 5.8.4
Content-Transfer-Encoding: quoted-printable
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Zhu Wang <wangzhu9@huawei.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Jonas Karlman <jonas@kwiboo.se>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Douglas Anderson <dianders@chromium.org>, Maxime Ripard <mripard@kernel.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello!

Thanks for the patch.

On Saturday, August 26, 2023 04:19 -03, Biju Das <biju.das.jz@bp.renesa=
s.com> wrote:

> Having conditional around the of=5Fnode pointers turns out to make dr=
iver
> code use ugly #ifdef and #if blocks. So drop the conditionals.

It would be nice to explain why those ifdev/if conditionals are
not required anymore (besides the cosmetic part).

Regards,
Helen

>=20
> Suggested-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v4:
>  * New patch
> ---
>  drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c | 2 --
>  include/drm/drm=5Fbridge.h                           | 2 --
>  2 files changed, 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c b/dri=
vers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> index 6169db73d2fe..ad8241758896 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> @@ -1231,9 +1231,7 @@ static int anx78xx=5Fi2c=5Fprobe(struct i2c=5Fc=
lient *client)
> =20
>  	mutex=5Finit(&anx78xx->lock);
> =20
> -#if IS=5FENABLED(CONFIG=5FOF)
>  	anx78xx->bridge.of=5Fnode =3D client->dev.of=5Fnode;
> -#endif
> =20
>  	anx78xx->client =3D client;
>  	i2c=5Fset=5Fclientdata(client, anx78xx);
> diff --git a/include/drm/drm=5Fbridge.h b/include/drm/drm=5Fbridge.h
> index c339fc85fd07..d49d5c03df3e 100644
> --- a/include/drm/drm=5Fbridge.h
> +++ b/include/drm/drm=5Fbridge.h
> @@ -716,10 +716,8 @@ struct drm=5Fbridge {
>  	struct drm=5Fencoder *encoder;
>  	/** @chain=5Fnode: used to form a bridge chain */
>  	struct list=5Fhead chain=5Fnode;
> -#ifdef CONFIG=5FOF
>  	/** @of=5Fnode: device node pointer to the bridge */
>  	struct device=5Fnode *of=5Fnode;
> -#endif
>  	/** @list: to keep track of all added bridges */
>  	struct list=5Fhead list;
>  	/**
> --=20
> 2.25.1
>

