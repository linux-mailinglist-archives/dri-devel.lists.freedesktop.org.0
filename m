Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BA6C14A4A
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 13:34:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85F4E10E3C4;
	Tue, 28 Oct 2025 12:34:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="dTbDt706";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 358 seconds by postgrey-1.36 at gabe;
 Tue, 28 Oct 2025 12:34:03 UTC
Received: from mx-relay12-hz2.antispameurope.com
 (mx-relay12-hz2.antispameurope.com [83.246.65.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16F0610E3C4
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 12:34:02 +0000 (UTC)
ARC-Authentication-Results: i=1; mx-gate12-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6,
 headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=968rqhHVFcxnYfiQeYIAS+1AueuObuJtnvbjiS2I6xI=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1761654464;
 b=V5DmiSO8iOU7FdZu1ANUYMg/i7X7pAWygMMmKOFRG8AWMyEJrr3f+HwpOGX7bh+jqFy9Ah63
 d4pfx5P+UhteuD7jKzIT8OEuhPuS8Chzl1gFUv2zyxGHw2tYX8Qc/C474cdpB2mASmYEXvCG0BI
 Vqgk/vYA6BcI9pLKPswko23HFmbnnNw1Nv0yBIbOkOKQ7gRaB+eo7h4m6pqvIQ/0QF0g0HTL/eR
 bYkDnZN+XGsLv/EeQJ09TeZT45EWRZs4uzHeIpcfX6skbmwXghZSL5yHsvwSt9MJjIvuFoNN2Gl
 wxZ1FadorVVi+qyMY9enXklWjZwZzY7c5D/NEnK1qwZtg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1761654464;
 b=TwIl+zWMi5mqiwuU5JWfBtkujfKJSCnh+pSKGYuaEtdwzAHJnjN11VH6BpMmlXoAb6kyFiP/
 qn3w7R/GvmG9OCw6PC3jj4PpShEUWxhkFoN+YqpwC3dPIx5NqKlAzmsfXJDqADqxx+B+SLpVUve
 U80wuk4z2mGpwUHf4PACG5wMmYQ+c+TKbkm34cR+Hccr3Ai83lTMJYCUebUPPQoalJrglCvgiT4
 yQi9Z8CfSSLyiCglGutE9VrgJyHyKDAYcqUmW4dZInwsRibgVf/yzR1JiBQNfLZNe9tMRPOb9cw
 eFuTafmSYd+c/PStgJHAcveqMGOsf34QQ10mmvzdg8aWA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by
 mx-relay12-hz2.antispameurope.com; Tue, 28 Oct 2025 13:27:44 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net
 [82.135.125.110])
 (Authenticated sender: alexander.stein@ew.tq-group.com)
 by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 9D3DCA41044;
 Tue, 28 Oct 2025 13:27:37 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Liu Ying <victor.liu@nxp.com>, Marek Vasut <marex@denx.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Francesco Valla <francesco@valla.it>
Cc: Fabian Pflug <f.pflug@pengutronix.de>, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: ldb: add support for an external bridge
Date: Tue, 28 Oct 2025 13:27:37 +0100
Message-ID: <1944228.tdWV9SEqCh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20251028-imx93_ldb_bridge-v1-1-fca2e7d60e0a@valla.it>
References: <20251028-imx93_ldb_bridge-v1-1-fca2e7d60e0a@valla.it>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: dri-devel@lists.freedesktop.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for:
 alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on
 mx-relay12-hz2.antispameurope.com with 4cwqQL3mttz3BKkc
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1,
 IP=94.100.132.6
X-cloud-security-Digest: 672ff784a508aef985d73529930087ab
X-cloud-security: scantime:1.873
DKIM-Signature: a=rsa-sha256;
 bh=968rqhHVFcxnYfiQeYIAS+1AueuObuJtnvbjiS2I6xI=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1761654464; v=1;
 b=dTbDt706x4/fbdJ/N8aCCazuKUNrAUxWdYhAtCk8q5jtr6TwOVHsRuW50fBZGhHxDqSHFwJF
 hVY2jwruWm6loUI0xA75DTWIjNKBiAqo+lVHuE63Bcok7vBb/c0X5J9uHY+VzcWjKfrFhiLEEpG
 XxYyqlEeZUCjCK0nFvJeGIg+L4SCTy/uIxMBBh3KsXenxEfsedb+oV3RXOcxyHBkni18YfXIU6x
 y37MFal3sooJybOm80hWr6Dit1gwO+VyUeMHMHnmE3C3ADIpCC2iGAfp6yxUDlPUI1NG7sDOJ4p
 BGSPsTooI06PanSuuVuCHBHEqixKqclkBCkmb7Cpta9uA==
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

Hi Francesco,

Am Dienstag, 28. Oktober 2025, 13:12:29 CET schrieb Francesco Valla:
> One option for the LVDS port of the LDB is to be connected to an
> additional bridge, such as a LVDS to HDMI converter. Add support for
> such case, along with the direct connection to a panel.
>=20
> Signed-off-by: Francesco Valla <francesco@valla.it>
> ---
> I was trying to add display support for the i.MX93 FRDM on top of the
> patch sent some time ago by Fabian Pflug [1], using some of the work
> already done by Alexander Stein but not yet merged [2], but then I
> noticed that the support for LVDS-HDMI converter bridges was missing
> from the LDB driver already present for the i.MX93.
>=20
> Not a fail of the driver itself, obviously, but I wonder if/how the
> existing i.MX8MP setups (e.g.: [3]), which use the same driver, work
> correclty. Unfortunately I don't have the i.MX8MP hardware to test them.
>=20
> Anyhow, a patch for such setup is attached; it was tested on the i.MX93
> FRDM using [1] and [2] plus some more devicetree modifications.
>=20
> [1] https://lore.kernel.org/all/20251022-fpg-nxp-imx93-frdm-v3-1-03ec40a1=
ccc0@pengutronix.de
> [2] https://lore.kernel.org/all/20250304154929.1785200-1-alexander.stein@=
ew.tq-group.com
> [3] https://elixir.bootlin.com/linux/v6.17.5/source/arch/arm64/boot/dts/f=
reescale/imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtso
>=20
> Regards,
> Francesco
> ---
>  drivers/gpu/drm/bridge/fsl-ldb.c | 26 +++++++++++++++++---------
>  1 file changed, 17 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fs=
l-ldb.c
> index 5c3cf37200bcee1db285c97e2b463c9355ee6acb..fad436f2e0bfac8b42096a6fc=
d0022da0f35284e 100644
> --- a/drivers/gpu/drm/bridge/fsl-ldb.c
> +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
> @@ -294,7 +294,6 @@ static int fsl_ldb_probe(struct platform_device *pdev)
>  	struct device *dev =3D &pdev->dev;
>  	struct device_node *panel_node;
>  	struct device_node *remote1, *remote2;
> -	struct drm_panel *panel;
>  	struct fsl_ldb *fsl_ldb;
>  	int dual_link;
> =20
> @@ -335,15 +334,24 @@ static int fsl_ldb_probe(struct platform_device *pd=
ev)
>  		fsl_ldb_is_dual(fsl_ldb) ? "dual-link mode" :
>  		fsl_ldb->ch0_enabled ? "channel 0" : "channel 1");
> =20
> -	panel =3D of_drm_find_panel(panel_node);
> -	of_node_put(panel_node);
> -	if (IS_ERR(panel))
> -		return PTR_ERR(panel);
> -
> -	fsl_ldb->panel_bridge =3D devm_drm_panel_bridge_add(dev, panel);
> -	if (IS_ERR(fsl_ldb->panel_bridge))
> -		return PTR_ERR(fsl_ldb->panel_bridge);
> +	/* First try to get an additional bridge, if not found go for a panel */
> +	fsl_ldb->panel_bridge =3D of_drm_find_bridge(panel_node);
> +	if (fsl_ldb->panel_bridge) {
> +		of_node_put(panel_node);
> +	} else {
> +		struct drm_panel *panel;
> =20
> +		panel =3D of_drm_find_panel(panel_node);
> +		of_node_put(panel_node);
> +		if (IS_ERR(panel))
> +			return dev_err_probe(dev, PTR_ERR(panel),
> +					     "Failed to find panel");
> +
> +		fsl_ldb->panel_bridge =3D devm_drm_panel_bridge_add(dev, panel);
> +		if (IS_ERR(fsl_ldb->panel_bridge))
> +			return dev_err_probe(dev, PTR_ERR(fsl_ldb->panel_bridge),
> +					     "Failed to add panel bridge");
> +	}

Without looking into the details this somehow looks similar to
drm_of_find_panel_or_bridge(), or drmm_of_get_bridge for the managed varian=
t.

Best regards,
Alexander

> =20
>  	if (fsl_ldb_is_dual(fsl_ldb)) {
>  		struct device_node *port1, *port2;
>=20
> ---
> base-commit: fd57572253bc356330dbe5b233c2e1d8426c66fd
> change-id: 20251028-imx93_ldb_bridge-3c011e7856dc
>=20
> Best regards,
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


