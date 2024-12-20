Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CB99F9979
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 19:27:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99ABC10E3A9;
	Fri, 20 Dec 2024 18:27:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD2B810E28C
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 18:27:23 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1tOhiY-0004nC-HA; Fri, 20 Dec 2024 19:27:18 +0100
Message-ID: <a3c162698944d0901efe5b9bcbd1f29304da8b39.camel@pengutronix.de>
Subject: Re: [PATCH v4] drm/etnaviv: add optional reset support
From: Lucas Stach <l.stach@pengutronix.de>
To: LECOINTRE Philippe <philippe.lecointre@thalesgroup.com>, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 "etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, LENAIN Simon
 <simon.lenain@thalesgroup.com>,  BARBEAU Etienne
 <etienne.barbeau@thalesgroup.com>, LEJEUNE Sebastien
 <sebastien.lejeune@thalesgroup.com>
Date: Fri, 20 Dec 2024 19:27:17 +0100
In-Reply-To: <a0b07a6b542d47339584f05c45951b9d@thalesgroup.com>
References: <a0b07a6b542d47339584f05c45951b9d@thalesgroup.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
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

Am Dienstag, dem 17.12.2024 um 11:36 +0000 schrieb LECOINTRE Philippe:
> Add optional reset support which is mentioned in vivante,gc.yaml to
> allow the driver to work on SoCs whose reset signal is asserted by defaul=
t
>=20
Thanks, applied to etnaviv/next.

Regards,
Lucas

> Signed-off-by: Philippe Lecointre <philippe.lecointre@thalesgroup.com>
> Acked-by: Simon Lenain <simon.lenain@thalesgroup.com>
> ---
> v4:
> - Rework to match feedback
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 41 +++++++++++++++++++++++++++
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.h |  2 ++
>  2 files changed, 43 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etna=
viv/etnaviv_gpu.c
> index 2d4c112ce033..cf0d9049bcf1 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -13,6 +13,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regulator/consumer.h>
> +#include <linux/reset.h>
>  #include <linux/thermal.h>
> =20
>  #include "etnaviv_cmdbuf.h"
> @@ -172,6 +173,29 @@ int etnaviv_gpu_get_param(struct etnaviv_gpu *gpu, u=
32 param, u64 *value)
>  	return 0;
>  }
> =20
> +static int etnaviv_gpu_reset_deassert(struct etnaviv_gpu *gpu)
> +{
> +	int ret;
> +
> +	/*
> +	 * 32 core clock cycles (slowest clock) required before deassertion
> +	 * 1 microsecond might match all implementations without computation
> +	 */
> +	usleep_range(1, 2);
> +
> +	ret =3D reset_control_deassert(gpu->rst);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * 128 core clock cycles (slowest clock) required before any activity o=
n AHB
> +	 * 1 microsecond might match all implementations without computation
> +	 */
> +	usleep_range(1, 2);
> +
> +	return 0;
> +}
> +
>  static inline bool etnaviv_is_model_rev(struct etnaviv_gpu *gpu, u32 mod=
el, u32 revision)
>  {
>  	return gpu->identity.model =3D=3D model &&
> @@ -799,6 +823,12 @@ int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
>  		goto pm_put;
>  	}
> =20
> +	ret =3D etnaviv_gpu_reset_deassert(gpu);
> +	if (ret) {
> +		dev_err(gpu->dev, "GPU reset deassert failed\n");
> +		goto fail;
> +	}
> +
>  	etnaviv_hw_identify(gpu);
> =20
>  	if (gpu->identity.model =3D=3D 0) {
> @@ -1860,6 +1890,17 @@ static int etnaviv_gpu_platform_probe(struct platf=
orm_device *pdev)
>  	if (IS_ERR(gpu->mmio))
>  		return PTR_ERR(gpu->mmio);
> =20
> +
> +	/* Get Reset: */
> +	gpu->rst =3D devm_reset_control_get_optional_exclusive(&pdev->dev, NULL=
);
> +	if (IS_ERR(gpu->rst))
> +		return dev_err_probe(dev, PTR_ERR(gpu->rst),
> +				     "failed to get reset\n");
> +
> +	err =3D reset_control_assert(gpu->rst);
> +	if (err)
> +		return dev_err_probe(dev, err, "failed to assert reset\n");
> +
>  	/* Get Interrupt: */
>  	gpu->irq =3D platform_get_irq(pdev, 0);
>  	if (gpu->irq < 0)
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/etna=
viv/etnaviv_gpu.h
> index 4d8a7d48ade3..5cb46c84e03a 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> @@ -93,6 +93,7 @@ struct etnaviv_event {
>  struct etnaviv_cmdbuf_suballoc;
>  struct regulator;
>  struct clk;
> +struct reset_control;
> =20
>  #define ETNA_NR_EVENTS 30
> =20
> @@ -158,6 +159,7 @@ struct etnaviv_gpu {
>  	struct clk *clk_reg;
>  	struct clk *clk_core;
>  	struct clk *clk_shader;
> +	struct reset_control *rst;
> =20
>  	unsigned int freq_scale;
>  	unsigned int fe_waitcycles;

