Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC61B336A2
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 08:45:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0BBF10E343;
	Mon, 25 Aug 2025 06:45:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="By0bgJe0";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="sfw4f0GH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DEBD10E343
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 06:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1756104321; x=1787640321;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w14T58dmJuNVXMguB61ithau+MDzr8NmKFE7YbjkVFI=;
 b=By0bgJe0Gd1J+8YsZRtuHDKoKzrXUkuoLZ5PImwkS65LLgBPKu71AN4x
 BAXfJAW4xuTfQDSC8u3B5VQz2mdKiby/aY9nA8kiFEm6w0zVej0n/LnU+
 h4BN7qb6dbydPYnGjcBwfFGNc/AKT2JvYvjCOFuSFdoAvliWnGg9y4hlH
 ezfyKX35gYRNwo3cnY8Oh7lNQ439DmRXZAnciCjRm6kIrpavmMjfT7zCq
 SrOuY4IJ6iaN6onURtr0yFdwt0WgzoThyJJZx1yZ7mpKU1fM36b8xib+5
 u0CYWKl6AXsTuu9/qf71tezF4BvjWDRGVytYXAiLmPJ+9xzKNmuONmlsE Q==;
X-CSE-ConnectionGUID: zPl1VvF3QbWDnEldToc0KA==
X-CSE-MsgGUID: jSGX+Ye9RsO8KI0LyWrw/Q==
X-IronPort-AV: E=Sophos;i="6.17,312,1747692000"; d="scan'208";a="45885019"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 25 Aug 2025 08:45:17 +0200
X-CheckPoint: {68AC067D-37-AD8F5F64-F0EACAA5}
X-MAIL-CPID: FDCF9C2444F205DBF823452246599193_1
X-Control-Analysis: str=0001.0A002105.68AC067F.0078, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 99E4D16626E; Mon, 25 Aug 2025 08:45:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1756104313;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=w14T58dmJuNVXMguB61ithau+MDzr8NmKFE7YbjkVFI=;
 b=sfw4f0GHkf4ifl0CpAfePvYuDpaoLhFTxn+RsEkSR6dxDx5HOqkibvhaQLjEGXOr/hxFXH
 A5zAt9AQav3vJW/auJThCKjj2mAxQPrK+V081dnTI0uTfdc5Ca8u8FMkbhlT5dNpvR9n8b
 wAZGOTYCZEEUAGF9B7Okrsw9vYNQeBKGOX9b+s1d0GYWXvsOrsj8hPr75AuPngv1bF7cAi
 r1Rs66xneE2oJlqdQ0oLJDLVV6G8h93Ny0W+QxnVX28Vc9E2DGXpdOXYxBS8XyG0FwoHLU
 k3/UJSmMvPq98AnNnC8raKpGaw2/bxUQ5TcYj20edpGwfiXOyWNe0wXnPRn9pA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] drm: lcdif: Use dev_err_probe()
Date: Mon, 25 Aug 2025 08:45:10 +0200
Message-ID: <4679558.LvFx2qVVIh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250429100919.1180404-1-alexander.stein@ew.tq-group.com>
References: <20250429100919.1180404-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
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

Hi,

Am Dienstag, 29. April 2025, 12:09:18 CEST schrieb Alexander Stein:
> Use dev_err_probe() to add a reason for deferred probe. This can
> especially happen on lcdif3 which uses hdmi_tx_phy for 'pix' clock
>=20
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Gentle ping? Anyone picking this up? Or is there any other feedback?

Thanks and best regards
Alexander

> ---
>  drivers/gpu/drm/mxsfb/lcdif_drv.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lc=
dif_drv.c
> index d5996efaf34bb..99e632d4a0e9b 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
> @@ -164,15 +164,17 @@ static int lcdif_load(struct drm_device *drm)
> =20
>  	lcdif->clk =3D devm_clk_get(drm->dev, "pix");
>  	if (IS_ERR(lcdif->clk))
> -		return PTR_ERR(lcdif->clk);
> +		return dev_err_probe(drm->dev, PTR_ERR(lcdif->clk), "Failed to get pix=
 clock\n");
> =20
>  	lcdif->clk_axi =3D devm_clk_get(drm->dev, "axi");
>  	if (IS_ERR(lcdif->clk_axi))
> -		return PTR_ERR(lcdif->clk_axi);
> +		return dev_err_probe(drm->dev, PTR_ERR(lcdif->clk_axi),
> +				     "Failed to get axi clock\n");
> =20
>  	lcdif->clk_disp_axi =3D devm_clk_get(drm->dev, "disp_axi");
>  	if (IS_ERR(lcdif->clk_disp_axi))
> -		return PTR_ERR(lcdif->clk_disp_axi);
> +		return dev_err_probe(drm->dev, PTR_ERR(lcdif->clk_disp_axi),
> +				     "Failed to get disp_axi clock\n");
> =20
>  	platform_set_drvdata(pdev, drm);
> =20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


