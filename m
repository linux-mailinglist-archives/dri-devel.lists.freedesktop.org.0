Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 043E2817ACF
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 20:16:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16DFD10E279;
	Mon, 18 Dec 2023 19:16:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF1CE10E3AE
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 19:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1702926930; x=1734462930;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=W4RQmvsJRShbyg0yBw1LI7RK35V1/P7+WCpbSa+cNFk=;
 b=iodETt3EsYFEskZgDGQ3iQGllqTQpIlV5LidTDu597T62igReKzZHofx
 C9jKI0BGhl6AGhFGmIH1mB9HI+23jqzr//MCTWFQb/T58JgnnDnromMul
 NjZFON/LCtV/avFEL1DaPTJWA+/rT2K2U8IcG1aUpgeaEwAkXjcBl+qct
 CsQVnmkfipNebJAsW8qpeDGnSMfPuVoirOMK/nv8S4qFM+him7LU6EfOQ
 se5koTKIbvJHpAzLsD4l5fK9Pg/cAkPGEbRnG9efvz3yrh1/FIrl3ed0N
 SMIW7m1m9JkNXF/6rtpYdDDUbwz6RNFk0OZqYBLTmryz4jp6T+jTtjIJQ g==;
X-IronPort-AV: E=Sophos;i="6.04,285,1695679200"; d="scan'208";a="34561388"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 18 Dec 2023 13:03:10 +0100
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 2A88C280075;
 Mon, 18 Dec 2023 13:03:10 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 5/6] drm/bridge: dpu-dprc: Use dev_err_probe
Date: Mon, 18 Dec 2023 13:03:12 +0100
Message-ID: <6003334.lOV4Wx5bFT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20231218105718.2445136-6-alexander.stein@ew.tq-group.com>
References: <20231218105718.2445136-1-alexander.stein@ew.tq-group.com>
 <20231218105718.2445136-6-alexander.stein@ew.tq-group.com>
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
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Montag, 18. Dezember 2023, 11:57:17 CET schrieb Alexander Stein:
> This simplifies the code and gives additional information upon deferral.

Please ignore. I just noticed this file is added in a locally applied serie=
s.

Thanks
Alexander

> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  drivers/gpu/drm/imx/dpu/dpu-dprc.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/imx/dpu/dpu-dprc.c
> b/drivers/gpu/drm/imx/dpu/dpu-dprc.c index 261c9566721e..6467ad960080
> 100644
> --- a/drivers/gpu/drm/imx/dpu/dpu-dprc.c
> +++ b/drivers/gpu/drm/imx/dpu/dpu-dprc.c
> @@ -612,7 +612,8 @@ static int dpu_dprc_probe(struct platform_device *pde=
v)
>=20
>  		dprc->prgs[i] =3D dpu_prg_lookup_by_phandle(dev, "fsl,prgs",=20
i);
>  		if (!dprc->prgs[i])
> -			return -EPROBE_DEFER;
> +			return dev_err_probe(dev, -EPROBE_DEFER,
> +					     "Failed to lookup=20
fsl,prgs\n");
>=20
>  		if (i =3D=3D 1)
>  			dpu_prg_set_auxiliary(dprc->prgs[i]);
> @@ -623,11 +624,10 @@ static int dpu_dprc_probe(struct platform_device
> *pdev)
>=20
>  	ret =3D devm_request_irq(dev, wrap_irq, dpu_dprc_wrap_irq_handler,
>  			       IRQF_SHARED, dev_name(dev), dprc);
> -	if (ret < 0) {
> -		dev_err(dev, "failed to request dpr_wrap irq(%u): %d\n",
> -			wrap_irq, ret);
> -		return ret;
> -	}
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret,
> +				     "failed to request dpr_wrap=20
irq(%u)\n",
> +				     wrap_irq);
>=20
>  	platform_set_drvdata(pdev, dprc);


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


