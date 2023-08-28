Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6001A78B48B
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 17:35:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8D4610E302;
	Mon, 28 Aug 2023 15:35:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C82B010E302
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 15:35:39 +0000 (UTC)
Received: from hamburger.collabora.co.uk (hamburger.collabora.co.uk
 [IPv6:2a01:4f8:1c1c:f269::1])
 by madras.collabora.co.uk (Postfix) with ESMTP id 033C0660716E;
 Mon, 28 Aug 2023 16:35:36 +0100 (BST)
From: "Helen Mae Koike Fornazier" <helen.koike@collabora.com>
In-Reply-To: <20230825-it66121_edid-v1-1-3ab54923e472@ti.com>
Content-Type: text/plain; charset="utf-8"
X-Forward: 127.0.0.1
Date: Mon, 28 Aug 2023 16:35:36 +0100
To: "Jai Luthra" <j-luthra@ti.com>
MIME-Version: 1.0
Message-ID: <6fd4-64ecbf00-7-213b7840@157890373>
Subject: =?utf-8?q?Re=3A?= [PATCH] =?utf-8?q?drm=3A?==?utf-8?q?_bridge=3A?=
 =?utf-8?q?_it66121=3A?= Fix invalid connector dereference
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
Cc: nm@ti.com, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Aradhya Bhatia <a-bhatia1@ti.com>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Phong LE <ple@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, devarsht@ti.com,
 Nicolas Belin <nbelin@baylibre.com>,
 =?utf-8?q?Andy=2EHsieh?= <Andy.Hsieh@mediatek.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Friday, August 25, 2023 08:02 -03, Jai Luthra <j-luthra@ti.com> wrot=
e:

> Fix the NULL pointer dereference when no monitor is connected, and th=
e
> sound card is opened from userspace.
>=20
> Instead return an error as EDID information cannot be provided to
> the sound framework if there is no connector attached.
>=20
> Fixes: e0fd83dbe924 ("drm: bridge: it66121: Add audio support")
> Reported-by: Nishanth Menon <nm@ti.com>
> Closes: https://lore.kernel.org/all/20230825105849.crhon42qndxqif4i@g=
ondola/
> Signed-off-by: Jai Luthra <j-luthra@ti.com>

Reviewed-by: Helen Koike <helen.koike@collabora.com>

> ---
>  drivers/gpu/drm/bridge/ite-it66121.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/b=
ridge/ite-it66121.c
> index 466641c77fe9..d6fa00dea464 100644
> --- a/drivers/gpu/drm/bridge/ite-it66121.c
> +++ b/drivers/gpu/drm/bridge/ite-it66121.c
> @@ -1446,6 +1446,11 @@ static int it66121=5Faudio=5Fget=5Feld(struct =
device *dev, void *data,
>  {
>  	struct it66121=5Fctx *ctx =3D dev=5Fget=5Fdrvdata(dev);
> =20
> +	if (!ctx->connector) {
> +		dev=5Fdbg(dev, "No connector present, cannot provide EDID data");
> +		return -EINVAL;
> +	}
> +
>  	mutex=5Flock(&ctx->lock);
> =20
>  	memcpy(buf, ctx->connector->eld,
>=20
> ---
> base-commit: 6269320850097903b30be8f07a5c61d9f7592393
> change-id: 20230825-it66121=5Fedid-6ee98517808b
>=20
> Best regards,
> --=20
> Jai Luthra <j-luthra@ti.com>
>

