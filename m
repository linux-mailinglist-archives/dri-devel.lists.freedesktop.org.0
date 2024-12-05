Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D42389E5C54
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 17:58:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C6F210EF15;
	Thu,  5 Dec 2024 16:58:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5BD710E10B
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 16:57:58 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1tJFAp-0005dz-GO; Thu, 05 Dec 2024 17:57:55 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e]
 helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1tJFAo-001r8T-11;
 Thu, 05 Dec 2024 17:57:55 +0100
Received: from pza by lupine with local (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1tJFAp-000BbY-01;
 Thu, 05 Dec 2024 17:57:55 +0100
Message-ID: <737b2631320dad9dea71eb786a521d7a1d2100c5.camel@pengutronix.de>
Subject: Re: [PATCH v2] drm/etnaviv: add optional reset support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: LECOINTRE Philippe <philippe.lecointre@thalesgroup.com>, Lucas Stach
 <l.stach@pengutronix.de>, Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 "etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, LENAIN Simon
 <simon.lenain@thalesgroup.com>,  BARBEAU Etienne
 <etienne.barbeau@thalesgroup.com>, LEJEUNE Sebastien
 <sebastien.lejeune@thalesgroup.com>
Date: Thu, 05 Dec 2024 17:57:54 +0100
In-Reply-To: <dc139d10a4184d289c9ffd1d308c0db1@thalesgroup.com>
References: <dc139d10a4184d289c9ffd1d308c0db1@thalesgroup.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

On Fr, 2024-11-08 at 14:00 +0000, LECOINTRE Philippe wrote:
> Add optional reset support which is mentioned in vivante,gc.yaml to
> allow the driver to work on SoCs whose reset signal is asserted by defaul=
t
> Avoid enabling the interrupt until everything is ready
>=20
> Signed-off-by: Philippe Lecointre <philippe.lecointre@thalesgroup.com>
> Reviewed-by: Simon Lenain <simon.lenain@thalesgroup.com>
> ---
> v2:
> - Add missing include of irq.h
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 30 +++++++++++++++++++++++++++
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.h |  2 ++
>  2 files changed, 32 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etna=
viv/etnaviv_gpu.c
> index 7c7f97793ddd..3e0c5dd9f74b 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
>   * Copyright (C) 2015-2018 Etnaviv Project
> + * Copyright (C) 2024 Thales
>   */
> =20
>  #include <linux/clk.h>
> @@ -8,11 +9,13 @@
>  #include <linux/delay.h>
>  #include <linux/dma-fence.h>
>  #include <linux/dma-mapping.h>
> +#include <linux/irq.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regulator/consumer.h>
> +#include <linux/reset.h>
>  #include <linux/thermal.h>
> =20
>  #include "etnaviv_cmdbuf.h"
> @@ -1629,8 +1632,24 @@ static int etnaviv_gpu_clk_enable(struct etnaviv_g=
pu *gpu)
>  	if (ret)
>  		goto disable_clk_core;
> =20
> +	/* 32 core clock cycles (slowest clock) required before deassertion. */
> +	/* 1 microsecond might match all implementations */
> +	usleep_range(1, 2);
> +
> +	ret =3D reset_control_deassert(gpu->rst);
> +	if (ret)
> +		goto disable_clk_shader;
> +
> +	/* 128 core clock cycles (slowest clock) required before any activity o=
n AHB. */
> +	/* 1 microsecond might match all implementations */
> +	usleep_range(1, 2);
> +
> +	enable_irq(gpu->irq);
> +
>  	return 0;
> =20
> +disable_clk_shader:
> +	clk_disable_unprepare(gpu->clk_shader);
>  disable_clk_core:
>  	clk_disable_unprepare(gpu->clk_core);
>  disable_clk_bus:
> @@ -1643,6 +1662,8 @@ static int etnaviv_gpu_clk_enable(struct etnaviv_gp=
u *gpu)
> =20
>  static int etnaviv_gpu_clk_disable(struct etnaviv_gpu *gpu)
>  {
> +	disable_irq(gpu->irq);
> +	reset_control_assert(gpu->rst);
>  	clk_disable_unprepare(gpu->clk_shader);
>  	clk_disable_unprepare(gpu->clk_core);
>  	clk_disable_unprepare(gpu->clk_bus);
> @@ -1876,6 +1897,9 @@ static int etnaviv_gpu_platform_probe(struct platfo=
rm_device *pdev)
>  	if (gpu->irq < 0)
>  		return gpu->irq;
> =20
> +	/* Avoid enabling the interrupt until everything is ready */
> +	irq_set_status_flags(gpu->irq, IRQ_NOAUTOEN);
> +
>  	err =3D devm_request_irq(&pdev->dev, gpu->irq, irq_handler, 0,
>  			       dev_name(gpu->dev), gpu);
>  	if (err) {
> @@ -1883,6 +1907,12 @@ static int etnaviv_gpu_platform_probe(struct platf=
orm_device *pdev)
>  		return err;
>  	}
> =20
> +	/* Get Reset: */
> +	gpu->rst =3D devm_reset_control_get_optional(&pdev->dev, NULL);

Please use devm_reset_control_get_optional_exclusive() directly.

regards
Philipp
