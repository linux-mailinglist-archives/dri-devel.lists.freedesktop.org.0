Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C56A49680
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 11:10:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E35A410E06E;
	Fri, 28 Feb 2025 10:10:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="DdLQEyKf";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="aSZkHu5t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C8EE10E06E
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 10:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1740737412; x=1772273412;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YE6bnB+P2s7EJv1Gtcomzzk1XsCHf5FrUL6+zsepQYk=;
 b=DdLQEyKf0DOYWB4H3fVeh3/D8GYTeRLYTc2sNaI+/ufOAcDN+UKI7ccG
 YQ3YZFvYlj5j5j7tMz/s9ZOfHq15iZ0NXUxu8pmfVDoGT7Q14DV/zSaMP
 Y2zVFwX0TixKC8nk/0dL+MnnB3ddOn3wMeoupUnRPdPFwHXTRcnfjk4kE
 dzfKb6XcQ8JG5AdUS81wf38nvxcZrNfd6IcJMDMMUYY5tDUSxqzu5lla7
 FlHC6lnUuIGXV72eC8jTNzkPX8BcXHbKakbJUfOIDRGMI57ELHBltO8TO
 7NuW0/QNme1L066ENX42K64bblqwln1exyPpK1wZNm2SgQntfSZKpIQi9 g==;
X-CSE-ConnectionGUID: ndNCYhvjTbuOSgEIVnFkiw==
X-CSE-MsgGUID: +mz72M5PRRe7iLQCZsA0pg==
X-IronPort-AV: E=Sophos;i="6.13,322,1732575600"; d="scan'208";a="42171166"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 28 Feb 2025 11:10:08 +0100
X-CheckPoint: {67C18B80-0-3D6C4912-C3EB4537}
X-MAIL-CPID: 5608D6895C0C0D3CBFCC709C8A1F7455_5
X-Control-Analysis: str=0001.0A002109.67C18B7D.005A, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 82F04168CC3; Fri, 28 Feb 2025 11:10:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1740737403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YE6bnB+P2s7EJv1Gtcomzzk1XsCHf5FrUL6+zsepQYk=;
 b=aSZkHu5tBl4BOPhn0gC5Txm/SbBCY5/5rfv7waBQSlP+aMm8/Um9qsAoVXwaoSUZtOnUyP
 pDaeTg3ofEWR6FfOgnx0shiC3Ri8BdesYNBINYPB4FBuDBJDJqNdrGM3Cn0wv9YooXlD4u
 h33CGkpNjaeK9WGLItWAL4Fc3a1e/31YD5cK3B3pONEoqlV/SPN2jFb7uJ76n0xeRS2ubI
 rgLNhI5OeczxVDpC4uZOSAc372VjNgL9S2XodOeIi/PkxvEOptci76rjnM2LmGada6K0+S
 SXtWqzD16qzwth9UCSg1zpac/U6Il/LxEV5jXqyyLbP+92xq7XupA80hhp2mmA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marex@denx.de>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Steven Price <steven.price@arm.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 5/9] drm/panthor: Implement support for multiple power
 domains
Date: Fri, 28 Feb 2025 11:10:02 +0100
Message-ID: <2848587.BEx9A2HvPv@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250227170012.124768-6-marex@denx.de>
References: <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-6-marex@denx.de>
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

Am Donnerstag, 27. Februar 2025, 17:58:05 CET schrieb Marek Vasut:
> The driver code power domain binding to driver instances only works
> for single power domain, in case there are multiple power domains,
> it is necessary to explicitly attach via dev_pm_domain_attach*().
> As DT bindings list support for up to 5 power domains, add support
> for attaching them all. This is useful on Freescale i.MX95 which
> does have two power domains.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  drivers/gpu/drm/panthor/panthor_device.c | 56 ++++++++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_device.h |  5 +++
>  2 files changed, 61 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/p=
anthor/panthor_device.c
> index 51ee9cae94504..4348b7e917b64 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -75,6 +75,58 @@ static int panthor_reset_init(struct panthor_device *p=
tdev)
>  	return 0;
>  }
> =20
> +/* Generic power domain handling code, see drivers/gpu/drm/tiny/simpledr=
m.c */
> +static void panthor_detach_genpd(void *res)
> +{
> +	struct panthor_device *ptdev =3D res;
> +	int i;
> +
> +	if (ptdev->pwr_dom_count <=3D 1)
> +		return;
> +
> +	for (i =3D ptdev->pwr_dom_count - 1; i >=3D 0; i--)
> +		dev_pm_domain_detach(ptdev->pwr_dom_devs[i], true);
> +}
> +
> +static int panthor_genpd_init(struct panthor_device *ptdev)
> +{
> +	struct device *dev =3D ptdev->base.dev;
> +	int i, ret;
> +
> +	ptdev->pwr_dom_count =3D of_count_phandle_with_args(dev->of_node, "powe=
r-domains",
> +							  "#power-domain-cells");
> +	/*
> +	 * Single power-domain devices are handled by driver core nothing to do
> +	 * here. The same for device nodes without "power-domains" property.
> +	 */
> +	if (ptdev->pwr_dom_count <=3D 1)
> +		return 0;
> +
> +	if (ptdev->pwr_dom_count > ARRAY_SIZE(ptdev->pwr_dom_devs)) {
> +		drm_warn(&ptdev->base, "Too many power domains (%d) for this device\n",
> +			 ptdev->pwr_dom_count);
> +		return -EINVAL;
> +	}
> +
> +	for (i =3D 0; i < ptdev->pwr_dom_count; i++) {
> +		ptdev->pwr_dom_devs[i] =3D dev_pm_domain_attach_by_id(dev, i);
> +		if (!IS_ERR(ptdev->pwr_dom_devs[i]))
> +			continue;
> +
> +		ret =3D PTR_ERR(ptdev->pwr_dom_devs[i]);
> +		if (ret !=3D -EPROBE_DEFER) {
> +			drm_warn(&ptdev->base, "pm_domain_attach_by_id(%u) failed: %d\n", i, =
ret);
> +			continue;

Is it a good idea to continue if a power-domain is missing? Any access might
stuck completely. IMHO returning an error is more sensible.
Also some dev_err_probe() should be added here.

Best regards
Alexander

> +		}
> +
> +		/* Missing dependency, try again. */
> +		panthor_detach_genpd(ptdev);
> +		return ret;
> +	}
> +
> +	return devm_add_action_or_reset(dev, panthor_detach_genpd, ptdev);
> +}
> +
>  void panthor_device_unplug(struct panthor_device *ptdev)
>  {
>  	/* This function can be called from two different path: the reset work
> @@ -232,6 +284,10 @@ int panthor_device_init(struct panthor_device *ptdev)
>  	if (ret)
>  		return ret;
> =20
> +	ret =3D panthor_genpd_init(ptdev);
> +	if (ret)
> +		return ret;
> +
>  	ret =3D panthor_devfreq_init(ptdev);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/p=
anthor/panthor_device.h
> index fea3a05778e2e..7fb65447253e9 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -114,6 +114,11 @@ struct panthor_device {
>  	/** @resets: GPU reset. */
>  	struct reset_control *resets;
> =20
> +	/** @pwr_dom_count: Power domain count */
> +	int pwr_dom_count;
> +	/** @pwr_dom_dev: Power domain devices */
> +	struct device *pwr_dom_devs[5];
> +
>  	/** @coherent: True if the CPU/GPU are memory coherent. */
>  	bool coherent;
> =20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


