Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C66DA22892
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 06:32:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7647910E24C;
	Thu, 30 Jan 2025 05:32:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="LlkoPShM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95BCD10E24C
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 05:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=codeconstruct.com.au; s=2022a; t=1738215126;
 bh=gFQ7g+YN21EUHYN7l+aFFtAggeW26EdwSPTQBPw5JIA=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=LlkoPShMIY3IbkAOzb1KgLzgG8YOLulzUiA6dqoqMW35xYM1vY4FUxuyCclGILpYC
 IJdPkr0eO2aU1S4RZJ82yPuiFDJg5q2lE1bfAyD+54vhNauy/40V0JqAiOYMuAxYT/
 Q2k+tCOwgqrz3bJvt6XPO1WtELw104gr2JBqDUcfgndWOAnOkSOG1gA3spVGBKw2X1
 9aURVXj532gT/Q8Joss7WwNumv9lyGY6e597x3LGlGCDJpIVT4x8a5TyuK54JK0ELB
 enXAG4EEYPp5fOHwx2er0mYGSdpYRP37/eC5/pGcc86wWKG0w6xtA6DqfWNlWyjDAC
 nRayZo2kLifTw==
Received: from [192.168.68.112] (58-7-158-64.dyn.iinet.net.au [58.7.158.64])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 2E8DC73836;
 Thu, 30 Jan 2025 13:32:02 +0800 (AWST)
Message-ID: <daa6bcaf1e612f667c5d5d26b9d515f43985b595.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2] drm/aspeed: Use
 devm_platform_get_and_ioremap_resource()
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: oushixiong1025@163.com, Joel Stanley <joel@jms.id.au>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>, Shixiong Ou <oushixiong@kylinos.cn>
Date: Thu, 30 Jan 2025 16:02:00 +1030
In-Reply-To: <20250122030155.57802-1-oushixiong1025@163.com>
References: <20250122030155.57802-1-oushixiong1025@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2025-01-22 at 11:01 +0800, oushixiong1025@163.com wrote:
> From: Shixiong Ou <oushixiong@kylinos.cn>
>=20
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to
> devm_platform_get_and_ioremap_resource().
>=20
> Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
> ---
> V1 -> V2: Add Missing commit message.
>=20
> =C2=A0drivers/gpu/drm/aspeed/aspeed_gfx_drv.c | 3 +--
> =C2=A01 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> index a7a6b70220eb..33f81b53771d 100644
> --- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> +++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> @@ -146,8 +146,7 @@ static int aspeed_gfx_load(struct drm_device
> *drm)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct resource *res;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int ret;
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0res =3D platform_get_resource(=
pdev, IORESOURCE_MEM, 0);
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0priv->base =3D devm_ioremap_re=
source(drm->dev, res);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0priv->base =3D devm_platform_g=
et_and_ioremap_resource(pdev, 0,
> &res);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (IS_ERR(priv->base))
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return PTR_ERR(priv->base);
> =C2=A0

I think I prefer this one:

https://lore.kernel.org/all/20250128-cocci-memory-api-v1-1-0d1609a29587@red=
hat.com/

Andrew
