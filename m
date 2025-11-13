Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BE6C57018
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 11:53:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 438E610E164;
	Thu, 13 Nov 2025 10:53:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="UEz7F2dj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 318 seconds by postgrey-1.36 at gabe;
 Thu, 13 Nov 2025 10:53:03 UTC
Received: from mx-relay50-hz3.antispameurope.com
 (mx-relay50-hz3.antispameurope.com [94.100.134.239])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BA3810E164
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 10:53:03 +0000 (UTC)
ARC-Authentication-Results: i=1; mx-gate50-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6,
 headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=cPfvqiPK0XBbGB7jgxZcnmtoFkef5Esy2Ux2OKDfXoY=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1763030841;
 b=FuyFNugMm7iMYCdNt962yr6GQlT2ZiCpbw0YjXZZANErvbeZgmz4BCp2prJp2YRly67q6hrk
 1VZVMoE91tPPuOzEKzWplClmmZ9VkpIGxbILC2c3t5l3VrzN2V7F5uarremVfnj4Zp7XCpqwzvk
 PU1vmhy2+QoAyE3xM6G3XTuK58z4Hqg6DOy3tAp9lNPmiPJfYQLBNVcSfWJ0l1nHE0f4WWywYrr
 fTdOcnKtlROXSV51wJP+SuVR+r0ox+mnYWVNHuqFJJXlmEX4jWNiQyACWGGAky9czRWt5ezZSMA
 IUgifdIWi1R5rnpfO4UTGG73cULYGuCqVhrcIuu8utDlQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1763030841;
 b=s+7iTLf31XttzrmxCTRoZNWn6eu36K3RExO6qno16RTEVJ3CJrbppa39BDPSF7btXAynP1o1
 PMmhEH9a9eZ4XlxP4FxKBGUEXQq7xgivtjZVHMQMnEZ2ml6xDi1VRsVHad7goqYOLT0pDnqIftL
 ZuTI9kFDeYvrYxG4LhclLrVTvhO75rJtoWH+U3reCTB7iZSyni3Mt1mYpt9y8xZ9j7YD9ojz/X7
 oWi0qVFs1mBwhAbl/85FZtcwyyhFboGh4ecEKfGHIHZmomTM3TGxsLmM4pbJrCNsjr80RhwB60s
 BqSjJ8AKZ3KFPOkn5p/6NFJ7uxu+qaEmxXP/aUpBHWP9A==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by
 mx-relay50-hz3.antispameurope.com; Thu, 13 Nov 2025 11:47:21 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net
 [82.135.125.110])
 (Authenticated sender: alexander.stein@ew.tq-group.com)
 by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id
 7250ECC0A1D; Thu, 13 Nov 2025 11:47:14 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Liu Ying <victor.liu@nxp.com>, Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH v2 1/1] drm: lcdif: Use dev_err_probe()
Date: Thu, 13 Nov 2025 11:47:13 +0100
Message-ID: <3410946.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20251020095846.116202-1-alexander.stein@ew.tq-group.com>
References: <20251020095846.116202-1-alexander.stein@ew.tq-group.com>
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
 mx-relay50-hz3.antispameurope.com with 4d6cR73sMNz2nGtR
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1,
 IP=94.100.132.6
X-cloud-security-Digest: 8e80b3bb434ae492471754dc7e2ef656
X-cloud-security: scantime:2.077
DKIM-Signature: a=rsa-sha256;
 bh=cPfvqiPK0XBbGB7jgxZcnmtoFkef5Esy2Ux2OKDfXoY=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1763030840; v=1;
 b=UEz7F2djpKkeEmtUs6PNnNsWWY1EZ/rrg5PCjPtSQdQFf0sPJMUZ0yk8aUy/TMBTDAxSvOnD
 4sWQNQF2oYcYR5GoukiaZ15aWH9By3EyEPLYoTptHWzwsOWSt2BoU6nSTMXOK6OR3LLk4XGC1zq
 z6R5DX72Bh3cFDtV9RtnpWZDwtuTZ6ZAFurSDfGsBKgjlcE3RV9K5cPMV87z9TVRacJukUQMLcx
 toxf+5e1trUGADsmQmzGYx1E+LTeH49YlekETtlCsNusuCOSh21WEdwbtj650paAvSFmPu/moSx
 HRjTGUvkN0oldR6B1w2RsqtOrqMpunHnL4+DFCkjnSZTA==
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

Am Montag, 20. Oktober 2025, 11:58:45 CET schrieb Alexander Stein:
> Use dev_err_probe() to add a reason for deferred probe. This can
> especially happen on lcdif3 which uses hdmi_tx_phy for 'pix' clock
>=20
> Reviewed-by: Liu Ying <victor.liu@nxp.com>
> Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Any other feedback?

Thanks and best regards
Alexander
> ---
> Changes in v2:
> * Collected Liu's and Marcos' R-b
>=20
>  drivers/gpu/drm/mxsfb/lcdif_drv.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lc=
dif_drv.c
> index fcb2a7517377e..47da1d9336b90 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
> @@ -149,15 +149,17 @@ static int lcdif_load(struct drm_device *drm)
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


